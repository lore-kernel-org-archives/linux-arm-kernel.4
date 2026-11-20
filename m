Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47A660A383A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s7KWnK+w;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghWQDbGm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=edZgvN4D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=; b=s7KWnK+wSN7pFy
	//78aM//07ThR6VQ4BsGQCrLuNPlAOEbas/3OSkF53QlBz+q5oKpRiSQCd8Yvv4OkrSf6qjY8QDdH
	nLsDqn0ZMQTeEZHTbq4fFGmC/iKQKHg9rqUkHrt6UuqxwgB8EFF54IuUsWWyAn440EjsgM4YVPVTk
	wiAT4PVtzYzGGocfHs9otwASexWAhZ8WfrcgrCh8SCPchlWYhUJrLdONERGJtHB98g+PWNO3PhjuU
	wkGuGG9yPfT6JbvfTJyZyLCVOTPN5ZFZeVvfKriTDJM+BOTbxyOyRjD2irFa9KDyQIgx38HzAYuXu
	qWq771kQ6ESaBCiyx7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtf-0000000F7x3-1AEv;
	Fri, 20 Nov 2026 13:43:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtN-0000000F7gJ-2wz8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:43:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkg203107638
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=; b=ghWQDbGm/RfEzbMb
	9mYr4PyVHHfjH6865baF+WOueDP8HHspGjuacGVEWATd5rru1puooKpX3QbLS1Py
	BzdFjH6XXUE6YeF/yXJvjP9ibnmLX9MRyNf9ZfJxLcDsIHHvcg4x5Xff26tzCgER
	N26d06GwT7Hav+H1/g/t2ycw/cPuBOb0nAtK0fMtOA9skk6tOzs2jj3sMBrAHrnM
	zaZvoKKqWHkZ2G636TI8Tah5pZxfpfLMhDa0VheZF/naDI7mwNEoqNk8u+3s9oE+
	7e4z25Sem+AJnOtVy6oUYbWgI5QIv9qb+ZWE7wBMf30ZQxPNi/axKKqEXu2s7XQc
	IJu0uw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3wx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383165e9b0fso1015098eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182184; x=1795786984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=edZgvN4DVJ9dCHOGub+pXVQw1QHY5vDKnSD99fcYHxTfSeyjWHGmhngS8ldnD3ZoQP
         YwHfTP2WGFdAYz+uc5/2KW50FKFV1/syt44yZmomHYiTG41FzNj+DnOPEGCxp91z0QlC
         cgrbNjOi7ho7yZ9H+B7q/L6jxZ5yOv7xcAvv6TOTlY7CjlzWx5jMG2S+duXxNTjxZqkQ
         Zuaq8t2qm2WfTFt1ZfZL73DQpcsw9OzQZrR6EWs1d82hJkFDXA3gs3wiwZtwYteqSq7M
         gF+00/Xtdo23s8x+ftFpOhBMGlv6Fpep0+rRROEAHLI6e5pEAOTCNcfgY80xsmysWsBJ
         09xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182184; x=1795786984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=RVeSz1txTaWzoocDzF/G/T+clomvVZPKrBqw5phVktUFzalskQN80uTIWgp1a2OEgC
         E7u4QdQcJa65z/3rKvBRM6zpAo1n76UkyvLOQMyehUSEYPdWUhmw+F0stalVJ5RhT1n2
         VakP5xbYA1m4HGR8CgrqGiL4tcFGzJcGJ5igkPQD8iimgMPofuETxQ7kn+Kp7tejSb3P
         8ApUQAeh8V5N04Xc4H+uAc+BQpu9eEI7rO/2Nh/dm8FCM4ijnt7fKoLxP9mE8XonnsGf
         mAgisArkw9FevYlQVxQkEhixzYhvBimrJ4GJ+HdntJTGaOg/c8iJLv6InitAHf3EMN0K
         AOdg==
X-Gm-Message-State: APuU4Z8Q0tNuCaf0VJbPlJ5RspZe69vhH70ILrrOADFN9Bq6Gp3mvb3s
	Dn/GC5mKo7A9Zc44htFA60/dwxAyQ/dY1uuiWLTmFv2l4LHA3lxGFSldtJkODBtZoqSV7MQ+UhE
	5aETCPqTIjjUhUPfnCK62VOk2wuyhbrr7QE3t8+Zv1Cv9slFOdLGzxJSUIUyP5mEMLz2oa5vtuk
	Jd8Q==
X-Gm-Gg: AZFdTZeJYmnwHBO55tF8lle+dJd1IKNiQ6Wcr31e+SmsZB21dhqslTZ2ljrCtaERyqK
	nuZ1m+B8jxwJR5rUcpM+GewHhMdn5j2ZmMz0LhuwwbKnKgGgDV1CyRpjUUYbDkXro8FNn2qGC0M
	tYtvSlCclC8bPfkhPI5A74AGjJ/wDEmGq+AzEqbgTN2XeK/1GrS/bUihcEn768HRwRFpLXfuV7s
	gba+I5FWzDVmidsc9M1n8gpoa06SHqYjQAMz6l7qNac1vFlmHyoIZQN1tekCsx9OIV8jFoDxb6J
	FkOT+Pm1Sri63WcBiWfscwbnyi0QHvsDGeh2oJBaUE8h2bRwNRlxECVwsDL5YgKX2fz70ectXy6
	rcsOgwdHtrkmEyQ5iEY6Zq1ZIl2oCRjkQdDBc9TSViAfJPVKgsc6Jof36tLipBRgsikWf5j/19J
	P8484=
X-Received: by 2002:a05:7301:182c:b0:376:e950:873e with SMTP id 5a478bee46e88-3856f659994mr3192407eec.12.1795182183440;
        Fri, 20 Nov 2026 05:43:03 -0800 (PST)
X-Received: by 2002:a05:7301:182c:b0:376:e950:873e with SMTP id 5a478bee46e88-3856f659994mr3192369eec.12.1795182182790;
        Fri, 20 Nov 2026 05:43:02 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:02 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:38 +0530
Subject: [PATCH RESEND v4 07/20] arm64: dts: qcom: sm8150: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-7-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1053;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=9j6IWx76cjPCAQZYybv4iXqHVebU//kZAlxNICMxwEI=;
 b=Q5lXe6lJujeOj00C7B5u5JWgPIuSH3J9emwvnAUTAiwf7hbY2q8uNHI/0TWnEjU25aY5pCK8+
 qR0GG8stZHICFvs4wha1pqrJMlaprkX+Iyva1ZcsqdjrOm4ImQnvkfF
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXxNkrQF+9/QAB
 PrXqlx9pUrUuFxzEofk+5oGlP28iOTz8BRrMgnR5dWu+Kauq3dKKuGMeC9kf1I0peQ8hzZrkfB+
 dM3UhmDX8x4k+2ocqU41nj9UR3ctlWGDijJFIRLben3prSi7kUe1UJc6jSuGwrFWYJuDH9hprU4
 j2C1on2eus2elASmMmBJBPgjDh7MuNJgxf3h8oHZthVSrqo8iToLWeGgeJ/pLfxbqDLpVfKU8KD
 VFo6s8e3j8Tf0+TZATz6Ky/+qHpSbK236E+ti5/E0q64udkgjg787z1g5LIpPLeh9fELSAeQzhc
 ybSKqMnW3zHsCWm4ZFEAGqci00JpnP+Klgo03ztph6ul6dNBITZXHMH2EbObKvVOWBpVa8P77y9
 Q0RSTKAoTe0ms/qOjhNF/sekLD+emqTdcBJWQTRLgAYG/kg8mGAkjvzsY9/iKpby0yVWxPGdhoW
 08XQE9yeUm83FL1TjdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXyUI70oLm0yq5
 O97/nOds9QLJSx6A2J4CHCn/nXoZKXkVxMf9qjaU6DQdsWgkyntQpQIfgw0XhhaUTDtC0REQ1RQ
 N3Cq1u0+cAH7qiUG4XFXgmsKf3mUNuk=
X-Proofpoint-ORIG-GUID: XmbPfgdZoY7yyR9sArXML0TpF__4mhcX
X-Proofpoint-GUID: XmbPfgdZoY7yyR9sArXML0TpF__4mhcX
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b004e68 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2mEde68aHbpXMYUSS8oA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054305_869454_437958F2 
X-CRM114-Status: GOOD (  12.14  )
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

On SM8150 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index b9846b424a93..4b2ff316db72 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2396,6 +2396,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1


