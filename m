Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9340606A882
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wyK0rXHJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MR1xxwLL;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PFTUEXkr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w8vSAc39ER+wnwr2gp4YhB3zm+gD/NXMJnzExZ+aCSw=; b=wyK0rXHJarLMV5mP1J42s9P7O1
	cc1C7AG7XLaIquNEBdalWSOy9mxWLL/rOZKt8UesWiepvm/iZLZcfiu/kdkVJFWF7TwRzlqTXoT+S
	WAxkV2o25h8tQdbBp54hg5PgnA9bHg7U/gglTlfYX5n7EZQukgJa6cpgELHt10toNWfLn8JeVIm7g
	sjF133i8sqSrG6+2/KEtUSnoIMaDPkoev1fjOOb+FcXSdCkqyKakABRyQZofvMnoqc77mZuJQS29L
	vXyu+UX7U3o2ZMBwoS1HGIX7x8/vi0Fcu1cddbQgoK+KUoxCh0I6vvFA6pTV/cJMzqVOm6zHwlhMY
	fYNq+JqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxgt-00000002qdw-2CEW;
	Mon, 16 Nov 2026 14:28:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg9-00000002pTZ-0Hpa
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 14:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=w8vSAc39ER+wnwr2gp4YhB3zm+gD/NXMJnzExZ+aCSw=; b=MR1xxwLLpedS33/Qwj4F6aR9s+
	p7sWLuT6HbQVg8y0UJCvwCwQT8/ykUtDuOZLwYUmyQdMzIaqdGre3lA85tC3o/U1uwyVPqemDp/Qw
	+HWH5HuPalyPQtlTzKp/kVLKVOm5KpjNzTeshM2Rf9p4QF33lK2Dgp8MtNkiur/OToDfGNAD0Fi9V
	3hrVEF2RK/Fko1HI/6KElpt3+pP4fmeJpI7rue3sdUdJ3EggsGCE4zrJUP4jPUCSTDQB2rz4rC7HS
	0JOYAeFKoW6S027v1eLwvvIWZANcp5MOwpfWBk1d7w+DcwPRfAO8JBcDhQaNwsDZHGiJTBEfsMFH3
	dM8uPipw==;
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg6-0000000Dvw1-1Sj6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:27 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-4ba078abd70so22860605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839243; x=1795444043; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8vSAc39ER+wnwr2gp4YhB3zm+gD/NXMJnzExZ+aCSw=;
        b=PFTUEXkriG+CoSbnlL3v8vrD/Sl7RKRNyxrZ0reJmH7S2klpeoC9yLyLg2anxhQtnF
         /dTlqTYeYp9VmKpfvndxYq0PgNIvOhiPP3Zk2XpuqTx5ykUXc2Nsi2LHzhUVHVYl6UxT
         X5X1VeX+vt0wL4G9hFdBvsBUg+TdD7Fiod+rrYg2ErRjnfAAJg3tR3AWHh31FWIZ0i9p
         FlGUDd0tOVa2zMRsSybQW99L9eUN4t3VL6ezTUXyVQMhG4MbcZIcaxsVVmpHHs0wrjB4
         RouqQbfEFO0cY7MjbUNNdJj7E1a7tG4osh19GhoScvI6w7pMp93dVJZqAREzq15GTMQk
         dXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839243; x=1795444043;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8vSAc39ER+wnwr2gp4YhB3zm+gD/NXMJnzExZ+aCSw=;
        b=a4a6mywJTbn5w4mnGLuyRCU0EXnW8+iXg+1obQFAyIMFLexM0QTHkboqz+QpzHs/w7
         4CkBmZ8Lej51ahTtjpuC4SXHYCOh94Vy0u5Sxw+4IofBmnNxJUAH0d564F+Nbhf5ZjkZ
         jUip4JUrFtEg8EMsYfIY1nCHmk6PDjcVo9KmYr+Hhw5lShRWtdFPGvGvpEp8VTbFWP+M
         npQJIptZoo9mNMm8vVAfWUgLCml5QcOgNabQ8vrHcCyi2RAKJn2Ch6Y9a92xtPUI8B1Z
         LR2RxA7zyeVOTlcVOcBxoCuawTvE+FSflElhHSgWSGuzmHDUEWzor7Qj6wmEdqsiRC7n
         qWEQ==
X-Gm-Message-State: APuU4Z9MU/F9tsBo9siTEIqUXtWrnG7Lg/DpAfyQ7WkLjxV3UE/e8WNo
	JHVFwV/aewDdRsUZ4DD0lkRNHOWjBo5IG2MINCxs7fW0RM0OpNkCdUCZLDqqf8AYxGcfumV+EA=
	=
X-Received: from wmpg36.prod.google.com ([2002:a05:600c:4ca4:b0:4b0:ea12:73b5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:512:b0:4a2:a9:ed87
 with SMTP id 5b1f17b1804b1-4bb55a5aa47mr175069505e9.19.1794839243177; Mon, 16
 Nov 2026 06:27:23 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:28 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3178; i=ardb@kernel.org;
 h=from:subject; bh=PPz+dYtwyOs5yZuXn+AMtMiBmooJTq56sYarw+f+hSw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30IwHpVlVR4803rbOaLfv3H21/5iIJ9MT7es9jpXBP
 vtWTzjXUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbivJPhn35CwPFN1+7eUHwQ
 v7VX7ZxafXcy76ZPxznZ9xapPhVyvsrIcGPC8WaTQ8oFzrZzsh1PsH8LkAlh7NO8en+l8bLHW7V YuAE=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-26-ardb+git@google.com>
Subject: [PATCH v3 09/15] efi/libstub: loongarch: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_142726_321207_717635B4 
X-CRM114-Status: GOOD (  12.13  )
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
 arch/loongarch/kernel/image-vars.h            | 4 ----
 drivers/firmware/efi/libstub/loongarch-stub.c | 8 --------
 drivers/firmware/efi/libstub/loongarch.c      | 9 +--------
 3 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/arch/loongarch/kernel/image-vars.h b/arch/loongarch/kernel/image-vars.h
index e557ebd46c2b..b01022ce6bb8 100644
--- a/arch/loongarch/kernel/image-vars.h
+++ b/arch/loongarch/kernel/image-vars.h
@@ -8,12 +8,8 @@
 #ifdef CONFIG_EFI_STUB
 
 __efistub_strcmp		= strcmp;
-__efistub_kernel_entry		= kernel_entry;
 __efistub_kernel_asize		= kernel_asize;
 __efistub_kernel_fsize		= kernel_fsize;
-#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
-__efistub_sysfb_primary_display	= sysfb_primary_display;
-#endif
 
 #endif
 
diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/firmware/efi/libstub/loongarch-stub.c
index d57e3d3557a5..6126b05e99fb 100644
--- a/drivers/firmware/efi/libstub/loongarch-stub.c
+++ b/drivers/firmware/efi/libstub/loongarch-stub.c
@@ -116,11 +116,3 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	*(unsigned long *)image_info += *image_addr - (unsigned long)image->image_base;
 	return status;
 }
-
-unsigned long kernel_entry_address(unsigned long kernel_addr,
-		efi_loaded_image_t *image)
-{
-	unsigned long base = (unsigned long)image->image_base;
-
-	return (unsigned long)&kernel_entry - base + kernel_addr;
-}
diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
index 7f21e79384d3..dd4bdf4b08cc 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -59,16 +59,9 @@ static efi_status_t exit_boot_func(struct efi_boot_memmap *map, void *priv)
 	return EFI_SUCCESS;
 }
 
-unsigned long __weak kernel_entry_address(unsigned long kernel_addr,
-		efi_loaded_image_t *image)
-{
-	return *(unsigned long *)(kernel_addr + 8) - PHYSADDR(VMLINUX_LOAD_ADDRESS) + kernel_addr;
-}
-
 efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
 			     const struct efi_image_info *image_info, char *cmdline_ptr)
 {
-	unsigned long kernel_addr = efistub_kernel_base(image_info);
 	kernel_entry_t real_kernel_entry;
 	struct exit_boot_struct priv;
 	unsigned long desc_size;
@@ -99,7 +92,7 @@ efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
 	csr_write(CSR_DMW2_INIT, LOONGARCH_CSR_DMWIN2);
 	csr_write(CSR_DMW3_INIT, LOONGARCH_CSR_DMWIN3);
 
-	real_kernel_entry = (void *)kernel_entry_address(kernel_addr, image);
+	real_kernel_entry = efistub_kernel_entry(image_info);
 
 	real_kernel_entry(true, (unsigned long)cmdline_ptr,
 			  (unsigned long)efi_system_table);
-- 
2.56.0.611.g1030f0b940-goog


