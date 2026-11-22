Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F81F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o0XLi7g4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JMy6facl;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b+TqQZKM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BkLWabiVP2N6o8/3oJvFuhS7Z3IRmMXaOcCIdqoyE3U=; b=o0XLi7g4ziJgYLLwdkKsHIg/kB
	0Embiw/SWu+Md+v3D0okPUdfByidPWZZb+2RcHgbGnyEbWR11dZn4FqU0W6B42XcLLyh+6cZZY+si
	B04t3TrGrvhGUCVtnrFC4OH9s+Is9h0DVx7mDuizDZQMonAaIU1uV6cg3UqOT1SP/zxDGUkoNZKsI
	MqXGqtW02dgzX1mypYqc7FaQ1ZLL0JjwTWWQBOvjWND6i8hjisVrYp5dHUx2SpTs/bZWb6/zgnDBD
	fP2o+bigeDQ79y57G8ZhULHPryI3EfqRnAx6HCjhR6yRj+uwvYwuurDvESgx/+MQRP304Ad/RNFAx
	K5aWXZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ4-00000001Ygl-3Ho2;
	Sun, 22 Nov 2026 18:45:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYt-00000001YUj-1WnB
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BkLWabiVP2N6o8/3oJvFuhS7Z3IRmMXaOcCIdqoyE3U=; b=JMy6faclMwBrG0sh1JgeMQukOJ
	lTAgc0L/0lZ+EAAdT2fXxtfH0lJ6o5gFF0QJdMZUXdArhOEJLGzpBEH24BqwEZ95B0GBalv5GO0EH
	NXtAMPOonqFwFBdU21IUtHaL6jn5aSoXw3x2syX4yzSIJz2dQJYQTtn/1CM3M6ySHmA2hbHl3cGD/
	p5UukRg3HsNxFPI7yJ4a/yGK7jMoKpSNq3gGAuoXDuTd8wX959M7G5LY4Bqlt0HmYXUMCOkUhcQv2
	iXArjhzUZDpoGwKUfX4YpdXFSq4geIjkFtXWnqK0kAWhhvr9n45gNt7CA7xtt9i5tAPKcnJQ97U37
	x8EsxLPA==;
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYq-00000002REI-47E5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:14 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so2066550a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373110; x=1795977910; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkLWabiVP2N6o8/3oJvFuhS7Z3IRmMXaOcCIdqoyE3U=;
        b=b+TqQZKMQ+Xo5onsll1dXCMfl0HwhRUMzwnOk5a6jZGwb0Nh71I9BNyzyOYreZ+a7z
         Gef5w3NVgV0GSodudewWLw3SxuxXsytxm8OeowMWMlEvhPDYYBq5ZeMb3iLAJm0r49+h
         1f55kXxpwXxdwaS2RpHqU9YjQFIFj/vc/4tUye0Uaw+SrBRqgJUVEXxV4MFW2bT2zXXE
         6lMUftPAWYcvo3jXxd5wh/8KFMOU38dBA10vPlcswZdHWqrwesawfJB9EP/YVyyFlSps
         Jao5sDhhtpU3jSpfKTSm2K6wxixIQaPU12UIHGvwlG0GtlJwgSIdkEKllUBUpbxm3A7Z
         w1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373110; x=1795977910;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkLWabiVP2N6o8/3oJvFuhS7Z3IRmMXaOcCIdqoyE3U=;
        b=0mcarVea6pJzTv5/SnzN6xc+hXAk3PvTQhOZul5zmwBqet0PKF7ivkUfONVt5QssnX
         BpDn52HJ8IALMZ4/ujmFhw/FSX2DYQBUAVSODzdQ7AXGkPnZYrwyB2A+joCeB3Sh6HTZ
         fQAKJrBrrlj7mJQXozrybxBXM16uxwObXoA2JXGPRS4NHoiB6cI2kgIC6g6b/NIVV0PB
         ZmuRQxjQuUH37nRYOItZRjP3K5VG1JEqBVKOOK9yd+Ytdubb7XnJotrdjQ7Ir8GASADd
         wpJVAevQ/mbOlNPr74L4H6bBpFOm+iiAthxwnvH4FOR5NnHFUjYca6NpYmt8L5y6vi/G
         jajg==
X-Forwarded-Encrypted: i=1; AL+hErFds23RmuugasQf5f/tsKIvxC4CRpYK3hmCvaqbptP1nD6X03KJaRygdny37EcDEtsOwuqlFyuw7InNr4f/4YOD@lists.infradead.org
X-Gm-Message-State: APuU4Z+uOvuBqQJQAE0bVtQ5WWwI5py5vWeKkgwbGtWbl8neW/YzRd0e
	BKNk312aByeIKTcxKyOiN5YDStZ9L5gWpeRpq7Dp3XAViOw5vLiCAsw5KN3lhdow3ShI42e6L+L
	0UtEXIab31lxm7h5AVD9kDg==
X-Received: from pjvh9.prod.google.com ([2002:a17:90a:db89:b0:3b4:1549:36a6])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4d10:b0:3b1:b66a:c05 with SMTP id 98e67ed59e1d1-3b41c8e0c5dmr7640072a91.14.1795373110066;
 Sun, 22 Nov 2026 10:45:10 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:45 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-12-jthoughton@google.com>
Subject: [PATCH v3 11/19] arm64/mm: Align vmemmap to maximal folio size
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_184512_962120_DB063B4F 
X-CRM114-Status: GOOD (  15.43  )
X-Spam-Score: -7.6 (-------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CONFIG_VMEMMAP_OPTIMIZATION, compound_head() derives a tail page's
head by masking its address. This requires the head struct page of every
folio to be naturally aligned to the folio's vmemmap size, up to
MAX_FOLIO_VMEMMAP_ALIGN.

On arm64, the vmemmap is offset by memstart_addr, which is only aligned
to ARM64_MEMSTART_ALIGN: as little as 512M with 64K pages, where 16G
CONT_PMD hugetlb folios exist. VMEMMAP_START itself is sufficiently
aligned for all supported page sizes and VA sizes.

Raise ARM64_MEMSTART_ALIGN to cover MAX_FOLIO_VMEMMAP_ALIGN, and assert
at build time that VMEMMAP_START is suitably aligned. This is a no-op
until arm64 enables HVO, which selects CONFIG_VMEMMAP_OPTIMIZATION.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/mm/init.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 4e7682dfe366..7186d86afc41 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -35,6 +35,7 @@
 #include <linux/kmemleak.h>
 #include <linux/execmem.h>
 #include <linux/arm-rsi-cmds.h>
+#include <linux/vmemmap-optimization.h>
 
 
 #include <asm/boot.h>
@@ -92,11 +93,22 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
  * in the virtual address space.
  */
 #if ARM64_MEMSTART_SHIFT < SECTION_SIZE_BITS
-#define ARM64_MEMSTART_ALIGN	(1UL << SECTION_SIZE_BITS)
+#define ARM64_MEMSTART_BASE_ALIGN	(1UL << SECTION_SIZE_BITS)
 #else
-#define ARM64_MEMSTART_ALIGN	(1UL << ARM64_MEMSTART_SHIFT)
+#define ARM64_MEMSTART_BASE_ALIGN	(1UL << ARM64_MEMSTART_SHIFT)
 #endif
 
+/*
+ * With CONFIG_VMEMMAP_OPTIMIZATION, compound_head() masks the address of a
+ * tail page to find its head, so the head struct page of every folio must be
+ * naturally aligned to the folio's vmemmap size. The vmemmap is offset by
+ * memstart_addr, so memstart_addr must be aligned to the largest folio size.
+ */
+#define ARM64_VMEMMAP_OPT_ALIGN						\
+	PFN_PHYS(MAX_FOLIO_VMEMMAP_ALIGN / sizeof(struct page))
+#define ARM64_MEMSTART_ALIGN						\
+	max_t(phys_addr_t, ARM64_MEMSTART_BASE_ALIGN, ARM64_VMEMMAP_OPT_ALIGN)
+
 static void __init arch_reserve_crashkernel(void)
 {
 	unsigned long long crash_base, crash_size, cma_size = 0;
@@ -218,6 +230,8 @@ void __init arm64_memblock_init(void)
 	/*
 	 * Select a suitable value for the base of physical memory.
 	 */
+	BUILD_BUG_ON(MAX_FOLIO_VMEMMAP_ALIGN &&
+		     !IS_ALIGNED(VMEMMAP_START, MAX_FOLIO_VMEMMAP_ALIGN));
 	memstart_addr = round_down(memblock_start_of_DRAM(),
 				   ARM64_MEMSTART_ALIGN);
 
-- 
2.56.1.809.ga0b61035b5-goog


