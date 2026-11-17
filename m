Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580A7606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D5HvVvpn;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yy3B8Yrg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SPtU4gBLJNhzXhU+p7KA/8zxvWXAMb/nxa3idf+KgvI=; b=D5HvVvpnsI14cnSP+YwIENXDpX
	DKmyPKR3N7huddp++xX2AWUd6T9q/AywG8ndTPwsSrtaP2JFFwq0wwqIFoC2KhXX4XsetctCGeS+t
	9vwIjHDcfVYIfc+rgNmdwIuFZzqrT5U87qdfUVZoF8lQ60ZM+h8j2TKqZm5PndjG3T04foYKasWGJ
	AtzoelWce+09zD+9RExDiAD/n7Eauud7LbBQKKDRpCXwC5eCK+TYqouSygyJbIAoXR01QuakLuzED
	RwGuNg60SOWF2BWEuH4PJOLH0BTfLSWiVWUgBOz9ltV3g7qYQ0TdVvBcUHQgmqQ1JX9L7ReZ/QcZl
	eiRIDC/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEx-00000006eUS-256n;
	Tue, 17 Nov 2026 17:45:07 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEO-00000006dxz-3DfW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:33 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-49166c8a60dso16325f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937470; x=1795542270; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPtU4gBLJNhzXhU+p7KA/8zxvWXAMb/nxa3idf+KgvI=;
        b=Yy3B8YrgI9HgGwvvjpQkbUuBkfLfnXxZJnLB6qSYn6D/6PJw9EI036FS5zPE5Hdi5c
         RSuIJjHu+BOw9AvrkMq4P8445/Iiv872QOB+OE4o1vcvulcAixe5Grhabbwyl5GKdcKl
         iBupagEzMITCpRosBzKDehINv/Wy2vF1sXAQ8Az71WtC20GtUl8PQABzFEV1IkRM57I5
         wfZ/AawUkm15TWFfMBvVH1X1JZz7EHE/fAaj6b53rQuYNkiFoxoGQN2u7reiMnURtHNw
         RKwdoAx7rLopKv71Am47P0nkFU2ScEAyvEY7mdZblFxP9wiSgo8a5AfLC8UBzLNp5bXd
         Onvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937470; x=1795542270;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPtU4gBLJNhzXhU+p7KA/8zxvWXAMb/nxa3idf+KgvI=;
        b=0oPOtOWe3zaRdNZOxRJ33FveUR9z+MgGjkt1qOgYCEWBR0gFR/BD3MAqbOwdrT/ES9
         8qT8VUgFbotV57Z/lwrSWdbdEIm9HitkK82J9TaEYPqhFXhCktIgbrM6NcFawSMmkY47
         ZNcJixC2JvhgegVo6jPV2X8pjRhsr5NbjMTQ5qKqeZVyVuwsCYlFglfyxHEQEXjQkT5B
         hQPEyUY9VsyMsZMjr5Q0c25HkAeLyuJtgswSuWVatP5YkFEn2dEThAi+GtbhNRDtQiTm
         D7kTovF6CIAcdZYmie4fNF2hQ0Uc4B73i7NZ/4c31gWjdHD2RWnaqrPch7/NSIT3EgCI
         RHUg==
X-Forwarded-Encrypted: i=1; AL+hErGnTrCDrlzXXqmCV2qSiOQIRDQPoLV1U5Po1LkE8vrS2stIaRABgh8aqyVTbKS2t0HDT+BUlVLb6QIYyKfAQacJ@lists.infradead.org
X-Gm-Message-State: APuU4Z9uFa9v0Qufrf2JLhOL0Y2wMPA7Dexyh5l+1NNOeXZjzmow8u/e
	VrG0yzDQXQzJp+8tnPjhd6jH4m4JhhiODm1oNc1qmNItWY/Vgc43uLH2QObhTvqye69lediIwYn
	a7trOIplI0felN0/Njvmwjg==
X-Received: from wmbz23.prod.google.com ([2002:a05:600c:c097:b0:4b6:fd58:3209])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3509:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb559f2cc3mr299925375e9.2.1794937470147;
 Tue, 17 Nov 2026 09:44:30 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:51 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-13-vdonnefort@google.com>
Subject: [PATCH v4 12/23] KVM: arm64: Add a range to __pkvm_guest_unshare_host()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094432_848278_51D70632 
X-CRM114-Status: GOOD (  14.32  )
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
add a nr_pages argument to the __pkvm_guest_unshare_host() hypercall.
This range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is
512 on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 22 +++++++++++--------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  2 +-
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 6741c9ecb879..3fb55899be6b 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -33,7 +33,7 @@ enum pkvm_component_id {
 int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages);
-int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
+int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages);
 int __pkvm_host_unshare_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 9183406ae04b..030bfc1155f8 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1072,31 +1072,35 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages)
 	return ret;
 }
 
-int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
+int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn, u64 nr_pages)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
-	u64 meta, phys, ipa = hyp_pfn_to_phys(gfn);
+	u64 size, meta, phys, ipa = hyp_pfn_to_phys(gfn);
 	kvm_pte_t pte;
 	int ret;
 
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &phys);
+	ret = get_valid_guest_pte(vm, ipa, size, &pte, &phys);
 	if (ret)
 		goto unlock;
 
 	ret = -EPERM;
 	if (pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte)) != PKVM_PAGE_SHARED_OWNED)
 		goto unlock;
-	if (__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED))
+	if (__host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED))
 		goto unlock;
 
 	ret = 0;
 	meta = host_stage2_encode_gfn_meta(vm, gfn);
-	WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
+	WARN_ON(host_stage2_set_owner_metadata_locked(phys, size,
 						      PKVM_ID_GUEST, meta));
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
 				       &vcpu->vcpu.arch.stage2_mc, 0));
 unlock:
@@ -1961,8 +1965,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[0] = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn);
-	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn);
+	assert_transition_res(0,	__pkvm_guest_unshare_host, vcpu, gfn, 1);
+	assert_transition_res(-EPERM,	__pkvm_guest_unshare_host, vcpu, gfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
@@ -1979,7 +1983,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn, 1);
-	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn);
+	assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn, 1);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.guest[1] = PKVM_PAGE_OWNED;
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 66d7493a6549..d92f4da1c180 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1206,7 +1206,7 @@ static void pkvm_memunshare_call(u64 *ret, struct kvm_vcpu *vcpu)
 		return;
 
 	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
-	if (!__pkvm_guest_unshare_host(hyp_vcpu, hyp_phys_to_pfn(ipa)))
+	if (!__pkvm_guest_unshare_host(hyp_vcpu, hyp_phys_to_pfn(ipa), 1))
 		ret[0] = SMCCC_RET_SUCCESS;
 }
 
-- 
2.56.1.708.g77570a6a1d-goog


