Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94135606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nYwGdL09;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dU5pxi+p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PPBeufobmuc6RIQJ83QzjXbUu8OMDbjvKvPLOTqlXsk=; b=nYwGdL09ZyAVHj6YCcE1YU0L2U
	+Lh8ltRldVEHjXbS0FWAZu2ttvKcbNyFmu/8M2uhYTUtbjtGnqQRLl8vCxgudQvashEVmRPNdV9Ad
	NwwKmg2fK1ffooDX5ckUkQC9QYsgyBGL51ZKFRxzTsrZ/68E4phDqlIHGGwVajyM37PCJfWp52jba
	baoRJLHFvUg2enkl/Did/7eVhO/fajRXyidt3cwTvUeYvRP02sSq5Eul0rn4CelQSlt7iX2wbDb9K
	Y/nkpLBoddUk9VFrOyDAE/kA5cysORJ2VMXAnZ/BS0bkxe/5b/22tNhzg56QbBulSZDfC4myXCHYa
	eExEvx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknU-00000003n8Q-0gTa;
	Tue, 10 Nov 2026 12:17:56 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknK-00000003mvi-1LgF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:47 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48fcb657f32so1399751f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313064; x=1794917864; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPBeufobmuc6RIQJ83QzjXbUu8OMDbjvKvPLOTqlXsk=;
        b=dU5pxi+p71sr5Z6g0VviPJAh0AZdK7bYZn3OHQneuEouIWeAbAIneLe3pfUBCIu22X
         HHFcwMtlnvto6UHb23gGAonBPkd0CjyoRO/+NiT8A4Wcbg83kS5IfLoGKw0p7vBY1ZW1
         ZCPXNs2sKrJtuxJKps/yJMKJlV23OvjOwSsmZDe5DG6epTJOYwThTiylq00Muj+P3YaC
         ajd1B4AWubw0aZkCG+f0oyOw+hv141/dle/SEuoJFgDzK/a1s2RNIqle/P9kFFsr8rKT
         qPN6BrqCrGzV1jHBujsv5sjy/hACZFeAXfPWHthj0act3Q4w2u0rFZlkOkhQU57owjcn
         pJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313064; x=1794917864;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPBeufobmuc6RIQJ83QzjXbUu8OMDbjvKvPLOTqlXsk=;
        b=dPwAWY3WT+lJyjbSU7yiO7hCzHMKDPXkjo/lAvOiQUg+g4w0dsGh41E88jyjUvZ0gi
         RAwjDdo61WRHFAG+8tBxv6uPtGtwuG1Wn5YzRIXfW3sNOvY+B8frqKtmKycvoNPYPAmG
         0eLUfny9w1Yr/YGoLMa6roHnrti1+yxzpRTpr6DuWmrg5t6+u/c+prOvBwiDWSlDeR3x
         PlI6DnsrPerLvJZAx+9vrwln7J2oa1sI9OW4kydoxdSZJg/9M7ySBRgJxm2tFqidnhWi
         GsD05FH3w9l1U1mbECwn3hl2HvwZmR5gwf7pPa72WpDbfmGmo2DkqYM/i+p1MEmK/SVe
         3KSA==
X-Gm-Message-State: APuU4Z9T9vattC6TLI5Gb3L/bK/I84k9KBd3cnWvHa5lMMwGMbgIkO3R
	Jz0lhDGToNdwDExs+NOJtbKk9RKxyghNb4kut++sPxl2DOP0zTvMg2bXgeF7vrHyXp6/jDICxw=
	=
X-Received: from wrsh7.prod.google.com ([2002:adf:fd47:0:b0:493:19d2:af6a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:993:b0:491:4e13:fde3
 with SMTP id ffacd0b85a97d-4982e7379d4mr4015466f8f.13.1794313063487; Tue, 10
 Nov 2026 04:17:43 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:36 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-16-ardb+git@google.com>
Subject: [PATCH v2 04/10] efi/libstub: Capture loaded image information in
 struct efi_image_info
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041746_430127_235D9B6C 
X-CRM114-Status: GOOD (  23.31  )
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

Define a struct efi_image_info that carries properties of the loaded
kernel image, and pass a pointer to it to efi_stub_common() so that EFI
stub code can access there properties in a consistent manner for both
the uncompressed kernel and the EFI zboot image.

Note that zboot can only access this information after decompressing the
image, whereas code that is part of the EFI stub that gets integrated
into Linux can just grab the efi_image_info pointer as needed.

ARM implements neither, but -like x86- incorporates the EFI stub into
its own decompressor. It has no need for this functionality, so emit a
dummy struct to satisfy the linker.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi-header.S                |  2 +
 arch/loongarch/kernel/head.S                  |  1 +
 arch/riscv/kernel/head.S                      |  1 +
 drivers/firmware/efi/libstub/Makefile         |  1 +
 drivers/firmware/efi/libstub/Makefile.zboot   | 11 ++++-
 drivers/firmware/efi/libstub/arm32-stub.c     |  3 ++
 drivers/firmware/efi/libstub/efi-stub-entry.c | 10 ++++-
 drivers/firmware/efi/libstub/efi-stub.c       |  3 +-
 drivers/firmware/efi/libstub/efistub.h        | 44 +++++++++++++++++++-
 drivers/firmware/efi/libstub/image_info.S     | 12 ++++++
 drivers/firmware/efi/libstub/zboot.c          | 17 +++++++-
 drivers/firmware/efi/libstub/zboot.lds        |  2 +
 12 files changed, 101 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/efi-header.S b/arch/arm64/kernel/efi-header.S
index 329e8df9215f..54ca61d03403 100644
--- a/arch/arm64/kernel/efi-header.S
+++ b/arch/arm64/kernel/efi-header.S
@@ -7,6 +7,8 @@
 #include <linux/pe.h>
 #include <linux/sizes.h>
 
+SYM_FUNC_ALIAS(efi_primary_entry, primary_entry)
+
 	.macro	efi_signature_nop
 #ifdef CONFIG_EFI
 .L_head:
diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index 601ddd78b233..69c31b0b65c5 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -35,6 +35,7 @@ pe_header:
 SYM_DATA(kernel_asize, .long _kernel_asize);
 SYM_DATA(kernel_fsize, .long _kernel_fsize);
 
+SYM_FUNC_ALIAS(efi_primary_entry, kernel_entry)
 #endif
 
 	__REF
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 1631fd6bc786..6c81f32be70b 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -28,6 +28,7 @@ SYM_CODE_START(_start)
 	 * that expects this header format!!
 	 */
 #ifdef CONFIG_EFI
+SYM_FUNC_ALIAS(efi_primary_entry, _start_kernel)
 	/*
 	 * This instruction decodes to "MZ" ASCII required by UEFI.
 	 */
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..9dc6a707fd79 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -107,6 +107,7 @@ lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
 
 targets				:= $(lib-y)
 lib-y				:= $(patsubst %.o,%.stub.o,$(lib-y))
+lib-$(CONFIG_EFI_GENERIC_STUB)	+= image_info.o
 
 # Even when -mbranch-protection=none is set, Clang will generate a
 # .note.gnu.property for code-less object files (like lib/ctype.c),
diff --git a/drivers/firmware/efi/libstub/Makefile.zboot b/drivers/firmware/efi/libstub/Makefile.zboot
index 52baacf3e9d9..e2769bbec963 100644
--- a/drivers/firmware/efi/libstub/Makefile.zboot
+++ b/drivers/firmware/efi/libstub/Makefile.zboot
@@ -26,9 +26,18 @@ zboot-size-len-$(CONFIG_KERNEL_ZSTD)	:= 4
 $(obj)/vmlinuz: $(obj)/vmlinux.bin FORCE
 	+$(call if_changed,$(zboot-method-y))
 
+# subtract the two symbol values to obtain the offset of struct efi_image_info
+get_image_info_offset = $(shell $(NM) -n $(objtree)/vmlinux |\
+			grep -E ' _text$$| __efistub_efistub_image_info$$' |\
+			awk 'NR == 1 { a = toupper($$1) } \
+			     NR == 2 { print "obase=16; ibase=16; " toupper($$1) "-" a }' |\
+			bc)
+
 # avoid eager evaluation to prevent references to non-existent build artifacts
 OBJCOPYFLAGS_vmlinuz.o = -I binary -O $(EFI_ZBOOT_BFD_TARGET) $(EFI_ZBOOT_OBJCOPY_FLAGS) \
-			  --rename-section .data=.gzdata,load,alloc,readonly,contents
+			 --rename-section .data=.gzdata,load,alloc,readonly,contents \
+			 --add-symbol efistub_image_info_offset=0x$(get_image_info_offset)
+
 $(obj)/vmlinuz.o: $(obj)/vmlinuz FORCE
 	$(call if_changed,objcopy)
 
diff --git a/drivers/firmware/efi/libstub/arm32-stub.c b/drivers/firmware/efi/libstub/arm32-stub.c
index 1073dd947516..53ade94f4bdb 100644
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@ -132,3 +132,6 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 
 	return EFI_SUCCESS;
 }
+
+/* expose a dummy struct - ARM does not use this anyway */
+struct efi_image_info efistub_image_info = {};
diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
index efa3ab8ad1c6..c173c0dd8454 100644
--- a/drivers/firmware/efi/libstub/efi-stub-entry.c
+++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
@@ -27,6 +27,13 @@ struct sysfb_display_info *alloc_primary_display(void)
 	return NULL;
 }
 
+const struct efi_image_info *efistub_get_image_info(void)
+{
+	extern const struct efi_image_info efistub_image_info;
+
+	return &efistub_image_info;
+}
+
 /*
  * EFI entry point for the generic EFI stub used by ARM, arm64, RISC-V and
  * LoongArch. This is the entrypoint that is described in the PE/COFF header
@@ -80,7 +87,8 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 
 	kernel_image_offset = image_addr - (unsigned long)image->image_base;
 
-	status = efi_stub_common(handle, image, image_addr, cmdline_ptr);
+	status = efi_stub_common(handle, image, image_addr, cmdline_ptr,
+				 efistub_get_image_info());
 
 	efi_free(image_size, image_addr);
 	efi_free(reserve_size, reserve_addr);
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index 6db10590f89b..ee5931eed59c 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -161,7 +161,8 @@ efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr)
 efi_status_t efi_stub_common(efi_handle_t handle,
 			     efi_loaded_image_t *image,
 			     unsigned long image_addr,
-			     char *cmdline_ptr)
+			     char *cmdline_ptr,
+			     const struct efi_image_info *image_info)
 {
 	struct sysfb_display_info *dpy;
 	efi_status_t status;
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index f5eec8c12894..394796472cc0 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1148,11 +1148,53 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle);
 
+struct efi_image_info {
+	s32	_text_offset;
+	s32	__inittext_end_offset;
+	s32	_edata_offset;
+	s32	_end_offset;
+	s32	entry_offset;
+};
+
+const struct efi_image_info *efistub_get_image_info(void);
+const struct efi_image_info *zboot_get_image_info(unsigned long image_base);
+
+static inline
+unsigned long efistub_kernel_base(const struct efi_image_info *image_info)
+{
+	return (unsigned long)offset_to_ptr(&image_info->_text_offset);
+}
+
+static inline
+unsigned long efistub_kernel_size(const struct efi_image_info *image_info)
+{
+	return image_info->_edata_offset - image_info->_text_offset;
+}
+
+static inline
+unsigned long efistub_kernel_memsize(const struct efi_image_info *image_info)
+{
+	return image_info->_end_offset - image_info->_text_offset;
+}
+
+static inline
+unsigned long efistub_kernel_codesize(const struct efi_image_info *image_info)
+{
+	return image_info->__inittext_end_offset - image_info->_text_offset;
+}
+
+static inline
+unsigned long efistub_kernel_entry_offset(const struct efi_image_info *image_info)
+{
+	return image_info->entry_offset - image_info->_text_offset;
+}
+
 /* shared entrypoint between the normal stub and the zboot stub */
 efi_status_t efi_stub_common(efi_handle_t handle,
 			     efi_loaded_image_t *image,
 			     unsigned long image_addr,
-			     char *cmdline_ptr);
+			     char *cmdline_ptr,
+			     const struct efi_image_info *image_info);
 
 efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr);
 
diff --git a/drivers/firmware/efi/libstub/image_info.S b/drivers/firmware/efi/libstub/image_info.S
new file mode 100644
index 000000000000..3d3dded0f451
--- /dev/null
+++ b/drivers/firmware/efi/libstub/image_info.S
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#define REL_REF(sym)	.long	sym - 0b
+
+	.globl		__efistub_efistub_image_info
+	.p2align	3
+__efistub_efistub_image_info:
+0:	REL_REF(_text)
+	REL_REF(__inittext_end)
+	REL_REF(_edata)
+	REL_REF(_end)
+	REL_REF(efi_primary_entry)
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index 4a5ffe164873..c6071b0e8f1a 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -31,6 +31,13 @@ struct sysfb_display_info *alloc_primary_display(void)
 	return __alloc_primary_display();
 }
 
+const struct efi_image_info *zboot_get_image_info(unsigned long image_base)
+{
+	extern const u32 efistub_image_info_offset;
+
+	return (void *)image_base + efistub_image_info_offset;
+}
+
 asmlinkage efi_status_t __efiapi
 efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 {
@@ -93,9 +100,15 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 	}
 
 	// Decompress the payload into the newly allocated buffer
-	status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
-	         efi_stub_common(handle, image, image_base, cmdline_ptr);
+	status = efi_zboot_decompress((void *)image_base, alloc_size);
+	if (status != EFI_SUCCESS)
+		goto error;
+
+	auto image_info = zboot_get_image_info(image_base);
+	status = efi_stub_common(handle, image, image_base, cmdline_ptr,
+				 image_info);
 
+error:
 	efi_free(alloc_size, image_base);
 	return status;
 }
diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
index 367907eb7d86..e1365907f805 100644
--- a/drivers/firmware/efi/libstub/zboot.lds
+++ b/drivers/firmware/efi/libstub/zboot.lds
@@ -24,6 +24,8 @@ SECTIONS
 		. = ALIGN(4);
 		__efistub_code_size = .;
 		LONG(zboot_code_size);
+		__efistub_efistub_image_info_offset = .;
+		LONG(efistub_image_info_offset);
 
 		_etext = ALIGN(4096);
 		. = _etext;
-- 
2.56.0.542.g3ef89b7020-goog


