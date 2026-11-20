Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E1F606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1smkGltB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VNU3qhTx;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ALIrRl;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SH0AGJ8U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=; b=1smkGltB/ZCzw6
	hz+yhv4wMlJZlfYgHTpccoD5BuAPhnhQzoP1P6wMUin9UpJo+WrOCQUHs5H1mWXzt38Ee3UaIIu+V
	8GIPrTrs+egY9ANXqlwietmJTixJnjWP3Rz53z0YqhucWKTzfAKIhuj+o/Q3B094chkGw/5c2UdTr
	8EyWykC3+UIeT5EZYaAaJO+s6B53J/V8m1F7FLX2KlwdyF+JWVk7oFXfSSmuexm9XXOhKoRXhCJ/g
	o2DotmjwYYwlPDqtqxgKtks2jS7QYHSC7ODpNMaqLhncyOd1pVF08fQF7vU1oimhtP8BXDgIvWYv2
	aRa/ipxi8L7eVvW9UEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuS-0000000F8v3-1fAj;
	Fri, 20 Nov 2026 13:44:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuI-0000000F8hs-30fu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Nov 2026 13:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=; b=VNU3qhTxDsEZwO+jvrzGcQ49Kg
	nmTk52Ahh2aUDteiwAlq4TVcUhHrk7je98w9D3Eugu5wEian/d0VSzBRNX4VXP8j9z/6+Ifp6ophv
	amfUbAklEfAIdz9bOvwT+as+W9jdYoXpmnqFHxi3ipzGmr6SOelBq9YUtZ5fYcccGusaR8sMztnak
	fPjoXZQaZg4QngHJWFUIOB5N2+I4bzQvoB6ZJna1oWtVRHGd0iCaJeczPZDJI6VXzszyLWeP7Cwr8
	ymLsF3dY6ti6GDqBNCcOfT79RFSFvkxo3G8pivc5fmyNp2ctW4TC5LR+0Jva+03OoEUvMztHrgLvn
	u4ixfBkg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuG-00000000oa6-0UrS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:44:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtJN3731152
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=; b=P0ALIrRlHSIpYwnF
	G7zeIIX381YdjzO5Tn+y8+uGwytHLwvvvCMV8Zn2ATImWYIuHDBlSNPbYj4HM5+N
	UAd+jeYYktMpph0XVMCk2zzQNAIC5ef/NIkpXZG9yDo9rzcAIP4goyyp+hstjDNM
	sSVG7oPuh/zet9xK48cYU8F+nO9fsl1y3aybLmYvffbrHB0ys39289NYvRtnMH9T
	Wy1l+KX0SNJC2KwCnU+JA8Vbb+yybaoXYW6u4csA2nZtaKrJ5PQg6XTlQUsbesEw
	CYy28QCLcGB6KAX1uG+/ce+1+91bQ5Pf22clCUSxs+34b/uHEYpG9aN7/GD06wRH
	W271xg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4gnhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3854627c1c8so1303581eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182237; x=1795787037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=SH0AGJ8UOH/2cwCH+Wce04q32ntpKS9rSpUoBXm+S+c6/UJ+yRw/iDjvslAhaK1e+A
         MOST8+/yJFHrD51Iwwwk5yBvFhDXQdGfW2ltns71F9p92N3LVy0H9+z9Z8jNywtkn+iU
         Uf0xJhRW3rK/T2K0rPKikUhKc91FMptwc8Z0Jcuo+gow3g6uc+lIGDMlogmqDALJofBZ
         fNJVDJvVp2TTigTuuyAcYo9OGmAX3dkeHp/oD4A+xKXtNTqb3ZyjEg2otC5QQKyma4e/
         GxqBbT1YBxBqPDVAZOW3PH7NpEtmFy7he1nWrTnVjOrsjxTDlaIffaLkdtSdzg8XbW8z
         7IDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182237; x=1795787037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=bV/U1xPqMqAIq8Qp6ZJjk+6Si3Q0nW3SO4VXVTtixK8ZM3XGbc8jLYuzjGGr7dFNE4
         4pNu6OdW+GfHzKy/wLCeiiFUQscYTRjGLSJEvZkiPnDqKSmTE3nJEU6/RlMajUqgzQ2D
         xXeQhyI1g93TcbB6ivjd7p96MHA4C2DghasogXT0b6PUkJ3i7WO4I3qUI1pnd+C3f0iB
         bZwANh+l2clh5dsiHWXvsl3t0e218/uCY7XNpV2mprSQYJmVJzKReMH+QVSJCWTqdCuX
         t3Pf3rnxyeUBErOibeM34Q9mSU9aYRJsR11ELI3ZpkQQV7NE9utBQ2JED+RFJYTqUpms
         SEIA==
X-Gm-Message-State: APuU4Z+0PXxMg+ehPMBTltRjukCpIYvX2NDghWNyr41Ppupt2JdF+MZT
	01fS13pOX/w5b6OMRcWiP3hkUTaWSU9gBixeS27RVDnBwDEUU/Uwk0Jao/qdiqFguVn3EofWlNx
	eOcu9bvAVuwKPERR44UTfq24ePdT1p5M58weeyfEaKtzS5/pNVBa6wV3xsS5d6c1iSfc/YSwn2T
	QDkQ==
X-Gm-Gg: AZFdTZcDP9qIhErXvsF/GbPmcResmxrXJvbqf+c2WnLjfxbAhind/RF/chlflvewwCH
	cHEf8gdCw5Hc3oH1Dzcs/taTQ9/L+HjYPBLx7iPX/C9XPIbd9K9OtW2MJx3rO+pZPXTaU1SMxee
	i7KaAwlc0BrbudIom+oIhbv404Qds0LEBEPKpiZaP+PCh1dx1lLwv7EEMaqq+MYLOcnFfUO+7Ss
	+0K/PHx7H+9yNr+dHnEtF7djUshen0L/MQU67687b1Wq3avOcvyJ5quUz6UqprFkKngobNe3P5K
	Rmdp4Yc/XmOPUp05kUbiSa+8F8WGYzs3sGkFMgQlxOcjY804mZyxdM1l7Nf/vVThdOplnEpRJnz
	7hCyeN+kZui1d1bK0ksWzZnf4c8tDYD3svIWvF3dbQm7/3KHvmV8Icm36IoL8PuLo9zv39QgJlC
	BK1Kg=
X-Received: by 2002:a05:693c:88db:20b0:386:1920:ea0c with SMTP id 5a478bee46e88-3861920f023mr1270303eec.37.1795182236923;
        Fri, 20 Nov 2026 05:43:56 -0800 (PST)
X-Received: by 2002:a05:693c:88db:20b0:386:1920:ea0c with SMTP id 5a478bee46e88-3861920f023mr1270274eec.37.1795182236327;
        Fri, 20 Nov 2026 05:43:56 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:56 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:48 +0530
Subject: [PATCH RESEND v4 17/20] arm64: dts: qcom: glymur: Add HSC_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-17-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1054;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=kQCr9BRTX/wWuCiHnkZ4IEloHpuZO4nxnn6nFDJWtJA=;
 b=PirKNama1rX6T3O90xikO3zJbs4R1zjvKCN9rN+lImGmZfjb6w8J3IBREFB0LIbBUhDXscinh
 nJcYe4iqZY+AV+QgHvh2Wx4pbn05gQe7wcOegQFFyLLe3xuIl+tN0Pg
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: fX_isJss_o1DeWAudoT1ukEIEkliBGH8
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b004e9e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=a6KFA2mGowSrcUvabvcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX+8MeDWyQ1j/v
 Z9Ci+Bivu40NtbvRDkAC5Hi60xK4RrPs2oWjPtR7NOJnaOm0z+oG9iEWjJc+zbaUBEBzN7ooMpf
 vtepcNFFDWujB3arVFcGKXOJuwB7xKY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXwQDMNrKnG1ux
 3y85gnbcXOfEX8aEmrvpjVAwTYB1DpAkbc5iYfyYa9Hxw8vXPWtN9OI6/QzHUCs8oDqRnRa2Qjh
 zPUtj1OX2n+kj13DxcZvZ0dhj+7PRqsyRNk4GidVO7APe7jxK2J7q3cWRUCdIM3MP4fsiowy6XG
 L/KEu0BMq+n862vLIT1bouMHZSdy7qPMK3fcFYeYilkByibc6uWkAM3BnjxVDFNR2YEq0DbWN+z
 ZLNb07Pdf9l9bsxYJHtejbVpyY4E5lkMQnHJhlJon0kvOZpTSXAGOhzngQM3s4xqLy+6nGIGwn9
 5zkNbM9L4qdsCct4e5peuymqsFBiVtpmZ/LeL+YZMfR4xHTa8FMpd9edeePlaPxanjY/RjC4DJy
 weRVFlACBPY+jN9TXFF35Dhhu9lxl9tHKYpAQ4sJVZN/ipcz6YR+/frLJZtkzZJ5wYKPvdAa0oZ
 5oGOK88n/j1bnuAzS3g==
X-Proofpoint-GUID: fX_isJss_o1DeWAudoT1ukEIEkliBGH8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_134400_232330_17B32CD6 
X-CRM114-Status: GOOD (  13.45  )
X-Spam-Score: -0.9 (/)
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

On Glymur the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on HSC_NOC. Without an explicit
interconnect bandwidth vote, the HSC_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index cdaf842814fb..ae3cedcaf9d8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4378,6 +4378,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&hsc_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipcc: mailbox@3e04000 {

-- 
2.34.1


