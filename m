Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD65D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QUcRWxBD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PpGetJGQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HoPUEqUL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=; b=QUcRWxBDehM9of
	Ccs9l3jq54jCCJHetgFhEuFBG3XzN2AjEi6xfJ0DKUfBZZcUnCssl9L+9AQm7/FNu7+c1zh6o8DDq
	UbZIb8PS65fCyegaqi2NPKEYJr7pxyCluSkC5WdW+ynoA9RVhA0CrClLYxVg3HKI/W9AcFtoZZg4M
	steN0IE7vh61HO3BRwZEoXEpbzkw1WUC1KImciqv7zjz9swNcorJ6yKtETILsnGo8PoZ79SkMJMoN
	aC0Uzfkf2ukeERhNEkqT87RqcXtekxOp/wI+HNxp80/KYrblBgNk3ZD7lbNYoY1+dvlb5t+xN2M7K
	UbeDZHcFrNTZ5cR57QFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMV7-0000000Ej5m-0iwA;
	Fri, 20 Nov 2026 11:09:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMTm-0000000Eil5-2iM8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:08:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoPS1462862
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=; b=PpGetJGQ7pBoK2Dv
	V2W5Gw0cdxOoP1ZJ4IwxWGSC1dqg5+8NDZ2ba8egXMhLsthVoHZFC9RfMXQiuAF5
	gBR4XyAeyHp+ueZgRRzVj4kFHvK1/O77TW9MAiEq9fiOdF/LEdXyudnNQRpedwUu
	tsgyvP6Tn+vHlA3uH7pwnizO5Kfmlr36hZNohqvK7iMgaC6u8DPKNNjNvsoag+AV
	Z9aFk2pYt7bue2Wm3eRtj12Z8z+9DDCGSzr2CnkJ+U0UROzb3VMeu1cUFK9HoF6T
	4NHBraoGBIaWon0bwvQpjiAb1if90/U36LzxRg+VAGGjn2InlLHzM2Sky8Jqz5Zh
	avi0Qg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah5wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso2463411eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172910; x=1795777710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=HoPUEqULtLU6Y4LY6MQ/53hZZF5N/jCt5gLIZ5qG+Rq9pWJD0blH8h+f9v9iF4f5Rh
         4vXeCXAwwHN+pw+AsEqPWNGoro0Ujt9F5J/QKQLQOg5wY6oK5ZdS+MJNOReshv1yzj2I
         YKEM2s5GGjf623h2aRLht9hsDpXD9EPN4vw4jGekoHYURj4JuVgj/KaktddTLKKE1Di0
         sE8GfI2TotrQ7V26/LC7wSE5cLcFw6PVDJaiTqW7jSGLrU1ANFi8IGCajGJmgqaMqGP8
         kY1T9sv4UV/LINtsVy2RL94sWM5UPXSqkwEhmst/ZIAjDDDxp1/hw2T2y2vZH9aWYSQh
         ce6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172910; x=1795777710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=P6uLiBthzzs/sYaGtOZ0Kl5h3wFdDF0VRBnDzMccX/id6ORXakR1XqkZdBq9PNI1S1
         Tw9/jAAunkYqLBcpon2kogdgUviXJBY3kYT87TBYxLiIyhSOF365kfWVKzrISTF/V6O6
         nkuMzYxx+btlJMPUXUT6YErr7+AAWZUj/4GNn5aPArv0UY6ASCCriFTMOO7AYD2ZatPz
         oJDU6uVi948IZNXy/8l6LBMgURvE2NddRG04/eA3r85jKIU8XURbi6Zx4Cpz4RggvLX8
         sS+czNpub6TmACzXMfJts95kWGdYpGcaXekcT6YjO9ov/d/M0CChMTlLVum35I1n2n6b
         CIEg==
X-Gm-Message-State: APuU4Z9fnl1ruAZEbS+PjeksXekqS1cGgfrIQ/lGWAOQ8O0rgPgeUWO5
	mS6reY/u4n3d6qzrpppahZCbpGuGn0C39doI5NgI3eX9xjRiTGs7RLD/B7ADlVcJNciFK9RAL/I
	Ebqnl/OINBQGbd7WLeO5Zfo1Y9g2sAVacrWzcJ6/WNiOjxjUge8eTytDVctwbAp+lf9F6GUeKoD
	BXDA==
X-Gm-Gg: AZFdTZcobxfptP9UvApMXFYy4jIcCAm80y1T7BKICUQpxtDagEiLcgm+7mtOY7r8PJh
	Ezw0dfQiB+u1QWerG2XwAz7mBWhIpOnnMkHoHsNCzTFXzW9VpZDETitm1xM2NC4Om8xtw4wAT4T
	X+frqZQxnRY8ANbiSkXly4k+ZhQG4Hm/LvhTgNNAPe5qI2cXssDL6u29lFdaQ5KC5+Q2RBxRzQ3
	mmgKl4/5Xyl0F3k7z7/fhvxqh4JNSRhwGMc+1RmKkxwScGIzJ42Mpzaky5nt3i2BocVruxJp8Y7
	hI2uu4/cwcUDNz072bka4LjAxHH+tHksKOScwqTcVRWUyeoqqRWnwAld2aO2HEcCKIRBKgjUzbF
	vCRYWboGNmr0+EvtCHunqc9Az3qFkLv+OT0+B+rJl9VzZgHBtwruKjvxFFbZ+D2oPoQDJH10wPE
	Zp0lnV
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr2548344eec.14.1795172908931;
        Fri, 20 Nov 2026 03:08:28 -0800 (PST)
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr2548284eec.14.1795172908315;
        Fri, 20 Nov 2026 03:08:28 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:27 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:36:00 +0530
Subject: [PATCH v4 19/20] arm64: dts: qcom: hawi: Add GEM_NOC interconnect
 for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-19-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1056;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=aYGbyD3vlcsShV5PIBfgPkIOIPXgEFvWy/UpvGRwvdI=;
 b=PmL/7/OIAhKe6+7Ml8hww8O3m8ab/UwFs5/yUv6UukBwizaGo3hlxGIlCcYx3COfKyuE5mfYT
 POM6ORiOASJBu3Embpz97TTwUKRZxIR3vDX5gO3izhLjXm5xK1bvqGt
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4dhFFfnTASOv
 fTSaQ6VL2XhvAQa7dk6Bs7V4oh4RTX8qq60gVaXYQC+Zl3R7qMYs+Go2SUTD3S2LbRoN8DJa1RQ
 YBmnmFmq3OdTkttjVH+NvZd9NbU3KPyfxpg01lYnvYnSNPAMV9fl/zRhfvkhrwZ+qEpBQm+F0Ts
 J4A/RX/OrpsDzeQx6ikiR/wsxXTpjVPgBgDRNKSfa5ouJWXjdtX2Ah4hOX3WwpgRTTfu0nPI6gP
 IesTw+dUyOJ4sPavUvekKFwO9mET1YfH+WdqEC+BrR63wxilQcndwC3qXKVvfiiwhgOtdbJvkTx
 ed6ek2YZKFcTP7APmaox5AazZsYVY5qF77w+jb9CClNpddg8O9pHprtfMlXAZh146kYuwev47c9
 NH6C4f1LxTguoUqdIvQpjwg68iBSzFCjePdcYhpCsAjjdjEIjXbKqTmRnlP0M1qGLIbSBmdymb4
 s8tfzdUPoYO3jYM64Pg==
X-Proofpoint-ORIG-GUID: V9XJfnHkVk_dufL3Y2HSU492UrGEs9T4
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b002a2e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-u0lSa1b7RXV9CCC13MA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: V9XJfnHkVk_dufL3Y2HSU492UrGEs9T4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX3Y1EFJWow5cx
 oMqj0TE74g2Q15vjH5sTXHlYIhetuE6lFVN0K9FB95WAulARmTvshbtLJnrjdOdIHCkwAM2DNge
 qzp29bRuaBgkQTTaD5INpZNDrIwMF7Y=
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
X-CRM114-CacheID: sfid-20261120_030830_869053_CD0728C3 
X-CRM114-Status: GOOD (  12.32  )
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

On Hawi the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf7..bb60ed9384c6 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3685,6 +3685,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_mpss: remoteproc@4000000 {

-- 
2.34.1


