Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB4C606AA03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EuhYpu4w;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m1CaV0Px;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KsRv3cNM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nVuLCdGzCnBZ9fXthosPaTRy87UpgIN+crA9CifM16A=; b=EuhYpu4w1uVw+9
	hA++6MynvpO5HOJ0iueubk0saiUeR0ItMnGw1vNtD4YwREUCoudt5qVQuIsm+yAlg5alh1kskSxyg
	3tMufU7QCa+rOQGDM1H2wWK6AhUP1Z42qmst03cQfSWnlHAl/g3wSHpu4AneCTdghXBB9/610iRp8
	YE7f6U3Sjm68CVxEiMl9MP0nsOJslMevADejWI8daU0n+PjlE/uYuo6XgK8ORI8KRsIkWNOo58qo5
	Cma+W9QnCkqa9xDMF6/VzdkMn+su4gYwufUqfDDrODDiQpbzRJo/WVLz9n5FMbQadrgrIOxKDmZ7h
	VEzTaid/ovT2u4NDCxOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMV5-0000000Ej3C-2pkF;
	Fri, 20 Nov 2026 11:09:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMT6-0000000EiHL-2hgm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:50 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjohD1462863
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nVuLCdGzCnBZ9fXthosPaTRy87UpgIN+crA9CifM16A=; b=m1CaV0PxVcpSnDiH
	28HPG+7yoOHUsD6TQ/EMM+wsgLcFbA6mkd7Xv7572Jaq4kNDPtW329NS7BakGtCO
	nrxFpq7LsTV/3rrlRXweqMg7ZDsLj/EkxXKMDVS9T8Qe1xEWpX5fitey+N6hPETm
	vnlpcFqRFBcJ1iXbRmlSwsRoOjGiicm6NyCcQ4HWkoOtbdZfNV6C89IKE1r1y/eO
	i5ccwBVnU+IHv2iFd7OgPgDvlFfimE1TYVwMYilSA5giPHg0kCNiBmB5BOTHh3Tt
	uGjy8uaRyQ+4slp+ZzTZwn7ZtP5ybm/WAkO/OpGj0XMCmYiu1SZ1p9cHEkmzURPT
	PntkIQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah5sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3821eb27024so1282482eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172868; x=1795777668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVuLCdGzCnBZ9fXthosPaTRy87UpgIN+crA9CifM16A=;
        b=KsRv3cNMSH8uyYam7HWIiQajtciFYkHm4Q+FBnaNnCgu95YWO9JP4PmMA6SA1iMJj/
         mHChMREu3iTCCa6x+z99ThdDTdp+LcTrH22YIS4ECeuso2HEUQ/LQmqnJwSD8LiauTH3
         qsqbGrmwDLTQMITb5/p2VOJfGx5iz0YW4WBJrOh/2fN4XwiAbDmTFa1nC6f3GPEKiqEu
         fFWpmULlCEGF3i2Y+757ypg8kFKvShLn22Bs3zpY8Htc/B0S2Wh2Td/f1zZSglp4Fu5v
         GIYx6DN313Mx7OVM+yfPVCxKBKBM0J4x+GGffO7w1j3S1RAS2vfEgsyGV1oh331j62QP
         crPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172868; x=1795777668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nVuLCdGzCnBZ9fXthosPaTRy87UpgIN+crA9CifM16A=;
        b=H6Xo2utY1uJx3UcF8b8EDkeXSD6ZtKUL/12OH4GoBKrJWaHwc7Suhl6iDPM2ShCWhe
         c9R83pejMxwDF2j3TKr4SFSwG/oWjjIdHQlShKkUlWkVzLsb0nDkcNllBMYy8e8t/hMs
         GMfH0qUUgpRfKpi22OxQYq+DdntCmMwsLZhKPxuN0tDoykNkfn4pP4csX2W3YFe322lJ
         8DsxbNa2patE1RiOj92tzjszlPFwHn7CHv5+z/oLnd2O23Tdfwwg9/e2HYnFnwChGS4n
         lSw3LB3+17IEpaEE12YXqLMv4gZJpuxvWzGK5dNi13lhzFdvSEnj7i+nBfvTrKgumolw
         FekQ==
X-Gm-Message-State: APuU4Z814nI6ri0/OJb90BT2VYvtGGehklqQso3Gu9DNe1AGkhfXdjSX
	u1Pzn9LZ0VdR+cqwfzeFDTTgbukWlDh9GAqJMuDmRRKgOI3VYv5SNAdVDeBJjEQyrdGnT14087V
	R4QJndUeKyo+n/YOP5zgz5vM/VBxHoUBSzUKA65y8gbJuHJHi/2ypA40YuEpWhheh/kxbsh2V9t
	6nLw==
X-Gm-Gg: AZFdTZfGMLvy/c0y3+KAWQl5GYoEfRfh1pkaahjxVw/htfQ+vkaVUXKrc76TSXWXcdT
	mR1ZKcy860VqoRvNcefXM2C/wG71bBsrtiEJ278fMxoKaN/qFh+a+gaxLY5ayNM6pN3jKDnQCjQ
	Gs4V93t9Xpsr4g1mnhv/Fth8VdNvrbTDoq4nra4Nwaz9YoTz9HSgu0MKD+aE/IQYUVU5vTfev29
	t/pJ1E1ccWmqLaXryqvBqoSrNfvMPcyTMrdO5jvFTjdG5LGZwZlmyBBZTeZi8hFNsxZBVonKtap
	kaHity6MolvaiVZykHffxzTSfZ2imYltsamkILKDGASHtKAP2GkQirCt6b77Vts1RY0NcXvP/L0
	XwP1QQCEQzefhEgVd9i+FwZ8hiWV0rZHIblMIAM2RgP0ohtgayfZTauwy9V2V9kjbdkuOTXsOkw
	F8go7n
X-Received: by 2002:a05:693c:884a:b0:386:319b:fb11 with SMTP id 5a478bee46e88-386319bfd2dmr534044eec.1.1795172867360;
        Fri, 20 Nov 2026 03:07:47 -0800 (PST)
X-Received: by 2002:a05:693c:884a:b0:386:319b:fb11 with SMTP id 5a478bee46e88-386319bfd2dmr534006eec.1.1795172866650;
        Fri, 20 Nov 2026 03:07:46 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:46 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:52 +0530
Subject: [PATCH v4 11/20] arm64: dts: qcom: sc8280xp: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-11-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1283;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=53qBBgRq2wi2XcZ5N+kmy8C1bgB9H+kOxJMHwtLtMZY=;
 b=TYQkalhmPfRM8mAGJ9GWhGPKxKVfz7ouAdcsaPaImMCvOGkdYQ7Rs52zM3FA3LYB//N4CyiWF
 uha/csTA3G4D314GdglDhRR7b1/8Q0yEdvi1WsHRpeEW5EWV4GKPUPC
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX7NfOAYRtjTXb
 QmMsM3ybyuBIYnBHHl8ETcJeE06Nhn0UNi9BQJ0UrJty3DUuw0f+suyH5l7oGjqIqhfNdOtCN3a
 zfugTyQxzl7JzLH2tuzI56MK2cgjisWxWiHw3CedHffBKRV32yrNNYpTxHFIIFiwxw+MJBIcB/i
 al/BfQLrG1yJ4ZHSthvtjDuWcEfNL0sv3xenhcJm4ozf4IYj/FD3W/5A1MiiYxrgJW7B55NfK9S
 kWBz5Cb+ITez2xL5rwimpx8prF+3c7j1vYnR+DWGK4fr1jO6xv1Wa3F2UQMUAp49CWxVGouNzzJ
 GD5Xt+7Sq0wmK/+nVKSbGXB881I9J7jI7rlkhnKBXR7ndw/YzJq+RkG8+pNzhS7PGfja4FpS54h
 aNEaSmH4JfBbMemdb7GVyds0MgbJIUlQ2IGiOdlLl+JO4oncniZ6gY3mfmPsa4wEnr8w4uleEzV
 K2BZcAkJW5aCzcrzToA==
X-Proofpoint-ORIG-GUID: VP05K2sAeIOEWSmDQW7cdsH40k8SHjqt
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b002a04 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: VP05K2sAeIOEWSmDQW7cdsH40k8SHjqt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXypxwJqmLLMYx
 rCOTlMgN4zojlghTXLcE2bg0FxM6TqF4XaSejrgxdeNaDg1wVHAKMmKN55l0MdCmc7H97PVhRVv
 V3m0Jdzho/ir2DdMJRfiONCFGm3b7KY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030748_752640_501A4386 
X-CRM114-Status: GOOD (  13.12  )
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

On SC8280xp the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 703b4f4e2059..6eae42384a18 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3405,7 +3405,6 @@ gpu: gpu@3d00000 {
 
 			qcom,gmu = <&gmu>;
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "gfx-mem";
 			#cooling-cells = <2>;
 
 			status = "disabled";
@@ -3564,6 +3563,8 @@ gpu_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		sdc2: mmc@8804000 {

-- 
2.34.1


