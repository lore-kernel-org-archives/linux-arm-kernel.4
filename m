Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893A3606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4jVN5Ljt;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o5T1eRsZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s7gXTki65dpFFX+5OBgJjT7u8o6SXEVygRdxz2zSjw8=; b=4jVN5LjtMB7RfDHT1x7GjHxdHa
	aLHHIDyFsQpv40ywaNKSOFqbn8wR+bKZ3opyEkg+mgqquTUDnoN7sVZVPOM7v3B81FKLX6yS+pL6t
	+W7JYbi5e3UB0AahPWNPaoxfTDMiwgOhOfXsyWKbqBf7a/u78/6wm/74/zzyd4XZrFEV3zi4cqMzn
	yzU/uV1hv2Zdj433iqu9k+9KX+ZumsKFK0YqluTm+OD1xXyNLP9fYKAh16HmyDmQwRggdoqRNTErO
	sXBwmnaNFfCu1sKyjnNUV2bNPEGq5OZPcdvEPjCYcUIJVefKEQ6NhoKTzNvgaeKulgjV9Pn7NGdoe
	Jp28SBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gr-0000000D5S7-18gi;
	Thu, 19 Nov 2026 18:54:09 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FJ-0000000D3wQ-1pP7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:35 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-4eb0b989f0eso40041b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114352; x=1795719152; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7gXTki65dpFFX+5OBgJjT7u8o6SXEVygRdxz2zSjw8=;
        b=o5T1eRsZegBkY+jy+7j+nBVvinEwT0ICn2ipi2btM12x+7q6vn3PInOK2LwScDXCCm
         ELEcyNPTOckt82RZSds3Z518349yrvUUjc5Tsvjt1vmiQkM/p6fZS7Hch9+WWZIP1Ypk
         A7rHnjvVUeRzch9JFhlaursCb5jurCaO2XTi58ffErEk7Yj04hWNaQLWjSntgwqklEjx
         ZyOy+/P7SAbC93heVLBnCMuSbKVNDid0SjqTC0es9ZDaUmR1CigXt47LS5yhIeUkouwx
         YhP4e+ZEFBCRcA7Sn7UUa7FJxu+3AMPFZvTL/k1spS41fFGmLpEnmN9DazUvR7szYSrp
         Pb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114352; x=1795719152;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7gXTki65dpFFX+5OBgJjT7u8o6SXEVygRdxz2zSjw8=;
        b=1iWCkjnd9enaAcgfI7jcnHkEYuPHj3veVJkmgYFWkRoX9fKEzfd9zxeLjW2kOhYcYE
         LDxmVRRIZz/tw7ltqiZ8CUu6X21hV4wCuIvniIaRo5RvaKlYMtPDCv3dZComiSXhdztq
         scGbR9LlcVYK6g2UKWzRpZjgeaX9rEEU9hEVKpg8FwMqO2DFLB3UITgTe2JpTduT0oCq
         abk6+VJnp5wBS5qcC3ldkwJtvU5EbNxfQusKqEXK0M5uY8lxkdV5cPpIJRJg2YGGN0el
         riCoYiwI7nrr/npwIvnyBdF9JrofXCR2xZRiqnJge39Ht2xWV6ZoAxsYyD7NCj5rauLb
         AeDA==
X-Forwarded-Encrypted: i=1; AL+hErHvnUsHXyO7sYPIIhWy2I96nQPklww2EJqrs4NpFoVATUEMIIGISrXPfjNBSKDb5db+7R8wUAHt/TtGsE1jwpCo@lists.infradead.org
X-Gm-Message-State: APuU4Z9bC5QD+Q+Nh/4vItmcvEIvj8ggxQwz5UdV3ovT0tEWoSiQf4RE
	gTJvlVXoiNCaf2Sw1jhkXHYSllkgXe2r6mtTDnNuuRi1O6mcUMb+ApvB40K9r2FW7XcwVcot7uN
	G3cMBjuXIZVV8lYQJ02loWmjnhQ==
X-Received: from ilben9-n2.prod.google.com ([2002:a05:6e02:5109:20b0:54b:6fad:75e6])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3026:b0:571:d883:d551 with SMTP id 5614622812f47-579789ceb9fmr1648716b6e.2.1795114351597;
 Thu, 19 Nov 2026 10:52:31 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:58 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-17-coltonlewis@google.com>
Subject: [PATCH v10 16/33] KVM: arm64: Set up MDCR_EL2 to handle a Partitioned PMU
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
X-CRM114-CacheID: sfid-20261119_105233_504513_23CB9016 
X-CRM114-Status: GOOD (  19.73  )
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

Configure MDCR_EL2 for a Partitioned PMU in kvm_arm_setup_mdcr_el2():
set HPME, HPMD, and HCCD (plus HLP on FEAT_PMUv3p5 so host counters
retain 64-bit overflow width), program HPMN to the guest's general
purpose counter count, and clear coarse-grained TPM and TPMCR traps when
FEAT_FGT is available. Protect MDCR_EL2 updates with local_daif_save()
so GICv3 pseudo-NMI PMU handlers toggling MDCR_EL2.HPME cannot race with
kvm_arm_setup_mdcr_el2().

Update kvm_nested_setup_mdcr_el2() for the two nested execution contexts:
- Nested guest context (is_nested_ctxt(vcpu), L2 at vEL1/vEL0):
  NV_MDCR_GUEST_INCLUDE already propagates L1's virtual TPM and TPMCR.
  When L1 sub-partitions its counters (vHPMN < nr_pmu_counters, so
  kvm_pmu_hyp_counter_mask(vcpu) is non-zero), physical MDCR_EL2.HPMN
  still equals nr_pmu_counters, so hardware alone cannot stop L2 from
  accessing L1's hypervisor counters (vHPMN..nr_pmu_counters-1) or
  reading nr_pmu_counters from PMCR_EL0.N. Force TPM and TPMCR so L0
  emulates 0..vHPMN-1 locally and forwards hypervisor counter traps to
  L1.
- Nested hypervisor context (else branch, L1): under VHE, both L1 vEL2
  (physical EL1) and VHE host EL0 (physical EL0) run in this context
  without exiting to L0 across ERET and SVC. When L1's PMUSERENR_EL0 is
  0, hardware traps EL0 PMU accesses directly to L1 vEL2, allowing TPM
  and TPMCR to stay clear for untrapped L1 vEL2 access. When L1 enables
  EL0 access in PMUSERENR_EL0, propagate L1's virtual TPM/TPMCR (and set
  TPM/TPMCR if L1 sub-partitions counters) so VHE host EL0 cannot bypass
  L1's traps or vHPMN boundary.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/debug.c  | 41 +++++++++++++++++++++++++++++++++++++++--
 arch/arm64/kvm/nested.c | 35 ++++++++++++++++++++++++-----------
 2 files changed, 63 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 89c9fb0cfeee2..a1cb4c076bdb4 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -11,6 +11,7 @@
 #include <linux/hw_breakpoint.h>
 
 #include <asm/arm_pmuv3.h>
+#include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_arm.h>
@@ -37,9 +38,10 @@ static int cpu_has_spe(u64 dfr0)
  */
 static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 {
+	unsigned long daif;
 	u64 mdcr;
 
-	preempt_disable();
+	daif = local_daif_save();
 
 	/*
 	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
@@ -53,6 +55,41 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 		 MDCR_EL2_TDRA |
 		 MDCR_EL2_TDOSA);
 
+	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		u8 nr_host_cntr = *host_data_ptr(nr_event_counters);
+		u8 nr_guest_cntr = vcpu->kvm->arch.nr_pmu_counters;
+
+		if (cpumask_test_cpu(smp_processor_id(),
+				     vcpu->kvm->arch.supported_cpus) &&
+		    nr_guest_cntr < nr_host_cntr &&
+		    (cpus_have_final_cap(ARM64_HAS_HPMN0) || nr_guest_cntr > 0)) {
+			u64 hpmn = FIELD_GET(MDCR_EL2_HPMN, read_sysreg(mdcr_el2));
+			bool hpme;
+
+			if (hpmn < nr_host_cntr)
+				hpme = !!(read_sysreg(mdcr_el2) & MDCR_EL2_HPME);
+			else
+				hpme = !!(read_sysreg(pmcr_el0) & ARMV8_PMU_PMCR_E);
+
+			mdcr |= (MDCR_EL2_HPMD | MDCR_EL2_HCCD);
+			if (is_pmuv3p5(read_pmuver()))
+				mdcr |= MDCR_EL2_HLP;
+			if (hpme)
+				mdcr |= MDCR_EL2_HPME;
+
+			/*
+			 * Take out the coarse grain traps if we are using
+			 * fine grain traps and enforce counter access with
+			 * HPMN.
+			 */
+			mdcr &= ~MDCR_EL2_HPMN;
+			mdcr |= FIELD_PREP(MDCR_EL2_HPMN, nr_guest_cntr);
+
+			if (cpus_have_final_cap(ARM64_HAS_FGT))
+				mdcr &= ~(MDCR_EL2_TPM | MDCR_EL2_TPMCR);
+		}
+	}
+
 	/* Is the VM being debugged by userspace? */
 	if (vcpu->guest_debug)
 		/* Route all software debug exceptions to EL2 */
@@ -73,7 +110,7 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 	if (has_vhe())
 		write_sysreg(mdcr, mdcr_el2);
 
-	preempt_enable();
+	local_daif_restore(daif);
 }
 
 void kvm_init_host_debug_data(void)
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index b80d90ede9004..06a535c54b708 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -2241,16 +2241,29 @@ void kvm_nested_setup_mdcr_el2(struct kvm_vcpu *vcpu, u64 *mdcr)
 {
 	u64 guest_mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
 
-	if (is_nested_ctxt(vcpu))
+	if (is_nested_ctxt(vcpu)) {
 		*mdcr |= (guest_mdcr & NV_MDCR_GUEST_INCLUDE);
-	/*
-	 * In yet another example where FEAT_NV2 is fscking broken, accesses
-	 * to MDSCR_EL1 are redirected to the VNCR despite having an effect
-	 * at EL2. Use a big hammer to apply sanity.
-	 *
-	 * Unless of course we have FEAT_FGT, in which case we can precisely
-	 * trap MDSCR_EL1.
-	 */
-	else if (!cpus_have_final_cap(ARM64_HAS_FGT))
-		*mdcr |= MDCR_EL2_TDA;
+		if (kvm_pmu_is_partitioned(vcpu->kvm) &&
+		    kvm_pmu_hyp_counter_mask(vcpu))
+			*mdcr |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
+	} else {
+		/*
+		 * In yet another example where FEAT_NV2 is fscking broken,
+		 * accesses to MDSCR_EL1 are redirected to the VNCR despite
+		 * having an effect at EL2. Use a big hammer to apply sanity.
+		 *
+		 * Unless of course we have FEAT_FGT, in which case we can
+		 * precisely trap MDSCR_EL1.
+		 */
+		if (!cpus_have_final_cap(ARM64_HAS_FGT))
+			*mdcr |= MDCR_EL2_TDA;
+
+		if (kvm_pmu_is_partitioned(vcpu->kvm) &&
+		    (__vcpu_sys_reg(vcpu, PMUSERENR_EL0) &
+		     ARMV8_PMU_USERENR_MASK)) {
+			*mdcr |= guest_mdcr & (MDCR_EL2_TPM | MDCR_EL2_TPMCR);
+			if (kvm_pmu_hyp_counter_mask(vcpu))
+				*mdcr |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
+		}
+	}
 }
-- 
2.56.1.708.g77570a6a1d-goog


