Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88051606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pvQzeUpc;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue94MDPu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I+ywAg5l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=; b=pvQzeUpcWnNNhA
	J/WIUP6pfyZn/OlHA16dCYDiWr5Uf625fyg1uwlCOj8s/BxmdeLITFJZqloUYNKjTY+2zpTVUC6ze
	k+sB9VAqQIPEgllEmXxyXMvQTlw99yaU53qRbSDTjIYzlz7qlLt3OS+Ww0B0F0zrj9LS9wzd5fVwl
	3S8XTf+wa/zSRpu6L52b14KPygY5HNut2mOdLgRMrVr2XkcNQ/2s27uzjHjWNI6c9NzC75DmX84aS
	uT5vaq0+myXEA7lmkVQUE1o19TKw1bcstTRI7vaT147Jn04IdepWi7AhmHZVgJg71m1oPtEN7Y8wF
	x10RPiDbA1/fcoIcpJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOvC-0000000F9rV-2NDa;
	Fri, 20 Nov 2026 13:44:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuP-0000000F8oi-1NWR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:44:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1FR2433128
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=; b=Ue94MDPu53ssd99b
	5yrNxR81kRUlASxau7HIGQ82RGqSPI5d7tonixUXf8jZVUgM+UXr3Mk7VWP7HiAp
	bQjMHPB2qHXkV15DTPPrWzu75QqVnQqIU4Q9wTkGZz0n+HlCbVTPjPtAS0qQSHF0
	CjP/y7ulOliQZS55vDHv+kg+8Hn+NeR4wq2PF3T5zUFRRetgm22yQJPcnl+GBlTJ
	znDEM9wqc3tGrTDBlRptgMUoLhPiwDFHAeH8VVKU6jrBRAvvgLH/Ir4gBTPAEqgu
	r8E2oqtfqiRxglS5rijqi3XlHKSodiENY8XoNVZvdiYjlfL97iKbLlxVr53Jhqqr
	yWH1vw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjja1td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:44:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so713863eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182248; x=1795787048; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=I+ywAg5lHpucT1/5AdDKt5kXuFxak+Fn5NUZYd3ADJ+t4TQYKg3668gfWClL5CHJfV
         nJvATmDoi+32WGOdED4xOeym6kau7/LR+JSUoBbsiO2+0EB2GM//Hx6EKliy9CRzit0W
         4jKPWXXlUhCjjll3yAVOZdnusaLJnVnelLBf6TAS2HMfSfZ1wZCb65XylKUPjGgyKZO9
         Mz0m4Mw8T59eY44MT0lv8KjvOesFn+zWu5FJIRmZBV6P+XgZgxm0Q0NednzPlsVWgr9t
         0hD/vr0RBlYl5LBraOUed7S1zjYVHvpXH02rpxHHuj7WU7qfP/27Oru1YdB16XSzUg0z
         ujYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182248; x=1795787048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=qKHMreGe4MP33T5GRFnjjF3yOEUgVfWEtCUspOoM9v3c+NG+9zy60wha3DTj2TqTof
         ZjPVHqZblAI9bSvvLz3vUiw7Ynb5xlB8dlmB9nLtSPdmBvoMkc7auHCbvPPUUJGEXQ67
         uMxCuXrDCqIIL72+HxiRdrSKSy+S7L9Ndujretu3OsB80JOjMoVA4nbLkE/kCc6La7CR
         BL7TGrzLPgZWDb5g5xB8CKLWxYfgfee633rfF7GOxh6CnVqFbdUWG+RUElxLXSAVoday
         UU3cm7Gkw+ftNAaP+gAWyA+kp6elqaFMiS3wtOHDg+csGnXpiGFaSl+UAxgJJUs9iicq
         DowA==
X-Gm-Message-State: APuU4Z8GB/XRhzWxfH2SC7Ltp5vGl3IPvZZmF8hHeWMWWJJmFZhYzL41
	XrBhbW/nGCUX5/nuembMM4vwwYe2QP+lsA3vkr6AL1SyBJS/XUQc2ptUgZwC4u6tUQpelLIz6AT
	I+7b8sBjxkDpx/P0BfwVXtY9Ucj26sHTuydJ+LzHVJfPJxDwMxmCkpTxML/IXlZdzGQDFfsHu2c
	oWpQ==
X-Gm-Gg: AZFdTZeU1YZ4Y3TvmcYIvIkFnVa+RjzQ8bNO0X8lzdrGqNtq+9aooSUx55rQOT7V7Rl
	oBn9esH5ff5q8GRVD8U5HTTmg2XOSEAFEU92HJQZpFZ0YpZgWIFHJC23G3m5qth4UI1Dz3zC/1q
	vHf2FKSgE2UW+pR0u67d/HdX3Mss0iwjZCVAETh2SYyeZFLjS3xg/mEpaAaz7tbZ7lGMasWx27r
	yOxWfL0G8E5SzrpKBHx3UJVhDxJM9Dbka12R01OIaO3u2/WDWjtGdyC49Pqmz5uWdrgD3GNBawj
	XPsSbGsE7KPHdUqvQRkcvhRrODFky6480J7qq2ZBHSXc+rKg0b9nNidvuhvwTxoH7ioiBN4JAp+
	ixtqy9aYXygXJocaheT8xmLiw3NLsaOj1auc7BvZ6hvZkx3oUKJnWElIlJ8zBnoNmby5FgbdLzC
	zzzoU=
X-Received: by 2002:a05:693c:894c:20b0:377:3984:5cb with SMTP id 5a478bee46e88-384b446b404mr4505986eec.17.1795182247669;
        Fri, 20 Nov 2026 05:44:07 -0800 (PST)
X-Received: by 2002:a05:693c:894c:20b0:377:3984:5cb with SMTP id 5a478bee46e88-384b446b404mr4505955eec.17.1795182246955;
        Fri, 20 Nov 2026 05:44:06 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:06 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:50 +0530
Subject: [PATCH RESEND v4 19/20] arm64: dts: qcom: hawi: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-19-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1056;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=aYGbyD3vlcsShV5PIBfgPkIOIPXgEFvWy/UpvGRwvdI=;
 b=q0jAIPDrN516XpqWB22OPyiiHWhPk4OWO4JIauodmt8cg4tveppR8S6ZONPWykogDnxodyD4z
 imV2vWiod2ECCT/tBCJlHc3jWV0NxantFLQIjX5kyP9qJhyjQ92MeCK
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b004ea8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-u0lSa1b7RXV9CCC13MA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX+d+D7Xo/idMT
 Uhfk2Bn680YglN6tjhzZxJP8g5iOz9k//SK05REIlFPdk7VcyVityuCIq+B9s2o/MK7XuMGu9e5
 gV2L1jTIXoKNSumoXd4go+16pNNeAQk=
X-Proofpoint-ORIG-GUID: ufi2z_t4k4VnaWl24sv4ddsAIUPQjIoS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX5S7GwBfzAdxL
 Z+KhKdQrupoiZVvRCvbqIHwmYTdhc+HTnAwFyHa785XZNeL6/ANOUg+2Ksp19A9FbwqYfLhQ2KI
 gGc5z+GkrqJtBwNFckaa0jQV6R4Pex9Tdi/EU/7nlHUNJ+huoKkLMHMCrvhGfXaT+VOvXHZyWvf
 F9MJLObh8itARryLgUepjghuE+jKvPd+SC57H/jq+MrKqU1W42c/RNlvxjAGynrYtJLhCdOpNUa
 aeIDTgemHtXqWnz8NM3JSV9R7KfafEOgqCkDFiO9UdTtiH+LbLQJRAJYdto3zjelPk2PdJz5EMt
 ETY3FKkf1uH0pxbZtKZsyzEpiNA6THXVr7+cTqnytELW5cUyGU2PnUrfOrN1CtYv2iqLwjVtA8m
 rWb7MOXVakRH1l9IU/ZE2TYfWY5drn5zG0f7stUw8BVkTInjsvPbu/JxDROHQmp7b7BxRcvmPKC
 4SHKQ2myiA4slj8TErQ==
X-Proofpoint-GUID: ufi2z_t4k4VnaWl24sv4ddsAIUPQjIoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054409_421132_92F52620 
X-CRM114-Status: GOOD (  12.15  )
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

On Hawi the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf7..bb60ed9384c6 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3685,6 +3685,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_mpss: remoteproc@4000000 {

-- 
2.34.1


