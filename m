Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5B0606AA81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dkYykmNb;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bolafXYN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6347H7gggToJzZ+Ilw3z4KeuVm8ZnAfGsrXn9eqrzm0=; b=dkYykmNbNJ2WaBi7oHPDJVer75
	14xPzdFlRYToEdUkewqXyGl2raG1puBqGIndZnorcd8mFYlRL/pRGer70Qn1/NAXzmYIEp0XOCyoE
	P4FUK8uL3JZpMOHizZycAJLLOU3ZgBTvjCzLLc09Cdky4wYF1F6V7m7VatjcdZAOLhIBS8eIL3Rqd
	R9iGwcCa2gnWp1q2xZe1rgmD0Tef0Tj+/4E2/OVKeSjJq9uXQI2zYyNQO68hrnuaYqrJ1rpjUZi2Q
	WEgqViL90+iJvScpsVV3LOMVH1HyO/dJivv4vxIgKCCM/n5oHDB7KkSk5zok54cnH6WZK8jrSrocv
	iVcEZZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FO-0000000D46I-2e3B;
	Thu, 19 Nov 2026 18:52:38 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FE-0000000D3sl-2X3a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:29 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-5727b04b81eso93869b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114347; x=1795719147; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6347H7gggToJzZ+Ilw3z4KeuVm8ZnAfGsrXn9eqrzm0=;
        b=bolafXYN2lSjq3KioMme5bJWbIxnrnU0/nkQtE14UoJxrHVrph+jXdU4AFIt69w9p9
         EXRrtZg1EG4zr4ku+Cu4FmdwLaEFpbVc1Y4lQktqD0QGaQVRz/rqlYC5k/NiMTC7kccK
         zepsVTIoy0rvIgRoAfCN67lemJDToPJIXwTSxbEuvVGLXpd42DGkFx6r1uX+lOzDr3sE
         PzkQ9Y0+BMtivJtwt7PGjUAavU95JLTbx1X/1n9KPwMyUBTHf0qdNheZxvu+EGae7l/n
         S2JH/bDYHdJ+v9qcATFiZPAeSA1JyGPRcf0qNjFn2am7xp5XzRo3yPkuz8FsUp3U5dp2
         gE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114347; x=1795719147;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6347H7gggToJzZ+Ilw3z4KeuVm8ZnAfGsrXn9eqrzm0=;
        b=vVzdDIkZ4ARwsB5KQm1zzi4lvA2LPjXgFufKxH3UKBhgf1IDY27dTx6Ld5OZSfg2CV
         zNo6hZO/ueESZPmxqWNLfTuvSqJ50UU/xek3ciEyhsScsZ7JMij9ABhNiPbWV8kK447t
         WdJbEZhzf7PGSUPVtcwsrnIQqcvt6l/NrPTPD1b5t6aFFzVV/effYQzYt9ZvdayFjThG
         xqPuSLOSBA4AeNBxTGiypa+cTHVKcKVe4WPTISA7Aa69OJ0QT/Spd4EdFGcuFQpeEpOH
         1PbJdl1x2M3cZl6MCCuUSIUbq5avjT5vaQYT0jojPVzvkfRHkVSNPUJ7kQHiLkyyPlro
         m2RA==
X-Forwarded-Encrypted: i=1; AL+hErGYvUF6Ue/gFbnsPfo5abYulPVfHxKbz3/UKk714JFOMmmFrAgDXUEB7WGMIzm/+9t4aybR8Fe2jJy10N+N5p1H@lists.infradead.org
X-Gm-Message-State: APuU4Z8ejP6Xf+dzyX84w/+byAdldewBTgmpXjxvQvbU15+6BZD7m8Si
	yFwBbE1f6VvvH/O4dQXbEwAX7sKI5Bu0X6tIYEWGpURiU8zzISrmHyk6c4dsEmBgWWJIv3717Ae
	5007RMhu3hMs6J5mh712VjSisfg==
X-Received: from ilbeb8.prod.google.com ([2002:a05:6e02:4608:b0:544:45eb:2ab])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:660e:b0:4f4:b5ba:a241 with SMTP id 5614622812f47-57a0b048d65mr920500b6e.39.1795114346425;
 Thu, 19 Nov 2026 10:52:26 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:53 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-12-coltonlewis@google.com>
Subject: [PATCH v10 11/33] KVM: arm64: Add initial scaffolding for Partitioned PMU
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
X-CRM114-CacheID: sfid-20261119_105228_660516_F2F6E9EA 
X-CRM114-Status: GOOD (  24.15  )
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

Add the foundational helpers for Partitioned PMU support in
arch/arm64/kvm/pmu-direct.c:
- has_kvm_pmu_partition_support() to check VHE and PMUv3 availability.
- kvm_pmu_partition_enable() and kvm_pmu_is_partitioned() to track per-VM
  partitioning state via KVM_ARCH_FLAG_PARTITION_PMU_ENABLED.
- kvm_pmu_guest_counter_mask() to compute the bitmask of guest-reserved
  (0..HPMN-1 and PMCCNTR_EL0) hardware counters.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h  |  4 ++
 arch/arm64/include/asm/kvm_host.h |  2 +
 arch/arm64/kvm/Makefile           |  2 +-
 arch/arm64/kvm/pmu-direct.c       | 94 +++++++++++++++++++++++++++++++
 include/kvm/arm_pmu.h             | 20 +++++++
 5 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/kvm/pmu-direct.c

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index ecfede0c03486..71cf03ab58cbb 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -227,6 +227,10 @@ static inline bool kvm_set_pmuserenr(u64 val)
 }
 
 static inline void kvm_vcpu_pmu_resync_el0(void) {}
+static inline u64 kvm_pmu_guest_counter_mask(void)
+{
+	return 0;
+}
 
 /* PMU Version in DFR Register */
 #define ARMV8_PMU_DFR_VER_NI        0
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 4683281fcc5d4..89683a690828e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -96,6 +96,8 @@ enum {
 	KVM_ARCH_FLAG_EXIT_SEA,
 	/* No further ID register changes possible */
 	KVM_ARCH_FLAG_ID_REGS_FINAL,
+	/* Partitioned PMU Enabled */
+	KVM_ARCH_FLAG_PARTITION_PMU_ENABLED,
 };
 
 struct vcpu_reset_state {
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 7aaeeb84e788e..79f1602299767 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -27,7 +27,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-v5.o vgic/vgic-v5-tables.o vgic/vgic-irs-v5.o \
 	 vgic-sys-reg-v5.o
 
-kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
+kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu-direct.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
 kvm-$(CONFIG_PTDUMP_STAGE2_DEBUGFS) += ptdump.o
 
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
new file mode 100644
index 0000000000000..b1c180ae79d9d
--- /dev/null
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Colton Lewis <coltonlewis@google.com>
+ */
+
+#include <linux/kvm_host.h>
+#include <linux/perf/arm_pmu.h>
+#include <linux/perf/arm_pmuv3.h>
+
+#include <asm/arm_pmuv3.h>
+#include <asm/kvm_emulate.h>
+#include <asm/virt.h>
+
+/**
+ * has_host_pmu_partition_support() - Determine if partitioning is possible
+ *
+ * Partitioning is only supported in VHE mode with PMUv3
+ *
+ * Return: True if partitioning is possible, false otherwise
+ */
+static bool has_host_pmu_partition_support(void)
+{
+	return has_vhe() &&
+		system_supports_pmuv3();
+}
+
+/**
+ * has_kvm_pmu_partition_support() - If we can enable/disable partition
+ *
+ * Return: true if allowed, false otherwise.
+ */
+bool has_kvm_pmu_partition_support(void)
+{
+	return has_host_pmu_partition_support() &&
+		kvm_supports_guest_pmuv3();
+}
+
+/**
+ * kvm_pmu_partition_enable() - Enable/disable partition flag
+ * @kvm: Pointer to kvm struct
+ * @enable: Whether to enable or disable
+ *
+ * If we want to enable the partition, the guest is free to grab
+ * hardware by accessing PMU registers. Otherwise, the host maintains
+ * control.
+ */
+void kvm_pmu_partition_enable(struct kvm *kvm, bool enable)
+{
+	if (enable)
+		set_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
+	else
+		clear_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
+}
+
+/**
+ * kvm_pmu_is_partitioned() - Determine if KVM has a partitioned PMU
+ * @kvm: Pointer to kvm struct
+ *
+ * Return: True if the KVM PMU is partitioned, false otherwise
+ */
+bool kvm_pmu_is_partitioned(struct kvm *kvm)
+{
+	return kvm && test_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
+}
+
+static u64 kvm_vcpu_pmu_guest_counter_mask(struct kvm_vcpu *vcpu)
+{
+	if (vcpu && kvm_pmu_is_partitioned(vcpu->kvm)) {
+		u64 mask = ARMV8_PMU_CNT_MASK_C;
+		unsigned int guest_counters = vcpu->kvm->arch.nr_pmu_counters;
+
+		if (guest_counters > 0)
+			mask |= GENMASK_ULL(guest_counters - 1, 0);
+
+		return mask;
+	}
+
+	return 0;
+}
+
+/**
+ * kvm_pmu_guest_counter_mask() - Compute bitmask of guest-reserved counters
+ *
+ * Compute the bitmask that selects the guest-reserved counters in the
+ * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the event counters
+ * in 0..HPMN-1 and the cycle counter (PMCCNTR_EL0).
+ *
+ * Return: Bitmask
+ */
+u64 kvm_pmu_guest_counter_mask(void)
+{
+	return kvm_vcpu_pmu_guest_counter_mask(kvm_get_running_vcpu());
+}
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 8d51cf40182d6..e06255e46a4d8 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -95,6 +95,10 @@ void kvm_vcpu_pmu_resync_el0(void);
 #define kvm_vcpu_has_pmuv3_strict(vcpu)				\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3_STRICT))
 
+bool has_kvm_pmu_partition_support(void);
+void kvm_pmu_partition_enable(struct kvm *kvm, bool enable);
+bool kvm_pmu_is_partitioned(struct kvm *kvm);
+u64 kvm_pmu_guest_counter_mask(void);
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
  * Must be called before every vcpu run after disabling interrupts, to ensure
@@ -129,6 +133,10 @@ static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
 {
 	return 0;
 }
+static inline bool kvm_pmu_is_partitioned(struct kvm *kvm)
+{
+	return false;
+}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
@@ -233,6 +241,18 @@ static inline bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu, unsigned int id
 
 static inline void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu) {}
 
+static inline u64 kvm_pmu_guest_counter_mask(void)
+{
+	return 0;
+}
+
+static inline bool has_kvm_pmu_partition_support(void)
+{
+	return false;
+}
+
+static inline void kvm_pmu_partition_enable(struct kvm *kvm, bool enable) {}
+
 #endif
 
 #endif
-- 
2.56.1.708.g77570a6a1d-goog


