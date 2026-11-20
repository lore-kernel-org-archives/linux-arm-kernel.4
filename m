Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE83606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4+wCFcGg;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kFgqblB1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mu05/OEQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=; b=4+wCFcGgJPnzIj
	oHJ+Yq/PS9bhya2BrvV+vRm4W8ADKM6R+lqQ9dYKp+OzFf6MUUQ8NY2tLTQJqXMZgJpEFowqnhjSb
	DSZm0e08YmrTWOD8DtBkc3PZidIse+j53V/wxfPG6D2K4HY8BJTg6IPI/fvxvFLu421WK3dO65EAe
	g7u+cBcZcurzQ6aOE5YBKhFRyjMlWoiZPznE3k3v7sgM1K4AFhEs96a3yned5PVk6IfE5Ci6lxBQs
	2Eft7bW+Jnl0LiaNYI3h2MqN7l8Px7j7e7AseHYeF0vmT/mbITtrwznaVM4Khw3QWLcOlJJ/OMxxs
	SvdkZMX1jvOzFlUd0mlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMV6-0000000Ej42-3jZ9;
	Fri, 20 Nov 2026 11:09:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMTh-0000000EiiW-10CA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:08:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxlo556465
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=; b=kFgqblB1KyOqBzjl
	SI8BRPIVJCHt/dZOvNY/RF9Var1F1JFJYPJwoH5d/m3NEMAs7RoNmUPSAKp0G9Ct
	nwveGZltxWkQSbrPADXZgyrtI26A5FofYrfhOWmexCgsziC7nmQlvlzOQiVn/aly
	BGaa+hQeQ1Ir9dYdKfXJMJ67wRO/lfYjaddOKVUW39B2Mm48ybfT4ZJLT4bJ7/ad
	xbgENLiwFp59D0b2uIPRf5qotAdPhwzfGEGtQshjtO6iof7pfVR4TyGWnglOImsT
	qwITw4fRx1y6399xeihkKRCDamzcClB1DBo4LaOPrKuBga2gfWkZVvNAuAjfVp+Z
	mRmZ4w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhe5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso2463144eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172904; x=1795777704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=Mu05/OEQbgu9ao0W/Ut4F8lFZCz7vI6x14wO/kJJcqSVvkp6YzTFnFHvveLZXOL6S8
         zNieInDc8oAPlk+j8Iaxk3vVMmfaAz2GW4lQ/AMJgFECEJ6/aXIs3zJfMcQq8Jff0hLn
         VyEGVo4BYvdvWWYg5DZsZKYES44Ul4adqxHSWyCS0bLECBRZLrwyVo817rwlfVg2qzzT
         CbvpigAdkE/J//gvz5KuD6FXT+s4UlGyejz6PgR6j56lP4LSiQv3odsRtZIzNLAwsU4L
         WRJ2BPEl1/jtpJUDAkXK8uSGkomv3E5M/VKbXBML5e7D+zEYjHhvtLXxQkzlmPt56Bc0
         ZyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172904; x=1795777704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=Y2nchiVfHuDtDbN8ZEyTa00xi0iKt1HGaUlj/33/M7hAyxkT0wqBNXg0zMHmFqfHqq
         gvJTImCMTQIRqafC/ZxLILEF1VDd5uO1sIrAwW1KCnv22qi3pZBeGRZSYvwREW5Wkas/
         VVT+RtheZIFnP2Jm6Vatgjwub01AyY35BARW3bx6miDdNy4pUHlEYYodCuo0iVV1I1b4
         HSB6LXhgV2OEH0DdsEqmSZ/zrp1PjPt7CxZrCMxoZn4bPh1Whl0Kffie62F1arBEaice
         /r6Tq8BJVDOiLWzMid/G7txNAfaig/fpaNSq313jCHih36BHHB+g/2GYqZzwDGOmzfpI
         XgAg==
X-Gm-Message-State: APuU4Z8YS0t5ymmnCavdXEgVgltjjHYbGgcGZFa7fAWWTOLhOiHAXox7
	8TUGcev4vC5n/+o+qtNXpPWvKJIHKmBWC50pBqMKDXDWfSnKcf2xSEDizvz5IsPGkyjz9jZBazk
	BmNtISWS+waZVtKTMOyaDDi6gk74LfchP3veV6IJ8+oMqodWI0i/I84dIb7FDRxCgMnXK75oEY7
	UM60QOOvf2uA==
X-Gm-Gg: AZFdTZe2T4DDh4Ru0aWt/ACmpFHKjKDGRPhNW1vrGMAEBnyzMPflLwsh8wyMNREpNqq
	Vx+j0u+c7jGnjcXqEEtogcbXkarbhWg+IPJ0pPH70gOJ7iVHW3R3w8GnhXZ9y4kF8yKhaovREmC
	z2o6WCz6SjZ+vuj3WiTChPdLDU55J82UTgsEaW3Xmh2jxvzF71wvWoFigVVImvtIRrlPB2n5rAe
	WsTs13+a7j5nYWyzqSXsb48pTzTCZn/ZzTkcQDyoTZb0032wAP4ZagcXLcfIi8TyzGEx8Ka0F+2
	fhXgGFah0+uBSmaiKvYLskgaa6tijOqUsNmrcVC7d2Cct3RLCCBMFxfbaqqLmA0c924AnfyXip+
	F5tvWyCosmt0TOgUd4o5FQ8B363QR20JNMt6NfLvBAd61QDIDF7g2Ix1nAWsaiVDzbD9xc8ly4p
	X3r9xe
X-Received: by 2002:a05:7301:619b:20b0:36a:1d6f:917c with SMTP id 5a478bee46e88-3856f45057dmr2756101eec.22.1795172903815;
        Fri, 20 Nov 2026 03:08:23 -0800 (PST)
X-Received: by 2002:a05:7301:619b:20b0:36a:1d6f:917c with SMTP id 5a478bee46e88-3856f45057dmr2756040eec.22.1795172903140;
        Fri, 20 Nov 2026 03:08:23 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:22 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:59 +0530
Subject: [PATCH v4 18/20] arm64: dts: qcom: milos: Add GEM_NOC interconnect
 for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-18-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1035;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=uW8nrRF4SJLtr5/e82lnBVVXICez3ZPhzw4syEcDxKA=;
 b=UVzRHXN0oJO9hdlh7U4rxJrqxQy1l3cZ5Rlb2hk0YTnyggdfF/MY0VgoShryhbLhtW6NCInlJ
 H0MBMdEyI19B4ktai3TXrSA7fgr24uRXz7FNw2lNnZDAoaeKB6/8rsU
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4ziDl+mF1qaH
 RK1NfYF4IYWXqoQcJHBdUXtq5rofLuR7GRty9Vb+Fzjdrs/IOTNfXlQ/mmVbTTovs2QXTNT2t4Y
 hA3eTYjyVQ9Bf1eTTj9qjbWgGhXgt8LtKmnOmQFbm2NKrDiFLWRPM/1D3QwCXMmHie3157STe8M
 xkpbQH5KvnNzyPSeEiHsQP7HeHRVsT1nH+5w61HjrPq2Udbqs/5zBozUBoxDKEq8rf3mU3m8unu
 1z0artgW5wPrU7KbZ0zEajgztspSpTzSeJoa2y/5/pa34w1VHuMZLDPKD11kmQ37RVFwhNoa9sq
 x38gl86S3xdG4cjOlzjslFXrVki+RBgSTwCIq9iLuXp1qGn4aR3q2x3IYEzgOZq1C6LULbHa5Dn
 KRg88O8FjNh/xNcSNpHkaDGZfpyeQCUp0MReDDNJM9/CUwcdldWNxL5lhvxrntlVhnNiM30ux7v
 Cpws7f1h4FU6t9q1pIQ==
X-Proofpoint-GUID: XCL8INEhlWOGrNmJiFyuSp1fWHslci1d
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b002a28 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iSr-qRAn3DWi8jR0IaQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: XCL8INEhlWOGrNmJiFyuSp1fWHslci1d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXyFeBAbOuyINx
 4eweXtdkDSOGbvOpAH7fx/5n6bXZi7P7y1WDvHGOj528O253/woeJxtLo44YWZ0P1kUBQC2rUA9
 LsymapQmKDP6VcXKfhiCkeP9MmTIfX0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030829_727307_2BDDD0FC 
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

On Milos the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 9cae93b6a610..49ea0a8759f3 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1988,6 +1988,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1


