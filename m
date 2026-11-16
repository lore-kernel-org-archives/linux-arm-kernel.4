Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C219606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n2xH5/4g;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=al9ga3TH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VpUJNN9+a/GlMSqz88huValOHytFq94955DZY1zfLec=; b=n2xH5/4gyEBVMe
	T0M2FSCBY/Y5WenI7AIDFbUNFs1HW03OfO67oAvNgVYzC5BAZG2dAZqAUDjVUh6wZ1o2Wx7votZbn
	u+QwpKxvooPpIeZVGPeuXmiYjW3rGyA6ULo0fx2vcKTAGj+T1nQA9hC9n8V2cypG8Z1Khy9XGYHM+
	XChxVu+NGH8J6LgIl5T62XzuvNR+vMEx5LH4ocmvd1ZLNxzPNo5ZJo5TPNPipXzNGmZvXPfI6OccG
	EBgDlvj+vGoM53D0HQ1jgSChPCojeW4LJ3An1Ov49nkWfXsvFZ4gVXG5Kw6CbnVgCjeDqeEU0yJZG
	zEGUKh9Aeyky5psRZDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSquJ-00000001N3P-2zqp;
	Mon, 16 Nov 2026 07:13:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSquE-00000001N1U-0DT5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:13:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6660C1A25;
	Sun, 15 Nov 2026 23:13:30 -0800 (PST)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 90D783F673;
	Sun, 15 Nov 2026 23:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794813213; bh=aOEovc4UUb37VOtU6pV8CsO4jvExxScmZMPfHabsAvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=al9ga3THmbqwes3lXSjI8QJHGWLTdacCLfEPjYv22PEW5d5lsXC7HYjpD/UIkzjg2
	 7Lq4siwviQLqmIcB0U3kxmcks+Q6x57tnNTsU7HNtnVZVMd3c53XjreEzhI923kFgt
	 doDB6nQ0fuZaon/Ve1Kln6Pk+MalGWEi8Eegynf8=
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
Subject: [PATCH 2/2] KVM: arm64: gic-v5: Don't move the vPE doorbell from kvm_sched_out()
Date: Mon, 16 Nov 2026 07:13:04 +0000
Message-Id: <20261116071304.2037895-3-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116071304.2037895-1-justin.he@arm.com>
References: <20261116071304.2037895-1-justin.he@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_231334_180399_77164460 
X-CRM114-Status: GOOD (  14.18  )
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

vgic_v5_put() makes the vPE doorbell affine to the current CPU when the
vcpu enters WFI. This is meant for the explicit put from kvm_vcpu_wfi(),
but the same code also runs from kvm_sched_out() whenever the vPE is
resident with IN_WFI set.

That happens when the vcpu thread is scheduled back in while halting:
unlike vgic_v4_load(), vgic_v5_load() does not bail out on IN_WFI and
makes the vPE resident again, so the next sched-out, from
kvm_vcpu_block() or from a preemption during halt polling, goes through
vgic_v5_put() with IN_WFI still set. If the thread moved to another
CPU in between, irq_set_affinity() is called with the runqueue lock
held:

  irq_set_affinity+0x38/0x88
  vgic_v5_put+0xf0/0x2b8
  kvm_vgic_put+0x64/0xb0
  vhe_vcpu_put+0x40/0xa0
  kvm_arch_vcpu_put+0x28/0x98
  kvm_sched_out+0x4c/0x70
  prepare_task_switch+0x1b0/0x388
  __schedule+0x234/0x958
  schedule+0x58/0x138
  kvm_vcpu_block+0x88/0x130
  kvm_vcpu_halt+0x120/0x468
  kvm_vcpu_wfi+0x80/0x190

irq_set_affinity() takes the doorbell's irq_desc lock and, when the
doorbell is force-threaded (threadirqs, PREEMPT_RT), wakes its irq
thread:

  &rq->__lock --> &irq_desc_lock_class --> &p->pi_lock --> &rq->__lock

Moving the doorbell is only an optimisation: the doorbell handler kicks
the vcpu from any CPU, and the next WFI entry moves it again. Skip it
when vcpu->scheduled_out is set, which kvm_vcpu_put_hw_mmu() also uses
to tell a sched-out from an explicit put.

Fixes: 2111261ac1c8 ("KVM: arm64: gic-v5: Request doorbells when VPEs enter WFI")
Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 91810fbd99af..5824b00bb50d 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -1248,8 +1248,14 @@ void vgic_v5_put(struct kvm_vcpu *vcpu)
 			 * Make the doorbell affine to this CPU, if it isn't
 			 * already. Actively check the cpumask first as it is
 			 * cheaper than changing the affinity every time.
+			 *
+			 * Don't do it from kvm_sched_out(), which holds the
+			 * runqueue lock: irq_set_affinity() takes the
+			 * doorbell's irq_desc lock and may wake its irq
+			 * thread. The doorbell works from any CPU, and the
+			 * next WFI entry moves it.
 			 */
-			if (!cpumask_test_cpu(cpu, aff)) {
+			if (!vcpu->scheduled_out && !cpumask_test_cpu(cpu, aff)) {
 				int ret;
 
 				ret = irq_set_affinity(db_irq, cpumask_of(cpu));
-- 
2.34.1


