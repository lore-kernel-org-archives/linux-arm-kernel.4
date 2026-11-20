Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58164606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1yOukVwh;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a5z1jAs5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T9pYvMBv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=; b=1yOukVwhpu0dVj
	BHU2abvWRhnuPGK+TRd7ZBIf0R6lf6sN9IsX3ifxG0bqyciZiOHaEe4fEyK6dJO+k+5Hx/zHhu71E
	h8n525Z4UEbNZ5O42VKUYU+K68m4bD86eNwK3TWOl1oJ0dluNZ2VAl91hNggHzC476MZiRTOQqUt/
	Z5lH4vUDGP4z/Avso3U3oSI4pfPIJ100QuKrK38e+GeMtfwLGKZq0ZwX32L/d9Ag2NpVOcNYeNZtW
	e/oQKERdgyuk0dmQTvYQuxLn2vKTmv1wszvBcyrv2dcm1KO0vjWFpvqfx9Rt/F/22oo7wWXRREClg
	Kpis5FRgG6LCqouuPIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMV6-0000000Ej3X-1RUD;
	Fri, 20 Nov 2026 11:09:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMTS-0000000EiWV-1gdb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:08:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjvSB1060458
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=; b=a5z1jAs5MMdI0hy9
	/2sSylcgaFjGeMT5+JQIh628CxXAkjfvE755/fL9f0OsvxCeDWj5ivd/rlibN1n4
	Qa+fzaJNafeiNUnRu0LFOguj5A86icgccw440qy/gvvJTboiPZuvxSrGzh5F1Nr3
	sfbQq95BT8cJRKWJx4AU5t11Y9X4O6FBOlasoDB6Oq/76AZOAtQMJ2J6J+VKMMr/
	Coc4Bo/iNSUu7te1HH3XdtDKo2csilTZOCnD6x9l5QgQwT7ym0M2ldbfM6GFJLk8
	qyX7GLmnCSTA8B/6rqgXY/ZXu+2L1FfFYpdXIj7jsIFMZII/dvhT+QsCyUoIlUos
	S8ZhdA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykbcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so2194884eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172888; x=1795777688; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=T9pYvMBv2NX9+RI/Aw+LMWUqknm/N+DTmsa8S5JlJK23om/qRui+TViCdRpe42rg91
         Ec3Jw/M7YFunGYCYqy8FWxXqq8raCiaB6xheTNZJtLsfVDLLmBagIjwUWosoCk6fdfyq
         2IlRwJ3x5fGumKz/2VVHiTDdX0SZOBhCVMNHH+BS439+ko8X2LpmY9qx8tDQCdXffvBY
         ZeSjPfjMiSHgX+yO1TbjkOvVqQI7+KsQLGqsBRL97SpQC9ouBhfknh7uqYEb5M53TZyS
         OZqX2Bi5Ud11ibZQQtVuS2w/noyi/no4CKNXBMMFyaX5QbxVsatejDEoR/Tpd/xJIO79
         F1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172888; x=1795777688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=VtmiuzJQJf5SCPlLvajqL+Vot3ziLsa6A5Hg1VjEoSuK4E6u1VyOIRYqR1SX7meyMM
         A/DaHCNS6KgJ62Utrjhnsh2xkZSyPwM/9ocBmDF2VF03C9C2McRIo1tRc3hjMvDCZgoh
         2e7OtYEdgMKOWuBL7+EdsWqRASocddzYznxRpTsOPulvUre6wxUN6fwKNO/M6MCbzDZW
         Fz/26u1F36Zn6OG6dAFBKJ2coq6SqYIC0OzE6aIOkmC9JpeJaEDUi4/MITIUGhN/Bd0Y
         yeXrJqutZGBuD3KD4dtU7NPFON09RqHUa5xGyjCzkDNdLU8GbUSgMWVbrYd+4B96zc5z
         29xw==
X-Gm-Message-State: APuU4Z9ErYHtdACjSRaYt/hIaDRPS7PTlMDJzJEwcRTk6J9eWOY2PxWW
	aZAUSC5mh888TCGf0Gyttd3fjLSrQtTOfrW49Bamjhn18miekT0dPPzACxivn2UyjqFPI9tO+FW
	IlgqaeuhUiPW5KcfRjByoll2JA/JozaWFc6/ak+jAXhPgT21dGk2TsOObc/FM2Mi3d3lyrZdLz4
	YZOg==
X-Gm-Gg: AZFdTZew2+CqE9x8rW1T4e+Nr4f5D8Nb5BqLBDtwtxTV2frehyO6l3HeBbQPuwJ2Xo0
	5s81B/oO4zIARs4J8/mAgb5mDT+VWoDjApkRt7YZiOgfEmpkJ7+BAAqwV1Q/HPdKrdFPcBfWOwH
	vZIqletbwmrTAHalO6dDgLGYcgf5sjaWJkaFG/f/rmRyUUYOSwPk6KvdEn/v6DpauvG8gu0CGjD
	2ELlZWFdzoMnfSQr+/ORnCGQbur9d8XYwpvxSippXPZGRLOkjavAPfb9yiTvrPLGlaC9ZFxhcHv
	EbGjPjMayjczov/oNyBeP0I1h5hWM2FnVCSqhZGTbBp4byowCY/SCSgmVXj6CTlHLpO00wshTn5
	QzQtUfRp54J+jbkRnJ7g0BBS6+wNPTjs6Wr1mgaU/ryz/0ol0IvyeTw14W2FT340A2HZHkjsVbO
	3CfbjZ
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr2199506eec.39.1795172888156;
        Fri, 20 Nov 2026 03:08:08 -0800 (PST)
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr2199453eec.39.1795172887470;
        Fri, 20 Nov 2026 03:08:07 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:07 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:56 +0530
Subject: [PATCH v4 15/20] arm64: dts: qcom: hamoa: Add GEM_NOC interconnect
 for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-15-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1049;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=o8a7Ojp0eNjNzQ0rCM2WmCZSQ5u7xFkQL6aYtQmrXTk=;
 b=d2eocCApPGXdnTgSfpyPl1IT3Npi+VGzlX8Texs24AYeMDJUpxzteo/necfGq9pPJ+rGkHPav
 w2QQPhTc/MEDRSCceJSSG8DMzmugQp/HbB/FtH22nfxMVhA/fxUyyUl
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX8fYSVAYYHIN5
 0wAtpJIAAfBCcf/M8mdb9a7fAKTLoETcHaILzPu7hp2rIcX+eFZLIRmEzn2ite5vMiIOgEVYRGB
 t528d0F3XRsHicFZ74c1EMOdrvpOGAc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5SG521rbFQMX
 QS85hTaNdZeg19bhFzSxhXonOtDMW5Pki43AFhxE7Fizafly89k4q2oHq9UD+JVbQLqoIh6GUS1
 NcdefnRufltzEO02I4tasp+/YjdBsydBVrA39mnv2PaMYHlDWa2/PQkHHM0xkQdSeL3w4APYzAz
 H8P66pYaxH6osIPcks5MsVaZJ3et+ptEQRQ+W6kmozDPlBpJyS/uXOGjxQZnpb1Jbb2tyEGfCfF
 SsD2plIVMIxpp62/j9gkq9oBFFczEZ8fdx5aK22Ak1Igq9V2g342Vu6GQjcyAGxM0e0qMh5w3QA
 l/X1ioIrkV7uUOq3lwwMIUDnT9mbjh8ayz8PURAUI+/py7SftRfY4VwFRC3S3usLIB0IuIRDaKr
 C96HHPwJXZeXHrnRh5lJ7ug1APRD5FrGuw694SfVtMaPnw1pFFpApic4T6Lu5HMcA4O1xF878IB
 hS+6nLrlywt1vM3jELQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b002a19 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WAcSZy-hVgrt5OVmuNwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: mvt_GTdT2ERqqURvsC6jevVhEMuUDTZ9
X-Proofpoint-GUID: mvt_GTdT2ERqqURvsC6jevVhEMuUDTZ9
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
X-CRM114-CacheID: sfid-20261120_030812_323849_5569B2E7 
X-CRM114-Status: GOOD (  12.12  )
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

On X1E80100 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 443c1a5c212d..f5b720d73a4e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -4289,6 +4289,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gem_noc: interconnect@26400000 {

-- 
2.34.1


