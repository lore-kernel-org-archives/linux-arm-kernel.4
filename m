Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C0060A261A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EOehoGUL;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=S/aXOX9r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lIuV6FUuCmbku+6c3MP0BacKv5OXTGUjdv/prBUucwQ=; b=EOehoGULPHHP20zZbq3BJoglAn
	0ZjDDq/Euc9bSVjStzOlwg15ddPQJnkq+pDkXFUHVYW+yUGRzBvfQLewTMWwdljR0rtrpfNt74WRN
	bCJRczg1Jyu6oSOfeRdSYumR0zwHJl+xivwEteJbazl6DMcW3RFcS/JOKSAgLswT/+NEvU9Z7c45Z
	3GyPl/zUoQvMXz2WM1oXttJ7V8zqAmVNzb+wcuDp7PSOR7kJeHM+Mfb7zg+mtSibvXyALf+DgADTb
	xu0mr1ErUbdX+u1NTEm8ofY4Twy0uOkuThovHNceszRmImwZwIIdhT+agax+Ok1pP5gdrQKo6T87O
	PgEheBUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnkF-0000000CEvU-1fDi;
	Fri, 13 Nov 2026 09:38:55 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnkB-0000000CEr3-0r5S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:38:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lIuV6FUuCmbku+6c3MP0BacKv5OXTGUjdv/prBUucwQ=;
	b=S/aXOX9r9n9WEKK0m+2dsd4BkY5a453lC7zFvvCFk6fU7g/tug8D05gyvGxBq0vGKDEYPwpEg
	CjxCEk2WXr4RQILCWUCtd2cRdIiAkyPn6Vrin93dYMc4Kt+LKoMesVQmN/O1Eet9MONTgOlBgtF
	mQYJ3N3z57lsE/IlFn/QxHg=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jQsdg3pqFz12LJw;
	Fri, 13 Nov 2026 17:38:47 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id 7241640561;
	Fri, 13 Nov 2026 17:38:41 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk300013.china.huawei.com
 (7.202.194.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 17:38:40 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>
CC: <maz@kernel.org>, <oupton@kernel.org>, <fuad.tabba@linux.dev>,
	<yuzenghui@huawei.com>, <joey.gouly@arm.com>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <yangjinqian1@huawei.com>,
	<liuyonglong@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <tangchengchang@huawei.com>,
	<zhengtian10@huawei.com>, <linuxarm@huawei.com>, <liujian222@huawei.com>
Subject: [PATCH v2] KVM: arm64: Register irq_bypass consumers only when direct MSIs are possible
Date: Fri, 13 Nov 2026 17:38:40 +0800
Message-ID: <20261113093840.1034795-1-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk300013.china.huawei.com (7.202.194.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_013852_049588_E27352DE 
X-CRM114-Status: GOOD (  14.41  )
X-Spam-Score: -2.1 (--)
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

kvm_arch_has_irq_bypass() on arm64 returns true unconditionally, so
every irqfd assignment registers an irq_bypass consumer even when KVM
cannot do direct MSI forwarding for the VM. In that case
kvm_vgic_v4_set_forwarding() bails out at its very first check, since
vgic_supports_direct_msis() is false, and the registration becomes pure
overhead: every KVM_IRQFD ioctl takes the global irq_bypass mutex, which
becomes a contention point when many VMs boot concurrently.

Pass struct kvm to kvm_arch_has_irq_bypass() and gate the registration
on vgic_supports_direct_msis(kvm), like x86 gates on
enable_device_posted_irqs. Reading the per-VM vgic state is safe here,
as kvm_irqfd_assign() requires an initialized irqchip.

Functionally this is a no-op: without direct MSI support the consumer
registration never did anything beyond acquiring the lock. On a
GICv3-only host booting 100 microVMs concurrently this cuts the average
boot time by ~5 ms, matching the gain observed with
CONFIG_HAVE_KVM_IRQ_BYPASS=n.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
v1 -> v2:
 - Gate on vgic_supports_direct_msis(kvm) instead of the global
   kvm_vgic_global_state.has_gicv4 flag, This requires passing struct
   kvm to kvm_arch_has_irq_bypass() and updating the x86 and PPC callers.

v1: https://lore.kernel.org/linux-arm-kernel/20261109112018.241298-1-yangjinqian1@huawei.com/

 arch/arm64/include/asm/kvm_host.h | 4 ++--
 arch/arm64/kvm/vgic/vgic.h        | 1 -
 arch/powerpc/kvm/powerpc.c        | 2 +-
 arch/x86/include/asm/kvm_host.h   | 2 +-
 arch/x86/kvm/irq.c                | 2 +-
 arch/x86/kvm/vmx/posted_intr.c    | 2 +-
 include/kvm/arm_vgic.h            | 1 +
 include/linux/kvm_host.h          | 2 +-
 virt/kvm/eventfd.c                | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb130..da86646b6709 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1742,9 +1742,9 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define kvm_has_sctlr2(k)				\
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, SCTLRX, IMP))
 
-static inline bool kvm_arch_has_irq_bypass(void)
+static inline bool kvm_arch_has_irq_bypass(struct kvm *kvm)
 {
-	return true;
+	return vgic_supports_direct_msis(kvm);
 }
 
 void kvm_idregs_enforce_dependencies(struct kvm *kvm);
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 97fc3bdf520e..3c128e4d9afa 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -521,7 +521,6 @@ static inline bool vgic_host_has_gicv5(void)
 }
 
 bool system_supports_direct_sgis(void);
-bool vgic_supports_direct_msis(struct kvm *kvm);
 bool vgic_supports_direct_sgis(struct kvm *kvm);
 
 static inline bool vgic_supports_direct_irqs(struct kvm *kvm)
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 9194cf492d1c..74c0d457f4ca 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -875,7 +875,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
  * irq_bypass_stop and irq_bypass_start are not needed and so
  * kvm_ops are not defined for them.
  */
-bool kvm_arch_has_irq_bypass(void)
+bool kvm_arch_has_irq_bypass(struct kvm *kvm)
 {
 	return ((kvmppc_hv_ops && kvmppc_hv_ops->irq_bypass_add_producer) ||
 		(kvmppc_pr_ops && kvmppc_pr_ops->irq_bypass_add_producer));
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 1ee4b127004d..8b6f5b72fea5 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1919,7 +1919,7 @@ static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
 	kvm_x86_call(vcpu_unblocking)(vcpu);
 }
 
-static inline bool kvm_arch_has_irq_bypass(void)
+static inline bool kvm_arch_has_irq_bypass(struct kvm *kvm)
 {
 	return enable_device_posted_irqs;
 }
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 871977288272..81eeecc614ef 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -439,7 +439,7 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 	struct kvm_lapic_irq irq;
 	int r;
 
-	if (WARN_ON_ONCE(!irqchip_in_kernel(kvm) || !kvm_arch_has_irq_bypass()))
+	if (WARN_ON_ONCE(!irqchip_in_kernel(kvm) || !kvm_arch_has_irq_bypass(kvm)))
 		return -EINVAL;
 
 	if (entry && entry->type == KVM_IRQ_ROUTING_MSI) {
diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 2644add54b76..15d7a97fd7f6 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -153,7 +153,7 @@ static bool vt_can_use_vtd_pi(struct kvm *kvm)
 	 * bypass IRQ being attached to the VM.  vt_pi_start_bypass() ensures
 	 * blockng vCPUs will see an elevated count or get KVM_REQ_UNBLOCK.
 	 */
-	return irqchip_in_kernel(kvm) && kvm_arch_has_irq_bypass() &&
+	return irqchip_in_kernel(kvm) && kvm_arch_has_irq_bypass(kvm) &&
 	       READ_ONCE(kvm->arch.nr_possible_bypass_irqs);
 }
 
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 4b2c41917b77..39c69d861060 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -215,6 +215,7 @@ struct vgic_global {
 };
 
 extern struct vgic_global kvm_vgic_global_state;
+bool vgic_supports_direct_msis(struct kvm *kvm);
 
 #define VGIC_V2_MAX_LRS		(1 << 6)
 #define VGIC_V3_MAX_LRS		16
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e7fc94e2910a..bdf002a62686 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2458,7 +2458,7 @@ struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void);
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
 struct kvm_kernel_irqfd;
 
-bool kvm_arch_has_irq_bypass(void);
+bool kvm_arch_has_irq_bypass(struct kvm *kvm);
 int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *,
 			   struct irq_bypass_producer *);
 void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *,
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index f43b8b25bc85..07a7c8fc3bbe 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -488,7 +488,7 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 		schedule_work(&irqfd->inject);
 
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
-	if (kvm_arch_has_irq_bypass()) {
+	if (kvm_arch_has_irq_bypass(kvm)) {
 		irqfd->consumer.add_producer = kvm_arch_irq_bypass_add_producer;
 		irqfd->consumer.del_producer = kvm_arch_irq_bypass_del_producer;
 		irqfd->consumer.stop = kvm_arch_irq_bypass_stop;
-- 
2.33.0


