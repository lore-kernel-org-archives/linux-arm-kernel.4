Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B954C606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M6SCFk+S;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=L7r0aR5U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pcj3iR5Q/uD/43toBqFlh9vTlYdxRie3u4SrhRP2Apo=; b=M6SCFk+SqfeLCc
	r1lg4yxCARvyKhQxQKpZt159ToWRAgzvJi98KKShLXQ1hpOwvQoCGOM8/g/DDzhZc3SPkSQGtnW2f
	EBcSB1sz0NycAwetSOmYx8COVhcE7puUMKDy3oa3ReTVz5ju3yIkqXB0mkt57LSbtgWBbLCaNh7Uz
	5qJUmRh2+BWJa6KjWiKYVogLaKmvi7wil6dKjNaSh1LL7bu4NKvV3R57hE7wnyNMwjWhotxf6CdwR
	puhtSRNJRnRDAJvBypQFDaIY5Hd78Eg9AhRnOCABkYDFns5GQkndMCIfWze3NmgMB6fRgsMBiXgc+
	04W7ta3GyFHzZLuGV9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVgQ-00000003uil-2ure;
	Mon, 23 Nov 2026 15:10:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVgL-00000003ugq-3GTk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:10:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 537A61476;
	Mon, 23 Nov 2026 07:10:10 -0800 (PST)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B9023F632;
	Mon, 23 Nov 2026 07:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795446613; bh=aufnXj7ZWmuYwG8s29o0HdRWSyaK4nqqahpsQ6DgXPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L7r0aR5Uj5elzPjTCDs45bPPlL/3ny6m03q4Luh2c0NkaC0TWYD8Gh7XGWo6A54TU
	 qX1izGVgksuJH4npvA/byai8Vy4vJisGgeMA5m/ztGHJN4vFvnZGMAR0/kMpkbWli/
	 KG1vW1NbUDFxynqIVCNiPhTD3cAt8ZFaLGQDGvHw=
From: Jia He <justin.he@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jia He <justin.he@arm.com>
Subject: [PATCH 1/3] KVM: arm64: Don't load hardware vCPU state before first run
Date: Mon, 23 Nov 2026 15:09:15 +0000
Message-Id: <20261123150917.2679600-2-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123150917.2679600-1-justin.he@arm.com>
References: <20261123150917.2679600-1-justin.he@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_071014_054658_89C430E2 
X-CRM114-Status: GOOD (  17.21  )
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

KVM_PRE_FAULT_MEMORY calls vcpu_load() as soon as KVM_ARM_VCPU_INIT has
completed. On arm64, however, kvm->arch.sysreg_masks, the trap
configuration, vncr_tlb and nested vGIC state are only set up on the
first KVM_RUN in kvm_arch_vcpu_run_pid_change().

Running the full vcpu_load() path before then reads unsanitised guest
sysregs and touches uninitialised nested state: get_s2_mmu_nested()
populates nested_mmus[] from raw VTTBR_EL2/VTCR_EL2/HCR_EL2 values, FGT
and HCRX_EL2 are written before kvm_calculate_traps() has run, and
kvm_vgic_load() can enter vgic_v3_load_nested() early. In particular, if
userspace creates an EL2 vCPU with ID_AA64MMFR4_EL1.NV_frac cleared to 0
(so vncr_tlb is never allocated), sets HCR_EL2.NV=1 and an EL1 PSTATE,
and calls KVM_PRE_FAULT_MEMORY, kvm_vcpu_load_hw_mmu() queues
KVM_REQ_MAP_L1_VNCR_EL2. The next KVM_RUN then dereferences a NULL
vncr_tlb in kvm_map_l1_vncr() with preemption disabled and kvm->mmu_lock
held for read:

  [   73.636014] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000078
  [   73.801972] pc : kvm_map_l1_vncr+0x48/0x2d0
  [   73.884820] Call trace:
  [   73.887253]  kvm_map_l1_vncr+0x48/0x2d0 (P)
  [   73.891422]  check_nested_vcpu_requests+0xb8/0x168
  [   73.896200]  check_vcpu_requests+0x2a0/0x428
  [   73.900458]  kvm_arch_vcpu_ioctl_run+0x2d8/0x6d8
  [   73.905062]  kvm_vcpu_ioctl+0x388/0xaf0

KVM_PRE_FAULT_MEMORY still needs generic vcpu_load() to set
kvm_running_vcpu for dirty-ring tracking in mark_page_dirty_in_slot(),
but kvm_arch_vcpu_pre_fault_memory() only walks and populates
&kvm->arch.mmu and does not use any hardware vCPU state. Skip the arch
vcpu_load()/vcpu_put() callbacks until vcpu_has_run_once() is true. In
KVM_RUN, vcpu->pid is set under vcpu->mutex right after
kvm_arch_vcpu_run_pid_change() succeeds and before
kvm_arch_vcpu_ioctl_run() calls vcpu_load().

Since kvm_running_vcpu can now be set without VHE state on the CPU, use
host_ctxt->__hyp_running_vcpu in VHE enter_vmid_context() (matching
nVHE) and check vcpu_has_run_once() in vgic_maintenance_handler().

Fixes: 34cfa9b3af17 ("KVM: arm64: Implement KVM_PRE_FAULT_MEMORY")
Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/kvm/arm.c            | 17 +++++++++++++++--
 arch/arm64/kvm/hyp/vhe/tlb.c    |  3 ++-
 arch/arm64/kvm/vgic/vgic-init.c |  2 +-
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 157bf4b81202..ef626fd13d8e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -811,6 +811,16 @@ static void pkvm_vcpu_load(struct kvm_vcpu *vcpu)
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	vcpu->cpu = cpu;
+
+	/*
+	 * KVM_PRE_FAULT_MEMORY calls vcpu_load() before the first KVM_RUN has
+	 * finalised the VM and vCPU state in kvm_arch_vcpu_run_pid_change().
+	 * Pre-faulting only populates the canonical stage-2 and needs no
+	 * hardware vCPU state on the CPU.
+	 */
+	if (unlikely(!vcpu_has_run_once(vcpu)))
+		return;
+
 	vcpu->arch.vcpu_ops->vcpu_load(vcpu);
 
 	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
@@ -862,8 +872,11 @@ static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.vcpu_ops->vcpu_put(vcpu);
-	vcpu_clear_on_unsupported_cpu(vcpu);
+	if (likely(vcpu_has_run_once(vcpu))) {
+		vcpu->arch.vcpu_ops->vcpu_put(vcpu);
+		vcpu_clear_on_unsupported_cpu(vcpu);
+	}
+
 	vcpu->cpu = -1;
 }
 
diff --git a/arch/arm64/kvm/hyp/vhe/tlb.c b/arch/arm64/kvm/hyp/vhe/tlb.c
index 33ac9a8c954e..98df0bb0a05c 100644
--- a/arch/arm64/kvm/hyp/vhe/tlb.c
+++ b/arch/arm64/kvm/hyp/vhe/tlb.c
@@ -20,11 +20,12 @@ struct tlb_inv_context {
 static void enter_vmid_context(struct kvm_s2_mmu *mmu,
 			       struct tlb_inv_context *cxt)
 {
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	struct kvm_vcpu *vcpu;
 	u64 val;
 
 	local_irq_save(cxt->flags);
 
+	vcpu = host_data_ptr(host_ctxt)->__hyp_running_vcpu;
 	if (vcpu && mmu != vcpu->arch.hw_mmu)
 		cxt->mmu = vcpu->arch.hw_mmu;
 	else
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index c9991e24cb6b..cd413069b16e 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -825,7 +825,7 @@ static irqreturn_t vgic_maintenance_handler(int irq, void *data)
 	 * Of course, NV throws a wrench in this plan, and needs
 	 * something special.
 	 */
-	if (vcpu && vgic_state_is_nested(vcpu))
+	if (vcpu && vcpu_has_run_once(vcpu) && vgic_state_is_nested(vcpu))
 		vgic_v3_handle_nested_maint_irq(vcpu);
 
 	return IRQ_HANDLED;
-- 
2.34.1


