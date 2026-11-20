Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86C1606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VoZU3lab;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foY1MxOt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eg6qTQhs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=; b=VoZU3lab6XF9m7
	nOIUqB2ELTkzIJQPYX0esNByUS0KRZn3K58hxDbBhyjLb52cDzRPeAvmCgyZS5gWuEiAom9IwvJct
	7s/On3lPq/ax1/UIGNLsk5vS7zAz/qaxG1ibLoPK4bgbo/uD5wh09KASlxX8ZzAULld+Dlpo7xpVf
	2n1j+mSXgqZSz5GiDZ719NDxyVcWlirmsYxZ6clIwHBYupZnhJb4MQqe9eIM5/IFfJZt5ycRCFx6R
	IoH0OnyaWPYhTeHFKEdG+aqjfMzwn6f/4g2Vzs7y0pLIQi+KaSa3SLrBnYwzl/57ms9KFe/NIq6c5
	tvXOn81oOqVpRkBdPFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuN-0000000F8mQ-29E1;
	Fri, 20 Nov 2026 13:44:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtc-0000000F7tf-42Gl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:43:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkDr31017066
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=; b=foY1MxOtGLeNTRxf
	Wpqzp1LgBB1omD+/4FjpAXV6k6mvbWzzlYh82qiTcZUF+SfmZIbBdpu8INIvIzKd
	/ErMKdgAAa9H/6RDBGfP1moSSYgYUFgoBDih9PSjAcsUoShwF+8I7zfBff5+V+xn
	eEtHGtjVmYJt1+xIIFfXp/duW8GP8arigTaRyHTptHzPzsGDPCHlVJg5ZaR071Xb
	ixou/MSXqbT47om0AaP+eC36HrpmqvyfNiXUNNwznEuvDJvDxn5fph+STgwwl651
	knBJim8tMzreuEwNcV4gyfWtveBXOskzSHVIFGdvDPC3Y1rzwK2fkaQExyMAXF4I
	yTvNCw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqst41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383ec96a7deso1015040eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182200; x=1795787000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=;
        b=eg6qTQhsEysAA53jeJc/OcpUJfHzqU6i3Q1T+SjSID0fYkrlyhTB34uOZkc07YqQq5
         n/4O2IlVelSA/5Soa9x1XDfw3x/LDJM6z9zV3zcGa2pXjyn4dntSEXX3eOri8kdhn3kP
         20i8J5UV+QOHPoGsfkD9mOWPFAZSYYO2AHEjIXI6Q8FhIlN8TeVhPZ03UmpaQcndkL+C
         JEaJkHKcBFQAIQaNKe7+JC5z4HzrYlXdCloon35hty07NiYRVehJnS4IOABMERBF0Yjd
         erdnPkzMdhRXyaXM5Ezu+QRdkwrD0/EA6dDAUO1tPei+qEILeZu+dAI/w72mqeBficvs
         06aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182200; x=1795787000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=;
        b=uxCf5kLYvqr/5UYr24oLFsZkTKJXJJu52QKHyGs4GZ7MlufQ2p32jNYZXjZss1sei2
         ABMh3v7qJvCngRAPRMNVRUJyPoBu0mTGCOafAO3MpyJ+hBR/UeW/uL4Thp/9l05PDKKp
         VQfc90BE20D/5uEAygjuCEXToxSqUgDHgBtEe56RxjukmLNWb5JaOHh2WSOemgnBSBSN
         dhYHlca5Va4ldc/kJr+bUmP26NYp1jDJaLqbp5222hnjH7JrcwNs3MLfHtJSD75xrcoR
         dUG3+TLAM0ylEUmcuRtm8qednKXn63OsORFZ/LbPdvBUHWnedurk4MyECg9DOkINreDF
         sZiA==
X-Gm-Message-State: APuU4Z8rwOFPnZrvKVfNRPZ1DV+xa7eq029zNczGaBHE8+JU2k6dLeow
	RzKfw8c5iALwtI6bvglxUEdCtGl4snw/uTUIlKpo+P8RUsucU3lHIeZs2jDTqrCFIxVR48M+E+I
	tWruXelGQTfvhbtIU6NpeQOdJfGDbrQHWy+hGdaFSDRlBCDaHUIGbRUg+lZWzjhzh2mNyeyGzm8
	y++w==
X-Gm-Gg: AYBFou0sLQDTYRtRYgphBw7DhNMPGaS8z1i+O2pn/HZ+ohUyBms4Swuz2qiWPZ/P4PJ
	Nirh5n3Mm0Uro4lmmctk/zMfB3wudkBHFyQBfa6vWhRZejX53jp+yvTkUDix+TdpLucLeoHwujt
	jytvBcqyHGzQuBxkSZniHgAmek8mrvJKJ1cXZlGVailuMz6Z25iOxB0wG4dMsm60o5FY/CByEe3
	apJlkNl9YM5W+piDg2oklLGni3jQTbCFb9uG7693wrrgWS2YP5TsuTQZ8ytriVkC/KnyO+WeIeX
	vOvXATpPW5kCLVDbC7JYQwHeiT++jyqenweVnnhZuqQN4LRLSWd7G3TeDrBCncl0zuEQcZVfR8H
	CYaTRcToD8uSKrrrtLuHsxOT4vgddtEFP7Hf+dPG6qtArWtwFfEBkixgjmVpws7Q0Bt3f+qgf7Z
	ReEfQ=
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr3495326eec.41.1795182199480;
        Fri, 20 Nov 2026 05:43:19 -0800 (PST)
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr3495275eec.41.1795182198873;
        Fri, 20 Nov 2026 05:43:18 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:18 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:41 +0530
Subject: [PATCH RESEND v4 10/20] arm64: dts: qcom: sc8180x: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-10-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1059;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=EEkH7RME5qFBUL1GYWCz8dsl/artX4YyT169jSjW1ag=;
 b=D19IVJaRY8IM7fDFyum4SvhwQsx4wXunIKVaE9hZ9h85bUztqtI7mZs5BEvllnGtD1p8qtRRR
 KprqJp1ygTlAGWbe7sl8ozE4DjPRI5YllExdodSObEJfkOc69jqxYru
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX/QXfnTa+a0ec
 PPC14tSI4rk64bE+s7G0vGUENEqCi1SygzyJuwiV0CrDOJJKcJ0DB/0u6X6MCnX4vxnM8IjAIyW
 OS3zMFHrYRXraaqX3PgEASu/ugeeQ258+Rl9bDoE4KWO4nr0yje/gk4JAOZWih0NhP96khtigl/
 DEs1priDQZfEFYoJuZ/tTK4JdvF/hQF9X/IaqWNevfviaklCnDUtrLlxEBrf5b+Ses3nJQvoXW2
 XO5dQjwqDgzelnqRSX6QVp5EqubDSd/9meQ35dzmSmqF0eJUql51NXm13Ibrlwdu5KdiLk7IA08
 HXcfj+z7NRGMhKc/T+AMVA6Z/yvFJziOlzG8aD2zZsiS1fdT9oYQt35gdxj1rt1qisOVem2c968
 ZpgLpV8SoSrLsoU3ddUpZuwgZGdr+epaMzRGxuA+Bzswtuu4XoTDHhNOr/T3CmgeqH8XSZgfMX+
 bertvzAHtOOrIju6Aew==
X-Proofpoint-GUID: oCXrQ0KEp-KnunWpQg0z1dlDz1fBwWFR
X-Proofpoint-ORIG-GUID: oCXrQ0KEp-KnunWpQg0z1dlDz1fBwWFR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6h0kQo+g9MJT
 uOnTgm4CPCvQ2wId62iYB6W1iLVsIanecLehh6Sw+hsBsxIKNv1xzZGDphUUn9NXcMUqWa015ie
 Xy1b3HRMUcdhdU16Po2BpUVuWyEQyI4=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004e78 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=THzGGTBd8XYxRjXI8TEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054321_155414_2CAF55FF 
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

On SC8180x the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index be79608b7161..acd05eac700c 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2410,6 +2410,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1


