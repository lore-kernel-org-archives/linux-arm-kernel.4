Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89260606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ytkz80Ik;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jRrx6/wh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nA9X1kI7IFOq6JqFCv4FpBLK6+hTHxRCT2T0B+GpwhQ=; b=Ytkz80IkDivIPwHjU+nUun8nWI
	ltgBmEBIExCNy9UzNIMbtYgEWQ57vxdT00dlufvhl6bFaE0+E7QlhZsf9df14yww5xa5Zu9c2pS6p
	NGKK7IdCvJ6bXbEsKU4/COLxq7Le+aqSGGmLjPQha4FjdtCOxMQLBkQiWofXApqLkjZVxmivuTBlv
	z+vR30YumrGRgJoItNoBclKLSS861qkRWRz0ba9X8Ev5l+TrW2r8hdgvn1Hl28HytfzCm9YkVb2Lp
	ARoxQj05bJTgnEbqhe/wwvdsvWv0PelaKlB+o+ibXXtoN53Rqjv0pCAaUCVjQ3p3BArg4xiFraosH
	bP25WpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gr-0000000D5SY-1vnx;
	Thu, 19 Nov 2026 18:54:09 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FK-0000000D3x4-2PKl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:36 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-5735cd94235so171553b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114353; x=1795719153; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nA9X1kI7IFOq6JqFCv4FpBLK6+hTHxRCT2T0B+GpwhQ=;
        b=jRrx6/wh+jm309wnNGU7XNM+JPEOQFDcZt4xIZdAXAzbR415QV2x3ki/wb5dW1KNuw
         23ISKjsBxOlDWo5HbkU6TTJb8/0uyIglCfhF8shUxyvmrVVDSUoq3pUyIbhWWo+YqyZ3
         ABL82YdBwiHTNJIzhKDQkQAww/LZ7mwqlhMGpTVkkFUtHC0HsxEdvBggHq02jraXabdE
         EjFsqYJyHs0ZEPR5KzIVUnvbxwxDiAmm0TQVtlPrzfrl/Sdwsoeal6m4t82JDJIKLSJm
         4RbGxjXmT72+J/1l/uzmcLruee10mhRYlrMwdT96gSPg6fI/6LIVWuhBtLgL1ZMj/R/E
         Vv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114353; x=1795719153;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nA9X1kI7IFOq6JqFCv4FpBLK6+hTHxRCT2T0B+GpwhQ=;
        b=i9gzpliftBnyKlz5P9V+khkBCeCRskgqjFZcwzCZUugtGdVGy3Xa4jCeAFq4c0IbQR
         CBeJek1hqGd6XAzDvXW2gRHknpqcCz3Be32Qd1UE4deN7SOwh0NBDz4U3Skv9/fYBoEi
         stsr5DPYqAbLacJbUv15hZTgPh3SWz6Cz1B9zncv3liQnZLdM+QvMCAXgdwPFwNyEM3N
         LJAI+e6b0nE+KtKP6f/PbhXmkSEarntaK3eHSgk5dYCwH8lqfTg5kGW2JpE+mXxH0poK
         i0C0kmiIvxP3OVU/J8mGYP8uDGpT9cNPbtQvhJn473D4imrNzAy9Jx5TIr9rRQwPUYPW
         Hg4g==
X-Forwarded-Encrypted: i=1; AL+hErF3XqW5VoV5jAgr4W5mOms5if9GA4SVQNkE5dwq86oXCJeYJRZZ8HzA55nhfCRaZvArsWL5YUhnZo3130yHuS3R@lists.infradead.org
X-Gm-Message-State: APuU4Z+C0zcA/XHkgbn3e/swEpcs4k9dzrtu8gDsSYLD2k+bNSjoDRpy
	gaFq7rEtFZDC96yIf1WBP/53it7R9n4fNU6PCxCKbbhGNydZ7Fs4q3Tu8C9AiUgP88EFBfkKheS
	RGJWumEs1OBrz7nt4WXBbs6KBig==
X-Received: from jagi25-n2.prod.google.com ([2002:a05:6639:59:20b0:61b:4431:8bc0])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c2c4:b0:52b:7641:33a6 with SMTP id 5614622812f47-57a0a4053a1mr1064244b6e.14.1795114352602;
 Thu, 19 Nov 2026 10:52:32 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:59 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-18-coltonlewis@google.com>
Subject: [PATCH v10 17/33] KVM: arm64: Context swap Partitioned PMU guest registers
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
X-CRM114-CacheID: sfid-20261119_105234_676898_ED05328D 
X-CRM114-Status: GOOD (  24.40  )
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

Save and restore the guest PMU registers that are untrapped when the PMU
is partitioned:
- PMEVCNTRn_EL0
- PMCCNTR_EL0
- PMSELR_EL0 (when MDCR_EL2.TPM is clear)
- PMUSERENR_EL0 (when MDCR_EL2.TPM is clear)
- PMCR_EL0
- PMCNTENSET_EL0 / PMCNTENCLR_EL0
- PMINTENSET_EL1 / PMINTENCLR_EL1

Mask counter bitmaps to guest-reserved counters so host-owned counters
in HPMN..N-1 are left untouched. Clear hardware guest overflow flags on
load before enabling PMINTENSET_EL1 to avoid spurious interrupts, flush
pending hardware guest overflow flags into shadow PMOVSSET_EL0 on put,
and restore physical PMCR_EL0.E from MDCR_EL2.HPME on put so active host
perf events continue counting.

PMEVTYPER<n>_EL0 and PMCCFILTR_EL0 are loaded in the next patch after
applying the KVM PMU event filter. A subsequent patch makes these swaps
lazy until the guest enables the PMU.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/arm.c        |   4 +-
 arch/arm64/kvm/pmu-direct.c | 175 ++++++++++++++++++++++++++++++++++++
 include/kvm/arm_pmu.h       |   6 +-
 3 files changed, 183 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 157bf4b812020..fc420d8f0e4fe 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -767,6 +767,7 @@ static void vhe_vcpu_load(struct kvm_vcpu *vcpu)
 	kvm_vcpu_load_fgt(vcpu);
 	kvm_vcpu_load_vhe(vcpu);
 	kvm_arch_vcpu_load_fp(vcpu);
+	kvm_pmu_load(vcpu);
 	kvm_vcpu_pmu_restore_guest(vcpu);
 
 	vcpu_load_pvtime(vcpu);
@@ -821,12 +822,13 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 static void vhe_vcpu_put(struct kvm_vcpu *vcpu)
 {
+	kvm_pmu_put(vcpu);
+	kvm_vcpu_pmu_restore_host(vcpu);
 	kvm_vcpu_put_debug(vcpu);
 	kvm_arch_vcpu_put_fp(vcpu);
 	kvm_vcpu_put_vhe(vcpu);
 	kvm_timer_vcpu_put(vcpu);
 	kvm_vgic_put(vcpu);
-	kvm_vcpu_pmu_restore_host(vcpu);
 
 	if (vcpu_has_nv(vcpu))
 		kvm_vcpu_put_hw_mmu(vcpu);
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 13f5bcc2a9084..5c8a8c42e353d 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -344,3 +344,178 @@ u64 kvm_pmu_guest_counter_mask(void)
 {
 	return kvm_vcpu_pmu_guest_counter_mask(kvm_get_running_vcpu());
 }
+
+/**
+ * kvm_pmu_load() - Load untrapped PMU registers
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
+ * to only bits belonging to guest-reserved counters and leave
+ * host-reserved counters alone in bitmask registers.
+ */
+void kvm_pmu_load(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	unsigned long guest_counters;
+	unsigned long flags;
+	u64 mask;
+	u8 i;
+	u64 val;
+
+	/*
+	 * If we aren't guest-owned then we know the guest isn't using
+	 * the PMU anyway, so no need to bother with the swap.
+	 */
+	if (!kvm_pmu_is_partitioned(vcpu->kvm) || !vcpu->wants_to_run || !pmu)
+		return;
+
+	local_irq_save(flags);
+	if (!cpumask_test_cpu(smp_processor_id(), &pmu->supported_cpus)) {
+		local_irq_restore(flags);
+		return;
+	}
+
+	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+
+	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
+		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
+
+		if (i == ARMV8_PMU_CYCLE_IDX)
+			write_pmccntr(val);
+		else
+			write_pmevcntrn(i, val);
+	}
+
+	if (!(vcpu->arch.mdcr_el2 & MDCR_EL2_TPM)) {
+		val = __vcpu_sys_reg(vcpu, PMSELR_EL0);
+		write_sysreg(val, pmselr_el0);
+
+		val = __vcpu_sys_reg(vcpu, PMUSERENR_EL0) &
+		      ARMV8_PMU_USERENR_MASK;
+		write_sysreg(val, pmuserenr_el0);
+	}
+
+	/* Save only the stateful writable bits. */
+	val = __vcpu_sys_reg(vcpu, PMCR_EL0);
+	mask = ARMV8_PMU_PMCR_MASK &
+		~(ARMV8_PMU_PMCR_P | ARMV8_PMU_PMCR_C);
+	if (!kvm_has_feat(vcpu->kvm, ID_AA64DFR0_EL1, PMUVer, V3P5))
+		mask &= ~ARMV8_PMU_PMCR_LP;
+	write_sysreg(val & mask, pmcr_el0);
+
+	/*
+	 * When handling these:
+	 * 1. Apply only the bits for guest counters (indicated by mask)
+	 * 2. Use the different registers for set and clear
+	 */
+	mask = guest_counters;
+
+	/*
+	 * Clear the hardware overflow flags so there is no chance of
+	 * creating spurious interrupts. The hardware here is never
+	 * the canonical version anyway.
+	 */
+	write_sysreg(mask, pmovsclr_el0);
+	isb();
+
+	val = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
+	write_sysreg(val & mask, pmcntenset_el0);
+	write_sysreg(~val & mask, pmcntenclr_el0);
+
+	val = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
+	write_sysreg(val & mask, pmintenset_el1);
+	write_sysreg(~val & mask, pmintenclr_el1);
+
+	local_irq_restore(flags);
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
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	unsigned long guest_counters;
+	unsigned long flags;
+	u64 pmcr_mask;
+	u64 mask;
+	u8 i;
+	u64 val;
+
+	/*
+	 * If we aren't guest-owned then we know the guest is not
+	 * accessing the PMU anyway, so no need to bother with the
+	 * swap.
+	 */
+	if (!kvm_pmu_is_partitioned(vcpu->kvm) || !vcpu->wants_to_run || !pmu)
+		return;
+
+	local_irq_save(flags);
+	if (!cpumask_test_cpu(smp_processor_id(), &pmu->supported_cpus)) {
+		local_irq_restore(flags);
+		return;
+	}
+
+	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+	mask = guest_counters;
+
+	/* Mask these to only save the guest relevant bits. */
+	val = read_sysreg(pmcntenset_el0);
+	__vcpu_assign_sys_reg(vcpu, PMCNTENSET_EL0, val & mask);
+
+	val = read_sysreg(pmintenset_el1);
+	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
+
+	/* Stop guest counters and disable interrupts in hardware first. */
+	write_sysreg(mask, pmcntenclr_el0);
+	write_sysreg(mask, pmintenclr_el1);
+	isb();
+
+	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
+		if (i == ARMV8_PMU_CYCLE_IDX) {
+			val = read_pmccntr();
+			write_pmccntr(0);
+		} else {
+			val = read_pmevcntrn(i);
+			write_pmevcntrn(i, 0);
+		}
+
+		__vcpu_assign_sys_reg(vcpu, PMEVCNTR0_EL0 + i, val);
+	}
+
+	if (!(vcpu->arch.mdcr_el2 & MDCR_EL2_TPM)) {
+		val = read_sysreg(pmselr_el0);
+		__vcpu_assign_sys_reg(vcpu, PMSELR_EL0, val);
+		write_sysreg(0, pmselr_el0);
+
+		val = read_sysreg(pmuserenr_el0) & ARMV8_PMU_USERENR_MASK;
+		__vcpu_assign_sys_reg(vcpu, PMUSERENR_EL0, val);
+		write_sysreg(ARMV8_PMU_USERENR_MASK, pmuserenr_el0);
+	}
+
+	val = read_sysreg(pmcr_el0);
+	pmcr_mask = ARMV8_PMU_PMCR_MASK;
+	if (!kvm_has_feat(vcpu->kvm, ID_AA64DFR0_EL1, PMUVer, V3P5))
+		pmcr_mask &= ~ARMV8_PMU_PMCR_LP;
+	__vcpu_rmw_sys_reg(vcpu, PMCR_EL0, &=, ~ARMV8_PMU_PMCR_MASK);
+	__vcpu_rmw_sys_reg(vcpu, PMCR_EL0, |=, val & pmcr_mask);
+
+	val = ARMV8_PMU_PMCR_LC;
+	if (pmu->pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P5)
+		val |= ARMV8_PMU_PMCR_LP;
+	if (vcpu->arch.mdcr_el2 & MDCR_EL2_HPME)
+		val |= ARMV8_PMU_PMCR_E;
+	write_sysreg(val, pmcr_el0);
+
+	/* Save pending guest hardware overflows. */
+	val = read_sysreg(pmovsset_el0);
+	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, val & mask);
+	write_sysreg(val & mask, pmovsclr_el0);
+
+	local_irq_restore(flags);
+}
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 276ab74fa0208..4580f62234128 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -102,6 +102,9 @@ u64 kvm_pmu_direct_reg_read(struct kvm_vcpu *vcpu, unsigned int reg);
 void kvm_pmu_direct_reg_write(struct kvm_vcpu *vcpu, unsigned int reg,
 			      u64 val, bool set);
 u64 kvm_pmu_guest_counter_mask(void);
+void kvm_pmu_load(struct kvm_vcpu *vcpu);
+void kvm_pmu_put(struct kvm_vcpu *vcpu);
+
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
  * Must be called before every vcpu run after disabling interrupts, to ensure
@@ -146,10 +149,11 @@ static inline u64 kvm_pmu_direct_reg_read(struct kvm_vcpu *vcpu,
 {
 	return 0;
 }
-
 static inline void kvm_pmu_direct_reg_write(struct kvm_vcpu *vcpu,
 					    unsigned int reg, u64 val,
 					    bool set) {}
+static inline void kvm_pmu_load(struct kvm_vcpu *vcpu) {}
+static inline void kvm_pmu_put(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
-- 
2.56.1.708.g77570a6a1d-goog


