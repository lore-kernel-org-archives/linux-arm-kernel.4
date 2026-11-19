Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78CE606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rp/pUcAD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mY5gtW+f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S0pBS0SqdAVHAnZfsUxZv+nLG9+suSfmjHczuL66frI=; b=rp/pUcADU2+Wyi
	H6DYO0odsP+YfvxRMWE3AQd008WOqCrMy3gAcJ/YvsEARhScdwZtFw+X8+45fca9O8iXLVnii81Pw
	1yboRuNGT0M6uk6n1QnEoDZgOocbwtraElYHcHO1LaRbG1iGx6fKh0mA87Yunznpjn7s1A68izSCt
	P7a1jGRiIOKwoplogSXGAK8YzcbRv5rRTfiyk6++xSfS21+lS09ES+Lbyk1LAx2rnYUahRC/peZ2K
	6OwTV8rI94vPNNOMvOLW/mMVCbcwDFXs79s/pMAOO2uYa+fyoabdHaXltmTTuWVTBFOxuxy0dxRtt
	xAP20/r8KgdNozdXWSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5I9-0000000CiHG-1wmN;
	Thu, 19 Nov 2026 16:47:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5I7-0000000CiEy-0WRn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:47:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF6Fvg3048024;
	Thu, 19 Nov 2026 16:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S0pBS0SqdAV
	HAnZfsUxZv+nLG9+suSfmjHczuL66frI=; b=mY5gtW+fVonGIXqlrLO0zQRsQbj
	3dOmqPRLkO+/ba9r/SPHZQfppSjBKiAiY78+7M3HoQpKT/OqWK0GynO7r1A4/u8+
	KrNt0Ry7j3Jt5NBWYckVBvBb42NOIzDEk2DsE1PXLx4l5VijdZq74DOkqk33nXHq
	BRFy6oPDVkB+3O4OaIpv2wVVAepRLTzGheSRGGuMd/SVlQqLbIPkImoM6PxWjvQd
	ln1YxNlbVvGKPL+uv6xCollu7r8XVR+tVnMLwSyYpUZlaamtupCiZUdmVzVgDcVy
	I/dgr2WS1m52/mZVmJ8CYQC4mxIFaCwJFfZsC8C2B3sn9ikVk11JJDfA7QA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcwf1x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 16:47:10 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGl7di3118418;
	Thu, 19 Nov 2026 16:47:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mohis-hyd.qualcomm.com [10.147.253.64])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AJGl7KM3118397
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 16:47:07 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4840500)
	id 06E436AB; Thu, 19 Nov 2026 22:17:06 +0530 (+0530)
From: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Subject: [PATCH 4/4] ASoC: qcom: q6apm-dai: allow the mDSP IOMMU path
Date: Thu, 19 Nov 2026 22:17:05 +0530
Message-Id: <20261119164705.1594066-5-mohit.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119164705.1594066-1-mohit.sharma@oss.qualcomm.com>
References: <20261119164705.1594066-1-mohit.sharma@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6aff280e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=2pjKgLFfhSI-GXVsdeUA:9
X-Proofpoint-ORIG-GUID: 5d5OSiqAc5WBOxXiI2XB2wzN-xfwXaib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NiBTYWx0ZWRfXxJ4dgXSYadyP
 YVmWxPufumT6rrwbzkzdqQ4qdi+QPk8kdBZi5umtejVM7s88u/ixzcCw7q0iRr+OFI+f6fyjDbh
 15mujC4oYqaX0xl2jz+4cRrIEg8dP44c6X0P2CIgFyMhk4RL+eAvDX66sSVWjZlIIWjKICtJx8c
 LhqReCpDUOp31nvSLWAuzAhxsEhg4ovVx4TSaVNaPvKssCMJS9nyc7nr/vRE/N686Wd+LJrvzw/
 +7FDIdooSeZgOjf6vFXBSLrIg4Glt9+2Z1w73t8MFM/KyYaVwfhgc5lhH+iiyDfwIMg5R1eyMQh
 M7nH4ZJbsYg5Qvt430rVaopEIdsDE71334OHXlreG/dpyTrgIiUm/UKV3I8SJ6Z1mYHm3HLKKQ5
 Ilo6PfvLdvUV1n2Ys7aexpD6ZWeIB1ua9v+ujzU5Lva/sBTzXV9dNNvQhDhY+dcXJLytYNUrZLl
 FSxo6mRfsLZRH2moL+g==
X-Proofpoint-GUID: 5d5OSiqAc5WBOxXiI2XB2wzN-xfwXaib
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NiBTYWx0ZWRfX6gVH1GCBdsU2
 kvJ7DKIKNb0en98VLXGiDFW8Jg1G2ADIwoOApJmtdH78EqCvHHIZlhXSCyYd8qzZYrCbf8oYzvI
 Ylc8Sh5t5LPdc1tb1eoJwdrezXnlQxk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_084719_167047_0B18E301 
X-CRM114-Status: GOOD (  13.04  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The q6apm DAI currently selects SCM buffer assignment solely from the GPR
domain.  This prevents an mDSP-backed DAI from using an IOMMU, even when
the device tree provides an iommus property for environments where the
mDSP stream is routed through the apps SMMU.

Use the parsed stream ID to distinguish the two memory access models.  An
mDSP DAI without an IOMMU continues to use SCM-assigned buffers, while an
mDSP DAI with an IOMMU follows the existing DMA/IOMMU path.  This also
avoids requiring SCM availability for the IOMMU configuration.

Fixes: bb8afd437d79 ("ASoC: qcom: q6apm-dai: add SCM buffer assignment for mDSP platforms")
Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index c1f0af93e808..a29fe4241776 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -1218,16 +1218,11 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
 
 	if (apm && apm->gdev &&
-	    apm->gdev->domain_id == GPR_DOMAIN_ID_MODEM) {
+	    apm->gdev->domain_id == GPR_DOMAIN_ID_MODEM &&
+	    pdata->sid < 0) {
 		if (!qcom_scm_is_available())
 			return -EPROBE_DEFER;
 
-		if (pdata->sid >= 0) {
-			dev_err(dev,
-				"iommus and mDSP SCM path are mutually exclusive\n");
-			return -EINVAL;
-		}
-
 		pdata->use_scm_assign = true;
 
 		rc = devm_add_action_or_reset(dev, q6apm_dai_scm_cleanup,
-- 
2.34.1


