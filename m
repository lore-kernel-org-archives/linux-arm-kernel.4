Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D19606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yA3qoCaD;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cZ1PaMU4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/n6m3/52gay8f6Ej6cOhY6hNu8E9Pz3qti51eQ1NNTQ=; b=yA3qoCaDAEkzXM5FZ8BJhxaytH
	K7bsA+MRJRqXIIKhmFWxJw8AWnenyTCbfp0Vy762j0AGSbMp41/a9dGWyaD3+7+FX3Kc0yedQdk0z
	OAs3U3lBzeEaixzxebIpibdM9QFJg/5SMuixg/SLuetDdpVDkwQrb3ux+p0q24VvwQgzRZj00NGEm
	Ks/lNN6Knp3ho1gsyv3XcUM8y0NZky+q7GbXJ/2TQL3fkVYa82U5wKo0kWtQwgDixygZsVQ28pKzv
	FUzQ/y/YU1bJHS2wo/CCqLDelFuVr8+evW3a1TykfX5qctwlQsHOx+k7VaCtjjwWwu2UMBgT4NnpH
	MB8qsX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxhF-00000002r8l-1u3E;
	Mon, 16 Nov 2026 14:28:37 +0000
Received: from mail-wm1-f70.google.com ([209.85.128.70])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxgA-00000002pTp-1gbp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:31 +0000
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso20423365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839247; x=1795444047; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/n6m3/52gay8f6Ej6cOhY6hNu8E9Pz3qti51eQ1NNTQ=;
        b=cZ1PaMU4KujZI1wm7j3hQE/TAmYu305lbpIZ4DjOlajjgLS2tlZDPADJ9435ITXwKc
         dZRi+MkFS0AWD0J9xlWvHm/0++gLZelUUlDUruZeB7AwT2b+iqoJRDbCE9KEomMCK4YP
         /kl367k2bZU9cXQWH0TAAK0vbvJaX2wOG4zwM7Ou+wDkBvV4rdfmDR6TBzzjaLzoAWtg
         dQ4+n8OIbba4Kb1+dBhHbdK6Fnfr3XBMlZy8h5Ovgq2KzV6njeadamS/O5hDY0e+lLTy
         sWUvOmp9keJOUJNKAH48gF9RVeNPLmdvdeeKBuXEjkxXwvhLP0XLAahK4Cl7HL20S1pU
         B1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839247; x=1795444047;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/n6m3/52gay8f6Ej6cOhY6hNu8E9Pz3qti51eQ1NNTQ=;
        b=C6DuUd4cBDj8f4OpeF507v03VsyQF8hFjtiTn4JRzKh/8nUeGmAeDbrrIifQ0A3L1i
         oWzsH82jo2Ei2ru6aE0a1pqjPn7US6GQ4RG+uz/CDWELpEuXvNAPHFvWrt/Uf7hfTE/Z
         UDnJbzeay4jtSMv+xSrPDZcCnq/kmVWuyMhaRKPQjx8nMLzT0t5bcPwsTLLBF4jghq1x
         1lGPTr499HDZvdx3gH5YN3Nn7SQ+9D+m3+NM3xs0uowLZZMy003YX7pt1+zhrEl536Z1
         pfR+F00kWaEnrrk/vda29dCVffW+nsTxXAFaxDCL+/DT4WOfhlzFWuCZz4JvFOlazChS
         Etgg==
X-Gm-Message-State: APuU4Z81WjWcxxPOzeP4eJ8cRXM8lKVw7s7ltdaFj80J0N3bkdkFh9Uw
	QaZ9s3GS0DFkcZR9ryeakgA13lXmw4UNjV1P/+SNWoeh5WaUfdPBlrD5afLHElx6z5E7dA0hdw=
	=
X-Received: from wmbh17.prod.google.com ([2002:a05:600c:a111:b0:4a1:e44e:ffd0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1daa:b0:4a2:59:f568
 with SMTP id 5b1f17b1804b1-4bb55a481ccmr219045695e9.14.1794839247128; Mon, 16
 Nov 2026 06:27:27 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:31 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3432; i=ardb@kernel.org;
 h=from:subject; bh=QYWgT8z+L2wxd3Su7/3zae0d2A2rWFJt5EArtqIjNsc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30Jye2Nizu51WtW9hsrE+dFh033rbbWcDfH+5ebw0m
 /Rta9m9jlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRS/MY/jvO3iD6djGz4BvV
 2LrozT0fqyuDj7NyHJj14vqh8nlTF3YzMvyt2qy7QXBh+O6ensTDtfeDZ6z92X/cXt1489atzIt DS/kA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-29-ardb+git@google.com>
Subject: [PATCH v3 12/15] efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062730_538147_5D07588D 
X-CRM114-Status: GOOD (  11.32  )
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64.c                 |  2 --
 drivers/firmware/efi/libstub/zboot-decompress-gzip.c |  2 --
 drivers/firmware/efi/libstub/zboot-decompress-zstd.c |  2 --
 drivers/firmware/efi/libstub/zboot.c                 | 14 +++++++++++++-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index e892302f4189..f8bb890b9631 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -113,8 +113,6 @@ void efi_cache_sync_image(unsigned long image_base,
 	asm("ic ialluis");
 	dsb(ish);
 	isb();
-
-	efi_remap_image(image_base, alloc_size, code_size);
 }
 
 void __noreturn efi_enter_kernel(const struct efi_image_info *image_info,
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
index 4cff756902ad..9c7de225b39e 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -40,6 +40,17 @@ const struct efi_image_info *zboot_get_image_info(unsigned long image_base)
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
@@ -107,7 +118,8 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 		goto error;
 
 	auto image_info = zboot_get_image_info(image_base);
-	status = efi_stub_common(handle, image, image_info, cmdline_ptr);
+	status = efi_zboot_remap_image(image_info, image_base, alloc_size) ?:
+		 efi_stub_common(handle, image, image_info, cmdline_ptr);
 
 error:
 	efi_free(alloc_size, image_base);
-- 
2.56.0.611.g1030f0b940-goog


