Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47F3606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s6xGyHYX;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dnMMFDpv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=prmoIohS2xA8jaHyxKChBFBZwGVjZr06KfXp8bLe77w=; b=s6xGyHYX9V+C4WxtjEsQZkVD0M
	juquVbAgDnW4IBwBJijUtYSN6A4n3MXi/xM6o7IP+OI5U+0aD1jiise6THKqUs2lUglNecy327VTX
	xAnS4OyXQo7buSQlAOEE2QWzv98rgEfhgO6C2rNpGreQMEKexS1xfXzBMm6k8Z0jNCF4a4NDYFwGH
	eJ6qHfUYT4ei/3R2LWjmIPdYOLfuQziXUAcgcKG2GFzc51p7uJk8Kk/ipBISj/pum/OMqLesKh4rf
	6hj27fbN1OStHIEEN3G8aNsEfoknYmd65wF5IcLan2J0C6Gm89+0atC9o7kPraapPQbP9ZZSL7qke
	sJAmTvUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gr-0000000D5Sf-2XxO;
	Thu, 19 Nov 2026 18:54:09 +0000
Received: from mail-oa1-x48.google.com ([2001:4860:4864:20::48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FL-0000000D3xz-2BwA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:37 +0000
Received: by mail-oa1-x48.google.com with SMTP id 586e51a60fabf-45ecb9dd589so137204fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114354; x=1795719154; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prmoIohS2xA8jaHyxKChBFBZwGVjZr06KfXp8bLe77w=;
        b=dnMMFDpvt+86hnf5Yw7vwV4LH8IZQqUxYu9MeiFl6omAq/caa7DaxM1hdJfTdA73Bf
         j4qTVGAnTzC9k9mtBauzY4JEwBdMcHv8jdGc70jZsaX5ZuXqh+weLrFEOew9vADt8sy5
         i82Cg0fy2oOxsWzqTQKSQKm7gyI/0xkny8WjhiGZ3d5MiHd0JjHXyHpVmWUwOklA5KG0
         2UKQnFJLxhr5MVx68PhOptwf4Sm3AzFpkjTYRLNK6RzsZF/IVdzhaxbjlZGaUPTDQal7
         k2cNGSNdYJSy+nRpBOXRkvogWd2OtoknBOwo7Ymd12aepN9rOkKImRtbWuMH7oyy2wM7
         Rs9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114354; x=1795719154;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=prmoIohS2xA8jaHyxKChBFBZwGVjZr06KfXp8bLe77w=;
        b=yRnp6SMIMA+i1HFzna4Et7TXJI73D+qUgfLZgr7J2QKag/9v8K+ebSuTsyFpUeYd9a
         rhUbIZykvxEWyMwSKsCCbLpiTBmMol4YqHWOrl8yHiH9t2bPi3SyBBb2SD4lRuxCCVSj
         4mMGAO43nouhxATGA0cHaKdsQT3bl+wMe7HYRqaWRMilRFzTGA94dfLkvxQnSDkcY9L6
         OJlh4p9q6lM3DIwABQ5c15v5wwGBNnEQPlfFB2WpiKMxnL0HqEFoNL3EMpPz/Mzqjpxk
         MUwoVUa7Mz9stloIADzCZEwoLA6yNe78WeFxnrVSIaHSekHJkaNla+NZ4yb2zVr+D0/X
         r7xQ==
X-Forwarded-Encrypted: i=1; AL+hErEN/PpFsyl32NDEP0bahBzvHjj1A1STcx2AGtBEzAUH1Wm3/hfGoGPoLiStFdNffeg5nQ9E2iNnNCjDnhLr1LID@lists.infradead.org
X-Gm-Message-State: APuU4Z+FA+6SeZqyZ2B1sdNwpKXopZVSTSJDZxu7anpsvAT+ymQz+Ynt
	sS5bGUrT+KoL3cntzoC6OIMlXoH79hhXxumhJnCSd0DzDt6cZsTb74eY/PYq9EfP3lWeSMySm4o
	BeKMd9FcpYo5YXuOIZiRibNqnMg==
X-Received: from iljy19.prod.google.com ([2002:a05:6e02:f53:b0:54e:9371:e0d7])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:244d:b0:55b:f88d:6e8b with SMTP id 5614622812f47-57a0a10c8b9mr1106549b6e.13.1795114353687;
 Thu, 19 Nov 2026 10:52:33 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:00 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-19-coltonlewis@google.com>
Subject: [PATCH v10 18/33] KVM: arm64: Enforce PMU event filter at vcpu_load()
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
X-CRM114-CacheID: sfid-20261119_105235_650182_59E992E8 
X-CRM114-Status: GOOD (  15.47  )
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

The KVM PMU event filter uAPI requires disallowed events not to count.
Because userspace can install or update the event filter independently
of guest register writes, re-apply the filter on every vCPU load as well
as on trapped PMEVTYPER<n>_EL0 and PMCCFILTR_EL0 writes, excluding all
exception levels in hardware whenever the selected event is blocked.

When running in a nested hypervisor context (is_hyp_ctxt(vcpu)), L1
vEL2 executes at physical NS-EL1: remap guest ARMV8_PMU_INCLUDE_EL2 onto
physical EL1 (clearing ARMV8_PMU_EXCLUDE_NS_EL1 so P == NSK) and honor
guest MDCR_EL2.HPMD for event counters 0..HPMN-1 and MDCR_EL2.HCCD for
PMCCNTR_EL0.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c | 78 +++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 5c8a8c42e353d..ace3e8e781538 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -242,6 +242,67 @@ u64 kvm_pmu_direct_reg_read(struct kvm_vcpu *vcpu, unsigned int reg)
 	}
 }
 
+static void kvm_pmu_apply_single_event_filter(struct kvm_vcpu *vcpu, u8 idx)
+{
+	u64 guest_counters;
+	u64 evtyper_set = ARMV8_PMU_EXCLUDE_EL0 |
+		ARMV8_PMU_EXCLUDE_EL1;
+	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
+	bool guest_include_el2;
+	u64 val;
+	u64 evsel;
+
+	guard(preempt)();
+
+	if (!kvm_pmu_part_on_cpu(vcpu))
+		return;
+
+	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+	if (!test_bit(idx, (unsigned long *)&guest_counters))
+		return;
+
+	if (idx == ARMV8_PMU_CYCLE_IDX) {
+		val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
+		val &= kvm_pmu_evtyper_mask(vcpu->kvm) &
+		       ~kvm_pmu_event_mask(vcpu->kvm);
+		evsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
+	} else {
+		val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + idx);
+		val &= kvm_pmu_evtyper_mask(vcpu->kvm);
+		evsel = val & kvm_pmu_event_mask(vcpu->kvm);
+	}
+
+	guest_include_el2 = (val & ARMV8_PMU_INCLUDE_EL2);
+	val &= ~evtyper_clr;
+
+	if (unlikely(is_hyp_ctxt(vcpu))) {
+		u64 mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
+		bool hpmd = (idx == ARMV8_PMU_CYCLE_IDX) ?
+			    (mdcr & MDCR_EL2_HCCD) :
+			    (!kvm_pmu_counter_is_hyp(vcpu, idx) &&
+			     (mdcr & MDCR_EL2_HPMD));
+
+		val &= ~ARMV8_PMU_EXCLUDE_NS_EL1;
+		if (guest_include_el2 && !hpmd)
+			val &= ~ARMV8_PMU_EXCLUDE_EL1;
+		else
+			val |= ARMV8_PMU_EXCLUDE_EL1;
+	}
+
+	if (vcpu->kvm->arch.pmu_filter &&
+	    evsel != ARMV8_PMUV3_PERFCTR_SW_INCR &&
+	    evsel != ARMV8_PMUV3_PERFCTR_CHAIN &&
+	    !test_bit(evsel, vcpu->kvm->arch.pmu_filter)) {
+		val |= evtyper_set;
+		val &= ~(ARMV8_PMU_EXCLUDE_NS_EL0 | ARMV8_PMU_EXCLUDE_NS_EL1);
+	}
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		write_pmccfiltr(val);
+	else
+		write_pmevtypern(idx, val);
+}
+
 /**
  * kvm_pmu_direct_reg_write() - Write a guest PMU register for Partitioned PMU
  * @vcpu: Pointer to vcpu struct
@@ -281,6 +342,7 @@ void kvm_pmu_direct_reg_write(struct kvm_vcpu *vcpu, unsigned int reg,
 		if (reg == PMCCFILTR_EL0)
 			mask &= ~kvm_pmu_event_mask(vcpu->kvm);
 		__vcpu_assign_sys_reg(vcpu, reg, val & mask);
+		kvm_pmu_apply_single_event_filter(vcpu, reg - PMEVTYPER0_EL0);
 		break;
 	case PMCNTENSET_EL0:
 		val &= kvm_vcpu_pmu_guest_counter_mask(vcpu);
@@ -345,6 +407,21 @@ u64 kvm_pmu_guest_counter_mask(void)
 	return kvm_vcpu_pmu_guest_counter_mask(kvm_get_running_vcpu());
 }
 
+static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	unsigned long guest_counters;
+	u8 i;
+
+	if (!pmu)
+		return;
+
+	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+
+	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS)
+		kvm_pmu_apply_single_event_filter(vcpu, i);
+}
+
 /**
  * kvm_pmu_load() - Load untrapped PMU registers
  * @vcpu: Pointer to struct kvm_vcpu
@@ -376,6 +453,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	}
 
 	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+	kvm_pmu_apply_event_filter(vcpu);
 
 	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
 		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
-- 
2.56.1.708.g77570a6a1d-goog


