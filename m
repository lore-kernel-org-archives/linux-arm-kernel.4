Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14F4606AA94
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C1UvlTrP;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FYQCNrLy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SaW1KGsH36nTnT+j010zVHsDHg18D3SnYS8dyPmcydo=; b=C1UvlTrP/Q6UV6KdIce718VI5G
	fk1P/4dqsGqq0EeVJ/ipTg6t54cGxOGfE3tctj9ypaJtRv+NQF2PVjO9vFP8z+4F7lDOs8Q5aLgDL
	rwJNf9VhJDK+8TLmkxfI4cHSsI13UxNgQpVN1keTNfR4nRARFd12D+kVxV+q9eXYSr7H/4H9fg7sf
	qCkaPMaVTxijWsub968Cp6QXAjpjy4oRWW4Ay2SJ5EyQkQrq6+bGltSmSc0uefH0vCT1f8xQxfdUA
	8BnPbxvVREhZkLbERjWNMSEHS1IZPAGq6M2MpQTZoYk0gLJch0l2ksDFyVxnKtQd8f9rc4llzvDG0
	3h8nVKzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FM-0000000D40v-00jT;
	Thu, 19 Nov 2026 18:52:36 +0000
Received: from mail-ot1-x348.google.com ([2607:f8b0:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FA-0000000D3pV-3D4j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:26 +0000
Received: by mail-ot1-x348.google.com with SMTP id 46e09a7af769-86313f7f4faso128951a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114343; x=1795719143; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SaW1KGsH36nTnT+j010zVHsDHg18D3SnYS8dyPmcydo=;
        b=FYQCNrLy39RmACZZA4LwO28ePpsowN0XrARU68ag+CgJhceSPNfFS/vM5tq3sk2z/Q
         M2fNC7k9MTn7khZJ3Bvnh9PlwLiSfTble9556puCAtUvANq/NaVxtHXkUUfMmsQA7eYI
         hnd5juvVmbS1mX6FUbtLxix4jw0OqDCPWOeY5np1YTspvnavXxfUVwrNwYTx94MdAVqN
         BxDO0MYVbgtEf1t3ZGxap8zokO9C0ZFBQzE7KCRakN3U0ew5B2C+vQ2KEtJRrFwiRoWN
         KelbEd0nuP6m6/LZlksb/+/uqZw0mO/1f08YyOryqTTBn/uiFMcc4ZlRsmySGMpMVvPi
         illA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114343; x=1795719143;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaW1KGsH36nTnT+j010zVHsDHg18D3SnYS8dyPmcydo=;
        b=xuFLVlgQBnFFCgiUMZ0Y3zokZBnGBBO/Zm+Cob+mJvuUJO3KaX2eyU0hW7LdGNvb3K
         X19b8APCQmMCJAWLfw+SuOFCf+0sk2Qtl73dWd1uYtFNi1Y+iGoJKPk2pkZ7fst3hAWz
         fTae79v/ze91WIlu3X9DCq0UzRfSq9gQ2fCuPY1yofzwhH1phfTykbQ9CSVoZnNDG/cE
         1QMvMBKKtnddJOk1FOGTfdMkI3ruf+oBqAe4LPixkOz5cbf0bJe1W0E/YdNVX2V5hyyr
         /Im74QmnFPck/OJSVSsSxFfa9rFEwWZHDt43mCKf8ra6QqJnYpBTfMwNmNUMlo9wiA6J
         s5kQ==
X-Forwarded-Encrypted: i=1; AL+hErGqoQ8QtuklXa5JcPandEzwup0olRnuO1T9ulLMC9IoyuctFfMn3MZDwJ2cylXOQc6KEaMiW7AyQzUI8b2LcVEc@lists.infradead.org
X-Gm-Message-State: APuU4Z8BriZ1rj25ROWp+PNg59ej4oW2HeowvxTuJVMqb16hOTMo+Z5b
	cuDSI+qzJXrtj0b8h+sd9ZwK9xLRo/23bxXEQyaiTpQSHHROThkBTV05PSpj3BNzaKLr+Qt9zSx
	MJdwsVFkrMuja7PULUx7j/BiUng==
X-Received: from iobp24-n1.prod.google.com ([2002:a05:6602:8698:10b0:9c7:6b53:4f8e])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3088:b0:567:c44d:c1fa with SMTP id 5614622812f47-57a0a60d7f3mr1028055b6e.16.1795114342513;
 Thu, 19 Nov 2026 10:52:22 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:49 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-8-coltonlewis@google.com>
Subject: [PATCH v10 07/33] perf: arm_pmuv3: Move counter allocation mask to
 per-CPU struct pmu_hw_events
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
X-CRM114-CacheID: sfid-20261119_105224_830918_B308308F 
X-CRM114-Status: GOOD (  19.84  )
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

In preparation for dynamic per-CPU PMU counter reservations when running
KVM guests with a partitioned PMU, move the counter allocation mask from
the global struct arm_pmu to per-CPU struct pmu_hw_events.

Initialize cpuc->cntr_mask from the static cpu_pmu->cntr_mask during PMU
probe and CPU hotplug startup, and update event counter allocation
helpers (armv8pmu_get_single_idx(), armv8pmu_get_chain_idx(), and
armv8pmu_get_event_idx()) to query the per-CPU mask.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmu.c       |  9 +++++++--
 drivers/perf/arm_pmuv3.c     | 28 +++++++++++++++++-----------
 include/linux/perf/arm_pmu.h |  1 +
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 1150695653892..b1851d1c594b1 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -408,9 +408,11 @@ validate_group(struct perf_event *event)
 
 	/*
 	 * Initialise the fake PMU. We only need to populate the
-	 * used_mask for the purposes of validation.
+	 * used_mask and cntr_mask for the purposes of validation.
 	 */
 	memset(&fake_pmu.used_mask, 0, sizeof(fake_pmu.used_mask));
+	bitmap_copy(fake_pmu.cntr_mask, to_arm_pmu(event->pmu)->cntr_mask,
+		    ARMPMU_MAX_HWEVENTS);
 
 	if (!validate_event(event->pmu, &fake_pmu, leader))
 		return -EINVAL;
@@ -717,6 +719,7 @@ bool arm_pmu_irq_is_nmi(void)
 static int arm_perf_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	struct arm_pmu *pmu = hlist_entry_safe(node, struct arm_pmu, node);
+	struct pmu_hw_events *cpuc = per_cpu_ptr(pmu->hw_events, cpu);
 	int irq;
 
 	if (!cpumask_test_cpu(cpu, &pmu->supported_cpus))
@@ -724,6 +727,8 @@ static int arm_perf_starting_cpu(unsigned int cpu, struct hlist_node *node)
 	if (pmu->reset)
 		pmu->reset(pmu);
 
+	bitmap_copy(cpuc->cntr_mask, pmu->cntr_mask, ARMPMU_MAX_HWEVENTS);
+
 	irq = armpmu_get_cpu_irq(pmu, cpu);
 	if (irq)
 		per_cpu(cpu_irq_ops, cpu)->enable_pmuirq(irq);
@@ -753,7 +758,7 @@ static void cpu_pm_pmu_setup(struct arm_pmu *armpmu, unsigned long cmd)
 	struct perf_event *event;
 	int idx;
 
-	for_each_set_bit(idx, armpmu->cntr_mask, ARMPMU_MAX_HWEVENTS) {
+	for_each_set_bit(idx, hw_events->cntr_mask, ARMPMU_MAX_HWEVENTS) {
 		event = hw_events->events[idx];
 		if (!event)
 			continue;
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 4a6c1f3bcea1f..973d4abcb3a6e 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -813,7 +813,7 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
 		write_pmuacr(mask);
 	} else {
 		/* Clear any unused counters to avoid leaking their contents */
-		for_each_andnot_bit(i, cpu_pmu->cntr_mask, cpuc->used_mask,
+		for_each_andnot_bit(i, cpuc->cntr_mask, cpuc->used_mask,
 				    ARMPMU_MAX_HWEVENTS) {
 			if (i == ARMV8_PMU_CYCLE_IDX)
 				write_pmccntr(0);
@@ -917,7 +917,7 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	 * to prevent skews in group events.
 	 */
 	armv8pmu_stop(cpu_pmu);
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS) {
+	for_each_set_bit(idx, cpuc->cntr_mask, ARMPMU_MAX_HWEVENTS) {
 		struct perf_event *event = cpuc->events[idx];
 		struct hw_perf_event *hwc;
 
@@ -953,20 +953,18 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	return IRQ_HANDLED;
 }
 
-static int armv8pmu_get_single_idx(struct pmu_hw_events *cpuc,
-				    struct arm_pmu *cpu_pmu)
+static int armv8pmu_get_single_idx(struct pmu_hw_events *cpuc)
 {
 	int idx;
 
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
+	for_each_set_bit(idx, cpuc->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
 	return -EAGAIN;
 }
 
-static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
-				   struct arm_pmu *cpu_pmu)
+static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc)
 {
 	int idx;
 
@@ -974,7 +972,7 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
 	 * Chaining requires two consecutive event counters, where
 	 * the lower idx must be even.
 	 */
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
+	for_each_set_bit(idx, cpuc->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
 		if (!(idx & 0x1))
 			continue;
 		if (!test_and_set_bit(idx, cpuc->used_mask)) {
@@ -1042,7 +1040,7 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 */
 	if ((evtype == ARMV8_PMUV3_PERFCTR_INST_RETIRED) &&
 	    !armv8pmu_event_get_threshold(&event->attr) &&
-	    test_bit(ARMV8_PMU_INSTR_IDX, cpu_pmu->cntr_mask) &&
+	    test_bit(ARMV8_PMU_INSTR_IDX, cpuc->cntr_mask) &&
 	    !armv8pmu_event_want_user_access(event)) {
 		if (!test_and_set_bit(ARMV8_PMU_INSTR_IDX, cpuc->used_mask))
 			return ARMV8_PMU_INSTR_IDX;
@@ -1052,9 +1050,9 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * Otherwise use events counters
 	 */
 	if (armv8pmu_event_is_chained(event))
-		return	armv8pmu_get_chain_idx(cpuc, cpu_pmu);
+		return armv8pmu_get_chain_idx(cpuc);
 	else
-		return armv8pmu_get_single_idx(cpuc, cpu_pmu);
+		return armv8pmu_get_single_idx(cpuc);
 }
 
 static void armv8pmu_clear_event_idx(struct pmu_hw_events *cpuc,
@@ -1426,6 +1424,7 @@ static int armv8pmu_probe_pmu(struct arm_pmu *cpu_pmu)
 		.present = false,
 	};
 	int ret;
+	int cpu;
 
 	ret = smp_call_function_any(&cpu_pmu->supported_cpus,
 				    __armv8pmu_probe_pmu,
@@ -1441,6 +1440,13 @@ static int armv8pmu_probe_pmu(struct arm_pmu *cpu_pmu)
 		if (ret)
 			return ret;
 	}
+
+	for_each_possible_cpu(cpu) {
+		struct pmu_hw_events *cpuc = per_cpu_ptr(cpu_pmu->hw_events, cpu);
+
+		bitmap_copy(cpuc->cntr_mask, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS);
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 02d2c7f45b527..be1e345e99a77 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -62,6 +62,7 @@ struct pmu_hw_events {
 	 * an event. A 0 means that the counter can be used.
 	 */
 	DECLARE_BITMAP(used_mask, ARMPMU_MAX_HWEVENTS);
+	DECLARE_BITMAP(cntr_mask, ARMPMU_MAX_HWEVENTS);
 
 	/*
 	 * When using percpu IRQs, we need a percpu dev_id. Place it here as we
-- 
2.56.1.708.g77570a6a1d-goog


