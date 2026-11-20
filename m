Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A63606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ulItClmS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aOGKSLLx;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jDRa1RoT;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uyv+FL5G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=; b=ulItClmSZT0QVb
	C7nXXFrvI9njgQw/CWr4UBeSYN+oABUBnJ/FbH8a2po8wqE+G9FDzGXroqsL3dAgbzPYY+pr/F2dr
	6zfrmJvUcQ/KPkZsWk1spMsIvkeK7UwQj+mXA0TGJxRn8gSWWQaC/fRlEtqdkw0AWSCzUSOpihcGC
	daMWi+2Ooffvg5sxivc1dY5xcufQIkPoh9/szEAK7Gy3Plq8PTYdRQTTRWWQh6BCPOC15MTsJLGcu
	feRpNCFGZz5oJlsNgqkJ4krXX7tzvtujfIuheJuiAjUDe77OOsylolAtW9hSd6wLFGI6z6J6S180I
	POfefjEOUc9KEN9cDAsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMV6-0000000Ej3g-2e8j;
	Fri, 20 Nov 2026 11:09:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMTw-0000000EioR-1oeB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Nov 2026 11:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=; b=aOGKSLLxrMHRNPsVmxuX95Qmat
	etvkAFQkKvAUapvquF/87eFGMkYc08AAckxXIR3BLXZubm3zoThwW20ZZtR6Q3rD32eQJl/8wBB47
	5bOS9IL/7dSrDKb7Tf/mzN/qYd8mnDRwQ93MINqte5VOhfuOOEuJBF+pXu9DbOhDMJoEXIKUeQUbN
	K5J/m9e569L9dEp4Ztx298xnpf3THVJsTosC74fcJaJGyDRyZ2qa3o/5RBpS2J6VJ25Awe6SdkaNx
	B8x1yswiMHOHRQmLtKBn0q4FJLhexAIBcpnTX8QuPBjW9qPubiDRETD0wAROhBbwmacRKqTpWMSEf
	w7M7IneA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMTt-00000000gpr-1vM6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:08:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk2Sl2433198
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=; b=jDRa1RoTaVw+kV4J
	iIijYa9u00DawX4XZajLV97ka6+MLEQEBiV/fMXc2mMzpYlSptndOwbjGglq1A89
	OMH1BMildAfBYUFQtDQ29psB8zoo7r3mp2inArRf57qeL7fml9Ua/E/HD2Avgs08
	X6PGKImROaZV31P1FdjyXf9YtRv7ojUQ9V3nkpwY7JSGOuml2T/ahjm3dA+GD7ko
	ElBYa1MES5HNqGrZDoR0o+1gUktwWeKqOStxJokhQOfb3b28tASG+uO2EHMV8D1D
	cZxmO35EZY+KHxbrowW1rHgHg4uqUeydrPP4aMDQ268wzHiqoePtZ76ovX+3rQ0l
	plqC8w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9f56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so2195905eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172915; x=1795777715; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=Uyv+FL5GS8+Dw7SgtkELQ3OffOyw00Q1SX6SC1hOiGNIEL0ySNn7Y7gDILFaiRPN9r
         HbMt6NqADZ0SysEROdCy8iuwkx6e2eHpcUQyAlEozTOypVOSNZv/Ev5WgOmXV1tCps3U
         OlDheNgAX14I62DR3hWXeJIgyVVhUWUpsVvqMlXg58fwnW55OP054QDMIplNM4xmH/DJ
         0MCr29uYmHFWukVaVocUe+TzdF0bA80jQCyh4MCdqQgh7L/vz3lu4OjYm6BPN0bYOlWL
         U601Kjbqnt9xHUghUGqpt27FLfpEnN5U4zMQhvWF2O3uXp57gsd/H7eh0MK3Gf0ArQZu
         Zmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172915; x=1795777715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=lpk86YGhiu/Uq7AmSzlqffac3BUhimGCyr3wF0ayBSQxDZ2WpOyGyoYpcP06bjx5eF
         nGfXmgeO/0n9WnbKCu35y7wSZbwx6IXuZeKeiMqUV9pfnhV3Hx72VS2Q7AVjjlsQvsFn
         Xm59hfh03Mf3GRTnGmcGoKe5ugJ2MXx3YeeqmOcdXzeCnCLztOgJ6iplRHqfejXpMtLa
         StQuu5ZH9uF/13ZNwelGoNLum9b2rvUdEnj0kopUQ0uQR2xJlAHcSzmOg6wVmnbPNWZl
         7ltsQAfAtCcNCHQVUq178SrKZxC2Cp372bzrI7jIewGcYNIimnUrm/CQDqB+/JK3vbtm
         aX3w==
X-Gm-Message-State: APuU4Z8qV6h6/SL0R2+DfcUNMZI4qLbIcZKpkeReFEtzhE0OBZuhyTPZ
	Yr99UjQlgt8vU0adgdJ1tBeCe9Gci27+P4o5tPYuYejQgdbb4aUnO5wb1thGhZC182HoscLowDP
	6KIU5J9Y7Nwlt85kPLi9j99Vj+r4afLudXWbAkpU4DR8UGNSTDincFX+fYrFzCLFYVb4PyPAFxc
	uQvQ==
X-Gm-Gg: AZFdTZdmL+o66725GPufGg+wgfTJtV3xN60E93mry/P7Lrq4jG1pA69NLWbRwJl3bFq
	joFoCRl0PpWKg58n7LZGvGRSmksLiwXpp8O79wJqDDm2u6NjBMg0MKh97mpDMTx/A45eLjPonH8
	phSVnrA6sq7MfKAz33nHj01gRERq0WpzkTNxWxfoWGrZXQLT11FA3P96R6jfWEYxBIaOo29+KeO
	ydSTInCTTMnq5DNjNLe2mdlI7ic8LvMvh4H1zuETJuBEcdoYLntGGrzRWWQtK2klRWEbF4IhNHN
	g45RzdBnZ/uVQMvdvI3Ys5Km3UWIa+2LcW3v1VtpW0hqiRWej/BP1ps56BHORye/DZFRK0zSpbp
	dcl3xKD/z5Sn505dPlrZAUS0kXh6q0+DcIK3CKoQcCa5VyFOUjSE5UY/LiiwFbPZ4deKI8bWDdd
	UJYbJA
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr1056752eec.22.1795172914339;
        Fri, 20 Nov 2026 03:08:34 -0800 (PST)
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr1056700eec.22.1795172913510;
        Fri, 20 Nov 2026 03:08:33 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:33 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:36:01 +0530
Subject: [PATCH v4 20/20] arm64: dts: qcom: sar2130p: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-20-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1058;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jWnycFT0az2p/u5EzI2kuq2uyYSvSmt1HyCePSsKymg=;
 b=thxi+hGWX+1dy5BZtvJRpmYMDr9qfMtvkKDe2syJpJn9Hx1JY85585k9BWL5+9rHULVGt5OVu
 82NLnnek2Z5BqczmG6nsufHpIxgrHR4f3gkqXhQm+/IQ6mf3ViKyScb
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b002a33 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BzZyaU2VGnUrTJno3XcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2Q/RjM/nmIqt
 Cd9xY4RzIaFffbXYTEexa1R8KZ6XtjpS3cfyTzACG+llnpaGC6/K5t7EOjj6cjo3taoP3TF6k4V
 zFQCbscNn3A5iQ56SO2FtYPrvDThpvo=
X-Proofpoint-ORIG-GUID: FLudv5nRGK8-UWYiD9lm2XDpONU8e2c2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX7W/6BpFTGBKN
 4WCW22GBy4UQWKX3J/3k5Fp5xE7EyAKFeL/lSAaNlwXmXFV1q2Q93pVi2aVnHoOIkBrNyWpP0Ie
 Q12lEvMwKztGBy1DFPtTlQIQ1Xnk/2oJVkrGsLbWHl3GMU57y0CYf7uc9Em82dQWtcVJ1KFGkpD
 a8B/HjbXzZ8Dan0m2zmkI57hpv0q3o+xQt/iO7ApQRyJP6oUkqIB+EAlFVMf+1wZAsFgd8mTp6S
 q06z+a/kPXL7mE5+LZyUkKXi+xMQedmf1WIlxyz9YO19BcYGz2Cv7XzpTkq0HbNrhrE/XH2zvM1
 c2YMwdTs1uruH+oALr8uhRipHqxGtUXPTawLcKujmzSAQnCNsDruDrGt/Fg5gvBH94d3KMXRAy7
 rmGlmG//1xW5WHO3dWn1lsWxOH9NOsTNDdioI+tnhTlXcemOxVxvQJJxhZSv2BD+O2498Akqnek
 +rddyDgSYMu3IrQP6Lg==
X-Proofpoint-GUID: FLudv5nRGK8-UWYiD9lm2XDpONU8e2c2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_110837_732343_DC1FAC12 
X-CRM114-Status: GOOD (  13.22  )
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

On SAR2130P the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index cc4077005e66..950fb83f26db 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1857,6 +1857,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1


