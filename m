Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA43560A3836
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OlP38czq;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Po4jOEZc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ue0EvOyL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=OlP38czqU5hgQI
	1nhYnl7+Ukk+8IAaKE8byD6LF5DJH8njJpc3OHOq4Tgd+AFLA9OEfA23eC8BAk3sWnV8+LhSA3QuS
	65Kb0VTOAiVx1mimjLNOqQ4Xv5+L82+1Ubz/3N8z7K+OZhVrReKT9fVNh3KEtVbuK1FxfpI2/a9jf
	MM+5CCAEzM5CN/EE1B7Z4hsghYpHRcN1GBz4wztgBgkZJ9nom+/zMBSdzsJvbdZ5mNcThOvqq0t9f
	gcS5OtuCTtTVH8/aX1xiexjgjkSI2/W+ka83rpnPCvzNhh4/Jy/5adTurpeIJSXL/2RsrjPoEIcyJ
	MObw6aE7tuuL/4t5KdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcRY-00000002Gvw-1RHY;
	Tue, 10 Nov 2026 03:22:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcRV-00000002GuB-2QJe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:22:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jBXh1323754
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=; b=Po4jOEZcBUQbQeze
	GcJKCdD8Vk2MttFayOzP/2XrF34DaUEekOMLcs376n97OS2CLeT+X7yJE5YO3uxs
	Et+Pnmd9rqms35GCdxAS2OGpVdTAXNvXeVfcx3zBAX20I9vVQYBePeqLSw8sTnwV
	G+kN3lIFclZyEmcNgLgIE334Tup6oMIdlIiXOselYyo4uz2xTpTutE62q3ujXtVD
	9MqscxJBerS3erquUxCWkjqgFGgWmp/u3HIdUi52L0rmIEAkPsOfz059TVGnGolG
	MGxXEVlZsbVK3wwkPSnQGayB9POB9L0JurjHBqEpxKhjA2A7ssGEMXbzRd8VqCmQ
	07/0AA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58bxda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:22:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso1270577a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280960; x=1794885760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=Ue0EvOyLMW2V6c5IDIBFvLeB7/+qWucz/q26jJEm7Ri4hTPaVAbdBqlJ2vK8/J4cQc
         XlTL1LPL24eBMOH9gKjNFcyzFy36g12aI9IrSTbou5XGBYskGu+9nRaLrv38qxehUKwv
         hYQP3e05R55JtJvsLgJ2Je4yXn/uSNZMIkQ+Rja05xjkF/K+0UCR5wAcY0GMTh3q9HDe
         O+GJyVCyAiXt6cbAqcbMkPHTpD7/M+1vV5S3c9xPx+2n7fF5yshx8AQzrg5lUP/7e0c/
         k4HtlFv+BjygUdBdBMhXrj9swm+HVwDfvHZSlf6Bc2HllDB8PjzVJjLxUCYU5fALiJ8E
         ytww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280960; x=1794885760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K62i/P8PbkS4nusY5tpqbkn28J4X/MrUcVukoPMJY+I=;
        b=BlVQUFQ+onCk9oQlu3SXKcbt08c7y5C4p7kyaolVhIJiQWG5en+2/AJlLDzx1g7NC/
         cN6MRc0gtBESwbsjgRDBwBEGZI8h/fHVkaBQmwJAnK3J1FdjI/p1heY+2PwbNQmpv+h0
         TVzCRz3pCFVtuSa7Ch60zHtpmtiL/yjKPprFe8sGGK5FUG7K4SYZk0MIP5lKNAKStvv0
         BKE84nufxA70r1iZt4y+reVJpnTIEJ5J/nRztVBykLqb1ta/nnbCZDkUmO8edR5GPSop
         /FvWlr8vuHJV6XdTQApFPTDvY3vbR7t2KVRBOxqUTl/r53KgDzHWtUUEjmRihY5zAIM/
         6EMQ==
X-Forwarded-Encrypted: i=1; AL+hErEMxiRq0cyPpmN59KiLoto0j1gJkmjr+mXbS7831wdm/lulE95W3HuFbL8ur8oBnQ1vD2hAxSEpcjctbpAUz5Nz@lists.infradead.org
X-Gm-Message-State: APuU4Z++CnyOcp3ujh1JDxKWWMuTAXZq7hGa/dMIODGDrX9QBj6HIClo
	FoF7S+wNu5JvGJBfsvLI4p57JI+6qphlLjaeZkLv1U6GgbjkdvgULBw5cSpeMjaukIXYR1g+lw7
	jvXtz/UYArwknG4Z4b7gkLRSjjaa125fYvfkLMUqIvcRPHZUTh5C/Dxf/bFhGDdJjfewLSrSFh4
	fdTQ==
X-Gm-Gg: AYBFou3EpXmsMlh7ek76IZyjE2TL9DG1u18ag0l19XlLqGqsUlbAfJ7FgRtNPMhy1Lt
	rUPFr/pmOGMw8imH7kH89kNlv3+549SlgtY7btVK9xqOnGta1QtONk2Kn3Up2uFn8SKi6fMlPG4
	k+2fb3usxTAijtEQAVrhPvvnYVg0AsK7jzKmRMTjdIGos7EbxoadqMGhfR4754lH/gDf13CTHrg
	OHzBvPcu4e3o79P21PuTYaau8XrF+69gmWix7lzr+DC0qXd9R1WlXZbk6cMGjodC0WfZeA0HLGc
	hBquFy+LDWLddFJK1OV+PdBMo5Wv27Usy1udy2JHMP8eLrdV9pqF5CLBERR6WphSn9uA1KY28AU
	C9SZyN2f08sUgPymDh4BpAdsyamz6tbalU024EvEKMIK1IbJeOLM863u8gteDV3xObkI/jLmY/+
	oCgB3k0FJv7di/grBg8nxvuZMiBwwUZkpFzdD7
X-Received: by 2002:a17:90b:3804:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b166cd72a9mr1611669a91.15.1794280960388;
        Mon, 09 Nov 2026 19:22:40 -0800 (PST)
X-Received: by 2002:a17:90b:3804:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b166cd72a9mr1611630a91.15.1794280959879;
        Mon, 09 Nov 2026 19:22:39 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:26 +0800
Subject: [PATCH v22 4/8] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-4-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=5197;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Zyx/d9oIgPkQ60/304aFUQUx4sMlZWIw6sxJoMobPBo=;
 b=kpRNVhutXQ7gohFYZQCqNm1H40Kl3zk4+d4GQd1BPz4yWZX15elY/hEqALIMQRcM7mvFBSwB5
 ua4YckmM+PHDsJBSzHNttGsPiM+rvMRt9Tnl1YxkYUJOqv93jx9Np7o
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX7ohfXQQ6/p4D
 cIYTN/zXCv+vh8SloCqeA4WaoJVFtvUSAekhaBcLkwv8yAXWIQLXn58T+yZKXx+wZBaywBIFh9n
 jZY8BkMHOXiM1+b4JCOnbu7f2ffDyzIxilMYkofAaW2b9zM+yJE9sFEtQ+i/iJJesFopfkyYPAD
 PMvrxiIvmxD+wzjepx/J0MQkbDdx1nKa1MQJLpLXQRzMWqs4GZ+a4G66kPd5PQt/tUW1Oo51Wt6
 ikHhTKDoFGnlUivqOR9uWiarxuVLNYmGgdnrpAbtXPXklAXIeF1Kn+1rAAxu5+4GXrgcTOtebZJ
 xZSX4XTq36AZoxFL0ZzS8BmxqNQ0NCdsERqFrVw/eQH3ikrlxKql5vpLyZMK7mUKX2qC1Qk1j7s
 6cBTbjMDOlsJFHsHoRE1NLITy89RQXbQc2kG1nbqhRgFRJqDlt/MCp+lgaEtEzv7UGoH38x/g9f
 wsG1gmkO2ZKE/QYw6JQ==
X-Proofpoint-ORIG-GUID: 9Xlp4BRKE2E3RXzN5y5Du8jVQoBOmsK2
X-Proofpoint-GUID: 9Xlp4BRKE2E3RXzN5y5Du8jVQoBOmsK2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX1S0og/EXGMcH
 N9KyxTmyMUpxRPFa0rxTwAmDqmFLnKM3YZJ/NNX1GZcTkTokEmhATEIeIbNjI6TwEho1wshO7X5
 jbCgh3YlyjzSSDc4Tut+M4CuGgBufHc=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af28e01 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_192241_640590_8A3D1CCF 
X-CRM114-Status: GOOD (  18.13  )
X-Spam-Score: -2.8 (--)
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

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc7dd676da47..4b40b692be4d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 30b15c38b080..36c80918958f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -263,6 +263,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -294,6 +295,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


