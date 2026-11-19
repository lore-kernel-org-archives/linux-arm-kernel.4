Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF57606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ky1WzZRT;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hd3OX/GE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=82cYW7HLTfZTtohlxr3vL43foexvbGBlGk9dG99wZpQ=; b=ky1WzZRT4+SS/SoqNf0sayvz7x
	SdPtG6mh3zn6GHlJuBRbW1Hepk4aCtfAPH8euFkbSAGwrdNnmBCXjzf5l3A6uMqXLvsgPnAeDk19+
	FSt8bVcwqUjvf09DYNWwI+sL4NEIJW2ETDSmkwpR1Q7IvclHcfjs7ycuZT/fF/yKkd7ky4JDMwCrX
	WAAzk6viD9lIBUzc+UEdBcN4QUv6JylNdp6aPPI0bOKzJ5bprUrN1vA8hdu7WEhAszRnwkRH2rmok
	YS4zrebxYkRmgC0KWKN7wniKzLD6JzHQNhRR7ekRLBmDdh4Pmb4Oim/xqwDYhWMrlt1VV+q42xefz
	FsX6PgGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gv-0000000D5aa-2iX6;
	Thu, 19 Nov 2026 18:54:13 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FV-0000000D4IO-0fae
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:47 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-547ae874949so210042b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114364; x=1795719164; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82cYW7HLTfZTtohlxr3vL43foexvbGBlGk9dG99wZpQ=;
        b=hd3OX/GEFtebbVBvL18hAd44PWIHnPfswuZjG6AThigSFPHistNQJDWY2D/Bhkb2zw
         BCPvy+/mNtwlPCQ+eZ0ZfSMlDL9Rz+0xEjm+GX6NYdSlXJf5mXrodI/XzPPtR5+kiT9O
         8GeoLRIqm4sCWS3mJrkLYu/KbK+uMm2qwpQeSLcLY89mr2Ha7MGt36Ze8/805h4Lmh8r
         KiUd3QrZRwOi/YzoLguLs1tCYg/NMSDQN6Ng/OIZqYgg7i9+WB+4M/iWojdmZg7fEcDn
         X1cPYtB3K4o7XzaqtW3NvckFEtk035MAn8Pxt5HJ7GwKgH1JO9DA721iv8V7T1kvMYqc
         6jBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114364; x=1795719164;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82cYW7HLTfZTtohlxr3vL43foexvbGBlGk9dG99wZpQ=;
        b=qVzgms8ewnz6rHP5Yl7qrRDRhWA3WCLjRNmkH5l3em6tbNdu6L1LxjpQRYFJ5myEYK
         WB1EJkBtxoHkjqWgzZkrX5nE9jcm1X+B0m+wMF2iPFNJ5lkrhaCvbcqlB8WLSgN23rv/
         cC3sd2ZuaL5kve4wDQ1DkPLTcQVpI7WABq30q5RiaI5cYgxuFuVqXSXFobE2FcM3CSn4
         6VDQh+ZUVf3a0l7BBaj9bIGSmDxfBCF0z/XnnJtdlgbaNszViQ+1TuGuOJhHICoM14DA
         a5swImnk7D3xelZtp8SV3s7W4G0bSJ6QEDVQaBLmF2kO2ZfZ83fpwzzmvYST0ekm0Wze
         HXBQ==
X-Forwarded-Encrypted: i=1; AL+hErEnPp7h6023aB2rTcHIZC05Oc1Z5wH/LTV9TB/LYnmZDIkEe99Xbzifp35Wt0XtarQ1orLYn5FiE2KfYIXubI1l@lists.infradead.org
X-Gm-Message-State: APuU4Z9POi4ORHnTPgTTWvz1LrfQ0zTe16RX7RAqJk4dZBwg7hS+jc0R
	RPNDIj7IAsXXudTu2kbO2pQK3zsumM7Twa1htlAVLzY+K8bWFFoGprgizWCxDiLj3kuKzZyCPVZ
	dY/z67KF3dfkfYk3vqs8tKJ1cNQ==
X-Received: from iobgl11.prod.google.com ([2002:a05:6602:4f0b:b0:9cd:a6f7:7b88])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:15a7:b0:567:caf2:9540 with SMTP id 5614622812f47-57a06d1a857mr871247b6e.1.1795114363292;
 Thu, 19 Nov 2026 10:52:43 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:10 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-29-coltonlewis@google.com>
Subject: [PATCH v10 28/33] KVM: arm64: Emulate trapped PMSWINC_EL0 writes for
 Partitioned PMU
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
X-CRM114-CacheID: sfid-20261119_105245_326273_55DE6466 
X-CRM114-Status: GOOD (  22.14  )
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

Even with a Partitioned PMU, guest writes to PMSWINC_EL0 trap to EL2 in
four cases:
1. Hosts without FEAT_FGT, where MDCR_EL2.TPM remains set.
2. Before lazy PMU activation (VCPU_PMU_ACCESS_FREE, MDCR_EL2.TPM == 1).
3. Nested L2 execution when L1 sub-partitions counters (vHPMN < N_L1),
   where MDCR_EL2.TPM is forced to protect L1's hypervisor counters.
4. Nested L1 execution when L1 sub-partitions counters (vHPMN < N_L1),
   where HDFGWTR_EL2.PMSWINC_EL0 must trap software increments so an
   even counter at vHPMN - 1 cannot chain across the sub-partition
   boundary into L1 counter vHPMN in hardware, and so ovf32_mask
   counter biasing is preserved.

Trapped PMSWINC_EL0 writes cannot simply execute MSR PMSWINC_EL0 at
physical EL2 because L0 runs with physical MDCR_EL2.HPMD == 1 and clears
PMEVTYPER<n>_EL0.NSH on guest counters, causing hardware to ignore the
software increment (and when not loaded on the CPU, guest counters live
only in sys_regs[]).

Update kvm_pmu_counter_increment() and kvm_pmu_counter_can_chain() in
arch/arm64/kvm/pmu-emul.c to check per-counter enablement
(kvm_pmu_counter_is_enabled(), covering both PMCR_EL0.E and
MDCR_EL2.HPME), current guest EL filtering for SW_INCR, and
nr_pmu_counters / sub-partition chaining boundaries. Reuse
kvm_pmu_software_increment() from kvm_pmu_direct_swinc() by flushing
live hardware state if loaded, applying the software increment to
sys_regs[], and reloading hardware.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/config.c     |   2 +-
 arch/arm64/kvm/pmu-direct.c |  34 ++++++++++
 arch/arm64/kvm/pmu-emul.c   | 120 +++++++++++++++++++++---------------
 arch/arm64/kvm/sys_regs.c   |   5 +-
 include/kvm/arm_pmu.h       |   3 +
 5 files changed, 113 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index a523dde1b57a7..0ec74e45fdbf6 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1826,7 +1826,7 @@ static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
 			set |= HDFGWTR_EL2_PMUSERENR_EL0;
 
 		if (kvm_pmu_hyp_counter_mask(vcpu))
-			set |= HDFGWTR_EL2_PMCNTEN;
+			set |= HDFGWTR_EL2_PMCNTEN | HDFGWTR_EL2_PMSWINC_EL0;
 		if (kvm_pmu_part_ovf32_mask(vcpu))
 			set |= HDFGWTR_EL2_PMEVCNTRn_EL0;
 
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index b7bec06b36b0a..6382233e54c71 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -931,6 +931,40 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	__kvm_pmu_put(vcpu, release);
 }
 
+/**
+ * kvm_pmu_direct_swinc() - Emulate trapped PMSWINC_EL0 writes
+ * @vcpu: Pointer to vcpu struct
+ * @val: Accessible counter bitmask written to PMSWINC_EL0
+ *
+ * Executing MSR PMSWINC_EL0 at physical EL2 is ignored by hardware because
+ * physical MDCR_EL2.HPMD is set and guest PMEVTYPER<n>_EL0.NSH is cleared.
+ * Flush live hardware state if loaded, apply kvm_pmu_software_increment(),
+ * and reload hardware.
+ */
+void kvm_pmu_direct_swinc(struct kvm_vcpu *vcpu, u64 val)
+{
+	bool was_loaded;
+
+	guard(preempt)();
+
+	val &= kvm_vcpu_pmu_guest_counter_mask(vcpu) &
+	       ~BIT_ULL(ARMV8_PMU_CYCLE_IDX);
+	if (!val)
+		return;
+
+	was_loaded = kvm_pmu_part_on_cpu(vcpu);
+	if (was_loaded)
+		__kvm_pmu_put(vcpu, false);
+
+	kvm_pmu_software_increment(vcpu, val);
+
+	if (was_loaded)
+		__kvm_pmu_load(vcpu, false);
+
+	if (kvm_pmu_part_overflow_status(vcpu))
+		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
+}
+
 /**
  * kvm_pmu_reload_part() - Reload partitioned PMU traps, filters, and state
  * @vcpu: Pointer to struct kvm_vcpu
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index a72bdc5a0b3ea..b9096e5a4f11d 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -19,7 +19,6 @@
 
 static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc);
 static void kvm_pmu_release_perf_event(struct kvm_pmc *pmc);
-static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc);
 
 static struct kvm_vcpu *kvm_pmc_to_vcpu(const struct kvm_pmc *pmc)
 {
@@ -48,6 +47,9 @@ static bool kvm_pmc_has_64bit_overflow(struct kvm_pmc *pmc)
 	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
 	u64 val = kvm_vcpu_read_pmcr(vcpu);
 
+	if (!kvm_pmc_is_64bit(pmc))
+		return false;
+
 	if (kvm_pmu_counter_is_hyp(vcpu, pmc->idx))
 		return __vcpu_sys_reg(vcpu, MDCR_EL2) & MDCR_EL2_HLP;
 
@@ -57,8 +59,13 @@ static bool kvm_pmc_has_64bit_overflow(struct kvm_pmc *pmc)
 
 static bool kvm_pmu_counter_can_chain(struct kvm_pmc *pmc)
 {
-	return (!(pmc->idx & 1) && (pmc->idx + 1) < ARMV8_PMU_CYCLE_IDX &&
-		!kvm_pmc_has_64bit_overflow(pmc));
+	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
+
+	return !(pmc->idx & 1) &&
+	       (pmc->idx + 1) < vcpu->kvm->arch.nr_pmu_counters &&
+	       kvm_pmu_counter_is_hyp(vcpu, pmc->idx) ==
+	       kvm_pmu_counter_is_hyp(vcpu, pmc->idx + 1) &&
+	       !kvm_pmc_has_64bit_overflow(pmc);
 }
 
 static u32 counter_index_to_reg(u64 idx)
@@ -76,6 +83,60 @@ static u64 kvm_pmc_read_evtreg(const struct kvm_pmc *pmc)
 	return __vcpu_sys_reg(kvm_pmc_to_vcpu(pmc), counter_index_to_evtreg(pmc->idx));
 }
 
+static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
+{
+	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
+	unsigned int mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
+
+	if (!(__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & BIT(pmc->idx)))
+		return false;
+
+	if (kvm_pmu_counter_is_hyp(vcpu, pmc->idx))
+		return mdcr & MDCR_EL2_HPME;
+
+	return kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E;
+}
+
+static bool kvm_pmc_counts_at_el0(struct kvm_pmc *pmc)
+{
+	u64 evtreg = kvm_pmc_read_evtreg(pmc);
+	bool nsu = evtreg & ARMV8_PMU_EXCLUDE_NS_EL0;
+	bool u = evtreg & ARMV8_PMU_EXCLUDE_EL0;
+
+	return u == nsu;
+}
+
+static bool kvm_pmc_counts_at_el1(struct kvm_pmc *pmc)
+{
+	u64 evtreg = kvm_pmc_read_evtreg(pmc);
+	bool nsk = evtreg & ARMV8_PMU_EXCLUDE_NS_EL1;
+	bool p = evtreg & ARMV8_PMU_EXCLUDE_EL1;
+
+	return p == nsk;
+}
+
+static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
+{
+	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
+	u64 mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
+
+	if (!kvm_pmu_counter_is_hyp(vcpu, pmc->idx) && (mdcr & MDCR_EL2_HPMD))
+		return false;
+
+	return kvm_pmc_read_evtreg(pmc) & ARMV8_PMU_INCLUDE_EL2;
+}
+
+static bool kvm_pmc_counts_at_current_el(struct kvm_pmc *pmc)
+{
+	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
+
+	if (!vcpu_mode_priv(vcpu))
+		return kvm_pmc_counts_at_el0(pmc);
+	if (unlikely(is_hyp_ctxt(vcpu)))
+		return kvm_pmc_counts_at_el2(pmc);
+	return kvm_pmc_counts_at_el1(pmc);
+}
+
 static u64 kvm_pmu_get_pmc_value(struct kvm_pmc *pmc)
 {
 	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
@@ -321,9 +382,6 @@ static void kvm_pmu_counter_increment(struct kvm_vcpu *vcpu,
 {
 	int i;
 
-	if (!(kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E))
-		return;
-
 	/* Weed out disabled counters */
 	mask &= __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
 
@@ -331,12 +389,19 @@ static void kvm_pmu_counter_increment(struct kvm_vcpu *vcpu,
 		struct kvm_pmc *pmc = kvm_vcpu_idx_to_pmc(vcpu, i);
 		u64 type, reg;
 
+		if (!kvm_pmu_counter_is_enabled(pmc))
+			continue;
+
 		/* Filter on event type */
 		type = __vcpu_sys_reg(vcpu, counter_index_to_evtreg(i));
 		type &= kvm_pmu_event_mask(vcpu->kvm);
 		if (type != event)
 			continue;
 
+		if (event == ARMV8_PMUV3_PERFCTR_SW_INCR &&
+		    !kvm_pmc_counts_at_current_el(pmc))
+			continue;
+
 		/* Increment this counter */
 		reg = __vcpu_sys_reg(vcpu, counter_index_to_reg(i)) + 1;
 		if (!kvm_pmc_is_64bit(pmc))
@@ -454,49 +519,6 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
 	}
 }
 
-static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
-{
-	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
-	unsigned int mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
-
-	if (!(__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & BIT(pmc->idx)))
-		return false;
-
-	if (kvm_pmu_counter_is_hyp(vcpu, pmc->idx))
-		return mdcr & MDCR_EL2_HPME;
-
-	return kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E;
-}
-
-static bool kvm_pmc_counts_at_el0(struct kvm_pmc *pmc)
-{
-	u64 evtreg = kvm_pmc_read_evtreg(pmc);
-	bool nsu = evtreg & ARMV8_PMU_EXCLUDE_NS_EL0;
-	bool u = evtreg & ARMV8_PMU_EXCLUDE_EL0;
-
-	return u == nsu;
-}
-
-static bool kvm_pmc_counts_at_el1(struct kvm_pmc *pmc)
-{
-	u64 evtreg = kvm_pmc_read_evtreg(pmc);
-	bool nsk = evtreg & ARMV8_PMU_EXCLUDE_NS_EL1;
-	bool p = evtreg & ARMV8_PMU_EXCLUDE_EL1;
-
-	return p == nsk;
-}
-
-static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
-{
-	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
-	u64 mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
-
-	if (!kvm_pmu_counter_is_hyp(vcpu, pmc->idx) && (mdcr & MDCR_EL2_HPMD))
-		return false;
-
-	return kvm_pmc_read_evtreg(pmc) & ARMV8_PMU_INCLUDE_EL2;
-}
-
 static int kvm_map_pmu_event(struct kvm *kvm, unsigned int eventsel)
 {
 	struct arm_pmu *pmu = kvm->arch.arm_pmu;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 24dd878fb58c4..4967954f42b01 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1543,7 +1543,10 @@ static bool access_pmswinc(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 		return false;
 
 	mask = kvm_pmu_accessible_counter_mask(vcpu);
-	kvm_pmu_software_increment(vcpu, p->regval & mask);
+	if (kvm_pmu_is_partitioned(vcpu->kvm))
+		kvm_pmu_direct_swinc(vcpu, p->regval & mask);
+	else
+		kvm_pmu_software_increment(vcpu, p->regval & mask);
 	return true;
 }
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 13e9230c9c714..0fe4f593d3f9a 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -110,6 +110,7 @@ u64 kvm_pmu_direct_reg_read(struct kvm_vcpu *vcpu, unsigned int reg);
 void kvm_pmu_direct_reg_write(struct kvm_vcpu *vcpu, unsigned int reg,
 			      u64 val, bool set);
 u64 kvm_pmu_part_ovf32_mask(struct kvm_vcpu *vcpu);
+void kvm_pmu_direct_swinc(struct kvm_vcpu *vcpu, u64 val);
 void kvm_pmu_reload_part(struct kvm_vcpu *vcpu);
 u64 kvm_pmu_guest_counter_mask(void);
 void kvm_pmu_load(struct kvm_vcpu *vcpu);
@@ -179,6 +180,8 @@ static inline u64 kvm_pmu_part_ovf32_mask(struct kvm_vcpu *vcpu)
 {
 	return 0;
 }
+
+static inline void kvm_pmu_direct_swinc(struct kvm_vcpu *vcpu, u64 val) {}
 static inline void kvm_pmu_reload_part(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_load(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_put(struct kvm_vcpu *vcpu) {}
-- 
2.56.1.708.g77570a6a1d-goog


