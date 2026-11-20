Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DD560A3830
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IiwIKqW4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nn7w0tce;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jd4bovF1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=; b=IiwIKqW4JiSnL1
	jpcN2lIVaeURQHzmMGL4Jt4B0l3JjtWjvSMraRResl8C8wjBLm2c6C21/hkXty+hwTgfaNZnPoJn7
	lJYeP+vV4GMRnR1Yx931yQUjs71zQuwMQlgSFrihvP/S3HfGFIzb9CXnhcyXkjzentt3MEvalKIpm
	0xUR2WC4ZtNYF0BQAx6iAneF/HWeHkMLSPjP/rAvFlpEiPv2UJQwyynaaXSydsYdCov3XKydj/muQ
	nm3UgjZutRgXgSX6GZt06B3TSxDZvhVccEyPsitGAiScxBF1ac62WHl0RKoPhq4EDkOyHq1wKICyJ
	S6e8aCl/gtHYCU+BXLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMT2-0000000EiDP-3DUF;
	Fri, 20 Nov 2026 11:07:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSl-0000000Ei3S-3GpO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkEZW1017083
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=; b=nn7w0tcezkDvJ+TY
	YjfSksKFS0SWd13TFzlra4358qzIdfzFHpyCV/vMizicEBW6nYs03wF5hYszYvEs
	5ZPhZLoXnfqhdEKfXn0yNdi6u0iG1qxcomJmCi89w3JOY41K/MmGGkKTQSuF8DK0
	n1aR8iZQB7C/WFHXw5NUgB3gFbm8JNTi0AnBWppd2QxS8oDk25qmUMcdVCxM15x2
	8KNTpfDLCGWsemvkJO6PVVtCreXtDZ6MxoJbi/ExBAPU/kF84EF0oJfcCDbDNdrX
	ZIInop1LiA9xtiWdFXANogVzEb07z+13yGvg+6bqd7YmbzGHy4afdu1kDHMYb3nO
	6g8Dng==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs7gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1147389eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172847; x=1795777647; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=Jd4bovF1YPbMf19wtUEnarUlYG3VlBjvtKOMS9Raeels9hkoLB9MGbr0Ub23VZkMk4
         39jbL68niTf1aHjAqctK508s4teSs3M4zicm29b3bV7S2zxbQTuV4FNbt2c2mlqLTbau
         Kd2xThAs/3BaVd7uttK05ZTbzPETprgnSxjKDHLViAHidzQbkPnz6OvSvaMPGfYK1KOH
         FrJdwtCdn1az1gL1UUGyY2baPznXUtS3zBF56I2M8OS2fxRWHrTTIHCIjOaTxN0/ga2w
         msN3vKfjnSelBar67VDa4frISF/YvDJhIQc217wK5YGiKqhnAw6Ius4NLxbXR2rbS2D+
         U1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172847; x=1795777647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=e9k/kZy5ETjgZZe8DCmuL7KDh4ZgmoI93w/QEZ2JLaqtvHHTqMOP6tt0Iid7n3c4qo
         r2MwLR40osELuWtuLdrHzwOIXJyTc018LJHJ+rbu4zDrcpO3Eh3Ba5dxJOEWjiXxtbtu
         ETUZOPUrOLcbgwiy2Rmq2QrOyyx/F5YrXOibDkl0INKkE/Q/L9rWHEuuRDJy1bu8FaqO
         j6Obatm5BuXxfC84uUxI2Qc2ZoQgKpiAULwEqeTIuz/j3HrrfljF1iIXM0sXM15Iurk5
         II6cvqHKp4Atl1tksPDCtNebswCtMsqJOfNk/nJPVDRSv0RqTh9mn0MesuD1teikog2E
         Pfhg==
X-Gm-Message-State: APuU4Z9OVtdgbwr6CR4o/MgrTHH47/RFvcstxla1Q5M+goaLopKmbcNL
	TaI5qbt2tWUcOw9o/tx88K8o9ZfAiZgU+LZcS7T4D+kfIpUcVHt0QO1dvoCcIrLpbmdkH8Ao2Fa
	cpipJo8EkQZlX14Pyu7hyLwdx5sI983t0mfHZeSk5+HpMd6GWY4t+vR3xrDCpZ0CUZgAqQy/1Od
	M6ZQ==
X-Gm-Gg: AZFdTZeod/rv6txzdqjMGvZJL89W93kzxRVsywqPdVY8L5lism1AHl2o7WxzfBDXgEP
	GzA03z0MdA7OPBSp99AQr2XmVWAAV3SXWwYJDFoPwUi17uxINCAxmGPGaFwzBWe9pPZDqArxEoV
	9ijQ9Vy80k3W+1ppQJgMMRQCPCDLYIA2bOV9qnEy2U732JsjfdirXMXzZimYAwDq1yc8pgpAlVz
	h6JPhIK6paiyiX3BxF06b833hPI8ETGj1894G/x4VfKhbD2QRaPhmzraZewnsk0KdNXoY3UASkL
	qdyN4nhlKJSL+zFc62rgAvhpChCwzMNQnEDw9h248//YBVs/oOUw3MGBZ9Xm1IY+fegeUAEVu8r
	eHZK2E+E/5YBwkEA0pduvlEw9+R49jVWynWPHJp7FGGmXnJLT4uEZkNZzqmgsBM+kA8VxsP2tsi
	OI/nrr
X-Received: by 2002:a05:693c:42d7:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3856f84fea7mr2428863eec.16.1795172846494;
        Fri, 20 Nov 2026 03:07:26 -0800 (PST)
X-Received: by 2002:a05:693c:42d7:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3856f84fea7mr2428825eec.16.1795172845799;
        Fri, 20 Nov 2026 03:07:25 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:25 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:48 +0530
Subject: [PATCH v4 07/20] arm64: dts: qcom: sm8150: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-7-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1053;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=9j6IWx76cjPCAQZYybv4iXqHVebU//kZAlxNICMxwEI=;
 b=Y/oksJyJN6vOeMPpNN+xuZE9wT6hWllCqRyWsZ3CEZE7TaASQPRSC4ChsqkoGOgosYBHuX5FY
 UxlVzoJUcvDBx0MHv4SU3wTUjNViJjEt0woasGqy7g2RY7FnPEEWu4j
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2TehuJSvL4Sz
 XkukihRmSDfS6MDYGK/i0uFA3jpqUwuM2tBTyKVEhzB1aMCXsa/Gq8bJ7JvanFBrz9gFvn6y2KW
 sP1JPro88geWUkINHA8f6YTJR3T7n3Gupv6c3PYkr4yt5MDJ73ohCZdZT3ixeKBeF8mb5amwgXq
 xtAhgk3QXoRybucKw10SOT8e9nuhQ9gSCz8toTqskq5uZoJLdS43DuRw5Zqv1CAsUlxfMCEVNTe
 V/jQjPKnq5KoCCtLe7wtaGToKOOzCJuXKX8QQKk+ceqo7HOag1YXWOl4pX4WYH2lWfNNr0VyXJw
 /5uNaVWSLdEKNla0sdZ2Swr+849U/h5Fb/VrWKukgr07+iwuZVWju1Q9Y5TpxRXEInbwxmCk7xK
 7qiv7bHTA8LD6Xi2E2YfyC6qn2eNlLfTxz3yu4FCUKZJb/C77ZTHFlQFcnoDVVdtbioESklmbSh
 VbPv3H+O2ce7VOYYm8w==
X-Proofpoint-GUID: jKMmQ4bMz8dEGln11IhqsIMGRg4b3tID
X-Proofpoint-ORIG-GUID: jKMmQ4bMz8dEGln11IhqsIMGRg4b3tID
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXwyLJErSOsuBa
 9qGH/RGGwEvYPfBrMu8RXqcJ5TUHdmCWVIz64U1zpJ1R6JTqVtpFQfizX6T/ONE/Q/fikxK9Xc1
 VYIAnGdTzg5POwaj93eQ9KXftfAisP8=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0029ef cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2mEde68aHbpXMYUSS8oA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030729_208417_BA22B9AD 
X-CRM114-Status: GOOD (  12.19  )
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

On SM8150 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index b9846b424a93..4b2ff316db72 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2396,6 +2396,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1


