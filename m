Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E34C60A261B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xqa7+ltN;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GTksC/Y0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKy4G3um
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=; b=xqa7+ltNp8J9KL
	kTyEj7UH5hwLqLw7kG58kfd99wrJrohxvF28jbI1657ZjxK5C+fuEL2qPv/6DE4sgCmk1sS/F0Ubd
	Cg+UKakLNrn43rB4EZRERcihKpS18hlhF2JjO1TSe2hM1uoIZYWxjN+75ZFZwymAzN9qlL8qYC6DK
	f1NIuAiFmla9nemGRehWIB77izUCbRKKcBt8fk6jbnPFTtUeCm2hidC6IH7zCGvDiXZkxE2QdeHqy
	TACu1x1tU9Iuw3Xvd4xB1z28qacxHtQEkwLLKBPUhdsaF5iAI9Jqpe4Re0ynJPy0VyEC5lNCcASmh
	uB72NIYOYwkbFC448ucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMT4-0000000EiEt-00He;
	Fri, 20 Nov 2026 11:07:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSw-0000000Ei9k-1MCY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk7sS3987241
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=; b=GTksC/Y0bKEnnPw9
	KWJMW/0LYKMseO9DPrOptuVo0CoIc1uzdDo/pGQvMUvP1Rvp9itBe4lxfI3YMrct
	hNlUsrpyWDkLVM2AharxTeVzkRw2n9VB/DT4wadGuvHh9b+NKRCRxql7pH7v2UhZ
	mZqqLkNFSwVCnkJYQ6l8xhsR0o3nVGXsD3cWmPJPdqWEiU2pL/iofmYDa+RErjze
	zIL/ZkJld/6+cX3JmMILKva6+SUTpEUn37O/cx2tHijkn57y5K4Vh1GkIqNzw/gV
	9xhyY7hbI1jHiKlk+CMPcKlAgvmcpMCyomuwfUhrzj4E/euJmn6bzVJ0PBKLPI4y
	D6Il1A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81438-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so1078706eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172857; x=1795777657; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=HKy4G3umr7rnZyj2BkWHYptblZ64C8gYzO5Jn67fR3Q+7ZMuwHs6O9XiFAz1X94BpH
         IqbbYt0pcgPa3wBcZqNBYYmupSrMsffgMdweNkBR1takwDN0z9eZyarHl1CMvWseuXtC
         ry4TceLRepxbth5S2r+Vhg3u0hPc9iCK99BCXMIVxNnx1Q1ZqmKUE95CndN28p7JcKko
         SZQiAtOsb3iII55cNPqGAWjrznb450gJkhXs2ECZBySXpoSJJvM4v0YXNi42toVYEbIP
         2uXNu7v8JdpzeycWTgdndI8yS1yoCtSpZjA26EkQaodxJC6lNcLgawts2I5PjqkpiYOX
         UYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172857; x=1795777657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=EVFeNKLuNP6yj/zdHuu7E4Im5k0Pomz4WR9HS6ct0o1S2nk0of1hjqwjsPyOrGzoLf
         jDO+sETtayBrCMgB+6qKxoLvvVacKtWTuEqpVWNi8flbTroTxkBT2hHbxs0XSLM4Ruji
         1YTu/y2YGv451wGdwueyZprjflwP8q7/47DWgLt+Zrimk19ppUpeukO/pSt+RsuFvBd3
         MO0c7mIRGd3vOFvL5VUGbszT3+OwZankRmFMAd+8XYIXY+1PP5DHptn7KiV3eve08bTy
         yfxIj7ysjRaExo7QPIKuPEL2OTgroe5m18jY7gLMYs/oKhn5F1Dg7GQUlRemjgzMW7+s
         DJCQ==
X-Gm-Message-State: APuU4Z8GeGi1NvrH6NmlJldMWdnqPisndUjqXNhdJU/YBju7WWSkr4zE
	Em+hAt1u41FHbC5sLf8eUeAKcw0sdP77oCGeh5O2ukyJI5lg42+en2YKdd5jmFdwlFIScVN8X2V
	jFSo8hIq4JT3Ze5jgfbBz++9I6kFasNNL/7NLgALDOr7BuFg3FFgz2I7sdISW6c7W9IZ/bj2C/h
	t4hg==
X-Gm-Gg: AZFdTZfJPoWHIZHkkt1WiHekiQO207Y65jcXyrya2+f3JY6L/cl1Vw1VaogU6yAcheZ
	15HMBbsA+/k4bzhEfWNm/kjjXbfMz0DF13CKpm7/F5I7ZxhJKSx8gA2OfPuA5+3rraluMPSBCJu
	WgYbDr10bhARe0dSBFjf4MiRG40/BSUf6nHG2BC/UzeNpGDLVctwHeGRkWP5JRdL7D0DS2e78bb
	Cvb/fRTfLQI57u6hB0yfFtG6YgHbdlEJ0ti3oQnRjztQGTVWM7NlfDLJQWHHOt+36KatY0YxEnx
	Wca+Pu8e9SGR2sscl1n+t9xC6zcjz0EKPNsPr5esonGGWZk1F9Ju3Sl3p4AqtHG2k8HGWi5ZsWF
	4RPO6EDSM2SV3gx0wb9b+IH0CD8UIzMHiN9f71Zdti0Amw82z3Z2M9sdWdYye/oQrhqBKamCb+t
	ZFIngI
X-Received: by 2002:a05:7301:18aa:b0:384:eec:aba0 with SMTP id 5a478bee46e88-3857073eebamr2356052eec.36.1795172856943;
        Fri, 20 Nov 2026 03:07:36 -0800 (PST)
X-Received: by 2002:a05:7301:18aa:b0:384:eec:aba0 with SMTP id 5a478bee46e88-3857073eebamr2356002eec.36.1795172856199;
        Fri, 20 Nov 2026 03:07:36 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:35 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:50 +0530
Subject: [PATCH v4 09/20] arm64: dts: qcom: sm8350: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-9-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1040;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ifRBUNcG4S75b7wOEESAYY95LUktSUoyNzDBhGxm1EA=;
 b=KzrRMDQ38ir/SxKkvx+iCgru1CcWgzgR7RMiwJB8A/IB8fNZyYJbRgu2266qsmg84BVFLa9od
 DKvONyqaL8uDPLBnrRXftBGgOY2FyIAJWqfqhcL2OUH4V1i97q6YVJG
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXzQRa+5AWrNtB
 rUg6T6z+toZdxwdmmX5GoBgrPkY3ZnZDSEjU8No9QJ4H03lw9x/KiRxi39sEb6nzbnvWIhEQLzl
 jRlIk1V8snMCdD3n2iiGz7sImMTQmux4xNwLnIZjubY0hlZrgGeTtlLj1K51T5ugnCh6CVD19xZ
 yICZ+1Az0ATsW5XZov3UaxuGyZe58eqVXlJ60qyE4ycAOeHvGVW0uwidzjzi7n4iXvbJvSGQneA
 9tBEZU3V/CpzfpXHTZyaZWtQK1s7oSGfowej8op+yn9Sp1gvW2trCs3u5Sq+1vB4LiASJuZGsvC
 nV3vqfMn3FVbb8BmzxjUZfS0h5Fwl0ENnZg46qU48/sB5anagQTh6BpK2quzyS9lwJKjjaLlC8v
 4xL+PXCptrBJqmVT5oVNo3VFpoamvGZ8VcnKbnezm1U3J57wm7j/y1EgwFNTNkdzsm+QzipEv94
 6fX69PgvQ7qgb6gZK/w==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b0029f9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tc1TWAvYerzeY2VvnAsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: OaCklSISMKxbFeCjE3NitdArOitgxl6p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4Sgv43W8Duqs
 gz6XhdMlCatp+yfoAjCdohIdj21/+Rxo/d34kghYtBlLgb1WTU3h0hX1+78kOg3W8S7bKkqZER2
 QobU6TNocHMz/sYQAe7U09aqWzpRGDU=
X-Proofpoint-GUID: OaCklSISMKxbFeCjE3NitdArOitgxl6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030738_377965_4D4C3B73 
X-CRM114-Status: GOOD (  12.07  )
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

On SM8350 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 7b9966e8fd4d..4edcb06dbae8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2566,6 +2566,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		lpass_ag_noc: interconnect@3c40000 {

-- 
2.34.1


