Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69A760A2601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X2mG4tfz;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O4brvdgV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNq9uciI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=; b=X2mG4tfzwH+h8D
	xRCPnmfDT9O1u9JIEGD1l3O0NuwQJmk38s/McyjFlkfuwaITKIz34AXhPcNCCzEXYMBzf7yIpO0cd
	9PMZPkqiH43ZWKlFPXDDYYFRd46cJ926J4rdaPpE41upLgnlThjZE43E6kIITuK7zrPAv0V0L5nfZ
	rWjhph9CEszKO1SHhSy8v86fN0GWfum5+8FW/c5a0uAv0xh1swJ+oDtU72LikHoxezLgSAR2Stmkh
	9G9dx5peOoTCROxUw/MPAQb0f7i1dyFYmrqGFvhSCHwSwT3CIjxaE6BCMuBNU1Q7vtWqiqou3fkmu
	U5qo6B4slWFKzosrtbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtI-0000000F7cC-3lgg;
	Fri, 20 Nov 2026 13:43:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOt7-0000000F7Uk-3U9j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:42:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKBUa071158890
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=; b=O4brvdgVbiXuTMc9
	LN62Jg1q5tbIRntaWRcl3gHKiwH/ChVhSvmetIuALcoqkh2eEgyuRKknvmJ7fNPV
	AUvlfaWXST3o4P/Tivqu/+rWteNLV5YIxg6oQVDmXM2dFp9JP3P/fSFSmEcZhkQL
	ZKwVapbDXEvrHmL8Fo5Tkl4ahOYZEltCgO21hN+AA2zDCqtRZz1pPlVpClBldPoE
	7hiUZwYrItU49V/3zOMkWRL31X8Egy3EM5fO+JDlhFsYUa52ok3gYZJ97cn9cicH
	FO7Je6M/A7ryMgyt6Z448yXcLQ4TQK5bbbX2lVMEDZTo0qhXWrEDY/luGO3evel+
	spNcsQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykws2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so1465690eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182168; x=1795786968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=WNq9uciIpc/x6KRKBF8RvWTHEv2e/eLSFsVGzM72UN8WbW/C50+HN4sC349h35Hv90
         TsU/iD6ZSRR/wTP+m/hYmzqqG7pBQqEVu2Hnjg3nU4E+ofKu2Ed1JSS5tFd3vSfz2vex
         XaZClrDJVvOEUA/kgpRt0ioNVfkOhzGJZohXiMynIcDXsISi8fJjRO2IrLpZk+mXlSF4
         GRaJV591ppNjyMQJBcmmwm5fS4x//xPNFebqDznIlDNnHs8yVE9mcS60qKlgy/+oTj/H
         3IkXdxlcJ0FWPQUIgFKymR0Hhrns80Olj5gFtEQxC3c1NmKnOjMREtSiRPkltMYs+Kjr
         UD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182168; x=1795786968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=S17YeruUxMHLHVFVKD4bLJf/hIBSDXOkmQFLDIg4SH61CBFNfe4UhmdsrO2FN99qDz
         4lGXQyfTgXpNhcZPPiGew4OVQ1Si4b8/bNL3zhdgt8gaddk7C9Fjk995l4l0dBYRUHJm
         ob0nB0fDFbTD8bA5Dmb/9uDL03viNhSEsIepKNITM1A5BUvyIRoYdunx0/s9KaDVYucz
         XKwtCIIY6P4fm+baN0fhfUaAsxcYQrA5BFU78HH2mJ9fNA15CiYvO2ydSJjZ2/NCq2/2
         n+UKZTENvWfcYdohmV1NolbZ86qlnRJ05T9aBAXy7GfPhN+jzkf2f3vrbYrKkGKsfDh9
         IS6w==
X-Gm-Message-State: APuU4Z/LY9Tgoa8N/F7MAJUXpLS/sRvFg+K2PzksXdCK3H6SJVO6rCK3
	dzMIeNipR9u+Ag8SXGsbUFUyyg758dNtJnuswIN2OnVcnPUSWy2Y6PQND6+Xeye5JElvu44Cbac
	O4JEs1KcJOQTcRii73/7iZdJA+BRG5lK9MRKVp4wBaqwpOkVeVFHdA9/H/o644i2K+AXd9CbIfo
	mwTg==
X-Gm-Gg: AZFdTZexsygI5iw5cR9X2Ya9nhSwg1lUGYYgPuT5x1RHqmM3rJ5J6YTzwECduB7ORlY
	Omks2tc3uwrGxYTZ4gjTiVFXqCO89rzwiUcb/104/bbxEEHDU5eih//BRUwTpa4RShQWxYSUHL+
	S3Hqsad0qdtePtrfNL94f1O71KSN74I2Pzxttjv2nZin9G6f71ZNPmKRjLdMtB/OePYtMX6L7fx
	U9YYzk2gastUlgC8PYy9HHyLE5Xy8ZBU72N3S0I9XWpvb+MzMQkK7LLVN4zJxPkOzBp0RgFShPG
	oXNv8YAHnxIJS9voO4uxjbah3g4jvLG/e2hM1N/C1UNZx1BvfHE7b5JSuU/cULOoHGw9e4LOs6n
	rkeezVaYTOXUMLeq84CDj1SskZG/+rrZ3B2uL1YZ7ne2xvGDCd8PLNrqoJHLh/M2gdpnJ75qyHN
	B/dZY=
X-Received: by 2002:a05:7300:7a21:b0:384:b001:4350 with SMTP id 5a478bee46e88-3856f04b191mr3187799eec.24.1795182167477;
        Fri, 20 Nov 2026 05:42:47 -0800 (PST)
X-Received: by 2002:a05:7300:7a21:b0:384:b001:4350 with SMTP id 5a478bee46e88-3856f04b191mr3187750eec.24.1795182166834;
        Fri, 20 Nov 2026 05:42:46 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:46 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:35 +0530
Subject: [PATCH RESEND v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1069;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=J9MtDhNBRc3o2KPFtx8zuqYMoIVGqmO1gPFbpzrqgQo=;
 b=GunXIg6kgvtDV3uM/J82EzQCVo6lYY/weJi14MRG4ovrA4l4K3ivsa2Ji0ZDR/1rr+ACTwOJb
 JKuZYPMYWySD+fnfBCErjgyWMClxa6InplJWk3v7QoUiLidllSJzi8A
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX5BEh/BkDwy92
 0kgbM+DpTCabjQccrpdVlPZFAWtBM4HM/Gp4K1k0gve0lXjK0HITChuKGTW/gb7PnxOPffOqzsi
 f+f/pNpfwQ+B6j1IxGWwAhHDedIYjQg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX8wK/5+bv7y7d
 AF8WXpIxXDrEVomSJuDvNz504iggN+T6mzQOMFHSWhFM9QfdGWVrC2Er+gdprEDHHs4OK9ev2ol
 lATrWNeWRS/K3D5FPXftWPt8AqZwk3oU45lI5k050al0QsX6r4iHxK54EmdRPOkZC3bMpmOGFDK
 h96tbpx1H+Dk+7DF1qHoih0gbw3n2LPU+dxz9CEmX/tTDmuYWp7y+dSHmVawNZ3lOH+7nstxjLj
 z3nChzLzG6WXUFVJy7VNWhPk3zQ+4jdvYPa08TNIowexRo5lWcL3cx/hx//tsQl6ZlEiQGNImxN
 Lo1EGG06heyN2tXN9bltLGY4SxcurfF6fLk0zFzwtZa1u8g1HOGKH8NeDGEY7GCZy125xv7dR8s
 RtuXXWKpIXWhEqAysFnwAWToi9QJehm2TPkZbTlwznEnhJC+05FGDeEn4jN15zD80UETJ0H5khm
 ioGLa2Q5DxBu0EVsb0g==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004e58 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: nSdwXTjhoJSF7puItNj4LX_8NZjmQGYi
X-Proofpoint-GUID: nSdwXTjhoJSF7puItNj4LX_8NZjmQGYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054249_981848_AC495083 
X-CRM114-Status: GOOD (  11.96  )
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

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 20f329c0df75..be71eb30f997 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3127,6 +3127,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		llcc_bwmon: pmu@9091000 {

-- 
2.34.1


