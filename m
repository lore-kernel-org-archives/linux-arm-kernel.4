Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2293606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UUsIkNm+;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oYKAOY/X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6SUYGTh6KQ+CEW5/gGpwzlpf1PM6Ff3twZ/q0wEHr9g=; b=UUsIkNm+O0tD58Wa43+yVyXFJg
	i/SRSLKwsMLbsJAMLFagW9ZcyvYaVyY1yCI7DuYOz1Qedef2FZQmuAxL8StzMuMzOgXvaOhIZHSfS
	kzsTRTFa2TzyZfGVhUKUSFKTqxVEqFydcwIzoDR8DA9k1c7XPYH4MSzGUC+mzkZrRhydP9X2gXwQ/
	/XiFyix3EA6dQp3QPuIN2zfpOO6z7AX4hNsJXEHYo4x472WzOfw7EzYzma5juILWsk5rpFgng0fFE
	p89k98nPnCOAj7UnJj5W5JnmEoiNdxp4OitnPuw9uQtg5QgBC5SS0UXY3CXyPKlrMD8oDpFWU/8C+
	XzSd7TzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gx-0000000D5eL-1nD9;
	Thu, 19 Nov 2026 18:54:15 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FW-0000000D4Lj-47yE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:51 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-5384e381fbbso131695b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114365; x=1795719165; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SUYGTh6KQ+CEW5/gGpwzlpf1PM6Ff3twZ/q0wEHr9g=;
        b=oYKAOY/XEokkP7czhlOvwIeTNAWNaI9K/sjJMVH0vtBv46Ufg5TnXE14kehKzoCVa1
         grQMCsQaRcm+k6BRlPmowfKjftyWrn13NIBohTvUXwd/d0ojN/OjhFhoqAi+E0Kfw5Ne
         QqaNyEGt/nZ8HVgezFqXDzsjgNIe6JbWC9vQFDVzmqAxrnj47Purh0LHLi8R/qgnJW8t
         kJClW04gocltyYumHlY5bipQ0ctWnca4ZQR3FCYKqg+gi5vyLgBVNoQl+NM4LyP95+NI
         fwpXtB8H2VsoqQRnc54YEAN1JeouPxR2It1JDZmeMRdL6dTvq6vKbW3gqScdzcOeUalm
         qS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114365; x=1795719165;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SUYGTh6KQ+CEW5/gGpwzlpf1PM6Ff3twZ/q0wEHr9g=;
        b=pb4q1KxWnhXJsa7rrT3FCn/LnbOBGvNlZ3YgmQQD+UkMyl7S1LU/ZW/1ljL2d2H8Z/
         U8D1h/bOUMNjZfkOo7TxukjDETBAVfn6aQaryi4Cg5BkBv5zZa19ilZfUWxrNEeJDw8Q
         2ZTD2fZxs2IeZcuapPE7d/QMzeGau5VhRdzIlWyFOfCvhdUOLQu7ujomAsJjV+3oTFjG
         FbKhhSYmm+S2Zgtco0AE00cBkAsQzn7WlYztDL9ECyk9AmwKy/w9hffApTi3Yf4ffthm
         DDE3EG5whfC+YgsQmeCnVHOr+FU7B/7dcQwBRjutV+c1l2OZkRIqiLB/VPnSGaVfZWUc
         MaoQ==
X-Forwarded-Encrypted: i=1; AL+hErE9IAxqVoPVzWSJPzqoBJzwiRwfomqthkDMlKaCA5D2TaBXAIzo6mmXZcgtNQH0S7L+kpWLnTPoWl7ai8wN1CYw@lists.infradead.org
X-Gm-Message-State: APuU4Z8sIhU6AiNSEkE6X9LKF0Mwzx0UuVf9XMnyMbjb8Fobps6cDaCf
	/HawidsI1WfS9Xq/3Ff+N+vbnlgzxyhUEbaQRalKQ1Rs7CkGFEFrcQSyRmEkzBwTqe0WzVkMVzP
	OCyEznN0w0mCOknLrRrAlUkve2g==
X-Received: from iohf23-n2.prod.google.com ([2002:a05:6602:a5d7:20b0:9c4:c2b7:385f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:17a1:b0:4c3:7073:8c4d with SMTP id 5614622812f47-57a0a211c58mr1003347b6e.20.1795114365076;
 Thu, 19 Nov 2026 10:52:45 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:12 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-31-coltonlewis@google.com>
Subject: [PATCH v10 30/33] KVM: arm64: Support zero event counters on
 Partitioned PMU without HPMN0
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
X-CRM114-CacheID: sfid-20261119_105247_120219_8C19A916 
X-CRM114-Status: GOOD (  20.04  )
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

Programming MDCR_EL2.HPMN to 0 is CONSTRAINED UNPREDICTABLE on CPUs that
do not implement FEAT_HPMN0, preventing userspace from configuring a
cycle-counter-only Partitioned PMU guest (nr_pmu_counters == 0) on those
platforms if HPMN is set directly from nr_pmu_counters.

Support nr_pmu_counters == 0 without FEAT_HPMN0 whenever the PMU has at
least two general-purpose counters by setting physical MDCR_EL2.HPMN = 1
(via kvm_arm_pmu_part_hpmn()), reserving and quiescing physical counter 0
alongside PMCCNTR_EL0 on vCPU load so host perf uses counters 1..N-1,
keeping MDCR_EL2.TPMCR set so trapped PMCR_EL0 reads report N == 0, and
enabling fine-grained traps on PMEVCNTRn_EL0, PMCNTEN, PMINTEN, and
PMSWINC_EL0 so counter 0 remains completely hidden from the guest while
PMCCNTR_EL0 accesses stay untrapped on FEAT_FGT hosts.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/config.c     | 16 ++++++++++----
 arch/arm64/kvm/debug.c      | 12 ++++++-----
 arch/arm64/kvm/pmu-direct.c | 42 ++++++++++++++++++++++++++++++-------
 arch/arm64/kvm/pmu.c        | 15 +++++++++++--
 include/kvm/arm_pmu.h       |  6 ++++++
 5 files changed, 73 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 0ec74e45fdbf6..bbe940f6266aa 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1791,6 +1791,8 @@ static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
 	__compute_fgt(vcpu, HDFGRTR_EL2);
 
 	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		unsigned int n = vcpu->kvm->arch.nr_pmu_counters;
+		bool hide_gp0 = kvm_arm_pmu_part_hpmn(n) != n;
 		u64 set = HDFGRTR_EL2_PMOVS |
 			  HDFGRTR_EL2_PMCCFILTR_EL0 |
 			  HDFGRTR_EL2_PMEVTYPERn_EL0 |
@@ -1801,10 +1803,12 @@ static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
 		    (__vcpu_sys_reg(vcpu, MDCR_EL2) & MDCR_EL2_TPM))
 			set |= HDFGRTR_EL2_PMUSERENR_EL0;
 
-		if (kvm_pmu_hyp_counter_mask(vcpu))
+		if (kvm_pmu_hyp_counter_mask(vcpu) || hide_gp0)
 			set |= HDFGRTR_EL2_PMCNTEN;
-		if (kvm_pmu_part_ovf32_mask(vcpu))
+		if (kvm_pmu_part_ovf32_mask(vcpu) || hide_gp0)
 			set |= HDFGRTR_EL2_PMEVCNTRn_EL0;
+		if (hide_gp0)
+			set |= HDFGRTR_EL2_PMINTEN;
 
 		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= set & ~hdfgrtr_masks.res0;
 	}
@@ -1818,6 +1822,8 @@ static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
 		*vcpu_fgt(vcpu, HDFGWTR_EL2) |= HDFGWTR_EL2_MDSCR_EL1;
 
 	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		unsigned int n = vcpu->kvm->arch.nr_pmu_counters;
+		bool hide_gp0 = kvm_arm_pmu_part_hpmn(n) != n;
 		u64 set = HDFGWTR_EL2_PMOVS |
 			  HDFGWTR_EL2_PMCCFILTR_EL0 |
 			  HDFGWTR_EL2_PMEVTYPERn_EL0;
@@ -1825,10 +1831,12 @@ static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
 		if (is_hyp_ctxt(vcpu))
 			set |= HDFGWTR_EL2_PMUSERENR_EL0;
 
-		if (kvm_pmu_hyp_counter_mask(vcpu))
+		if (kvm_pmu_hyp_counter_mask(vcpu) || hide_gp0)
 			set |= HDFGWTR_EL2_PMCNTEN | HDFGWTR_EL2_PMSWINC_EL0;
-		if (kvm_pmu_part_ovf32_mask(vcpu))
+		if (kvm_pmu_part_ovf32_mask(vcpu) || hide_gp0)
 			set |= HDFGWTR_EL2_PMEVCNTRn_EL0;
+		if (hide_gp0)
+			set |= HDFGWTR_EL2_PMINTEN;
 
 		*vcpu_fgt(vcpu, HDFGWTR_EL2) |= set & ~hdfgwtr_masks.res0;
 	}
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index b89f46cb59955..73d157f5b8f6f 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -58,11 +58,11 @@ void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 	if (kvm_pmu_is_partitioned(vcpu->kvm) && vcpu->arch.pmu.loaded_on_cpu) {
 		u8 nr_host_cntr = *host_data_ptr(nr_event_counters);
 		u8 nr_guest_cntr = vcpu->kvm->arch.nr_pmu_counters;
+		u8 guest_hpmn = kvm_arm_pmu_part_hpmn(nr_guest_cntr);
 
 		if (cpumask_test_cpu(smp_processor_id(),
 				     vcpu->kvm->arch.supported_cpus) &&
-		    nr_guest_cntr < nr_host_cntr &&
-		    (cpus_have_final_cap(ARM64_HAS_HPMN0) || nr_guest_cntr > 0)) {
+		    guest_hpmn < nr_host_cntr) {
 			u64 hpmn = FIELD_GET(MDCR_EL2_HPMN, read_sysreg(mdcr_el2));
 			bool hpme;
 
@@ -81,14 +81,16 @@ void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 			 * Take out the coarse grain traps if we are using
 			 * fine grain traps and enforce counter access with
 			 * HPMN. Keep TPMCR when L1 sub-partitions its counters
-			 * so PMCR_EL0 reads and writes trap for multiplexing.
+			 * or when guest_hpmn > nr_guest_cntr (!FEAT_HPMN0 with
+			 * 0 event counters) so PMCR_EL0 accesses trap.
 			 */
 			mdcr &= ~MDCR_EL2_HPMN;
-			mdcr |= FIELD_PREP(MDCR_EL2_HPMN, nr_guest_cntr);
+			mdcr |= FIELD_PREP(MDCR_EL2_HPMN, guest_hpmn);
 
 			if (cpus_have_final_cap(ARM64_HAS_FGT)) {
 				mdcr &= ~MDCR_EL2_TPM;
-				if (!kvm_pmu_hyp_counter_mask(vcpu))
+				if (!kvm_pmu_hyp_counter_mask(vcpu) &&
+				    guest_hpmn == nr_guest_cntr)
 					mdcr &= ~MDCR_EL2_TPMCR;
 			}
 		}
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 6382233e54c71..7b8f0a69641bc 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -89,6 +89,22 @@ static u64 kvm_vcpu_pmu_guest_counter_mask(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static u64 kvm_vcpu_pmu_reserved_counter_mask(struct kvm_vcpu *vcpu)
+{
+	if (vcpu && kvm_pmu_is_partitioned(vcpu->kvm)) {
+		u64 mask = ARMV8_PMU_CNT_MASK_C;
+		unsigned int hpmn =
+			kvm_arm_pmu_part_hpmn(vcpu->kvm->arch.nr_pmu_counters);
+
+		if (hpmn > 0)
+			mask |= GENMASK_ULL(hpmn - 1, 0);
+
+		return mask;
+	}
+
+	return 0;
+}
+
 static void kvm_pmu_set_guest_owned(struct kvm_vcpu *vcpu);
 
 /**
@@ -372,8 +388,12 @@ static u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu)
 	if (!kvm_has_feat(vcpu->kvm, ID_AA64DFR0_EL1, PMUVer, V3P5))
 		pmcr &= ~ARMV8_PMU_PMCR_LP;
 
-	if (vcpu_has_nv(vcpu) && !vcpu_is_el2(vcpu))
-		n = FIELD_GET(MDCR_EL2_HPMN, __vcpu_sys_reg(vcpu, MDCR_EL2));
+	if (vcpu_has_nv(vcpu) && !vcpu_is_el2(vcpu)) {
+		u64 hpmn = FIELD_GET(MDCR_EL2_HPMN, __vcpu_sys_reg(vcpu, MDCR_EL2));
+
+		if (hpmn < n)
+			n = hpmn;
+	}
 
 	return u64_replace_bits(pmcr, n, ARMV8_PMU_PMCR_N);
 }
@@ -686,6 +706,7 @@ static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
 static void __kvm_pmu_load(struct kvm_vcpu *vcpu, bool reserve_counters)
 {
 	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	unsigned long reserved_counters;
 	unsigned long guest_counters;
 	unsigned long flags;
 	unsigned long daif;
@@ -710,20 +731,27 @@ static void __kvm_pmu_load(struct kvm_vcpu *vcpu, bool reserve_counters)
 		return;
 	}
 
+	reserved_counters = kvm_vcpu_pmu_reserved_counter_mask(vcpu);
 	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
 	if (reserve_counters)
-		kvm_pmu_set_guest_counters(pmu, guest_counters);
+		kvm_pmu_set_guest_counters(pmu, reserved_counters);
 
 	daif = local_daif_save();
 
 	/*
 	 * Ensure guest counters, interrupts, and overflow flags are quiesced
 	 * in hardware before lowering MDCR_EL2.HPMN and marking the partition
-	 * live on this CPU.
+	 * live on this CPU. If counter 0 is reserved solely to satisfy HPMN=1
+	 * without FEAT_HPMN0, scrub and filter it so it cannot count or leak.
 	 */
-	write_sysreg(guest_counters, pmcntenclr_el0);
-	write_sysreg(guest_counters, pmintenclr_el1);
-	write_sysreg(guest_counters, pmovsclr_el0);
+	write_sysreg(reserved_counters, pmcntenclr_el0);
+	write_sysreg(reserved_counters, pmintenclr_el1);
+	write_sysreg(reserved_counters, pmovsclr_el0);
+	if (reserved_counters & ~guest_counters) {
+		write_pmevcntrn(0, 0);
+		write_pmevtypern(0, ARMV8_PMU_EXCLUDE_EL0 |
+				    ARMV8_PMU_EXCLUDE_EL1);
+	}
 	isb();
 
 	vcpu->arch.pmu.loaded_on_cpu = true;
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 9d4ad4b7bd8d5..02a1968bd6cb1 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -914,6 +914,13 @@ u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
 	return mask & ~kvm_pmu_hyp_counter_mask(vcpu);
 }
 
+unsigned int kvm_arm_pmu_part_hpmn(unsigned int n)
+{
+	if (!n && !cpus_have_final_cap(ARM64_HAS_HPMN0))
+		return 1;
+	return n;
+}
+
 /**
  * kvm_vcpu_read_pmcr - Read PMCR_EL0 register for the vCPU
  * @vcpu: The vcpu pointer
@@ -923,8 +930,12 @@ u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 	u64 pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
 	u64 n = vcpu->kvm->arch.nr_pmu_counters;
 
-	if (vcpu_has_nv(vcpu) && !vcpu_is_el2(vcpu))
-		n = FIELD_GET(MDCR_EL2_HPMN, __vcpu_sys_reg(vcpu, MDCR_EL2));
+	if (vcpu_has_nv(vcpu) && !vcpu_is_el2(vcpu)) {
+		u64 hpmn = FIELD_GET(MDCR_EL2_HPMN, __vcpu_sys_reg(vcpu, MDCR_EL2));
+
+		if (hpmn < n)
+			n = hpmn;
+	}
 
 	return u64_replace_bits(pmcr, n, ARMV8_PMU_PMCR_N);
 }
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 0fe4f593d3f9a..bebf981855040 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -137,6 +137,7 @@ u8 kvm_arm_pmu_get_pmuver_limit(void);
 u64 kvm_pmu_evtyper_mask(struct kvm *kvm);
 int kvm_arm_set_default_pmu(struct kvm *kvm);
 u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm);
+unsigned int kvm_arm_pmu_part_hpmn(unsigned int n);
 
 u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu);
 bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu, unsigned int idx);
@@ -277,6 +278,11 @@ static inline u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 	return 0;
 }
 
+static inline unsigned int kvm_arm_pmu_part_hpmn(unsigned int n)
+{
+	return n;
+}
+
 static inline u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 {
 	return 0;
-- 
2.56.1.708.g77570a6a1d-goog


