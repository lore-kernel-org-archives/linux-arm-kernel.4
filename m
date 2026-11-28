Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CA7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 01:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2OJtO9UY;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=T5yafpEl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vXy2aP8GDRjSyqVtGydk9aFrLy23+49FL9J75Av5HRo=; b=2OJtO9UYAhXd+I
	PcWqB8ommLVcekHQsinLyQniz8Lav/4LvIC7gfHPMpKGjZU8plcI10p+jjJ/dkwN+P499I6OGqoE1
	ZCha+B183Je3QFrGALCVhd6rNzCcmvUao2BI4Kf8Dw7tJ8SsGPF+7x63/nTeak7KJ4Q6tr+h/hLHA
	CjPKVpzFMzL86aJlujUYMFO+pfBdyEW6gL+Rm7/to+GJqra+iRa3JmHlvOVhxrYR4Hk9gWxZ9okVi
	c2FnMT3oy8Vy1SfaM3/34QHSuS5veyUJfLMcPDZRUT1zO7N4fUWupVPLMo8+hL6FdiUGxPsdu4OPR
	jqhYV4aAtTwJKVP4hZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX73C-00000000G8E-3wnV;
	Sat, 28 Nov 2026 01:16:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX72b-00000000G2L-3qn8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 01:15:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31D961575;
	Fri, 27 Nov 2026 17:15:46 -0800 (PST)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7AEE3F632;
	Fri, 27 Nov 2026 17:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795828549; bh=VVsnnu70vsRCRNLJdw3gnIMtF5TQk0N9+QCXllDagCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T5yafpElX9xBSr6VhjpHakO4qQv0+Pz/O7QsWGdG3siaVix93H8tL/qgAxNbqh8SA
	 bBzh2Ak16eeMxCB6fuQzu8d2OVFJFBir27VHHj7b4fBC8/dpUMRtXhPE8ozUKwncKo
	 RtocVMZTCLYW4KGTA97B9ZVTjqxfFxjPeZ4C621c=
From: Jia He <justin.he@arm.com>
To: maz@kernel.org,
	oupton@kernel.org
Cc: fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia He <justin.he@arm.com>
Subject: [PATCH v3 4/4] KVM: arm64: nv: Allow the L1 VNCR page in cacheable PFNMAP memory
Date: Sat, 28 Nov 2026 01:14:47 +0000
Message-Id: <20261128011447.3588988-5-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261128011447.3588988-1-justin.he@arm.com>
References: <20261128011447.3588988-1-justin.he@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_171550_278214_FABD6BF1 
X-CRM114-Status: GOOD (  20.90  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

kvm_translate_vncr() refuses any PFN that isn't memory and injects an
SEA into the guest hypervisor. That is stricter than what the stage-2
fault path allows (kvm_s2_fault_pin_pfn()): a VM_PFNMAP or VM_MIXEDMAP
VMA whose host stage-1 attributes are cacheable is mapped cacheable at
stage-2 when FWB and DIC are present, and the guest can use such memory
as RAM (e.g. device memory that it onlines as a NUMA node). If the guest
then picks a page of that memory as the VNCR page of one of its own
guests, it takes an SEA as soon as it enters that guest.

For VM_PFNMAP and VM_MIXEDMAP VMAs, relax the check to match the stage-2
fault path, and remove the FIXME added by commit 4bd7dbe0b224 ("KVM:
arm64: nv: Inject SEA if guest VNCR isn't normal memory"). Look up the
VMA, and allow the PFN if the VMA is a cacheable VM_PFNMAP or
VM_MIXEDMAP one and the system supports cacheable PFNMAP at stage-2. No
linear mapping is required, because VNCR accesses use the EL2 fixmap and
require no cache maintenance.

Get the HVA with gfn_to_hva_memslot_prot(), as kvm_handle_guest_abort()
does. gfn_to_hva_memslot() returns KVM_HVA_ERR_RO_BAD for a read-only
memslot, and the VMA lookup would then fail. A VNCR page in a read-only
memslot is valid and is mapped read-only since commit 2684e02bac41
("KVM: arm64: nv: Respect read-only PFN when mapping L1 VNCR").

mmu_invalidate_seq is sampled before the PFN is faulted in, so a VMA
change after the lookup is caught by the mmu_invalidate_retry() check
that follows, as for the PFN itself.

Tested on a host with FEAT_FGT, FWB and DIC, with an L1 whose whole RAM
is a cacheable PFNMAP (host RAM withheld with mem= and handed to the VMM
by a test driver with remap_pfn_range()) starting an L2 guest
hypervisor. Without the patch, L2 repeatedly takes an SEA at the same PC
and fails to boot. With the patch, L2 boots successfully.

The read-only case was tested on a Neoverse-N2 host. The guest
hypervisor's VNCR page is in a cacheable PFNMAP registered as a
read-only memslot, and a nested context reads VTTBR_EL2. When the HVA
is looked up with gfn_to_hva_memslot(), the guest hypervisor takes an
SEA. With this patch, the read returns the contents of the VNCR page.

Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/include/asm/kvm_mmu.h |  2 ++
 arch/arm64/kvm/mmu.c             |  2 +-
 arch/arm64/kvm/nested.c          | 38 +++++++++++++++++++++++++++-----
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 32392abf2e21..e59c6603b137 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -385,6 +385,8 @@ static inline void kvm_fault_unlock(struct kvm *kvm)
 		read_unlock(&kvm->mmu_lock);
 }
 
+bool kvm_vma_is_cacheable(struct vm_area_struct *vma);
+
 /*
  * ARM64 KVM relies on a simple conversion from physaddr to a kernel
  * virtual address (KVA) when it does cache maintenance as the CMO
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db7..cbd563ba4dd9 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1639,7 +1639,7 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
 	return vma->vm_flags & VM_MTE_ALLOWED;
 }
 
-static bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
+bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
 {
 	switch (FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(vma->vm_page_prot))) {
 	case MT_NORMAL_NC:
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 523d71d4df13..d3b77ed53ef6 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1553,6 +1553,37 @@ static u64 read_vncr_el2(struct kvm_vcpu *vcpu)
 	return (u64)sign_extend64(__vcpu_sys_reg(vcpu, VNCR_EL2), 48);
 }
 
+/*
+ * Allow a non-memory PFN only if it comes from a cacheable VM_PFNMAP or
+ * VM_MIXEDMAP VMA and the system supports cacheable PFNMAP at stage-2. The
+ * VMA is looked up after the PFN has been faulted in: the caller must check
+ * mmu_invalidate_retry() against a sequence count sampled before the
+ * fault-in.
+ */
+static bool vncr_pfn_is_cacheable(struct kvm_memory_slot *memslot, gfn_t gfn,
+				  kvm_pfn_t pfn)
+{
+	struct vm_area_struct *vma;
+	unsigned long hva;
+	bool ret = false;
+
+	if (pfn_is_map_memory(pfn))
+		return true;
+
+	if (!kvm_supports_cacheable_pfnmap())
+		return false;
+
+	hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
+
+	mmap_read_lock(current->mm);
+	vma = vma_lookup(current->mm, hva);
+	if (vma && (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP)))
+		ret = kvm_vma_is_cacheable(vma);
+	mmap_read_unlock(current->mm);
+
+	return ret;
+}
+
 static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 {
 	struct kvm_memory_slot *memslot;
@@ -1625,12 +1656,7 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 		writable = !(memslot->flags & KVM_MEM_READONLY);
 	}
 
-	/*
-	 * FIXME: This check is too restrictive as KVM allows cacheable memory
-	 * attributes for PFNMAP VMAs that have cacheable attributes in host
-	 * stage-1.
-	 */
-	if (!pfn_is_map_memory(pfn)) {
+	if (!vncr_pfn_is_cacheable(memslot, gfn, pfn)) {
 		kvm_release_faultin_page(vcpu->kvm, page, true, false);
 		fail_s1_walk(&vt->wr, ESR_ELx_FSC_EXTABT, false);
 		return -EINVAL;
-- 
2.34.1


