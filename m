Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE534606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4t0lS1qC;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C+tY6Ma1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/NOGXHiMglGNlkAHWoIUlx58rvJ+/z9H2Q0oQTuWMl4=; b=4t0lS1qCN8elymdFNs1/gNZBd2
	oBBxy61fS/9DR15wYjQbUqUuGKm4WlPhBDWAzMKmse7E2eBZHRz1TB9qpoy2edD2uVpOA7+o6fnXG
	R3Bp100NRadFI14tQKvpj9L2n5Ef5Re8L2AMZG1wtSSiPcSC0yZaFs6GDJXBo3gpe8wPWmBfHC9Dm
	lFzXWYj6zHt00viBvn2IrSlPIVFbXeo4vLuQ6TQ17aERAsCylVqclTHi/w3iyvRcW9HkFtruI7l4L
	Nk17Cbptv9AgX0GYumW3QbBkUc/NVw6urcLvvXwFWloFrFqUQk1kwMq6S3KBMtDO+uVO6ObCksa0t
	6gjrJCsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknf-00000003nOD-3iAP;
	Tue, 10 Nov 2026 12:18:07 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknQ-00000003n3Q-28C6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:53 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a17741243eso11417535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313070; x=1794917870; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NOGXHiMglGNlkAHWoIUlx58rvJ+/z9H2Q0oQTuWMl4=;
        b=C+tY6Ma1QD4C2MfoB9BZ7aHw2Qnjsyqe/EodVXWGEHypGhmSZg/+mX/4jiQ2U27kKG
         Sen0Ew2KFgRtbPjpgNT4wL3lIXGXee6T51MEOJfrEquZRefq9pV1Vl7du+6aOYEWIoIY
         5nxzOHdA+d2jiXNKaXQP7dLFroeK6DNUkgRUJ6PvOBZE5I7Bqh1FbG3IzViukj3S1qH2
         GrfxTNbyG97R6Fc9r4vWDHwQmmIFCmStHLy9aB9ROuXalxhtKfiITLCvhNUcDYTCfYev
         LxnfsrMSX0jIu5ftMEx6azM6t14m8AltbT8zK/pQP7xz4GA+C5QnK3ePG2CrGYNCgSM8
         wmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313070; x=1794917870;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NOGXHiMglGNlkAHWoIUlx58rvJ+/z9H2Q0oQTuWMl4=;
        b=hK9bjSbvbnkuMIbPITCk5YiGQJsvz0WolF1EG9ksOsJoDKs1jhL/vwRSvp4Kj+7SYq
         VS9W5fVRsf/CVL0yInXgkteJiHb4dU8uXH0TZwo8AanQaRttODI0z7edjgDxLQLx3pW2
         j/8nHiodftLE6eLe7+hnK9/z6KWJVrF9uyqW+Alaw9HJr8oIIQS6LAf632Xm1g02mIXV
         kf3GPvbFCzMiJ9t68HWc8CRrKxuN3U7eoWt5l6QM81awdIuHBNV9fbwaYaeYwZWXoxv3
         zouaxphGTpXYRgeNUHHBpP8JcTHeWQgeMECuMAGlAtCfN2QnNgH4yXDHStMalZA+MxbS
         ASmQ==
X-Gm-Message-State: APuU4Z9cJoC3EUPHzsSy8JmW3dVUKzPubbV+hfce+J7rhGpWci2fLGDJ
	YG5QilQDTeZ7S6ps635cLgC1xQV6C29VTS6+pCvpuVkZRXuZYRMZXvX8Dodz2Sdf+ra38jbyrQ=
	=
X-Received: from wmbgx15.prod.google.com ([2002:a05:600c:858f:b0:4a2:8ef:a5af])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1392:b0:4a2:1e1:d55
 with SMTP id 5b1f17b1804b1-4ba02355ab0mr37537145e9.28.1794313070010; Tue, 10
 Nov 2026 04:17:50 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:41 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-21-ardb+git@google.com>
Subject: [PATCH v2 09/10] efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041752_588018_4E594D1A 
X-CRM114-Status: GOOD (  11.95  )
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

Refactor efi_cache_sync_image() so that it is not in charge of calling
efi_remap_image(), which is really the wrong way around.

Instead, call efi_remap_image() from the primary zboot procedure, where
it is more straight-forward to obtain the code size from the loaded
image.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64.c                 |  2 --
 drivers/firmware/efi/libstub/zboot-decompress-gzip.c |  2 --
 drivers/firmware/efi/libstub/zboot-decompress-zstd.c |  2 --
 drivers/firmware/efi/libstub/zboot.c                 | 14 +++++++++++++-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index 62fc8e53c8a0..fdd48ba0f9f1 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -114,8 +114,6 @@ void efi_cache_sync_image(unsigned long image_base,
 	asm("ic ialluis");
 	dsb(ish);
 	isb();
-
-	efi_remap_image(image_base, alloc_size, code_size);
 }
 
 unsigned long __weak primary_entry_offset(void)
diff --git a/drivers/firmware/efi/libstub/zboot-decompress-gzip.c b/drivers/firmware/efi/libstub/zboot-decompress-gzip.c
index e97a7e9d3c98..79cf8c48b033 100644
--- a/drivers/firmware/efi/libstub/zboot-decompress-gzip.c
+++ b/drivers/firmware/efi/libstub/zboot-decompress-gzip.c
@@ -62,7 +62,5 @@ efi_status_t efi_zboot_decompress(u8 *out, unsigned long outlen)
 		return EFI_LOAD_ERROR;
 	}
 
-	efi_cache_sync_image((unsigned long)out, outlen);
-
 	return EFI_SUCCESS;
 }
diff --git a/drivers/firmware/efi/libstub/zboot-decompress-zstd.c b/drivers/firmware/efi/libstub/zboot-decompress-zstd.c
index bde9d94dd2e3..dd7f11238154 100644
--- a/drivers/firmware/efi/libstub/zboot-decompress-zstd.c
+++ b/drivers/firmware/efi/libstub/zboot-decompress-zstd.c
@@ -43,7 +43,5 @@ efi_status_t efi_zboot_decompress(u8 *out, unsigned long outlen)
 		return EFI_LOAD_ERROR;
 	}
 
-	efi_cache_sync_image((unsigned long)out, outlen);
-
 	return EFI_SUCCESS;
 }
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index c6071b0e8f1a..25ff5960771c 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -38,6 +38,17 @@ const struct efi_image_info *zboot_get_image_info(unsigned long image_base)
 	return (void *)image_base + efistub_image_info_offset;
 }
 
+static efi_status_t efi_zboot_remap_image(const struct efi_image_info *image_info,
+					  unsigned long image_base,
+					  unsigned long image_size)
+{
+	unsigned long code_size = efistub_kernel_codesize(image_info);
+
+	efi_cache_sync_image(image_base, code_size);
+
+	return efi_remap_image(image_base, image_size, code_size);
+}
+
 asmlinkage efi_status_t __efiapi
 efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 {
@@ -105,7 +116,8 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 		goto error;
 
 	auto image_info = zboot_get_image_info(image_base);
-	status = efi_stub_common(handle, image, image_base, cmdline_ptr,
+	status = efi_zboot_remap_image(image_info, image_base, alloc_size) ?:
+	         efi_stub_common(handle, image, image_base, cmdline_ptr,
 				 image_info);
 
 error:
-- 
2.56.0.542.g3ef89b7020-goog


