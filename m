Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D449A606A882
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NQ5um43/;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vZbRNIiM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8WXlEICWriKO8hycyhrD09n2zXcSWx4xc1unIUHuerE=; b=NQ5um43/2JUK+V
	RlmvU72gz0DN8zpgX6VohuZnEsfLekr00nCtgzBWszX3EjB++n6S+CY+J5QJy76kl3xwKU9IIABBp
	rukgiDqoWvfVS4NKflZe5+wrmtjLwdtmM8abR3OuyTtxkvNgIGOhPm7nmA9EbfSkTdNT6AFIMouo0
	QBOYWaFDdWte18TszwATgdLpKFirZ2AXlL1tuzemiF3cUB+SEz9Z/p48h8xAHJZUn3/PiSRYxtY6b
	5/1JoeGnWUUwJDeRjt/oHb+SbU5ggZ2OhqpxEdZKYpNrVTiYvSWSw0updoSUlgushfWp/a/lDag3q
	2c3JZUMh1++vLTydG1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzox-00000003IOP-2P2c;
	Mon, 16 Nov 2026 16:44:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzot-00000003IKt-0uDc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:44:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55959143D;
	Mon, 16 Nov 2026 08:44:35 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.63.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62AE43FB7F;
	Mon, 16 Nov 2026 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794847478; bh=GadZ/zda/tWuvRc+0zC4U/Ce9iNHK0hYWGg2Fdrk0Sc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vZbRNIiME0eVfKmzXCTnxEBXkTZyF4VbvYFVmg9fg/1Fb0DmNz7QPe+w8vQxTied8
	 c2Eg4zzW2waz/qJ56vSFo2ShOSOFhajKTZBp+rNN4i8UylisValR2RIsx7HMI4ztsE
	 KP2uEqaOAu21co8eVAbnnB4oGVSJ9rnOXy/dYluk=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
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
	Kohei Enju <enju.kohei@fujitsu.com>
Subject: [PATCH v3 04/11] KVM: arm64: CCA: Add basic infrastructure for creating a realm
Date: Mon, 16 Nov 2026 16:43:50 +0000
Message-ID: <20261116164358.142785-5-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116164358.142785-1-steven.price@arm.com>
References: <20261116164358.142785-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_084439_333132_534B0AB6 
X-CRM114-Status: GOOD (  26.70  )
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

Introduce the skeleton functions for creating and destroying a realm.
The requested IPA size is checked against both the KVM and RMM limits.

The actual work of constructing the realm will be added in future
patches.

Signed-off-by: Steven Price <steven.price@arm.com>

---
Changes since v2:
- Move ARM_RMM_RMI selection and rmi.o build registration here.
  Store the RD physical address from the outset and free SRO state
  on Realm teardown errors.

Changes since v1:
- Cap the Realm IPA size at the smaller KVM and RMM limit, and record
  the selected IPA size when initializing Realm state.
---
 arch/arm64/include/asm/kvm_rmi.h | 21 +++++++++++
 arch/arm64/kvm/Kconfig           |  1 +
 arch/arm64/kvm/Makefile          |  2 +-
 arch/arm64/kvm/arm.c             |  9 +++++
 arch/arm64/kvm/mmu.c             | 18 ++++++++--
 arch/arm64/kvm/rmi.c             | 62 ++++++++++++++++++++++++++++++++
 6 files changed, 110 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/kvm/rmi.c

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 67f16793b4d0..6994756a14e6 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -6,6 +6,9 @@
 #ifndef __ASM_KVM_RMI_H
 #define __ASM_KVM_RMI_H
 
+#include <linux/arm-smccc-rmi.h>
+#include <linux/kvm.h>
+
 /**
  * enum realm_state - State of a Realm
  *
@@ -50,10 +53,28 @@ enum realm_state {
 /**
  * struct realm - Additional per VM data for a Realm
  *
+ * @rd_phys: Physical address of the RMM-managed Realm Descriptor (RD) granule
+ * @sro: Preallocated SRO state context for Realm MMU operations
  * @state: The lifetime state machine for the realm
+ * @ia_bits: Number of valid Input Address bits in the IPA
  */
 struct realm {
+	phys_addr_t rd_phys;
+	/*
+	 * Reused by RTT map/unmap SRO commands. Those commands are only
+	 * issued from Realm stage-2 map/unmap paths while kvm->mmu_lock is
+	 * held for write, including Realm fault handling where
+	 * kvm_fault_lock() takes the write side, so concurrent use is
+	 * serialized.
+	 */
+	struct rmi_sro_state *sro;
 	enum realm_state state;
+	unsigned int ia_bits;
 };
 
+u32 kvm_rmm_ipa_limit(void);
+
+int kvm_init_realm(struct kvm *kvm);
+void kvm_destroy_realm(struct kvm *kvm);
+
 #endif /* __ASM_KVM_RMI_H */
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index cecea0820e52..d067063a3686 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -34,6 +34,7 @@ menuconfig KVM
 	select GUEST_PERF_EVENTS if PERF_EVENTS
 	select KVM_GUEST_MEMFD
 	select KVM_GENERIC_PRE_FAULT_MEMORY
+	select ARM_RMM_RMI
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 7aaeeb84e788..66a719ab5b6b 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -16,7 +16,7 @@ CFLAGS_handle_exit.o += -Wno-override-init
 kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 inject_fault.o va_layout.o handle_exit.o config.o \
 	 guest.o debug.o reset.o sys_regs.o stacktrace.o \
-	 vgic-sys-reg-v3.o fpsimd.o pkvm.o \
+	 vgic-sys-reg-v3.o fpsimd.o pkvm.o rmi.o \
 	 arch_timer.o trng.o vmid.o emulate-nested.o nested.o at.o \
 	 vgic/vgic.o vgic/vgic-init.o \
 	 vgic/vgic-irqfd.o vgic/vgic-v2.o \
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index e06cc390a3d6..821e27d07f6a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -300,6 +300,13 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
 
+	/* Initialise the realm bits after the generic bits are enabled */
+	if (kvm_vm_is_realm(kvm)) {
+		ret = kvm_init_realm(kvm);
+		if (ret)
+			goto err_uninit_mmu;
+	}
+
 	return 0;
 
 err_uninit_mmu:
@@ -364,6 +371,8 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 
 	kvm_destroy_nested(kvm);
 	kvm_arm_teardown_hypercalls(kvm);
+	if (kvm_vm_is_realm(kvm))
+		kvm_destroy_realm(kvm);
 }
 
 static bool kvm_has_full_ptr_auth(void)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8a9a80c7cfab..ac72db3d4505 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -981,10 +981,14 @@ static struct kvm_pgtable_mm_ops kvm_s2_mm_ops = {
 
 static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
 {
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 	u32 kvm_ipa_limit = get_kvm_ipa_limit();
 	u64 mmfr0, mmfr1;
 	u32 phys_shift;
 
+	if (kvm_vm_is_realm(kvm))
+		kvm_ipa_limit = min(kvm_ipa_limit, kvm_rmm_ipa_limit());
+
 	phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
 	if (is_protected_kvm_enabled()) {
 		phys_shift = kvm_ipa_limit;
@@ -1034,9 +1038,18 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
 
 static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
 {
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
 
-	stage2_destroy_range(pgt, 0, BIT(ia_bits));
+	/*
+	 * Realm RTTs are inaccessible to the host and may contain stale data
+	 * after the RMM has released them. The non-root RTTs are explicitly
+	 * destroyed through RMI before the RD is destroyed; only the root PGD
+	 * pages remain to be freed here.
+	 */
+	if (!kvm_vm_is_realm(kvm))
+		stage2_destroy_range(pgt, 0, BIT(ia_bits));
+
 	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
 }
 
@@ -1084,6 +1097,8 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 		return -EINVAL;
 	}
 
+	mmu->arch = &kvm->arch;
+
 	err = kvm_init_ipa_range(mmu, type);
 	if (err)
 		return err;
@@ -1092,7 +1107,6 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	if (!pgt)
 		return -ENOMEM;
 
-	mmu->arch = &kvm->arch;
 	err = KVM_PGT_FN(kvm_pgtable_stage2_init)(pgt, mmu, &kvm_s2_mm_ops);
 	if (err)
 		goto out_free_pgtable;
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
new file mode 100644
index 000000000000..57f59b618a96
--- /dev/null
+++ b/arch/arm64/kvm/rmi.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-2026 ARM Ltd.
+ */
+
+#include <linux/arm-rmi-cmds.h>
+#include <linux/kvm_host.h>
+
+#include <asm/kvm_emulate.h>
+#include <asm/kvm_mmu.h>
+#include <asm/kvm_pgtable.h>
+#include <asm/virt.h>
+
+u32 kvm_rmm_ipa_limit(void)
+{
+	return u64_get_bits(rmi_feat_reg(0), RMI_FEATURE_REGISTER_0_S2SZ);
+}
+
+void kvm_destroy_realm(struct kvm *kvm)
+{
+	struct realm *realm = &kvm->arch.realm;
+	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
+
+	if (!kvm_realm_is_created(kvm))
+		goto out_free_sro;
+
+	kvm_set_realm_state(kvm, REALM_STATE_DYING);
+
+	if (realm->rd_phys) {
+		phys_addr_t rd_phys = realm->rd_phys;
+
+		if (WARN_ON(rmi_realm_terminate(rd_phys, realm->sro)))
+			goto out_free_sro;
+
+		if (WARN_ON(rmi_realm_destroy(rd_phys, realm->sro)))
+			goto out_free_sro;
+		rmi_free_delegated_page(rd_phys);
+		realm->rd_phys = 0;
+	}
+
+	if (WARN_ON(rmi_undelegate_range(kvm->arch.mmu.pgd_phys,
+					 pgd_size)))
+		goto out_free_sro;
+
+	kvm_set_realm_state(kvm, REALM_STATE_DEAD);
+
+out_free_sro:
+	kfree(realm->sro);
+	realm->sro = NULL;
+}
+
+int kvm_init_realm(struct kvm *kvm)
+{
+	struct realm *realm = &kvm->arch.realm;
+
+	realm->ia_bits = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
+	realm->sro = kmalloc_obj(*realm->sro);
+	if (!realm->sro)
+		return -ENOMEM;
+
+	return 0;
+}
-- 
2.43.0


