Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF1A606A6B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i2ryCOKt;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=btDpjFHh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GRTB6scsvX2+8rRiFj5H5s6fLmWfs5A6B4E6WVX03y4=; b=i2ryCOKtluMjaZ
	DtE67qDtjBhhyg/VWPTjKhbbugxzNNm3lLHeD4RRikQT802Bhn6U9pQV9bM+mbppGGEyQKg+5qOdQ
	sUgqm85XVWJFC+xIMZTqA446imzKsseNPoarZROue8343xT7AIGtcOpAhaZ2MXqQM/uZcECD2dE+P
	8zM/fJJYjmw/qTnJZYxkmHJ6VILhQEEbLOd/aLGQoezWwil6rm/I05attKqXV8wvUc89Kh0NIq8ww
	sK40CLsC0PoFV18VW3uWoJXNVS4Q97VhkCo3OzYYq1/8aqMoPVH+N52GUB69sdmOakEhkcuWNctRI
	h0Y+l0d5Dvy+wa5kSrDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrdg-0000000FIYo-17rG;
	Fri, 27 Nov 2026 08:49:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrdR-0000000FITK-1My1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:48:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7H5bd1076621;
	Fri, 27 Nov 2026 08:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GRTB6scsvX2
	+8rRiFj5H5s6fLmWfs5A6B4E6WVX03y4=; b=btDpjFHhO2VzB2DxQ43Q2bcrL5q
	wvmWwkm77Ci0U0cRIeAwKGjnrenT1NzSWbN2ttkA7h00sRQXAeYMPu90/yFzG0JD
	bBvuNfknEMJ4qakTXsRePwNid6VSAf7QvMOHmt44pxb1ul4LeZG7VA5rNH5u3L6Y
	qIVtrHEbiIJwMLx33b8J9EiZ2JkrlvcJmgE2s7eTEvKSfrSWSH1KLATj0MtR6VaL
	PvFn8x3UJPjrv2+sHfaWQ1DAbNtxUkZTcmbeES0uxnsf/t9hs6zrgZRs2zEtkT5Q
	2ejM0e7cjKy3CsUkvSNnNmaoWcrOB9kksgX5l0MpY2rcNyjHDQVIu33hnBw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55t24q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 08:48:30 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR8mRaB1693406;
	Fri, 27 Nov 2026 08:48:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mohis-hyd.qualcomm.com [10.147.253.64])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AR8mRTO1693394
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 08:48:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4840500)
	id 940C163A; Fri, 27 Nov 2026 14:18:26 +0530 (+0530)
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
Subject: [PATCH v2 1/4] ASoC: dt-bindings: qcom,q6apm-dai: Add Shikra support
Date: Fri, 27 Nov 2026 14:18:23 +0530
Message-Id: <20261127084826.916361-2-mohit.sharma@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/tGUYjqGOuLX
 0mkOi26k7mQzlsIfqZYdTyLDFBoIGY6oho/TSXaajW4Z7morxf5BCR/NYeYpPd44LFbs3e/xrwK
 xAULddIABHmCJLCXN2+yRd2dgynACu8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX2LNr8SUbScoQ
 8ca6m34sr7xtP+pIn8xzqe7whkjfo2YUHdiF2GSdnIOnvqRpft2sKoH0MsEowJkfCPIP184zn/R
 CIOuQoV89eALt8RywZuSMsdAJEZVlidqeVS3R/eLx/E7M/qanQWMYjr7XVTXk2WMJiAoGCVRFfn
 eqSMfLRGWjGwQgaOM9n8jpTaSCOeMcOgNnUe/WHw6j6UBAQLOIz9z6vlbTnUZDVnO74Vo6HiCbO
 0mRNlPviF7TslfxrhHT5xbZGBVDck3+cz8Td63RCN4rrs5MEEJ7qfTZtvMs+2N5D63hfCXvxTgD
 WiD0nmAjdG+28z/JZ3KEmfIy9UslG2ZtozZ3JG6VrNdav6U+wrOr8yb4Z2F4WF2uQLKdppeAa7b
 Hol+FQwZgYz4RdTeV7uCoXgIWnhhZSy4HpnHVFcldDlgoO03rj/c6ijpjxTyxeBRugiape8nC+A
 pEcz9ZLKNLyqCl+Q5nw==
X-Proofpoint-ORIG-GUID: hAjDorOppvsG-_0KMWh2QOQ0orTbt8IV
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b0943de cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=Mho0Gg_QYPVSDt4oThAA:9
X-Proofpoint-GUID: hAjDorOppvsG-_0KMWh2QOQ0orTbt8IV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_004849_492121_359AE489 
X-CRM114-Status: GOOD (  12.83  )
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

Shikra's q6apm DAI needs a SoC-specific compatible so that the Qualcomm
SMMU implementation can select the identity domain required by its
firmware ABI. The ASoC driver continues to bind using the generic
fallback compatible.

Shikra uses a reserved-memory carveout as the backing pool for its
audio DMA heap. When Linux runs under KVM/EL2, it also owns the apps SMMU
and the EL2 overlay adds an iommus property to the DAI node. The resulting
tree contains both memory-region and iommus, describing the allocation
pool and the mDSP address translation respectively.

Allow the Shikra compatible followed by the existing generic compatible.
Replace oneOf with anyOf so at least one memory description remains
required while permitting both properties in the Shikra EL2 tree.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index c1f9fc9eab64..8ad20f95c814 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -14,7 +14,11 @@ description: |
 
 properties:
   compatible:
-    const: qcom,q6apm-dais
+    oneOf:
+      - const: qcom,q6apm-dais
+      - items:
+          - const: qcom,shikra-q6apm-dais
+          - const: qcom,q6apm-dais
 
   iommus:
     minItems: 1
@@ -33,7 +37,7 @@ properties:
 required:
   - compatible
 
-oneOf:
+anyOf:
   - required:
       - iommus
   - required:
-- 
2.34.1

