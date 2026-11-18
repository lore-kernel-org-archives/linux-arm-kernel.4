Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EDA60A2629
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VLnbyKeT;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IF/hsisT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IEeaARdatv0A7mhpnidkLGUlVtXUnSTDUsZkbCqBIIw=; b=VLnbyKeTenHhvS4Wu6wOG7f0J3
	YLJoQ2/DEu/5/QRiOrMZsQij0bTzU825f3U5g6GKNXygGjpG4ycG2Iu2gEXanP7uLzwEV5gGiv3lY
	wLhXOLQpQQvX5gm4O/a/VuAy+kBqKAQms/GzqxjestENs2NPvd/6J441t1E3je/9xJSsWVhwce7KJ
	hrgDaTIzpMVQ/yvj4VJRe1xqmKBUyG7dyrEDLvyjjoExB6b2Dvh+SBW77u7e1UFCvDi5FQioTNZby
	R/5mjVJZ0sTWwhAnRQjwBJdjA6W5rcB0SslralhMaC+AWM6NmfTC+6ysXo5QJGh4kNl+RaXwzyWkg
	6qfENaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkJD-00000009uYF-2pB1;
	Wed, 18 Nov 2026 18:23:03 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIK-00000009tOn-3nKA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:10 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a2065a2ef9so12691615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026125; x=1795630925; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEeaARdatv0A7mhpnidkLGUlVtXUnSTDUsZkbCqBIIw=;
        b=IF/hsisTf5S5QkAv+/ucOw3TpmUR8pOPkWNP8wt3DRjB2XMWqOdOxFMXUCpApx+C73
         qHrt5B8EkawLijqsIVu2wxW66BGq9ordmQGkS4UBcDy9UBh/82WM4El/BeVQP9InXqH0
         +B7yZKSMp/MMsitQ6lWrrvYbGVL7adbgVzWST9mz0IX9qGzNJixEvjIe8MkJbRMgWobC
         5VwXCVJe0ysYm78Qo2O7mxRYTZFNiiIPKzkBRbaSvy1R07ZZoFtsaKZ/09oRkLKxA15g
         1AmnuUtcq6AWZIIs1ETcD+1DecK7LV+b7zAPEBU1pJegVK3thYKP/Sjs6o5TQLJ/W3dZ
         aV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026125; x=1795630925;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEeaARdatv0A7mhpnidkLGUlVtXUnSTDUsZkbCqBIIw=;
        b=mSZvCmBxmR0W4QK4yBElovz+GE/9fmrZraKGrp9PhJRJe+i6Pgw6qXPTe01fqtgoYl
         PtmZiYiu+kC03jYNDeKQ5krjvLmyXBuO7FiZUqZCGqtR0hOV9K+Dx+oGE3iPdoxfayHb
         3ESwD/elk1lBo7HBSfE2G8dHgZ405ZQ3pMOmHS/J6VBuTSFBM+EePgNEsOLMj3E9x5Kv
         yQzC7Yj1wnc2Cvn2anLQIMhPIvWNvEO9kF4oGyyhSIUE/NPfRx4k4t9xwz2l2gvhUrfI
         kjcHXGIMXPQv2s3VXSks1qxqOhWQx/9HO6v2ccP0j4cwK8qIEOZYI2TNA8XZCa/9TNH/
         fCWQ==
X-Gm-Message-State: APuU4Z/9lbSQm+Gl0Q/I5Z7DbjwqIGTim5pOgcEI9RQNyUyMVyMmyAxT
	Ozd2bD4iVYlclc8ZwE+GvsUb99K/H6GhoideHCeHrBGw7qPUJfHAp/TYjtTplL2JneQszBDZYA=
	=
X-Received: from wmsl30.prod.google.com ([2002:a05:600c:1d1e:b0:4a2:df9b:ef74])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e02:b0:4bb:6b59:aac3
 with SMTP id 5b1f17b1804b1-4bb7da44054mr69467855e9.29.1795026125277; Wed, 18
 Nov 2026 10:22:05 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:17 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4679; i=ardb@kernel.org;
 h=from:subject; bh=BY4lNS3U3HJqg99nmA1jm5uVn1J2yFNPSkQm9h6irHI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm4Wphpfm8/sXp+4V/dL0O9xUmSnwvrtj2M3pv1sN/
 9XOe3+po5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk6QmGX8xWJ/TOemt4m/Aw
 lk7+uOJa7ReJe6vtN6p/Fvh1Or37hwojw8dZU7T4rG8eFZ/mW9XoEuD1xad9vWilmfU6Dou6SLH dHAA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-32-ardb+git@google.com>
Subject: [PATCH v4 11/19] efi/libstub: Drop reserve_addr/_size params from handle_kernel_image()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102209_242695_B192C6AD 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

The reserve_addr and reserve_size variable pointers passed to
handle_kernel_image() are no longer used, so drop them from the caller
and from the prototype.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm32-stub.c     | 2 --
 drivers/firmware/efi/libstub/arm64-stub.c     | 2 --
 drivers/firmware/efi/libstub/efi-stub-entry.c | 6 ------
 drivers/firmware/efi/libstub/efistub.h        | 2 --
 drivers/firmware/efi/libstub/loongarch-stub.c | 2 --
 drivers/firmware/efi/libstub/riscv-stub.c     | 2 --
 6 files changed, 16 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm32-stub.c b/drivers/firmware/efi/libstub/arm32-stub.c
index 55d4fa3177a9..3ca20d2dd4d2 100644
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@ -86,8 +86,6 @@ struct efi_image_info efistub_image_info = {};
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index 6140def24c69..af38cf73cf01 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -15,8 +15,6 @@
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
index 36ea6aa2cfcc..a2fefe1ded05 100644
--- a/drivers/firmware/efi/libstub/efi-stub-entry.c
+++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
@@ -36,9 +36,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	efi_status_t status;
 	unsigned long image_addr;
 	unsigned long image_size = 0;
-	/* addr/point and size pairs for memory management*/
-	unsigned long reserve_addr = 0;
-	unsigned long reserve_size = 0;
 
 	WRITE_ONCE(efi_system_table, systab);
 
@@ -66,8 +63,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	efi_info("Booting Linux Kernel...\n");
 
 	status = handle_kernel_image(&image_addr, &image_size,
-				     &reserve_addr,
-				     &reserve_size,
 				     image, handle, &image_info);
 	if (status != EFI_SUCCESS) {
 		efi_err("Failed to relocate kernel\n");
@@ -77,7 +72,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	status = efi_stub_common(handle, image, image_info, cmdline_ptr);
 
 	efi_free(image_size, image_addr);
-	efi_free(reserve_size, reserve_addr);
 
 	return status;
 }
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index e45d16095247..4e6af37c4ecb 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1150,8 +1150,6 @@ struct efi_image_info {
  */
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info);
diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/firmware/efi/libstub/loongarch-stub.c
index d57e3d3557a5..8f2145bd9ad2 100644
--- a/drivers/firmware/efi/libstub/loongarch-stub.c
+++ b/drivers/firmware/efi/libstub/loongarch-stub.c
@@ -96,8 +96,6 @@ efi_status_t efi_relocate_kernel(unsigned long *image_addr,
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 840fdd63dccf..8cd0cd9b0048 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -12,8 +12,6 @@
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
-- 
2.56.1.708.g77570a6a1d-goog


