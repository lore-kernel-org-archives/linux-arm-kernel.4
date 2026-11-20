Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D77D606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FYQ5eTje;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=EeGeZHtZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c4cJuGRDPq2SRF+Xb4HVkJbkljyXZ7Jcu3TG0wY9/iI=; b=FYQ5eTjepPG2DDq0aNJO+lxXu3
	qEVeDtWmQXSy4OLlz2mmds4mY7Jyt3up0/wx3IdRj7V0x14mGa8qios+5GEfjpzdGjvcZrRPKs+9H
	hvDfIff5d6JCxQlyx+LlmL1yuvw2DLJDp+MyYDEBifhNA2L50BNjUrUR9EXE+Pd/NHrhZdkEIG2lt
	63PbDTWmedFX+L0+IujubiJ5dyfvTZslElbPCmBFPEY1pznKUW0PUDP4mni3OqnovYYm1T1e6JF49
	yr7SUJp6p588NyOI+lnbBBiMhxwYk24ophXZfIm+nwZ+EfwF6n91nFq2BfPSHSZ0iHHao8WSD7Y/I
	h9V/MGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUToU-0000000Fzjp-1FVQ;
	Fri, 20 Nov 2026 18:58:22 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUToE-0000000FzfE-0OjP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:58:19 +0000
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKHAfjg2337709;
	Fri, 20 Nov 2026 10:57:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=c4cJuGRDPq2SRF+Xb4HVkJbkljyXZ7Jcu3TG0
	wY9/iI=; b=EeGeZHtZ6aEAPC9hr0nkUvcnsYAlk9+a1sf0qToMp1AorIRoYVz9E
	W6/tCeWVSbpvUMjOr/hMgjEV3o8S+jex3JqceqtpuH5yJkh6TaAXCHxY6FcDWnne
	+9wvAHrDCBgPruwyNHx2gbNnSGuM6DqzEtoA1aTwa7AY/ABAg1zdNE1voSfaQJOU
	fAVaWC83Wu0e6o/JYRioEHS8+zWK9qPX2B89TWJNqrsycwI/mj8WynAAz3EDA4DS
	/NFjr1kUNsyDcTCdv5z2CWOVW1ebHmjzyzBzCF1ghei9vukFMVhnoz5Odt3jPX43
	vSK++qJlM265nI0s6DxPO+4r3Glb6xHeQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2tcjrwe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Nov 2026 10:57:43 -0800 (PST)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 20 Nov
 2026 18:57:42 +0000
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
Subject: [PATCH v6 2/4] coresight: etm4x: Skip features requiring unavailable events
Date: Fri, 20 Nov 2026 10:54:32 -0800
Message-ID: <af7838ccf521e6317dbc3ef706dd4b8c979740fa.1795196854.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <cover.1795196854.git.aaupov@fb.com>
References: <cover.1795196854.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Nck0hWUczks0x0kzFsGH5VrlgIVXcof-
X-Proofpoint-ORIG-GUID: Nck0hWUczks0x0kzFsGH5VrlgIVXcof-
X-Authority-Analysis: v=2.4 cv=JYcpPkKV c=1 sm=1 tr=0 ts=6b009827 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=U_y8lYiYyhHBU5rMqhb2:22 a=7CQSdrXTAAAA:8 a=FOH2dFAWAAAA:8
 a=FuLfpA1pA47yQFY1QDEA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NSBTYWx0ZWRfX4cI5gNdLllqk
 +yZFbSkZbTpF5c8tHXpmN3pvcqz3ZUyvtsSvKTTR6MbsNXeQgtPyxv1JTBuSTKJtiDRbrJns2wA
 EitbTzbJFa6kmDtv0OijN4VEyemqtIY7LTIbmc622gUuchW42e0vU+1y6jrCZgZC6U0ur2E0v0H
 hOv9Q/QwmBn6Dme2DHeQQyptCtRi3KjTWF+3flsCXVd8Zut4YlZ7alvsOGHWbaRMJBxqYDsieji
 MOQ+5qgnZtkOjFUoerwxqJcoCUFM9s80pWsLjS3TU+Q2fWSKUyh5g+tdcKT3jlU2k6wKrSfvpMO
 EFcuzxtGX3wlXwfsGR9NBdijiecNRUN3ct+5skT4NeO/xis0UXFrLzrvAHEjbArPCOKHgmPOosy
 JkAeb/IF03f0nNhJmZKzXjePMFuulia8G+1K63oXT7NMYQqOCIN06xHc51jvNROw1P+JVZvgWc/
 YNdSldmBDIpGRdxF0tQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NSBTYWx0ZWRfX0wEHBkSvwZiD
 +NcoM6ZOM38cB6trtXbWK67oQ+CDjYBEfzfThweUeFHz0rqjV/ZtPODgkNv3orXJkEAEN+RGBAC
 wYnLHf1g54nyAV3TH3RRFNxF/ftUCrU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_105807_801918_399EADDF 
X-CRM114-Status: GOOD (  21.44  )
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

Feature register mappings accept TRCEVENTCTL0R without checking which
event fields the trace unit implements. A feature that drives EVENT1 can
therefore load on a trace unit with only EVENT0 and silently produce no
pulses.

Validate the descriptors before checking their requested EVENT fields
against the decoded event count. Parameterized writes are checked against
every writable field because parameter values may change after loading.
Let the configuration manager treat -EOPNOTSUPP as a per-device skip and
release the unlinked feature instance, while malformed descriptions and
other errors still abort loading.

Suggested-by: Mike Leach <mike.leach@arm.com>
Assisted-by: Devmate:GPT-6.1-Sol
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../hwtracing/coresight/coresight-config.h    |  3 ++
 .../hwtracing/coresight/coresight-etm4x-cfg.c | 47 +++++++++++++++++--
 .../hwtracing/coresight/coresight-syscfg.c    |  7 +++
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
index ae6295e3081319..8f3c37b0421e24 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -245,6 +245,9 @@ struct cscfg_config_csdev {
  *
  * @load_feat:	Pass a feature descriptor into the device and create the
  *		loaded feature instance (struct cscfg_feature_csdev).
+ *		Return -EOPNOTSUPP if the device lacks required resources; the
+ *		manager skips that device. Other errors abort loading. An
+ *		unsupported feature must leave device state unchanged.
  */
 struct cscfg_csdev_feat_ops {
 	int (*load_feat)(struct coresight_device *csdev,
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
index 52cb036bb04b96..278329075f380d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
@@ -127,6 +127,28 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
 	return err;
 }
 
+static int etm4_cfg_check_eventctl0_support(const struct cscfg_regval_desc *reg_desc,
+					    unsigned int nr_event)
+{
+	u32 requested;
+
+	if (reg_desc->offset != TRCEVENTCTL0R)
+		return 0;
+
+	/* Parameters can change after loading, so check all writable fields. */
+	if (reg_desc->type & CS_CFG_REG_TYPE_VAL_PARAM)
+		requested = reg_desc->type & CS_CFG_REG_TYPE_VAL_MASK ?
+			    reg_desc->mask32 : U32_MAX;
+	else
+		requested = reg_desc->type & CS_CFG_REG_TYPE_VAL_MASK ?
+			    reg_desc->val32 & reg_desc->mask32 : reg_desc->val32;
+
+	/* Four events use the full register: do not shift a u32 by 32. */
+	if (nr_event < 4 && (requested >> (8 * nr_event)))
+		return -EOPNOTSUPP;
+	return 0;
+}
+
 /**
  * etm4_cfg_load_feature - load a feature into a device instance.
  *
@@ -149,6 +171,7 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
 	struct device *dev = csdev->dev.parent;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev);
 	const struct cscfg_feature_desc *feat_desc = feat_csdev->feat_desc;
+	const struct cscfg_regval_desc *reg_desc;
 	u32 offset;
 	int i = 0, err = 0;
 
@@ -162,12 +185,28 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
 	 */
 	feat_csdev->drv_spinlock = NULL;
 
-	/* process the register descriptions */
-	for (i = 0; i < feat_csdev->nr_regs && !err; i++) {
-		offset = feat_desc->regs_desc[i].offset;
+	/* Validate every description before deciding whether to skip a device. */
+	for (i = 0; i < feat_csdev->nr_regs; i++) {
+		reg_desc = &feat_desc->regs_desc[i];
+		offset = reg_desc->offset;
+		if ((reg_desc->type & CS_CFG_REG_TYPE_VAL_PARAM) &&
+		    reg_desc->param_idx >= (u32)feat_csdev->nr_params)
+			return -EINVAL;
+		if (offset == TRCEVENTCTL0R &&
+		    (reg_desc->type & CS_CFG_REG_TYPE_VAL_64BIT))
+			return -EINVAL;
 		err = etm4_cfg_map_reg_offset(drvdata, &feat_csdev->regs_csdev[i], offset);
+		if (err)
+			return err;
 	}
-	return err;
+
+	for (i = 0; i < feat_csdev->nr_regs; i++) {
+		err = etm4_cfg_check_eventctl0_support(&feat_desc->regs_desc[i],
+						       drvdata->caps.nr_event);
+		if (err)
+			return err;
+	}
+	return 0;
 }
 
 /* match information when loading configurations */
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49c8..11946e5718fc5e 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -176,6 +176,7 @@ static int cscfg_load_feat_csdev(struct coresight_device *csdev,
 				 struct cscfg_feature_desc *feat_desc,
 				 struct cscfg_csdev_feat_ops *ops)
 {
+	struct device *dev = csdev->dev.parent;
 	struct cscfg_feature_csdev *feat_csdev;
 	unsigned long flags;
 	int err;
@@ -189,6 +190,12 @@ static int cscfg_load_feat_csdev(struct coresight_device *csdev,
 
 	/* load the feature into the device */
 	err = ops->load_feat(csdev, feat_csdev);
+	if (err == -EOPNOTSUPP) {
+		devm_kfree(dev, feat_csdev->regs_csdev);
+		devm_kfree(dev, feat_csdev->params_csdev);
+		devm_kfree(dev, feat_csdev);
+		return 0;
+	}
 	if (err)
 		return err;
 
-- 
2.52.1


