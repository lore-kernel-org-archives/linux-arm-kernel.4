Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9229C60A2619
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a5sAPRYF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CAUYNwmD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WC4rIs9U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=; b=a5sAPRYF8wvsmf
	LCwvIqZ97yCqRc124lpoRpLXys5NySeZx3xTLNP50pLzISUEZLL1nlZ3RI578LGJ02TpvklnawV1v
	btbqA9bdpjk9A7LuJ1BpPJbDD/GX5xbtduYinWSlNjSAGb93MItXmG6DodPGMkvJdviOWyt9Dd7BY
	fzx3ORCxpqFpdVdYAfBIMQ8WsIu3784hsbxkNyKw2owJkyyrTYoDH6tOICB8Euo19WqENeURhkikO
	wQQxoMfw4qbnTd/T4xb8YezREuoe0lPdVT4PKETKvFbiJRVP1iNPtsI3mKvNtz6XNoA2yPokCRsDg
	df88M/3MQsI+ji7go2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtJ-0000000F7cR-0C5l;
	Fri, 20 Nov 2026 13:43:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtD-0000000F7YE-17Rr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:42:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkfEi3107607
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=; b=CAUYNwmDCpzBPdlm
	MyKbSiLl1f2o1knTbSC9nBMYV4a/fq8yGsVUuE8CFNlQln/+pNv3bU7gXKPDK+l5
	E6mRJiiDzGU1kNTyQPytCjoIu0290cpZ61ztxLqHPzh+tMALv2OCB+PPNc7Sr1Oa
	iM7e5+6ppMAvc10SEt6O5IOI4RbiH0sq+BFw/j6DxNwYq6OcSnOm2Upv78dpccdk
	25IhQSyb41vRNA/SWWTM8V7xf2QZWeDBVWxKRPcvBm3iIVYkqcQkGH2OW2usdcXn
	aM64fYKUfxmFjbd18C9ZULu51nNA6GtFuzVniwrz3nL4hwkEDgT7DS+T2DUVt94Z
	CjK7iQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3ww6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so712916eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182173; x=1795786973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=WC4rIs9UPMEywz6vFA/p0j3ANolucDv7mqgVd79VXkrlp6qHQiE9PmQYG6rzqLwdTu
         l583wVhbuaRskpU9nyitzieOETM49nT3kCd3A5xCabKoklsA2l+3rnGrKOR8BU2q0Wvi
         9aCiOyOhCa+mIUVqAxPEQkNVw+fgePQ7joJPMUsd6yOrZV7e8o5ILusX+ckl23g37Fza
         8LqZmW7NFh8ScGOiZ1ekwg13Iv8LI6p+IUheu+BKMHmAFrZEubqSfGXXN4jBtPd691+7
         3dhODv4HXmycgtS3O1NDvk6yOjgu4ApkrT8rOFNjciGY6IhANUUhmr36z5s4IuSxc3BI
         nKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182173; x=1795786973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=HsDIX0lyu4+L6x7jA81wB6behe6qBSYdbl5hgQuhFQ3zmHVCMWEWB3gBmgnAzC2bxy
         lmfl99TsQMqomsibClZxSG1oiRztdOSaaUgFjfb1+UHbqcSzH+vTQQXShRXy8WnT5Rdf
         PYfz5BfiA80hdC+aye/y0Izx7RYi0HDw1Yl5cq5LDhbxY0AcNs6PVFduqbLfRBB98Q1P
         t+JouzwNGLQFIQtbLT2SMIrC4q+wkOuBrvaBeBlsCJG92c7L1ziCfgQs1jeqqXWrRjTg
         NbEEJ5Jz9vZL8ySLKoRAE1c11w1z5uc8x9uO2c4XjWLLPDWJ7VTIZMAer5UzzLQDIICH
         dLqg==
X-Gm-Message-State: APuU4Z9yY19hhCyJJB3yvJx/++4rtGtshQjI2xv7r9CXOkgdfY1ketI5
	DC8YQpHeaUXBkbXfq6Nbk2B8NqR95/F5ytebuxfAkunfpaDK27yiFW3xLvz09M8vFQvSLGKfiFJ
	jLUsOueMnwHTv+4zFZjf7CvvXZoTyu0/X64Po/J8u6dsaeuk8CBxUh2RDR+FjbSbQanTmzvnMun
	ChIw==
X-Gm-Gg: AZFdTZf8Ss0qwibKVy0ALhvk6eVQdc6Xyc4xqBAabrfNZiQ5FX6OHEfuM1mgfmwkD+d
	sUO/19X23EsUCcNnWYeqxQNgX24qEj6LhhjQwDmYxqUrj+6WiwnskUtlxj84FgssAwfq/Xudq90
	ZYzGdfskp3koy0xyoQdbirDgxMn+MiSfuY3UkYzwhUng3BNXvbJnIWFij3x6GlK77k8/rUPSgvv
	OuywcMt5MDVtB6tTMzQaDmjVo2pvVIsPR2y215X6z/EW7euPC1S4EAIZurvluBVm4oofaLK2tGO
	6GjNR2WGnco3cSkaHMgNxnwIkQNbxIL2xoRkyqANd+CoFtXOuQdcDikyhxQGXJ9kN+LpuOR9op2
	vKayzL6iMMboMrWyMN0q6Sr6/G/yoDR3vLm7qR+q1Yh1cKNlm8fnBcTV6ZHtZbEExvweATYxFqU
	hRnvQ=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4218391eec.7.1795182172834;
        Fri, 20 Nov 2026 05:42:52 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4218365eec.7.1795182172191;
        Fri, 20 Nov 2026 05:42:52 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:51 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:36 +0530
Subject: [PATCH RESEND v4 05/20] arm64: dts: qcom: monaco: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-5-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1018;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=1lPh+lGGWLKglbX1purFejDWg8n5fwBJBYl3rhWzR6U=;
 b=oUfXjkp08+mArsrZiKnkDBUGoVmuJ2eZr5NDLzeoQIP9UyDpL2QqdSa5M5lOtFa9uE0FtdArq
 WMGUW2T+o9/CdUf/Y5BNFEnVKbWTupmAIgS5HZe+BEAMk4mE8b6FF/0
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX3Q4AY4HXFRgn
 ej/es/JdJuPFmU5JPpv3MIZkbpVkk/ZGljIYii5HXyJ2vv8h0brn+6J/HPSTnnmjce1YYwcWD/W
 R8TtznzsKpcEIAe3QTGOAo3PdXpsBuxoA4wSqtVSHPYJK9pRKTOY+atVOcbza5uE/pgH/fijlYT
 yL6grdpdk24iIakUxt14XLjnSr9/nOOHyIFKbeGe1pZhkQDGZRPhpB24/ohpY9VlUKws24J6nGi
 7miCSgkfAnqO59ZBTLHSk1xZUhdWjEzSIjxhjB574EGa7+oAXBjVioiNptSkoOs1/u/ED9f0GNl
 driAZZ433Ae3sOBCz0s++NSZSEm7RxGo31RhYd+/U/KWdOeCLuVyWeLpyvJWjH355w9xZCdpWPN
 WLclOSCH2Llix1BK6xEtsMT7bfp1aZOtG0UXBWu7OcEADcugnFC0S9Iz/d0uxBpvlEDXpyBD8IZ
 FPuY+VPFNPnO75jnhdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX2GIy9h2Ya7IA
 Lxdxl3MMxVjG/GZ8Jlz9RHAfEkx7ie6pn1SU5ta21kk81AH3auuVUKmE20BQVBHGzzp36oqaJv2
 DKSKVKirucgQMBBD25NludFiZFBW7mM=
X-Proofpoint-ORIG-GUID: z2CObTNUAkoh4qCl5K6fyLJDJRmSg0zm
X-Proofpoint-GUID: z2CObTNUAkoh4qCl5K6fyLJDJRmSg0zm
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b004e5e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Jjng17ChVe8r-G2aFk8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054255_459764_5B57E2D4 
X-CRM114-Status: GOOD (  12.03  )
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

On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf..13214aa77279 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5113,6 +5113,8 @@ adreno_smmu: iommu@3da0000 {
 				      "gpu_cc_hub_aon_clk";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		pmu@9091000 {

-- 
2.34.1


