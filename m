Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5EB606AA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wjG5yf/4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Qr8Oo0Ck;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M/SiqKVW;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyayMUGD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=; b=wjG5yf/4Q7V2av
	b9HlicV64hWqSSnSm+JdhdOXSvSTyamsMhUBThwC3TdzHhG6Re8hrLLL2NLs4XMwuenfqCLdUOXy8
	yKQc3B5+QemctZLsIbbGbG+Sml7LYP92IxDFicBY1uAYqhpn7A8UMYAifW3cjhJ2nvz9nLOuYRFjl
	09KRINim114bxsWVnP2lfO8PFgyPnQ+V8gQ3wH1QXvzSm++Cg0bUjWGuzWASGOygWWtvtBsCF/Psz
	PNfd42QJIUuRiKT8ZVXmyehmh5bGofsML+suPFlBQT8HvSScnKDvQqrHo55T2VGYNVtGEGWUcqXzv
	Wp2CpEzULShMC+FxuFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMV6-0000000Ej3T-0QJE;
	Fri, 20 Nov 2026 11:09:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMTj-0000000Eiia-2VTF
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Nov 2026 11:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=; b=Qr8Oo0CkvtCInnFeb+cL/dlE4J
	NpaXJqSbw4sG60RX6TVXFjqlunNOth6DQU7p97F2j8NT+PyVF5uXutQNEZAXch8UF9BmrtsYSmxjD
	Leehm7Xg/9DtHxUUjMfbCgdU79ZMr0NHYzd6bZdKS27VVq71E7h1XhERb93w4jD/kgV0RDpTmJTMS
	24aRxizKLSSJmALuTamAnFYcYh/yT2ZQf7rSxqo1cnFn37IPVfoozguEwkk7pKK7aTzjIFiCGYJ3G
	T+UkJGSY+F982L7Rh9yPKF5XMkDGjPzkFWvCl3rZw6kMeYcXiZqS60gtE5UqgPm4Xsj/xuLO3YWTG
	L7iwQdBg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMTf-00000000gnO-407V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:08:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkgLu3107631
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=; b=M/SiqKVWCsBLXFmb
	l4zFOxr6T0VDM1R0F+KY4JepcSgMLlrunAvyOA1fzp/XEWO7bLUuvqRXrTDEmoVq
	jBWyM8s1t+5jghX0GC39ia2TqFJfyL9n0ST8zoe8f4C9D36bQvXt0YTyce0MRxWG
	fyClqlnYwed2v/YMdcUzPm3wM/+8ThTvA/ADNR7zlU93ZEkEDb/KfKFX74JULDVi
	eKjCR9XFi/XlO9BbRzQMqNIgyoTolQzIGV2HpBiliH0dyskfcqWzc9a0ie3rg3hw
	xKedYlmST1zQ+mDvDOz8ny54ZYvAnJw9oYgCQtuFJ4V6NQtWDp+SGXiN0LERCwDU
	BXcqxA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3c1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:08:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso848682eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172899; x=1795777699; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=EyayMUGDk5oav3JUXJq+CmvOBKomTpk2J96UeUl40ysAt0DUy91T7TjDFW3BLG6mtu
         RMS6g2O+5lX/7HkTaHykV0UaY5BYsQSZmYdqOjihjCZKk9jrcghajWCWpOEhMgPE1krw
         sKh7CqezWAmwMXhtfQcoenDdzf1wtvKFwZBZ8Yy+9DYz7/VfW3+K+7na3FsfNgUH3Krx
         eywjK17aI2ozKa2y895oaCLIft08w0T9F2pDDOf+CwCsbUHI8AoJNUtaCYVzl+k2GEKz
         6nNtVAqROO+sgM/MctyYCaNo+YbaE8D0Lue6omro4GYG+QKU/9JTwEhhpI5RO/oNtJBg
         BSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172899; x=1795777699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=Zi/4vzPAPJjGXtqycgnW7uAcn6muEmF8ylrJmcjRUcA4Urx4OYJX4acbE5x7iMmvnL
         Xh9pW3dgYO77kWttSZQ7oD6fYK+J9nT8UGmaicijxEI3VZqsT9HQUaAjNaFGI09e+LqA
         L3kSEEmtK8nvy+Pl/1tEHJ0Qebndfhw8cnoZ1K2rhi23RI0XRGcmPe2y36zPshIlfxGb
         CD+TPDg5ScSScN9JdEZF2MPQf+4mRhuWeOAXI1fv3VUO2F6O00p6ZbzriupK4FoYnqiu
         aw+/Q4pTputm7vZ0j82U5ePbtyDfF2SwLHXpIxv6YiQDM/8IJyO9yRXQZtiGTVx+hYhy
         9pGw==
X-Gm-Message-State: APuU4Z/pUJLIeyFyUJNELIPLmW1V/zTTdaWIY69JWEztNUJS4OTX3XE7
	+sIttNgeKtK6fZCuv3FWvphny4+ua/3xaASaAA36OLydETuXdcX9xMtsZsxsa6oVMtUOqU7JFnZ
	+afymbfUKKMsLkYMtj//q6EowHWz6UrZX6vep9b2rVGIesuurWcTqLzRwzIpKYF43xPNJJ6j1cL
	8wckD9U04Wag==
X-Gm-Gg: AZFdTZedZMvlcnMzMzaVhepuvBPZ7pVZlkMKrOTw8y04r6D58aNPUHGz19M2FZCekaP
	PBlPfCuB5x22CTYw+kgjW9wJQtCAFSLhCTU4re8Fnxb8rgi5YIiJNfH67Ilh6ckRiyK4a2FHhTL
	S/q4gzHm36eGO+bhfZqj5i1QAtC1Byj/HEbbRftSEWmMe2OnyruXFnd5UsHNUUzOrIKibrD++BI
	tnBFz6ny5B5pPfWGWMJcTz1NfqXBbfqgR1AhSdh7muuN+769fVmOAPU0pIWitr4uJOn4rmC+HGM
	EyF6tCqYSNxUqJZcYzrKqQqLDcm3VulYmGVVgRDDG58FywhClwRsivDKQlhDMJPScJ8iaNGFaeu
	rGuXTjoIkUgQ5wVUjf9jrUaFoWPncGpIfYaQYeBLmI1A2NBklDPEGhYAhzJACp7S+LdVgclvKXG
	BURm3W
X-Received: by 2002:a05:7300:d08a:b0:386:240c:19dd with SMTP id 5a478bee46e88-386241b6dc4mr814535eec.9.1795172898630;
        Fri, 20 Nov 2026 03:08:18 -0800 (PST)
X-Received: by 2002:a05:7300:d08a:b0:386:240c:19dd with SMTP id 5a478bee46e88-386241b6dc4mr814485eec.9.1795172897871;
        Fri, 20 Nov 2026 03:08:17 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:17 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:58 +0530
Subject: [PATCH v4 17/20] arm64: dts: qcom: glymur: Add HSC_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-17-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1054;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=kQCr9BRTX/wWuCiHnkZ4IEloHpuZO4nxnn6nFDJWtJA=;
 b=VRQkE9FAhJjTHlJP+APs4NQ+u4MYqq3cljaL6I8nd2vmk2WV7jWXRfdZc9YMifbamkfdNbVRg
 df9S3AkG9TCDP/witUqKjgnNiQ+QU5yxEYYlir85AK+7EeOtvUUrD4Y
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxQUGOZVuVedE
 EmHutEhji5doj31nou6PI8CNrayVl4NO6clIGe5H5rZ7fz0KTTNhNvpRC9cHWX98maYJyS3CHKP
 SFUZvA0hce0r/2FWBtMEHCCprNr7/Z+NjjxaeH4GS9v53gFKX8jovV+xS7fSDM/TxtKi8lwR41O
 sK3D8f3U56G8jTT/HpJOpP4s6ZqhxNESgI5YxK8unNrOTL6CyOybNukgxcQ5wmDWF0FdWGc8dfK
 E99eoL85oTPCRyIb01CfxdL88v8UHOsW5a38omNBnQPkBuqx4TG7Sb5icmqo03J96C3sj5/ceU+
 xrgZAM+lhlZqqmuI6dthRxE3WYjP+QgktSZEBh2uY48bdOs48M/5wB54VM5mb3pNFy1ACnr7mBQ
 CSuRz/loUXzpsw0X7hyufkjB+UH4XUeBZFdjXgtsxdp0JaaodxOwqT+/8eP1juinZUC5V9xAJJG
 X3+wsrsonNtCXHO4isw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1uoGqKraFls6
 3Nx0Oy0FUzfR+M64VMoeeHXS/VgApY92FUIFQl53CrKhw2wJfyJ3k69UU5Ar9osc6bM/1yjzvkW
 GMY9280besw+Mxh5kbczK5tFGAZqQRs=
X-Proofpoint-ORIG-GUID: U70t2AXG8fHxIQNjCfrnQSLYG70KDdc8
X-Proofpoint-GUID: U70t2AXG8fHxIQNjCfrnQSLYG70KDdc8
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b002a23 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=a6KFA2mGowSrcUvabvcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
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
X-CRM114-CacheID: sfid-20261120_110824_127482_3B47B146 
X-CRM114-Status: GOOD (  13.49  )
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

On Glymur the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on HSC_NOC. Without an explicit
interconnect bandwidth vote, the HSC_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index cdaf842814fb..ae3cedcaf9d8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4378,6 +4378,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&hsc_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipcc: mailbox@3e04000 {

-- 
2.34.1


