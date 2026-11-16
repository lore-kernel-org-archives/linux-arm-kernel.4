Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5333D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dsbqeG+e;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O4q2Zb4x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lk80JFgg928CrLC0eQwio88WY0+Htp1D4M8ps95Hc3g=; b=dsbqeG+eVuRGg+
	Aa85x6qLM49SJNBkOWB8HYoWaRKtQLAhjROdgiPBI5XYyMSnJYa+jvZJ35VjcL10m2+/H904rV3ui
	M5t7NnZA0sxd/i+JiOaNOgjM2qV6Z/Klz1FDQ4FOoc0xBfv16zCOhiCTiQHSv5LzM5ItopcqmsMyx
	v0NyjVVRHeU4LrC27RujlG4LJ/iZ+2QdU6SBFUIp80cSYb4HQTabGL59Fjiqovqpb+LMbb1QQ547b
	g7wkNz2uCLK9nsos2adqUEAnOQ6cYrK9/Bu7WOdGf0EyFyusZzuOtCFygdzUvmVtcpxMhYJqRBRgM
	irZUWjVxRSlRr/98i2TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSquE-00000001N1q-2WbV;
	Mon, 16 Nov 2026 07:13:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqu8-00000001Mzs-27up
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:13:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE87D1713;
	Sun, 15 Nov 2026 23:13:24 -0800 (PST)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 17BB73F673;
	Sun, 15 Nov 2026 23:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794813207; bh=P3UEMyn2wpBrgjmF9RmDIUq18+/S6PMreyCiNru93bU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O4q2Zb4xqJCVRY+nkfUjDNXrXhb5U87zLLYCIe81fNEv7Xy1hwW2GUnJ7d/MeDznc
	 tnCu+oiOty3/7CHE3960x54v6znRYHPXj2485K7H6+5RhfJnymIzMnwCLTgqoc6Sm3
	 ttJDiFOhvOg3XTfCMPaVzPjShvkappUiTKmK0YME=
From: Jia He <justin.he@arm.com>
To: maz@kernel.org,
	oupton@kernel.org
Cc: fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	bigeasy@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Jia He <justin.he@arm.com>
Subject: [PATCH 1/2] KVM: arm64: Give the host timer interrupts a separate lockdep class
Date: Mon, 16 Nov 2026 07:13:03 +0000
Message-Id: <20261116071304.2037895-2-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116071304.2037895-1-justin.he@arm.com>
References: <20261116071304.2037895-1-justin.he@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_231328_632384_907434F6 
X-CRM114-Status: GOOD (  11.37  )
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

With a GICv5 guest, kvm_timer_vcpu_put() clears the active state of the
host timer interrupts with irq_set_irqchip_state(), which takes their
irq_desc lock. On preemption this runs from kvm_sched_out() with the
runqueue lock held:

  &rq->__lock --> &irq_desc_lock_class

By default, all irq descriptors share a single lockdep class, so this
closes a cycle with any interrupt that queues affinity notifier work
under its own descriptor lock (mlx5, for example), as already seen with
the GICv4 vPE doorbells:

  &irq_desc_lock_class --> &pool->lock --> &p->pi_lock --> &rq->__lock

For the timer interrupts this is a false positive. Nothing that runs
under their descriptor lock leads back to the scheduler:

- They are requested only by KVM, with request_percpu_irq(). Per-CPU
  interrupts are never threaded (irq_set_percpu_devid() sets
  IRQ_NOTHREAD), so there is no irq thread to wake, unlike the vPE
  doorbells with threadirqs.

- Their affinity is fixed and never changed, so no affinity notifier
  work or thread affinity update is triggered.

- The irqchip callbacks reached under the lock (the KVM timer_chip,
  forwarding to the GIC) only access GIC registers.

Give them a separate lockdep class. This is done for all vGIC types, as
none of the above is specific to GICv5. Both timers share the class, so
dependencies between them are still checked.

Fixes: 9491c63b6cd7 ("KVM: arm64: gic-v5: Enlighten arch timer for GICv5")
Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/kvm/arch_timer.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index b2c5ba499aa5..1088563d32a3 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1362,6 +1362,17 @@ static void kvm_irq_fixup_flags(unsigned int virq, u32 *flags)
 	}
 }
 
+/*
+ * With a GICv5 guest, the timer interrupts' irq_desc lock is taken under
+ * the runqueue lock (kvm_sched_out() -> kvm_timer_vcpu_put()). Give them
+ * their own lockdep class, so that they are not mixed up with interrupts
+ * whose affinity notifier queues work under the irq_desc lock. Nothing
+ * under the timers' own irq_desc lock leads back to the scheduler: they
+ * are per-CPU (never threaded) and their affinity never changes.
+ */
+static struct lock_class_key kvm_timer_irq_lock_class;
+static struct lock_class_key kvm_timer_irq_request_class;
+
 static int kvm_irq_init(struct arch_timer_kvm_info *info)
 {
 	struct irq_domain *domain = NULL;
@@ -1374,6 +1385,8 @@ static int kvm_irq_init(struct arch_timer_kvm_info *info)
 
 	host_vtimer_irq = info->virtual_irq;
 	kvm_irq_fixup_flags(host_vtimer_irq, &host_vtimer_irq_flags);
+	irq_set_lockdep_class(host_vtimer_irq, &kvm_timer_irq_lock_class,
+			      &kvm_timer_irq_request_class);
 
 	if (kvm_vgic_global_state.no_hw_deactivation ||
 	    kvm_vgic_global_state.type == VGIC_V5) {
@@ -1401,6 +1414,8 @@ static int kvm_irq_init(struct arch_timer_kvm_info *info)
 	if (info->physical_irq > 0) {
 		host_ptimer_irq = info->physical_irq;
 		kvm_irq_fixup_flags(host_ptimer_irq, &host_ptimer_irq_flags);
+		irq_set_lockdep_class(host_ptimer_irq, &kvm_timer_irq_lock_class,
+				      &kvm_timer_irq_request_class);
 
 		if (domain)
 			WARN_ON(irq_domain_push_irq(domain, host_ptimer_irq,
-- 
2.34.1


