Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C54C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dFGNNAU+;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pnCyCc8W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8sF7COacRN1vGXnrZrNazsi2/3EiiL8z1PsIPlc+wKk=; b=dFGNNAU+JjoIK/omf0hyphXsNf
	oA6pXP3dL4IIDBH/Q9CwhZQG//2axu4nLvein6zzW5rYB13ptJe9W+CuBoCupV1DmCGxPI+pcxVm6
	3KFTW40aLRszfWboJ2nqTiUWiUn9FURZt3o/CTsfPnbJOKvogDzQXsfURI7ttiM1RjAxF3dnYQXky
	MjXg7F8Iub2L1YlBk9XWfuXuWOgk9R6tcR4FAsDXOl1ASMRVuVy2ejErBc//ME8U8g1OFCyd0wUV4
	uZ/uSbyfDzEwFxYrWNiC3m2jNucXHaSwS9Zr/r6jcUAh1X4W0blTaWRGTb9Fh3a2v87nB9egROSy3
	2eyAN9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkK4-00000009vv6-29db;
	Wed, 18 Nov 2026 18:23:56 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIX-00000009tcc-0P8u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:22 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso10966405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026136; x=1795630936; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sF7COacRN1vGXnrZrNazsi2/3EiiL8z1PsIPlc+wKk=;
        b=pnCyCc8WD4kyWAvGIF635TuTsv9bzmY7RCnKAhukhb2Xm47v6PC1xqdxOzocC9AaHT
         bU6L8ngBxJPSAnuqhsocA7p9uYLbPTp6e8HN1ey9FEedUlaDQRNDOxeZuMVDRPBbwBP/
         3WsntMAQHVoavoRivO83pZ56wiK70qnfb8RlYG44SsdUuM9uHCrDINmwIX+VZGUV1Y3v
         J6VKZDwOcY9oQfpSv876QpGFIbJ44EUTDI2rHjIWuty7MqClqk0f1n+balJDNI1VpOLW
         u4Slwc6xQR4RlylVUgCUqyhtX6IniLAhXoHHRgfFmmWUuFtX6K+xLvOHPWnX1ODeK4Cy
         sJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026136; x=1795630936;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sF7COacRN1vGXnrZrNazsi2/3EiiL8z1PsIPlc+wKk=;
        b=ApwbEl6uhxZVYPVYdtIYyxd95kDOHLl8sJ5POXSwvj0vnJ2DAsGbFuhDmfaSoNvNLs
         hGCPxsai6NeSviFglo7uEfx1kwz8dxgvQX4NJiCkWm12TYUSIoaRAkcWo2wDp/VIKzch
         2b3WJKOSNVI1MxaIuVFCzTH8ndJEoD9XwiJbVsgDckhM+V/NsWrkIhn3RBSbEA5QxlCi
         keGTrybsZGD9IWqoqswvCpBYE/k2fAnjMBtKC5I7oEkAtcP+DJL2azzd3CpExN6BJL1Z
         YjdX8osF5zTEKAxrbEHbfvHyDP+LIdGU6WFEoIJESfWbO/vJC1+TTpUbL1aROeV5bFWu
         KBUg==
X-Gm-Message-State: APuU4Z+UU/d6Fkv4cLkd5h+bf+AcjIMh4M2PnOmBpk1zje3oACM7rpHj
	4dtnMNqjWqAIuFvOr0R4Fyg6SiQ5kNvKUptlWpSqgjD5xtCvvf4AHT8HqfwoJSgUb4bFjZJkUg=
	=
X-Received: from wmxt15-n1.prod.google.com ([2002:a05:600d:864f:10b0:4bb:609a:3944])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3555:b0:4a2:150f:1601
 with SMTP id 5b1f17b1804b1-4bb7da2be68mr70517655e9.12.1795026136002; Wed, 18
 Nov 2026 10:22:16 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:23 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2989; i=ardb@kernel.org;
 h=from:subject; bh=mMy4EOR4GKL669ZECvINo54lmzHNhYmaQBvXpm8/VGc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm1UmrxnyoqPFFE209K4fZTWeG7MtSqmC6ROf9YfZl
 Xe15KQ6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETm9jAyzGPUu7r22ayNLf+V
 bb67davLvrqTphuU2Hpe0f73hFcrQxn+iosLFkU+ZtZgvOfNbiglFLlGbcbVis8FQhy1+U/E05d wAQA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-38-ardb+git@google.com>
Subject: [PATCH v4 17/19] efi/libstub: arm64: Drop zboot code_size hack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102221_166369_0A7B658E 
X-CRM114-Status: GOOD (  13.21  )
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

Now that the code size can be obtained via the generic image_info
struct, there is no longer a need to inject it explicitly during the
build.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/Makefile               | 3 ---
 arch/arm64/kernel/image-vars.h         | 4 ----
 drivers/firmware/efi/libstub/arm64.c   | 4 +---
 drivers/firmware/efi/libstub/zboot.lds | 4 ----
 4 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index d42d07667822..509b59518818 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -51,7 +51,4 @@ EFI_ZBOOT_BFD_TARGET	:= elf64-littleaarch64
 EFI_ZBOOT_MACH_TYPE	:= ARM64
 EFI_ZBOOT_FORWARD_CFI	:= $(CONFIG_ARM64_BTI_KERNEL)
 
-EFI_ZBOOT_OBJCOPY_FLAGS	= --add-symbol zboot_code_size=0x$$( \
-				$(NM) vmlinux|grep _kernel_codesize|cut -d' ' -f1)
-
 include $(srctree)/drivers/firmware/efi/libstub/Makefile.zboot
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 329d5e214b36..ca634cedcf63 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -140,10 +140,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
 
 #endif /* CONFIG_KVM */
 
-#ifdef CONFIG_EFI_ZBOOT
-_kernel_codesize = ABSOLUTE(__inittext_end - _text);
-#endif
-
 /*
  * LLD will occasionally error out with a '__init_end does not converge' error
  * if INIT_IDMAP_DIR_SIZE is defined in terms of _end, as this results in a
diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index f8bb890b9631..8a051412814d 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -88,8 +88,6 @@ efi_status_t check_platform_features(void)
 #define DCTYPE	"cvau"
 #endif
 
-u32 __weak code_size;
-
 void efi_cache_sync_image(unsigned long image_base,
 			  unsigned long alloc_size)
 {
@@ -100,7 +98,7 @@ void efi_cache_sync_image(unsigned long image_base,
 	/* only perform the cache maintenance if needed for I/D coherency */
 	if (!(ctr & BIT(CTR_EL0_IDC_SHIFT))) {
 		unsigned long base = image_base;
-		unsigned long size = code_size;
+		unsigned long size = alloc_size;
 
 		do {
 			asm("dc " DCTYPE ", %0" :: "r"(base));
diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
index e1365907f805..e0f0bf005854 100644
--- a/drivers/firmware/efi/libstub/zboot.lds
+++ b/drivers/firmware/efi/libstub/zboot.lds
@@ -2,8 +2,6 @@
 
 ENTRY(__efistub_efi_zboot_header);
 
-PROVIDE(zboot_code_size = ABSOLUTE(0));
-
 SECTIONS
 {
 	.head : ALIGN(4096) {
@@ -22,8 +20,6 @@ SECTIONS
 		*(.rodata* .init.rodata* .srodata*)
 
 		. = ALIGN(4);
-		__efistub_code_size = .;
-		LONG(zboot_code_size);
 		__efistub_efistub_image_info_offset = .;
 		LONG(efistub_image_info_offset);
 
-- 
2.56.1.708.g77570a6a1d-goog


