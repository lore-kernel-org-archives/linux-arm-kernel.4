Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1949C606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qHlIJqkx;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SUDWI5kx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7NfbOn3Kflbxnh3F008n5JJpxbmKMRJyc/lu3FOPZxo=; b=qHlIJqkxmN/akIym0yUi6eZO1v
	OLngthyBN8I9gkE+YJcBTM6a5ciHny51u9TFZcdOqvASUebg6OKZ7o+sTTL3uiqrdaBOF8OJ4ivam
	C9BfiMR7OVVHfzgo38eZYPjJCH1OXpG6MlIjDKnybHJpMZm5oZN9pXZ8MepMAEiPpn1iPnC6O5LrC
	PXYc1AtFkbJhzh9qfacNIsEDZnirXfm/7Ghot9pY4L/rlxOxNnMAYV9xKtbv8QPS6S3FNv8nIYEeP
	4n8XRyFjFHGfXwPaAiYGcHPz6FVFZIzWiG4iAVe3mc7eAHKkX8qvF9vH7VkWNgKOpYli97lROtDQK
	vZWcDDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknd-00000003nJU-3IGf;
	Tue, 10 Nov 2026 12:18:05 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknN-00000003mzo-3p6E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:51 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so14766605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313067; x=1794917867; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NfbOn3Kflbxnh3F008n5JJpxbmKMRJyc/lu3FOPZxo=;
        b=SUDWI5kx+0716spTxuMFALeLdrCwcBTAnywvbUy2mHh0QRJCJCyaqO3Pq0J9uymvJT
         lTHG6noSAJcpu14KF0XNcxu4uKWlbp5JbHnteibxkC9q3ZCu2pyThrSLvYPUW06Qnwyz
         oi5ysIbai2AWcdbpOFQhJpVE0ml6pm6ktPBH3D95rTwGgLctJNk7LmuNEt5JiCWtBEJJ
         pk64oyYQ70mJsrWkxRchkWnESLwRfrKjrfyJt+irzEv1+CeFpR82ZLDkpY+bahxDB+hH
         hCoKV1JtPb448Wj38GroopdRkEKVsuIEE8fKjB7WUhGLDZ7IJgKeeMZAwiNHnDj6NnGh
         L1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313067; x=1794917867;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NfbOn3Kflbxnh3F008n5JJpxbmKMRJyc/lu3FOPZxo=;
        b=egrwKfe02c81dnuzv7x3AFLWVAYAmPRXan6LAmhJ6WKXFAYF/HDLQSobmBE+AR+DBz
         pafTSvjw7LOXTIalPy+vzASBoY9jeLdTKq+itW31BxO+jMKcR55mH/lWtdOzMp8B++hM
         mfeTv4nSb3D8DAyFrKf8sV1n0EuTP78doLwIVhP7XJsd4pN0UjQVGsOSXLLEN32E+OGb
         Ix7rdeyLv9Q9jRaJTWtK022ewShJ13QISWjXvAzm3SodVOe0TaOqu/Vf0/gsAFEozCfd
         R2K4R3fFCqH+tXFuYsV34+tjE4lp3XQIxeUSPPxOhp4ZtkuQ9bcfFHtHGP0OwbokTOBE
         eNoQ==
X-Gm-Message-State: APuU4Z8+tDWvCdZVJU3SKgP8wXAd3p7DWQCAahi+ZPFFjS7phwdrMw1K
	IOaK8Ur1ua3VBYodGBV2/YJ5VIu1wjR9cCQPgaZ0plVA8GftFtLo+hVwj95/3wNYH/uWMxoLcA=
	=
X-Received: from wrnj18.prod.google.com ([2002:adf:ea52:0:b0:48c:4566:c9eb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:34d3:b0:4a1:e6c5:e44c
 with SMTP id 5b1f17b1804b1-4ba0233e7f5mr39656725e9.10.1794313067235; Tue, 10
 Nov 2026 04:17:47 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:39 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-19-ardb+git@google.com>
Subject: [PATCH v2 07/10] efi/libstub: riscv: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041749_994985_111CBFA5 
X-CRM114-Status: GOOD (  13.27  )
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
 arch/riscv/kernel/image-vars.h            |  5 -----
 drivers/firmware/efi/libstub/riscv-stub.c | 14 +++++++-------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index bf703eba3fa5..27efb990da43 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -23,11 +23,6 @@
  * linked at. The routines below are all implemented in assembler in a
  * position independent manner
  */
-__efistub__start		= _start;
-__efistub__start_kernel		= _start_kernel;
-__efistub__end			= _end;
-__efistub__edata		= _edata;
-__efistub___inittext_end	= __inittext_end;
 #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
 __efistub_sysfb_primary_display	= sysfb_primary_display;
 #endif
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 5cbc50a814e1..e8d66f6fe8e0 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -6,7 +6,6 @@
 #include <linux/efi.h>
 
 #include <asm/efi.h>
-#include <asm/sections.h>
 #include <linux/unaligned.h>
 
 #include "efistub.h"
@@ -20,7 +19,7 @@ unsigned long stext_offset(void)
 	 * of the file representation. So instead, we need to jump to the
 	 * actual entrypoint in the .text region of the image.
 	 */
-	return _start_kernel - _start;
+	return efistub_kernel_entry_offset(efistub_get_image_info());
 }
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
@@ -30,13 +29,14 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle)
 {
-	unsigned long kernel_size, kernel_codesize, kernel_memsize;
+	auto image_info			= efistub_get_image_info();
+	unsigned long kernel_base	= efistub_kernel_base(image_info);
+	unsigned long kernel_size	= efistub_kernel_size(image_info);
+	unsigned long kernel_codesize	= efistub_kernel_codesize(image_info);
+	unsigned long kernel_memsize	= efistub_kernel_memsize(image_info);
 	efi_status_t status;
 
-	kernel_size = _edata - _start;
-	kernel_codesize = __inittext_end - _start;
-	kernel_memsize = kernel_size + (_end - _edata);
-	*image_addr = (unsigned long)_start;
+	*image_addr = kernel_base;
 	*reserve_size = kernel_memsize;
 
 	status = efi_kaslr_relocate_kernel(image_addr,
-- 
2.56.0.542.g3ef89b7020-goog


