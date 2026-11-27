Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC65606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KtrfQkwm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pQENY8yA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ngg1FtP8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PVjCV5oykzsIMcgSWFAsGQFYmzyPz2B20ED1sYdHTJ8=; b=KtrfQkwm3ISfMf
	EzccK4RiDKs3GrVjXle7xMBV3Rbhuqw/G29gjwogoSe6FmJdzKnPri38diIriKj+TUBnLqNZqC4LN
	R4cxPnAdbMvxZ6ODR2L7CIs+N4wp0VzzJ/rfuwKQJcWoMH+Nt18M/1cWer0MHMgcQCBBRaOQD+1PT
	XJGxHx0FTWC4/aUcAkNseimBx1bycqJ6vfzBxYYHxsOzeuv6GLVkwrPxZxpKkDMO2H/dr1g1xZbKN
	IEiEBbj2rBZCkND3jt/dJoqED6HJm9Feh5i9vy/+xA/b/K5o+p+LQPQENKB3+QGMtrkTTlJXhRUOs
	g6GWXQF/WiejBF8OoY1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrwr-0000000FMn6-00OK;
	Fri, 27 Nov 2026 09:08:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrwo-0000000FMkb-37yb
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 09:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PVjCV5oykzsIMcgSWFAsGQFYmzyPz2B20ED1sYdHTJ8=; b=pQENY8yAltlZWa2OFI8RHjM95V
	T0jMhXEpyglkXdvdSgZQhgRdtMp3COSbenR2Lg27XBniL385pTxWiYuOUUUqQWZN//znd9TviUTh+
	KoxYrvfURoSEaqmKA0rqjcLxUDkXVcYeebz4rs0EVDRl5Q5leGDjPcKIcsyiuQJJtRTbJBjo6yZNx
	rVaf7sdzPSs7TmuCDW/9N6iVP9Zvzhj0QRIw3Oi8RrdU3ePxa8luDmja3tevQrGwTiDzZ1xdtlA2G
	zmc3i9FI7QZX+TTwC3on5v8TQODqHEJDUO4LxgrRPY7UzUjFrIcfykz5W85GZjdX63EyXCdXa5+d8
	Hfl3EBlA==;
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrwm-00000007UYD-0zry
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:08:49 +0000
Received: by mail-pj2-x05.google.com with SMTP id d9443c01a7336-2f06c2c371aso21136545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770526; x=1796375326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVjCV5oykzsIMcgSWFAsGQFYmzyPz2B20ED1sYdHTJ8=;
        b=Ngg1FtP89fZB7ore7M3Q+4tYUN1BZq+7yUQKL5ZLQhr0xGQzynKuQVL+jcJ/NXX5PP
         R+Iv65wH8YWVxSaA2fHD5U4ITvBj1fXXRw7CSwL89nsm+DSPW5U7/3NX0kiedTPUkdAY
         QKSunwSB6XbGijJybHFvoqp5q9MtfEjNjpYrRNi07xgWeZSbgn+KyHzRTyFeiNd9OzXd
         p0RpX+RdazfPGKb/PGaNnHXgHcpL9ASEHXwRUlPO3NUTizjpbOBYdtYPsirvey03ZU37
         DvdjPJgOyGpLKwYQQyAyOlttzON7GbOhbuiWXZn973vlxgH3ZaSMM2a2/+SMB38eK+/U
         eNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770526; x=1796375326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVjCV5oykzsIMcgSWFAsGQFYmzyPz2B20ED1sYdHTJ8=;
        b=AyM/ldNBavyfmZRjFMWLcsmd0NqB3a3QU29kjTUBL0XaUey2dVkB23MlsKT8dY14rY
         5DW+0OEXYWR/5X65d7IS63t1JU+LLHwIB0MzbRbbofmJAwQ2NQ8sgRLSnwJjOsn9O+Zg
         KaBug08LyNNyCfrKUWlo4X59xqVTQb1dw8aRhiN8iXuOQOuTj2OT50Z1usl2bRzyonYM
         C3klEupuB1ywfYMJps8TStn/wQ0qHi/nqgQYhQkYmSXCP0bVvU8p7pRbtTHjVRJN+eXT
         FW4Neem4IdXJJYgj4gbq52EfL4UydSrCM7v1+aTmOOx5mB8J8Am3xaN5YftYIwr+ouXj
         UDHQ==
X-Forwarded-Encrypted: i=1; AL+hErGx+MlXoO8Avl1yJ/Firtkz6bCUzxNhRwhAf9sm/cewpekbREGQDKqtrgqXsR0YYl1ZKMxOgbPxBFFmtRXfflqy@lists.infradead.org
X-Gm-Message-State: APuU4Z/73f+Y9zAUjhe907xxH43T4t/EYxHb5ABBFbSRL6686d/TIXWW
	NDp1m+bmf00FgbllIGNp6eZNj/y4NCqpV0frA5C/g9aP+RP5KGJPhvTM
X-Gm-Gg: AZFdTZeBu7i+Yc1dZCb5QnLhvReDhCdGOIj9qftkYBi+UYfsWEsulDQk5ODiC9WSYYF
	8LLP+CkjTSvS3AinWlMr6xBM1G9xRZeSJvOqHrnHODFUAvJ5e1cgGGztCwUgDQjRfbuphZfmK3g
	XvBZql2QwsQcOP7vbncCg5H5FFfta54yIEqousPbXya1vzgIPZB9dc57Doot0mH/rxBQHqoEnSk
	UVWIOqlFG2+6qaTfTvFV6A2+Fp02OCx44FQmaYtEU81oaUAFo58VOoRayyMk0R1WpOLCW5jxa0W
	fF85EJcMYj3UzIq1JF9xVFcGW6o9BWWC9lPASYVKTfnaRGHu3B/W7lgyX8Tv6Rmw9yTl+TbDo2Z
	jMPFH6pmzHRDS2ZCS2gxxsbc9sUZrfEZOitrVrvzevfxKgVTPirdXVRWAFBsbKV2VaYL6Kkeu12
	rl0c0sGsof+41IcCjHw9o9urIMreB5YMfYCOUYh8+W76aoBLhhL0hBH36B4YY1vFl9vWRAqHbHb
	a9KHyBWrtTpvm9B6SVtVwi2TO/pJgnOjL0cKMTKxL9TlvYqHx6jO9EMMjeFof9YJ3bsaUCvk/Eh
	d6jtmH22XAGqBbl0zsR1/+UXcmgnODuYiV4+7HKgUA==
X-Received: by 2002:a05:6a21:8982:b0:3e2:4350:1528 with SMTP id adf61e73a8af0-4014a274c36mr23147815637.7.1795770525740;
        Fri, 27 Nov 2026 01:08:45 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:45 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Fri, 27 Nov 2026 17:07:20 +0800
Message-ID: <20261127090723.741253-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_090848_199102_4A7C09E2 
X-CRM114-Status: GOOD (  14.79  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wandun Chen <chenwandun@lixiang.com>

Add MEMBLOCK_NODUMP to mark regions that should be excluded from
kdump vmcores.

The flag is meant for reserved memory that carries no data useful for
crash analysis. Reusable reserved regions such as CMA may hold useful
data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
patches wire this up for /reserved-memory entries.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 40e6e0aa2f8d..67dbcfda6f49 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
  * know is good to use. It is the only memory that allocations may happen from
  * in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
+ * for crash analysis (e.g. firmware carveouts).
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_NOPRSRV	= 0x40,	/* memory with no KHO preservations */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
 };
 
 /**
@@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_noprsrv(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size);
+int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 
@@ -305,6 +309,11 @@ static inline bool memblock_is_kho_noprsrv(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_NOPRSRV;
 }
 
+static inline bool memblock_is_nodump(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_NODUMP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index 0f466fcfc719..e3ee7f60ec97 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1221,6 +1221,21 @@ __init int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_NOPRSRV);
 }
 
+/**
+ * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Mark the region as not to be included in crash dumps.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_NODUMP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2864,6 +2879,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0


