Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91776606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bdl8GTgT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rMkgZkyo;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EXt6C3VQ;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P55BY23i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=; b=bdl8GTgTNJr3pB
	jL8wozOj9d7Ylx4ZN5fdnRgVq/FCY9skK88E7n60YfIKcLaO8URqXP8u84cHdtLYQkWWWVNwNRQvE
	oLmvsT4YUxPBjcZKuUkqDNMgq7ui0b9OBufB6B4ygo1MZsCjfubmtbeKIebLHxdZhzbu9eRcLxEVG
	j25iQWt2xG9bXYOOvNqU8bzOxsWLr6ceWUPdQQMRdwQEL/9Qhac31nDOBCzpsscQJpOXg5Mxs7m4l
	0ALtRruUj3G6TusA1MQY+Vr2/K382wFv3ZBhZwIrEM+mRUZPPe1OZNJOUbvPRGhiUREWafTWCdmZt
	Rqf4+e1L6mkCjupcDL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuQ-0000000F8qT-0BIL;
	Fri, 20 Nov 2026 13:44:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOty-0000000F8Hk-1j67
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Nov 2026 13:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=; b=rMkgZkyovY2yCeYdWk+MopVFKM
	bGgEXy4ewpWjQ04AG5eOO0TnjFWsqTp75CNNxfabnpHEnkbLEuGiM6b1Qba1adxNAUlhhA3wuoYDs
	Q8faVIMxelne8WMG28EffSx+Kcgt/aAPvoQ9MVXwUyWiE7NqFjgRX5dV59Uv4x6HkBUI1jAppCK3w
	Hja+GSzr95kHsy92bkk6banLnrxC5luo5rdqGyWvzBfajmgid0EerqM8X4ZCFhPto0qeu7vY3W/0N
	/aVr71XeA9Bky1AVEZWT9F9EQSlt3SYUqo0ayOdw7bZL0OEWWtjRXhi1l1fDL4hEmM9dZocZ8LQcc
	ewdH1k5Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtv-00000000oX0-1a78
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:43:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwM62155236
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=; b=EXt6C3VQ2JcShR7T
	GVvfexU5Hiyo2njDSWXR6umb14gkkqVudyIg/z7liTj39vlPur6P673EpvYgfbLA
	LWTynnvFsGDvqiaRUUpCjyetduEDpW5XG9L/hqPOnUcJxpEMWSQCnq3yALzxGkPO
	8vTxI5nz2WdAMFybi03wUULzRClJLaUUeZpFSwVQ+lvWLfdfBxcucJi/giTunp6g
	Nb0iI++HuTV4+ZAMKJLE/xOFqiO3SEH0gLJUzNtsfDQDWX2MWzll4GDONQEt3sYf
	bfMJDqVehLWDoPkidDIDwg8LT5TXJ91fhQ0ZrzVT3Wgv2xqaquTYU1ff8aK0tafb
	SoLK6Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yj5ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so713420eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182216; x=1795787016; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=;
        b=P55BY23iDe9josG17VBhDgn7rmK2fV9C/9sLG5Hr2XcU5iovbRTT0SlMVwFWmXExcy
         11EcpIQtPBwGcC1esF3SvnwfBqZqw8Q06Kkx/GoUOm/Mds/PKRnLzXIGYAL4QbZIPJKe
         DmfxIfQoONL4vKE5HUSUWudRz+D2YNjitAKq64Bru8Ha/WWP7Z6jc4W7AsMBpVUQxd9n
         lcrRCMNOBXb9or2n1aO6boOjjXuPa3e0YB35jPYP09g9fCTyLoqy1A66rXieaESAMBIk
         Rzi15O8w5eJaja1TgxFPF5gFq8tDi0mXcAUNeimp/PCBymbNvTqBPJ49GNesyOiSGFel
         Pf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182216; x=1795787016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=;
        b=jWG0tPvslkkLjQ7Kf2AmcvnkPc/NjrfAowEB6QQ6LRZmuwPemSiRKMjbSzSBFIROrY
         SHsYQHcPpqUgC/XXvTveXz+AqyRTD0aT5sVtCDUBNnCoT2TuZjcU06gbPsk18LSAJYQg
         AIRoTVCPA2zaQblOiQMAPmdl8q3UI/e8fVEJ9RKLUFaHYWrJGCTq48ZaL0IXY0q4+pZO
         ZUKvWKPIGOp5stDx22ZdVez+CJUINSzAlpj0ir9cp2nUS6BDxf8RuXeNoHFEZ0+Outdz
         FdKKmagVsHR2pl1x9keQp+uG6DuEnigryFYGM0gYAtJXC2fmmHxY9DpXs2bdrC14dSRa
         cwoQ==
X-Gm-Message-State: APuU4Z/63TSfuOZt1fkQGjyiz8RW9BHAy9pL8BxW0XG8dFTb2C0dhWGx
	wA2RCH0hmg293vrvA+MfLxhUllBfhrDCB2AFV4pK6Xk0K1Gt6k8QByUR0A5PhU+I1yEWPJxb6Q0
	kevV3YMRo6XZuq+pM707P/MRGCMnHyicJZhFzm6t9j89DvuorrbmcLjBNgPO3uJjg5Y/f7vJuIg
	8aeQ==
X-Gm-Gg: AZFdTZffIBtxtcuAfs+0s7GjwWfSDvgN69yGk4VkV6oteYCGLujzSmvqpm1mWcptscG
	QoLDVq9idlQlyL2B517LOSsGJRM+0doVwWEXofu6unt1DFfDUcfVzJmTzHxI9NsGm3y7h5ew1RE
	f+e4KQ4UQxXSRI9gJqbxGoe71WE14dnf6s5n6tVevhefLoDfPmlbqdQv1sd7xkwfvl0FyZj/DC/
	cVu5G0AkG6KS1nE4RyeSEOvawz2nENaN8skPb7z4dhnALWp6X/CN1dHRCf7o6u2yMiFlq/STbAs
	pp3jJKEP+zDg4rg+hE3Clr7bhDYMGQMfytnZPWxJ71cZ8lagWXeNTkPuF4jo7cS5+gjqHQ7FZLi
	bgiT8UY5Dah+EKaSLcz7stcmnd3ZHz7gYj88Rpcc5EXOy5B+XY/GkRfiBdUa1LB2bK0j+tzFK/h
	uHTEA=
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7abb with SMTP id 5a478bee46e88-3860bd889c6mr1578889eec.11.1795182215836;
        Fri, 20 Nov 2026 05:43:35 -0800 (PST)
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7abb with SMTP id 5a478bee46e88-3860bd889c6mr1578832eec.11.1795182214992;
        Fri, 20 Nov 2026 05:43:34 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:34 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:44 +0530
Subject: [PATCH RESEND v4 13/20] arm64: dts: qcom: sm8550: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-13-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1041;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=n4/9ykaP1GAiqJF0FkMOaaqLHTN1pKjv/oqRYjt++ng=;
 b=726DhEZpUXUvkLPxl67ZyaCjxVgALzXfrEUAVeS40RGbSp26vuIM9fAEcFJifZWD60gu4TCqB
 n9AYxnZOgJaA2zhyZOUOVTdcErENn2P3TCPi4ghxJuXbnRzIXYESNkX
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b004e89 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JoDS-ckYLr40ggPBIxEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX2azWzxehpzWu
 67+25zEb7c4yK+wU0JomZvOPpjSXRZrhQzqm2LynbLxQIF5oDzIJIlbEXn6uoe6SSJ5i3m+jP1O
 ygRV4FSmxbhzly+yBoLAt87RDcnlYURgWsRiJ0iDFYcaClt6b3I952D6avIZJ0KcW3GnnQ0iiS2
 hB3ZQF02Pfx6XcJgECfpLy0nfkY1JMa77KTdAwuTzCJQiMuX1ATTtWKh+SZ6sPZs84pgbDn8K3Z
 NJ5SLGuQgNPwJBlfKuzZNptFIQMLzYmagYecrPgroTYJxc8QRXpiwm3IDl88OyOpVp/4joTUXsU
 Mro1K9Q97ILwe5HvL4gyEQS25ofaUjVQBTiLobwx461cpwUl/eLoSCufvfTF+a70OZNv35WuejZ
 AhGVut40VLnekqzqp/uP/0xC/JWEt+fyXkLVRnra7tl+pTN1D49dg38gn56JORxoeFnkz0eKyYz
 tvfouisRCWZakvQBvZA==
X-Proofpoint-GUID: AXYsRnvSbMgk45clFIt0cX4wocZmY4ev
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX7mRu6L2HsQqR
 Za/ZCuMNepKFxqwZDHDoHyojdvZQYYwWDG+iUbTXX7HrNJ8xOP9asOn0lenp0/nig6ssDfdmk/x
 RASZs8b6CA6DX/xdMFSOuwu5Nl6If7g=
X-Proofpoint-ORIG-GUID: AXYsRnvSbMgk45clFIt0cX4wocZmY4ev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_134339_515747_666A64C8 
X-CRM114-Status: GOOD (  13.32  )
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

On SM8550 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index cf7d67faef92..1604d590d7f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3073,6 +3073,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1


