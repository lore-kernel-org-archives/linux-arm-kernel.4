Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDA5606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VhQQHkJU;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PwL5m2CH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QWMz69mts87JYVKK5FQwSifuUzdf9X24jzWOqZ6Lyr0=; b=VhQQHkJUeEDhmCif6kGs0gMbDe
	7AKasyODhICjOsRYbbaWYlfM0/6KnrbaPjKUoo0FggwEHTm4M65DUJdf4G5bixsNbsQaAynrZiC0E
	TPFzIfKHryOd0wqDHpI90TdtnNJ4yAiXG7zst6mJrp/ZVlP2rc071wKWbqbAzFvwzP7BBAgzfT3kx
	qtL/i+LuWJRAWbenTFgkxGX9Id/12N6eR/7GKSutUJTENrJO248OTNKMeDdsOvHcvXUX18Kjgwm8K
	ShlIjB5OE315Q161oQ3VIXbLyi/LbdQ2BBc3UGjsXphgyGUthXPCYMXU5zOA0Gu+9h4gVRHnlLOaM
	Y3ZM8/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQUy-0000000FPdF-1k6W;
	Fri, 20 Nov 2026 15:26:00 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30] helo=mx0a-00082601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQUl-0000000FPVp-2PNu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:25:50 +0000
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfpR03581822;
	Fri, 20 Nov 2026 07:25:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=QWMz69mts87JYVKK5FQwSifuUzdf9X24jzWOq
	Z6Lyr0=; b=PwL5m2CHohZ4TdVJdnzcB764cjYftAiAjJL2wfN092+o93unBV/E0
	A7y7yrm888sHhTWLfKu7mPXWqwQQIWZggKfIdNoBGFW3ozhBNgH41VAoLJGH0O2H
	9Pp+OR+HFBBh5J30JJH2KakNmZw8TaEblEtcSChFRkzPbu8Fs96ZVFR3tPWU7y8j
	rgJ4SiTuNf9Y5WlCy3QwOiA1yzgQPAB4GQAnVx0IVS+/XFFqao41QnQGell6H2hz
	nxlItdxesXYmUUXrt8SJgXx+KYuoCll8k/0hKSJ+8+wLNmeaeFp98gSFhczruAAI
	7pKVJniINcarFrfHfLFuC8Be3YzWgv9RQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by m0001303.ppops.net (PPS) with ESMTPS id 4j24q283ur-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Nov 2026 07:25:15 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1b::8e35) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 20 Nov
 2026 15:25:15 +0000
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
Subject: [PATCH v5 7/7] coresight: Add pmu_pulse/extout_pulse
Date: Fri, 20 Nov 2026 07:21:20 -0800
Message-ID: <c43cc5feecb253821499be80d43f1e71ccb32193.1795182850.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <cover.1795182850.git.aaupov@fb.com>
References: <cover.1795182850.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: RSyCozwHm6MZm79lqp4bjUv9Q9lRDyrE
X-Proofpoint-ORIG-GUID: RSyCozwHm6MZm79lqp4bjUv9Q9lRDyrE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2MSBTYWx0ZWRfX5V8RJ5JE1eYT
 47568FaDERmjxVtmYPd0NiczN34+BG/49UMJzOW1/25fU0or8ArhB16S1iRlwLMCEBhgg2YQpMf
 5W0E12zeROL1ZjsW5J02OtdBS7OE9Eje7fw0BV10M/SgEqamBBcLN3ekOoml58ldQe4OQEm50uT
 ugy1SL9X0FQZuI123P3hWs90FiJFzmPM+Md99MrKdPuTHqzejROrDIgxiLiCYmfiA2/sHLx0STU
 bLSdVAu4fQilMn5Kg5eLFFa9m/xDfYCo9ojinhr0CObJ1If7pA2lbgngflYmZ8xoFFg0NX/ZFOC
 2B5VtpNIRLBriJenbZ670bsHV2saMDWx7wDKZZ1UGw91EYWU+bkgcaC8b/SPsc2rXsu+EnatxQf
 psHZ6mvR9ltvnjLuDG4RXyo25MlKUGqV5IXiimFme0yZ92ueM7WOtJkOf4m98RoEKgOAC9z+/1T
 bnnqwxm7qw8JvFBuT1A==
X-Authority-Analysis: v=2.4 cv=Q+NHcI2a c=1 sm=1 tr=0 ts=6b00665b cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8
 a=FOH2dFAWAAAA:8 a=KoH9M_b8ny-f6M6y6wgA:9 a=cvBusfyB2V15izCimMoJ:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2MSBTYWx0ZWRfX8tmhhhDLK8XH
 T9WDziVof6LRBxjwBKu7lX64glhOPkmotIekWOmvkeKgsTu39sEWwJgB7aYil/JCgiRJMaJKrBN
 Urkcljr5yFPl2lZfSfFSOUbC8qawh70=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_072548_109892_F4D4140B 
X-CRM114-Status: GOOD (  20.75  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add ETMv4 configuration 'pmu_pulse' with 'extout_pulse' feature which
requires an ETE whose PMU counts its external outputs
(CS_CFG_MATCH_CAP_ETE_TRCEXTOUT): event 1 selects the always-true
resource and drives TRCEXTOUT1 PMU event which pulses on every cycle
while the trace unit is enabled.

Assisted-by: Devmate:Opus-5.5
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../trace/coresight/coresight-config.rst      |  5 ++
 .../trace/coresight/coresight-perf.rst        | 15 +++++
 drivers/hwtracing/coresight/Makefile          |  1 +
 .../coresight/coresight-cfg-pmu-pulse.c       | 55 +++++++++++++++++++
 .../coresight/coresight-cfg-preload.c         |  2 +
 .../coresight/coresight-cfg-preload.h         |  2 +
 6 files changed, 80 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c

diff --git a/Documentation/trace/coresight/coresight-config.rst b/Documentation/trace/coresight/coresight-config.rst
index 6d5ffa6f73471b..3eed728bf0de1e 100644
--- a/Documentation/trace/coresight/coresight-config.rst
+++ b/Documentation/trace/coresight/coresight-config.rst
@@ -129,6 +129,11 @@ The following steps take place in the operation of a configuration.
 
 5) At the end of the perf session, the configuration will be disabled.
 
+The built-in 'pmu_pulse' configuration pulses ETM external output 1 for a PMU
+event to count. It only pulses while the ETM is enabled, so combined with AUX
+pause and resume the PMU event can time each trace window (see
+coresight-perf.rst).
+
 
 Viewing Configurations and Features
 ===================================
diff --git a/Documentation/trace/coresight/coresight-perf.rst b/Documentation/trace/coresight/coresight-perf.rst
index 0a77741a431ef9..6770a455c6b592 100644
--- a/Documentation/trace/coresight/coresight-perf.rst
+++ b/Documentation/trace/coresight/coresight-perf.rst
@@ -109,6 +109,21 @@ Example for triggering AUX pause and resume with PMU event::
         -e cycles/aux-action=pause,period=10000000/ \
         -e cycles/aux-action=resume,period=1050000/ -- sleep 1
 
+ETM-timed pause events
+~~~~~~~~~~~~~~~~~~~~~~
+
+The built-in ``pmu_pulse`` configuration pulses ETM external output 1 on every
+cycle of allowed trace, and a PMU event counting that output pauses trace after
+``N`` pulses, here 1000 cycles::
+
+  perf record -a -e cs_etm/pmu_pulse,aux-action=start-paused/u \
+    -e cycles/aux-action=resume,period=10000000/u \
+    -e trcextout1/aux-action=pause,period=1000/u \
+    -- sleep 1
+
+Each window is about ``N`` traced cycles plus the pause interrupt latency.
+The configuration only loads on an ETE whose PMU counts its external outputs.
+
 Perf test - Verify kernel and userspace perf CoreSight work
 -----------------------------------------------------------
 
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a572..568e797ac5a17e 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_CORESIGHT) += coresight.o
 coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
 		coresight-sysfs.o coresight-syscfg.o coresight-config.o \
 		coresight-cfg-preload.o coresight-cfg-afdo.o coresight-cfg-pstop.o \
+		coresight-cfg-pmu-pulse.o \
 		coresight-syscfg-configfs.o coresight-trace-id.o
 obj-$(CONFIG_CORESIGHT_LINK_AND_SINK_TMC) += coresight-tmc.o
 coresight-tmc-y := coresight-tmc-core.o coresight-tmc-etf.o \
diff --git a/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c b/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
new file mode 100644
index 00000000000000..76e8e6b5da0e97
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Pulse ETM external output 1 on every traced cycle for a PMU event to count.
+ * Based on coresight-cfg-afdo.c
+ */
+
+#include "coresight-config.h"
+
+/* ETMv4 includes and features */
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+#include "coresight-etm4x-cfg.h"
+
+/*
+ * extout_pulse feature: event 1 selects the always-true resource, so ETM
+ * external output 1 pulses on every cycle while the trace unit is enabled. A
+ * PMU event counting that output (TRCEXTOUT1), for example with
+ * aux-action=pause, then fires after as many traced cycles as its sample
+ * period. Event 0 is avoided because it is the trace unit trigger, and the
+ * TRBE driver treats a detected trigger as fatal.
+ */
+static struct cscfg_regval_desc extout_pulse_regs[] = {
+	/* event 1: resource selector 1 (always true), drives external output 1 */
+	{
+		.type = CS_CFG_REG_TYPE_STD | CS_CFG_REG_TYPE_VAL_MASK,
+		.offset = TRCEVENTCTL0R,
+		.val32 = 0x0100,
+		.mask32 = 0xff00,
+	},
+	/* end of regs */
+};
+
+struct cscfg_feature_desc extout_pulse_etm4x = {
+	.name = "extout_pulse",
+	.description = "Pulse external output 1 on every traced cycle.\n",
+	.match_flags = CS_CFG_MATCH_CLASS_SRC_ETM4 | CS_CFG_MATCH_CAP_ETE_TRCEXTOUT,
+	.nr_regs = ARRAY_SIZE(extout_pulse_regs),
+	.regs_desc = extout_pulse_regs,
+};
+
+/* create a pmu_pulse configuration */
+
+static const char *pmu_pulse_ref_names[] = {
+	"extout_pulse",
+};
+
+struct cscfg_config_desc pmu_pulse_etm4x = {
+	.name = "pmu_pulse",
+	.description = "Pulse ETM external output 1 on every traced cycle for the PMU\n"
+	"to count as TRCEXTOUT1\n",
+	.nr_feat_refs = ARRAY_SIZE(pmu_pulse_ref_names),
+	.feat_ref_names = pmu_pulse_ref_names,
+};
+
+/* end of ETM4x configurations */
+#endif	/* IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X) */
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


