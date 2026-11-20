Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C360A2637
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3p5E2qDo;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lGydtnL/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ayPjcMou
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=; b=3p5E2qDorDX0v0
	rgVUAEgeKMrUgoFt6pEe+vpBbE3jWId2VMAdZbl7qNvvflVlOF8+9cVciharByKIlMuJje5THt3zC
	bRSL11I7YEPrIyUECWBLxoutnBxc0ScAxSL71nM973P98a4qw5T7lWZUOErnNVkL7I74wapz06zsx
	JR99tJFnUDK920hm/T+3zqO6HAWqkak4m+dERCIKDsEoKwSH/HwmFKQRDzARupBPrPRFsZ90GysKA
	IOsfXbFAX672+pYX8YOWmoy1LVjNsHZQgO0gtmL8vN2l19BvZ7c2EfMZxcrUM2YN2g0n7cy3Rin76
	1HFnsrDryNvvxaTO/o2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMT2-0000000EiCe-1NCh;
	Fri, 20 Nov 2026 11:07:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSc-0000000Ehyl-2TLv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqdi1681893
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=; b=lGydtnL/WG1DsZsr
	17EAMCvTzQgd9jOSLkYuBrFAuTXmuYZoViVwJwitUwXrFS0t4AO/5kXW8o+gLxm6
	UKbB1UZi2yCbzqPRsBvXnSOYtmQMNYHa8RqlT+/pdJ4q7Bx0Xywx3F8bfKO4zVPa
	MLQzdPCXKUItZg2FDvtKbrvXbd5FrXXp6fQznMHJFo41i+S797L+mMXYrLlatzpk
	BO4FUGusnZI4cVcip1JFi7mcXUt7tu4p8GTcbv1f896NT/3obcCeYElZW2CcHyB5
	oUXURG1tpmu51DWv3K9wZVt35YsMSSZt05tRmY7eXZ+bRMAzmRPPbSokqHR9wcV1
	/B4EHA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t3uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so1078331eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172837; x=1795777637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=ayPjcMouwYKnQBUsoUYzM1W/6KX+1Ei9x7v9rKU2qQ5kdmngobaiFqe2i9G0x59DJk
         iQBqcgNfczxXT5nUKKFtSIc6JRixaHooCPIFKBAVbEyzKJFgRMl7OSnWnX7g/Cfdm8DR
         X3wwSEQv6u4OsmtaC3O46MH45rDa9u1PZSGUuHqndyD4FugEE5jeA1PD/1q0L3EL5zT4
         5px7/ikkQLzysEHgvwxkdskZ738wvDQKoH+iBU256lvkrfdotETXOjJfMezOprV23RHa
         8NOMFgutSP/4GsIRZqVmEyrlups/NtDEZBP+xgzEvEzO9HMuH2NvUFvCyWDUyHvhMJ+l
         M54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172837; x=1795777637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=qMPqNIZ3cVpeGW/V9sbn+elqHHTBpOEGOL1+XRo1eHTN6MEfMtwQPXiHKNEAPvzq+s
         A40Sb7W4HgRxnSqyeC67NOQNCZwMg/s13PuhI+XgwfLm1lyBpLUMMoywfi5+1ROhBrg/
         lN57RCZoC6xt2/Su0S/pmV4UeFoIA07QzUcGmABd1cmmTvEvvbxg8bkE+YfkvbX3i/7Q
         69HK16Op4xvd9aPm0+iObEpJGL3DpcXBQHAvQpH9jcocenKBijN/1SEihW9aD0HdJpKq
         XYcjckomoB0FmfP95Y4anoJ2VIBCrHZHbsztJDngAR5AS9eCbWpePPHZnQqXexKGKNel
         RbkA==
X-Gm-Message-State: APuU4Z9CzudfwF158WY80mbmJ9jfJCxgTh3Yz1QJK/NaMlpHfaIw4DNw
	La/eHz14zyqs4b7bYQUFXSZrgInkXqVC/yEzwaAzoSL/LY1ZrqmR6EpNlV8pb6ISRXw8H6Ci1gF
	XDqQoweYtClVoknGTdqotuHs8fq7PxQfIiDupVs4MakE0232frJhyJoBRTyiQqtlKliFqerxXvA
	O7Ig==
X-Gm-Gg: AZFdTZeGbcHb1LfeuZHMQjVLHNZBsn3WWw9GJrtfuNQ/biDhdhJNQI1sdDafCXqgxN2
	6GzgX65P1tjMz24VUV3/CtimRWIcv7DtnllSAqB3HfDVQZwhrWkM8sXuA6PNpTqsHWBQPp4armt
	z0/qZN5K6ymHiRr+McXZ3DpCfUMVfCyGzG1oOFuv9txoDMatlFeomky6CcDI4dOu2mzhNIFuLqA
	V7OW05JO2oVyjhA/OvpDRuhBItbqHFZKxVAIGVgVo8TxjFD5sImZs21Ufctdsufr8QRsLNbXjy7
	gfB6I97eQzZSa4XvYr55veMqd6K+kxgWQI2jDV/qIh/+5jsZT8Bv/yOZYrtsChymhs9NdXOgyqM
	N03hR5/toTHzyQ7s9yO9xmBRtG+lrGYuhsSF7SXcP2I3NbFjPYF4cDSV/rQ+MXRJgzp7nTyTcUY
	LxguuQ
X-Received: by 2002:a05:693c:87c2:20b0:36c:dbac:705d with SMTP id 5a478bee46e88-3856f65a86emr2125671eec.15.1795172836115;
        Fri, 20 Nov 2026 03:07:16 -0800 (PST)
X-Received: by 2002:a05:693c:87c2:20b0:36c:dbac:705d with SMTP id 5a478bee46e88-3856f65a86emr2125639eec.15.1795172835468;
        Fri, 20 Nov 2026 03:07:15 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:15 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:46 +0530
Subject: [PATCH v4 05/20] arm64: dts: qcom: monaco: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-5-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1018;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=1lPh+lGGWLKglbX1purFejDWg8n5fwBJBYl3rhWzR6U=;
 b=w7+YMTrpj/odsbvoZBGQJvWKHZSfz1g8C/fkwsgmPpO4XjyzY8ommBMbxvyjAoSlDyRaqpIGL
 0nBHrcLcbdtCZEPljT/X3t2bHMS8fnSMi8mpqaaQfepYWjPVWWOr4P7
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b0029e6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jjng17ChVe8r-G2aFk8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: fylL4ReZCHfIHzgcgTIEqr7GBpDlgw3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX/4Ne+fexmOj1
 nL/CI0uTwE3og1nbEefLn283OoscMp/6TKP6hxZiENRRivYC9VEPtUSjrthCvQ5kcc4VesESFLG
 ljm5wsR2p3F4qR8XqmKKMjlhRvqmS0R1wOIdAzwmfXWWT+iEdlALJY4N9IqpFpPAn6yeW5RgyQH
 XS1PDQODXTTFx5E/FDvO7QrPuraqWX1tYQfgHZB95S0N9Nx/SzTrg0TTM3ZjtOZSIVsAquRiOwx
 qMrZFLLNcdYI1k1Wt/69YQOvhr00jgjry2GC205Ua7kcG2m/Zt2ejG1jlCQTdZjBhBWMNzSN9Bq
 VBjGbLcL4PBTRbl7B+w3lv0twL2Em0j4N5JgpU52SELPL5HMk3ZT91dqwS8Y6M43GBmRylSgcO2
 JgOftf86lHUfFAWIuOq5QZPLp5hZd4EWWyBTmNI+36CPnjXPsQO9jSWd3lT3GWaIq90iEWC3wlM
 WiPkqXhFeLE3pPcK/Dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX7iBHb5NYlNgp
 9N5ceOb34qcuVOjeG8UuE6R0lVwy6wPpRmWhOnXqNHhDYd7V1ozvCbjbGq23IM6ZCNYcDqYf0vG
 R39Efwh6KiPEp0RNhbFywF/WyqHmbWw=
X-Proofpoint-ORIG-GUID: fylL4ReZCHfIHzgcgTIEqr7GBpDlgw3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030718_916320_5F0C2693 
X-CRM114-Status: GOOD (  12.40  )
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


