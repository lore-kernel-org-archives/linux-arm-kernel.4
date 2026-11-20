Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF96606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ru105uhE;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=F/2d7ZUt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hDMUNYtZZSz36tLGhs2JB76kqUKcN4b9qdZyDnXlQfk=; b=Ru105uhEqWXaMlG3mdauqhSdFX
	2J9blYoJJuj53PKBRW7JzH96zf3upflTZS6m8Ph06mQZlB//4yR/Fw8sjltcnsNc2oBf+xSZxmWTX
	c2CcQx1lqoXnrLw7kYJ+0XQRu8P450r8VpAW8LGWELOvVNHMwj8PqZ8mmIpOke+362Gj9iAT4jz0U
	tpC6gUcWIZa5pS1gtRAczktqGWizB69d4N+fJ2p8MKb2H58jLP9iVS3OTxriE/TFjttcvQzA3/XrW
	bzISXPWbbfK2mNL0BKnvusq620dBIhgrdxj3SvhW2qI2SOEwCDqhgEZUnub2GZTrNMUsCf8Ohq4DB
	PmGGutZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQUw-0000000FPbl-0iid;
	Fri, 20 Nov 2026 15:25:58 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQUZ-0000000FPMG-1gkS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:25:37 +0000
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfIjD1986994;
	Fri, 20 Nov 2026 07:25:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=hDMUNYtZZSz36tLGhs2JB76kqUKcN4b9qdZyD
	nXlQfk=; b=F/2d7ZUtVUttYlQlruzhAQkoGVHtRdBEEK0LjT9YmwCDC6SyYv73U
	P6XPr1hPpprj3yu8W+JQUqOzRXYQkHXmuBZsN5dEgdN0fDbvDm8BFbmx+gDiipwl
	wo3aHvynFvqsGZSwJZvNDYiZ5m45wqV5TbyUPQ7iryin+OaF2FHH8FdL7hLCCgAm
	gSXHSq1H/884sCr3D/dd/me7S8I1RrVVbRFPEEWFlpMeq80Ub5Tq7JOeT0694L9E
	KrfVDXGSYLYdgJi7DXFTvvCzvQU87BSPYB31LhJLLyEnPWeN74ZErQhtLWsyVQTi
	o/T0UqWPKvZ/xgWMK7VOut/T2h5yvX6IQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j20a5a9fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Nov 2026 07:25:14 -0800 (PST)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 20 Nov
 2026 15:25:13 +0000
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
Subject: [PATCH v5 6/7] coresight: etm4x: Report whether the PMU counts the external outputs
Date: Fri, 20 Nov 2026 07:21:19 -0800
Message-ID: <d9c953867b9ff40c20c8ddd52771bada2fa8a4b9.1795182850.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <cover.1795182850.git.aaupov@fb.com>
References: <cover.1795182850.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2MSBTYWx0ZWRfX82kDwl832sLs
 0Oo137UTYhaEPEpfAbDK1XwqePeLl114wt5yPLfZLpfhGxWHoZ92kbnhFBplMaVyHkssNns5xd5
 3Q73iZmoqBmuBWiUfXRe8o+yYOepoFNwtW8sBe54YJcozNpArxT38grNuKg9LZLAeMW4dnNGRqh
 /VX+LNEReEJQlqHBAgTxh2PiGrUjf/4eYrDApz85VNmNOjzvuGIG25gKODBI6otqzLYdfU98QzD
 I8rfJp4CpwixuHaEy9ZzNnG0xjMpe+gy3TPR8oRy1bIrwnflGTw4bzp806Ys/HvZ5g7v/QfqY4O
 wZW5hkizosqkv0bizU7O/mv2VCriEPiDzSaR5nO5FAn94OkDhXmjogxMjEUta6PReWlXUs/+e64
 QmLJzNzImZn+GOv9ZbiwST686inqNbFrVlRcOujHBjqFDRzGoYITYcGq9l9r5LR7wLPzSWynaDa
 8kCwegBbKSk+0bvQGQQ==
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6b00665a cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=FOH2dFAWAAAA:8
 a=6X7xUW0UlnGFPlmw15gA:9 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: -wmNZRbrr96V6wnLupaB94uVEZDjyILf
X-Proofpoint-GUID: -wmNZRbrr96V6wnLupaB94uVEZDjyILf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2MSBTYWx0ZWRfX2SFcvobG/VT3
 GfiwSJ6JTvEeq02ZUCwJejVggBC6d++xczgPnmLn3Ze5bggKWmgoQ7fz/NnQog6jNXnb9S3NQAE
 MMPypoNLhfL87FB02YIX5dT6mSvNfPI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_072535_687589_7D2A2CF9 
X-CRM114-Status: GOOD (  21.10  )
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

Some CPUs count the trace unit's external outputs as the PMU common
events TRCEXTOUT0-3 (0x4010-0x4013), which lets a configuration drive a
PMU event from trace unit events. Other CPUs, Neoverse N1 for example,
have no such events, and a feature relying on them would silently do
nothing there.

Detect at probe, on the trace unit's CPU, whether the PMU counts every
external output: the trace unit has an external output for each of its
events (caps.nr_event), and pmuv3_event_implemented() reports whether
the PMU implements TRCEXTOUTn. Only check ETE: per its specification, an
implemented TRCEXTOUTn event counts external output n, while whether that
output is also an external input is IMPLEMENTATION DEFINED.

Add a CS_CFG_MATCH_CAP_ETE_TRCEXTOUT capability match flag, set it on
those trace units when registering them with the configuration manager,
and show it in the feature's configfs 'matches' attribute. With
capabilities matched separately from the device class, a feature that
requires it only loads on those trace units.

Assisted-by: Devmate:Opus-5.5
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../hwtracing/coresight/coresight-config.h    |  2 ++
 .../hwtracing/coresight/coresight-etm4x-cfg.c |  7 +++--
 .../hwtracing/coresight/coresight-etm4x-cfg.h |  2 +-
 .../coresight/coresight-etm4x-core.c          | 29 ++++++++++++++++++-
 .../coresight/coresight-syscfg-configfs.c     |  3 ++
 5 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
index 220bc54f8e5e1b..e18143fca90f85 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -38,6 +38,8 @@
  * a device that matches one of its classes and has all of its capabilities.
  */
 #define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
+/* an ETE whose PMU counts its external outputs as TRCEXTOUTn */
+#define CS_CFG_MATCH_CAP_ETE_TRCEXTOUT	BIT(8)
 
 /*
  * Limit number of presets in a configuration
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
index 52cb036bb04b96..fea003e49c262a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
@@ -174,11 +174,14 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
 #define CS_CFG_ETM4_MATCH_FLAGS	(CS_CFG_MATCH_CLASS_SRC_ALL | \
 				 CS_CFG_MATCH_CLASS_SRC_ETM4)
 
-int etm4_cscfg_register(struct coresight_device *csdev)
+int etm4_cscfg_register(struct coresight_device *csdev, bool ete_trcextout)
 {
 	struct cscfg_csdev_feat_ops ops;
+	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
 
 	ops.load_feat = &etm4_cfg_load_feature;
+	if (ete_trcextout)
+		match_flags |= CS_CFG_MATCH_CAP_ETE_TRCEXTOUT;
 
-	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
+	return cscfg_register_csdev(csdev, match_flags, &ops);
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.h b/drivers/hwtracing/coresight/coresight-etm4x-cfg.h
index 32dab34c1dace0..d87bcc83e12491 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.h
@@ -25,6 +25,6 @@
 #define ETM4_CFG_RES_MASK	0x00F
 
 /* ETMv4 specific config functions */
-int etm4_cscfg_register(struct coresight_device *csdev);
+int etm4_cscfg_register(struct coresight_device *csdev, bool ete_trcextout);
 
 #endif /* CORESIGHT_ETM4X_CFG_H */
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index af017bd8a54773..ecf2a6c945cf05 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -30,6 +30,7 @@
 #include <linux/uaccess.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
+#include <linux/perf/arm_pmuv3.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -78,6 +79,7 @@ static enum cpuhp_state hp_online;
 struct etm4_init_arg {
 	struct device		*dev;
 	struct csdev_access	*csa;
+	bool			ete_trcextout;
 };
 
 static DEFINE_PER_CPU(struct etm4_init_arg *, delayed_probe);
@@ -1399,6 +1401,29 @@ static void etm4_fixup_wrong_ccitmin(struct etmv4_caps *caps)
 	}
 }
 
+/*
+ * Whether the PMU counts each external output of this trace unit as
+ * TRCEXTOUTn. The trace unit has an external output for each of its events.
+ * Only ETE is checked: per its specification, an implemented TRCEXTOUTn event
+ * counts external output n.
+ *
+ * Must run on the CPU that owns the trace unit.
+ */
+static bool etm4_pmu_counts_extout(struct etmv4_drvdata *drvdata)
+{
+	int n;
+
+	if (!etm4x_is_ete(drvdata) || !drvdata->caps.nr_event)
+		return false;
+
+	for (n = 0; n < drvdata->caps.nr_event; n++) {
+		if (!pmuv3_event_implemented(ARMV8_PMUV3_PERFCTR_TRCEXTOUT0 + n))
+			return false;
+	}
+
+	return true;
+}
+
 static void etm4_init_arch_data(void *info)
 {
 	u32 etmidr0;
@@ -1562,6 +1587,8 @@ static void etm4_init_arch_data(void *info)
 	/* NUMCNTR, bits[30:28] number of counters available for tracing */
 	caps->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
 
+	init_arg->ete_trcextout = etm4_pmu_counts_extout(drvdata);
+
 	coresight_clear_self_claim_tag_unlocked(csa);
 	etm4_cs_lock(drvdata, csa);
 	cpu_detect_trace_filtering(drvdata);
@@ -2265,7 +2292,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 	}
 
 	/* register with config infrastructure & load any current features */
-	ret = etm4_cscfg_register(drvdata->csdev);
+	ret = etm4_cscfg_register(drvdata->csdev, init_arg->ete_trcextout);
 	if (ret) {
 		coresight_unregister(drvdata->csdev);
 		return ret;
diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
index 2b40e556be872f..6577a5085a634d 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
@@ -250,6 +250,9 @@ static ssize_t cscfg_feat_matches_show(struct config_item *item, char *page)
 	if (match_flags & CS_CFG_MATCH_CLASS_SRC_ETM4)
 		used += scnprintf(page + used, PAGE_SIZE - used, "SRC_ETMV4 ");
 
+	if (match_flags & CS_CFG_MATCH_CAP_ETE_TRCEXTOUT)
+		used += scnprintf(page + used, PAGE_SIZE - used, "ETE_TRCEXTOUT ");
+
 	used += scnprintf(page + used, PAGE_SIZE - used, "\n");
 	return used;
 }
-- 
2.52.1


