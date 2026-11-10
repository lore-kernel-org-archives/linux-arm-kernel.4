Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8C4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FUOUXXP7;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ofy7VUOD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vWyWnC7FTB1F4LSiq4vWzvhtzfzrYrtPmxSukIMBSxY=; b=FUOUXXP7uPRZHQ/sx3jf1yvz/e
	2ESNqoUBCbGiknf1ela4buA5yfJBjl0CNJOl5DeIxqY5Sa54JLW8gvoGncswEg3hJ6aB43dWndID8
	gRJLUg/G6hQHa2tj77cNIEGFtc5zhjT5qrhVI9tezzsJ9Hz9JFs4JpShQU2uoEF6NOdVs1HZz/uyW
	mElIch3cOiO+GERtPbSZ8aZ9EOeeVd7wdXTtHtR7/vfEkAmb4180AAKmpqOzsY3yCTrdiKe4hw5EA
	ojLGzwO+Exhb1VVrduoYO9nm0WDyzSnhq0QQzQb8bwDBMrtGA1sSvSMSZW4fA1pGB32ZjD1wS4FI7
	slzDK2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknd-00000003nI1-01Cr;
	Tue, 10 Nov 2026 12:18:05 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknM-00000003myI-2I7m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:49 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4a2065a2ef9so15415315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313066; x=1794917866; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWyWnC7FTB1F4LSiq4vWzvhtzfzrYrtPmxSukIMBSxY=;
        b=ofy7VUODI8l+fDO0S4qVHS9VNrtEq4TFa3yvfxypKXmWimHJSp/G1r2QtW1UtgthCy
         3RHV7R/NheBnPkrXnv068n4u44P4xzLcAQ1sjU+h4D//SddCxeVqlT4H9O3PVksQn6fM
         1l156dMrS/hEd+YrZiSusVb9WHFeSDcYGH94wOswFIf09JBCHYGLTH/iQuHw/AvqMMPb
         9k79dOdyurT2vZJuG0EIEyBlGwUiw4rmKHHQKqzkYFsudt2OGpHJ/QVrvupx2cw5q7uf
         hXC5KAm7sSMQtUyGlTRRHhr20VJJOjXB1wjBaNS5uJYVEDHOp+XiXtZEEwQjd4PhfPJ7
         HVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313066; x=1794917866;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWyWnC7FTB1F4LSiq4vWzvhtzfzrYrtPmxSukIMBSxY=;
        b=tJF6jpRIjyorjGR2hMe4rbl05XY3j1Ok+bxriHAbtEDheTVL3Ki//55KDiScyims2l
         BdDSuwpDlPmmmvNZ1A9enHvK+dc8w/FqsZKlMpm82SDafvRTml3z3nUhSJ9fzaPyb5oi
         TbIm45oB/f0k2FkGi1SUlKertTs84cztSaueKaRnvBOhdZLtDtIlcOhMTSBvYDkEb36e
         HvKhA8Ti86pleX7nLnkMlgBsxTAWRRiL0qDAv9LpGGcRC+gSeQAtcIde+rtClxsPoTPK
         iXfT5i1KVAKRuVMR21QJ7c43bZ7TVXOvR+XBm6P2+Hl9ZJ4leodBm+bJPqwhPeu+gK4a
         9MeA==
X-Gm-Message-State: APuU4Z+SLoYt35uJfeopSH1DlIxYu57DfR+LdkMdkRL+9drKQ6OCFp+t
	1YPupxRRudFxiilN4240Ku9Z5cJg5WEbCZeX6gsAMprY/CGvo5uS6VdUM+PsNUjQSAVrl/RVFQ=
	=
X-Received: from wmbh27.prod.google.com ([2002:a05:600c:a11b:b0:4a1:f1e1:c6d6])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6290:b0:4a6:7d6:821f
 with SMTP id 5b1f17b1804b1-4ba02350573mr44083795e9.29.1794313065550; Tue, 10
 Nov 2026 04:17:45 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:38 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-18-ardb+git@google.com>
Subject: [PATCH v2 06/10] efi/libstub: loongarch: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041748_629507_3C419109 
X-CRM114-Status: GOOD (  11.56  )
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

Instead of exposing individual symbols to the EFI stub explicitly via
the linker script, use the generic struct efi_image_info, which accesses
the original symbols via PC-relative references from the stub itself.

This improves code reuse across architectures, and makes it easier to
add new references in a generic manner.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/loongarch/kernel/image-vars.h            | 1 -
 drivers/firmware/efi/libstub/loongarch-stub.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/image-vars.h b/arch/loongarch/kernel/image-vars.h
index e557ebd46c2b..d8676cea754a 100644
--- a/arch/loongarch/kernel/image-vars.h
+++ b/arch/loongarch/kernel/image-vars.h
@@ -8,7 +8,6 @@
 #ifdef CONFIG_EFI_STUB
 
 __efistub_strcmp		= strcmp;
-__efistub_kernel_entry		= kernel_entry;
 __efistub_kernel_asize		= kernel_asize;
 __efistub_kernel_fsize		= kernel_fsize;
 #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/firmware/efi/libstub/loongarch-stub.c
index c87ac7025107..ab7e73e38334 100644
--- a/drivers/firmware/efi/libstub/loongarch-stub.c
+++ b/drivers/firmware/efi/libstub/loongarch-stub.c
@@ -118,7 +118,5 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 unsigned long kernel_entry_address(unsigned long kernel_addr,
 		efi_loaded_image_t *image)
 {
-	unsigned long base = (unsigned long)image->image_base;
-
-	return (unsigned long)&kernel_entry - base + kernel_addr;
+	return kernel_addr + efistub_kernel_entry_offset(efistub_get_image_info());
 }
-- 
2.56.0.542.g3ef89b7020-goog


