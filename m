Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD581606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WH8mYBKW;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1hYm9ms
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fucg6+H3aj0x6Mrul3oYN/ia4zpxh4Dp21L5L1Ca8I4=; b=WH8mYBKWeEAJxL
	QIvn8Nml1/XbpUKDa8sQZQJj2eklRcZS8WQP55efm3kiAwiMSVreeYCTB1xzsqFKj6OnkUyTkJ6ww
	zwWSYOHYI7tRwAFDkqaJDkiYKtejZPgpOHIjTj2jOOQoMii42TZHktoF8NFpSkjoVVUNObEQ/aTe0
	1rOc8uVGU5TObk6UoOPIU+Dxvy72wLwGFyT1dFFwCdKiQpY7f9QV2WQod/fvht+lidsAlb2rog1q3
	Y68QqAxwjeFoToPu4nyih+s23D4wEKDAk8j92Y6j4kVOZJ0RLGTMBavmNTxyTjTgnd+FBQRJgl3V+
	iuJZbXrV5Op4txRypOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5I9-0000000CiHw-3n8D;
	Thu, 19 Nov 2026 16:47:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5I7-0000000CiFW-1qp5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:47:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF6FEj3048019;
	Thu, 19 Nov 2026 16:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Fucg6+H3aj0
	x6Mrul3oYN/ia4zpxh4Dp21L5L1Ca8I4=; b=O1hYm9msiICzgnPiehnv4OefxWt
	ZC5OFu2el/n0PJq9P5AWWIcO12TPYH1t24NcOPqQQdZcdyMc+B/B+2mPUPK3gcms
	8B8oZd/9Em/f4Ad2EtJGxlrN1mI/AklXfi38T6xSjx+nHoXBEInKyVWH8hmlkmZZ
	7K/0laYq3VTwwwPhEYCdL/SjwSCYfLdjyHR+eL6I1N8EFzdMEl1gjqUFBmWJ/Ib0
	SzyPPLIOijXKWxDoo1Eu+7spRui3+ETIJ39PREJ8lYoE8vTrgbw0tVtjCcgYuxco
	6bT2sS62/ICtSLj5G4lCMh+fNGbqGW3bXbvYiCSrPprVmRU5rwr4eZp/YgA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcwf22-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 16:47:10 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGl7R61031921;
	Thu, 19 Nov 2026 16:47:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mohis-hyd.qualcomm.com [10.147.253.64])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AJGl7FN1031909
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 16:47:07 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4840500)
	id 0249A661; Thu, 19 Nov 2026 22:17:05 +0530 (+0530)
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
Subject: [PATCH 2/4] iommu: arm-smmu-qcom: use identity domain for Shikra q6apm DAI
Date: Thu, 19 Nov 2026 22:17:03 +0530
Message-Id: <20261119164705.1594066-3-mohit.sharma@oss.qualcomm.com>
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
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=v-17ujD_Twj6ygAmxgMA:9
X-Proofpoint-ORIG-GUID: wC2ghJhxz6WMV-DFTheIyxPKoLVf4Dlk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NiBTYWx0ZWRfX9UgiCs/E2Yat
 UULRiIb3XCEZTN7SmP5Xy2Vf/vu+S0yKQ98thTZbjAx0hjW7mFFsdLEgiZJaUuLZutDtB5WILjM
 tXtOnqDmGMLDXnSarWtMa6QMCGdH4IS5kn3FDVpMGXeleiJjiE2VbYiaPaa+R8/FsszgjYTFJTf
 t6JK656qRsYGUGMa5Q1Iwu4GEG9aL1iAd6dx/4Rg4JftEovaWpI4CjI/pKsZ6GKx9MLjl2RBAV3
 DaBa/QRGdY9p7p/wZONCg3C5vZaDbMYiDH7PsEq/CrYU/XWackYaF3/fzuivsbH0tvhwf8Zi9LM
 rtZrIMjZQpZcByUgrtU9OvbVsK8N86Jzqv3cp3F94hApCeCXxrjhigYtcYXgtw/BQ+Wonkv2JfH
 nUW4Cj0nWsFQnOv0UicZVzA+8ct9YYYg43oXTRpL1tceyleqyEfP/J4ofnhL0fgzXduSxiXynxB
 j/OBjnO8kPuhkhPOP3g==
X-Proofpoint-GUID: wC2ghJhxz6WMV-DFTheIyxPKoLVf4Dlk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NiBTYWx0ZWRfX65YRz5FHVS06
 cQm2+oxNAhq3G0rYQ+OrDsawt2pRKH74NsIbCBv+svYmsKjmYNXRWXykYFJFirqh3rMR/egRId+
 kCDO02V6V7J7OTtwM7BlzjXjfkAO//8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_084719_483419_C8630396 
X-CRM114-Status: GOOD (  10.43  )
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

Shikra's q6apm DAI is hosted on the modem DSP under SMMU stream ID
0x1cc.  Its firmware consumes the SID-tagged shared-memory addresses as
physical addresses, so a translating domain leaves those addresses
unmapped and causes context faults when Linux owns the SMMU under EL2.

Add the Shikra q6apm DAI compatible to the Qualcomm SMMU client match
table.  This selects an identity domain for this stream while retaining
an SMMU mapping scoped to its own stream ID.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index a0550740185f..b340ca5f5117 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -435,6 +435,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,sdm670-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
+	{ .compatible = "qcom,shikra-q6apm-dais" },
 	{ .compatible = "qcom,sm6115-mdss" },
 	{ .compatible = "qcom,sm6350-mdss" },
 	{ .compatible = "qcom,sm6375-mdss" },
-- 
2.34.1


