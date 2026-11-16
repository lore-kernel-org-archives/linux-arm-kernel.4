Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA834606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=30CYP/cU;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=drlO8TSW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K7Sgz3ld+ZNxi0hBngHAfrUu3ksDDoe/zQYxMmRp/T4=; b=30CYP/cU7jRjImfSs0QuiZ9leg
	AEn4FuMSkzqv7RqSOrB6f6TinmTGA0+rXEuVMzViADbg+opCWIf91s8L+kP5bO+FeN6VYpCn5FiU7
	PFyFgolVYjZLN6R8UIt6mTaccQhYnMyjS6XMz75+OT7UWLDSBR6QiRFqIUVxuj4oMTjFFh/3+GYUr
	Taofbw1zT9e0cadwRKFG1EY9VZ+hjqAgRhwyuZ2buPRq87iWLLoU2yMJG65Ow+74kfKat69ZnGG36
	SUQJ1gafGUXPW4YUkzwswoE+12VZJAPXpRgWh+B2guvR0kEXmLVjRQTyTCYMHGgz+fayeHFJoA/2b
	z37GbLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxhF-00000002r8G-0InO;
	Mon, 16 Nov 2026 14:28:37 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxgB-00000002pVP-0oto
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:34 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48e0fc747a7so2222938f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839249; x=1795444049; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7Sgz3ld+ZNxi0hBngHAfrUu3ksDDoe/zQYxMmRp/T4=;
        b=drlO8TSWNGNNW365KXQ6VnZJRy+uSOgIcMFzycd9AUzHPQ9V7TrnvQsJp25nx2PTpA
         1N8EMLXOxJEceZX2esqtrUv+2N/a8YlPO/jmg3DYA0osLbCQdyi+mq1sXKHZbTxql2r+
         jUscptx4ajyI0F99R5ZC4wLxIJoE6zujcTMvkEVmgTnucesxWhvjGnt/0befLSR8WyDW
         U8azSEstNOdxT1Z2q00bNpW3uNPTRRYog6xeOkaOSSzC1Bsvn7fljvZt4QSXv8tkwQvs
         WUQlaelW4vKpa09uG578TmTyQwWS43bsvaBIa00dSQUnlj1pc3euUWyZPBsYjqLkV/7U
         WH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839249; x=1795444049;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7Sgz3ld+ZNxi0hBngHAfrUu3ksDDoe/zQYxMmRp/T4=;
        b=a8VFXUb8Ur3I2G6WiUbaZIE+ROSrtOcSEavOtLaTaQxOyuMFECZzV8+Us2JrNbHsK+
         GNuJDhJ/gWtRI8BitSFPFmDsMSjtrkG8vnQLuYure5DqzRGYqsD/YVJGOnndZqRVtTN1
         ngqaz18pwbdxLY0UG6D856sFSG1VP03tSSNJPfP6CDwGrsJC98gFqTJGzH8G2nV/UFak
         2NRqWelR3A2GzOJZbr5m5XweKHs9QOhlGeFxbFm3rkuZVQGh/n4y/EN3XCGXfFUvbjKT
         x0gzhnwmNOzFIZKz+bnOQtojavWI0fzuFiQGRpx1OXP9sXYUdSHZJYfV00uqK8m+WDia
         VPKA==
X-Gm-Message-State: APuU4Z8dajAajJk02EfhPeIzibdPxuFl8qtXzrGt48DgvlTEd8aPI4CW
	5Np69y/cnk6+69BQgX/9rMZNONMsLgb9JrrlIUB6USfrB3Q0+3mYRwfgL9YjHze7Vk42qx90sw=
	=
X-Received: from wrve6.prod.google.com ([2002:a5d:5306:0:b0:49e:f4c:b427])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1863:b0:48d:ee35:b3fe
 with SMTP id ffacd0b85a97d-49c6d45308fmr26905295f8f.8.1794839248438; Mon, 16
 Nov 2026 06:27:28 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:32 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2989; i=ardb@kernel.org;
 h=from:subject; bh=4MxOZY/YO/IfVCPcb3Gx/rGT/ia9EZpFm+NWrw0PtxI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30NxgLubf0xQ07M/eeqe3zGcCp+jmF29ORL2NFuXwt
 i/67svfUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbybR4jw/nQ2UEqc643yObG
 rA9QLvcJyRBNPt8bxfdWLcddfyXPZUaGNfL7Zygavslr9X+589e/CNN5vJ9VM3sTb22bPiPb6k0 RNwA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-30-ardb+git@google.com>
Subject: [PATCH v3 13/15] efi/libstub: arm64: Drop zboot code_size hack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062731_335472_7D720A12 
X-CRM114-Status: GOOD (  13.19  )
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
2.56.0.611.g1030f0b940-goog


