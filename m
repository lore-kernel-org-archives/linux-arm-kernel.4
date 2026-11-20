Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE5D606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mYbEvcYX;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ggyc8/hy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X8Z4j6Ux
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=; b=mYbEvcYXznE8cV
	rv2TjY6ItKlhO7faWRF9TUnDu0TXUEu89Why/n2TknsVn8zgaAzmUfwW7lPSpI2Qlp2Ok24k7hAL4
	5IwxsrIym2Kpf26d8EAs2mqpB3juP+qZUsP4BYHRovZZFlyI2Pth6sigPc+IeIeupGY6K+nN/o7b7
	yFbWFP7KKS5QPvD16v9P8YITNulUxwPlFUX0JCwdxa1zWkOS8/kIPprbYxxOj39yS1t5uLoaQBECn
	X+cn4kXMvG8l/TvUSErluwJbNB4YH4eYgH3Zog+V5fVPZkkng3OXkB8OrMZNDz7hvHfFLvufBFTmb
	rScD1vfoOG/iUmzUQI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMV5-0000000Ej3O-4BNq;
	Fri, 20 Nov 2026 11:09:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMTN-0000000EiUG-1LFv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:08:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKB5scT1105352
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=; b=ggyc8/hyxmlWS//p
	IvODsdges0NNEEIs43B2ATBJOjzvWfwHStiFyHfdclZtyYmrcTVan/UBSiHQPiBa
	pmXLOae1fWbk/32MeJlctcEPkuIMSxbMywnbCUSY+HmnoJjt3/kMtGJwmQg1GPi2
	LDFYYFBreFl3GDYzDzum3yJtPAEaRcU4u8COdKB7jjj/Wb5xGaAg2yX0CasB8QP4
	fDAxoXG+cC/xd75ozCAYeK/hIqrqHIggVHmH9iUqprcFZy1Pua9rTq9BloUsEvCi
	sMLxmlbxFsWJAUbIhPhe0fxgI1PXerT7PRRYYsLz/OxfZBcc3oR6yIJn6GYqAMEB
	5BtBBA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykbbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383435e46f9so605114eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172883; x=1795777683; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=;
        b=X8Z4j6UxdsQfGgNGNDFjfszJX/RNpSO53feCvVLriiFZXoa8AsRNB5PbAnEQxI7vch
         1z3VsScIj2kozwyCQ8WUg/YXdqnsCt9rDCb1nbCkfQfdbVv73VutM2eeOmWjJ1B/yyuP
         USZ3zXjQm2/1vzryFKQrD0fI17EcjL8VDMXZOjI918keKXq0mY3GU+uVtWyCbv+4LIXi
         jMytfSKW0IRczJ2kyCsdfOd+MXxDAYTJ6HYvTqohKuonvwiaPhp1/lQmNttD2A5GIz/z
         pu60MIu493eNAM/zgVWKfTl4GC/cn/niL+VCHmM66IHPYsXz0WIMFstnfm3YKF3rQ3fF
         nNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172883; x=1795777683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=;
        b=Q/RvJ4QLn50ZmHrg/hxWzndKwi2SOXO8lS0AuSqQsOZzFlXGZRZkkcW3/O2Loauz5O
         wPIh0fUh7aNUPx+2AljlHAW9ewulez1JM21dPvXAN0mZ9nUCSLoC8AMPjZAKT7U4LrdQ
         zVkzXpg2urqC95HficNNundLfGH6BhJnrvfCedUbczovGvjbgnTITWMezlj+VoRFh+E6
         3A/suYBx+RMg4N/IJf7TSRK4thy0HvXE1bjVMPPB4z1i63EdNciirTtwbEzwMHpFne2N
         OufudGAlqd2kJhlGvkDU1r0lsABoF6sEr3JrMmPfoYihaP1N35IT+40BefzopIjNskP9
         5Xew==
X-Gm-Message-State: APuU4Z8Yta71JscUOdDhi22LbXimzWQ/X24u8RlKjczgRO9TNW9QL64C
	frpQCZoNkLjXhvOn3pO3bVVccUi913IGAhYUxfekPwMnmhrwlzsdjNNZnSvh1jk1nZIWan3B+Jf
	KRmyhUp7K7oRg5hf3p4JEHgmbNTxFCtZbsVVM9q8TPJyDuPeIa11nYNYErgp1kaiYHzXEXo39+t
	UeDgvgz8lNOg==
X-Gm-Gg: AZFdTZdMBOOYhQxDdZlWAQG0N0YAKBf3fd7U+noJUCRnl3DCD6WPObz5sv1ic55BIXc
	WFYrXCSkpqBjbbz06XYSXNv1KHfVgUJUXpQxeinhFy13+17PmQU000j5RmJh5+Fai6Sx0wXJzrh
	JN/Pp3VHCk9ZqK+cfWB8nk5nkj1/ZGy8QDxsaPQuBL2DBRfTtfWcwN8HnZ6PGuQ9ciodqHWpS27
	fwfXU79hU/ksFrlWMhvqb1zG0liC5Z60xjzMOl0+H42w8VK+D7QyOmPglhoFdzm7sHN0v6X9c+J
	DpS4NDBmE08pjtnY7qyvYklhtYjo3914TZE/bhPOBhWz18QeZudpDEXlj76XDVPONNXNCznCbfz
	7EbVfoIenqYcon7scx0IOaBHuXEFSfMqQLekTsjLSG94ezYVSxD/VTzJGe0rddn1MNTbq5ofpKk
	A6Gd+B
X-Received: by 2002:a05:7301:6182:20b0:381:fe77:7d31 with SMTP id 5a478bee46e88-3856f14707amr2344799eec.12.1795172883011;
        Fri, 20 Nov 2026 03:08:03 -0800 (PST)
X-Received: by 2002:a05:7301:6182:20b0:381:fe77:7d31 with SMTP id 5a478bee46e88-3856f14707amr2344752eec.12.1795172882285;
        Fri, 20 Nov 2026 03:08:02 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:01 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:55 +0530
Subject: [PATCH v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-14-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1282;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=nRKWODwhqsti/JCMKzfpHOUMvXfhBSP+GT/cARrj/+0=;
 b=c5WtPJ0sQu94WJMaTQu9JE5PzvJ7kuyQVvPNmn3/oAka+ojdMg0UnobB5jSbCZWOdUIE7w8Oj
 i7g0V7lmEc9BM4/rk317+KDNiQCg0iQXHuwtIRhaaPXA8Cy9CozEvTO
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX0qtrIjLnKjju
 9ad/AKylNJ5RJXsFP3UdceeFEwtS7deh97WMWUfjN1RIS6PRuOeM8oXBcsUSFamXAXn/jizuALf
 VHli/0Rbzt32a8HHcFB52kXi6N+Vf98=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxFo8c6k5LrgI
 /1gJwaMV2SudjmQg9ys1oR4OHYhuzHlvUEgLQI1yiIV4/YGvl1DDmMyLGKI1nvQN5gYUxcON6y1
 utj+9bfU9Myifz+M1IZXg4NrcwgLbloN9nBCJ5l/X9xEjmS92WAvrjVnhVG+gWP/Tr9rSM+5K24
 c8CAd5CfrT2m/Ch+e5YvhF5uMW42ESoHS3fYLVs9jvCf5s7phA7+YTrU9zZ5TXhyaZN4ecc+eKm
 I7OVXsi9q5+QEVxUw9/iqrGkaCx0xt9LsrqR6p1qpHJxDVKelYd+aJSJPKolopgBRHSd1Xg076j
 nsHO2HyXSgqlX8xBwSnYkRGkEec1sYiZ+xhr8L6HLtpALvRwwJ3DoFy+zMXpXPQ1PMajaK7mwZt
 Wday/X2zFZnrJfk8Pc8Iqy8jGRtpN4W5kKZLH3c6nCOmpL94GZiUXjayHNFTx2BrvCdODb3zo76
 /9p2ITmdgQvXal5nhtQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b002a14 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 7lF18ym-1-KrnoX25k2ChTJMKNlxYlVU
X-Proofpoint-GUID: 7lF18ym-1-KrnoX25k2ChTJMKNlxYlVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030805_531121_CF28962B 
X-CRM114-Status: GOOD (  13.00  )
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

On SM8650 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c8..86b3fa4cf05a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4214,7 +4214,6 @@ gpu: gpu@3d00000 {
 
 			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "gfx-mem";
 
 			status = "disabled";
 
@@ -4413,6 +4412,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1


