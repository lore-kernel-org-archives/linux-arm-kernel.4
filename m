Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DC4606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ljprplrZ;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=TmWNmQ3M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BPNxmrkplXzbpgFWfOfRdiC3totnmzknYXs9H5qx0Jw=; b=ljprplrZfCPrMfQY/miYo4fVLP
	qAVzi4roW9Ye8oioqnuzv42i6+5rAdbZoGVpuPk785B3ZeGrE6xeBo2oLfrdqRgIK9K6bfVM4C+He
	0/BHNkXjDjYQiAvgaVzdbuXLyicvTRd0hXRQskF9e+u+YmE4Ktyyz6LEcOpoyh8tFC70h10X8A0CP
	nptprHmQ8yjSyezQXiPiaxiymJGwplEzXYqG/VxHlUXQaYwuhDeeznWKIpOQojedVoFP3uqi4v1uK
	HYD+fCc6Z3ZJol7pZP5Yblhoz7GG7klLmHqB841EcOsKp/DS8Vh6VGS3PHLKbw/DO6m6I4e1Uj1JC
	l0yXGB7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUToe-0000000FzpD-3gNq;
	Fri, 20 Nov 2026 18:58:32 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUToI-0000000Fzgu-1jtR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:58:21 +0000
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKH7kJi2299190;
	Fri, 20 Nov 2026 10:57:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=BPNxmrkplXzbpgFWfOfRdiC3totnmzknYXs9H
	5qx0Jw=; b=TmWNmQ3MX9UI5j7Q1deEaQlh+7H4mmD92BriR8emCKZREYkzYxbd/
	agJkxuevMDvsv5V7qYglW+fLi7jxsq/L/s7r4VC+aSQKiTEhu2P458Xvfj0t9PzV
	MHSpnw4YVHlWlBNeRLb9oBcoT/fsk+FJrEu6GkjqTDFXDcgOckVUw1uigoeFovQI
	X/p0rCRfRZI1tu0weJB7MicAw2DYjzPQmxG3Og0XPJdTLYj659UdcmKVkKtWVgbe
	FlbMBq7L7h8SPMvh0uVVsXLW9CLPWpvDbXPEiq6ASb674EROhcVa6+E5Hmf3NzGj
	tlJM1GTChhyHAGfXqeSp436YCm4MWZ0QQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2tb70x1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Nov 2026 10:57:45 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 20 Nov
 2026 18:57:44 +0000
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
Subject: [PATCH v6 3/4] coresight: perf: Filter sources lacking the selected configuration
Date: Fri, 20 Nov 2026 10:54:33 -0800
Message-ID: <7ba910406fc81e09d31e9c6f3909012b9b85bf22.1795196854.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <cover.1795196854.git.aaupov@fb.com>
References: <cover.1795196854.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NSBTYWx0ZWRfX7Kh7hLDMwBQn
 Rq57nI/AjxEWtLZ0jLURljKr7inIq4maZuYlFiDgG5P0CTTYmg3XBORFuU+NSf8bFN/8SfAP5iR
 wzvg1gl/NXovX+94DoKeH7oX9lA9v00=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NSBTYWx0ZWRfX9ZfWRukf9359
 CTaFh6Ck7io4LWFTCo4AgGJq8rm9Hcrhj/5Q87o/uw9BxWvMGkS+t1X/tVkcpO52kVTPdLJCetc
 /4NdQb9C8306Y8M5k6WBMVA0lp9tIap5CMsz8eMpoNcjU+B8E219K9w25SZb4WZPTZodnexj/Ak
 sXbh1IJVleV1tWoSNPy6DSZi8USFNnl6L0LXhXtAPgvG0LOdH446d+3Sy4v93xwZ/rOsY9GfDiz
 9I2GMATA7IWX4bLzsngPf2vA+SFeokYSGZvDG1HBNduXKYaAD3FPpg1uL0/HdJCVvZFXGYfC/3O
 HtNzwFp1ty9KFM7sRYw2NaGfnthNoGmnhCAAmKMWB3ABYR5EwAsl2Lq+O7VSeWhI0mninsMoZA7
 OHFHjqkzgUs/TAlTxdzU7yO44nVcUalSRNjL8keAvCNFjWJ9K4aaN/BOouGTHzlNVzg7ENsiUgX
 mSis25v8EqC6N4B9tIQ==
X-Proofpoint-ORIG-GUID: K36d5MkWNj1hTJn4kHBfjgaPjgYVRe9t
X-Authority-Analysis: v=2.4 cv=A/v5rKWG c=1 sm=1 tr=0 ts=6b009829 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=7CQSdrXTAAAA:8 a=FOH2dFAWAAAA:8
 a=oS2Au8Yglpw7hEfJNBoA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: K36d5MkWNj1hTJn4kHBfjgaPjgYVRe9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_105811_185091_F3845A07 
X-CRM114-Status: GOOD (  15.68  )
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

A system configuration may deliberately omit some CoreSight devices.
Keep generic configuration enablement as a successful no-op for
nonparticipants, but exclude ETM sources without the selected
configuration before allocating an AUX session.

Add a setup-only query while the configuration is globally activated,
checking device registration and per-device availability under the
manager mutex. Use the existing path-building failure handling to remove
unsupported CPUs and fail setup if no usable source remains.

Suggested-by: Mike Leach <mike.leach@arm.com>
Assisted-by: Devmate:GPT-6.1-Sol
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../hwtracing/coresight/coresight-etm-perf.c  |  4 +++
 .../hwtracing/coresight/coresight-syscfg.c    | 32 +++++++++++++++++++
 .../hwtracing/coresight/coresight-syscfg.h    |  2 ++
 3 files changed, 38 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a8764..2d64c3314c0bad 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -350,6 +350,7 @@ etm_event_build_path(struct perf_event *event, int cpu,
 {
 	struct coresight_path *path = NULL;
 	struct coresight_device *source, *sink;
+	u32 cfg_hash = ATTR_CFG_GET_FLD(&event->attr, configid);
 	int ret;
 
 	source = coresight_get_percpu_source_ref(cpu);
@@ -361,6 +362,9 @@ etm_event_build_path(struct perf_event *event, int cpu,
 	if (!source)
 		return NULL;
 
+	if (cfg_hash && !cscfg_csdev_can_activate_config(source, cfg_hash))
+		goto out;
+
 	/*
 	 * If AUX pause feature is enabled but the ETM driver does not
 	 * support the operations, skip for this source.
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 11946e5718fc5e..f4e122f66e98c8 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1050,6 +1050,38 @@ void cscfg_deactivate_config(unsigned long cfg_hash)
 }
 EXPORT_SYMBOL_GPL(cscfg_deactivate_config);
 
+/**
+ * cscfg_csdev_can_activate_config - Check whether a configuration is loaded on a device.
+ * @csdev: CoreSight device to check.
+ * @cfg_hash: Selector for the configuration.
+ *
+ * Does not activate or program the configuration. May sleep. The caller must
+ * keep the configuration activated while using the result to prevent unloading.
+ */
+bool cscfg_csdev_can_activate_config(struct coresight_device *csdev,
+				     unsigned long cfg_hash)
+{
+	struct cscfg_registered_csdev *csdev_item;
+	struct cscfg_config_csdev *config_csdev;
+
+	guard(mutex)(&cscfg_mutex);
+	if (!cscfg_mgr)
+		return false;
+
+	/* Unregistered devices do not have initialized configuration lists. */
+	list_for_each_entry(csdev_item, &cscfg_mgr->csdev_desc_list, item) {
+		if (csdev_item->csdev != csdev)
+			continue;
+		list_for_each_entry(config_csdev, &csdev->config_csdev_list, node) {
+			if ((unsigned long)config_csdev->config_desc->event_ea->var == cfg_hash)
+				return config_csdev->config_desc->available;
+		}
+		break;
+	}
+	return false;
+}
+EXPORT_SYMBOL_GPL(cscfg_csdev_can_activate_config);
+
 /**
  * cscfg_csdev_enable_active_config - Enable matching active configuration for device.
  *
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.h b/drivers/hwtracing/coresight/coresight-syscfg.h
index 658e93c3705f1c..05289060a277e5 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.h
+++ b/drivers/hwtracing/coresight/coresight-syscfg.h
@@ -120,6 +120,8 @@ int cscfg_register_csdev(struct coresight_device *csdev, u32 match_flags,
 void cscfg_unregister_csdev(struct coresight_device *csdev);
 int cscfg_activate_config(unsigned long cfg_hash);
 void cscfg_deactivate_config(unsigned long cfg_hash);
+bool cscfg_csdev_can_activate_config(struct coresight_device *csdev,
+				     unsigned long cfg_hash);
 void cscfg_csdev_reset_feats(struct coresight_device *csdev);
 int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 				     unsigned long cfg_hash, int preset);
-- 
2.52.1


