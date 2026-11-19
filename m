Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFCC606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0KBzuxZe;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IbMYzL7L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H3zUx8HoqKFHPeFVX0OdNx2iv8LR8ny79LxRfFBxaR4=; b=0KBzuxZeR2AG2Lsotijl/J2vS/
	AwLljon/NK3Ktf1eMyFDz3VdxKX8WX8ceGwftVLQ9LY8cuVslmX0nKheP+gjovhct8KlfhoimQHi4
	XBXykivYTf6SdLx5k5DLET4JiXHn183SKaYXSaSblegj1gRRXeqL2TCI7gXY1cNBRQAmH1Q6uLdjL
	UwAszmmIfONBptg9IJzYcxU4Tekj/Tr1tdh12HpCW9A/folxyHmGOU2CFeGaoN+QMHRApGu9UyGjN
	EpDDzuGhhPLlEVnOfk9EW77W9RGXvpTyIJ4HcrFyZZHxeakPT2QmvRbuHiDN+lbjarkaqPFuZWHGP
	JTTogn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gz-0000000D5kD-200g;
	Thu, 19 Nov 2026 18:54:17 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FZ-0000000D4RV-2Uos
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:56 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-4db3db8687fso212490b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114368; x=1795719168; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3zUx8HoqKFHPeFVX0OdNx2iv8LR8ny79LxRfFBxaR4=;
        b=IbMYzL7Le2ewrpszVcOzvDxfMeQWxExIhh87JFFnbzOGDUX+u8c1sF7OxQJLTEVB/W
         Bbx+eFkVeBTIszmTaH/XYDYdJkt+1n9bd3XmIxoPe763CxbiptgcBTL9ktUomS5882cL
         7iN/rk/FFtP89sJgJumQE74lsZkBXwuchjCk370uqX3zgD7aRV1PukgQqpta2hsUFzus
         KcU3BatfxBs/elVzLIqqYp9vSDzldMtXuqyXBK2JlZkJYLAiQdluS05tGpnLuhXSpH99
         OiyMoPJgXAota7srNziz4OLWSi9yDSO8ZfonmXpHMIPwfzfiTMeUzA1G2SSX+EyzQc0A
         nbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114368; x=1795719168;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3zUx8HoqKFHPeFVX0OdNx2iv8LR8ny79LxRfFBxaR4=;
        b=WlApGvONPO6svCmTvqRI7Um+e1Nk2Kzic3Vj8MwXKpa5wPeSiiJJMIu5bw+A1NChAj
         qTJ467YO7mzTZLkxjnNig6wY8bwSmLNmZUfCQ3NNKMtvZUTj68YraHjH0mUibpEoVDeB
         bv2MYmrlDolNwS/hkJnNJfybHPI7CEBY2B5v6Tw6FPiOMrbEHc0iohP3LU3zcfGU3d+7
         Ub15G1g7KHjW/08ar6v9tzA8hUd3ep4F11Ibvb2SqsaDPVun0b6aOEPrnlF84g0ucmd4
         PE7NNbLF9SVdIyz2zO/4xkj8RI/BU0Uxw65C/UyMGuk5/BaC78mOaa4e4ACzHMj5xi81
         0/6g==
X-Forwarded-Encrypted: i=1; AL+hErFS16JGN27nYbhNMNGvLSrTQY5sb4EjptWNSiSJVT3re5knRGnVpBCJFpAkS7Bjf7GYFDGmStSMZiLULmvdPOVF@lists.infradead.org
X-Gm-Message-State: APuU4Z9516OqnTb8MR0nuMhYW/aSqdupgk+YhKCcMxEbWG1HsctmNtDB
	Yo4lrTZ+BWsM1Kf2AxyoM4JrA3rrfAaYKEoGOw91wW+w4mENswaqN3k1DoV53bn0fchoh6iAOSe
	6MrPOXnlffPOkVXQZ5jOYWFaoDA==
X-Received: from ilbdx25-n2.prod.google.com ([2002:a05:6e02:4219:20b0:51a:af50:87cd])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1916:b0:4f4:6421:5efe with SMTP id 5614622812f47-57a0ba53122mr998840b6e.36.1795114367800;
 Thu, 19 Nov 2026 10:52:47 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:15 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-34-coltonlewis@google.com>
Subject: [PATCH v10 33/33] KVM: arm64: selftests: Add test case for
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
X-CRM114-CacheID: sfid-20261119_105249_691052_C8BAE7A9 
X-CRM114-Status: GOOD (  28.79  )
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

Extend arm64/vpmu_counter_access to run all PMU counter access,
PMCR.N validation, and overflow interrupt tests against both the
emulated vPMU and the Partitioned PMU.

Introduce enum pmu_impl (EMULATED vs. PARTITIONED) and thread it
through the test setup helpers to configure
KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION and
KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS when testing the Partitioned PMU.

Exercise PMCCFILTR_EL0 and live PMCCNTR_EL0 counting before validating
unimplemented counters so that Partitioned PMU vCPUs transition to
VCPU_PMU_ACCESS_GUEST_OWNED even when PMCR_EL0.N == 0. On hosts without
FEAT_HPMN0, allow n == 0 whenever max_counters >= 2 and verify that
counter 0 (hidden behind traps while physical MDCR_EL2.HPMN == 1) still
raises UNDEFINED on direct and indirect accesses and is RAZ/WI in the
bitmap and software-increment registers.

Skip out-of-bounds counter access exception tests for other counters
when the PMU is partitioned, as hardware does not guarantee an UNDEFINED
exception on accesses to counters >= MDCR_EL2.HPMN.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 .../selftests/kvm/arm64/vpmu_counter_access.c | 217 +++++++++++++++---
 1 file changed, 181 insertions(+), 36 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index 22223395969e0..9028d08806540 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -25,12 +25,28 @@
 /* The cycle counter bit position that's common among the PMU registers */
 #define ARMV8_PMU_CYCLE_IDX		31
 
+enum pmu_impl {
+	EMULATED,
+	PARTITIONED
+};
+
+const char *pmu_impl_str[] = {
+	"Emulated",
+	"Partitioned"
+};
+
 struct vpmu_vm {
 	struct kvm_vm *vm;
 	struct kvm_vcpu *vcpu;
 };
 
+struct guest_context {
+	bool pmu_partitioned;
+	bool has_hpmn0;
+};
+
 static struct vpmu_vm vpmu_vm;
+static struct guest_context guest_context;
 
 struct pmreg_sets {
 	u64 set_reg_id;
@@ -331,19 +347,78 @@ static void test_access_invalid_pmc_regs(struct pmc_accessor *acc, int pmc_idx)
 	/*
 	 * Reading/writing the event count/type registers should cause
 	 * an UNDEFINED exception.
+	 *
+	 * On a Partitioned PMU hardware does not guarantee UNDEFINED for
+	 * counters >= MDCR_EL2.HPMN. However, when PMCR_EL0.N == 0 on a host
+	 * without FEAT_HPMN0, KVM programs HPMN = 1 and hides counter 0 behind
+	 * traps, so accessing counter 0 must still raise UNDEFINED.
 	 */
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_cntr(pmc_idx));
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_cntr(pmc_idx, 0));
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_typer(pmc_idx));
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_typer(pmc_idx, 0));
+	if (!guest_context.pmu_partitioned ||
+	    (!guest_context.has_hpmn0 && pmc_idx == 0)) {
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_cntr(pmc_idx));
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_cntr(pmc_idx, 0));
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_typer(pmc_idx));
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_typer(pmc_idx, 0));
+	}
 	/*
-	 * The bit corresponding to the (unimplemented) counter in
-	 * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers should be RAZ.
+	 * Software increment on an unimplemented counter should be WI, and the
+	 * bit corresponding to the counter in {PMCNTEN,PMINTEN,PMOVS}{SET,CLR}
+	 * registers should be RAZ.
 	 */
+	write_sysreg(BIT(pmc_idx), pmswinc_el0);
+	isb();
 	test_bitmap_pmu_regs(pmc_idx, 1);
 	test_bitmap_pmu_regs(pmc_idx, 0);
 }
 
+static void test_cycle_counter(u64 expected_pmcr_n)
+{
+	u64 filtr = ARMV8_PMU_EXCLUDE_EL0;
+	u64 pmcr, val;
+	int i;
+
+	if (get_current_el() == 2)
+		filtr |= ARMV8_PMU_INCLUDE_EL2;
+
+	/*
+	 * Verify PMCCFILTR_EL0 read/write and live PMCCNTR_EL0 counting.
+	 * On Partitioned PMU this also transitions the vCPU to
+	 * VCPU_PMU_ACCESS_GUEST_OWNED even when expected_pmcr_n == 0 so
+	 * subsequent unimplemented counter checks exercise hardware traps.
+	 */
+	write_sysreg(filtr, pmccfiltr_el0);
+	isb();
+	val = read_sysreg(pmccfiltr_el0);
+	__GUEST_ASSERT(val == filtr,
+		       "Unexpected PMCCFILTR_EL0: 0x%lx (expected 0x%lx)",
+		       val, filtr);
+
+	pmcr = read_sysreg(pmcr_el0) & ~ARMV8_PMU_PMCR_E;
+	write_sysreg(pmcr, pmcr_el0);
+	write_sysreg(0, pmccntr_el0);
+	write_sysreg(BIT(ARMV8_PMU_CYCLE_IDX), pmcntenset_el0);
+	isb();
+
+	write_sysreg(pmcr | ARMV8_PMU_PMCR_E, pmcr_el0);
+	isb();
+
+	__GUEST_ASSERT(get_pmcr_n(read_sysreg(pmcr_el0)) == expected_pmcr_n,
+		       "Expected PMCR.N: 0x%lx, PMCR.N: 0x%lx",
+		       expected_pmcr_n, get_pmcr_n(read_sysreg(pmcr_el0)));
+
+	for (i = 0; i < 10000; i++)
+		asm volatile("nop");
+	isb();
+
+	val = read_sysreg(pmccntr_el0);
+	__GUEST_ASSERT(val > 0, "Cycle counter did not advance (0x%lx)", val);
+
+	write_sysreg(pmcr, pmcr_el0);
+	write_sysreg(BIT(ARMV8_PMU_CYCLE_IDX), pmcntenclr_el0);
+	write_sysreg(BIT(ARMV8_PMU_CYCLE_IDX), pmovsclr_el0);
+	isb();
+}
+
 /*
  * The guest is configured with PMUv3 with @expected_pmcr_n number of
  * event counters.
@@ -386,6 +461,8 @@ static void guest_code(u64 expected_pmcr_n)
 			test_access_pmc_regs(&pmc_accessors[i], pmc);
 	}
 
+	test_cycle_counter(expected_pmcr_n);
+
 	/*
 	 * Tests for reading/writing PMU registers for unimplemented counters.
 	 * Use each combination of PMEV{CNTR,TYPER}<n>_EL0 accessor functions.
@@ -399,7 +476,7 @@ static void guest_code(u64 expected_pmcr_n)
 }
 
 /* Create a VM that has one vCPU with PMUv3 configured. */
-static void create_vpmu_vm(void *guest_code)
+static void create_vpmu_vm(void *guest_code, enum pmu_impl impl)
 {
 	struct kvm_vcpu_init init;
 	u8 pmuver, ec;
@@ -409,6 +486,13 @@ static void create_vpmu_vm(void *guest_code)
 		.attr = KVM_ARM_VCPU_PMU_V3_IRQ,
 		.addr = (u64)&irq,
 	};
+	u32 partition = (impl == PARTITIONED);
+	struct kvm_device_attr part_attr = {
+		.group = KVM_ARM_VCPU_PMU_V3_CTRL,
+		.attr = KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION,
+		.addr = (uint64_t)&partition
+	};
+	int ret;
 
 	/* The test creates the vpmu_vm multiple times. Ensure a clean state */
 	memset(&vpmu_vm, 0, sizeof(vpmu_vm));
@@ -434,8 +518,19 @@ static void create_vpmu_vm(void *guest_code)
 	TEST_ASSERT(pmuver != ID_AA64DFR0_EL1_PMUVer_IMP_DEF &&
 		    pmuver >= ID_AA64DFR0_EL1_PMUVer_IMP,
 		    "Unexpected PMUVER (0x%x) on the vCPU with PMUv3", pmuver);
+	guest_context.has_hpmn0 = FIELD_GET(ID_AA64DFR0_EL1_HPMN0, dfr0) >=
+				  ID_AA64DFR0_EL1_HPMN0_IMP;
 
 	vcpu_ioctl(vpmu_vm.vcpu, KVM_SET_DEVICE_ATTR, &irq_attr);
+
+	ret = __vcpu_has_device_attr(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+				     KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION);
+	if (!ret) {
+		vcpu_ioctl(vpmu_vm.vcpu, KVM_SET_DEVICE_ATTR, &part_attr);
+		guest_context.pmu_partitioned = partition;
+		pr_debug("Set PMU partitioning: %d\n", partition);
+	}
+
 }
 
 static void destroy_vpmu_vm(void)
@@ -461,13 +556,15 @@ static void run_vcpu(struct kvm_vcpu *vcpu, u64 pmcr_n)
 	}
 }
 
-static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool expect_fail)
+static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters,
+						 enum pmu_impl impl,
+						 bool expect_fail)
 {
 	struct kvm_vcpu *vcpu;
 	unsigned int prev;
 	int ret;
 
-	create_vpmu_vm(guest_code);
+	create_vpmu_vm(guest_code, impl);
 	vcpu = vpmu_vm.vcpu;
 
 	prev = get_pmcr_n(vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0)));
@@ -475,21 +572,24 @@ static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool
 	ret = __vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
 				     KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS, &nr_counters);
 
-	if (expect_fail)
+	if (expect_fail) {
 		TEST_ASSERT(ret && errno == EINVAL,
-			    "Setting more PMU counters (%u) than available (%u) unexpectedly succeeded",
+			    "Setting invalid PMU counter count (%u, default %u) unexpectedly succeeded",
 			    nr_counters, prev);
-	else
-		TEST_ASSERT(!ret, KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
+		return;
+	}
+
+	TEST_ASSERT(!ret, KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
 
 	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL, KVM_ARM_VCPU_PMU_V3_INIT, NULL);
+	sync_global_to_guest(vpmu_vm.vm, guest_context);
 }
 
 /*
  * Create a guest with one vCPU, set the PMCR_EL0.N for the vCPU to @pmcr_n,
  * and run the test.
  */
-static void run_access_test(u64 pmcr_n)
+static void run_access_test(u64 pmcr_n, enum pmu_impl impl)
 {
 	u64 sp;
 	struct kvm_vcpu *vcpu;
@@ -497,7 +597,7 @@ static void run_access_test(u64 pmcr_n)
 
 	pr_debug("Test with pmcr_n %lu\n", pmcr_n);
 
-	test_create_vpmu_vm_with_nr_counters(pmcr_n, false);
+	test_create_vpmu_vm_with_nr_counters(pmcr_n, impl, false);
 	vcpu = vpmu_vm.vcpu;
 
 	/* Save the initial sp to restore them later to run the guest again */
@@ -531,14 +631,14 @@ static struct pmreg_sets validity_check_reg_sets[] = {
  * Create a VM, and check if KVM handles the userspace accesses of
  * the PMU register sets in @validity_check_reg_sets[] correctly.
  */
-static void run_pmregs_validity_test(u64 pmcr_n)
+static void run_pmregs_validity_test(u64 pmcr_n, enum pmu_impl impl)
 {
 	int i;
 	struct kvm_vcpu *vcpu;
 	u64 set_reg_id, clr_reg_id, reg_val;
 	u64 valid_counters_mask, max_counters_mask;
 
-	test_create_vpmu_vm_with_nr_counters(pmcr_n, false);
+	test_create_vpmu_vm_with_nr_counters(pmcr_n, impl, false);
 	vcpu = vpmu_vm.vcpu;
 
 	valid_counters_mask = get_counters_mask(pmcr_n);
@@ -585,14 +685,13 @@ static void run_pmregs_validity_test(u64 pmcr_n)
 
 /*
  * Create a guest with one vCPU, and attempt to set the PMCR_EL0.N for
- * the vCPU to @pmcr_n, which is larger than the host value.
- * The attempt should fail as @pmcr_n is too big to set for the vCPU.
+ * the vCPU to an invalid @pmcr_n value.
  */
-static void run_error_test(u64 pmcr_n)
+static void run_error_test(u64 pmcr_n, enum pmu_impl impl)
 {
-	pr_debug("Error test with pmcr_n %lu (larger than the host)\n", pmcr_n);
+	pr_debug("Error test with pmcr_n %lu\n", pmcr_n);
 
-	test_create_vpmu_vm_with_nr_counters(pmcr_n, true);
+	test_create_vpmu_vm_with_nr_counters(pmcr_n, impl, true);
 	destroy_vpmu_vm();
 }
 
@@ -600,21 +699,26 @@ static void run_error_test(u64 pmcr_n)
  * Return the default number of implemented PMU event counters excluding
  * the cycle counter (i.e. PMCR_EL0.N value) for the guest.
  */
-static u64 get_pmcr_n_limit(void)
+static u64 get_pmcr_n_limit(enum pmu_impl impl)
 {
-	u64 pmcr;
+	u64 pmcr, n;
 
-	create_vpmu_vm(guest_code);
+	create_vpmu_vm(guest_code, impl);
 	pmcr = vcpu_get_reg(vpmu_vm.vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0));
 	destroy_vpmu_vm();
-	return get_pmcr_n(pmcr);
+
+	n = get_pmcr_n(pmcr);
+	if (impl == PARTITIONED && n > 0)
+		return n - 1;
+
+	return n;
 }
 
 static bool kvm_supports_nr_counters_attr(void)
 {
 	bool supported;
 
-	create_vpmu_vm(NULL);
+	create_vpmu_vm(NULL, EMULATED);
 	supported = !__vcpu_has_device_attr(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
 					    KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS);
 	destroy_vpmu_vm();
@@ -622,22 +726,63 @@ static bool kvm_supports_nr_counters_attr(void)
 	return supported;
 }
 
-int main(void)
+static bool kvm_supports_partition_attr(void)
 {
-	u64 i, pmcr_n;
+	bool supported;
 
+	create_vpmu_vm(NULL, EMULATED);
+	supported = !__vcpu_has_device_attr(vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
+					    KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION);
+	destroy_vpmu_vm();
+
+	return supported;
+}
+
+static bool kvm_supports_hpmn0(void)
+{
+	u64 dfr0;
+
+	create_vpmu_vm(NULL, EMULATED);
+	dfr0 = vcpu_get_reg(vpmu_vm.vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64DFR0_EL1));
+	destroy_vpmu_vm();
+
+	return FIELD_GET(ID_AA64DFR0_EL1_HPMN0, dfr0) >= ID_AA64DFR0_EL1_HPMN0_IMP;
+}
+
+void test_pmu(enum pmu_impl impl)
+{
+	u64 i, min_n = 0, pmcr_n;
+
+	pr_info("Testing PMU: Implementation = %s\n", pmu_impl_str[impl]);
+
+	pmcr_n = get_pmcr_n_limit(impl);
+	pr_debug("PMCR_EL0.N: Limit = %lu\n", pmcr_n);
+
+	if (impl == PARTITIONED && !kvm_supports_hpmn0() &&
+	    get_pmcr_n_limit(EMULATED) < 2) {
+		run_error_test(0, impl);
+		min_n = 1;
+	}
+
+	for (i = min_n; i <= pmcr_n; i++) {
+		run_access_test(i, impl);
+		run_pmregs_validity_test(i, impl);
+	}
+
+	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)
+		run_error_test(i, impl);
+}
+
+int main(void)
+{
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
 	TEST_REQUIRE(kvm_supports_vgic_v3());
 	TEST_REQUIRE(kvm_supports_nr_counters_attr());
 
-	pmcr_n = get_pmcr_n_limit();
-	for (i = 0; i <= pmcr_n; i++) {
-		run_access_test(i);
-		run_pmregs_validity_test(i);
-	}
+	test_pmu(EMULATED);
 
-	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)
-		run_error_test(i);
+	if (kvm_supports_partition_attr() && get_pmcr_n_limit(EMULATED) > 0)
+		test_pmu(PARTITIONED);
 
 	return 0;
 }
-- 
2.56.1.708.g77570a6a1d-goog


