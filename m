Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B6F606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dekw2QVC;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iDX0SQ+C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kkn8iP57
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=; b=Dekw2QVCXW7ssw
	rh1kEt8OHR2Pbb1TCYDAbw4YRztbdB29c3QzO1umhp3hC+e4PrpTf/6sx2JzJO3n3M6gsr/zJyJw7
	H2R+RHEIwB7uR2842mrgF1ok2ivszH6yaNx0PmaGIF/DeM//oCvT8WnJSZUvI77cVsUEbY/ogU8Qz
	9cCE9GqwimjyWZBFKZXwFKyweFmqx4Rzjxhk3o3PMqJ7/2UaONGE4hUmP49K/Vj0D1yzm89/wBuA8
	IbQ208yo/VtK7KtqjwBwU/7k86NDWSyU5dARQsH5XLB4jsm9uMF0jLHLBLfuwew3BQOkZ64fVX8vm
	lZx81D/MVcfqO3bfhxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuP-0000000F8pA-1ulz;
	Fri, 20 Nov 2026 13:44:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOto-0000000F85d-3wsd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:43:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkgUr3107630
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=; b=iDX0SQ+Cr1ar4w2/
	/00qhlTElkSDRnEmUQlPi+xNC0A/bMK5ZEluq4xFreDF08sHnD7XlIDatmHuEbXL
	Cl14V2IIgHrxwOOZ5ftiGmRyt7AvupSMONsCgdNX7rhQa0QBAazPYgsx3GgenvxQ
	KotBHRuAbiL7u3y3L0QFuc5vEOhTDTmyskYlAScrl39mlucL+B+41vVCA0vJJ/0C
	LrrQEmZQjEsJT/gr3TJgVR6a3maErIxRiuiK6dZptPpxLSNgTv9rnS0vmIgWmNjA
	CQp6zALCNzC691rLA8UD6khSdDEYpBzfTkwCMAkswx/abSzJ/rtWR4w8qcLMUbh6
	gKvcTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3x0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so1468271eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182211; x=1795787011; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=Kkn8iP579GuUNFR3Hti9SzsZiJKwizOcYsi+a1WPFocvxHrZNVAeCm2oZ7Yz0sU9La
         3Lxfz4pXXjTYOQhNqsvGGNNXWgFOBF2SJ/xZuz5f5tuYwv1BJLQXaaegR6tPUyutSFAs
         o8JjVqi0kKb7dX4EJVmP1uzf3g6kAjfIlwTY3eyv/gddA3YxOFwE0qPYZE1D7MCz0bq5
         lkkPUUWISaNQ47+zraCcnYoVyIiRhD8SGe61/RtJW70kKTVvvPbqmulToN6bpK7xmlla
         nO5WKwLuFlCwUhBqyiEEUm/UQdOKjK8b+05ta16IgAm7Di2mZ9XCCMotqwINaTPIdhxU
         heLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182211; x=1795787011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=KvMp1XzU6YvIScqhk9NQaBjXXqR4xiRzzFfNXGA4RMQA7gbZvew+16rF3yrJslCL06
         LlvV9oKvQmLCYFVVIIk4ePF7C2onWa75LrB8w8LLDjwE4aAatM7odx7+7EmiOmP1uquf
         9jcJaRBs79h1ox9Vbudxv8+qXmsl3mgNUhSsnXZXGBwD+wUxetU2u9QfALcuShKKt0vJ
         OBPbzh122cGjB6v0/MASefMhtEbHYffM0ZYB3VP3SpiRozweofR6xU/HAvB33lsWLmb8
         Y7HxKuTs4coSvoVbPJOGMjLn2emHSWzZotT/ik1iheDfzXoLtoGmuXWG+drnCuS6I/Z2
         5kxg==
X-Gm-Message-State: APuU4Z/nO2NKFPkAjBaWoVOE8m7P0VTEnLWI9HCkicnHox5aQGRkXH3O
	WWscnAWdqmsD0NkltuGyiOUU7gL2qStZa+88HwAvfFrDfAtBGREfhrIGaL6BtExryOsljOCdbY5
	jVkyYS3yYibE31rjFKchQpyxYdsAjdHXiywCwbndemXBZC1FcOH0V+M4LSTVodkmAJ2iaZNN8HL
	mF0w==
X-Gm-Gg: AZFdTZdQOxzTn4he8OQcYeYInSS0xb/ZlrlMIAEl7iqRw8qbfFpjYvqBP5Yv0lMaQBs
	bO1m1+6hyJ3cHO6o4ji55ak/jIv9ivhU9J9Tnb9BQawKisQm7FF1ua38tLbWNXYEB24/++eXNJJ
	iOo/d2WclM305NxILkEQeDC0W8WI/yZcdMqj6dSRqvUfXCq7yEPXVBRI8Vvim2L+UMMCqmX996M
	T2xZs40SyIYAEANMj+b/D+bnhKit5l6G0UBIM52G/WGRKmMlJOGrHEAD3FWm4xul0v1b8D6b7Yk
	5DNhk+PIxteoD5NwSRiUCfI6AAc/va8QfjL+PH3FPp6Sw9s5BkLKYGA42QyUfGM3XjLTEgm7GPn
	MVzocYck6ub5ZVlx3qnABOO8DCHYC1XbdNxODNbV8etqWcVsfOywGuJHY2dpD0PDCERdj/rkKnW
	ccOVM=
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr2985159eec.6.1795182210686;
        Fri, 20 Nov 2026 05:43:30 -0800 (PST)
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr2985097eec.6.1795182209587;
        Fri, 20 Nov 2026 05:43:29 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:29 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:43 +0530
Subject: [PATCH RESEND v4 12/20] arm64: dts: qcom: sm8450: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-12-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1046;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=XGSCDo+PAJtTWrK9Yli/KgTXld6tpUWo0Tp3e8IW/LM=;
 b=pw8cWvyKwent69F39bfc+dvHudt8wpagQHoCzw0hmqpwl4FfInvFtYZNwSN1sydn3qGmcjJ/b
 vgngXSRqSFgDW6kPfAk8Dm4svPRauiLxmUoEh69/6Or/Laf/oJ2Tzp4
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXwvcHRtCsqCDJ
 PskYus0Lo4mXRVgbO0g6aZmympk1WJMYqf1/pFoOkzKIO2B/TlQoGrWjA4aUiuCvEIYw6RmrKl/
 Y8dix8OcbP8qBW5DwHfDnuZuoURy40uwhv8sjbPGzf44FLOfFtgb8p3lhDjvTWu5JMItbdJwOcN
 p5L0peQYsJntk5U+mZsIOlXgjRM4qylRyrxEWFFagOiIIjSRO548eJpEpxbpkLHQaCad79Fd+xr
 cnlDeqdeDuUoy0G83qjT6sBZo+pVKZS0y3cbR++D5ystJ6DvRvsMKWJmRcqpMEdIJhy/E5cryD8
 KRq3+aZKUimnkiJtYYT1pEnXNwaRNR0bGVtKAqbES7zNthS2XZTT2j6Ibgeh/sQuF0fxB1YpcjW
 AnQrGLANXQrOKH4vLY6kLr4jggyeT7nPNGwmKis0ECD63JQePI2yivoKIbhHii9yN7B3JqNZ6rH
 c3J8Q6xQyo8cryAIOSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX4IU1y5Mc35qx
 5/qCv1nlESwkQmmx9ToTrVBFKOBk3P7CvlF8sZb0m/iFWAxzZ/F6bjqjnpLTOH6hcxHqUmS5MQN
 NV3x3OB0gGVU0M43yQ7k7I5VXDiXOr8=
X-Proofpoint-ORIG-GUID: fa6kroS1VNvYolRQhtHmpJ4LOe5zGrVu
X-Proofpoint-GUID: fa6kroS1VNvYolRQhtHmpJ4LOe5zGrVu
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b004e83 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fzENmhSgVi5qTvzIpAsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
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
X-CRM114-CacheID: sfid-20261120_054335_339510_19F3C1A7 
X-CRM114-Status: GOOD (  12.27  )
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

On SM8450 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8f84668169fd..f7dab346cc70 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2619,6 +2619,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1


