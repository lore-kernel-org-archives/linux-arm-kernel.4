Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7B460A2618
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yM27VORK;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VnN7/0Pz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YknKknGn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=; b=yM27VORKhjofsy
	hD8O82D0RXVmC9KQsoR/PP7GXi+tnwdHk/0dqJztg5y279ra9AGZh1d1/NczCR16lSAQ5bN8cbQLF
	WIW3ZPrvrkZc+hFEz2CsS/IeX6QavYXw3XiwxPKWz63xholwLbJ1/ivsAiH91xwEtv1DzOmeosik6
	ojhjf84qQzrI3AuB0WM0AHuiZ7uaEnzp8sb0YMCRj+rP0b0X7UW22656IGPTV3oYiiBNd2zRv3/dW
	t8mPz904D+b7nZHEbelFrkl9khhdKZ7sxLqIN5oj30VstXqvvPnWe5Lv0tmdQZtbv31r1GnaOoiki
	An3ZZYjIbRqKsY5J2swg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMT3-0000000EiEA-0ulX;
	Fri, 20 Nov 2026 11:07:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSr-0000000Ei7u-0N5u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkQ8h1017513
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=; b=VnN7/0PzTmZ2Un/0
	zIrk2N5Orv66HzLZe/Es24rOM2ssM4YtTEl8Mn+GL7AgPdhGZ6dgHOioe9vZZFNs
	DiAV59MKWHylvv96yU1SPzSML8oTJ/v+8yldAv4WAHsTGysNjIW3K47gfW1Rd+HR
	wcA+IuMyvxHIr0Jb1+5Kb4quagR6QA3l3kjB8TYAV96zHyaTrZwvq4qvDnPSkQ8X
	2QI2Sc9wsqfN8EiuCzCxTHpDgvkqpfYwjQPZNei5PvwtJpIGpmD25Ovkjob+hqRi
	Dc46oHG9t7DnTYRVhu8cix2ih/OWgskDTtlFeBnvVnaqVz1i3JsPBTDNTNV98adA
	Ue7gNA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs7hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3854627c1c8so1078614eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172852; x=1795777652; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=YknKknGnWlqbVzOFkbelli+1dbZ4QqiwrTokMeDBvq2xS5+K2JAT9avsNDV/P/6Mll
         PKY0yoyPV4pqz6qCGF9TCzn/JFy+0/c63ri20vsPvrkkeR6DhQ9Ai7spzCE88mAoUdt3
         LOr5/MPFOQJFNKnGRoFgQKe6gIvLKMCFUSA57yH8vs2UdEilFCeHV66rCmopjswIZb3p
         tG2xUuaM+l5/pyNcUW/u38tooWtT9zDCeYcsr1qkZm8mw9ekvOBkm8wdroFXkehLV19V
         Ybm7rdXHSlLtBetGzwyHgPxFfIiE4k/QdD/FuDjPYd3QsWzRUGtO605W2X8/Uz0tkxR0
         0rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172852; x=1795777652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=xArFylLLp3eoBrfUaMewGEmpjl3aVADWHX3W3kdkWnIAJM7Bn1PBaDxZBLa78rN+eG
         bn0lP1dUI0J03eeAAE0mloD5bP6ti3z0wWcjIBHhtcB/hmV5P0KefsoS01bXg1r5jsu9
         NyfvX+KycJTLsyTuWgiA3piiASJMV3WSp9+UQ8uviZYK+ZD3HyC3KPWenh+p9KH6Uj4t
         RJGvIzIbn9/RlFHXLteLg5pgAZqUwdmuKwczoljtV/jzMAouKpBh75S3pNJxOf3XHDpi
         pVpFiH5ceYz4zOgaDZK/wps/YdwXezS6/9/1fwA0bBrPQwwWWHom76JQF6OVQE+3CEvJ
         NDzA==
X-Gm-Message-State: APuU4Z/ySSOQacxKdxOTYjzyYfWZPSqBf5kf92D2BM+OyrtmeAdYq8aG
	6tH6wn/yenOcDLyrvHBlF6uW1CMQGF5P8e9i2tNXdyRABTJbbYbx64vszB2tx2qvzscRGPgGwQd
	K1fF224cofvR8q3HdLCzQu/x7Lw+9XlCltwaHE1VkTg8b6L8rz/rEhd0EEIt8/DdybhguJMFb7+
	ylxg==
X-Gm-Gg: AZFdTZfPLq/c4+mtebYwq1UHyOIed3HY2uERTKAjQqN++1cOqURzxOE+wvuAmcMtbww
	rmzVcvoEOLgu1i8uyPX1D/xLBzHs4izmwA+lykZWp7yw3ItQiqPHPf6rDBVtic+K9BgshAMnfyI
	GBCjIrhuPZ66P/BI9eSRseAYUurVOR79WYRCldWVH55roHAN4PttWXx3LR1kP7EphzooThujz4t
	BkN9Qn4UDgYOBezrg+A23eYpUa3CThMPfNWKp2vD4yH+wCxFPDGH4XP+GGTCV6dvk5mT0/QPWRB
	G1lRYONcmzfDWFmFITRnAHsaieM0xg84ZndlbJc5QlDyp8yoyuQtXUwGhCMkGiiEJofkznFcxyZ
	yEalzhg8maElk0UQ3PV+lTC1K7JwdOOpuOupLdvg6Enx/mU230OQdoS9Vi9tW8t+DoCSIfnlmYo
	C28Khv
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr3103036eec.23.1795172851684;
        Fri, 20 Nov 2026 03:07:31 -0800 (PST)
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr3102974eec.23.1795172850989;
        Fri, 20 Nov 2026 03:07:30 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:30 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:49 +0530
Subject: [PATCH v4 08/20] arm64: dts: qcom: sm8250: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-8-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1033;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=W3R0vadqLaDaPerwJqu9PSx+OZnsGkbm84YuXP3uSZ0=;
 b=2QSTYCJTswayLaRtH+B8G1NNWBpnaZuzUwYJDYa5ujCqH09DMFxaY3GcRjghHbNwCvQg3CFqR
 pHhnKyLIK8zC8y+M50UC9afzeFvT+6TpYpA4Z5kJbURrxQvEsqL1Ibu
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX851u0gTWrF1F
 LgnlnTbNoTcHaALt3ZGsOxNpQXS19OnI51qDwRZAQXGButMPdkFMEQi0IJKh0HglYp+ZvwkY6ZP
 vej4rks5GBeHkml0irscQ3JWiukeLFG0IFhWtHAtyxzcphqMyStNO7sd1ArhhcBj/coYt6/M6JU
 /r/7Ef//GVzx5cKPO5zH5GHfz/ILY+gY3DJzVYlMKvgRQD7U0w+YfrZ323gLSAhFiySir3ohvAT
 jzdcvJnxbKtpckzgQ5XKZLMTljFgA+R0JUFN1cue5O2pmE/6KMEPIjGxWKxzv/4mbf0vYshon3o
 2/nmvg6XkfMkZhdA4CqaLIi7HeIlhQhR4tLxC3cX/ex8+fZBJHvxGYX/XNMbk0KfnmPD1AOOx4p
 rEY4qVnUYgLVrd6+dY8jmPrMJK0vz9xv7gX9PCXn9MrwosPpTpk3S3Z9QVWC/yTxeG+qqz37rdF
 uMLiLBsK9bLcAlPsQFg==
X-Proofpoint-GUID: BD7b3Rx5j0j-HsHr03RtQX4_W5u9e4y6
X-Proofpoint-ORIG-GUID: BD7b3Rx5j0j-HsHr03RtQX4_W5u9e4y6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX7QU/HWDx9sGz
 vJBFuVh3/NJQMfv7XPDdGfrQFrongbWbzJGdDBc/MsuH1l2OBwvaJYnNCbuMRsMuxuRmRZrEg4b
 gdfuVLXD8Z7c/8uiaxFx7Pb0DSeqKqc=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0029f4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IeQ55TmpMpvzCWFLjAoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
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
X-CRM114-CacheID: sfid-20261120_030733_221858_F5DC807E 
X-CRM114-Status: GOOD (  12.16  )
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

On SM8250 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 992284e64d38..3a368ef7c22a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3089,6 +3089,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		slpi: remoteproc@5c00000 {

-- 
2.34.1


