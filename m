Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D019606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uo0whQsV;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G229/sM7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ou5XHXMFjy2tsHMgHvL3l0HkkEqCUhvCxjE9vqvsRzg=; b=uo0whQsVKcwEzX14m1LvtqeXuM
	KWis7P4H8HVrAzc7FM5E85RnfuclUP2NhTnKkkqd2QhwGNV5KoPWqrH5FUl+cd2R7s7Txztf/YOf9
	AaasuSKwbw/FppsN60z1b81nN6Pl1Hqe+m6BVNOxcE/5U5U/F15YZBOZf1WjdX5oRbhoHx5Ik/2BB
	yyKj37I1T8cspS9NkKmXF7HIqPUhELOaP7WtQ1wLyICYCazyzWlgA2iKncGJUgyJLETIa1Ig0MwG3
	95727vuG+aLGqDjt7e2Bhrpc6X8l9QuYuS6AclyYewODIR2SsPoZJVBGnPttGhlR9h5CyP3d9medD
	VILP04Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gt-0000000D5WP-3lV8;
	Thu, 19 Nov 2026 18:54:11 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FP-0000000D464-2zvO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:41 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-4c55ba309c2so198798b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114358; x=1795719158; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ou5XHXMFjy2tsHMgHvL3l0HkkEqCUhvCxjE9vqvsRzg=;
        b=G229/sM73BuCaD0GGVK10F24QYVfXKV4HazBkhCG+MuPJ6xQbPqDuJPo+F6OpyMkFZ
         Tz4LoQhiIM0tDTiiS3a1EpvpMQy+4EtuX0r09N8S1qmrMQrgwRTzD7ytv+J5UdICCh04
         q4LrWcbafSfT4y7twxOx7Ywo7iAlRuKvLLHgEYM6lvz7LrzuxpZHdkYLQT8KmOknobVO
         fwxXxIcmRuVEcGhXERWW6LeTOxUquGsq9hW/EGH/F7tBShnYMuuDZUjpaulzqTr6oQqz
         7m2oYtAq87LL56p6k7LO9fqfjvANGbxDzeSLwScQIJ4H+XGSlC4flWK7LPWPBGQKsz5p
         D2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114358; x=1795719158;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ou5XHXMFjy2tsHMgHvL3l0HkkEqCUhvCxjE9vqvsRzg=;
        b=Ahg1MVDPn6OdX4HkBye08TcBv23gd+ewVgWRs3jekvLz3gh8RB/i84MZLUlakzLlxx
         /ElqA+B7ISO6/wSspRmPVF/JyN3v0Xj1MchhMUQzXhWSQvAzHwDR2kIVNklOk3MiKZCc
         8HMQKXnXA5KJWBxDvuNIuIWoD2PsiuhVXbzN91zW0xO0NQzydIxjKtwqbuqULheNIeiG
         T7738D1b3JTF59MvsFd3ACk2cVkeifpTdm1WiuBnXU1Xsfg2xl44+eRAeB2GSlTgYc/M
         gLWKv+faHiIiyP8VFMFVk6T+6szxSTWyotDyeB0TSUW2AsdlsiTKhiHkSVhvJJjk+8wj
         mvFw==
X-Forwarded-Encrypted: i=1; AL+hErFCpjy7N0+hlF4y77YXHmWieQ861HQl8FWkCKOB+4VHoQojhUP/zQ9AeSa14FI/rF/3mvFbghZ3Uf8uMUkvtC/i@lists.infradead.org
X-Gm-Message-State: APuU4Z8qxqnOeUbFVHVhVup5YyVbgmTybHT/Degt8fbsdl7uveDI3WiQ
	WbkLKOKRLTlVA0HndTcfxEAlqX59zrD588o1k3DJvgStrWK9aGaPb18fS75NbXsc7zFNE4AnBnv
	izK5g7vsmAlDk1849gIm2ZLAShw==
X-Received: from iljv13.prod.google.com ([2002:a05:6e02:13cd:b0:54e:ab26:add9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6711:b0:568:1cc2:96ec with SMTP id 5614622812f47-57a0c29f7dcmr862785b6e.46.1795114357559;
 Thu, 19 Nov 2026 10:52:37 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:04 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-23-coltonlewis@google.com>
Subject: [PATCH v10 22/33] KVM: arm64: Apply dynamic guest counter reservations
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_105239_834024_6CAB1FFF 
X-CRM114-Status: GOOD (  22.98  )
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

Reserve and release guest PMU counters dynamically during vCPU load and
put rather than statically at VM creation.

Add kvm_pmu_set_guest_counters() in arch/arm64/kvm/pmu-direct.c, called
from __kvm_pmu_load() and __kvm_pmu_put() with local interrupts
disabled. When the requested guest counter mask collides with active
host events in cpuc->used_mask (or when releasing counters after
squeezing a host event), invoke perf_pmu_resched_update() with
kvm_pmu_update_mask() to update per-CPU cpuc->cntr_mask between
scheduling host events out and back in; otherwise update cpuc->cntr_mask
directly. Warn once in armpmu_add() if a pinned host event fails counter
allocation while guest counters are reserved.

Skip releasing and re-reserving host counters across nested ERET and
nested exception transitions (IN_NESTED_ERET and IN_NESTED_EXCEPTION)
since the vCPU remains on the same physical CPU.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c  | 118 ++++++++++++++++++++++++++++++-----
 drivers/perf/arm_pmu.c       |   9 ++-
 include/linux/perf/arm_pmu.h |   1 +
 3 files changed, 113 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index ace3e8e781538..cc4ff00d6f41e 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -154,6 +154,70 @@ static u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu)
 	return u64_replace_bits(pmcr, n, ARMV8_PMU_PMCR_N);
 }
 
+/* Callback to update counter mask between perf scheduling */
+static void kvm_pmu_update_mask(struct pmu *pmu, void *data)
+{
+	struct arm_pmu *arm_pmu = to_arm_pmu(pmu);
+	struct pmu_hw_events *cpuc = this_cpu_ptr(arm_pmu->hw_events);
+	unsigned long *new_mask = data;
+
+	bitmap_copy(cpuc->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
+}
+
+/**
+ * kvm_pmu_set_guest_counters() - Handle dynamic counter reservations
+ * @cpu_pmu: struct arm_pmu to potentially modify
+ * @guest_mask: new guest mask for the pmu
+ *
+ * Check if guest counters will interfere with current host events and
+ * call into perf_pmu_resched_update if a reschedule is required.
+ */
+static void kvm_pmu_set_guest_counters(struct arm_pmu *cpu_pmu, u64 guest_mask)
+{
+	struct pmu_hw_events *cpuc;
+	DECLARE_BITMAP(guest_bitmap, ARMPMU_MAX_HWEVENTS);
+	DECLARE_BITMAP(new_mask, ARMPMU_MAX_HWEVENTS);
+	unsigned long flags;
+	bool need_resched = false;
+
+	if (!cpu_pmu)
+		return;
+
+	local_irq_save(flags);
+	cpuc = this_cpu_ptr(cpu_pmu->hw_events);
+
+	bitmap_from_arr64(guest_bitmap, &guest_mask, ARMPMU_MAX_HWEVENTS);
+	bitmap_copy(new_mask, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS);
+
+	if (guest_mask) {
+		/* Subtract guest counters from available host mask */
+		bitmap_andnot(new_mask, new_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS);
+
+		/* Did we collide with an active host event? */
+		if (bitmap_intersects(cpuc->used_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS)) {
+			need_resched = true;
+			cpuc->host_squeezed = true;
+		}
+	} else {
+		/*
+		 * Restoring to full mask.
+		 * Only resched if we previously squeezed an event.
+		 */
+		if (cpuc->host_squeezed) {
+			need_resched = true;
+			cpuc->host_squeezed = false;
+		}
+	}
+
+	if (need_resched)
+		/* Collision: run full perf reschedule */
+		perf_pmu_resched_update(&cpu_pmu->pmu, kvm_pmu_update_mask, new_mask);
+	else
+		/* Host was never using guest counters anyway */
+		bitmap_copy(cpuc->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
+	local_irq_restore(flags);
+}
+
 static u64 kvm_pmu_direct_cntr_read(struct kvm_vcpu *vcpu, u8 idx)
 {
 	lockdep_assert_preemption_disabled();
@@ -422,15 +486,7 @@ static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
 		kvm_pmu_apply_single_event_filter(vcpu, i);
 }
 
-/**
- * kvm_pmu_load() - Load untrapped PMU registers
- * @vcpu: Pointer to struct kvm_vcpu
- *
- * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
- * to only bits belonging to guest-reserved counters and leave
- * host-reserved counters alone in bitmask registers.
- */
-void kvm_pmu_load(struct kvm_vcpu *vcpu)
+static void __kvm_pmu_load(struct kvm_vcpu *vcpu, bool reserve_counters)
 {
 	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
 	unsigned long guest_counters;
@@ -446,13 +502,18 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	if (!kvm_pmu_is_partitioned(vcpu->kvm) || !vcpu->wants_to_run || !pmu)
 		return;
 
+	preempt_disable();
 	local_irq_save(flags);
 	if (!cpumask_test_cpu(smp_processor_id(), &pmu->supported_cpus)) {
 		local_irq_restore(flags);
+		preempt_enable();
 		return;
 	}
 
 	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+	if (reserve_counters)
+		kvm_pmu_set_guest_counters(pmu, guest_counters);
+
 	kvm_pmu_apply_event_filter(vcpu);
 
 	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
@@ -505,17 +566,26 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	write_sysreg(~val & mask, pmintenclr_el1);
 
 	local_irq_restore(flags);
+	preempt_enable();
 }
 
 /**
- * kvm_pmu_put() - Put untrapped PMU registers
+ * kvm_pmu_load() - Load untrapped PMU registers
  * @vcpu: Pointer to struct kvm_vcpu
  *
- * Put all untrapped PMU registers from the PCPU into the VCPU. Mask
+ * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
  * to only bits belonging to guest-reserved counters and leave
  * host-reserved counters alone in bitmask registers.
  */
-void kvm_pmu_put(struct kvm_vcpu *vcpu)
+void kvm_pmu_load(struct kvm_vcpu *vcpu)
+{
+	bool reserve = !vcpu_get_flag(vcpu, IN_NESTED_ERET) &&
+		       !vcpu_get_flag(vcpu, IN_NESTED_EXCEPTION);
+
+	__kvm_pmu_load(vcpu, reserve);
+}
+
+static void __kvm_pmu_put(struct kvm_vcpu *vcpu, bool release_counters)
 {
 	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
 	unsigned long guest_counters;
@@ -533,12 +603,13 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	if (!kvm_pmu_is_partitioned(vcpu->kvm) || !vcpu->wants_to_run || !pmu)
 		return;
 
-	local_irq_save(flags);
+	preempt_disable();
 	if (!cpumask_test_cpu(smp_processor_id(), &pmu->supported_cpus)) {
-		local_irq_restore(flags);
+		preempt_enable();
 		return;
 	}
 
+	local_irq_save(flags);
 	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
 	mask = guest_counters;
 
@@ -595,5 +666,24 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, val & mask);
 	write_sysreg(val & mask, pmovsclr_el0);
 
+	if (release_counters)
+		kvm_pmu_set_guest_counters(pmu, 0);
 	local_irq_restore(flags);
+	preempt_enable();
+}
+
+/**
+ * kvm_pmu_put() - Put untrapped PMU registers
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Put all untrapped PMU registers from the PCPU into the VCPU. Mask
+ * to only bits belonging to guest-reserved counters and leave
+ * host-reserved counters alone in bitmask registers.
+ */
+void kvm_pmu_put(struct kvm_vcpu *vcpu)
+{
+	bool release = !vcpu_get_flag(vcpu, IN_NESTED_ERET) &&
+		       !vcpu_get_flag(vcpu, IN_NESTED_EXCEPTION);
+
+	__kvm_pmu_put(vcpu, release);
 }
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index b1851d1c594b1..2b5bbbd801af8 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -349,8 +349,15 @@ armpmu_add(struct perf_event *event, int flags)
 
 	/* If we don't have a space for the counter then finish early. */
 	idx = armpmu->get_event_idx(hw_events, event);
-	if (idx < 0)
+	if (idx < 0) {
+		if (!bitmap_equal(hw_events->cntr_mask, armpmu->cntr_mask,
+				  ARMPMU_MAX_HWEVENTS)) {
+			hw_events->host_squeezed = true;
+			if (event->group_leader->attr.pinned)
+				pr_warn_once("perf: Pinned host event squeezed out by KVM guest PMU partition\n");
+		}
 		return idx;
+	}
 
 	/* The newly-allocated counter should be empty */
 	WARN_ON_ONCE(hw_events->events[idx]);
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index be1e345e99a77..45658273ffa86 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -76,6 +76,7 @@ struct pmu_hw_events {
 
 	/* Active events requesting branch records */
 	unsigned int		branch_users;
+	bool host_squeezed;
 };
 
 enum armpmu_attr_groups {
-- 
2.56.1.708.g77570a6a1d-goog


