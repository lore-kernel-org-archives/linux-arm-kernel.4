Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4592E606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oAa4OVJN;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFsZ1PCY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a2BZUM30
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=; b=oAa4OVJNgHaztb
	j47AQ/Ik7EqfP4xZQxlgdKAMcX8AcvSqJybr2pMejYQg6pjA4lNQD3shW/MKP9iYWh/NJ6hFzV8Od
	CA5dbeHPC2wvdhDii4ccy6KUBiHymYkOwSv6cQSDeKKeOmLPIgU5H/C2S8O4rQa/ds0GAKumcEsWf
	b+3Q1zND2PREhRjjBxVvKWxCSGMjvZrQwZRkjs7ZAyrI+TSLogKCO87uPMwEGhFf+zBaObitBg0mD
	voaIf7njnoVQ2HY0cw0kBsuAQu8tnIAYj/Fa+hqoztuxsJ1ld27jWPJFTdIG/fCGlP0/f0VM2NGBd
	ncM4TMNkDQdOpDD0YGIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtg-0000000F7zk-3Eb8;
	Fri, 20 Nov 2026 13:43:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtX-0000000F7pH-2XDi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:43:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjrtD1681907
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=; b=WFsZ1PCYPHZwYXdX
	pxhYoFglf6/G/D2b3NNcvvzBLrRh5QxvC+BCLZMg9Vszi/5Eb7q7PEk58DZInPbC
	eyRUuDkYdMArQ38nEVLVcFLKZyItTbGKBvi5MuKF8gOn/OIYJAHGc4JiiRWkFHRS
	aM4gXpMCvmq/eny/ITWktSa/6eHTHwyzc6aAlps5g92HO8uLEzBXMcjdZJoXp+5K
	L6ngePj8ny/IdmwoenVRlrudlL2Pheq5IWqXBAWBChdmHg7E5TEhp1FX7fpFSZF6
	VbDiW8KGqt4PCeOoHRKCFFZdoLHWzMiRO51HZ5tQInjTu6x4wreHqZaUiHPwf8lD
	v9i7zQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tqam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1373167eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182194; x=1795786994; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=a2BZUM307gqo+1Lp9aPd5zGH7UqKg4cTup2HYHcP2iBIt6MstUvv0qmzYcwjORnSYP
         z9GOoFXzs2f4/24hxXrH2AWyt/1Zqr9oVb/8jMVhBmFBk3dBEcsLdjjQ1zKd5Kkox3qz
         XrmSL4V+ZIlqNU2/0ZrR2NrcLhoHfSxrUVu6Qi2/lr/q7aNV+j+BTXpMRqSyqn/mwY0w
         U7VA0puS7cs1Ld/ZT+t3ZgCQ2HzVaUU4fjS17nUkVq/15SfDMx+q2jhJJv4N20TdRmmI
         aKUa9XdzOyCVHMyfBvNaYcKIuH0jsmpJHp6zt3EUnAeYwQVxeZ/+/NOyvoxoZpUbKhXP
         fL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182194; x=1795786994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=pTWJW2cVw3QkBozrT8ca7bjNMYk8Z7HCXYT5q1a/RDwZjtQy5G12tSSNzQER2kHpWz
         Hugr0Yv7am7DUl4crU6JWm3Z5IVGrlfXnXv/WaHn6V2ZpUkNJ5Pg2kNFmr506089sBjT
         WJsGJ4hItnm4WBQLkMygMp+2ZZw8RrITzUIK0K4SW0ObvacUluQa2cDdPTKoboCrk/eH
         QQ3o+nCqV97JqIiYVIDBKEx17bArC4zq9q016vElvmDCu7baacQ/YjPS/qsz408rTlp4
         9KZslNOT+Fbl/jxisKou7WYuSqskjW9rcSFb2qAwBEbqr92yjQcVyQdlR3/cIKX2hiA+
         ZDmw==
X-Gm-Message-State: APuU4Z+OYkvVGuRJVmLGpQLgltvq1WmLx4JCzJF10SuliTECzC9A9hny
	8RmMZaJxI/oENptFvb1OPqX3KNQCZiJDpbid0nbfisTZQkfA/hArrxt1PsqdYAhCulEb8LsLnZR
	UF2pE84cpONMD4kHKWVbMWE6Fre0+E2Wwoovs44lElOIgofjZhppe/Wm4yKZb3U2ScJPI/D6ITn
	fPWg==
X-Gm-Gg: AYBFou1w0nSBPvBGu1fDetmbrzzwql/8UbA+lvo6YYFlLMS8MaxRV7SK7yfp7iEHsRq
	zNiioTlSjXCU6dezcpnLu6nDIgME15+D3q+GOUX1Mg8D+fqPVKt1LxhRrQZk43qT8YrWiRPYkuL
	lKL3aXo3JI8Cb/lPBSTn2Y4MvCRnMAVvfkzw5RkMvNymkNdLtKJnya/YrIch70QXJdQcGZkGLYT
	J2wfHdJaAfhks4HO5yO53yeBu567jwOty/mlbsV5Cx9Ul+nJoJUZ2q3iHzxOF8GRxF9lVvKDlYO
	RMFwTxQWLdviDC3+Js5EAewbQ4zw+zYEYjCzvlxLJrXDQUuy9QYixzOOyqIyXtWLT1WD4c4JQgK
	PPeMK0elNx5hYcX4gTceORmNd1UNgpUcJHKOglPr3dsvl0TjZ6BLfEInR3cqrNBIwHYNbcQM0AJ
	oeTKg=
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2865603eec.5.1795182194185;
        Fri, 20 Nov 2026 05:43:14 -0800 (PST)
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2865573eec.5.1795182193563;
        Fri, 20 Nov 2026 05:43:13 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:13 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:40 +0530
Subject: [PATCH RESEND v4 09/20] arm64: dts: qcom: sm8350: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-9-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1040;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ifRBUNcG4S75b7wOEESAYY95LUktSUoyNzDBhGxm1EA=;
 b=Q8yu6sFl8SVM8dspFiUmMN5ffOmdMre6HaKrkUdqERV8yylmH+IBEB/LBKQmZQ2KgivVAqmFt
 gDOq6Ul9ShaBwk+4cp4/63XlFWnZijGOl+HjjqAQOCN+ti5Cre8mnYq
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b004e73 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tc1TWAvYerzeY2VvnAsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: kBmIFQp6nuShvFpHzt64CovNSawHpCY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXwG6TjFHtSQcL
 aYBuaNc7nECCW3Q+yIKKDErrq1oorbQ+RU8CTMq+FNp6WSYCzkjQqnrOjl7XH1hiLkRrxnZT98r
 Mlrr6Ex4T987gVMufIeKZzQnbc5xVT7rqdZ+AYzjrm8rku3jptftVRNIMrnZukXGioFaiQBXYnG
 i41RJUuEeGs930CwJt1pK5trN/y9Lh7lg2XzlPNep6janU2v1yLvg8edlWLlRJ4AADWpI1Y6L+e
 EIuL6nimLse2DZpsqSKkbH6RsxzN1ldPy2iPvEkgrYMXD0ZQchkGHZQs9DjDSsLTx9LppvcRGkK
 mDYXADVhmF4z/vljfBDrS6m7MYhgcRhY03nUXNSo6e1iiNvMVz2QmLNHA+263L1KzLGUbmVSQbf
 MZNn5QWz263qJd9saLhqm1ocLK0ZmpjHc77//eD/0EKVcIlWyqa9onzGFu83RSsgxI4hhOuXYAb
 /oslHrpq75StGXg1GLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX+UBKPyVO0o8p
 jBWSJ23hpZwfiXxV/Y+Y6bIs/iuZPU68iy816sgr0LawEhlJB4Hw/KeUQ4sZbG944XdnfIT+zHk
 pLoT9KqVJHiLLLowwrnA6cV6VEjAXXY=
X-Proofpoint-ORIG-GUID: kBmIFQp6nuShvFpHzt64CovNSawHpCY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054315_651814_6950FA34 
X-CRM114-Status: GOOD (  12.55  )
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

On SM8350 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 7b9966e8fd4d..4edcb06dbae8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2566,6 +2566,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		lpass_ag_noc: interconnect@3c40000 {

-- 
2.34.1


