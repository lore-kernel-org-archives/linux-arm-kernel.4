Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A61606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oezDFZe1;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IudYH3Bv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pdj/gWwua67faZ4D2U9Lmc0xjhrgVYexj99mFtGF/kQ=; b=oezDFZe1b6rc7Uat/ge8QhF521
	0pBOGt8pUi7Pgz2LQKi8rzQc1bpPs+WiYvfCZIXzNaBkq6GVLkjs9tCT7qgMZYXFw3gAGJCoBSruV
	gj0ESktarjY5Yu6K5VnQzUZwG6rRZ1TYrXlxUGNYwdMQ3dMD/1m85f4FhtCm+cySsd2TcxXs6+TjO
	5tkKeCOoC3m2JDAYwXTbPTWZUWIyf5od0Xi/Aj5kDnLI8uY4+llYXhakbpQzD+NOKo7cCgtkJK9qV
	8PKI6sSxOEFQ2GXTeH2wYJ4qzmwwD9YaMLlvkvETswBRPjN3elwk6nXV+9S7FBmlsJ+8JTrAjM4CN
	KfvrUYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEv-00000006eSM-3VdM;
	Tue, 17 Nov 2026 17:45:05 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEL-00000006ds9-1qns
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:31 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-4925ef75fc4so17432f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937467; x=1795542267; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdj/gWwua67faZ4D2U9Lmc0xjhrgVYexj99mFtGF/kQ=;
        b=IudYH3Bv+9A4anxaFV0T+YawfqXcOPXs8OCiZ9viZSLY4GcM5Jmat1REe4FMd0PWgy
         6DumOMkpY9RQz99qwrEqE1WNDr7dw4s3cqKz3cpodJoMRZzu/JZf48WfTA4qvSQC2gTJ
         W+HrC0SLu50tuqA6ibhojg5XTpYHlMZ/paqOy4PjteUdPOI+loY3Mq7CmycdQRh1iPih
         GpRrjNni4oyDom3FivhEDMQVrAdtIbjIFZqq8VvapjSuyTZQ1U7/Hg7OIRMS0ZLiqh7b
         Hh5STdImItixwcriIRSpDKF+BLsPW7cutqkePO5pxG2njhC/Nk4m1t8oy4y4qxo1QeZb
         7H1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937467; x=1795542267;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdj/gWwua67faZ4D2U9Lmc0xjhrgVYexj99mFtGF/kQ=;
        b=qaTSYkbdXpL1dS9Vvfk/4CZZ10Rh1Z7cx6EHfULqYKGacBk+oluEPCiqdXiGJiJBL7
         rt1DO3Ilqj2oaA7vAZAd2xfQYJKBAvPbfpemrKkcLLt55giK4G/KVOYuSvEeCmvXB8zS
         wLtQGyKveOihzQQSBRVBLE39pLqxyVNWkMoNmgamPcHQnxUHUmZ3VOxQ0Vp5vpuuzwZh
         4poDf4sWxX901unz2+Nss8+POc9koa9ievIDsCiDgYuCOw3RbVVAQ4W2I6UoWcmd7Nf/
         22/BmmUn9lTYYrz6Hjdj9tK1dPByeZo4zKj9BF3iEJ7HexYdmMjvR47G1nLPXdse+/rd
         zmLw==
X-Forwarded-Encrypted: i=1; AL+hErGGP49OAzu1hdKdVFRppdfAmxOHzItyYin3NElROT1OOnq6W5gVw3+q82IIv1dAyRKWLMx/yf3pRG+yyl1YinE6@lists.infradead.org
X-Gm-Message-State: APuU4Z8GP4mxP8O1CU6bxl2lnAa8NEAmF0JQAQYOCcB/NnGMxrrFVwoa
	y/xramqmtP9EL2zf5x5wKsYFqTfVIXTb/lwcxUpTppF0gJkU4FwJFaSJKbYVJ2dv3xceTHpnvkS
	+r1sZhnWNgvQ7i5eulFtbjg==
X-Received: from wrxq12.prod.google.com ([2002:a05:6000:cc:b0:48b:291:b2cf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4027:b0:48e:932:aefa with SMTP id ffacd0b85a97d-4a63d2d0341mr364253f8f.26.1794937467266;
 Tue, 17 Nov 2026 09:44:27 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:49 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-11-vdonnefort@google.com>
Subject: [PATCH v4 10/23] KVM: arm64: Add a range to __pkvm_host_reclaim_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094429_627698_143693C0 
X-CRM114-Status: GOOD (  17.44  )
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
add a nr_pages argument to the __pkvm_host_reclaim_guest() hypercall.
This range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is
512 on a 4K-pages system).

Also, rename both the mem_protect function and the HVC to
__pkvm_host_reclaim_guest() as it can now operate on a range.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  2 +-
 arch/arm64/include/asm/kvm_hcall.h            |  4 +-
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  8 +--
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 58 +++++++++++--------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  4 +-
 arch/arm64/kvm/pkvm.c                         |  5 +-
 8 files changed, 49 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index ed7bd93aea1b..3efc63e1a823 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -116,7 +116,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vcpu,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_in_poison_fault,
 	__KVM_HOST_SMCCC_FUNC___pkvm_force_reclaim_guest_page,
-	__KVM_HOST_SMCCC_FUNC___pkvm_reclaim_dying_guest_page,
+	__KVM_HOST_SMCCC_FUNC___pkvm_reclaim_dying_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_start_teardown_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_finalize_teardown_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
index c47ee2653110..201d58907109 100644
--- a/arch/arm64/include/asm/kvm_hcall.h
+++ b/arch/arm64/include/asm/kvm_hcall.h
@@ -244,8 +244,8 @@ DECLARE_KVM_HOST_HCALL(int, __pkvm_init_vcpu,
 DECLARE_KVM_HOST_HCALL0(int, __pkvm_vcpu_in_poison_fault)
 DECLARE_KVM_HOST_HCALL(int, __pkvm_force_reclaim_guest_page,
 	phys_addr_t, phys)
-DECLARE_KVM_HOST_HCALL(int, __pkvm_reclaim_dying_guest_page,
-	pkvm_handle_t, handle, u64, gfn)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_reclaim_dying_guest,
+	pkvm_handle_t, handle, u64, gfn, u64, nr_pages)
 DECLARE_KVM_HOST_HCALL(int, __pkvm_start_teardown_vm,
 	pkvm_handle_t, handle)
 DECLARE_KVM_HOST_HCALL(int, __pkvm_finalize_teardown_vm,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index b04cedaf4ec6..b05b0bcc3f2d 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -42,7 +42,7 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_donate_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu);
 int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu);
 int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys);
-int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm);
+int __pkvm_host_reclaim_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index aa5cf5568504..b79567a5fe44 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -111,7 +111,7 @@ void __pkvm_unreserve_vm(pkvm_handle_t handle);
 int __pkvm_init_vm(struct kvm *host_kvm, void __kern *pgd_hva);
 int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu);
 
-int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn);
+int __pkvm_reclaim_dying_guest(pkvm_handle_t handle, u64 gfn, u64 nr_pages);
 int __pkvm_start_teardown_vm(pkvm_handle_t handle);
 int __pkvm_finalize_teardown_vm(pkvm_handle_t handle);
 
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 4f420718ca6a..2621a4ef7e1e 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -1360,10 +1360,10 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_force_reclaim_guest_page,
 	return __pkvm_host_force_reclaim_page_guest(phys);
 }
 
-DEFINE_KVM_HOST_HCALL(int, __pkvm_reclaim_dying_guest_page,
-	pkvm_handle_t, handle, u64, gfn)
+DEFINE_KVM_HOST_HCALL(int, __pkvm_reclaim_dying_guest,
+	pkvm_handle_t, handle, u64, gfn, u64, nr_pages)
 {
-	return __pkvm_reclaim_dying_guest_page(handle, gfn);
+	return __pkvm_reclaim_dying_guest(handle, gfn, nr_pages);
 }
 
 DEFINE_KVM_HOST_HCALL(int, __pkvm_start_teardown_vm,
@@ -1603,7 +1603,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_init_vcpu),
 	HANDLE_FUNC(__pkvm_vcpu_in_poison_fault),
 	HANDLE_FUNC(__pkvm_force_reclaim_guest_page),
-	HANDLE_FUNC(__pkvm_reclaim_dying_guest_page),
+	HANDLE_FUNC(__pkvm_reclaim_dying_guest),
 	HANDLE_FUNC(__pkvm_start_teardown_vm),
 	HANDLE_FUNC(__pkvm_finalize_teardown_vm),
 	HANDLE_FUNC(__pkvm_vcpu_load),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index f2a9af6bda77..d5dcfbb59b7c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -921,7 +921,8 @@ static int __guest_check_page_state_range(struct pkvm_hyp_vm *vm, u64 addr,
 	return check_page_state_range(&vm->pgt, addr, size, &d);
 }
 
-static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, kvm_pte_t *ptep, u64 *physp)
+static int __get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa,
+				 kvm_pte_t *ptep, u64 *physp, s8 *levelp)
 {
 	kvm_pte_t pte;
 	u64 phys;
@@ -935,20 +936,32 @@ static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, kvm_pte_t *ptep,
 		return -EHWPOISON;
 	if (!kvm_pte_valid(pte))
 		return -ENOENT;
-	if (level != KVM_PGTABLE_LAST_LEVEL)
-		return -E2BIG;
 
 	phys = kvm_pte_to_phys(pte);
-	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
+	ret = check_range_allowed_memory(phys, phys + kvm_granule_size(level));
 	if (WARN_ON(ret))
 		return ret;
 
 	*ptep = pte;
 	*physp = phys;
+	*levelp = level;
 
 	return 0;
 }
 
+static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, u64 size,
+			       kvm_pte_t *ptep, u64 *physp)
+{
+	s8 level;
+	int ret;
+
+	ret = __get_valid_guest_pte(vm, ipa, ptep, physp, &level);
+	if (ret)
+		return ret;
+
+	return kvm_granule_size(level) == size ? 0 : -E2BIG;
+}
+
 int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
@@ -1031,7 +1044,7 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = get_valid_guest_pte(vm, ipa, &pte, &phys);
+	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &phys);
 	if (ret)
 		goto unlock;
 
@@ -1063,7 +1076,7 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = get_valid_guest_pte(vm, ipa, &pte, &phys);
+	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &phys);
 	if (ret)
 		goto unlock;
 
@@ -1369,7 +1382,7 @@ int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 
 	ipa = hyp_pfn_to_phys(gfn);
 	guest_lock_component(vm);
-	ret = get_valid_guest_pte(vm, ipa, &pte, &pa);
+	ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &pa);
 	if (ret)
 		goto unlock_guest;
 
@@ -1397,35 +1410,40 @@ int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 	return ret;
 }
 
-int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm)
+int __pkvm_host_reclaim_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 {
 	u64 ipa = hyp_pfn_to_phys(gfn);
 	kvm_pte_t pte;
 	u64 phys;
+	u64 size;
 	int ret;
 
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = get_valid_guest_pte(vm, ipa, &pte, &phys);
+	ret = get_valid_guest_pte(vm, ipa, size, &pte, &phys);
 	if (ret)
 		goto unlock;
 
 	switch (guest_get_page_state(pte, ipa)) {
 	case PKVM_PAGE_OWNED:
-		WARN_ON(__host_check_page_state_range(phys, PAGE_SIZE, PKVM_NOPAGE));
-		hyp_poison_range(phys, PAGE_SIZE);
+		WARN_ON(__host_check_page_state_range(phys, size, PKVM_NOPAGE));
+		hyp_poison_range(phys, size);
 		break;
 	case PKVM_PAGE_SHARED_OWNED:
-		WARN_ON(__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
+		WARN_ON(__host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED));
 		break;
 	default:
 		ret = -EPERM;
 		goto unlock;
 	}
 
-	WARN_ON(kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE));
-	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HOST));
+	WARN_ON(kvm_pgtable_stage2_unmap(&vm->pgt, ipa, size));
+	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HOST));
 
 unlock:
 	guest_unlock_component(vm);
@@ -1578,11 +1596,10 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 	s8 level;
 	int ret;
 
-	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level, 0);
+	ret = __get_valid_guest_pte(vm, ipa, &pte, &phys, &level);
 	if (ret)
 		return ret;
-	if (!kvm_pte_valid(pte))
-		return -ENOENT;
+
 	if (size && kvm_granule_size(level) != size)
 		return -E2BIG;
 
@@ -1593,11 +1610,6 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 	if (state != PKVM_PAGE_SHARED_BORROWED)
 		return -EPERM;
 
-	phys = kvm_pte_to_phys(pte);
-	ret = check_range_allowed_memory(phys, phys + size);
-	if (WARN_ON(ret))
-		return ret;
-
 	for_each_hyp_page(page, phys, size) {
 		if (get_host_state(page) != PKVM_PAGE_SHARED_OWNED)
 			return -EPERM;
@@ -1969,7 +1981,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.guest[1] = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_reclaim_page_guest, gfn + 1, vm);
+	assert_transition_res(0,	__pkvm_host_reclaim_guest, gfn + 1, 1, vm);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index ae34c09f1f39..2a73e63e8f81 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1042,7 +1042,7 @@ int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu)
 	return ret;
 }
 
-int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn)
+int __pkvm_reclaim_dying_guest(pkvm_handle_t handle, u64 gfn, u64 nr_pages)
 {
 	struct pkvm_hyp_vm *hyp_vm = get_pkvm_hyp_vm(handle);
 	int ret = -EINVAL;
@@ -1051,7 +1051,7 @@ int __pkvm_reclaim_dying_guest_page(pkvm_handle_t handle, u64 gfn)
 		return ret;
 
 	if (hyp_vm->kvm.arch.pkvm.is_dying)
-		ret = __pkvm_host_reclaim_page_guest(gfn, hyp_vm);
+		ret = __pkvm_host_reclaim_guest(gfn, nr_pages, hyp_vm);
 
 	put_pkvm_hyp_vm(hyp_vm);
 	return ret;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index d1acdca0254f..4c80e0960154 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -498,8 +498,9 @@ static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
 		struct page *page;
 
-		ret = kvm_call_hyp_nvhe(__pkvm_reclaim_dying_guest_page,
-					handle, mapping->gfn);
+		ret = kvm_call_hyp_nvhe(__pkvm_reclaim_dying_guest,
+					handle, mapping->gfn,
+					(u64)mapping->nr_pages);
 		if (WARN_ON(ret))
 			continue;
 
-- 
2.56.1.708.g77570a6a1d-goog


