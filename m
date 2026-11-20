Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD97C60A381D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ui8IhxBi;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=MpfFw6wY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7urXpFfU2IgMJVqACiFh+XUVfMcKuDh3LCaphELlx4E=; b=ui8IhxBiUu/2C8KbdjDH9rh+sT
	x0etivQT1DoSrKF3EuT++ZIZXUNTxJFrGnQdeAFmRPryXwgA+YhD3oAuUahjEXEU2OpP47Sgmzf0u
	qZL0toxQfhDg+UcAvVG7n63r+ZsFulsfW07a+vIg5E+Ea0/TgtcdJP9/Avm06NxITjq1dVMwmFoge
	j7EJJGuKC40CkxD5tdr+86EE+1mINyM6q5B+pJvpPgTRINJypxuOQeEI37IuIg8PdFqxynp6I/cEq
	8fC+EDDtXu2h2+hNeK7lOtBIkF9v6uY9RCoglet+bLtsv+qknCTFgmL1fAuzs3vfJmxYhmdbCFODD
	wj1/FaIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTqn-0000000G0Pf-1ADZ;
	Fri, 20 Nov 2026 19:00:47 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUToL-0000000Fzhf-3T3Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:58:30 +0000
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKH3gbu2027930;
	Fri, 20 Nov 2026 10:57:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=7urXpFfU2IgMJVqACiFh+XUVfMcKuDh3LCaph
	ELlx4E=; b=MpfFw6wYZVXEXh2sSJg0nd0VAQRkumHS89FdxsbpiYZsF/jiOTFpt
	OWWEtxrVgm8JRJgfyVNQareKZcmYE/8vZO7CUkc1vklr/cHo6DXlUpvcJvrFV6H6
	dULyC7AKyj8nvbXGOXY0g2wEj63/1o3/X/DGeStHcPk9htSm71lAyLLp7l0KIGwL
	BRCIhNEuF8Ou8u5O7DMLZoWkeKuYPjll4vlFOw9smvbJDKkPGcU6A4bknFy+fnb5
	0ts8DJEhJJvEKFBqTBnJxQ5F8+hWoBhcT12/OuvxEcQUm5VOimSMJOMvM3E9DbtQ
	uO0sqn6mztIrg5vA9DuGr74NnTdmmXBDw==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2t99ryjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Nov 2026 10:57:47 -0800 (PST)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 20 Nov
 2026 18:57:46 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel
 Pereira <danielmaraboo@gmail.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 4/4] coresight: Add pmu_pulse/extout_pulse
Date: Fri, 20 Nov 2026 10:54:34 -0800
Message-ID: <d15e5919ff7c24a6454befcc6ccd2e1928530528.1795196854.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <cover.1795196854.git.aaupov@fb.com>
References: <cover.1795196854.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LvQHWXdc c=1 sm=1 tr=0 ts=6b00982b cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=xtH7KyWI9dI7BmFOsl-x:22 a=FOH2dFAWAAAA:8 a=XkYytwi-X3XLURp8qSEA:9
X-Proofpoint-ORIG-GUID: Kp1ClS3zrzKSo6Rlj1geddZqrt_hf1bt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NSBTYWx0ZWRfXyM0wbJg2/Fyc
 9cUNFUOZbuKs+sKlfdQZm9iF9LvxXFNRPpmSqsi/wvi4Arq3a8Dygy7EuCikKLLBwdiQwdai990
 OJjRHr24YwVsarzhaqOgE0sEsBgZly9T4qU6bcXpOeNcJh7WjOdpCxMVkvhkLaFCRWB7tiNh1oW
 +MaWgRhVLmRlhTgVUr4YeeOuOdJYUbpIaHIiLbZIIQe0LSryr/h6yqKzDj9g2JQIfwiuK+qOAGi
 speGwm1ilYkcHitRvVpmGZywn8uoN1quDQ6ncRCppb4zZXXS1DkcoTt7Bbj+TJqGmBJqarJAPRX
 avyY1MYYFbd49p8Pd+Eznh4UGn8OH5hmXLPz1wTfCZnEQ7BbAKCXhO7H0eHxpBjFiULghp0SgG6
 tfH8MXC04mB05rhseBPwcaGQNSV13wbxveLBAQTTGjn0F1K5Aq7z2Wp66sY1W4S5URwHymIVk+P
 /q5FjcoaojgimhrjG6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NSBTYWx0ZWRfXwSW5mEdTgAmm
 qu6wJIjvIyQxxP8n4BId39L0q+a1c0UauXxWsXG1cEByiCRVxrt9a2amI3GI5tMKpKVYPYeXFUJ
 n3HKnI/XlltY2X7hOd3tFGcWFnudXWk=
X-Proofpoint-GUID: Kp1ClS3zrzKSo6Rlj1geddZqrt_hf1bt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_105819_648689_13520590 
X-CRM114-Status: GOOD (  22.37  )
X-Spam-Score: -2.5 (--)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drive external output 1 from the always-true trace resource for an
external consumer to count. Change only EVENT1 so other event fields
remain intact, and avoid output 0 because it is the trace trigger and
can stop TRBE capture.

Producer resource validation loads the feature only on trace units
implementing EVENT1. PMU counting support and implementation-defined
output routing remain independent consumer responsibilities. Include
the preload declarations in the defining translation unit and document
setup-time source filtering and the separately selected trcextout1 event.

Assisted-by: Devmate:GPT-6.1-Sol
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../trace/coresight/coresight-config.rst      |  6 +++
 .../trace/coresight/coresight-perf.rst        | 15 +++++++
 drivers/hwtracing/coresight/Makefile          |  3 +-
 .../coresight/coresight-cfg-pmu-pulse.c       | 39 +++++++++++++++++++
 .../coresight/coresight-cfg-preload.c         |  2 +
 .../coresight/coresight-cfg-preload.h         |  2 +
 6 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c

diff --git a/Documentation/trace/coresight/coresight-config.rst b/Documentation/trace/coresight/coresight-config.rst
index 6d5ffa6f73471b..1c194fd5f55816 100644
--- a/Documentation/trace/coresight/coresight-config.rst
+++ b/Documentation/trace/coresight/coresight-config.rst
@@ -42,6 +42,12 @@ accesses in the driver - the resource usage and parameter descriptions
 translated into appropriate register accesses. This interpretation makes it easy
 and efficient for the feature to be programmed onto the device when required.
 
+The device driver checks requested event fields when loading a feature. For
+example, ``extout_pulse`` is loaded only where EVENT1 is implemented, based on
+the trace unit's decoded event count. A valid feature requiring unavailable
+resources is skipped for that device. This does not check whether a PMU can
+count the output.
+
 The feature will not be active on the device until the feature is enabled, and
 the device itself is enabled. When the device is enabled then enabled features
 will be programmed into the device hardware.
diff --git a/Documentation/trace/coresight/coresight-perf.rst b/Documentation/trace/coresight/coresight-perf.rst
index 0a77741a431ef9..dbae2acd3634a9 100644
--- a/Documentation/trace/coresight/coresight-perf.rst
+++ b/Documentation/trace/coresight/coresight-perf.rst
@@ -109,6 +109,21 @@ Example for triggering AUX pause and resume with PMU event::
         -e cycles/aux-action=pause,period=10000000/ \
         -e cycles/aux-action=resume,period=1050000/ -- sleep 1
 
+Using external-output pulses
+----------------------------
+
+The ``pmu_pulse`` configuration drives fixed external output 1. Separately
+select the matching PMU event, ``trcextout1``, to count it. The hardware must
+support and connect this output to that PMU; this is not checked automatically.
+
+Perf skips CPUs whose trace units do not support this configuration and fails
+setup if none remain. Use the PMU instance that counts output 1 on your system::
+
+  perf record -a -e '{cs_etm/pmu_pulse,aux-action=start-paused/u,cycles/aux-action=resume,period=10000000/u,armv8_pmuv3_0/trcextout1,aux-action=pause,period=5000/u}' -- sleep 1
+
+Tracing starts paused. The cycles event resumes it every 10000000 cycles;
+``trcextout1`` pauses it after 5000 counted pulses.
+
 Perf test - Verify kernel and userspace perf CoreSight work
 -----------------------------------------------------------
 
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a572..e2768c79d08616 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -28,7 +28,8 @@ obj-$(CONFIG_CORESIGHT) += coresight.o
 coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
 		coresight-sysfs.o coresight-syscfg.o coresight-config.o \
 		coresight-cfg-preload.o coresight-cfg-afdo.o coresight-cfg-pstop.o \
-		coresight-syscfg-configfs.o coresight-trace-id.o
+		coresight-syscfg-configfs.o coresight-trace-id.o \
+		coresight-cfg-pmu-pulse.o
 obj-$(CONFIG_CORESIGHT_LINK_AND_SINK_TMC) += coresight-tmc.o
 coresight-tmc-y := coresight-tmc-core.o coresight-tmc-etf.o \
 		      coresight-tmc-etr.o
diff --git a/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c b/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
new file mode 100644
index 00000000000000..139596d54d5883
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Pulse trace-unit external output 1 with the always-true resource. */
+
+#include "coresight-config.h"
+
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+#include "coresight-etm4x-cfg.h"
+#include "coresight-cfg-preload.h"
+
+/* Output 0 is the trace trigger and can stop TRBE capture. */
+static struct cscfg_regval_desc extout_pulse_regs[] = {
+	{
+		.type = CS_CFG_REG_TYPE_STD | CS_CFG_REG_TYPE_VAL_MASK,
+		.offset = TRCEVENTCTL0R,
+		.val32 = ETM4_RES_SEL_TRUE << 8,
+		.mask32 = GENMASK_U32(15, 8),
+	},
+};
+
+struct cscfg_feature_desc extout_pulse_etm4x = {
+	.name = "extout_pulse",
+	.description = "Pulse external output 1 with the always-true resource.\n",
+	.match_flags = CS_CFG_MATCH_CLASS_SRC_ETM4,
+	.nr_regs = ARRAY_SIZE(extout_pulse_regs),
+	.regs_desc = extout_pulse_regs,
+};
+
+static const char *pmu_pulse_ref_names[] = {
+	"extout_pulse",
+};
+
+struct cscfg_config_desc pmu_pulse_etm4x = {
+	.name = "pmu_pulse",
+	.description = "Pulse external output 1 for an external consumer.\n",
+	.nr_feat_refs = ARRAY_SIZE(pmu_pulse_ref_names),
+	.feat_ref_names = pmu_pulse_ref_names,
+};
+
+#endif
diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.c b/drivers/hwtracing/coresight/coresight-cfg-preload.c
index 4980e68483c5b9..a9a60a1c408455 100644
--- a/drivers/hwtracing/coresight/coresight-cfg-preload.c
+++ b/drivers/hwtracing/coresight/coresight-cfg-preload.c
@@ -14,6 +14,7 @@ static struct cscfg_feature_desc *preload_feats[] = {
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 	&strobe_etm4x,
 	&gen_etrig_etm4x,
+	&extout_pulse_etm4x,
 #endif
 	NULL
 };
@@ -22,6 +23,7 @@ static struct cscfg_config_desc *preload_cfgs[] = {
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 	&afdo_etm4x,
 	&pstop_etm4x,
+	&pmu_pulse_etm4x,
 #endif
 	NULL
 };
diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.h b/drivers/hwtracing/coresight/coresight-cfg-preload.h
index 291ba530a6a520..0058627f65ae5b 100644
--- a/drivers/hwtracing/coresight/coresight-cfg-preload.h
+++ b/drivers/hwtracing/coresight/coresight-cfg-preload.h
@@ -12,4 +12,6 @@ extern struct cscfg_feature_desc strobe_etm4x;
 extern struct cscfg_config_desc afdo_etm4x;
 extern struct cscfg_feature_desc gen_etrig_etm4x;
 extern struct cscfg_config_desc pstop_etm4x;
+extern struct cscfg_feature_desc extout_pulse_etm4x;
+extern struct cscfg_config_desc pmu_pulse_etm4x;
 #endif
-- 
2.52.1


