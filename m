Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99DF606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wgq14SBs;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+IueCaO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rbvVNrqGe63WaCDhQx3Sv7CZ2HUvzt7iMpy1FWtb+xE=; b=wgq14SBsHLjKU3KvPef8nUkLVw
	r4GtY5TsNzmRwlmjquPM7/XMprzPvsguWpHPXvaPSfxybKqxKPTxqkigupv/Jst6HztaiUWV7sJKx
	wQp8AkPee9FYT4xT75v5aN8ZHjUJZwsozm8nFFkZlfPWigq2G4F1QuVun3UH87pVyHT+r6TEIqK01
	vkxbO6deNdFmPCNDZ9hkYGjrr7Kfw9cdRqO8kL521MG5GXPIFQXApdj1W78pQyeuxi5e6mruDXe4Q
	5EMqWwBxMS2G39/MeehsRXcOizTfk4etuRH5V+xDbFpokYqTZblLO4ZDrZhaf6WneLDmfiqim+g0D
	pZLvD/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkKY-00000009wSV-0BHr;
	Wed, 18 Nov 2026 18:24:26 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIT-00000009tZi-42x7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:22 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-490d2ac331bso1324293f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026134; x=1795630934; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbvVNrqGe63WaCDhQx3Sv7CZ2HUvzt7iMpy1FWtb+xE=;
        b=j+IueCaO6C0FuFm/VAZkDd3m7jawQcrvmG728xtFasea2C21cHrhS3/Hs7k3AtNHFM
         VP20ncEymPgh0me6BxmZXg4ZTEo6KAf7zNXayAgenBKQZUNIkkQGGIPt1YebjqR8tgR6
         4DyKMDf7pCH4pcBZr6d1mK2530CDaFIelwkgHOARIz+NKE+WkigrrI0FMulWe+9QBEl3
         SAY9yMawju+J7gDScgVlN6U/e+94swsZCKRw1NwlZlkSd/SWViYVFXiCz6MrHIvXd98L
         Ujfq/EUQk8YLXnUIqlaar4QuhgDHe6mM77zVrBJngPFNfAuyz62QnwphqmYDz9aJp7ir
         nPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026134; x=1795630934;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbvVNrqGe63WaCDhQx3Sv7CZ2HUvzt7iMpy1FWtb+xE=;
        b=IOtMDHHbQZtmHOKUVeWDEnc5jad0J5w03qYsb0vApEpA4GIsHcgdC2EkG2ev7qyfes
         74bsWWmK/02Pxxf/RJY7aSO5bNo11vgrLd6aaXHhunZfGGHgF9pbEue2wWxkQfokHZOI
         3zsdS9KOURwqm6RnSkULTUaGGnxh03wrE7j203ZVKJ9zJjusN1XS3B/47D68LArqEmd/
         PRNEjqmodjZkxSsb/uhqjwiqhocjVqovxziE6E9xu1OeCO8WFfTXpL5e2JMEPDSkR0bE
         23rim5HzzAHUCiwkgakYhgY9+0ztu4DeAxCLRZUps3qik4ZUvtwsQmIGWDhypfZ6Zd3n
         pYrg==
X-Gm-Message-State: APuU4Z+rk2xQkTQ7HYNlo9fTNl88zEDq9DmAYdU0jA8LL94/DRMBOH+p
	geRcQbknrpo3WyA0g7SQ68D70oVRLz9TGyh9z7QlbNE5Wk75NWTPR6q4a+W6U5+Q08gTtVT9KA=
	=
X-Received: from wmcq6.prod.google.com ([2002:a05:600c:c106:b0:4a1:b721:2a42])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a55:b0:4b1:2026:6b41
 with SMTP id 5b1f17b1804b1-4bb7da2bd37mr65014595e9.30.1795026134131; Wed, 18
 Nov 2026 10:22:14 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:22 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3432; i=ardb@kernel.org;
 h=from:subject; bh=JdUM/iQUeD0oJbWCV6TTeOpr5VeNWaZWfcnI9fEnIyM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvmxVzhTeaiPgdOv59tuORKzfu67fZ8M+NyVqZmvl2/
 pKvPjJqHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiNlwM/1Mt+iTFuloPxcy6
 5OZ/+M3kr+/VedYcu87aXuZXUfdcxISR4S3DKTM1X/aMueVnPD/f6Joxs3mJt/nLR5sn3pZ2avr JzgIA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-37-ardb+git@google.com>
Subject: [PATCH v4 16/19] efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102218_276858_BA0692B2 
X-CRM114-Status: GOOD (  11.43  )
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
2.56.1.708.g77570a6a1d-goog


