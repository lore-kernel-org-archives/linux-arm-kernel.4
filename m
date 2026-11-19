Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADEE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zu81eBQ4;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h+4c/O7U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FFPgXiiazla35XDoHe2VRdMYq0SrMDfs5EMKUnqJLEg=; b=Zu81eBQ4h+m5Bm0hTLVeQPwsVW
	Yvp9apeMehm57JWyMkA4w+2PkTIgwbb7SKcy36w4/y6QCJa/2UBF/6MjI/YiJeEQFccTKNDlv+85/
	KO+ofkTpvgWLcOHK4PkvpnxCngRyt5XfayYVkJeOiFh2HMDKrQV9nA7H83j5VW3a3xs9I4YvMhAY8
	RezGITnDzvY/8bA70T1BApvWKv44xBxDV88WulC8b7JvE0fmvG5RmaVwtf1ujWFIIxNVGveMTfsof
	NWTM0RHv+mXN78i1FvYZfWljtkKqCiDTYkvk4iwtilcpRpv7Uq1hAU4vKRdNgHdFGkC51YHV7idmc
	y+g33Fpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gu-0000000D5Ys-3r3T;
	Thu, 19 Nov 2026 18:54:12 +0000
Received: from mail-oa1-x46.google.com ([2001:4860:4864:20::46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FS-0000000D4C9-3BhU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:44 +0000
Received: by mail-oa1-x46.google.com with SMTP id 586e51a60fabf-47cfa971c9eso1702276fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114361; x=1795719161; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFPgXiiazla35XDoHe2VRdMYq0SrMDfs5EMKUnqJLEg=;
        b=h+4c/O7UHz6/v0BBhgyTLNOfElvMXXYHFkzBL4H9vm+yZglnh5a4j0rT1hJKddcqCR
         MDhjKvkh4IxMqpF4Qri9HIDA5ZgV5S6jmuIhOUcwYZcn4MEEIq9GHep2Wg0eWSIJQDhT
         M8rnviHNLyikoHGxUkhx9fsCK2ZAuLgm4KJMGLslh0GghUVgKVPtsQvrCasaeWnqbaOD
         17LVFlX995lEFAVP/kNMm8TsnzorczLtb+WFTaSc1BdYaUrmQBoHZWZULH3jC/AwM5Jd
         wB6YuoU2lMBXzEZeWP07ru0B9gB5zUWJL2mwPfC9CvYgxDbxjZMqKkh0E0Yzr0VsUHgw
         19ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114361; x=1795719161;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFPgXiiazla35XDoHe2VRdMYq0SrMDfs5EMKUnqJLEg=;
        b=oRa0yNkUdf8GvRs7DImb2FrZUNrf4G7BpmG5SLtZ2WIW9rJcmE3ImPFbGSto8KRjuI
         gGZll7pdkH75YMyp6hIQW25PBDsRev8Kj5QuKtKrxc9i5xEYyzejdA59odYzlCeGCJZk
         Vl+bf7+D5z9mdNbSCaShzpJ+QvxAakE48DJsaIv7OvP7Ck4h2Kw9i2PSFQR74kBIFvU+
         CVcopRhrLycPKS3iSj9gsZCNIfQxLbxPZZdONo0QFaIs/xQgs1TPCcR3jK8wLrjgAwGZ
         xBCqQDryC0exvgCVcCZR3zBaX4zrf6kHfWaR5OxI3NtwBhQ32xmvOSAE2kHFucRdY0JW
         5cxw==
X-Forwarded-Encrypted: i=1; AL+hErFgGghKIBf9Qsjt11yG8mLNkGcWkcoXBEZbrSD3A9mESFymXos3ufp39aQlAKTqeDaIjujQoH8TOIhmxsiKv7Sk@lists.infradead.org
X-Gm-Message-State: APuU4Z+AVg5bBvDcSKBz21fsYXT0epUo6X5D2hYUwYNxy177CM8OJ3w3
	E9a0PyTG5x0Ggb2e66b2OmjdqyVbApIz3VXZc/gxsNWLDntl8vNRpfsJbkbcGp5nspw6Bl2cA9n
	qebDVSEIcASPHMNSrH2iuQ3Heug==
X-Received: from ilbeb1.prod.google.com ([2002:a05:6e02:4601:b0:54f:8d15:4dbc])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2383:b0:572:f8ec:5340 with SMTP id 5614622812f47-5797dd97e12mr1488800b6e.40.1795114360210;
 Thu, 19 Nov 2026 10:52:40 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:07 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-26-coltonlewis@google.com>
Subject: [PATCH v10 25/33] KVM: arm64: Detect overflows for the Partitioned PMU
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
X-CRM114-CacheID: sfid-20261119_105242_857231_92F9E600 
X-CRM114-Status: GOOD (  20.60  )
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

Evaluate whether any enabled and unmasked guest counter has overflowed
in kvm_pmu_part_overflow_status() so KVM updates the virtual PMU
interrupt level in the vGIC (or userspace IRQ state) across VM entries
and host PMU overflow interrupts:
- Harvest any live guest overflow bits from physical pmovsset_el0 into
  shadow PMOVSSET_EL0 and clear them in hardware when the partitioned
  PMU is loaded on the local CPU.
- Check (PMOVSSET_EL0 & PMINTENSET_EL1) against PMCR_EL0.E for guest
  counters 0..HPMN-1 and PMCCNTR_EL0, and against MDCR_EL2.HPME for
  nested hypervisor counters HPMN..N-1.
- In kvm_pmu_handle_guest_irq(), raise KVM_REQ_IRQ_PENDING and kick the
  vCPU (or queue overflow_work when running in NMI context) when an
  unmasked guest overflow occurs.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c | 65 +++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/pmu-emul.c   |  4 +--
 arch/arm64/kvm/pmu.c        |  8 +++++
 include/kvm/arm_pmu.h       |  2 ++
 4 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 21357decce214..b0491d32b5d7b 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -823,6 +823,71 @@ void kvm_pmu_handle_guest_irq(u64 pmovsr)
 		return;
 
 	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
+
+	if (kvm_pmu_part_overflow_status(vcpu)) {
+		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
+
+		if (!in_nmi())
+			kvm_vcpu_kick(vcpu);
+		else
+			irq_work_queue(&vcpu->arch.pmu.overflow_work);
+	}
+}
+
+/**
+ * kvm_pmu_part_overflow_status() - Determine if any guest counters have overflowed
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Determine if any guest counters have overflowed and therefore an
+ * IRQ needs to be injected into the guest. If an overflow is detected
+ * while access is VCPU_PMU_ACCESS_FREE (for example, after state
+ * restoration via KVM_SET_ONE_REG), transition the vCPU to
+ * VCPU_PMU_ACCESS_GUEST_OWNED.
+ *
+ * Return: True if there was an overflow, false otherwise
+ */
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
+{
+	u64 mask = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+	u64 hyp_mask = kvm_pmu_hyp_counter_mask(vcpu);
+	u64 pmovs, pmint, pmcr, reg;
+	unsigned long flags;
+	bool overflow;
+
+	local_irq_save(flags);
+	if (vcpu->arch.pmu.loaded_on_cpu &&
+	    vcpu == kvm_get_running_vcpu()) {
+		u64 hw_ovf = read_sysreg(pmovsset_el0) & mask;
+
+		if (hw_ovf) {
+			__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, hw_ovf);
+			write_sysreg(hw_ovf, pmovsclr_el0);
+		}
+		pmint = read_pmintenset();
+		pmcr = read_pmcr();
+	} else {
+		pmint = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
+		pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
+	}
+
+	pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+	local_irq_restore(flags);
+
+	reg = pmovs & pmint & mask;
+	if (!(pmcr & ARMV8_PMU_PMCR_E))
+		reg &= hyp_mask;
+	if (hyp_mask && !(__vcpu_sys_reg(vcpu, MDCR_EL2) & MDCR_EL2_HPME))
+		reg &= ~hyp_mask;
+
+	overflow = !!reg;
+
+	if (overflow && !in_interrupt() &&
+	    kvm_pmu_get_access(vcpu) == VCPU_PMU_ACCESS_FREE) {
+		scoped_guard(preempt)
+			kvm_pmu_set_guest_owned(vcpu);
+	}
+
+	return overflow;
 }
 
 /**
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index da66162c68042..a72bdc5a0b3ea 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -268,7 +268,7 @@ void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val)
  * counter where the values of the global enable control, PMOVSSET_EL0[n], and
  * PMINTENSET_EL1[n] are all 1.
  */
-bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu)
 {
 	u64 reg = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
 
@@ -400,7 +400,7 @@ static void kvm_pmu_perf_overflow(struct perf_event *perf_event,
 		kvm_pmu_counter_increment(vcpu, BIT(idx + 1),
 					  ARMV8_PMUV3_PERFCTR_CHAIN);
 
-	if (kvm_pmu_overflow_status(vcpu)) {
+	if (kvm_pmu_emul_overflow_status(vcpu)) {
 		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
 
 		if (!in_nmi())
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 7389d61957fa9..9d4ad4b7bd8d5 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -409,6 +409,14 @@ u64 kvm_pmu_evtyper_mask(struct kvm *kvm)
 	return mask;
 }
 
+bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
+{
+	if (kvm_pmu_is_partitioned(vcpu->kvm))
+		return kvm_pmu_part_overflow_status(vcpu);
+
+	return kvm_pmu_emul_overflow_status(vcpu);
+}
+
 static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 {
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 9800514019630..fcd8e6331943e 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -91,6 +91,8 @@ bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
-- 
2.56.1.708.g77570a6a1d-goog


