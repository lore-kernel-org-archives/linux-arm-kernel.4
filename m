Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F99606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mREVpeN4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ZOl59z23;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NCYXhsjk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=by0iiR0FmpORjCFtMsoAirkpYQWXRnrV8zvJq/f2IKQ=; b=mREVpeN4pEa0cUWjocYRELQGoM
	t4oXBt608FoLNx2LwuLiITKneWW39VRs2hPBz4xZlgleXKP3CwjJIi53xqL9XgI1E6b0JBn7le3YI
	ngaM6PovU4W2Ns2cNG7YVBy4lp9DTDLlwwyHE0bxIao5iuXuE/LocZsChBR/Ch1ON2KHaMrWKrc1T
	vCC9qwFVhanLAvSGteLM1NX3x24sVYRzTjmIzBqj9Adg0tPbcmvzPrq9cKgN45Cn8mI6GNozy0LnR
	7qzl/+fKljeWuH3j+XLJqWGPcsoBPdW79WW5UF0SAb6uaJr2MIfMqrsoLn5/1Z67RhYibkrDrFQ0O
	lBoFQYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVteK-00000007AtF-2zWX;
	Tue, 24 Nov 2026 16:45:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVte2-00000007AhE-28fZ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=by0iiR0FmpORjCFtMsoAirkpYQWXRnrV8zvJq/f2IKQ=; b=ZOl59z23kFFb/sLrxXxo2jaeak
	MRYRaEYEO0t0UamOeRczWE2LrYIvm9uvk1XTr2iF8wJPH3wyWzYWrGPMSXu3raH6TfVr8dwo38LQx
	y2hZ70KwteOA36Y/Cc0f4xZwc0/Faa8MVgnONWKDBz/Fe43F/IwB5qNrNXslEbwlhoEyewp2+b1qJ
	IzlqXYnJHKvaNEN+SnsejXSrA/qSBs1n4K/7bctPaFQLQeS7nL23JEXouJcm095EJo/Pi1QGg3ogl
	mU7wvxx6/K+3LcBnJfUejRICa17UCy4OyIu0W5D3aUC6iqktWnJ4UmvCl9XopPyBmfcg3y+w2D1xn
	n6kUi7pw==;
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdu-00000009DiT-14kf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:45:25 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-499ca65ae87so2047314f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 08:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538716; x=1796143516; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=by0iiR0FmpORjCFtMsoAirkpYQWXRnrV8zvJq/f2IKQ=;
        b=NCYXhsjkPadf8U20NEU4YBBEvPCewLnVyREqJhaOSOnrdCec6jTHINggmPbVTakfO9
         IkV457KARHhtDP1eYvKpFDIvc481YZRCAQAUA0spM7n1WL3HsnV58Z/UC7w4Dc/wX4yr
         Wk+7so+/N2bfCVOCx/K19dqTGPfgIuiuGujhB7rMaQTebJCNWuba5kLY/vzs8BKA7zCV
         PJC2FcYrVjnxBlHcuyZUG2inuO2dt9UOyUVGZKbW+qA+ZRPv+fPXV/7ZvEhNVhzZJTwo
         H8BKiY7kuWr/Ih5PYUwSz5rytoEAkiRM91G2lLkaQu1jjQ2ds00A2GraEQtRGt+uYi4e
         w3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538716; x=1796143516;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=by0iiR0FmpORjCFtMsoAirkpYQWXRnrV8zvJq/f2IKQ=;
        b=IaVFcgG0Rqxp1hQPxb63TpT1Qv6eHY4nkR4U4D5/QAHysr3Sel+xOEbjaj9bIpo4uc
         OzoOIQUhODZONpDBdfi1jjnCT+RlRYRbBlvT5Inj2e9sRDblEFkzbdtx5B1MxJjRt00V
         vSzsLahFKpw15QUA7l3gq0tcRN+VvywUHXrXOMqf3cym4V4ZNuPAnrBCx8PH64PJcBRX
         sBSSqrmuNtUCbci9zLFHmKauz9lTOEuyVBYsokLKFFoTxU2fAvj6gFKdavLc4mGb8we6
         qxWJvhIGobcndVsF3sl8od78ZBCDN9osKevYJBMfozcnxo+O3udpqzKvURh56LSi0Eao
         hIFQ==
X-Gm-Message-State: APuU4Z+j1+fLZX10epder1flHS+jh8ov8w+qsyiRlCmGZvQ2J4EBsjcH
	RU9Fp65BRqC+TRXZMJ4HB1UNGZCtq6Z/qJnSSnnp0461v5KhCvWHwiNLkgP+UNlN9byMztztp1K
	F2Xo89wJOfMYeO5A2Gm8ofQ==
X-Received: from wrty9.prod.google.com ([2002:a5d:6149:0:b0:48d:ee00:f39d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2681:b0:4a7:dcc2:a36f with SMTP id ffacd0b85a97d-4aa5a2dc7bfmr42491230f8f.26.1795538713310;
 Tue, 24 Nov 2026 08:45:13 -0800 (PST)
Date: Tue, 24 Nov 2026 16:44:44 +0000
In-Reply-To: <20261124164446.2371939-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261124164446.2371939-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124164446.2371939-4-vdonnefort@google.com>
Subject: [PATCH v2 3/5] drivers/virt: pkvm: Handle a granule larger than
 PAGE_SIZE for MEM_SHARE
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_164518_481968_7435ABAF 
X-CRM114-Status: GOOD (  13.55  )
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

From: Fuad Tabba <fuad.tabba@linux.dev>

In preparation for allowing protected VMs to run on a system where the
granule is bigger than their PAGE_SIZE, allow the encryption/decryption
callbacks to work with the hypervisor granule increment instead of
PAGE_SIZE.

Reject requests which are not aligned with the granule.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Co-developed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 42 +++++++------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index fbcb57c31186..98b1026cf68b 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -20,35 +20,19 @@
 static size_t __ro_after_init pkvm_granule;
 DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
 
-static int arm_smccc_do_one_page(u32 func_id, phys_addr_t phys)
+static int arm_smccc_do_range(u32 func_id, phys_addr_t phys, size_t size)
 {
-	phys_addr_t end = phys + PAGE_SIZE;
+	phys_addr_t end = phys + size;
 
-	while (phys < end) {
+	if (!IS_ALIGNED(phys | size, pkvm_granule))
+		return -EINVAL;
+
+	for (; phys < end; phys += pkvm_granule) {
 		struct arm_smccc_res res;
 
 		arm_smccc_1_1_invoke(func_id, phys, 0, 0, &res);
 		if (res.a0 != SMCCC_RET_SUCCESS)
 			return -EPERM;
-
-		phys += pkvm_granule;
-	}
-
-	return 0;
-}
-
-static int __set_memory_range(u32 func_id, unsigned long start, int numpages)
-{
-	void *addr = (void *)start, *end = addr + numpages * PAGE_SIZE;
-
-	while (addr < end) {
-		int err;
-
-		err = arm_smccc_do_one_page(func_id, virt_to_phys(addr));
-		if (err)
-			return err;
-
-		addr += PAGE_SIZE;
 	}
 
 	return 0;
@@ -56,14 +40,16 @@ static int __set_memory_range(u32 func_id, unsigned long start, int numpages)
 
 static int pkvm_set_memory_encrypted(unsigned long addr, int numpages)
 {
-	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID,
-				  addr, numpages);
+	return arm_smccc_do_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID,
+				  virt_to_phys((void *)addr),
+				  numpages * PAGE_SIZE);
 }
 
 static int pkvm_set_memory_decrypted(unsigned long addr, int numpages)
 {
-	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
-				  addr, numpages);
+	return arm_smccc_do_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
+				  virt_to_phys((void *)addr),
+				  numpages * PAGE_SIZE);
 }
 
 static const struct arm64_mem_crypt_ops pkvm_crypt_ops = {
@@ -90,7 +76,7 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	while (phys < end) {
 		const int func_id = ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID;
 
-		WARN_ON_ONCE(arm_smccc_do_one_page(func_id, phys));
+		WARN_ON_ONCE(arm_smccc_do_range(func_id, phys, PAGE_SIZE));
 		phys += PAGE_SIZE;
 	}
 
@@ -118,6 +104,8 @@ void __init pkvm_init_hyp_services(void)
 		return;
 
 	pkvm_granule = res.a0;
+	if (pkvm_granule > PAGE_SIZE)
+		pr_info("pKVM: sharing memory in %zu-byte granules\n", pkvm_granule);
 	arm64_mem_crypt_ops_register(&pkvm_crypt_ops);
 
 	if (kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
-- 
2.56.1.809.ga0b61035b5-goog


