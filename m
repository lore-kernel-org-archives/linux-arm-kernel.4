Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DF160A382E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wv6yFzPf;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XbefDkZU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KP5KnQUPfka8VmyDjZcXxbg47BZ5cMwAz3YLWjZsMZ4=; b=wv6yFzPfH2KONOk8rpj5IPCwSA
	0x7vNo3fFuLpiuTzzCDKVEUbvGrQ/Ht0lnVIis9lyiqdtMGza13f1WZFK3p1KK/5q8672ynzPCwTy
	MZNI6SG7B2/kzWa+bludYmHmdKBC+xBXp2BcX1vyHwntIYWhmPZWUM6HB+qYkXnMGIJLFsyjdRinX
	TmbpW9TzI5FXOaywqiVwqGooItSP58oS3OeKjyO04l2i06pqeMi1i8aoBQstVd5d32XEnuIbAdVz+
	ok2cCBqYON4A/qkFgxbGqYKudUR86xTSMOmyv6knVpiNpbnyDyTHynMMmvXhCDxhRjEdrLMXT9/Rv
	8/mmCMXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FL-0000000D3zm-2EVM;
	Thu, 19 Nov 2026 18:52:35 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7F8-0000000D3oB-1fCr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:24 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-55bf11583d9so12192b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114341; x=1795719141; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KP5KnQUPfka8VmyDjZcXxbg47BZ5cMwAz3YLWjZsMZ4=;
        b=XbefDkZUZiOA7EuFzKCS7ENc9csXMXDbHgjL/mNegCFB053TpJNEuBjMR+BTjv4Nqd
         sfRSjTg53DOX+Y0+ShHZ2jbhaNUBACGskwVbrjT7Vzx7E/KnatK3Qi/Ra7LY87uftHzP
         +hgIOFaZPv8sKqTwC6ltWriOtphL/3eGQNSj2iTN/dbZ3pfKzKkuv/lABsW9hKVmqkCf
         FUrpvqUUndi2dQfDIN44Vh5OLjxjE3Qf90hGaZanGBphRybRjFSLAf5yIGz3LnSe+Kl3
         X2DAqeElsY96ZMDQhccUvR+4c7Eu2z864nprjNzuvV3SJGmFSVbwVsLgFhzxO0boDCIB
         SORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114341; x=1795719141;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KP5KnQUPfka8VmyDjZcXxbg47BZ5cMwAz3YLWjZsMZ4=;
        b=rU/t6dtlHA3a3rMlODESQTEC2wc+YCssuGBSdZu/vFENiCx0WYY3zUdAZrqISsxXjW
         VoDCgNVdKZrLg8saybFS6h2SI8eB7l38IMOySazHxm9u9f4oNCZT7/wfONMfICL9d6cR
         VmIy43jysIphzizpMCb7ZGjsuaTVfig8v89DAFX7BT+p4DiPgPKbh9jhBrAzeRczZk0f
         SQY5NGhf3WGMIRJxjp4M4sparAt8gL3sI+Q+7IsZgdrAFndtxZzDVsGY6TkFlTDkBLiX
         J7G0bnIBYgTh1p2C/I64tZLPurFl89bIFMzvx1y1bcbqNg7BE+RTy3CqkVve5BEgqJsO
         d3Rg==
X-Forwarded-Encrypted: i=1; AL+hErH02ZaaPs7p1gkmynQwB/mr1Zck0Xgk34SXLsRXr4KXttBRN3nIhxeFLwVhTTLX58JHieNMJ9ig6uDMhzoKaXYM@lists.infradead.org
X-Gm-Message-State: APuU4Z+VBhfzk3N7C3n1n4F3EaaH4ck/pgnNkecMRkORj0cf8LOqT4MC
	SJt6FDcHxAm6SKfXwtwxAmrbdDyE43mjU8hxwDhtRiWQ5SvrA5voj7IDHsfeVzBjHnfeJ0WYxNJ
	vwidyx8d/432MGzGbxnLawc4NfA==
X-Received: from ilqa4.prod.google.com ([2002:a05:6e02:1204:b0:53d:3ab5:58fa])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a1f:b0:4d6:9133:cfee with SMTP id 5614622812f47-5797e899a03mr1751032b6e.51.1795114340655;
 Thu, 19 Nov 2026 10:52:20 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:47 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-6-coltonlewis@google.com>
Subject: [PATCH v10 05/33] KVM: arm64: Ignore HPMN for userspace PMU register access
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
X-CRM114-CacheID: sfid-20261119_105222_463006_75E6DB80 
X-CRM114-Status: GOOD (  14.11  )
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

Userspace save and restore (KVM_GET_ONE_REG / KVM_SET_ONE_REG) must
observe and preserve all VM-implemented PMU counters
([0..nr_pmu_counters-1] plus PMCCNTR_EL0), independent of the vCPU's
current exception level or MDCR_EL2.HPMN.

Currently, two UAPI callbacks still depend on guest execution context
when a nested vCPU (KVM_ARM_VCPU_HAS_EL2) is paused below EL2
(!vcpu_is_el2(vcpu)) with MDCR_EL2.HPMN < nr_pmu_counters:

- set_pmreg() and get_pmreg() (backing PMINTEN{SET,CLR}_EL1,
  PMCNTEN{SET,CLR}_EL0, and PMOVS{SET,CLR}_EL0) mask register values
  with kvm_pmu_accessible_counter_mask(), which strips L1 hypervisor
  counter bits [HPMN..N-1]. Saving a vCPU paused in L2 hides those bits,
  and restoring them while paused in L2 permanently clears them.
- get_pmcr() calls kvm_vcpu_read_pmcr(), which substitutes
  MDCR_EL2.HPMN for PMCR_EL0.N below EL2, corrupting the saved
  PMCR_EL0.N value.

Switch set_pmreg() and get_pmreg() back to
kvm_pmu_implemented_counter_mask(), and have get_pmcr() populate
PMCR_EL0.N directly from vcpu->kvm->arch.nr_pmu_counters using
u64_replace_bits(). Keep kvm_vcpu_read_pmcr() and
kvm_pmu_accessible_counter_mask() for guest trap paths.

Fixes: 9a1c58cfefb0 ("KVM: arm64: nv: Adjust range of accessible PMCs according to HPMN")
Fixes: 600f6fa5c90c ("KVM: arm64: Let kvm_vcpu_read_pmcr() return an EL-dependent value for PMCR_EL0.N")
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 6e8bc4618870d..2d9ae781acff0 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1081,8 +1081,8 @@ static u64 reset_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 		pmcr |= ARMV8_PMU_PMCR_LC;
 
 	/*
-	 * The value of PMCR.N field is included when the
-	 * vCPU register is read via kvm_vcpu_read_pmcr().
+	 * The value of PMCR.N field is included when the vCPU register
+	 * is read via kvm_vcpu_read_pmcr() or get_pmcr().
 	 */
 	__vcpu_assign_sys_reg(vcpu, r->reg, pmcr);
 
@@ -1323,7 +1323,7 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 
 static int set_pmreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r, u64 val)
 {
-	u64 mask = kvm_pmu_accessible_counter_mask(vcpu);
+	u64 mask = kvm_pmu_implemented_counter_mask(vcpu);
 
 	__vcpu_assign_sys_reg(vcpu, r->reg, val & mask);
 	kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
@@ -1333,7 +1333,7 @@ static int set_pmreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r, u64 va
 
 static int get_pmreg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r, u64 *val)
 {
-	u64 mask = kvm_pmu_accessible_counter_mask(vcpu);
+	u64 mask = kvm_pmu_implemented_counter_mask(vcpu);
 
 	*val = __vcpu_sys_reg(vcpu, r->reg) & mask;
 	return 0;
@@ -1505,7 +1505,9 @@ static bool access_pmuserenr(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 static int get_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 		    u64 *val)
 {
-	*val = kvm_vcpu_read_pmcr(vcpu);
+	*val = u64_replace_bits(__vcpu_sys_reg(vcpu, PMCR_EL0),
+				vcpu->kvm->arch.nr_pmu_counters,
+				ARMV8_PMU_PMCR_N);
 	return 0;
 }
 
-- 
2.56.1.708.g77570a6a1d-goog


