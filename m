Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430C9606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bYdVniRw;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dCZS3K8h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vPvX/ht4pBJqftClHYRwuIyyxHqkO02bFtcdw128LA8=; b=bYdVniRwRpX8QbyJ9HoZaJR16L
	uEuWRP0TKQDZ0NfrLvsTcWnY0bdSJuSK0qLiubh/6ufrPwUt3uxLLaKGToUsWoczW00f6A68BvjGv
	77TgVkUHmxFpKIh0gaqBEwIo374lcO/H7Fhn+S7zoJbJmKTux3ZyQkXKAF+XWOBjatqFKiVg5kKQi
	MIRlbR2OVG9131v6UffZs1+mMeMrQVHPC3h2GOsu+NhvbcJMMEKd8vQhQp4RHppfGCt4233b4MO10
	iWA/Axych6gjtY8bshJLLLJQZxGeu4priNCTx13brzLwXVUx1S0TrXn2As98blxBlrhzebirOzwHl
	7DBplzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNF2-00000006eeA-25mX;
	Tue, 17 Nov 2026 17:45:12 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEW-00000006e7u-0RAo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:41 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so1951355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937478; x=1795542278; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPvX/ht4pBJqftClHYRwuIyyxHqkO02bFtcdw128LA8=;
        b=dCZS3K8hz7iO35AaK+hrz0F0st3bCUSjnyw+v+1oEdOqWbsC8cXg5y9nbOgtOjdcNg
         RuKeyd9P8D0JmpKbS1UyViK0VeiwV/O70ZyaBvXuei2hvEbN2TEdJHlMtfP+FQAQQjLf
         Ib+WFzqf5CtgLi6eiZ4AoG9QwZEKg+OVp57mUxRcqYyxMln90yOFa6X/4GDwHziEGBZn
         Z25jbx8rURAmUIqFx8rtlTPNEb/rmWus0l8TXgGl8lVOQ6KO5fyzdEzKryrokldGlDKb
         YVR/9EOu7HenfqB8H6gNIpV7K3a4WC96uJmIT6TulbQkJ5uG0uarP2I2GwMJeC+SEZr/
         5yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937478; x=1795542278;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vPvX/ht4pBJqftClHYRwuIyyxHqkO02bFtcdw128LA8=;
        b=HnxMpGBIYrERTqJSxWBTXoxvy2FSkQ0EY/Cb/LqMqExrNb6QOuLEkWgDXvtI/Q0YjP
         ZkWPF/a83V0shcEjEi6o+3CnPQNoEUSDYxeTfgw/MeAvPNSgMPVUGdql1TzLxp6yeqzF
         aaM3L3rZ0c3g/r0NuEFRqKtN5U+F//9Mw0X6IN+UCwFqIBIqNrCSOjVgtbpvYYmMdCPF
         eJYIPS7gslMSIlsaWwfahy1xbRrJOfs47hgOC7F1Y0a/wrVHDQw7Vbq9Sv8wJdu3aeC3
         6WZU8XGD+kvY6tNYD5ZlJ1yK5EX+6C6gw+BvdGNLviG7cnx94hIy+V9FSyGSWbEmcz4V
         VUYw==
X-Forwarded-Encrypted: i=1; AL+hErH09HcsEIFfoTLQ03PNAkbucsGVn9v3JRNttS9+iS4V5H57VZqTPdi36kRwjK8VzZ5rYbb1NLyfksOb5se7AOdL@lists.infradead.org
X-Gm-Message-State: APuU4Z8rJJIwHNemkHO7JYu9rAA2ywVndKUpDjDVC4JN/EFK+KGjyDk0
	50xj9m+vQnmlnE/njncrsMpBG/4PnmH5jkZltZ8huYxnrAfDJO3wa8ZdlHDkltY4kb3bcY0CISb
	i9uGjinURhGTISyApD2HSIg==
X-Received: from wmcq3.prod.google.com ([2002:a05:600c:c103:b0:4bb:7ad9:3047])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:e555:10b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4bb55a4e55emr218858865e9.17.1794937477736;
 Tue, 17 Nov 2026 09:44:37 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:58 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-20-vdonnefort@google.com>
Subject: [PATCH v4 19/23] KVM: arm64: Add __pkvm_host_split_guest HVC
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094440_238724_46704982 
X-CRM114-Status: GOOD (  18.15  )
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

This HVC allows the host to break an existing block in a protected VM. This
will later allow the guest to share a sub-region of an existing
huge-mapping with the host.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |   1 +
 arch/arm64/include/asm/kvm_hcall.h            |   2 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  18 +++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 127 ++++++++++++++++--
 5 files changed, 136 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 872185f9ac53..9efbd3b50901 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -112,6 +112,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_mkyoung_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_split_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_reserve_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_unreserve_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
index e54a4631a378..94eecb24d2c5 100644
--- a/arch/arm64/include/asm/kvm_hcall.h
+++ b/arch/arm64/include/asm/kvm_hcall.h
@@ -234,6 +234,8 @@ DECLARE_KVM_HOST_HCALL(int, __pkvm_host_test_clear_young_guest,
 	pkvm_handle_t, handle, u64, gfn, u64, nr_pages, bool, mkold)
 DECLARE_KVM_HOST_HCALL(int, __pkvm_host_mkyoung_guest,
 	u64, gfn)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_host_split_guest,
+	u64, gfn, u64, nr_pages)
 DECLARE_KVM_HOST_HCALL0(int, __pkvm_reserve_vm)
 DECLARE_KVM_HOST_HCALL(void, __pkvm_unreserve_vm,
 	pkvm_handle_t, handle)
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index a991be3d4c9a..c82b1d6352d5 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -50,6 +50,7 @@ int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_
 int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct pkvm_hyp_vm *vm);
 int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
+int __pkvm_host_split_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu);
 
 bool addr_is_memory(phys_addr_t phys);
 bool addr_is_hyp_text(phys_addr_t phys);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 41817f45115d..e7b798253dc3 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -1072,6 +1072,23 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_host_mkyoung_guest,
 	return __pkvm_host_mkyoung_guest(gfn, hyp_vcpu);
 }
 
+DEFINE_KVM_HOST_HCALL(int, __pkvm_host_split_guest,
+	u64, gfn, u64, nr_pages)
+{
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	int ret;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (!hyp_vcpu || !pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		return -EINVAL;
+
+	ret = pkvm_refill_memcache(hyp_vcpu);
+	if (ret)
+		return ret;
+
+	return __pkvm_host_split_guest(gfn, nr_pages, hyp_vcpu);
+}
+
 /*
  * PKVM_HOST_STATE_DIRTY names the authoritative copy, the host's when set.
  * A loaded protected vCPU takes the request at its next entry instead.
@@ -1599,6 +1616,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
 	HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
 	HANDLE_FUNC(__pkvm_host_mkyoung_guest),
+	HANDLE_FUNC(__pkvm_host_split_guest),
 	HANDLE_FUNC(__pkvm_reserve_vm),
 	HANDLE_FUNC(__pkvm_unreserve_vm),
 	HANDLE_FUNC(__pkvm_init_vm),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 88af0aec1ea9..e264cfd41e0c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -589,6 +589,12 @@ static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_
 
 #define KVM_HOST_DONATION_PTE_OWNER_MASK	GENMASK(3, 1)
 #define KVM_HOST_DONATION_PTE_EXTRA_MASK	GENMASK(59, 4)
+static kvm_pte_t host_stage2_encode_annotation(u8 owner_id, u64 meta)
+{
+	return FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, owner_id) |
+	       FIELD_PREP(KVM_HOST_DONATION_PTE_EXTRA_MASK, meta);
+}
+
 static int host_stage2_set_owner_metadata_locked(phys_addr_t addr, u64 size,
 						 u8 owner_id, u64 meta)
 {
@@ -607,8 +613,7 @@ static int host_stage2_set_owner_metadata_locked(phys_addr_t addr, u64 size,
 	if (!FIELD_FIT(KVM_HOST_DONATION_PTE_EXTRA_MASK, meta))
 		return -EINVAL;
 
-	annotation = FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, owner_id) |
-		     FIELD_PREP(KVM_HOST_DONATION_PTE_EXTRA_MASK, meta);
+	annotation = host_stage2_encode_annotation(owner_id, meta);
 	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
 			      addr, size, &host_s2_pool,
 			      KVM_HOST_INVALID_PTE_TYPE_DONATION, annotation);
@@ -672,10 +677,8 @@ static u64 host_stage2_encode_gfn_meta(struct pkvm_hyp_vm *vm, u64 gfn)
 	       FIELD_PREP(KVM_HOST_PTE_OWNER_GUEST_GFN_MASK, gfn);
 }
 
-static int host_stage2_decode_gfn_meta(kvm_pte_t pte, struct pkvm_hyp_vm **vm,
-				       u64 *gfn)
+static int host_stage2_decode_gfn_meta(kvm_pte_t pte, pkvm_handle_t *handle, u64 *gfn)
 {
-	pkvm_handle_t handle;
 	u64 meta;
 
 	if (WARN_ON(kvm_pte_valid(pte)))
@@ -690,17 +693,59 @@ static int host_stage2_decode_gfn_meta(kvm_pte_t pte, struct pkvm_hyp_vm **vm,
 		return -EPERM;
 
 	meta = FIELD_GET(KVM_HOST_DONATION_PTE_EXTRA_MASK, pte);
-	handle = FIELD_GET(KVM_HOST_PTE_OWNER_GUEST_HANDLE_MASK, meta);
-	*vm = get_vm_by_handle(handle);
-	if (!*vm) {
-		/* We probably raced with teardown; try again */
-		return -EAGAIN;
-	}
-
+	*handle = FIELD_GET(KVM_HOST_PTE_OWNER_GUEST_HANDLE_MASK, meta);
 	*gfn = FIELD_GET(KVM_HOST_PTE_OWNER_GUEST_GFN_MASK, meta);
 	return 0;
 }
 
+static int host_stage2_split_gfn_meta(phys_addr_t phys, u64 ipa, u64 size, struct pkvm_hyp_vm *vm)
+{
+	struct kvm_pgtable_mm_ops *mm_ops = &host_mmu.mm_ops;
+	struct kvm_pgtable *pgt = &host_mmu.pgt;
+	kvm_pte_t pte, *table, *ptep;
+	pkvm_handle_t handle;
+	s8 level;
+	u64 gfn;
+	int ret;
+
+	ret = kvm_pgtable_get_leaf(pgt, phys, &pte, &level, 0);
+	if (ret)
+		return ret;
+
+	if (kvm_granule_size(level) != size)
+		return -EINVAL;
+
+	ret = host_stage2_decode_gfn_meta(pte, &handle, &gfn);
+	if (ret)
+		return ret;
+
+	if (handle != vm->kvm.arch.pkvm.handle || gfn != (ipa >> PAGE_SHIFT))
+		return -EINVAL;
+
+	table = mm_ops->zalloc_page(&host_s2_pool);
+	if (!table)
+		return -ENOMEM;
+
+	ptep = table;
+	while (ptep < table + PTRS_PER_PTE) {
+		u64 meta = host_stage2_encode_gfn_meta(vm, gfn);
+		kvm_pte_t annotation = host_stage2_encode_annotation(PKVM_ID_GUEST, meta);
+
+		*ptep = FIELD_PREP(KVM_INVALID_PTE_TYPE_MASK, KVM_HOST_INVALID_PTE_TYPE_DONATION) |
+			annotation;
+
+		mm_ops->get_page(ptep);
+		ptep++;
+		gfn++;
+	}
+
+	ret = kvm_pgtable_stage2_table_install(pgt, table, phys, level);
+	if (ret)
+		kvm_pgtable_stage2_free_unlinked(mm_ops, table, level);
+
+	return ret;
+}
+
 static bool host_stage2_force_pte_cb(u64 addr, u64 end, enum kvm_pgtable_prot prot)
 {
 	/*
@@ -1351,6 +1396,7 @@ static int host_stage2_get_guest_info(phys_addr_t phys, u64 *size, struct pkvm_h
 				      u64 *gfn)
 {
 	enum pkvm_page_state state;
+	pkvm_handle_t handle;
 	kvm_pte_t pte;
 	s8 level;
 	int ret;
@@ -1379,10 +1425,16 @@ static int host_stage2_get_guest_info(phys_addr_t phys, u64 *size, struct pkvm_h
 	if (level < KVM_PGTABLE_LAST_LEVEL - 1)
 		return -E2BIG;
 
-	ret = host_stage2_decode_gfn_meta(pte, vm, gfn);
+	ret = host_stage2_decode_gfn_meta(pte, &handle, gfn);
 	if (ret)
 		return ret;
 
+	*vm = get_vm_by_handle(handle);
+	if (!*vm) {
+		/* We probably raced with teardown; try again */
+		return -EAGAIN;
+	}
+
 	*size = kvm_granule_size(level);
 
 	return 0;
@@ -1778,6 +1830,55 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 	return 0;
 }
 
+int __pkvm_host_split_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu)
+{
+	struct kvm_hyp_memcache *mc = &vcpu->vcpu.arch.stage2_mc;
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+	u64 size = nr_pages << PAGE_SHIFT;
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	kvm_pte_t pte, *table;
+	phys_addr_t phys;
+	s8 level;
+	int ret;
+
+	if (!mc->nr_pages)
+		return -ENOMEM;
+
+	if (size != PMD_SIZE || !IS_ALIGNED(ipa, PMD_SIZE))
+		return -EINVAL;
+
+	level = KVM_PGTABLE_LAST_LEVEL - 1;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = get_valid_guest_pte(vm, ipa, size, &pte, &phys);
+	if (ret)
+		goto unlock;
+
+	table = kvm_pgtable_stage2_create_unlinked(&vm->pgt, kvm_pte_to_phys(pte), level,
+						   kvm_pgtable_stage2_pte_prot(pte),
+						   mc, true);
+	if (IS_ERR(table)) {
+		ret = PTR_ERR(table);
+		goto unlock;
+	}
+
+	ret = host_stage2_try(host_stage2_split_gfn_meta, phys, ipa, size, vm);
+	if (ret) {
+		kvm_pgtable_stage2_free_unlinked(&vm->mm_ops, table, level);
+		goto unlock;
+	}
+
+	WARN_ON(kvm_pgtable_stage2_table_install(&vm->pgt, table, ipa, level));
+
+unlock:
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
+
 #ifdef CONFIG_NVHE_EL2_DEBUG
 struct pkvm_expected_state {
 	enum pkvm_page_state host;
-- 
2.56.1.708.g77570a6a1d-goog


