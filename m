Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398FC606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1BvYwSJU;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZoEF7GAp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Gy+owdWhI9aq49SvOXumwy6C5wawdvH/TU7Zgbh6cFQ=; b=1BvYwSJU7xlmJo8P20919JDUHU
	l78fbUvUyaY1sTkrJEjsX3856ET/Q2zZzlp4Fdt2tmEr9GRAUCh1VsGHhhA3IcjmQbAZoKlCF2seY
	DeVuRXWWslCmjgJX6RqXyLik4rX0D7SemzVlloes91Fz+xiXgJMVB1kZV3BOa2gmK4K/z/NE2AQ+v
	fauVRwVKMGs1qYi//JRm1GJmVTerfozy9APLI7zh+qN7yqktcUCqt7RhoMd0gn/g3A1p8AeKLDxrc
	7Ow92y9tgcgS0NSMKK+qb2xxSVh2YbxSC2NE4IWhf1k86hlrfrfmw8gvCAo0eOlR42Js1+7EEWh+D
	Q5d4BaQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknU-00000003n8M-0KpU;
	Tue, 10 Nov 2026 12:17:56 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknI-00000003mvP-2wa4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:46 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-490ab0a20ebso1546122f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313062; x=1794917862; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gy+owdWhI9aq49SvOXumwy6C5wawdvH/TU7Zgbh6cFQ=;
        b=ZoEF7GApyFNrkkrVD5sQvSnLYC+ExxuFctL4QY6knuYEM7Pev96eK/c4+Te7cEd5ch
         IX9nqXVTYvzRQnPnXlNatp5LC3IPrxDrjLYW4R+sBALAZwSqzwruSmVwCH6bgW+n7d4t
         v7XIn+SjQLZWR2a4kIwmmORwenv35IXqxy2t0TUszb0MyUDBjO4haA1gxu7kYol+keys
         5oyHJHU1Pmnq/Q/sqZpi95TOMN0Y7GJ2L99oNkkmrWMuCfVRprl8isvO8nSDHCpblT4P
         KEvCyKd5hjxvusbJda2ydBLIMFFIp259IRX+FvzgIDIwJ1lNBBq55/YhmPhH/buInVa5
         oIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313062; x=1794917862;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gy+owdWhI9aq49SvOXumwy6C5wawdvH/TU7Zgbh6cFQ=;
        b=MHaR6+yROCJJGmV4wPanhduVqadxpO8AwCyhiLTF4WCXG7xknCQKQclohOX595HHRZ
         6ELJNqFKLcmNESBZpnLmaLAOHrJRzijFCLc0YFWT6RxJH90aWxGEXFIlx0m6QLpelxNt
         2A18Y5lSqEOi+cyFJapLE6A+eClh0wCf6g+2dpbVO2oXaj0iUcjr32OW6jJ9VxJSAw2E
         nmKhIHTs4+BhkZ4Zjv7ITOAPFOCfS8bTxztGfruIg0sfUrJapav9K1Lr16ZJ8NDL/cq6
         VuSAezOQ3760mu9X2ifBo38Px3wtts37vlrU3XNwj8i6TcQplRm2Qn/v5741BS5YvL9I
         p5AQ==
X-Gm-Message-State: APuU4Z/t76h3G/3ipktOqhAfFt/d72wrIwZTxzQ+TgbzH8Ylp7J9n+Cq
	19IO4wOyah6s0em34G9pEC9FHzFSuS6InaJtu6HSx0yn8XG9kJ2tDt51uiw0/KHTTXuU/RPrHA=
	=
X-Received: from wrxp4.prod.google.com ([2002:a05:6000:184:b0:495:feb9:bf43])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:298d:20b0:48e:202:6718
 with SMTP id ffacd0b85a97d-4982ecf6701mr3321662f8f.25.1794313062387; Tue, 10
 Nov 2026 04:17:42 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:35 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-15-ardb+git@google.com>
Subject: [PATCH v2 03/10] efi/libstub: Avoid _end section marker in library code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041744_887304_40092DC3 
X-CRM114-Status: GOOD (  15.05  )
X-Spam-Score: -9.5 (---------)
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
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

The _end marker could point to the end of the kernel image being loaded,
or to the _end of the zboot decompressor image, and so it should only be
used in code that is obviously only intended for the former case.

So instead, use kernel_memsize and the image address to obtain the same
quantity.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/kaslr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
index 8f8dc335b3b3..b34e4599f0f6 100644
--- a/drivers/firmware/efi/libstub/kaslr.c
+++ b/drivers/firmware/efi/libstub/kaslr.c
@@ -125,7 +125,7 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 		if (!check_image_region(*image_addr, kernel_memsize)) {
 			efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
 		} else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
-			   (unsigned long)_end < EFI_ALLOC_LIMIT) {
+			   (*image_addr + kernel_memsize) < EFI_ALLOC_LIMIT) {
 			/*
 			 * Just execute from wherever we were loaded by the
 			 * UEFI PE/COFF loader if the placement is suitable.
-- 
2.56.0.542.g3ef89b7020-goog


