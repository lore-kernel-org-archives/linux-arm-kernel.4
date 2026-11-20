Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE863606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IY/Axc+e;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=clk3TyRx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksScMtfN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=; b=IY/Axc+eLFwkiM
	oh+F8O7osbW9yUeLVuN39apRQRzkqpxH6CvcPcfDmkvSgaO/AWU3x4bIa9OOEDaXwNch2/LaWBSn2
	/jWtG8VZ9clutTC4LwUzbU10e2DvF6y1mGKf1IGQPRWe5We6CStSgyrtXZrS7Gyoapk+QFeuhL5mE
	zkE9lj3BY4rF7FoNVVavm2HTUfj2RzpFHlNY9f0IgnL6aaHILRWlmmL0hbP+FP3vsr7kIUfEPMDX6
	WBLNP7KbXIN8LXKx5xhu7hdbamsAAk8mfSnwdSc0YS7E63mvlpe4zjUoDr+4EvXoroxBBFQF3FxcA
	SfRWx+WEmthV/AgGUcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuS-0000000F8vu-3hmK;
	Fri, 20 Nov 2026 13:44:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOu9-0000000F8XI-0BGT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:44:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjr541681908
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=; b=clk3TyRxsqGpmwKH
	lXFfHJxGFKAo+2t1b7eu0FhmFz8UU5VLD0pn0BT5PwOd2Su68D3lc4U1WMgdM3pC
	TXHincv92LJJFagvBU3qxroJpby2qbjx3xHsqWhtYE1JLn4ReJGTWF+UIDUP04R/
	faja1vhBDAakHwDXpepD88lWuevZi3lTmylUyxCBpqFHm54oIHDKWTTOs2R1ffcl
	ydKhBgnJVZuNfYtM3VCStl7C5f/gI63pR0/hzVaw4gI5K7IrxkyykCE6QqaDUpDW
	yYSJzAM91z2nrVPn24bTgOOCGw5ZnYgV/fVPZtcrfOu3tVWzmeE7lIyw3OBKc4pf
	1akSlw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tqdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso2856528eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182232; x=1795787032; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=ksScMtfNI3mf1J/rVpEArLPpB3uw43G0lw6YNr+ymBaEevo/X5+VDNfPNgtMuZNGnf
         slxs5jhAjDY96jBouAOM79CNmpJatKOWTNiBI5g3kNXAYvI6g8XAO0IapG4HrmynWhWK
         YAKFb/3dVproDw+sZe9tG929ge4hPO52mo/HRXdpoliwbpAlsEdKEYK+0m3GrpauO9EK
         ygD5VVUakhgvfzpV9eBK9Bh4wXg3h7VW4/q0AbeEPbZQqmXqu28/ynRZ4GFVjIQvo4Ie
         4UT/wTerBxSfhNUudxtkXMjTq8k3lmaBei/ZR0nuCAX7U3pwLTWxmj4jg02mrMEbaWGp
         9UCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182232; x=1795787032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1n8AvJWAPVamnEVhs0wyLEjCYaGptaUkE4x1OLf2QZA=;
        b=akbslaAF3odoP4qb7FatRKUiYIPIE1bh5EFL6/TD2RrwgEazJ8NsO36rZ+n8L+UeaU
         esmQjMWn/SykqvVe9UlA7jqh72nrWpuXGXTtsYlryVAV8rirA5z2UWXl47T0e2oEZym+
         1SqU4qCwfsjwTJu8QCcl7X8RvC4od0pHDcs/fm2MOvvYl18682ZnGi3ZA4cxtpjnY98u
         6PNa3DTma1GCVzTQS/7VA5zRKd/8hj4Cj5R6guNdbWjMKWTzoO4s+3UcgyxrHFw3W2Fb
         Ebvta1fJJUdIzX9qAth00BcsufmHKYLz/Q2b0KC8hP1ydBHR0kYguo052zYnyJqmwdJd
         0jrw==
X-Gm-Message-State: APuU4Z+poQHUUVzONUPbyWgegO3aF+vTZYyDTRz4UQCD/Ir+9QKzPwAj
	IiTUdyMCepHSRyBzWVDFXDnF6jYZCkVUyTctLnCimhnHf/h3N4O1LJU0qjxSHnIOHt7TI9v/boH
	bslYy/EpGyG50209+XLcEDnrEAvjF2f/NkNv2ewQPQufv0lLeTRRKk8dxJddS4O3zs9U//cflA9
	wuNw==
X-Gm-Gg: AZFdTZc2up5Grcsi5MppORqpqxLxq8CG9ROX/5F0/POA1Z8fAIu0KGbZbeP4bwGlP4H
	q4R1+Jb+ZJ9PQ1f7AxBNL1CqGW0qSQxQqeVNf0fEEdJW/Z6MOCJ0IN65DDfHQ2jWOXFm3ITL/wd
	NSrGkWamT4UH8oL8jS4e1wbPviX3C8i7ReA1TD01H780UaSoXTgWvrbLkSSi1wKhfStx2l2oEI2
	cWEc60HOBqA+W4FWznwBxypF7yaX2Jix8cL+EZ087y7t4ZnJWkrszM3yvXGwPd6FghGOTzKisNR
	LpsjXLGZuz1L/faSgUq8EiiUndCpLkg1TUigOYzkKUzJ5sOXh62tkJN+U4rzbgqHFAV1074DGzB
	WhLk9n+rNaTYRC97eFVQT3FFy7//YBdnpDXSlyzKaBmr/PbgE0kyVRxfr5LnujW7UQ+rkoOWee5
	dMq5k=
X-Received: by 2002:a05:7301:f23:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-385707434a6mr3031617eec.41.1795182231747;
        Fri, 20 Nov 2026 05:43:51 -0800 (PST)
X-Received: by 2002:a05:7301:f23:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-385707434a6mr3031568eec.41.1795182231051;
        Fri, 20 Nov 2026 05:43:51 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:50 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:47 +0530
Subject: [PATCH RESEND v4 16/20] arm64: dts: qcom: kaanapali: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-16-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1086;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=VBW+lAkn36GDWfLSpCvNbA+g18nHUbQQFlmvho8wcKk=;
 b=Fm5c9lgr4dbQtZ6J15zj9ArLcVgsoaJbg8eXgfGxClImKansogbJQoCBmf72JtCS7ZdNH5yZU
 9syPd6qmkycAwiyl/Un5MoDMHOeMfsWOs5/rFq2iL1qBF8PoemaXM3b
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b004e98 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iVAGZxyPhfMzDMBdamgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: nzM25NQ4kWb6k3Es9t01B2iv9n5WqFQp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX8xknzPj0Ongw
 P5TbJRb/OdXsaMb8gzBXes3nibkK/ys4PSsBhMT+ZYDLpj9a0HT0T1UxVYxM/FOV6AvUd4jxrs7
 1rT04uShkKdR16Cn1xXdGFtfYofvb4ClZfe6ruvhtb4q20e2GucLsyemUjnKysVgxZlOwEUXCNa
 8y/uea2LYgCj44xKbmUU7RDKZHzuSLAUqUMgWQWAw91wAGTr0fDP2SUh2KkthjB4dee40i/gMO+
 OhKsUbFQ0Wy04rHz7ESxc4Oc3n4gLyeB7XQnDEEPJe9/U6BVAtbeffF+UVbESJMYNIBR1iPbELS
 GsUC5VOzZSA7OuRyJQQ6XZ/gC/USxV2gockCn5e19u7M1mwcNoJW3/7BHq9UFSz9mRM9DHx6lSn
 RsA71OWEDdGd+GTuFpwzfZqSdOWK1dbYzyTgj+r6snLsoRc35+t2RZ50e3e1IKLbF2Hb5Yv2Zq3
 eDdnS1tvuTWRyxEg2OQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX1cO2DDcPN0wj
 1N1x/6y4J06D4Yaykx3V/xeBARIPBLDR8DjRRpIlmz1o1o+izV1eV0gs1pWkCoE/NJsJxtYYVSY
 CZWCnr2p5rfdnD6PTeA55SjSn3MeUg4=
X-Proofpoint-ORIG-GUID: nzM25NQ4kWb6k3Es9t01B2iv9n5WqFQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054353_119782_3B570962 
X-CRM114-Status: GOOD (  12.45  )
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

On Kaanapali the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 9f04a5ad75f2..eccd5451e875 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2997,6 +2997,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_adsp: remoteproc@6800000 {

-- 
2.34.1


