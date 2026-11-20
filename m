Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C560A2612
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=igmA3C42;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzZ29Kkb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vf6BiRNm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=; b=igmA3C42sZTsYQ
	dEr0gs662a7C9Mxqb4zu44HP1dzEyW0f6ZeNwRg1XnV2fPz9+XBMVxjE4/wVd8xji1nxltDM/e9xl
	P58rMsYQlcIQQASr1yn9YVIV3nj3aNKC3RVKLGKKg0W75oLcj/VPlydFizV1F3AtcFDrbC9wOZ5Lq
	bLI1za9QtFjAEC3jEgeeBW9+s+o+oj5NGwI+2FZL8U1XBwrtL2wEFm831+Ld2VlE/Df+6Bqpxh4GR
	AXdzvAidp2UT+aIophe2LDSZmiDAfavwx3vIUUB+NmqNNWLgjEntrQzxZD597LnUxZUg11dmYrXgF
	ybwk9ea287uN2Zu6C3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMT2-0000000EiCL-0OJ1;
	Fri, 20 Nov 2026 11:07:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSW-0000000Ehup-1LXE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk03j556476
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=; b=QzZ29Kkb8jPUNzaL
	tD9uX3Jh4A0ugKkJgKV0cOt7CS6/HnNa3uJ5E+jyN9Dtxf8glUCo9FqtbCgZ1G8H
	tkGSfdvmi53szEDW+MUHncxhTmQ87jA3+jSV/oJrSsmtu7GobAK2epjTWWox3jSe
	YAeAPTcc9r/oGhmno4VqMycNoL42okck5BzwpnIY/Z6orYaU12MCMyp1PkDb/nRi
	MngcPQxZgIWnFMCQCbxcH/VLT25578C9TaZznRFPZhEiu6DwQU9r16K8YfNShLlo
	Tiaw+TyF5Rv6XTs8OomFaEsNjUCiO6VL2u5ocGR3mSGfyRzdLInBgqxhNMpqoiG5
	sFlgVw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhdyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386177b0516so1026222eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172831; x=1795777631; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=Vf6BiRNmuhTYuk9NZhiplTgww7ulwm30JEbs/4J4Bs6FZxuHNLMXoWKx/NRDluDcEs
         DfaGxlo27f1+DE+JtceVWGkBGz/qywYW/iBEDUaonArRoF5qeHdt+17NeRrVYQsLPTeM
         pfNR+t7YjX129UBOwufZNMeYcEYftYbMh9w7Ve7RnujtKiQCqJC2pQJ+Nl3EOd9mXu+N
         Va2sym1ePBULiO4hSZSaIYk6afnIVbekxwKX8bREt7ygIQE40Ghaq8WvRby2erIKqPnJ
         bIJpPgHKtp/9GT42iBhCOoiCqP74MH3zpZt5Pt8Jl5xw1YSXYBeFF6br7raQKRY8KR4c
         jynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172831; x=1795777631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=dQkWVVGGfU0aJ8CLBlTZ69+WbytOUFQki3qsJkpEX6gRNHxWOXyl3PhqZYs6UN61LR
         rE6Tp/xoBKPzZ01fo2PdUUxrI50/E6nbej/ntzALfDXqqye+haIPGefKf3VPar52YC5u
         6U2tZB7S3uIBn1PzX7ejMlOsfy720xosSp6aCtYTsHx8TYwWVsFwBWWdA7qoPpkfJ4go
         5qr8htfsnlnN4wiX07u/rg/12CGBliQpma5LRc8HwRx5nk5QnPUGeVZGhVhTQBuWSNvX
         we8wFJXyRfKnoay0Y+e9ficfe5VTSB3+o0WmDAyPoyuFSSG6WYzevr1KBXSfkVSoENIx
         syhA==
X-Gm-Message-State: APuU4Z/p+tZcq7NRM6Y9LKYs7FqVq0/qQGvEwTcsYa0HbPhEQ5oLgHQ7
	CBNosy1lppiTk49u21Def/FMwvkRLjNlyRMoeUlL9y/hWqyQ+vB/wadpN/y12s4lcY7FB76hJQf
	JJedsOGkfjSOCXpLF3BN8VrC8xaY/iFeF3ysyQga1dQ2G4rkAJLREkRBy3is5ZA/hf8KafO81lM
	H6Rg==
X-Gm-Gg: AZFdTZf0ZMCoqMfJ4chHVY8a8DofsikfEFigwdes2gYJQYKZPPpTAkbM5XlR7tIObt7
	Pwnvxg2F8sX0jjAh2u4p3/ANhhmRx662aGmHeIZ6LaT2JrXMZvbpWZuzsDJSUEsTPNlMCEDT7D8
	OQh61SuiHpOBSbYVRHJdcCv7lwgXYPDtCvYN9koU2eg3yzCc4i/MPTTkKRrCviu2pVBnJdw6VqJ
	qwm8BSXFyAI6f9sdTHt9Bo9+9zUmlBN3hSue3JDzpilFTim/egVysAY+iLkRr5k9Y9Z2QJLgLmn
	rIZzq+wRh22Gs8qlXOk5QpCdv4aiBMz3qzEXcQKiBA/UtKXdDAVd4TSUesn5fLfmmk/T42/eOh7
	E44STIsnkXKFJNT9xIqJDJsOJ6YI+nZM90tI7SnNGJCzZLf34Wwtk0rq8aqgYd2+oAKQQocY7nx
	ePp5xI
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr3380280eec.7.1795172830918;
        Fri, 20 Nov 2026 03:07:10 -0800 (PST)
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr3380234eec.7.1795172830267;
        Fri, 20 Nov 2026 03:07:10 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:09 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:45 +0530
Subject: [PATCH v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-4-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1069;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=J9MtDhNBRc3o2KPFtx8zuqYMoIVGqmO1gPFbpzrqgQo=;
 b=CxzlhjeUr8VvYUtjmp7JKW6HknNkVY9G9NNb994Oy2SYh/r7FFm1+OnmSzS9taDYET68xu9f6
 qG++w8LB6UOBPYBepaj5kOZ56dOvRRtQdRwSI+9scxEhST270OTcHXu
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXz5g7MzLWkcsA
 T9kKcjIhNXqJA09WbRY5aziZalvRQ46/mF2HbrR8rhgPuHusl0WNNYaWukGebRCegeTGp/bx+hx
 IhBHPBQDY8V2zdy3mqNKv2BkBnhWPOB4qn0D7nOAJXWnd21ZjTDz90bTbfaUw4L/nPIhpFXh7x1
 FVQgFivi8JdZYKUmkuOtJ1I4jAQMXrBu2kJjoq3plxYF7Hinh98nEI7iJFzHoul/1UCzZnOnRV6
 z3qntIYxFtBAO9Bfua3Tmhxq0M4qKCzg0JLW2L+KT0ZiRWsqxeEhLvpMPx5tyIaIgsJ7tMwRgOE
 IcfDuGzhth6rxMHx2bluyk/krltUwd5YMA7vPz8c47B+bBSh60kXaYzt9MeN9ZOtsefqO+wSrKm
 9+z2gj+efcxtSV/EFK07jwtxg840ZdreAsZAZBnNeax0JQ1R/w0vg5io8McJOtXRdaXjGT09e/n
 6IfTcRzmZAFNpXn7K1w==
X-Proofpoint-GUID: CpWNBerdmlWeQNogKXFyj5DY_iLPHSSF
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b0029df cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: CpWNBerdmlWeQNogKXFyj5DY_iLPHSSF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxjXmJR35yyeQ
 f589CaS9jIJ+LtvD0Cle6KmjEJSaWs34+RI6FQ0wScgrlrnzmIYev6RL6em0NTf8BTQpGTj2CX9
 k64LN5bVzTAorPWTChHh6KJ7TihpzbE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030712_959385_E821EED5 
X-CRM114-Status: GOOD (  12.10  )
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

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 20f329c0df75..be71eb30f997 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3127,6 +3127,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		llcc_bwmon: pmu@9091000 {

-- 
2.34.1


