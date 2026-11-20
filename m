Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBA1606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YLVdu2f5;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YCsF+IDs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5+n7XdS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=; b=YLVdu2f5/WFgG9
	H9YyQJyJxCnxn/d5NoNgXZ26TiYKxtY0bSfVlhQKbOaGTvy3vVpnrgdrFA69esYW+74OAaFe/fjRF
	Df++4LXLA2GGU0sFyeqE6Bo+AFfX5iCrmisiy/GGokBbR1KE87Q5yiIiVvf1TGtbI+7Y2gYU98HJd
	SrOpNy7r767lKhVUt2Mp3XPHUpEN8Z87KdbTjvdEQwhkUCIlI6mDSxiGGgtTHPNwrRm9oiPuDVRPY
	xrGJcHEME+S38ZizbSJ+oExPv39xm/RQYweuoz5p/FbqLNl9u7ntLGyE8mgM38z1Eo4l3YHPu50h2
	IiMXyOlxMXzaLgs9T2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuR-0000000F8tN-2ozl;
	Fri, 20 Nov 2026 13:44:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOu3-0000000F8P0-3JfR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:44:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkCSS1017053
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=; b=YCsF+IDstQv6MIvZ
	xsCj27b5QrM6GVtFKhA+KTZ8aWrMjUB1690xvobTHxxplPXUy1Z5FnIZLbs2kkGS
	62YheN/JbLYl6x1eu7setWiTXCBncPR4/J//f4/OOXMPTGzDrFNIeDTGKCtqlRe+
	UqOdIZA2zTmxIcbgjIRT9hn2DUZ2vEJUTaz1mT5kpOuB2uZTUaXMBT7oa/hP6fxz
	LUW/S7MiERWNIFQ4Y4dTKeJMGAMdoUMscUNh+T+Xzqi4soHVa6zqO3sPgM3rEQ8u
	joaJQsAPVS5506TQmnNHOEk0sWdrytK+n6cZX21/EOwkFJ0x4U0y14ZNZtpR/uC2
	S2TSPQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqst6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so1374165eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182226; x=1795787026; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=g5+n7XdStg+70OOk3XtvgPrcEO+ZSdg/EpHbNgh0NEyhfP6zHeRzoxxBuNhUCLmezV
         xPbnDtGRtvfR7uzTfFxf9GVTDFnIGGZscbhtP8TKiHKDnA/kjutU+aplHzTQv6m4Cuwj
         8mN9gNHVPLc6HitJtG1tK8o7JZ7DRk5cA69tsGb9TtBDe2jP8YVNwB6aT5h9S3ClHU+c
         MqK6fw9Tws1fk/cS0GcxElo6Q35y/tcrLHDkuos675DJf+4gouM8h0ER67rC/CrTl4k1
         D23SxNHcJyGr9HaJXJ9C85Co7IZ/y73NjUEk4b/CsEGB+Haq33qkuedRWoZJymli9MZH
         Cn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182226; x=1795787026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=0WFoFg/dW8Kbyw9Otc7UXFp66miiq3XDv1y+vFmPfOt4vVW/iMuwZYNwOb6gz18Qc6
         NIdn1Qqs6tyeHpf4O6bj2jbBZYIcZVinYCWAfSXEDMD079EJSOVKtdisqeYhMN/vqgkp
         fPVUAyZgW2NEiyK6Uemo/1BA6+AnyGhyF3JycPcPs3EwkN+07ltT5DlV8oWP3TtSyCS9
         rx0w4t4iuqQFdUek4va8UI1/vjBjae0BsNS5OnejAsYjmaB/ZaMf3xT8G9nGkn8Go1N9
         EkiIOFFHsTzXULMR/99wZAZTsdpBK96EB0dliI5A8DaMiy/IsamqKwnxUbtq0nnB8TM2
         57uQ==
X-Gm-Message-State: APuU4Z8Uui3qgSURTQ6A+n8bk5K9PTBgyWpoOJ5sru7jrKv45LMSBDXy
	BY6dYNAMCoJJJQUQQPNBPm059J0l/FjfBBnTA/iHOcknAJkJtX1nXiDT0rLCCrADG9Ro8nGj1bn
	nPqOuKJCLU0LxF/foaO4TTndS3M6anC0fkintMPNCM1VHMtDxMdNNCOKWbPvXaHw8/TUeoWADHf
	r7bA==
X-Gm-Gg: AZFdTZdwXBnkIqSV2CerF2ETDdRN78E9tWlAqfS1Grv0YS6Fw1AJ5ggfDVaxkdIolWA
	QLCseXa49BkxVsG4WPY5HENGIftrTRcdZhUQRTSTNungwJ3eT/OQ5mWZMG16tslLjc407+FT2NS
	KjgTWxj4cPnpynbgEukH+jyTxD3cZp+kvWZTS7zle7oAqKs+YGDTUXdrEAskIGfaa4ObGiz8J3P
	fLgN8ADqt6p10J9GIOiniXstP4nvLWqtIN2MxJcnYnvoRZTR9U7xL2Dy5e/018WhTnq70ou5BMC
	x+sczHMhzfYqy7VvSiz87YoFaWeyH9fAOSV3feBV4/HGjecPIQ1639MI5rknaLAJSczjvQvxWVD
	bj3hffbttXoFor76a3sS6DQvQB8VpW/ECQddzuZJeFZxw5odHeFM5S8c8K4B/Op1bVffPnnVO/m
	y9CfI=
X-Received: by 2002:a05:693c:8951:20b0:384:ce59:5e19 with SMTP id 5a478bee46e88-3856f257bd6mr2694912eec.6.1795182226361;
        Fri, 20 Nov 2026 05:43:46 -0800 (PST)
X-Received: by 2002:a05:693c:8951:20b0:384:ce59:5e19 with SMTP id 5a478bee46e88-3856f257bd6mr2694873eec.6.1795182225726;
        Fri, 20 Nov 2026 05:43:45 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:45 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:46 +0530
Subject: [PATCH RESEND v4 15/20] arm64: dts: qcom: hamoa: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-15-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1049;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=o8a7Ojp0eNjNzQ0rCM2WmCZSQ5u7xFkQL6aYtQmrXTk=;
 b=shWpSkfNSnmk/Jcw28HmhRNuejqHcOqrgMbIwuKPiGgefABQtWtryhrv+xF/ZuYuxLXp4XrdJ
 0EjfJJi5GtKD+6oXZONpBDOmHdTkkm4Cw/3B7UEMYg15dD4bavucvgu
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX957dp3UgLmif
 ZiZ5v6m6h2/hmlbhcauqqOwKbL6+k3DBqkxMjjrrPFQ4vaF5WQyVvc2aU5C5kMwfHkVTsnoxIue
 AagLGZD1FwdYNeSwC64EYEGTA+0pmcZ2DPZ4xuokjk03pyorsLqNi+ZCmDgpF4g+V5WkzvbMMAF
 ke1OVFcbETpgULirlNFHAC2yA4fMZm2dBIEc+409YTjBTXdC2a7180WejiY+33o9Qxh4RstYj2i
 VJRHtV6bg3Lo6GMfR8VUYw/I4BQyNlUmjSltSG60rrs4TCcHZ+HEEHayv8cOmpIlTFycFh5ViBa
 sTv04/QxULmwaLLDdwtuZURC9PtIDW4edZoRM2psW1TJ391MKwQjnViFO+LqxNBLgjvldQ4qYZD
 Azum+DiM1H3SnQ5jO2V4YqG4y1siKCE8hE5QEqj73wJ8G8WFOi8OfbdrgtSDsQ0Ddz2Bvpze6ba
 7r1Ab2ayQ6VdqyMtm6g==
X-Proofpoint-GUID: pt6IayjlXiKpHdS4pn6DyTtr016x89Xb
X-Proofpoint-ORIG-GUID: pt6IayjlXiKpHdS4pn6DyTtr016x89Xb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXyKv4LOxQKzUl
 0EUxEhbVRAJY5t+Y6bUUg8O3kcbbfrhE6J5H5OiNv3YKCJkgOCBbrGjBwtXVOliIkCwVQbvZ7Ds
 9nPtvLP2CSH2wGHJuBxaQdUgyC5O1ZU=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b004e93 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WAcSZy-hVgrt5OVmuNwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
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
X-CRM114-CacheID: sfid-20261120_054347_875851_A73D76A1 
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


