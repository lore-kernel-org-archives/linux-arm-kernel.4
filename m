Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F260A383C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0qdSiPq/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lV2OMf+A;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BmTnERIO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=; b=0qdSiPq/7NPHrH
	nTng4amcU4UownrZMGBXl78VWpYWyBZ/YAt8qH8T8HwvZ8xmpfmaQnEqvdytDTmK4WkYUMt42TnHz
	IO63/z36j8aHJA0vF8+YLWXGKzJ2/YD+l67kd+Zx8wfoIJh+wCJx7FM2huCR9nEYci1TyVos3cmfI
	nIXiWqgIDH+UxOJDvNWoqU3bY/X8NbN+HS2mPboeD8VfSTNsPZsA7m0TF31pzlR5cIPwip5Vu6wBF
	lqTcrdZGCDY5Jj+OQG3uv7+9DHYGGDRg6NNN54EJDxc2NSyztBouxkU4VCuXwtK9HjngBVWYZ/+GU
	0lwXn6ZA3SzuRVWK58Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtf-0000000F7yX-48vO;
	Fri, 20 Nov 2026 13:43:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtT-0000000F7ki-1RNk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:43:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkfUD3107598
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=; b=lV2OMf+AO/WIMczd
	5TY9H/Sm6NbzH9KrP/cYGNhJ81qogUKwQTc7Meeq+vgjWerGjMpfPO/MjrSjjpST
	jJ3NZSsDfUVYzUzbarDsHW8szqr+yN3H9aIugcOY1QYd4qRo1MmdzfnSx/uZMn9l
	rjhKsDiQuJJwhdRMuwEHQx3510yA5eQMeSZpIRzAqWxgadkbSAA4POKqFyYAD8Cx
	6hU1uHB+Xu99vJFaEOmYvmnLP3XxDdRnA9s0QprTp+J3CZxUMXj2vC/08UdO2Uhv
	Ubr4aRfxO5Xw4qipLuA/zBwfG20E9msp1kYB024jfyw7Xfum1fFBbSyaHsK7XsNi
	84Mngg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3wxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so855314eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182189; x=1795786989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=BmTnERIO3ukibfLIcb8hHwxXjpQJKlEjux8clUpV2DVdj3FEMw65bLV12GboLal8Sp
         BVaA8El+g2nhfb1KTtqkFwIfcJZIyqL+pKXXAFQV4rDoNJG9rRHbfOL2IH7vG390AFUG
         szJJqtufAsACHkZR1Ea/tTgSz6e/N6uDoB9XyoPLkUCD/IhsZoCwTMuQCGyzd5k6a4X5
         d3vLRX7Ctrh3TQSIJv4AnGSTPhseioSpp5JMQGaRjrG4qhDNsZpGc58yqipPTOGj4U8u
         ipBiGNhNvet5Y6/OW3EJztjsjz79Tl3LHcRckw8Gdi0cfcusUy3LOjhwUIxd+p9SkMLq
         DO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182189; x=1795786989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=2E4D7Hf6qj4w87eGc5QRAZj1Y04huK3jXdPCKjDWtQENPYThP3U6w5Mzra13bhBkSv
         MFyZzkrAwV3dKhgqFMsvjWWfQc8rOxRtjdFzIUOozjKHEgTxCw+32IoQz2zE2LH8rKjd
         kqenM0WblVBi+r2vDnZuWs0AK4zk8YsZHX2YlppsoFx1q2rBUAOSTLDheJV17MXR1PA2
         WBA04iUR3gXEOmGd/NnPuwPHx9P0l/lS1UZyzNIH1MvUNzx/3fnAVumWZoEsIPHQP4tp
         diS8iYLKXF4ZUdK1Ed7ovBleo6wdOsGMUBPsBJWchA0o/05BUXsHYs7adDibFRRXO+MR
         m91Q==
X-Gm-Message-State: APuU4Z+FBOzFn+c2ZLQ1PA25SKwpb9VL7XvY4eBZVy8i5ZO8r0vVlvtN
	Ym1QRh3Hluvz4B1vnHf38GOC99VnLax29Mp9xsu4n8xX7O1bSEifI/22hRc1bhuYKoSaPEWLdSo
	NCzSA+aS5ieqEMc2JHYYfQYrzmFBFtZTy3oJReXX/bunYRftDwxYMA+az107AOFJxfKjDFViP4L
	hafQ==
X-Gm-Gg: AYBFou1ZGcF2wmrCcmP4Co8yglp3UDTVPqwH1kOHWDFrTAbwsgkUhh5hWv9x8B0Zr9q
	euTE6ySHzu5EhxrRHmyg3AwR3OCHd/cOFgIv1bZpwlgpEWB1N512pkiyhBhQebAEFLQLVbqzoMT
	WLgajrfb++DdT7vhWw8P3xSBKp6MEYgrJDgOup6ZWW2Tnu0Y9Xu9o10WQeVtpCujhGatXmzzcJe
	ggykeQ3v8MUlAC//+s9wxYkeejzIn2266qHmYbf4mfuFP48zTUn1E3ZxTLKDxPZRlpnjah7vvt8
	zon5X4i1BmOe5FC6l3CO3fgCDQgUkMZsA6BD4FU+2mjplVk4oEITBv6mdrsqj0qCUs/MXwm8wDb
	qsVXh6GVhz6xeox+KLHQ5fAjv5YtNQ84ZeHVkg02uiMQSNgG6B1pOHn4o7KAuKufFe3onlSS0Dj
	jw6lA=
X-Received: by 2002:a05:7300:601e:b0:376:6aea:ab with SMTP id 5a478bee46e88-3856c5b58e2mr2940775eec.3.1795182188810;
        Fri, 20 Nov 2026 05:43:08 -0800 (PST)
X-Received: by 2002:a05:7300:601e:b0:376:6aea:ab with SMTP id 5a478bee46e88-3856c5b58e2mr2940732eec.3.1795182188122;
        Fri, 20 Nov 2026 05:43:08 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:07 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:39 +0530
Subject: [PATCH RESEND v4 08/20] arm64: dts: qcom: sm8250: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-8-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1033;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=W3R0vadqLaDaPerwJqu9PSx+OZnsGkbm84YuXP3uSZ0=;
 b=UXjvyPjVSFUzv8MWkI6PHpXR9uFIip+8s4FKDI3V7v5De6PmcMG77hWXmqGhPzGsaIAqRjl5e
 dXXkYAE7cPcDTXRoKoXj3qGk19IsmRItdN1AB2V6qAWzSjL23J+XvLO
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX0Lc+xlBcVMf6
 bSmuoV+iN3wkEcw4zzNvtY6O+smVMhUt8YygixUTfhHBAIGcO1gFDIDSHqSmEdk2x4LHek9kCd/
 +nOYo6Ls8iKHAZr0ZXxkJskSFEErQ4TeWN1rCEXvESdl4umxE3jV4hAij1jqTEYmyrmIFlESYw0
 URtDh546YZooxrsRRsXTqLjXoXfMVKHw9/MKZAraGZNUWEPny0S1hLpVciWXTeQ+h5IUi/sSihq
 FmcX7F1VctUwh9BgO4aQ57EX+z9o9F+CXFce7G6lA8E+2HBdVptlVIvPM/n0syUfWsfX3jEzW85
 eDmK45izCRKDewaAxtazFd9skitamudEcFihcR4zncjva3ar/3Frz6wiom+p/SPz1ZaK+G2lxvf
 pXjjCG52sX+Sgpgm+WcUTfHmSritejlc+26IgI+dToUfkWVh9fxXgjnKS/2W9sysuihg+uGN4y+
 zvjuEKFAAvHuA/UgAKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX5HaeTiJK/BdP
 7xOb3vrdLJuo2TfBbslyI13V7Vq7OkurmqbdU+LaSM2oE9X1fmPWgPpr8Z6N5R66+LyCMFvvMer
 CSDypglS6/wOdKxqL3cnbo3Jptt7MhA=
X-Proofpoint-ORIG-GUID: ayxmoe3Y8s6_UZRy7m3rCqrSAmbAiVTr
X-Proofpoint-GUID: ayxmoe3Y8s6_UZRy7m3rCqrSAmbAiVTr
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b004e6e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IeQ55TmpMpvzCWFLjAoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
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
X-CRM114-CacheID: sfid-20261120_054311_492085_23FA7885 
X-CRM114-Status: GOOD (  12.19  )
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


