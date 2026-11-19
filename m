Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CD4606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eKoB35mm;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E3RVuEbw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vf5cuVhzqNxbLoI4CPxDBEoH18FVa00DCFt8jqQWCmY=; b=eKoB35mmG45F8Mxg9DYVo79jJX
	smzSm9vhDcMDYxAVeHSOMx8wYagU3DGkiKyMN+Dl2n1zlBpbmw78BQLJiCfH++p2YxVhZ0uVhkqeu
	nVrpKS64BDH8b6VPa24otnu3RlDdf9c7YOB8mxX1dXsqRDl/Xuk20g3HnZCBNb53T2Ozsh9IFYWjM
	/+MCh4bM2Yh1yJkIFhLnPxtlpt8AYi6Ns6ltrH0SUpCFsVfAJ1VIkCIwM/9EVW6/gMohtZPB3GmWZ
	mia7gh8279UC9zubBK8ouoG9BHroPnTT6v+A3Cs/HdxtxSuFcN5Oh71kSReZ/cs5SFtSB7H7ng84v
	Ww7hfzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gu-0000000D5YF-2Izo;
	Thu, 19 Nov 2026 18:54:12 +0000
Received: from mail-ot1-x346.google.com ([2607:f8b0:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FR-0000000D49u-3elX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:44 +0000
Received: by mail-ot1-x346.google.com with SMTP id 46e09a7af769-83edc5c5ae9so122024a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114360; x=1795719160; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vf5cuVhzqNxbLoI4CPxDBEoH18FVa00DCFt8jqQWCmY=;
        b=E3RVuEbwlvxcRYZD9EPghKY0df0WWmqDPACXrX/m5LWzn8+xAGIw8tivc/C2Je3d/G
         HwbcrtwwXoPcCi3SzDtlbh+XxKfYkRKHO3Q8YmLKQI1M20T7jyK9WLiKWI29piDxZoI9
         dJ+LSRfq1jI0c57p5jgp/he3RIdlGzcHR1KHnRTKxKuU8lFZDIkL9LEYPDds6O3w/Eky
         dFkvAz2nVHjfJlzO5o/mJwR34pohss4icItxwYPzzUjPXnRvSpCmNWAyq0qeITUqYSX5
         SkoHSfZVW7fsPkHcg4koUiPF3hCntWb9qdopu+lOb67Da0/4RY/YmFt4gIWz7V3ozLF/
         /KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114360; x=1795719160;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vf5cuVhzqNxbLoI4CPxDBEoH18FVa00DCFt8jqQWCmY=;
        b=wU5LE0/pii0YDRmFazPBEH2z5pPkHCqm9GoFbJHcMzqK9DWrVqrSBKpV5BdKI+xdPm
         +APiwH22ZUeNBrKvjBmStIl3sOtLd0w1ofQ9jSaOuuGfV5/BhyTczHnfYIysLBJ/Vf3A
         PhwFGuatcGi/nOIz+QfJ/zbH1O5yssnTDAOFVcqNYIaMX80e2+K+oVcAjwiLulNmbFeL
         xe6N+Z5VW5OlrBAO8ltgbNtswPsvs3cYiXCxbt3jHFd6WtItKYprmOCkJ37D+DO6E2/T
         uHwz9BXjEZMPiH3kTGKWnwis0YnDcp8Qjp9XSd3Yw5t4WoGIyCNYZRseueuJWb1Tbq7y
         hB3w==
X-Forwarded-Encrypted: i=1; AL+hErFJvrqJQhI+BITL2Qn14XYyRq1wM6VchcqPQc9MN0K2yjDcMSnVm5byDlGkuWex84q1bbJEpFJeSWwQYjJJNBcE@lists.infradead.org
X-Gm-Message-State: APuU4Z8Dz+AQ/nVJ0Q9jMVP2hcnK5jzjq3nTUlHK95p5u8fLVfnMHzqa
	0HtnOTO3LDXkHbejou/FprrFXDv1H+XyY+2OjwIowQFIHa2/4R7n6QqhC5H5kSJDHQPQOWJLAZG
	KjXDGCSLhwrf8NXz8q0gzR+BEEQ==
X-Received: from iobi29-n2.prod.google.com ([2002:a05:6602:c69d:20b0:9c7:67b2:21c8])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4f4f:b0:56a:dc07:f218 with SMTP id 5614622812f47-57a0a10c801mr992845b6e.20.1795114359282;
 Thu, 19 Nov 2026 10:52:39 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:06 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-25-coltonlewis@google.com>
Subject: [PATCH v10 24/33] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
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
X-CRM114-CacheID: sfid-20261119_105241_969760_88F9D9F6 
X-CRM114-Status: GOOD (  21.03  )
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

Because ARM hardware does not directly inject PMU PPIs into guests,
overflows on partitioned guest counters raise physical PMU interrupts
that enter the host's armv8pmu_handle_irq() handler.

Update armv8pmu_handle_irq() to read PMOVSCLR_EL0 without blindly
clearing guest overflow bits:
- Pass pmovsr to kvm_pmu_handle_guest_irq(), which clears guest-reserved
  overflow bits in hardware and latches them into the running vCPU's
  shadow PMOVSSET_EL0 register.
- Mask out guest-reserved counter bits before clearing and processing
  host perf overflows, returning IRQ_HANDLED early when only guest
  counters overflowed or no host events are active.

Also add kvm_pmu_host_start() and kvm_pmu_host_stop() so
armv8pmu_start() and armv8pmu_stop() toggle MDCR_EL2.HPME rather than
PMCR_EL0.E while a partitioned guest's PMU state is loaded on the CPU
(leaving guest counters 0..HPMN-1 and PMCCNTR_EL0 under guest PMCR_EL0.E
control), guarding local_daif_save() with !in_nmi() for GICv3 pseudo-NMI
interrupt handlers.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h   |   8 +++
 arch/arm64/include/asm/arm_pmuv3.h |   5 ++
 arch/arm64/kvm/pmu-direct.c        | 102 +++++++++++++++++++++++++++++
 drivers/perf/arm_pmuv3.c           |  34 +++++-----
 include/kvm/arm_pmu.h              |   7 ++
 5 files changed, 141 insertions(+), 15 deletions(-)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 71cf03ab58cbb..d8051ea261481 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -180,6 +180,11 @@ static inline void write_pmintenset(u32 val)
 	write_sysreg(val, PMINTENSET);
 }
 
+static inline u32 read_pmintenset(void)
+{
+	return read_sysreg(PMINTENSET);
+}
+
 static inline void write_pmintenclr(u32 val)
 {
 	write_sysreg(val, PMINTENCLR);
@@ -231,6 +236,9 @@ static inline u64 kvm_pmu_guest_counter_mask(void)
 {
 	return 0;
 }
+static inline void kvm_pmu_handle_guest_irq(u64 pmovsr) {}
+static inline bool kvm_pmu_host_start(void) { return false; }
+static inline bool kvm_pmu_host_stop(void) { return false; }
 
 /* PMU Version in DFR Register */
 #define ARMV8_PMU_DFR_VER_NI        0
diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index cf2b2212e00a2..9037a28365951 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -110,6 +110,11 @@ static inline void write_pmintenset(u64 val)
 	write_sysreg(val, pmintenset_el1);
 }
 
+static inline u64 read_pmintenset(void)
+{
+	return read_sysreg(pmintenset_el1);
+}
+
 static inline void write_pmintenclr(u64 val)
 {
 	write_sysreg(val, pmintenclr_el1);
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index c2ea1ce5efe74..21357decce214 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -800,3 +800,105 @@ static void kvm_pmu_set_guest_owned(struct kvm_vcpu *vcpu)
 		__kvm_pmu_load(vcpu, true);
 	}
 }
+
+/**
+ * kvm_pmu_handle_guest_irq() - Record IRQs in guest counters
+ * @pmovsr: Overflow flags reported by driver
+ *
+ * Set overflow flags in guest-reserved counters in the VCPU register
+ * for the guest to clear later.
+ */
+void kvm_pmu_handle_guest_irq(u64 pmovsr)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	u64 mask = kvm_pmu_guest_counter_mask();
+	u64 govf = pmovsr & mask;
+
+	if (!govf)
+		return;
+
+	write_pmovsclr(govf);
+
+	if (!vcpu || !vcpu->arch.pmu.loaded_on_cpu)
+		return;
+
+	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
+}
+
+/**
+ * kvm_pmu_host_start() - Enable host PMU counters while guest owns PMU
+ *
+ * When a partitioned guest owns the PMU, host counters (HPMN..N-1) are
+ * gated by MDCR_EL2.HPME rather than PMCR_EL0.E.
+ *
+ * Return: True if handled via MDCR_EL2.HPME, false if caller should use PMCR_EL0.E
+ */
+bool kvm_pmu_host_start(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	unsigned long daif = 0;
+	bool nmi;
+	u64 mdcr;
+
+	if (!vcpu || !kvm_pmu_is_partitioned(vcpu->kvm) ||
+	    !vcpu->arch.pmu.loaded_on_cpu)
+		return false;
+
+	nmi = in_nmi();
+	if (!nmi)
+		daif = local_daif_save();
+
+	if (!vcpu->arch.pmu.loaded_on_cpu) {
+		if (!nmi)
+			local_daif_restore(daif);
+		return false;
+	}
+
+	mdcr = READ_ONCE(vcpu->arch.mdcr_el2) | MDCR_EL2_HPME;
+	WRITE_ONCE(vcpu->arch.mdcr_el2, mdcr);
+	if (has_vhe())
+		write_sysreg(mdcr, mdcr_el2);
+	isb();
+	if (!nmi)
+		local_daif_restore(daif);
+	return true;
+}
+
+/**
+ * kvm_pmu_host_stop() - Disable host PMU counters while guest owns PMU
+ *
+ * When a partitioned guest owns the PMU, host counters (HPMN..N-1) are
+ * gated by MDCR_EL2.HPME rather than PMCR_EL0.E.
+ *
+ * Return: True if handled via MDCR_EL2.HPME, false if caller should use PMCR_EL0.E
+ */
+bool kvm_pmu_host_stop(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	unsigned long daif = 0;
+	bool nmi;
+	u64 mdcr;
+
+	if (!vcpu || !kvm_pmu_is_partitioned(vcpu->kvm) ||
+	    !vcpu->arch.pmu.loaded_on_cpu)
+		return false;
+
+	nmi = in_nmi();
+	if (!nmi)
+		daif = local_daif_save();
+
+	if (!vcpu->arch.pmu.loaded_on_cpu) {
+		if (!nmi)
+			local_daif_restore(daif);
+		return false;
+	}
+
+	mdcr = READ_ONCE(vcpu->arch.mdcr_el2) & ~MDCR_EL2_HPME;
+	WRITE_ONCE(vcpu->arch.mdcr_el2, mdcr);
+	if (has_vhe())
+		write_sysreg(mdcr, mdcr_el2);
+	isb();
+	if (!nmi)
+		local_daif_restore(daif);
+	return true;
+}
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 1676f13cc7c38..440f77cf0a2fc 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -777,18 +777,9 @@ static void armv8pmu_disable_event_irq(struct perf_event *event)
 	armv8pmu_disable_intens(BIT(event->hw.idx));
 }
 
-static u64 armv8pmu_getreset_flags(void)
+static u64 armv8pmu_getovf_flags(void)
 {
-	u64 value;
-
-	/* Read */
-	value = read_pmovsclr();
-
-	/* Write to clear flags */
-	value &= ARMV8_PMU_CNT_MASK_ALL;
-	write_pmovsclr(value);
-
-	return value;
+	return read_pmovsclr() & ARMV8_PMU_CNT_MASK_ALL;
 }
 
 static void update_pmuserenr(u64 val)
@@ -878,7 +869,8 @@ static void armv8pmu_start(struct arm_pmu *cpu_pmu)
 		brbe_enable(cpu_pmu);
 
 	/* Enable all counters */
-	armv8pmu_pmcr_write(armv8pmu_pmcr_read() | ARMV8_PMU_PMCR_E);
+	if (!kvm_pmu_host_start())
+		armv8pmu_pmcr_write(armv8pmu_pmcr_read() | ARMV8_PMU_PMCR_E);
 }
 
 static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
@@ -889,7 +881,8 @@ static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
 		brbe_disable();
 
 	/* Disable all counters */
-	armv8pmu_pmcr_write(armv8pmu_pmcr_read() & ~ARMV8_PMU_PMCR_E);
+	if (!kvm_pmu_host_stop())
+		armv8pmu_pmcr_write(armv8pmu_pmcr_read() & ~ARMV8_PMU_PMCR_E);
 }
 
 static void read_branch_records(struct pmu_hw_events *cpuc,
@@ -911,9 +904,9 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	int idx;
 
 	/*
-	 * Get and reset the IRQ flags
+	 * Get the IRQ flags
 	 */
-	pmovsr = armv8pmu_getreset_flags();
+	pmovsr = armv8pmu_getovf_flags();
 
 	/*
 	 * Did an overflow occur?
@@ -921,6 +914,17 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	if (!armv8pmu_has_overflowed(pmovsr))
 		return IRQ_NONE;
 
+	kvm_pmu_handle_guest_irq(pmovsr);
+
+	pmovsr &= ~kvm_pmu_guest_counter_mask();
+	if (!pmovsr)
+		return IRQ_HANDLED;
+
+	write_pmovsclr(pmovsr);
+
+	if (bitmap_empty(cpuc->used_mask, ARMPMU_MAX_HWEVENTS))
+		return IRQ_HANDLED;
+
 	/*
 	 * Handle the counter(s) overflow(s)
 	 */
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index e3f5b9a1a4817..9800514019630 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -108,6 +108,9 @@ void kvm_pmu_reload_part(struct kvm_vcpu *vcpu);
 u64 kvm_pmu_guest_counter_mask(void);
 void kvm_pmu_load(struct kvm_vcpu *vcpu);
 void kvm_pmu_put(struct kvm_vcpu *vcpu);
+void kvm_pmu_handle_guest_irq(u64 pmovsr);
+bool kvm_pmu_host_start(void);
+bool kvm_pmu_host_stop(void);
 
 #define kvm_pmu_get_access(vcpu)	((vcpu)->arch.pmu.access)
 #define kvm_pmu_reset_access(vcpu)	((vcpu)->arch.pmu.access = VCPU_PMU_ACCESS_FREE)
@@ -277,6 +280,10 @@ static inline u64 kvm_pmu_guest_counter_mask(void)
 	return 0;
 }
 
+static inline void kvm_pmu_handle_guest_irq(u64 pmovsr) {}
+static inline bool kvm_pmu_host_start(void) { return false; }
+static inline bool kvm_pmu_host_stop(void) { return false; }
+
 static inline bool has_kvm_pmu_partition_support(void)
 {
 	return false;
-- 
2.56.1.708.g77570a6a1d-goog


