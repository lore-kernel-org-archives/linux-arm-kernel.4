Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAD560A2612
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f5pji2Wy;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CQ+Pr2yl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KQsSEkRceSASTHzJzgBIIkzZNEt4co2b8TqRiek6Jc4=; b=f5pji2WyQneQa+5GV+DOb5fa6v
	1RIuhLzf3N6PWcTh9M2IYP1wR2qFxTiLQB9mYzNc3di8vNcaIEm77/GKiBNcwwPRQGTJapeb+DaAw
	0ntDnUOdyZLz8K2vcSfN8f0XJ+0LHEDo4f3w5Ra2x6ehRQy/zD3BOxfaX5DGwS+EpEkPtZHuzE1dW
	YHRWYYa0aW0dk02fLTe2x425Ev/8JatEM2AEdsQe9CIgYgoK8OvzADNxHtst22kMCqo0HtN7+bfKx
	juAvSMON/mE3+6OeFD9fO8wYt0cKjDpg1IyRL6l0kcsCCHgRFm2+NY8wT64U38yZpm3Xke1x75HOa
	1utVm8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FK-0000000D3yJ-2B7f;
	Thu, 19 Nov 2026 18:52:34 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7F7-0000000D3n8-391j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:23 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-4b26d8d2498so171502b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114340; x=1795719140; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQsSEkRceSASTHzJzgBIIkzZNEt4co2b8TqRiek6Jc4=;
        b=CQ+Pr2yl3kPfXC8a+UepbHZZOV7Xrhc9S8P1shadZL5Yvr3iE50bK7ZqJWkcbJOV6U
         JYLlk5PFLnHPrAgkDUVOfUxa+a7DruDMGVMZK2CUbJ5AOFnbtGITN9fx3Bsm6Qb3vCJ4
         /wWJ142jVvASHYdMe39OwEAKj76BLWN/g3rMIEfRqQlR1uYBwg5E+J9SzO/ZWHJ2FjZr
         OZVbYBY3/lcTdpAJ0iqgBAnpFWWBO2kfbUHx+FJ3zjEcWYCoLTuP8ZtIcpy7jar8B0TM
         ni8fXsg9bT0t6GvhFOWODG5q8K5nFRvAQnURsZC0X/JP76b3XdmKcI5WEY/0K6Zy+jMu
         +ZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114340; x=1795719140;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQsSEkRceSASTHzJzgBIIkzZNEt4co2b8TqRiek6Jc4=;
        b=2NmTpfeg7A5nDfWmL+4tqvbTusHEJ8g82i8zaUxEguH/2huG36lpTlq1hLobjFDdwY
         9Wbk8blwXEqcEa3cwU/OxO4qAmYpivUHv/a8ZSWSUC+PpIkISQjIdw9j+q3vgHkdcEx6
         VHWu3HDEfqarLPANTlJfYj3ojMqWUFWuW9ffXIj8geHK1/cS3tvsx/J/QHSJSmKKkXlO
         lKlTcB8FCk5vSsyB6cYSKkJYge6XpLrDOsYWSv9lYEhfD2lrDV5oRBNcv4SmnidDLUMx
         arbiY+6KXVjX2Mtb6EKqtL7aDEZDHGI2e61OZqPhPnzhd3+DdWK68xPrW9gQ/MJpLl4O
         e+wg==
X-Forwarded-Encrypted: i=1; AL+hErGzlGrKRi+ovJ+PGAc12ByI1n+0MXj4vpI84ssFlhC7X46BcMWfk9Dt0cBsEox5zokS6wkjDV/qcWch5GOea0Ks@lists.infradead.org
X-Gm-Message-State: APuU4Z/HiQOyA5Xohb31gBbK14WmIU7ZHdHRRdi8parwWtr815M3Rlhb
	KYRhE8wqMPYh4vnUPjOSOybdOQF8dZuul8GfhZLqvX8TZdPocY/OvcjZYwct7ShgRXI2CkKVj/4
	8k2clqnrSeR23osa9NQ76fAjkfQ==
X-Received: from iobmp26-n1.prod.google.com ([2002:a05:6602:a2da:10b0:9c7:5697:9ad7])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3193:b0:56a:cf0b:a5fb with SMTP id 5614622812f47-57a0b145c20mr991415b6e.36.1795114339806;
 Thu, 19 Nov 2026 10:52:19 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:46 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-5-coltonlewis@google.com>
Subject: [PATCH v10 04/33] KVM: arm64: Use nr_pmu_counters in kvm_pmu_implemented_counter_mask()
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
X-CRM114-CacheID: sfid-20261119_105221_828557_959E3DA0 
X-CRM114-Status: GOOD (  15.90  )
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

kvm_pmu_implemented_counter_mask() returns the bitmask of all counters
implemented by the VM (0..N-1 and PMCCNTR_EL0). Previously it extracted
N from kvm_vcpu_read_pmcr(vcpu), which commit 600f6fa5c90c ("KVM: arm64:
Let kvm_vcpu_read_pmcr() return an EL-dependent value for PMCR_EL0.N")
changed to substitute MDCR_EL2.HPMN for PMCR_EL0.N whenever
vcpu_has_nv(vcpu) && !vcpu_is_el2(vcpu).

As a result, when kvm_vcpu_reload_pmu() services KVM_REQ_RELOAD_PMU
while the vCPU is at vEL1 or vEL0 (for example, when entering a nested
guest after an L1 MDCR_EL2 update), kvm_pmu_implemented_counter_mask()
omits HPMN..N-1 and kvm_vcpu_reload_pmu() wipes L1's hypervisor counter
bits in PMOVSSET_EL0, PMINTENSET_EL1, and PMCNTENSET_EL0.

Fix this in three parts:
- Read vcpu->kvm->arch.nr_pmu_counters directly in
  kvm_pmu_implemented_counter_mask() so the VM-wide implemented mask is
  independent of the vCPU's current exception level.
- Use kvm_pmu_accessible_counter_mask(vcpu) & ~BIT(ARMV8_PMU_CYCLE_IDX)
  for PMCR_EL0.P event counter resets instead of open-coding the
  subtraction of kvm_pmu_hyp_counter_mask(vcpu) below EL2.
- Mask trapped reads in access_pmcnten(), access_pminten(), and
  access_pmovs() with kvm_pmu_accessible_counter_mask(vcpu) (matching
  existing write masking) so retained hypervisor counter bits in
  HPMN..N-1 read as zero at EL1 and EL0.

Fixes: 600f6fa5c90c ("KVM: arm64: Let kvm_vcpu_read_pmcr() return an EL-dependent value for PMCR_EL0.N")
Fixes: 9a1c58cfefb0 ("KVM: arm64: nv: Adjust range of accessible PMCs according to HPMN")
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-emul.c | 5 +----
 arch/arm64/kvm/pmu.c      | 2 +-
 arch/arm64/kvm/sys_regs.c | 6 +++---
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index ea5908df42890..9eff208547746 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -446,12 +446,9 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val)
 		kvm_pmu_set_counter_value(vcpu, ARMV8_PMU_CYCLE_IDX, 0);
 
 	if (val & ARMV8_PMU_PMCR_P) {
-		unsigned long mask = kvm_pmu_implemented_counter_mask(vcpu) &
+		unsigned long mask = kvm_pmu_accessible_counter_mask(vcpu) &
 				     ~BIT(ARMV8_PMU_CYCLE_IDX);
 
-		if (!vcpu_is_el2(vcpu))
-			mask &= ~kvm_pmu_hyp_counter_mask(vcpu);
-
 		for_each_set_bit(i, &mask, 32)
 			kvm_pmu_set_pmc_value(kvm_vcpu_idx_to_pmc(vcpu, i), 0, true);
 	}
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 567de460205a0..dbbe219ac874f 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -852,7 +852,7 @@ u8 kvm_arm_pmu_get_pmuver_limit(void)
 
 u64 kvm_pmu_implemented_counter_mask(struct kvm_vcpu *vcpu)
 {
-	u64 val = FIELD_GET(ARMV8_PMU_PMCR_N, kvm_vcpu_read_pmcr(vcpu));
+	u64 val = vcpu->kvm->arch.nr_pmu_counters;
 
 	if (val == 0)
 		return BIT(ARMV8_PMU_CYCLE_IDX);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 04947bfbd0ee5..6e8bc4618870d 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1359,7 +1359,7 @@ static bool access_pmcnten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 
 		kvm_pmu_reprogram_counter_mask(vcpu, val);
 	} else {
-		p->regval = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
+		p->regval = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & mask;
 	}
 
 	return true;
@@ -1383,7 +1383,7 @@ static bool access_pminten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			/* accessing PMINTENCLR_EL1 */
 			__vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, &=, ~val);
 	} else {
-		p->regval = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
+		p->regval = __vcpu_sys_reg(vcpu, PMINTENSET_EL1) & mask;
 	}
 
 	return true;
@@ -1463,7 +1463,7 @@ static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			/* accessing PMOVSCLR_EL0 */
 			__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, &=, ~(p->regval & mask));
 	} else {
-		p->regval = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+		p->regval = __vcpu_sys_reg(vcpu, PMOVSSET_EL0) & mask;
 	}
 
 	return true;
-- 
2.56.1.708.g77570a6a1d-goog


