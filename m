Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61945606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kCKO4SKB;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HFOQiTOB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2RVj/mwGKYiU3kSMSXzOsaOfBC4aFrCWCPIyQ/H9Zds=; b=kCKO4SKB0ZQ0+xeoPT39CtWX5c
	nq1dfa1r1BUjufVGFCDd2xbUlV2VW4JHrhHs1wbnEAcizRUaareoTCr/Q1XSAyOC2zm/Ein2AewPp
	MMA4uqzH871D/RvRLpB32D76NLjUi+48+ucXSS6xQpgf1QIDalWnekfXFBwiJ/4cuAzayaeI1TW7w
	3646dn7JUd65JRpWCVaBqFl+aHsCSmnSU0xRG7hxP06PUQW+UZ5D+8Z53EEMUnhLyFxFcHEZioRa+
	xiREAPjpkttGaCalQnrTAbRRD/g2ex06sWOuonrlfB9K1rv3jfIUki3j1wVTS7lqTeViDzKXOpATK
	DCxkdWcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxgZ-00000002qBo-3uNF;
	Mon, 16 Nov 2026 14:27:55 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg5-00000002pLd-172z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:28 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso21827325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839243; x=1795444043; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RVj/mwGKYiU3kSMSXzOsaOfBC4aFrCWCPIyQ/H9Zds=;
        b=HFOQiTOBCptAtysi/gcb5oO+3C7v7F/fJ+dTzkBdy1U6oOJQje4SeQrYz+SZ0wSkyx
         tFK9p8ydi2CydfvUwKTP4QKrBNFd3E+wWt73tTVy9Vy1WkL0VQzyyZTBkzVbYva1Y8Xs
         VNPspQihvwTsovSVHOGtzOi4jd0SFXlrZlbCazz1q1VcSG7SxgJqNMZXOlaLWp7ZHDwO
         04K/lFy63Omks0Bvm3Vvwj+tUO3iLM+TMeM89SCL4y+jDItSCY+PMMMXWuv6BgKHPGpc
         k6U3GF+kFi5NaIpNNuAD+SvS7qZ0AXEEQXzrW4l/9tjedYZu2keIwlMrjCH/UDLqEWnH
         izWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839243; x=1795444043;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RVj/mwGKYiU3kSMSXzOsaOfBC4aFrCWCPIyQ/H9Zds=;
        b=hngn/ejsmo/c6n++6vqhTOhPbf8BNH7So0cLCPfa49qi+Wpz2j2S36AyLffdasL12C
         xOsA8JbOrmEY2/lCXqggiWVB2OZA/SDGoYP+ugTKvoA2iMg8WhwA+uyFza1jUPaMoyJ3
         q8KypvujRmnIpNp/CG+L5KACvnGeHAK2U2ykKKGBrACAjnE+dMS2D666QQi2a++k1oMq
         cCZB4UJuwMbGqe3QIh0Tez7IZqy/8CUsZuaqLky6m6h2Oy3APFxjRY+toZHzFwPYz9U7
         5xIuZmdfxYn9AsKVRympu05f5q8sKyuDb2iXEeip7btUsohXR9pNCcj+ARz+L2VN2+pW
         fL9g==
X-Gm-Message-State: APuU4Z+Tr5+LG8iAop+dXrEbiqWE8YffX17VzROZkwoRVTI/xukOz92R
	/Q2ea2PNT4B0mYSLiFthA4EipbYdQGh/chhINgvonF7lstRi/HWqLgGaEGynUnTlt5HmFt/EiQ=
	=
X-Received: from wmcq6.prod.google.com ([2002:a05:600c:c106:b0:4a2:853:1e95])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8905:b0:4ba:4395:5755
 with SMTP id 5b1f17b1804b1-4bb55a6a5fbmr150647045e9.5.1794839242110; Mon, 16
 Nov 2026 06:27:22 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:27 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305; i=ardb@kernel.org;
 h=from:subject; bh=peJRMhRWVHJG8sZnjgL/vZGGMw1q+y4rvprHAO6G7n0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30LSAazPnfFGeua/tpXiBqa7GNo/P075mL5pygqdn6
 /sH+yb6dJSyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJXGlgZJhnynlSWGBaX1iU
 9cqi2qUMb5pWvPm9OV2Ad+a84JIpsfaMDOcrj/9WTLmm+nezcMEfzjnxbixp9oesrniaLZ9oFSy qywMA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-25-ardb+git@google.com>
Subject: [PATCH v3 08/15] efi/libstub: arm64: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062725_335714_65A1BE85 
X-CRM114-Status: GOOD (  15.51  )
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
 arch/arm64/kernel/image-vars.h            | 10 ------
 drivers/firmware/efi/libstub/arm64-stub.c | 33 ++++++--------------
 2 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 19d602e45523..329d5e214b36 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -20,8 +20,6 @@
 	PROVIDE(pisym = sym);		\
 	ASSERT((sym - KIMAGE_VADDR) < (__bss_start - KIMAGE_VADDR), #msg)
 
-PROVIDE(__efistub_primary_entry		= primary_entry);
-
 /*
  * The EFI stub has its own symbol namespace prefixed by __efistub_, to
  * isolate it from the kernel proper. The following symbols are legally
@@ -32,14 +30,6 @@ PROVIDE(__efistub_primary_entry		= primary_entry);
  * position independent manner
  */
 PROVIDE(__efistub_caches_clean_inval_pou = __pi_caches_clean_inval_pou);
-
-PROVIDE(__efistub__text			= _text);
-PROVIDE(__efistub__end			= _end);
-PROVIDE(__efistub___inittext_end       	= __inittext_end);
-PROVIDE(__efistub__edata		= _edata);
-#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
-PROVIDE(__efistub_sysfb_primary_display	= sysfb_primary_display);
-#endif
 PROVIDE(__efistub__ctype		= _ctype);
 
 PROVIDE(__pi___memcpy			= __pi_memcpy);
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index c93ab8b6e9d3..8ff8f8651504 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -10,7 +10,6 @@
 #include <linux/efi.h>
 #include <asm/efi.h>
 #include <asm/memory.h>
-#include <asm/sections.h>
 
 #include "efistub.h"
 
@@ -22,23 +21,23 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
 {
-	unsigned long kernel_size, kernel_codesize, kernel_memsize;
+	unsigned long kernel_base	= efistub_kernel_base(*image_info);
+	unsigned long kernel_size	= efistub_kernel_size(*image_info);
+	unsigned long kernel_codesize	= efistub_kernel_codesize(*image_info);
+	unsigned long kernel_memsize	= efistub_kernel_memsize(*image_info);
 	efi_status_t status;
 
-	if (image->image_base != _text) {
+	if (image->image_base != (void *)kernel_base) {
 		efi_err("FIRMWARE BUG: efi_loaded_image_t::image_base has bogus value\n");
-		image->image_base = _text;
+		image->image_base = (void *)kernel_base;
 	}
 
-	if (!IS_ALIGNED((u64)_text, SEGMENT_ALIGN))
+	if (!IS_ALIGNED(kernel_base, SEGMENT_ALIGN))
 		efi_err("FIRMWARE BUG: kernel image not aligned on %dk boundary\n",
 			SEGMENT_ALIGN >> 10);
 
-	kernel_size = _edata - _text;
-	kernel_codesize = __inittext_end - _text;
-	kernel_memsize = kernel_size + (_end - _edata);
 	*reserve_size = kernel_memsize;
-	*image_addr = (unsigned long)_text;
+	*image_addr = kernel_base;
 
 	status = efi_kaslr_relocate_kernel(image_addr, reserve_addr,
 					   reserve_size, kernel_size,
@@ -48,24 +47,10 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	if (status != EFI_SUCCESS)
 		return status;
 
-	*(unsigned long *)image_info += *image_addr - (unsigned long)_text;
+	*(unsigned long *)image_info += *image_addr - kernel_base;
 	return EFI_SUCCESS;
 }
 
-asmlinkage void primary_entry(void);
-
-unsigned long primary_entry_offset(void)
-{
-	/*
-	 * When built as part of the kernel, the EFI stub cannot branch to the
-	 * kernel proper via the image header, as the PE/COFF header is
-	 * strictly not part of the in-memory presentation of the image, only
-	 * of the file representation. So instead, we need to jump to the
-	 * actual entrypoint in the .text region of the image.
-	 */
-	return (char *)primary_entry - _text;
-}
-
 void efi_icache_sync(unsigned long start, unsigned long end)
 {
 	caches_clean_inval_pou(start, end);
-- 
2.56.0.611.g1030f0b940-goog


