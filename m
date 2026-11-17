Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5009D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r+E3KZfP;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Iz5aPOiM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tmN/M/QekUfJnfG4ShuTgryuduS0vg7vD+ds6Vg/JrU=; b=r+E3KZfP0JRY15aKibdP+JHEtA
	Flbn/1Qjf3rQk821YLEPnyVtqOr8QIQSDK0MV/AESwrU1Fl7eAOePY60NRzPi9WreBRJRfzYYBchG
	90kTAfnoGDk1oAbT/nNs63VWEsL7nWC9irduXO2FpT5v9wnLqFyi8x58tOaWXCEt87AnODJxV4jYc
	0FnY1hC5jjchDmHB4pqMbfoNN/gltlc4spxAvH/700tg2rDUDNAe26XTCAd6XyeCH22CkvK6SCHaU
	vpBdesh/jcIAnHzZi35QqHHMCekMmcE5w5Niqxcjyr5n7ZExpqT21vlOEzVwkGTNIH1bmAw8KRmCF
	92L+A9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEy-00000006eVl-1a8l;
	Tue, 17 Nov 2026 17:45:08 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEP-00000006dyu-48tb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:35 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c50b170ec5aso351285866b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937471; x=1795542271; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmN/M/QekUfJnfG4ShuTgryuduS0vg7vD+ds6Vg/JrU=;
        b=Iz5aPOiMeITIj6jg3sFqPH2oxYmLxFCayojnx914BvI7yo2Dx5tiKjFNvGN8c0jNQw
         HebUN/l3uTLdaGa+FTQ1c0bMjbXIUgqyt1P6cDdgDR1Bdol1dwrSlrK8lacSCyDI13iS
         5hjfC8g3Uzms70V1305SuJ9viPGhYK9xHGYKBixNmFSrU1j3PTLMwx8Y4P1LzoN7E6eB
         /ejpK6nifK7d/2os9Dh8uyRnWlEXPk+FiADpJcKbK0tdI61xwvLONlQwwqQqCHj+xgRA
         Up3Mw+iUt9d6XgwiBmxfwPH0uAh11V5sbdOg0H/9BnMrbpFqMCcG/7JNPWh58HqE4sgW
         obaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937471; x=1795542271;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmN/M/QekUfJnfG4ShuTgryuduS0vg7vD+ds6Vg/JrU=;
        b=OAZqTwG1nVTyIfZw9Lni75voWDux+61rSAUgGo8lDa8StgUMXAHlZsFrvn7DbUrQhV
         wN31UdyZknd0HYNmBOLM/QFVH1/Uw3sdgCkYRfNN5r+NWU0xeJL/ItIF0PNe/PntLhiA
         yyS39idGAu7mxZNp/6FoA3ub96kgchdjhgyI/4tRDTIhn0xJOf8REkPpji7FvZxYPnEI
         4C+uEKr/mWp2CPgWEvr+cny23ILj2g1yhLy3QbGAKnYUQq5nxvNzauqUC3m59F718PLp
         hZr0QpzzOHn2H2lRZC9021wAPWEVJ4azkon8wQJFdlQmdQmifCuRcvxw0eWHGexaqEB5
         aw4Q==
X-Forwarded-Encrypted: i=1; AL+hErERwrghfLW8OI8OWXDOchpuVLEH7sbSz3lX0wQJxz/uNIwZJEgEAju2yfg+LvfBtxGiJqqAxkOV/R+6nvUpzPYv@lists.infradead.org
X-Gm-Message-State: APuU4Z+3jaJ68gM+7nHxUGAAfszSFP3pEqAkkIpahAYU6El8ZklxVLQb
	yb+ZQGWWcPPM9M0Lt2tMpg0XoP+LeAcMhcJC/SOz9uBhTbimct/ssfDMj9omVxW9ayWLFkRAORN
	tzcmNrzaeGyiBiW7WJ1Te9Q==
X-Received: from ejdr16.prod.google.com ([2002:a17:906:38d0:b0:c3f:75a:4837])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:99c4:b0:c37:8c7c:a840 with SMTP id a640c23a62f3a-c510e1ee112mr1487066b.18.1794937471141;
 Tue, 17 Nov 2026 09:44:31 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:52 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-14-vdonnefort@google.com>
Subject: [PATCH v4 13/23] KVM: arm64: Handle huge mappings in __pkvm_host_force_reclaim_page_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094434_459297_2FD743B1 
X-CRM114-Status: GOOD (  15.69  )
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

In preparation for supporting stage-2 huge mappings for protected VMs,
allow __pkvm_host_force_reclaim_page_guest() to work with PMD_SIZE
mappings.  As this HVC is called from a non-preemptible context, it is
not possible to rely on the host pkvm_mappings tree to get the mapping
size. Instead, use the actual host stage-2 mapping size and compare it
with the guest stage-2.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 33 +++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 030bfc1155f8..68ed886e294e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1340,7 +1340,7 @@ static void hyp_poison_range(phys_addr_t phys, u64 size)
 	__apply_guest_page(__hyp_va(phys), size, __hyp_poison_page);
 }
 
-static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
+static int host_stage2_get_guest_info(phys_addr_t phys, u64 *size, struct pkvm_hyp_vm **vm,
 				      u64 *gfn)
 {
 	enum pkvm_page_state state;
@@ -1368,34 +1368,43 @@ static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
 	if (ret)
 		return ret;
 
-	if (WARN_ON(level != KVM_PGTABLE_LAST_LEVEL))
-		return -EINVAL;
+	/* We only support either PAGE_SIZE or PMD_SIZE */
+	if (level < KVM_PGTABLE_LAST_LEVEL - 1)
+		return -E2BIG;
 
-	return host_stage2_decode_gfn_meta(pte, vm, gfn);
+	ret = host_stage2_decode_gfn_meta(pte, vm, gfn);
+	if (ret)
+		return ret;
+
+	*size = kvm_granule_size(level);
+
+	return 0;
 }
 
 int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 {
+	u64 gfn, ipa, pa, size;
 	struct pkvm_hyp_vm *vm;
-	u64 gfn, ipa, pa;
 	kvm_pte_t pte;
 	int ret;
 
-	phys &= PAGE_MASK;
-
 	hyp_spin_lock(&vm_table_lock);
 	host_lock_component();
 
-	ret = host_stage2_get_guest_info(phys, &vm, &gfn);
+	ret = host_stage2_get_guest_info(phys, &size, &vm, &gfn);
 	if (ret)
 		goto unlock_host;
 
 	ipa = hyp_pfn_to_phys(gfn);
+
 	guest_lock_component(vm);
-	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &pa);
+	ret = get_valid_guest_pte(vm, ipa, size, &pte, &pa);
 	if (ret)
 		goto unlock_guest;
 
+	phys = ALIGN_DOWN(phys, size);
+	pa = ALIGN_DOWN(pa, size);
+
 	WARN_ON(pa != phys);
 	if (guest_get_page_state(pte, ipa) != PKVM_PAGE_OWNED) {
 		ret = -EPERM;
@@ -1403,14 +1412,14 @@ int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 	}
 
 	/* We really shouldn't be allocating, so don't pass a memcache */
-	ret = kvm_pgtable_stage2_annotate(&vm->pgt, ipa, PAGE_SIZE, NULL,
+	ret = kvm_pgtable_stage2_annotate(&vm->pgt, ipa, size, NULL,
 					  KVM_GUEST_INVALID_PTE_TYPE_POISONED,
 					  0);
 	if (ret)
 		goto unlock_guest;
 
-	hyp_poison_range(phys, PAGE_SIZE);
-	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HOST));
+	hyp_poison_range(phys, size);
+	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HOST));
 unlock_guest:
 	guest_unlock_component(vm);
 unlock_host:
-- 
2.56.1.708.g77570a6a1d-goog


