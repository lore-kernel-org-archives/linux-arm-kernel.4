Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E788C60A3812
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CxA/3OPk;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YT/bjRPw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NwKf0FG7r9/T3kREOAJFh9Rxc6KmqyiPUXfCnd/wOUs=; b=CxA/3OPkwTy/ig
	0YpPUQjQnEBxJVsRVWl60v025p6fozkd0Fl81NKjnpmQvKGEJ3veO3HG/6onFbCOgiJsld/sVInGl
	SqWUM19iW0XI2C92+IMfY3BJ8wEzyKWtZaTqcSfgSyZSNa5yqSdXp3UUFOkDyp2NQC6QPzaCkHcXQ
	li5Gx+dP3UN/2kQ9vP+I1WXugynSRJBZ1+Hl8eU4dy9J1WjeVTGb5RcurcRrJNfudgShUi4gS8eaw
	bhWnubNvSWDINeFiEDDG/tj9kQBqL6FUmaZO03smG6rFc/rlebFkKigoFfZiQGtaYpFNrkZjCIGwQ
	f7Wg2O3t9GqLLQ3IZPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOM9-0000000DLNn-0bti;
	Fri, 06 Nov 2026 18:08:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOM5-0000000DLLS-0dsY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:08:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BEC81682;
	Fri,  6 Nov 2026 10:07:57 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 588CD3F673;
	Fri,  6 Nov 2026 10:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793988480; bh=cp6Pv7IzX/SCbrjW2GiosTAcEEM0Ge+G3sZ6/m8WK8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YT/bjRPw0jVCJHZhtkqoMFnegra/O3RgPCID3a8ggxwxAM9kLEdhGPsVu37YfwdOZ
	 83X7tilYnE7QNSK93o1/qYrWfYtmuKeGFrtFwQ2s3okHHpLSaoxZMGVw1tvt2RKDqB
	 q/NqXKETLjtK1ldyV76Qa4f2jnBK3IVciXujm5YI=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: [PATCH v4 1/4] perf/arm_cspmu: Add Arm system PMU
Date: Fri,  6 Nov 2026 18:07:43 +0000
Message-ID: <2cf79599d522539440a53adb4221dfc5a4d7b9e6.1793986672.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1793986672.git.robin.murphy@arm.com>
References: <cover.1793986672.git.robin.murphy@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_100801_309539_78C38AFA 
X-CRM114-Status: GOOD (  17.65  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Arm's latest Compute Subsystems and SoCs are using a common PMU block
in various places which can mostly just be driven as a generic 64-bit
CoreSight PMU, but does have an IMP-DEF register for additional
filtering. The details of event and filter encodings depend on the
particular PMU instance, so are left to the higher level Arm Telemetry
Solution tooling.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_cspmu/Kconfig      |  7 +++
 drivers/perf/arm_cspmu/Makefile     |  1 +
 drivers/perf/arm_cspmu/arm_cspmu.c  |  7 +++
 drivers/perf/arm_cspmu/arm_cspmu.h  |  1 +
 drivers/perf/arm_cspmu/arm_syspmu.c | 67 +++++++++++++++++++++++++++++
 5 files changed, 83 insertions(+)
 create mode 100644 drivers/perf/arm_cspmu/arm_syspmu.c

diff --git a/drivers/perf/arm_cspmu/Kconfig b/drivers/perf/arm_cspmu/Kconfig
index 6f4e28fc84a2..25bd55f036a4 100644
--- a/drivers/perf/arm_cspmu/Kconfig
+++ b/drivers/perf/arm_cspmu/Kconfig
@@ -27,3 +27,10 @@ config AMPERE_CORESIGHT_PMU_ARCH_SYSTEM_PMU
 
 	  In the first phase, the driver enables support on MCU PMU used in
 	  AmpereOne SoC family.
+
+config ARM_SYSTEM_PMU
+	tristate "Arm System PMU"
+	depends on ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU
+	help
+	  Support additional event filtering attributes for the CoreSight-based
+	  PMU blocks found in various parts of Arm Compute Subsystems and SoCs.
diff --git a/drivers/perf/arm_cspmu/Makefile b/drivers/perf/arm_cspmu/Makefile
index 220a734efd54..90c3cd710157 100644
--- a/drivers/perf/arm_cspmu/Makefile
+++ b/drivers/perf/arm_cspmu/Makefile
@@ -8,3 +8,4 @@ arm_cspmu_module-y := arm_cspmu.o
 
 obj-$(CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU) += nvidia_cspmu.o
 obj-$(CONFIG_AMPERE_CORESIGHT_PMU_ARCH_SYSTEM_PMU) += ampere_cspmu.o
+obj-$(CONFIG_ARM_SYSTEM_PMU) += arm_syspmu.o
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 912f03ce3ef5..9f298ea1a974 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -358,6 +358,13 @@ static struct arm_cspmu_impl_match impl_match[] = {
 		.module		= NULL,
 		.impl_init_ops	= NULL,
 	},
+	{
+		.module_name	= "arm_syspmu",
+		.pmiidr_val	= ARM_CSPMU_IMPL_ID_ARM,
+		.pmiidr_mask	= PMIIDR_IMPLEMENTER,
+		.module		= NULL,
+		.impl_init_ops	= NULL,
+	},
 	{
 		.module_name	= "ampere_cspmu",
 		.pmiidr_val	= ARM_CSPMU_IMPL_ID_AMPERE,
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index 93d5b062de8b..86b62c236a4b 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -149,6 +149,7 @@
 
 /* JEDEC-assigned JEP106 identification code */
 #define ARM_CSPMU_IMPL_ID_NVIDIA	0x36B
+#define ARM_CSPMU_IMPL_ID_ARM		0x43B
 #define ARM_CSPMU_IMPL_ID_AMPERE	0xA16
 
 /* PMDEVARCH */
diff --git a/drivers/perf/arm_cspmu/arm_syspmu.c b/drivers/perf/arm_cspmu/arm_syspmu.c
new file mode 100644
index 000000000000..2f5ceda5c4d1
--- /dev/null
+++ b/drivers/perf/arm_cspmu/arm_syspmu.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/module.h>
+
+#include "arm_cspmu.h"
+
+#define PMEVFILT3R	0x200
+
+static struct attribute *arm_syspmu_format_attrs[] = {
+	ARM_CSPMU_FORMAT_EVENT_ATTR,
+	ARM_CSPMU_FORMAT_FILTER_ATTR,
+	ARM_CSPMU_FORMAT_FILTER2_ATTR,
+	ARM_CSPMU_FORMAT_ATTR(filter3, "config3:0-63"),
+	NULL,
+};
+
+static struct attribute **arm_syspmu_get_format_attrs(const struct arm_cspmu *cspmu)
+{
+	return devm_kmemdup(cspmu->dev, arm_syspmu_format_attrs,
+			    sizeof(arm_syspmu_format_attrs), GFP_KERNEL);
+}
+
+static void arm_syspmu_set_ev_filter(struct arm_cspmu *cspmu,
+				     const struct perf_event *event)
+{
+	u32 offset = 8 * event->hw.idx;
+
+	writeq(event->attr.config1, cspmu->base0 + PMEVFILTR + offset);
+	writeq(event->attr.config2, cspmu->base0 + PMEVFILT2R + offset);
+	writeq(event->attr.config3, cspmu->base0 + PMEVFILT3R + offset);
+}
+
+static int arm_syspmu_init_ops(struct arm_cspmu *cspmu)
+{
+	switch (FIELD_GET(PMIIDR_PRODUCTID, cspmu->impl.pmiidr)) {
+	case 0x9c3:
+		cspmu->impl.ops.set_ev_filter = arm_syspmu_set_ev_filter;
+		cspmu->impl.ops.get_format_attrs = arm_syspmu_get_format_attrs;
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct arm_cspmu_impl_match arm_syspmu_param = {
+	.pmiidr_val	= ARM_CSPMU_IMPL_ID_ARM,
+	.module		= THIS_MODULE,
+	.impl_init_ops	= arm_syspmu_init_ops
+};
+
+static int __init arm_syspmu_init(void)
+{
+	return arm_cspmu_impl_register(&arm_syspmu_param);
+}
+
+static void __exit arm_syspmu_exit(void)
+{
+	arm_cspmu_impl_unregister(&arm_syspmu_param);
+}
+
+module_init(arm_syspmu_init);
+module_exit(arm_syspmu_exit);
+
+MODULE_DESCRIPTION("Arm System PMU Driver");
+MODULE_LICENSE("GPL");
-- 
2.54.0.dirty


