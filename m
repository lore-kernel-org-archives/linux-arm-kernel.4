Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD523606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BXn/nD+I;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nTGyK9EF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EEqBQHkznGJoblBjoEexALIrR3msTp1bolN/HqeRkTk=; b=BXn/nD+ImfHKyx
	rlU9JdEf1u1AyRuzD7d3/GG28t24kTwVgflP/eAWIjK5DjkIhnf9YJ+VnqRuRNBhiGXebLo+GNjtP
	rQVNDtcCskq7s1gXJdWPjOIoZvCyqRJQZ6a7xWnmWKX0UtGCeaDfSt7qoFPwp4YkglVNuP08h3dRn
	ZhaiAXxqBUSAWcoOcKjvh+7/sRmANZ7N+V9LZRFP1yH4sR8QYO+cUHGD1kDh1hv/J8tTcuG7qwEkW
	8+7y+DDknQw0DyCNlXWqCqHsrJf7IkmSn91bNHT3E/8NewxIYSFIwmzoeVJQKM7KzjMT9AjxUoXzs
	NIN66iBLiZZDsZuBWLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5I9-0000000CiHP-2LxX;
	Thu, 19 Nov 2026 16:47:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5I7-0000000CiEw-0iI0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:47:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF73SJ525317;
	Thu, 19 Nov 2026 16:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EEqBQHkznGJ
	oblBjoEexALIrR3msTp1bolN/HqeRkTk=; b=nTGyK9EFrrvz9QhIF1I7qQyU8Gp
	j7m4pI93WMRIzWD6xwDv6TI0EWGZAcgKvXkgdCJ9ooq568UjRSZOMR5yf2ynOu3z
	Ng1sCXeHmeaMzoXWHb9Y+VNBqQdtwjrNAPlS7kKXFTQ9WBoHagDAzcIkCvcejV4K
	2HJdp+w2ozEGMrJHYf2r3mqfM5XfmdtuE2Mw9XXwykdIPEjoEkpVGbDuQwFHHLbj
	mChUnTcsd34aRAgq37AUPJSO6Vz4CvdhwKwg22UsrfgXH7zlZZXwNLw2VTKYHtiL
	TuVfAB6kAaVpKd6FcQQfCbyRATz8iHRfmWrg048M4GSEXhE9FnmFKp43/Sw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2tdpp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 16:47:09 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGl7mY3118417;
	Thu, 19 Nov 2026 16:47:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mohis-hyd.qualcomm.com [10.147.253.64])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AJGl7Jc3118398
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 16:47:07 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4840500)
	id 041D76AA; Thu, 19 Nov 2026 22:17:05 +0530 (+0530)
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
Subject: [PATCH 1/4] dt-bindings: sound: qcom,q6apm-dai: allow Shikra compatible
Date: Thu, 19 Nov 2026 22:17:02 +0530
Message-Id: <20261119164705.1594066-2-mohit.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119164705.1594066-1-mohit.sharma@oss.qualcomm.com>
References: <20261119164705.1594066-1-mohit.sharma@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: JeVkKwaBpiVD29MIHFVouPHDfWLqiMmh
X-Proofpoint-ORIG-GUID: JeVkKwaBpiVD29MIHFVouPHDfWLqiMmh
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6aff280d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=0_GNQTBepOQCxTtxIJwA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NiBTYWx0ZWRfXxJzKZwopstic
 AGAvZQY0cuK+oS+4C52AVD/FIFVMwde3qg2sNkosOmQJuqOROm0vYOhadwdWfSflMbIQVsXq68q
 2Xno+mauMCkMjaCI/Si/XZQuHOTEano=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NiBTYWx0ZWRfX0E8gvcgjDBO8
 HVBQyFLpSfMcgAC/vLKYbt3NFddJbvQ9BMYZIL1Vcub0E3YpoeViN77OIyZjwrZ4mRzJC6RapSr
 U/akl/hgx5066NheWIqut2RUt5ofb4HfkBlMalgp6YXrRYy+3mSG4T5CbVRj6gb05UCPN6okMGy
 eSu2V/4CAPBfXHCwV1nerJ2PDbmWQzCZtp3r5tLQBSA1oc2GlRxns0Xkqsg/7lUJJSjhGbsSUJk
 b1wUG9LXn4t8o9XgoEFGzGZGm842Te2/ZihE0fdcAslLitFQ16Xdx5vLnJD8p5uFw7b7WVYqfX7
 9par4PNdjiLuBaYJjGuz+QJ4qaoJzrig7RyvKYHRG/jbDrkytupIQyP+fnjeySRQZhETwaUTctv
 SF+yG0EYeLDRmTfqfdOQK4b9pYDT/8HK5DrL2VblgVRhxI6YQuLsHcpp0Mfv0bGru9VBrzYhl67
 TH9iLXpWre3RFukaE+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_084719_321984_D7581B63 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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
firmware ABI.  The ASoC driver continues to bind using the generic
fallback compatible.

Allow the Shikra compatible followed by the existing generic compatible.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index c1f9fc9eab64..c5eea6698ab6 100644
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
-- 
2.34.1


