Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCB4606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2aHvZr7e;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eMz1aTBh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UU+7g7/R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SDP+V0k/153kXf8kggh4dD+QBvViaqb1sIHAp9EgEOA=; b=2aHvZr7eHyMaKX
	/QdiUWMfmhqn9opTOwBNt2KVETNYUnEJVH6LqdyND2wuNoiA+YLHdT/90ThFJhAZkghu+Wqf+jAtf
	dSONxQPKthpt3oR3S4DsLn6De084HLbIKsWz+wjrRgE1CQL6LaRkBNyJ3hM2HDhq5WNQmn4A2zTsD
	kIf+m49Pg1CgMnZD8r0QEmCduEd5gvfCDBE+a02k9zaBCUwvYAlG6vSouM27YeBT1dHDm68WE6m63
	8zh0Sk/kqhWBR4rT54wV1gUNgg0Ils7gGbD4jgX46g+05fXT+MP8WY8tL2+0osZPfk6xG0GI4V3yi
	D/ae5YQ6u9YsFoV4f5hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMV5-0000000Ej3K-3loJ;
	Fri, 20 Nov 2026 11:09:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMTH-0000000EiPx-46Zx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:08:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjslt3731129
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDP+V0k/153kXf8kggh4dD+QBvViaqb1sIHAp9EgEOA=; b=eMz1aTBho6i3pBSq
	Hi4uHg5OUvEpQoA3uxCsDvmA8GWfmflH+qkW8t+GZuMTZVPOUwNPHvbL7GF7+LgH
	idr0PtpVEoxoOFtKnrULAq9YderDyZ3IjY/qWcfHNsOHDA+ZfP98iKAd/oYrqMIB
	OY7pVwGF1jCW1myF7AxN4Fl64C3AmYzF9+tFvjqqQ3xAnZTsUSxz7n5yYs76n0ti
	DUYM9GR3p3ueUyf3lHkxn+CTymm51yWxx19hkX3ZGprikP9Ipg20PWukDGo1HM1v
	UpL5YNbZEqTXNgs/9qWTTvPE+ZtK8D5Q4lSfyQcGpf7aoo+IBXzGnr+f1vpSvXtw
	TvrNvA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4g3wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso808419eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172878; x=1795777678; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDP+V0k/153kXf8kggh4dD+QBvViaqb1sIHAp9EgEOA=;
        b=UU+7g7/REreZ7sEZvlTQEUqJ8bgChR9bOcTiJjILQg2HgDINot9tmgpq8fb84bJLhJ
         JQ/eUsZEnwUpiC7jWpN9PAsO08s4XoW2PVrgdz8j4sdKab3nWpY10X4S456Hm0PmTW1H
         K3YlM5RcKXpaNPJgUeO+ixm0D2Gho5pAcWRvomBnHe04DukUV1ZVG8SJc0H5ynQfY7pR
         mVySXsRtC7eHfWe6QHXKPCGuUhGGMDpmI42qutihaodhjwAM0zA5Juvk8+2QVoPtLwuG
         rTgema1MSkdcwa7vkVCQQCZAsdu7UOsL3Gxx0NZcaUaTLC5O0fJEcjpR968hgI3jQpU6
         Iq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172878; x=1795777678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SDP+V0k/153kXf8kggh4dD+QBvViaqb1sIHAp9EgEOA=;
        b=2lghIDEE5wgMSc0nihPfYuMpNt2UEFdTdrqm1q5fwkaFkel4I3DzaKUPJPIqqKTYbB
         Kg8b+ThNJ3jZfavQu4VjsPi3Apd1JcwzvXecSXAgtOSqgjts9vpcIvPEoOgE1dQ0oPsa
         LcG0DGEVsaOgipFzS/B+eQB9oh1VcqP1ZOD+GptHmdC0PGJP1SyGKNVG9LqzI4Jw3OC7
         2Xi+zFerUXPAWPng6d20kKdeDAtuiT5TXaUkMzIpwCqdNiJ/kgmamOawchFL2fE5u0qE
         EOklB3bkoCNAq7EqoveYUr4nZ9mNiNjtZ5JXsuIkoS/vwDRwHZUOHO6q4o2ekst7bPgc
         RAPA==
X-Gm-Message-State: APuU4Z8LuKhXlgrLB8oQ+0tlAACQzsfoY34yoRm2n8iaiBM0CnaRmvvs
	14A/Fcnlp8coBQwJnRa2ftxLPhDSAjt/wPrzWP/Cfp3BqoPqc7R7El167FW9l9zDGDmIBnSCnMn
	DETg4OdBc8f1MreDKH11r5XdVyI7rLnV221bTdG6IH38JXsNSOSXObo8jpyI4nXOcuxT4PgqTXR
	j9bA==
X-Gm-Gg: AZFdTZdMJSB/6cUS76sXv/6d7g5x/jOteqrMqtpmC/X5GUZiubE1z4PI8YIR8e+UEiL
	LH67s7vKD54qjj9+iBziyknncpPZA3RK7+qKZM6/M7JzzrqDRVOFOxLWo102Z4n0uQfmmWShgKe
	qD9bliSl48MrqrCx2o0HqVXswrluE+aQ3v/PRd1MnVnFamVKlIIsfaxhbsEEasDFrVwYkD09ahq
	AQRjC/CCj0+lj6xPO4KlQGk3hMeVHF5ddUywYkA+Ottlz5RtVH7kh5BDcYZlGAGItChkslbijKN
	dgEmsP6n3r178t06f/GQ/OkAUHn4xwqw3LcY6gVLNwsvAPf8zuTKrmEouFwULBxo9bt3XdpaTMv
	iEq5rq91zPzOCwpkRCJjuWYoDbAC15/xL60PjArXjLUQoe4BV9uLSBDrsjEW3r/tluJGPgruJDX
	5/yfNB
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7ab3 with SMTP id 5a478bee46e88-3860bd88965mr1185199eec.29.1795172877782;
        Fri, 20 Nov 2026 03:07:57 -0800 (PST)
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7ab3 with SMTP id 5a478bee46e88-3860bd88965mr1185151eec.29.1795172877051;
        Fri, 20 Nov 2026 03:07:57 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:56 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:54 +0530
Subject: [PATCH v4 13/20] arm64: dts: qcom: sm8550: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-13-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1285;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ldSuaHHBroDhtrYJz9kdhWBAKmQCNWPZ+kaSFsE2iJs=;
 b=1DhQPxDH5zxc63A6kUvXa+BgTYVKQcYTsBdn0VFledIHU8tPlkxAnaLMfB4c5tnQce7U5alow
 YYZNkpb7ofpBfaW7Umu0jWjraHGjx/Sm/DEEBpt/T4QaLy1jvaqnOWp
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: VunQ-uri7JJ2qUH3fpA-nMtbiqyefWe5
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b002a0e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX3KyaA/Ia2u/D
 aPnCwJ2gSqFjhOi7lkI9e3CxfnjplLlgUlcTT+sXJSKROU4P/HQfghqpwbBJgu1wdcLmaknTPmF
 PY0VH0Z/cS0XX+EPTs4Anz9kS//owxE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX9ts5EbjXAYpB
 jadiVG05qGh5OUKfdYJ4nlokkRiJwZpA7IGYcKPivVfupiCOd1gS38OmFeFU/ElYhRem2SlFTk/
 eNcTHAt+bg/X7FnlIRl+O07o9Nvz09unApC5pSSj7y69QrEpaLKoR08/PcS25FjzvZZmNf5h4bW
 AcMpl4/sevp9dD/JX9X5vWXccxPMH96VSmrxQf/tv46vU7ce3EcpwucZ0lOqu/PQjcPrMgUZ/b9
 G1eOUjiF8zSnKvoBAkHdWWlZNDPH0zYrIBrpW9d8Xt+AjCnMclEnif8eh103cRAxAY7h1H2m2wf
 hTrddpSYVNBgvi+w7zPLskmciljn8QTstsEnyu6rmJg9XQTELiw8cEeNCtlzbYqG3BEEdzvPbkZ
 XbbuPYEwvP7DIaIOlKALCgkCc/X9+9eWzNFI5/CMWu9CpGvZ7REyKGdde9A3Ek+BBgN1gKG63kr
 iH9jqQCElyIr++sn87A==
X-Proofpoint-GUID: VunQ-uri7JJ2qUH3fpA-nMtbiqyefWe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030800_191736_6E792481 
X-CRM114-Status: GOOD (  13.32  )
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

On SM8550 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index cf7d67faef92..d11691a7ba36 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2898,7 +2898,6 @@ gpu: gpu@3d00000 {
 
 			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "gfx-mem";
 
 			status = "disabled";
 
@@ -3073,6 +3072,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1


