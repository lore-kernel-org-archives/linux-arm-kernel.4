Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C8D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JUR0DzgI;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GJTzoALo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RWpf4+3aFRTKLrtwC63Q3FVYCEhNaAVx46mJIxGLJ+4=; b=JUR0DzgIsQi6Zc
	z4bDl9tV+sCEr4QAWBChGYFPI0iXBIrWa/hdtfsWOSN3aAbOXGlXizYQ1cfWyJqEkq+n9nr7nf783
	5ESghuonGml9ITKXY+gafephiUzsNCxea94fiEYkghGBfd33Ngve+g3HRg/S39o7+mq1R0iyjoeKE
	vEQI57PbVYKW0Z9QJXTiaEUzEzaMsCOtoLAasHBYs/3TWZ9VvEs8Y9tbVg0uHO0TcIGOJ9DtkNNA9
	giE8GZd+RS3vwIXZcoqFCIVVsEdcr2NP0tw0yeg8nK4RUoya0e7LG2LI/JwhRgL5pClKZkcH5V5bB
	jteqwt9zLBjIXu8RmhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRVk-000000030O7-3LNV;
	Mon, 23 Nov 2026 10:43:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRVi-000000030N0-0Vot
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:42:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE6BB19F0;
	Mon, 23 Nov 2026 02:42:54 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.63.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0D2F3F632;
	Mon, 23 Nov 2026 02:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795430577; bh=0FTVzsFRGJOaxYgVsmTgMD6lxZNDN3sZ+e8XuRIcfG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GJTzoALof2M6AlymKZWGn3X4MidqpHBDFPhzDypnFis5/XGj4E2p7THOYPKEnMn1V
	 y3BEVOBHNUkqtpESUM3/VgRlIzmH/66xoyObQFPsq8Ces/kQIU0iEClTqkysu3JomE
	 6esz0BbKSAkeKS1ShYpib2F0MMASdYMvmeAXjtBM=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Kohei Enju <enju.kohei@fujitsu.com>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v4 02/11] KVM: arm64: CCA: Introduce Realms
Date: Mon, 23 Nov 2026 10:42:22 +0000
Message-ID: <20261123104233.95710-3-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123104233.95710-1-steven.price@arm.com>
References: <20261123104233.95710-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_024258_249264_A5BEC143 
X-CRM114-Status: GOOD (  28.29  )
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

From: Suzuki K Poulose <suzuki.poulose@arm.com>

Introduce the Realm VM flavor and per-VM state tracking. Realm and
protected pKVM states are mutually exclusive, so share their storage
in kvm_arch. Adjust the protected VM helpers for the new flavor.

Realm VMs cannot be created yet; RMI initialization and the creation
UABI follow in later patches.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>

---
Changes since v3:
- Keep protected-VM helper semantics specific to pKVM in nVHE,
  and use VM flavor checks for pKVM power-state handling.

Changes since v1:
- Move RMI initialization to the RMI checks patch and Realm vCPU
  feature restrictions to the follow-on integration series. Keep
  this patch focused on the Realm VM flavor and per-VM state.
- Limit pKVM power state handling to pKVM vCPUs.
---
 arch/arm64/include/asm/kvm_emulate.h | 16 ++++++++
 arch/arm64/include/asm/kvm_host.h    | 17 +++++---
 arch/arm64/include/asm/kvm_rmi.h     | 59 ++++++++++++++++++++++++++++
 arch/arm64/kvm/arm.c                 |  4 +-
 arch/arm64/kvm/mmu.c                 |  1 +
 arch/arm64/kvm/pkvm.c                |  2 +-
 arch/arm64/kvm/psci.c                |  3 +-
 7 files changed, 94 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_rmi.h

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 334211b8b2ee..32021bdf2610 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -831,4 +831,20 @@ static inline void kvm_reset_vcpu_psci(struct kvm_vcpu *vcpu,
 	vcpu_set_reg(vcpu, 0, reset_state->r0);
 }
 
+static inline enum realm_state kvm_realm_state(struct kvm *kvm)
+{
+	return READ_ONCE(kvm->arch.realm.state);
+}
+
+static inline void kvm_set_realm_state(struct kvm *kvm,
+				       enum realm_state new_state)
+{
+	WRITE_ONCE(kvm->arch.realm.state, new_state);
+}
+
+static inline bool kvm_realm_is_created(struct kvm *kvm)
+{
+	return kvm_vm_is_realm(kvm) && kvm_realm_state(kvm) != REALM_STATE_NONE;
+}
+
 #endif /* __ARM64_KVM_EMULATE_H__ */
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb130..8438251e1d1b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -29,6 +29,7 @@
 #include <asm/kvm.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_hcall.h>
+#include <asm/kvm_rmi.h>
 #include <asm/vncr_mapping.h>
 
 #define __KVM_HAVE_ARCH_INTC_INITIALIZED
@@ -408,6 +409,7 @@ enum kvm_arm_vm_flavor {
 	VM_PKVM,		/* Normal guests on pKVM */
 	MARKER(__VM_PROTECTED),
 	VM_PROTECTED_PKVM,	/* Protected VM */
+	VM_REALM,		/* CCA */
 	VM_FLAVOR_MAX
 };
 
@@ -501,11 +503,14 @@ struct kvm_arch {
 	/* Count the number of VNCR_EL2 TLBs */
 	atomic_t vncr_tlb_count;
 
-	/*
-	 * For an untrusted host VM, 'pkvm.handle' is used to lookup
-	 * the associated pKVM instance in the hypervisor.
-	 */
-	struct kvm_protected_vm pkvm;
+	union {
+		/*
+		 * For an untrusted host VM, 'pkvm.handle' is used to lookup
+		 * the associated pKVM instance in the hypervisor.
+		 */
+		struct kvm_protected_vm pkvm;
+		struct realm realm;
+	};
 
 #ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
 	/* Nested virtualization info */
@@ -1596,6 +1601,8 @@ struct kvm *kvm_arch_alloc_vm(void);
 
 #endif	/* __KVM_NVHE_HYPERVISOR__ */
 
+#define kvm_vm_is_realm(kvm)		((kvm)->arch.vm_flavor == VM_REALM)
+
 #define kvm_has_mte(kvm)					\
 	(system_supports_mte() &&				\
 	 test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &(kvm)->arch.flags))
diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
new file mode 100644
index 000000000000..67f16793b4d0
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023-2026 ARM Ltd.
+ */
+
+#ifndef __ASM_KVM_RMI_H
+#define __ASM_KVM_RMI_H
+
+/**
+ * enum realm_state - State of a Realm
+ *
+ * Mirrors the RMM's Realm lifecycle states where they are meaningful to KVM,
+ * with REALM_STATE_DYING being a KVM-internal state used to prevent further
+ * requests while teardown is in progress. KVM does not track REALM_SYSTEM_OFF
+ * or REALM_ZOMBIE separately as they naturally lead to teardown.
+ */
+enum realm_state {
+	/**
+	 * @REALM_STATE_NONE:
+	 *      Realm has not yet been created. rmi_realm_create() has not
+	 *      yet been called.
+	 */
+	REALM_STATE_NONE,
+	/**
+	 * @REALM_STATE_NEW:
+	 *      Realm is under construction, Realm Descriptor has been created,
+	 *      but it is not yet activated. Memory may be populated.
+	 */
+	REALM_STATE_NEW,
+	/**
+	 * @REALM_STATE_ACTIVE:
+	 *      Realm has been created and is eligible for execution with
+	 *      rmi_rec_enter(). Memory may no longer be populated with known
+	 *	contents.
+	 */
+	REALM_STATE_ACTIVE,
+	/**
+	 * @REALM_STATE_DYING:
+	 *      Realm is in the process of being destroyed or has already been
+	 *      destroyed.
+	 */
+	REALM_STATE_DYING,
+	/**
+	 * @REALM_STATE_DEAD:
+	 *      Realm has been destroyed.
+	 */
+	REALM_STATE_DEAD
+};
+
+/**
+ * struct realm - Additional per VM data for a Realm
+ *
+ * @state: The lifetime state machine for the realm
+ */
+struct realm {
+	enum realm_state state;
+};
+
+#endif /* __ASM_KVM_RMI_H */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 157bf4b81202..d79e5451923d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -877,7 +877,8 @@ static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu, u32 mp_state)
 /* The guest's own CPU_OFF: EL2 has already powered the vCPU off. */
 void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
 {
-	u32 mp_state = vcpu_is_protected(vcpu) ? KVM_MP_STATE_UNINITIALIZED : KVM_MP_STATE_STOPPED;
+	u32 mp_state = vcpu->kvm->arch.vm_flavor == VM_PROTECTED_PKVM ?
+		       KVM_MP_STATE_UNINITIALIZED : KVM_MP_STATE_STOPPED;
 
 	spin_lock(&vcpu->arch.mp_state_lock);
 	__kvm_arm_vcpu_power_off(vcpu, mp_state);
@@ -2312,6 +2313,7 @@ static const struct kvm_vcpu_ops *arm64_vcpu_ops[] = {
 	KVM_VCPU_OPS(VM_VHE, vhe_vcpu_ops),
 	KVM_VCPU_OPS(VM_PKVM, pkvm_vcpu_ops),
 	KVM_VCPU_OPS(VM_PROTECTED_PKVM, pkvm_vcpu_ops),
+	[VM_REALM] = NULL,
 };
 
 static void kvm_init_vcpu_ops(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2825fccd2a19..09c831a49ed3 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -3165,6 +3165,7 @@ static const struct kvm_vm_s2_ops *arm64_vm_s2_ops[] = {
 	KVM_VM_S2_OPS(VM_NVHE, kvm_default_vm_s2_ops),
 	KVM_VM_S2_OPS(VM_PKVM, pkvm_vm_s2_ops),
 	KVM_VM_S2_OPS(VM_PROTECTED_PKVM, protected_pkvm_vm_s2_ops),
+	[VM_REALM] = NULL,
 };
 
 static int kvm_vm_init_vm_s2_ops(struct kvm *kvm)
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 016997288fd2..8241a05e25d1 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -192,7 +192,7 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 	 * Mirror EL2's seeding of power_state from mp_state. The hyp vCPU is
 	 * published, so take mp_state_lock against kvm_psci_vcpu_on().
 	 */
-	if (vcpu_is_protected(vcpu)) {
+	if (vcpu->kvm->arch.vm_flavor == VM_PROTECTED_PKVM) {
 		spin_lock(&vcpu->arch.mp_state_lock);
 		if (kvm_arm_vcpu_stopped(vcpu))
 			WRITE_ONCE(vcpu->arch.mp_state.mp_state, KVM_MP_STATE_UNINITIALIZED);
diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index b01f8d44033f..d14414d66dd5 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -68,7 +68,8 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
 	 * STOPPED before that is the VMM's pause.
 	 */
 	if (!kvm_arm_vcpu_stopped(vcpu) ||
-	    (vcpu_is_protected(vcpu) && !kvm_pkvm_vcpu_is_powered_off(vcpu))) {
+	    (vcpu->kvm->arch.vm_flavor == VM_PROTECTED_PKVM &&
+	     !kvm_pkvm_vcpu_is_powered_off(vcpu))) {
 		if (kvm_psci_version(source_vcpu) != KVM_ARM_PSCI_0_1)
 			ret = PSCI_RET_ALREADY_ON;
 		else
-- 
2.43.0


