Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431ED60A3830
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4xYIMxyh;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5ebzzsf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0zXuqBI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=; b=4xYIMxyhfscP1T
	2DpsFqLM0cbva1ciOom9eMhU6c9YOq6lFYHXqzE0gkSzaKocJvoB1DRl2nlVDnZkNhTcTSswmMH/p
	RqBMq4yxjkZy3svoC+CtPq8AUgOuBfa2jDEiEGmpUPuDe59uCMsbNajzR/DRbP+GjQo7lh9es77cp
	GqwijLR01QqQecVWnkK6pJNMRmQC8i5tnvZlp8KUE2Ysq0nEnkBLjwgFqmdoIUxXWRk7PVHNo5lDb
	bpDYh186AvXZBrH5DDmHzb2IRQGlP1VlUB4lnJtTYdme8wXNRCORBg2EkAv6lLMi4xK/IGMxby33l
	NKo0BSyw7LhrffCDvxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMT2-0000000EiCy-2MZL;
	Fri, 20 Nov 2026 11:07:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSg-0000000Ei2R-43zF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkHXE1017120
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=; b=W5ebzzsf7VsPPxpM
	wgD3pCatpFUOUy5/p47/gHoVKI48WEwh5flF87JheCRDoMizBtVEJb/3Vc8cBZjc
	R3wHNPtoMCzW5v8tuePAIaEmFUeMLrJKC/8RCYCpNFpwP4asU0Nlb2PSP5zdLL+K
	Gae7xJR/4DtcGJcV5Gn7vy+JOins1QZAhOBMghIZn1Hb65JfFJGd3LPYi35KhlNM
	yE5izBJKJFmLS0qjl/BF7iws2Cpw3NRPaHhvVUjxz/wsMw1LIb6nmQte2FTyvkpC
	9V8F8KS5PfVuC4wUvm8AP/us1nIjBviuqwLOZl+3Q/E31xUjd3s5+36QVVQ68JEq
	nZdNBg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs7ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38131260a5dso1970733eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172841; x=1795777641; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=b0zXuqBI392p1ht1qtUmDzbYQRxFDn1zmR8dICfJk52xVgyc1lzJ8QY6QTYRc332/A
         JUfBnoNghr/9Ruj5sF0CJ2I14Gr2IM2Os7ExLaRd8ZTMPjsqgczotIvnbKuANQULODoi
         L9wCwbUMwunt+aYlGqpOb9d/pBHTagrGLZjFQM3cHm+ovCz0tVbA6ua3auET8V6X8Cnw
         OffCLVVco9hPZGpJ4z9NfDMig4O2WYRZiFSakRfUIaRGNo+rH79hiC8mAH+7RaU0EbqC
         ShlJ9oCOHbae/2komf0E+lT1H7RynolCC2XmixKIX0Lsj+0zx8N9JblHQId8x47o+1Z5
         CFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172841; x=1795777641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=GbctRlFORwtcwg+H8Yfwscl+/pVBgUs9PF0DsoNW9fZ2CsHOX2PK9YMKTS/cHn6c+0
         OI2lX00tDmF8HxwSG5LC38UBhaM5XKOTetiXTSlGcL4T+rxpY26jgeF31bwEWm8G+rFW
         Y9H2vNjKQXfcVu6s+mb/GiU2jCU+AQwRb2dyMQaLoKpKx8MAWeATnLaQGYuu39oNtihk
         C7PU1cDnwX+uIA9Dl+kgDYs+rcqoVQnPhzSButILplIafr6fEewB0vKEa2Q5OBfjMrNh
         euINmhkwYlKv5uK2iLw2Jxhj8Cn1/YHmlHS2GsQRJcRBQeEuhl2Omh4sgD+6tPSlJS+l
         CwPQ==
X-Gm-Message-State: APuU4Z9FRCx3CD5Gc/sur17GUjSEB2/LgK9MQUS8lOvQhvHVBoDilYJR
	939PPI9mP5JPMY5tfpK6FDSIToY5CZLdisyz6KZNDW7r/0W0cCojJNxR0d+ns0tusTiO0HMZqaY
	EcBNd7UH6gf1wEGUdvzvwcXVA8S71jutCD8YRRvDwhXsMjmTpxzAu46jUDRGyawk64IWb4UadvA
	9RZw==
X-Gm-Gg: AZFdTZfFts2aO1IK0LHpttIx+RTdU3Z0rE4MIf2HX9QposqWHH+XQzQIeeYQ2nwL6fn
	cJZ7j/d2Htk3PFXmE/+0ioLLixfFO7lvF1ay95eiSBNaFbxOdyCactLH2bRDA3CHE67SM3DeY5s
	uaEciVpGj0KUuAgR4KmHWAd7MFerLmja2iFBOIQM2JTY/eCh/9+jUmQQlSVekXhFzjukKChGoah
	sxdDl//dplnzU8t8jBNcADion93kSz1gqq0xQIwn259KmI+Jwd2NQEKO5Vr0Nzd5IdRk91+ZCej
	H1+3zyREgd9mzOE/bjaCt8W1mldh4rZiGmVFJcudMfP7DCwwOe7FRvTBiBHl0LY4PMCNQUgObHk
	cOIohnL/iIGM7u3wKtGgUce+16md6wHROh+l1K61os0/7OGUt51674p9PQnQo9qbDSH2abnJfFq
	oc6Y35
X-Received: by 2002:a05:693c:4142:20b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-3856f4542e7mr2706110eec.23.1795172841337;
        Fri, 20 Nov 2026 03:07:21 -0800 (PST)
X-Received: by 2002:a05:693c:4142:20b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-3856f4542e7mr2706055eec.23.1795172840688;
        Fri, 20 Nov 2026 03:07:20 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:20 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:47 +0530
Subject: [PATCH v4 06/20] arm64: dts: qcom: talos: Add GEM_NOC interconnect
 for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-6-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=992;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=7PKy0XlSNrGfUIky+MIq+A+DSi/A91nh6BKC8dJ00Ww=;
 b=66qF+/nWyNlaszLHI6kXBTrNfnf56mWk2gMlIf8O2jXgkbggFAh7NqKDs7jmCnHNac8yzPs+7
 GLQvX00gi3tAwC66SIoqPkgnkyAmuUiWflZTxDS/kYgtXzWwiKmG/EJ
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX/BvDLDl4Qq0O
 2xL77NA3sCltLdChczEHnlmM/R7GDNEMpmlp3TMpOMgZq3jwXxQBWZUZ9yj3emPfKxGqPDrwzGr
 dIBsAA188kHGOXpZQ6TIvM65QoqO+/vyDSYrxtJKX/7s5GbCyBOHZrdJGxyRhAwpzBCHdSC3rSN
 xM9THdAWk52b+5XRQl7LLsozyM+0yseTKnFu9MhIWPun8Xn7o7oDAljE+fQUxWXIaN37Us8uSP9
 GemWogFbOq/2zpzwd/OIXSubJsT8MFgbEktBzGcvSTdbYO+mf3anIzVxruwzsqWkClqESo70oDB
 TrBLcnK921tZLPDDa/u3ACfsAhkWmND8rudk7sLg8k/ojnAZmmQVvukuZzL3DjBDK7k+ywNJ5n7
 YRUUN3YKcFTpVyqYUHqt+RxIVCrG2vgwvh3csf1jIFU0XPZeTiVbtApXOdjUEAxiVKooeLC2PVm
 WcujkYZ6K2w7QCQ5fQA==
X-Proofpoint-GUID: GFrKnVkYgaXTMzNLKsUw4JpatQkPuqcN
X-Proofpoint-ORIG-GUID: GFrKnVkYgaXTMzNLKsUw4JpatQkPuqcN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1qYFo+IYDgJh
 fkDTtOlIJiLYP6ugNQGV7Ro+nL13WBh/o21IHOsh/IAfH1MkFdBT7jU7qeTzHN6LeMJC/BdxVH3
 WPvQqSwJATnbSSXppTEqkxnwztD2RYw=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0029ea cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
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
X-CRM114-CacheID: sfid-20261120_030723_028397_A3B90A92 
X-CRM114-Status: GOOD (  12.00  )
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

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..f022a44ae5c8 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2102,6 +2102,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1


