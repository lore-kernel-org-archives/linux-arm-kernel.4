Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB3606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kPPfUzYZ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koskxqCn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dejpCyLL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=; b=kPPfUzYZ0LSkWR
	l5z5YhpiG+d0/c2sFKSyyo6jDar3X03Wh+eI/IGETKqwUiAAD2+LaXAXCOUPuaaMudIonVupbL0Na
	/1okDvU00GF4JoiXBnf2RyT2NFWzAC7CC4qBKsjzGl5SagCT6PEHXv9ok0VORRsZhy4qPIoz17Wih
	OAy+sLN5njadoHqPk6pYZ/NTO8DKg6zCBfu0vGQcwpkoJOMfPvrd3kaK8sfz0nf8QGsyVSxgeTg0p
	mgEkXXS/QbBSl9wJV/tDgOUGCzWE6AX6deMgBs4+2Ec9GzSQ+qfleti3N8ilZB9byX7qJczu3zQIu
	Iqzij58WwvIbd8EiE1BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMV5-0000000Ej3G-3KbS;
	Fri, 20 Nov 2026 11:09:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMTC-0000000EiL5-41tA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkftL3107595
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=; b=koskxqCnq8MhVs/C
	CKwbThD06UaTkkfRTXXCUuz1i+bZzwHF0FcDd8BbxC/exytm6F6k0wa6AzLt3+HZ
	NY/SiCJ7yITHOeZg2qfJtHrfWWIxBHvSlvFtVTCDmANaO1RLAkLotiYHc+Ox8v8e
	av/Zer2K1JHA+rrda/7zA/CcxMUIs7MfkJlgQar3IyarKxWueOMIROmjooMqjM0x
	bfLWuQLR/K0SR7itT8qW/XgKVL2zr8uqRJ6lNL365dpr2Mj6F188YXVfwFnN0La/
	a8uBfhYvu8BtYMnvk/1S8meK7CzASWp7L7lc2dp0g7o0Fu4hFChq/51TMErRxWr/
	8oOB9Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3by4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:07:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso848319eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172873; x=1795777673; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=dejpCyLLyLuFLIKrrz0t9TLjocCjPzMCjkpWqsmnxzZxfgYN78Du3hFkml86MVYxq/
         LhxKhx9GNuYdMm9W1SQNfUUYoxEdhkwXTyNhCY0+SUJNA25K6gT72GLQAwUELgkq98g7
         jfQvw/6xF/bAffCEorxcsoryevKsImWF0tw2J+aZr3akfYsWbZG2tQQSZAlydcegDs2U
         FGeLzc3rIDSX2CxP2EkXznmXlLIE0drca6cQE3Ig4cqttqqxS1DPwqs9n4jyq+UoAdiR
         yjr06MJaegKqjzkUlfMgZataJr8CIvCHzEwblgKzrGr9Pp7D4+0s+oNVl41sjrLjZeFP
         zHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172873; x=1795777673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=JHc542GT8TBLbQ0/RTRM+TUOl0ykSq1UANlSI+D/H16yIltjlYRwpjMUa7MDbXEAHz
         EUiizYZvPI8RofC74C1RtwNoOo2QtJ1ROLK6n9+tFdS/LjNW0bAKdid5xO5bKhDauLgc
         kA/sGLq4PL0VG0Wa8T3OtRFhcahG3G3osRb/h1ifEOkOyAcneQLMZBv+2ZE8TK3TbrML
         16b1d5qVMb9UP6BfG1nuhp5/FlN41ZmFkHkrwdAfQhfCxCcQDmGTfPJuMF8lr41IAMez
         t1SB3mAFeNg99or4OowIhv+wUbGDeR5ndEcEDsBAa3729xmEka0QPxW2qBCSAF1O91lm
         Bwvw==
X-Gm-Message-State: APuU4Z81fQ1ISwmDXI4Rtd+4V3EUbNVC6qhu1ZZJZVJrWAJz0OThSeB9
	aIp8NLxD+uSQ5i/rKaPz3UDO+30YrCXayroZp2A7YChKyYyjnMyl53DFoCKU1CQRI8Q5WhDMFxA
	wHMbRm5X4ohbTFAKl8C84O57RTpGNIYCyk6TylOVL6VKPp1oZO4r/H/47k/GkbqQFcXtsjs+BVI
	Er0Q==
X-Gm-Gg: AZFdTZeUYDfy5G4fhlJ2j6h1Mbu14EHW9xHurL6DwTU7HAO+rmOQRy9MRQ5bVcRyBft
	8PN4C0PcpZMHctg7hC1VZjOhbIuaYz4qEABD/1G5XTi6Zxafwx6xkN3WkGxbaFQFuMhJx694P4G
	HpuquGXI7NFR2ybNDY6L8E/GzjTtkLfIm21+FrtHiPoHVBH8Qh7YCPp5UX8sddRyOlvmdrRFDBy
	PrG1kzkvKLc5AvQZUiosuulN97/ly0R3WKmVIqp5dvB+YmAXik+6sesGwRu9cNIqgrlFM6E1JQK
	lR/WLR3l3mqSuDQPGgpwzvv8m4y8BmuMnRCexr+t/v8lq6A5h0599dgZQv0QYqQnA1m4DGosgSX
	Ri20dKIxJys3BcQgeFmBMrs0S3b+ZDknBfFk/LJNzj7V65K/vwQEah2LvSxesh5ySq0BCPwsgtA
	dT5KY8
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2801648eec.14.1795172872548;
        Fri, 20 Nov 2026 03:07:52 -0800 (PST)
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2801610eec.14.1795172871888;
        Fri, 20 Nov 2026 03:07:51 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:51 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:53 +0530
Subject: [PATCH v4 12/20] arm64: dts: qcom: sm8450: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-12-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1046;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=XGSCDo+PAJtTWrK9Yli/KgTXld6tpUWo0Tp3e8IW/LM=;
 b=9gz/rvKKgvNjj6uwIais3rFdCGo4IChAppqwi1Llk7+aKXWKIB4Wq+mZFHmQafF1TTafELH8Y
 idSDNiNfrnNDmSgmeMAPynBcUSsHZD0PwkqIfI31IXZryVAff+gET7+
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXw86MSMNAkqNb
 0Jo6MV6FgewE6GP/e7OgYh0NOkgm7KoxzIn9+2Rv2eCAQOmjILYVeUVcg4T/j9qYOKSQKDC/jD+
 Ibd3pZxZRC0bRU4KPTQbgjZsE4Uq4fDNHns+gjETBpaBvnEkdU7Qh0e5GT3b6Dtvyrt3TXxzeV5
 psJWWIzWweMpOi8rTx9VSiAwAPIJUoKJcHRBa0S11cqm0UQp2+/IfPtXUOHKw4d7GQvfq+lN0K6
 RdpWNeuuAJDgUGb81tspvzd4RITvwvST5x0TZ3OPP2/ZGTaI4I5pRgY07OelHHJZAZoYASMMQwC
 QAv8GzMt2g0dk8aclXxzVGXZ60TgUdH5tVXS4T86QCJa5n9dKrz1ppIhEXUP1GWjGTIqkBF0pOh
 jp5TVayTXF6t3cFNv9TUBrAtxClixkR3TzioksHeAU+DMCTNMTYkcfMVnESpTZ/BdjxJzStTzzR
 Fd46utG3P91NclL90rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXz3rpJZUti7jD
 dyYx7ZcLcW99vi+RZH7bNbgVOOpS95cOVCJomGaN0aVd07HlTF+p5/g/eGGtafbexNKdhMAxJli
 yYEu8y9F+U6HVe8LNq+unLX84CPZFTU=
X-Proofpoint-ORIG-GUID: T_7C2xsaAlzPfQ8gBtWCEdW6zUPOsZXQ
X-Proofpoint-GUID: T_7C2xsaAlzPfQ8gBtWCEdW6zUPOsZXQ
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b002a09 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fzENmhSgVi5qTvzIpAsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030756_763622_881FC456 
X-CRM114-Status: GOOD (  12.18  )
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

On SM8450 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8f84668169fd..f7dab346cc70 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2619,6 +2619,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1


