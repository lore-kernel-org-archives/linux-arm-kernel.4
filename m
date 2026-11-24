Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3DF606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JqI56ZV6;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kj3Z9ExM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x0W0lUunYQLyHPu4wXiSZmeJeLTYoziWTsHAR672YTA=; b=JqI56ZV6iqOMrEFQjFIvQQAuZe
	GqM7BIhBmEfDQ4PvRvcnVFqC4DNYZtyr26kMXkN47XnJM+0F75DYObgT414XtNsjTYnair3osvhWS
	YCpyNvCubdQeWVfDNaBgHLTgmisRIsaUq7GG4JzUxmBb6PCpwKmQauTB1SAmLB3qJZHjYqUHmjUrd
	3xybxZzLPvqEMej/tO3lJTA81AvgEa/MJVW/igNTlRhM+u2wkXCUnmpMEdc4VIUR21p1UBwhnd1uk
	SUDHBJZH8B+jVZCl1bKbsYWa5modoWUPSNREJkvQWGtPWe+xBHc/8weerWxKQxTQ56jxzKSF0OurC
	/aSEaaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVteL-00000007Atw-0Wtk;
	Tue, 24 Nov 2026 16:45:45 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdu-00000007AeP-3ZGU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:45:39 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48e1d839ddaso2635181f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 08:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538716; x=1796143516; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0W0lUunYQLyHPu4wXiSZmeJeLTYoziWTsHAR672YTA=;
        b=Kj3Z9ExMZDseaPM6eYogn0ta3uczKub4aN0NXLLEIP0JH0+aky5Ohp1bLILKAHcHH+
         ULPb4DFVUWPOCbgFMNKpHkCKFHqgzKEtEulRTj7BZ7Lu+m6VM2SxEjbQS5liTS3gh/ue
         9PDu9A+wz6ZkEUzeTXnxTaj/AV7OPfXaw1EpdVs94jopmFrCzSxrBomSor+MbP6v+7YM
         FPD49boaTvHtQM/F19eSIePPthPSxMYge4Z8bokl5le7DdrI/Z1wlfHxDjM2XdG5+VQe
         sjZMSOb/1UJ+WILhdX4lmEYfEgRtGdBx1BieCu1YwFzUmKGWlTzw3mcTp3iCalt1if2I
         YD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538716; x=1796143516;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0W0lUunYQLyHPu4wXiSZmeJeLTYoziWTsHAR672YTA=;
        b=koEsDr5UM8L3dCWF618CO7Sp1vK4G+Xjun9CjuWGcCIEfmha/aGmEmRTybLvgmvsW6
         LTe3pHvTOfWjD9Tc8lg2+fZqivTd+qa5RHWyfp4U5dcSk4l5YMgEaTDUAeY59tyKe146
         GjDjGApqc+9EebdgD5yo9hj5rRPdQAvBPGyadNsslWuidSbHqldC7CTpby5bYU0i3Tu4
         TLm6oPqMXabxyhcPrTRyR/FZ17yh5HjRzbq53qJQpbPgzdD5kyai4QUrcdLhTQQeqjJg
         Fj6eWdHyLOfX3bY6TgjYPqWoo7342kZB4j/BZc5d6ocSXsnHJOtMb4JIFxlvxO1u6Siq
         z9gw==
X-Gm-Message-State: APuU4Z9bftJ/9nCStz5/Ev9u/Z9Ik4IlBdc6qk8auP9etW71lLp+LxUu
	GBx8Hs7W0lzTBGkazKJqZNjbaEJvGYcc+mdBZV/RCOwPvv0ckpVaisq0f4BnkpH+rONP94Cv/ap
	ph1U1VHIkuqXfMTLYCxv2TA==
X-Received: from wrme1.prod.google.com ([2002:adf:e381:0:b0:48e:5d2f:1d09])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1841:b0:48e:6f76:de9d with SMTP id ffacd0b85a97d-4abb4c7ac1dmr34108812f8f.46.1795538715741;
 Tue, 24 Nov 2026 08:45:15 -0800 (PST)
Date: Tue, 24 Nov 2026 16:44:45 +0000
In-Reply-To: <20261124164446.2371939-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261124164446.2371939-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124164446.2371939-5-vdonnefort@google.com>
Subject: [PATCH v2 4/5] drivers/virt: pkvm: Handle a granule larger than
 PAGE_SIZE for MMIO_GUARD
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084525_354336_9C528666 
X-CRM114-Status: GOOD (  19.14  )
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

In preparation for allowing protected VMs to run on a system where the
granule is bigger than their PAGE_SIZE, allow MMIO_GUARD requests to
overshoot.

Validate the memory regions are aligned with the hypervisor granule
before enabling the MMIO_GUARD support. If aligned, then the MMIO
regions are aligned and overshooting is safe as MMIO_GUARD is solely
here to indicate to the hypervisor where the MMIO regions are.

It is possible to add new memory regions with memory hotplug later.
However the alignment requirement is way more conservative than the
maximum granule size of 64K. Nonetheless, add a check to document the
limitation.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 51 ++++++++++++++++---
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 98b1026cf68b..3852be6bd16b 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -12,6 +12,8 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/mem_encrypt.h>
+#include <linux/memblock.h>
+#include <linux/memory.h>
 #include <linux/mm.h>
 #include <linux/pgtable.h>
 
@@ -70,17 +72,50 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	if (protval != PROT_DEVICE_nGnRE && protval != PROT_DEVICE_nGnRnE)
 		return 0;
 
-	end = PAGE_ALIGN(phys + size);
-	phys = PAGE_ALIGN_DOWN(phys);
+	/*
+	 * It is fine to overshoot MMIO_GUARD requests. Its sole purpose is to
+	 * indicate to the hypervisor where the MMIO regions are and we have
+	 * validated the alignment of the memory regions beforehand.
+	 */
+	end = ALIGN(phys + size, max(pkvm_granule, PAGE_SIZE));
+	phys = ALIGN_DOWN(phys, max(pkvm_granule, PAGE_SIZE));
 
-	while (phys < end) {
-		const int func_id = ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID;
+	WARN_ON_ONCE(arm_smccc_do_range(ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID,
+					phys, end - phys));
+	return 0;
+}
 
-		WARN_ON_ONCE(arm_smccc_do_range(func_id, phys, PAGE_SIZE));
-		phys += PAGE_SIZE;
+/*
+ * Return true if the MMIO_GUARD service is available and if overshooting is
+ * safe, which it is if the memory regions are aligned with pkvm_granule.
+ */
+static bool __init mmio_guard_available(void)
+{
+	struct memblock_region *region;
+	phys_addr_t prev_end = 0;
+
+	if (!kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
+		return false;
+
+	if (pkvm_granule <= PAGE_SIZE)
+		return true;
+
+	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG) &&
+	    pkvm_granule > memory_block_size_bytes())
+		return false;
+
+	for_each_mem_region(region) {
+		if (prev_end == region->base)
+			goto contiguous;
+
+		if (!IS_ALIGNED(prev_end | region->base, pkvm_granule))
+			return false;
+
+contiguous:
+		prev_end = region->base + region->size;
 	}
 
-	return 0;
+	return IS_ALIGNED(prev_end, pkvm_granule);
 }
 
 void __init pkvm_init_hyp_services(void)
@@ -108,7 +143,7 @@ void __init pkvm_init_hyp_services(void)
 		pr_info("pKVM: sharing memory in %zu-byte granules\n", pkvm_granule);
 	arm64_mem_crypt_ops_register(&pkvm_crypt_ops);
 
-	if (kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
+	if (mmio_guard_available())
 		arm64_ioremap_prot_hook_register(&mmio_guard_ioremap_hook);
 
 	static_branch_enable(&pkvm_guest);
-- 
2.56.1.809.ga0b61035b5-goog


