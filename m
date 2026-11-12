Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8CD606A884
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 03:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xPFwMJvY;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=RNO2IRg7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1Nv3P0rBxt+X7FNoz0t7xO1dEq4B/fAsbmp8MpKzm1Y=; b=xPFwMJvYHG8WOS
	McyxtQLAsy4RctL2IopPNIPSO1igil4jTaPAti9loIWUjFSFIaWryPtk8WRpy8TmMKMNjOwKGLILK
	Cli+mDlU98sLYrPXqooy5lksGUgg/eNi75fmWPoUnSotCYCNnGzNE9UiXz9YF7kdRQLOYUASSv8BE
	gtLuGoi2ka1XKkKgDWCqWrh+zg+6EcpIYKA0iYIt6J67EpySRRfCgcflFSu4sAMZf3YX0Zoj9Qh4z
	nFGd/vrxhQ/ZBHaRJFmEokuhOejhujUW2jmXHdolgneD9ZFWkwKHLxYJRaL90L9yby6Q38Xu67Wr0
	TMsy3qPOdInABdqYwxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLcr-00000008dW7-3S0D;
	Thu, 12 Nov 2026 03:37:25 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLcp-00000008dUT-0q7y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 03:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1794454642; x=1825990642;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=0SteMvw4TRI2EB8EQNbS5PdGg2z2O/XHauoovYaYej4=;
  b=RNO2IRg76Swv5SLiDWltBLX3870VRHYDy2NaWMS+W2h/mSdqPczIuFsV
   sKp8EXzH6Y08rMoc7ilNDy5WgoxY5ZQillhg3QgiOjxLVc1hLtcE38ZYW
   wLptOoqmwCW7X5niYLx4WqIpnGZlMORI/zLUGT2N5hPNV7juZ1duVBMF6
   PIluk9xQSQG291Mt8ELSVM6ErfPmLyorXFBBK3rF5u5Ibeu6ikhV+Tdl1
   Nv3e8ROiSk8uitN/0tyyXhaXnzqaRqljEjBYZMEO7sWt7T6FaNDXFFy+7
   lA/DftSuIcPCs1B5eb0wQjsJGf41Otw/qJ0483x5vneOv7WluRQ9zX5iT
   Q==;
X-CSE-ConnectionGUID: 0MMuISVLR/ihzaBgn1Yggg==
X-CSE-MsgGUID: JQiD8p4vQeyahlBHNT53Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="265537758"
X-IronPort-AV: E=Sophos;i="6.27,208,1786978800"; 
   d="scan'208";a="265537758"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:37:15 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3B05D1000352
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 03:37:16 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E2F5F1000476
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 03:37:15 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D5B5818002CF;
	Thu, 12 Nov 2026 03:37:09 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
Date: Thu, 12 Nov 2026 12:36:21 +0900
Subject: [PATCH RFC v2 1/2] KVM: arm64: CCA: Add support for configuring
 the Realm MEC policy
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-mm-v1-mec-v2-1-0d1dd260a588@fujitsu.com>
References: <20261112-mm-v1-mec-v2-0-0d1dd260a588@fujitsu.com>
In-Reply-To: <20261112-mm-v1-mec-v2-0-0d1dd260a588@fujitsu.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 cgroups@vger.kernel.org, Kohei Enju <enju.kohei@fujitsu.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_193723_542294_14007F49 
X-CRM114-Status: GOOD (  23.20  )
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

Introduce the KVM_ARM_VM_RMI_CTRL device attribute group to allow
userspace to configure Realm VM parameters before the Realm is created
using KVM_SET_DEVICE_ATTR.

Currently, KVM_ARM_VM_RMI_CTRL_MEC_POLICY is the only supported
attribute. Its value can be KVM_ARM_VM_RMI_MEC_POLICY_SHARED or
KVM_ARM_VM_RMI_MEC_POLICY_PRIVATE. Reject the private policy if the
platform does not support private MECs.

If userspace does not explicitly configure the MEC policy,
KVM_ARM_VM_RMI_MEC_POLICY_SHARED is used by default.

Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
 Documentation/virt/kvm/devices/vm.rst   | 25 +++++++++++++++
 arch/arm64/include/asm/kvm_rmi.h        |  5 +++
 arch/arm64/include/uapi/asm/kvm.h       |  4 +++
 arch/arm64/kvm/arm.c                    |  4 +++
 arch/arm64/kvm/rmi.c                    | 57 +++++++++++++++++++++++++++++++++
 drivers/firmware/arm_rmm/rmi.c          |  6 ++++
 include/linux/arm-rmi-cmds.h            |  1 +
 tools/arch/arm64/include/uapi/asm/kvm.h |  4 +++
 8 files changed, 106 insertions(+)

diff --git a/Documentation/virt/kvm/devices/vm.rst b/Documentation/virt/kvm/devices/vm.rst
index 78e63eb9994e..b0bd30750aa1 100644
--- a/Documentation/virt/kvm/devices/vm.rst
+++ b/Documentation/virt/kvm/devices/vm.rst
@@ -418,3 +418,28 @@ will reject attempts to define a filter for any portion of these ranges:
         0x8000_0000 0x8000_FFFF
         0xC000_0000 0xC000_FFFF
         =========== ===============
+
+7. GROUP: KVM_ARM_VM_RMI_CTRL
+=============================
+
+:Architectures: arm64
+
+7.1. ATTRIBUTE: KVM_ARM_VM_RMI_CTRL_MEC_POLICY (w/o)
+----------------------------------------------------
+
+:Parameters: Pointer to a ``__u8`` value
+
+:Returns:
+
+  =========  ===========================================================
+  ENXIO      The VM is not a Realm VM
+  EBUSY      The Realm has already been created
+  EINVAL     Invalid MEC policy value
+  EOPNOTSUPP Private MEC policy is not supported by the platform
+  EFAULT     The value could not be copied from userspace
+  =========  ===========================================================
+
+Configures the MEC policy for a Realm VM before the Realm is created. The value
+must be either ``KVM_ARM_VM_RMI_MEC_POLICY_SHARED`` or
+``KVM_ARM_VM_RMI_MEC_POLICY_PRIVATE``. If userspace does not explicitly set the
+MEC policy, ``KVM_ARM_VM_RMI_MEC_POLICY_SHARED`` is used by default.
diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 3933f8d834b8..08c1f6d0671d 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -59,6 +59,7 @@ enum realm_state {
  * @state: The lifetime state machine for the realm
  * @ia_bits: Number of valid Input Address bits in the IPA
  * @stage2_unmapped: The Realm stage-2 mappings have been removed
+ * @mec_policy: MEC policy for the Realm VM
  */
 struct realm {
 	void *rd;
@@ -73,6 +74,7 @@ struct realm {
 	enum realm_state state;
 	unsigned int ia_bits;
 	bool stage2_unmapped;
+	unsigned int mec_policy;
 };
 
 /**
@@ -109,9 +111,12 @@ int kvm_realm_teardown_stage2(struct kvm *kvm);
 void kvm_destroy_rec(struct kvm_vcpu *vcpu);
 
 struct kvm_arm_rmi_populate;
+struct kvm_device_attr;
 
 int kvm_arm_rmi_populate(struct kvm *kvm,
 			 struct kvm_arm_rmi_populate *arg);
+int kvm_vm_rmi_has_attr(struct kvm *kvm, struct kvm_device_attr *attr);
+int kvm_vm_rmi_set_attr(struct kvm *kvm, struct kvm_device_attr *attr);
 
 enum kvm_gfn_range_filter;
 
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 65ee09bd1463..aa1e6fe6192e 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -403,6 +403,10 @@ enum {
 /* Device Control API on vm fd */
 #define KVM_ARM_VM_SMCCC_CTRL		0
 #define   KVM_ARM_VM_SMCCC_FILTER	0
+#define KVM_ARM_VM_RMI_CTRL		1
+#define   KVM_ARM_VM_RMI_CTRL_MEC_POLICY	0
+#define     KVM_ARM_VM_RMI_MEC_POLICY_SHARED	0
+#define     KVM_ARM_VM_RMI_MEC_POLICY_PRIVATE	1
 
 /* Device Control API: ARM VGIC */
 #define KVM_DEV_ARM_VGIC_GRP_ADDR	0
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8e94f1bff830..be676c13e219 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2329,6 +2329,8 @@ static int kvm_vm_has_attr(struct kvm *kvm, struct kvm_device_attr *attr)
 	switch (attr->group) {
 	case KVM_ARM_VM_SMCCC_CTRL:
 		return kvm_vm_smccc_has_attr(kvm, attr);
+	case KVM_ARM_VM_RMI_CTRL:
+		return kvm_vm_rmi_has_attr(kvm, attr);
 	default:
 		return -ENXIO;
 	}
@@ -2339,6 +2341,8 @@ static int kvm_vm_set_attr(struct kvm *kvm, struct kvm_device_attr *attr)
 	switch (attr->group) {
 	case KVM_ARM_VM_SMCCC_CTRL:
 		return kvm_vm_smccc_set_attr(kvm, attr);
+	case KVM_ARM_VM_RMI_CTRL:
+		return kvm_vm_rmi_set_attr(kvm, attr);
 	default:
 		return -ENXIO;
 	}
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 0d254fb80cde..01ac8d4fec7c 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -7,6 +7,7 @@
 #include <linux/arm-rmi-cmds.h>
 #include <linux/kvm_host.h>
 #include <linux/overflow.h>
+#include <linux/uaccess.h>
 
 #include <asm/daifflags.h>
 #include <asm/kvm_emulate.h>
@@ -586,6 +587,9 @@ static int realm_create_rd(struct kvm *kvm)
 		params->flags0 |= RMI_REALM_PARAM_FLAG_PMU;
 	}
 
+	params->flags0 |= FIELD_PREP(RMI_REALM_PARAM_FLAG_MEC_POLICY_MASK,
+				    realm->mec_policy);
+
 	r = realm_init_sve_param(kvm, params);
 	if (r)
 		goto out_undelegate_tables;
@@ -1481,6 +1485,57 @@ int kvm_arm_rmi_populate(struct kvm *kvm,
 	return ret;
 }
 
+static int kvm_vm_rmi_set_mec_policy(struct kvm *kvm, u8 policy)
+{
+	guard(mutex)(&kvm->arch.config_lock);
+
+	if (!kvm_vm_is_realm(kvm))
+		return -ENXIO;
+
+	if (kvm_realm_state(kvm) != REALM_STATE_NONE)
+		return -EBUSY;
+
+	if (policy != KVM_ARM_VM_RMI_MEC_POLICY_SHARED &&
+	    policy != KVM_ARM_VM_RMI_MEC_POLICY_PRIVATE)
+		return -EINVAL;
+
+	if (policy == KVM_ARM_VM_RMI_MEC_POLICY_PRIVATE &&
+	    rmi_mec_count() == 0)
+		return -EOPNOTSUPP;
+
+	kvm->arch.realm.mec_policy = policy;
+	return 0;
+}
+
+int kvm_vm_rmi_has_attr(struct kvm *kvm, struct kvm_device_attr *attr)
+{
+	if (!kvm_vm_is_realm(kvm))
+		return -ENXIO;
+
+	switch (attr->attr) {
+	case KVM_ARM_VM_RMI_CTRL_MEC_POLICY:
+		return 0;
+	default:
+		return -ENXIO;
+	}
+}
+
+int kvm_vm_rmi_set_attr(struct kvm *kvm, struct kvm_device_attr *attr)
+{
+	void __user *uaddr = (void __user *)attr->addr;
+	u8 policy;
+
+	switch (attr->attr) {
+	case KVM_ARM_VM_RMI_CTRL_MEC_POLICY:
+		if (copy_from_user(&policy, uaddr, sizeof(policy)))
+			return -EFAULT;
+
+		return kvm_vm_rmi_set_mec_policy(kvm, policy);
+	default:
+		return -ENXIO;
+	}
+}
+
 static int kvm_create_rec(struct kvm_vcpu *vcpu)
 {
 	struct user_pt_regs *vcpu_regs = &vcpu->arch.ctxt.regs;
@@ -1695,6 +1750,8 @@ int kvm_init_realm(struct kvm *kvm)
 {
 	struct realm *realm = &kvm->arch.realm;
 
+	realm->mec_policy = KVM_ARM_VM_RMI_MEC_POLICY_SHARED;
+
 	realm->sro = kmalloc_obj(*realm->sro);
 	if (!realm->sro)
 		return -ENOMEM;
diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index 77255a90e0a6..27edf060d2d9 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -793,6 +793,12 @@ unsigned long rmi_feat_reg(unsigned int index)
 }
 EXPORT_SYMBOL_GPL(rmi_feat_reg);
 
+u64 rmi_mec_count(void)
+{
+	return u64_get_bits(rmi_feat_reg(4), RMI_FEATURE_REGISTER_4_MEC_COUNT);
+}
+EXPORT_SYMBOL_GPL(rmi_mec_count);
+
 static int rmi_rmm_config_set(unsigned long cfg_ptr)
 {
 	struct arm_smccc_1_2_regs regs = {
diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
index c13e8775898e..530136ccb791 100644
--- a/include/linux/arm-rmi-cmds.h
+++ b/include/linux/arm-rmi-cmds.h
@@ -68,6 +68,7 @@ static __always_inline void rmi_smccc_invoke_once(struct arm_smccc_1_2_regs *reg
 }
 
 unsigned long rmi_feat_reg(unsigned int index);
+u64 rmi_mec_count(void);
 
 int rmi_delegate_range(phys_addr_t phys, unsigned long size,
 		       phys_addr_t *out_phys);
diff --git a/tools/arch/arm64/include/uapi/asm/kvm.h b/tools/arch/arm64/include/uapi/asm/kvm.h
index 65ee09bd1463..aa1e6fe6192e 100644
--- a/tools/arch/arm64/include/uapi/asm/kvm.h
+++ b/tools/arch/arm64/include/uapi/asm/kvm.h
@@ -403,6 +403,10 @@ enum {
 /* Device Control API on vm fd */
 #define KVM_ARM_VM_SMCCC_CTRL		0
 #define   KVM_ARM_VM_SMCCC_FILTER	0
+#define KVM_ARM_VM_RMI_CTRL		1
+#define   KVM_ARM_VM_RMI_CTRL_MEC_POLICY	0
+#define     KVM_ARM_VM_RMI_MEC_POLICY_SHARED	0
+#define     KVM_ARM_VM_RMI_MEC_POLICY_PRIVATE	1
 
 /* Device Control API: ARM VGIC */
 #define KVM_DEV_ARM_VGIC_GRP_ADDR	0

-- 
2.43.0


