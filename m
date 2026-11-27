Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F381606A688
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UC0MN7jL;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YRYjCWbz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JkFeBAeIFGXP9H+b0e/Iowj6DYNaFp8sLF647Rx6ZZg=; b=UC0MN7jL+4pOWE
	bsl/H6QDTOn0vaRnqrPnADY10RVG3BIZuTXED5zu1J17grzJqOjkueG4e62rN0oQZlC2POYZGNc3V
	ajNfcQ5e/RkVp/otVctBDcHBR5Xc8NfZIXJfDIc0GwmdHCq33rqTZsCGk4aOmhMDLudP5IjqF52ON
	0Ftw5G+i1yUdUXctK420z1WPh3tuRqfqEhwNEKIQYv4gABifr/sh4BW/MxTp7e8WeajPdY//kc+BR
	thnglyI9IgYPAQ4bxj9tzhkVqr5lt1d44Ny0nmx7Y78SRs1AneaTVQRTVj4PzJHiX0UquWxRnQvmn
	ZNJqSSc7foBT4wL0IW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrdg-0000000FIYe-0k39;
	Fri, 27 Nov 2026 08:49:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrdQ-0000000FITJ-46Wh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:48:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GbMs3759042;
	Fri, 27 Nov 2026 08:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JkFeBAeIFGX
	P9H+b0e/Iowj6DYNaFp8sLF647Rx6ZZg=; b=YRYjCWbzaY2dpjoew6GWqSJ8fls
	4y6zl8l3QLVZ6sHElAqZlbrepe+fSqfLHoHQqhBdOI7nlrJ9e1YxPVLP+mt/xuCz
	EWMNBYoB981Z/6UHdXdlX4BdjEvH1SPZ4v0TJ5eXCPhSRRMJPVRSizdMKOPUO6NC
	Aa5/8N9cb9xjqBsf76aLfURRyTfGF620UNuZoHhtUkfe3Nglu8vkeoISn11Ym+JH
	X+wnCIDONFtPg0/GZ9ySdPT/qErcaNAg6YNMNlvvNoHdQUz85TkJAY88KfKE7l6G
	onLOnZI06hSQbo4YgX1dHV3YtLvJqLNbi6A8kaAMnejOUAy5uk4WuyE0mQw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6rhvj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 08:48:31 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR8mSTR003713;
	Fri, 27 Nov 2026 08:48:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mohis-hyd.qualcomm.com [10.147.253.64])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AR8mRem003697
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 08:48:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4840500)
	id 9B81A6AE; Fri, 27 Nov 2026 14:18:26 +0530 (+0530)
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
Subject: [PATCH v2 4/4] ASoC: qcom: q6apm-dai: Allow the mDSP IOMMU path
Date: Fri, 27 Nov 2026 14:18:26 +0530
Message-Id: <20261127084826.916361-5-mohit.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127084826.916361-1-mohit.sharma@oss.qualcomm.com>
References: <20261119164705.1594066-1-mohit.sharma@oss.qualcomm.com>
 <20261127084826.916361-1-mohit.sharma@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: pru62GRbObx_Ac9MDrkJvZ0-zh5stAFf
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0943df cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=2pjKgLFfhSI-GXVsdeUA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/WKZLsHxIRnm
 4mGtX8Kd7yelUOiKOlnUhqXBEKoZUkbyJn8a5+RiTvFZLo8ovQef6SJTxKT/FHnKHsIcWsFV5mf
 etl/CAFnmw9FCOm4tdN+jyoTP1ld/qo=
X-Proofpoint-GUID: pru62GRbObx_Ac9MDrkJvZ0-zh5stAFf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXwW9Cw+uaFoXj
 HriDMrKsXgw4muBzqaSPbSVbUFJ9Ts/BYDhp82iQAlpEs3sCCmy0BsYOAFlh29iOO73vsFlX5fK
 Z3nO3yKKHDHlrFN6geJlUPV7Q5ppU+tOQ90Wv75ZUji44mOQ2/fJdGWbTMqo65GwR0GEKMrmUls
 sPvAFiBL66ux1Ca5X2p8K01A40TvPL9YC6UOzp1IMTpFYg68OPcR+1Bj/SsS7VkKq5K2mPRCcf2
 KrgEQoj1+JbIfG1YWV1cUk/3wmiPP8BAFXfubcTVdJlI88m5Lqr32C7Mj//mSgoqeCx5EwIPOeY
 at5kA8T4wO626cOVXH1QxcMQSqukD0UjMDwABYklpToNON5bQzHt6L8K6wWFtDUAHRdt1GyvMjo
 WmCfgvNAAvWYYeVrniK9l7/BP0cIpPtipgt0BHz7P6T6xtlcL3GbuYHPMhLe3cxygSLcVOcSTz4
 ZIVfoY2iax1tkY9CTdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_004849_130716_0D85B6C2 
X-CRM114-Status: GOOD (  15.21  )
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
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index afa4bb095e09..94302837b93b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -1221,16 +1221,11 @@ static int q6apm_dai_probe(struct platform_device *pdev)
 	}
 
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


