Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA343606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yEckEyKt;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pzT0c711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FKyHqeXkJfnFo2/e42CmLuZIRnayYURfHn0ko47n0QU=; b=yEckEyKtx2fbQxnmkaWVKW36+N
	YHsB8PVC3/m9YxNY/U1hoc68FfdNsuPVU2AyiKcRHWHojGj0U7po9lXzimxLPCha1B8YhRcgrdzpO
	1LYbBl/i8zvx/ptaBG3U6npqX9U6vqMCyseftHAw9puqgd64xXesMFPzw4LryiFetQb/KpEPp26NJ
	K6xv+Le33DBTV1t0tFtv6haLghsgv0Yc/tRwK6JuiG+5Wb4ffDn/gOKqoP1OUaA1n9sOgpJmKpbnY
	8OCUt+z6f76EJUocDLBEeif0g5KsyGl5UGFTLLpg0RpEDvNShSkbEdWOEPnzRRKi5uXBBM8sXZtNh
	Y8QwSL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknM-00000003n0G-26jY;
	Tue, 10 Nov 2026 12:17:48 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknI-00000003mus-1kTP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:45 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a17741243eso11416815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313062; x=1794917862; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKyHqeXkJfnFo2/e42CmLuZIRnayYURfHn0ko47n0QU=;
        b=pzT0c7117bNqrOkwjLqNi+9aebe9JdjfauGXZzjPvF5bx3tlkdlbDwGhag4/Qt7EvC
         Q97SMY44uKf/TtdfJI8DQgFEiL9f/SxD2ia/UN+vdctOFu0pGRNE3ORz+UIDQnbsagT3
         YxeJyVDNS4WoyQT5z0nEOGCXh1jYaIm1d3gcfsPPL+zEutzyKrAKyAElXJLDowppqJQK
         PBaCjMedsf8lf77w0eGctQPy/G+6b0qU9bVDeXKSBRQqx1c0Th7ov6Ytve/lrf5RdR/1
         QK/YHo2oZyuEGiN9cDJ58L0hdd3+jNPywi+UIHDaQV+k0wF4fu/Tl3XPIUms2je/tgyG
         EuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313062; x=1794917862;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKyHqeXkJfnFo2/e42CmLuZIRnayYURfHn0ko47n0QU=;
        b=q39zMKV4gdYqcQkv+qvJGmvrE81MeT5lGMhfQS0kYT3BZfTw2zeaOGNSR8bN10XrbT
         qyilcorkwcbPbvj+WFAyLsBmmI4//5H3B2J93TNWPtIc9kwsSUV8RcOcMwoDkCsmiV5W
         8JBUc1tDJ0fYALMmsjzz2OwgdLN2yYsiSyHKnzWURmU9Lf01t3o1XG80TVAsBjbd3Msl
         YPhvIIJ6qdxl3s0SSM4CJl4/qu8FYIwuHngksYPMtq1W8ByGXr3DyZLISk7ldWuKCMRW
         d9K4Y+F5lN+e6e7jO8q7yTH+Ho0XnZfbi2XmAp/f72x9SrvW6WjWVL5Glspkm9zTSsZo
         V9tQ==
X-Gm-Message-State: APuU4Z8ECjSSFrV3Tu8RokIvwFSJNGDvg4aapZ2HGUHAU6D8JX7lbJPF
	7N5edaXvPOpQifZscuFQ5cPSaBToj6h+tPui85Ps3tsNKqjAliEBtiATBS/DGOpeUVsy+Vxegg=
	=
X-Received: from wrul8.prod.google.com ([2002:a5d:6688:0:b0:48d:edc0:5a37])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:198f:b0:4b4:49d7:bc25
 with SMTP id 5b1f17b1804b1-4ba0234a940mr39574545e9.21.1794313061406; Tue, 10
 Nov 2026 04:17:41 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:34 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-14-ardb+git@google.com>
Subject: [PATCH v2 02/10] efi/riscv: Rename __init_text_end to __inittext_end
 like other archs
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041744_473254_23E8BB08 
X-CRM114-Status: GOOD (  12.97  )
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

Align RISC-V with arm64, LoongArch and x86, and drop the underscore
between 'init' and 'text' in the section markers. This allows the value
to be captured by generic EFI stub code that can be shared between all
those architectures.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/include/asm/sections.h         | 2 +-
 arch/riscv/kernel/image-vars.h            | 2 +-
 arch/riscv/kernel/vmlinux.lds.S           | 4 ++--
 drivers/firmware/efi/libstub/riscv-stub.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
index a393d5035c54..4a882a28f414 100644
--- a/arch/riscv/include/asm/sections.h
+++ b/arch/riscv/include/asm/sections.h
@@ -11,7 +11,7 @@
 extern char _start[];
 extern char _start_kernel[];
 extern char __init_data_begin[], __init_data_end[];
-extern char __init_text_begin[], __init_text_end[];
+extern char __inittext_begin[], __inittext_end[];
 extern char __alt_start[], __alt_end[];
 extern char __exittext_begin[], __exittext_end[];
 
diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index 7b44b94f1283..bf703eba3fa5 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -27,7 +27,7 @@ __efistub__start		= _start;
 __efistub__start_kernel		= _start_kernel;
 __efistub__end			= _end;
 __efistub__edata		= _edata;
-__efistub___init_text_end	= __init_text_end;
+__efistub___inittext_end	= __inittext_end;
 #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
 __efistub_sysfb_primary_display	= sysfb_primary_display;
 #endif
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1f4f8496941a..08ada0591f3a 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -46,7 +46,7 @@ SECTIONS
 
 	. = ALIGN(SECTION_ALIGN);
 	__init_begin = .;
-	__init_text_begin = .;
+	__inittext_begin = .;
 	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
 		_sinittext = .;						\
 		INIT_TEXT						\
@@ -72,7 +72,7 @@ SECTIONS
 	}
 	__exittext_end = .;
 
-	__init_text_end = .;
+	__inittext_end = .;
 	. = ALIGN(SECTION_ALIGN);
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 725b634c5179..5cbc50a814e1 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -34,7 +34,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	efi_status_t status;
 
 	kernel_size = _edata - _start;
-	kernel_codesize = __init_text_end - _start;
+	kernel_codesize = __inittext_end - _start;
 	kernel_memsize = kernel_size + (_end - _edata);
 	*image_addr = (unsigned long)_start;
 	*reserve_size = kernel_memsize;
-- 
2.56.0.542.g3ef89b7020-goog


