Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009A8606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4kedFPRP;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HhRk0EOS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ireCszdL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=11q+vRagsURgN003dOUkw2FqOxmyzwDRHyxoyWI810Q=; b=4kedFPRP12SfvV
	O6EU/9CUnp+E1Hb7NYxXquR3xORM+BCr/1b3CDyyp+EcgDJn2/VZkD4TFzor96R1iSMKzCFv6i9Yr
	Yk7XOHc/tTN5I0Bukpzn22Bpy3f+K4lsKRc+U0MybrZo2HIxnPHdE0OXLpUpkND7sTY89xdcPsKuy
	3UHZMFEhKUw19H6iEKh3UHE7PmI62pftduCNNcfA/rYsPQHenKh0Ctyu9mXlZPUkfy65k5/lwfICy
	CmPkK9PKJWu+Rlq76xlo9lBweQzv6Y4ZeToVk5ygUJ1YBYjWeoRy1w8RDUutwLey6psYmWp565QNS
	UsCTNIyHWabj5WmWHToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuP-0000000F8oX-0LEY;
	Fri, 20 Nov 2026 13:44:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtj-0000000F82T-1SAC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:43:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxBi556459
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11q+vRagsURgN003dOUkw2FqOxmyzwDRHyxoyWI810Q=; b=HhRk0EOSDMm6nvZ3
	BAGnmzSLIm528Q5Si1IhHj3Tzlzrp+JyHZoLm2JmVEjVYgGMtQ4KjuDIIoaZ6xZh
	qOTJ504wX/EzA6aFbHNQvvUXGH51sDUuVgyLOrNVtUS4hyWd/C3F2nof8FkoVa7V
	LP+zkjQAXP6XnfeztLRHG8RAf8MaB6HMzEud2eSlUEl/epm5ssRgU8sGfR9u37/H
	98C94Gaa3ngMRSZBDCedHTdMIkWlbLJz3WhoVE2mj/PEyRdnQ2vuthmurKJjCJiu
	eIxymer2Qr+UZ398MC8juFurjyKcoWC0Ose6iOP/fkR02mNbNWnLKeOhsD2/cMqZ
	g1naWw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbj15u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383165e9b0fso1015775eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182205; x=1795787005; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11q+vRagsURgN003dOUkw2FqOxmyzwDRHyxoyWI810Q=;
        b=ireCszdLL7+s1Wm1OSeVciiWkCWiTb5WZ09Yz589YvZFvNjENCsRGHJnRIxPuX7Kh+
         cUwG4wvOoVAxBoUkTVR/1R5jBT/B+d1J9HyzG4fgDKA5c/6g0ToouEjKNngOZbVvhzv+
         1qsyhDP40kjM/+oF/cKRCibPad37waATgzXvNSoEfm9XMfeMOTQcSR+kPWP2vF7tA0vZ
         TcUxeI29v6ZqNPnK1zIt1FUT0dsIFlpYmPYIeVjoq2TIUOapM3MXVHC2VIOMh8sSAjVY
         8EJfNosY0vOUlazXXRMEJALSoQzLVQj1CVPWsjb4IaGoIM62OZMDTw3WVRtgO9MhXHOv
         0fVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182205; x=1795787005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11q+vRagsURgN003dOUkw2FqOxmyzwDRHyxoyWI810Q=;
        b=XzbnyY8Z6NVO7JfR4FWKV1ykQcsra62Xm2ghEfLlEMWFhN7Ztj7goP8efXwmc19QeJ
         hWk+mD2kYaIgN6wI/AW9uTPTcWgdW/B4ruICC1SA4Xdsa5Ee7cuhG2W5kH90DoDsMhCo
         y0Fq/CcQt/+OIAoUIOlcjjJMtqCajJlkJj7KK73/zNG+ddutFcMlxsElJ6zy0kLaWctb
         5QXE3kdcuiFfRY1KQ2i8sVTVt96uFtbtMhNFdeBReAIe+XwMyoFRkz8Sr0bxgc/MIZdm
         ewrBzXAxta/XxVQh4BuMtpIuj+j/RsTNC3xiu6PNNn7JifqX6Dv5abAhWFfhd+aDTkSw
         hK5Q==
X-Gm-Message-State: APuU4Z9t9Wv0LpHQ6Q8koiS8yJfFauPq3ISNNuieJWElBn4P0Kd2/4oB
	lXVr0pf3DMHSIgeyMoC6FQFIMG/kuhHoWMk5bHjeQRG0UqvF6bAO2gaJluxdeBmH9+Bfl3PGv76
	0h+oaBJUO0dsxpCMt/141kudT0AG39InIEdu9p7vYXOoRiYC0UbdCGLcknl09iUVU50XUQUByAD
	FbNg==
X-Gm-Gg: AZFdTZctH44B9TmeMYsJkqcaFnOm7OxfCmkMyGB9UC3i3bIv08BjamM7Xpxj41EJJR4
	yKqOXVq49FppOa+SjANeGKyrUMTDAr2fPU7JRhUvtQR0hziZfjJPxh5PO5qn3zp5Pmj04WgZ09v
	gjoCHXdinHa8Kzt9yl3VfjNx0iT/3/8f2O44pB3qq/qbd9Qdk+juVBzR1ipXwdetXfyd7dAWr/z
	oEqSIkZ3rwKcL5Jd4axyiqKOzzVlBAFm36EAuCOYvuciPGt4ZDYxHJ6YPtDAjlJ+olUhjGcPs8S
	SyX0Jhcu7Q/WQiTICEhHohR5DsoeyDIxn8cpJ4qoCx4tHqwcQWAPL7yR54nyoXda56MT1xTpFjp
	HxduxVNWAG0gTyKBsPvYXYxLnINC2iwQa1wUjdonudzH4OJxtYuh/YEJKyev4610nSSg+3YW0p/
	M4Q6A=
X-Received: by 2002:a05:7301:78d:b0:385:bc4e:dbbf with SMTP id 5a478bee46e88-385bc4ee6c2mr2084213eec.37.1795182204940;
        Fri, 20 Nov 2026 05:43:24 -0800 (PST)
X-Received: by 2002:a05:7301:78d:b0:385:bc4e:dbbf with SMTP id 5a478bee46e88-385bc4ee6c2mr2084180eec.37.1795182204261;
        Fri, 20 Nov 2026 05:43:24 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:23 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:42 +0530
Subject: [PATCH RESEND v4 11/20] arm64: dts: qcom: sc8280xp: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-11-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1035;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=PpMW0q5rEXx+xuC5PzlM9sk9j9irWo68n5zPzl2ij1E=;
 b=Pkjaoy76t19TmVXyKiraf1je5qnYdJSqZ9wPp1wouYn2rcPq2jp+UCvggSvaMM9z1JceutZzn
 GG8Y7hYOgMVCfLpH6IlRbXGGvBGWghMLIBz9aEHYzIxRKnjldYDoHOB
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX1IOMqCScFiiL
 ehLGZ1R7tFB9B7VirFoFQKWRiTKwgFJJg7NWdQs2HdPOi0MEwtNzKY8nhyacXgxkoCUWwn0z+vs
 ApLnQ8UZZ66OEqyiB7HqFqwUoTqF5YtA8UrEdf6vEB/MZi92YUsTcqb3ssLQlzyqx+3JqXmt7nQ
 o/HD0frlin5wP3atqYQd55DcUMPbO4f70ePDxxduzWL90/mX8yQHpLxT9DNGmFg2vvr+3Q+aLrH
 0uYag+ztms0JrGzGJUKd0EDHOA451/quIG9FpBLxpah9wsjhY8pNoocDg/SbHJJUr0gUKooTvgj
 +PpTKwNcSv6hNz6CkE/n8CMb8HLVB/ePzE+aRLZSGa85D1h5iCTG+OkuPihrjzKvCXNuOWdus7s
 2AFF6c1/NeOzkswE4Q8gm9barGHOOhv/Lz7ci/f5h1eAdAOeX6x5LftnBtoUvAs2Ii7ge5LhwJP
 bTqfsojfUICUwnwQUkQ==
X-Proofpoint-GUID: OBymownWQKrJw3NkMfRsmnC4YTJ-EImM
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b004e7d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gJkqCKp5Tu2al1pXNpwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: OBymownWQKrJw3NkMfRsmnC4YTJ-EImM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6McujhCGTTJL
 uXgaAEpo9iv2vs3JWaGdQ3WEDmcfpTfqtKwAILb+NPuRnZIg7eLiJpjewRN0VrtyL3oSnxj4O26
 4XKcgtjRlt1WXCQKgNuBmTAzVrDDfVs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054327_521310_48F2F9AF 
X-CRM114-Status: GOOD (  12.28  )
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

On SC8280xp the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 703b4f4e2059..74c53e70f0ba 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3564,6 +3564,8 @@ gpu_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		sdc2: mmc@8804000 {

-- 
2.34.1


