Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F19606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dx+Rp1dS;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eD9RHG7z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJc0/Aj4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=; b=Dx+Rp1dSOmStWm
	i7Du4ssDkVf8cyGbcjPIloS9vSsRWUvM8tPOepkdExVVQ0IbMmgK9y186shlEFCpuyX7aqRh+xMHS
	hWPnUn+CIrQRgCtFnWzz25CcD4q7xFHlZ2EXwHyOfOBFJ8O7GQM3BZW4pBCiaulOTMekTwp14v2bP
	MuQ6PDOOCDkvWf6UT0WURxUhz7hfsAggLqd+Xq8lxqkgzTO5Q8Eyz6Lg/tJDR3TTjUHm64Ju6m4Oy
	qBvmaadMb06+xjQoMgrcut62g8oFUiocL1ke/iJyD+y9SaiOkRStqIraeRxGt42NC6wyfurff2wXY
	Ri7fy/vbfdVDklXf//AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMV5-0000000Ej38-2PmM;
	Fri, 20 Nov 2026 11:09:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMT1-0000000EiBm-2LEN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:44 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjq9G1681886
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=; b=eD9RHG7zNlekuLQO
	Umc9O8xT3sNIDqKFOpEJw2iDgZ3UfIvS+T35wGpJlX84qZGQC+eeIoUvJx/gnzIK
	Td8+A1/IePDCjvYYhmGwZ/a91lgNKSzXfm4B0oEksUvnsEjqmq9q/O81ui6T+2du
	ZfjLYl38qtj7dwtdRaXN2w48AVpxdhG1ig1/BwoN9eXvxdRXMuOCyS08baF3/LnM
	2wxO8Cm4QZr1cIpLNKHcW3cJzRP0mg/mSEzriD8CKv4oXCVw/GR27B1MxNDZZtZB
	2h+PMVP+NyI9oHIACyZJhGWKA/JPDCDXVuRTH1n2z3QZjJJEfhinBUVZKY25aNEM
	Ims5yg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t3xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so823047eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172862; x=1795777662; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=;
        b=JJc0/Aj4vHzAtWWVd86DukpSO8RSzdf2Miv3JSqWgJPoAbtXO/Ag/o/O/GqJhl6Y2Y
         uB1aBOS5PMjWE+4oc4gDq4ZXa+XNPawQIOfKFKsPq7drfHsW3yqxtpJhNjvCSU9/Mppf
         PVsCIUPa3fB5G9SzzDJQ8u7LKNp7kXS8rflMfWLE9m9yvC99/SLKH7rZJYcCBSnBNDI7
         MT2P1tDIHNbhSs34xW4ZAKOlzP8l5e9KCyR51s0MdRZLbJWXPMyfKSfZdTzDzYu2sABj
         hrizvjwtNTtcdCt9l41LJTjUkeYrscV2kRifPNNuf7pDhHho2iXRkvKVIfcIGqa/ROaE
         JYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172862; x=1795777662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=;
        b=2rLGb3tgVBK3kV7N7LhLzTKpawgbvIlNS0bW0HBis5KXSlMB7zylRG2RfcoCAbwECB
         H5jkXk4Ux+ToFZwgd6wIWuJC0aGkrFFk5EgbJJUfjb4WiX46/NqPiDpBeJlgctmTEYrW
         2C+fO4jBkfFizAxQ/fAlhhb6HeOGJn+/w0GVFMZMPuGQexd/IwkzhM8oxSPaaQFoqEJz
         4OncUnUbVQ9oEBV/JV8bx5Sy4LRdJiWe7IKLVbFB77PW8+kKT41Xg7YPPLA4B3DUqJCx
         6UG0rbLgiJxu7iEpMs5bw5Rz3x4Zd4qGeef7smGKri3vRcniy72GeSimlr9kMYcXCk6B
         NMsg==
X-Gm-Message-State: APuU4Z9+bjxiRhqyq5+mCeDhwGBp0EXzn876gNspy++p6WrAdshyuokU
	qtXOFNuDg1Svq3/R8oJrxBdjz1OrY2hR3HwqGo06YxMJKsoh/Brksp02GDAV4uyw/nrJ290xVDV
	9iT1dpjRJvZGFeOO1zkGXoctyATpmHbLxVsxwzoOdCmF/8eqXLkCjBNYrSPNqhdw6/k7ars0WTL
	XyiA==
X-Gm-Gg: AZFdTZdfK76lQqwznetTeSZLRN+gKcwG2muT/+XEXG0ZaJUr15KQnB2lvXwAzmqn+FE
	UiwIQSU3edzrbmbu+NkUHnLfg6lfSupSpwEkTklhnRpFSXCAf7RZqqClMnYryubGrVRu3eP1HGT
	BGNct8+30DdksWeBhVRZf7Hwc3YEOnqGog8h5nCxt6NNWJAmPfaEbxX2NY+8jLceyYZgkr5gX4+
	m8ae4f08ZlLEh1s3erUdKcBQhqFf+utU6d+oKMaqglQel23GQvRqf1NjLO3utxaoBHWicDgjaN3
	DEwWz/sh/IeHvnUINmUWdflBsNJrZoK1wLjrO3yBHnLLueCnFU9s3MtUDeeA1JAZOwiGxX2eN8B
	rLs3/R+lWN3+9bul+I11eD7xpXqKXtexcsJRxcORDfLpRsrVOVyPkVcm6K//nr4aqcC7L1WmV82
	CFycpd
X-Received: by 2002:a05:7300:f794:b0:381:c31c:bfbf with SMTP id 5a478bee46e88-384b496a36amr4160549eec.21.1795172862127;
        Fri, 20 Nov 2026 03:07:42 -0800 (PST)
X-Received: by 2002:a05:7300:f794:b0:381:c31c:bfbf with SMTP id 5a478bee46e88-384b496a36amr4160488eec.21.1795172861446;
        Fri, 20 Nov 2026 03:07:41 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:41 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:51 +0530
Subject: [PATCH v4 10/20] arm64: dts: qcom: sc8180x: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-10-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1335;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=BJI9Qa+ALwqIsUj0DfJo7B+SV6DPkM10cbLytxJMbcM=;
 b=iDWhFdAcUQz86qchqaGgo72B4dP/xA4xeHvIsaSCpx5fY419WT9WrzE1fBkWEtNJC2d3KiBmo
 LIRDLJ0PBAlAUyr9Gm5xL/jT1k3Sol2uGi8bvu3WZCc4c3ZmPDmZ741
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b0029fe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: VFTLZDXeNDXGIjdi5ioUYxjzPWBHM9xu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXzC5gLdsuNjKS
 vGekmoC1cuXx4sCMMy8/sBpCgAYFLzsKOfJKDPDCIg95qYDbuvH7/tqvGIL+ba2rTPQ/GDVB+d0
 9CFgY1+8yuQs156XqS6VDcCUgJDjpVB/GC/fhqtwhi2oJZqScur+nSQncZWmB68dwMZDM1J1C37
 AHXQhWEIARHwXUXXF6A8aGc/GZ/gUdbdKRNrbW2v5BDu2Fh4iccJoaeUyhGw0Jp5RKd7Dx2J+Nx
 sr0LeZiFEOC9pCCo9rebK0fqHrELKPrVpgzrCM9s2wZkVCU3trrfL1p99/P6y7y8jNNYixmQeam
 +jjM6SnDHCYwA3IaPkt3zAvn+Mp0fixGPrWjZiA/2ZEXAjfgmTb4AHWfA/0OtsAJuDOqVGK76nn
 sLsu80OB/6/OkJebI9D+66868d/E1P4+1AhZRwUG74w7oLyQ7Z0o/VBrR9jSuGPKd3IXjv3Kdps
 pUply/7RuHqg5sQyiMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX8G/AQYeiGEnS
 M0j0Ard+rWsTWWgaF6jpr5Fids65yVRQatHZFoHAWoI/lQ+lBI4LccHS3Pebp+usFQeuyp9k3uv
 o9i/ebixCKsABL9JcMsS4X/EYKQMRnw=
X-Proofpoint-ORIG-GUID: VFTLZDXeNDXGIjdi5ioUYxjzPWBHM9xu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030743_675618_F933B8B4 
X-CRM114-Status: GOOD (  13.30  )
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

On SC8180x the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index be79608b7161..88a39e5e8f07 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2280,7 +2280,6 @@ gpu: gpu@2c00000 {
 			operating-points-v2 = <&gpu_opp_table>;
 
 			interconnects = <&gem_noc MASTER_GRAPHICS_3D 0 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "gfx-mem";
 
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
@@ -2410,6 +2409,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1


