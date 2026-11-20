Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71819606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HZQpHn2t;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lIFuxn7P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H4tdvHHw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=; b=HZQpHn2th/LRiH
	/cpvU507BW+6c1zw0JXqE0I0BNM7fm6GRN50WGyqcTl85qq/2kNkl4EaybGcPxWTCISroxmWM6K3C
	IvWV0LtlT8vSj80STbpjx/6Ey2X8LqQ4xRejwCXF/YT/efKFLQi5EeTZ44VZ0zh4Oc3cFTx8PLvEQ
	jgCNsMNlGngDOGWqkYIWS3/D03GBiPOSFRAti5W8pREFluXYr59kyehbb0ehxct8PPFX7wDcu63gw
	hTKlfujw7NfZBR5GZDgRF7P9/IlTmQpvilVfnhNW5CdiBX54vvODvfhFIbp8yizs/BPHb7Yr3NgEV
	UDl3BKrvEytE6CE77Y/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOuQ-0000000F8re-2neo;
	Fri, 20 Nov 2026 13:44:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOty-0000000F8J7-2ZtV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:43:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjx7t556446
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=; b=lIFuxn7P2imN2pAV
	Tme6IE7vbrfEh4VBG3ZmY+gFc5Yo3Cts/tO2ovzN0nb5ltc8BSnEVUbt0ooxN1KW
	Uk27FMs72PkvC0YSga7SHh+D+HaiFk9EukiEL6x1A5RLgJk8JZJwmTrUrpNiqZBG
	l/WorKmayiG2h/Tqofq7KpKQJ5jPbFyk1mtFCTlyduL5ifSbwiJ8knGeHg9Uv5uc
	+8n4P+4rVHuLpTI9TGZcChMKyc2msPPAUsfB+2PMXX3fF5aY2WkmdYJyWyF6MDFv
	Z+voFFBeVxuq0upyW5i6ni/nZbVo8uSu/dR2CPb2nFcn2rkWbhFWV/lO3EDsdDdM
	EOKUXQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbj16y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:43:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1374058eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182221; x=1795787021; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=;
        b=H4tdvHHw/r/sz/Zyl5XVfihXhNIpAm/5Q+JACmWjyguxTeEkcfXqYsZsBJfJCc8Q6l
         rVoWUGnZ56ALzF1fcbEbOPT/x7biRW1OTZaJ0u9DVetDK1vBPzvVYMk9Wu8W6lT0o2u1
         OfLDYel8/yLhThb9kfVQ0Jks1IqXxSpM5q3sOhQTwFmJsFptJ7ysxgfDy8ySxKU3h5Oy
         UMLcR+xdS/tBNEdD3Wa1A7jtGUn9ZKKQYjUwHxhdHkZH9HhPSlaFtVByslECKirKAp1x
         65UcIU7hnQiXMPXL7N5JFUGZrU5cMcOARyJdqnaBGu904O/WeTD0poC6IVduDcuzkGKo
         2PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182221; x=1795787021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVsllVIT9IyOIqvBc0flk4QJ6UG5czr429XkAIGHQoo=;
        b=By7/XDFN4tNolWViGTLW9nj24CzTz5xgD05+/+b9z89oQ97bJUmkYXDW/ui5/tRIko
         tOzTlo/AICwtgWzQFOxcyfT3n66bnCnhBW0bEkwv374wwQR22OsrgMEiSSvCNV0kM/33
         htCsAv+F1g2AEek+72pTfxzjwo4tT/GmNQQdVbYEv29zsqEQCkXFdwP9VTNZRLgKz8CG
         VDtPQFqQLRB8sFMsYOqL5neZqAnAQqeT9U54XTS6r9vcjBNdkRcp/J7LHQcKJBpz0Vfz
         IyzoLVYBhvRZSK8KRY1HcnROU702JlvB/hnYJFUEEliMDEYRwaXyiZQJValnTA7gC2xE
         ZiUQ==
X-Gm-Message-State: APuU4Z9l31/I/0j8ShifIVBvsywJA/ZLUu3ua4tvaPIbfobI1wZ7Ra3b
	xcfgjsety5rTzUCNCgTwaVTLTcrvB9WncUT1cvFONs5RhDITGBG4XWJwrkUrk63LZca25P1AZSG
	mNk+0FspE92MnYmhzS6zQ6e3CLI8RYg4BjjB8gn5bAMV8yvXd2t/bPTTVdPQg/rBygMYP8N21z4
	vw8A==
X-Gm-Gg: AYBFou2gUPkXrTuMpuENJzVSNAGcwxgNM8ht2iHNYxaWarMJFJTMOjtkYlV5DQjSBAD
	UpsSIdnGvGT9nYGqwLjTVfSOyZ7+2OuGeJjVtrcjl0B6LWh5wXSeLyfKiddKlsK7g3mmi95yy4Q
	G9hierrBwONMOf5uYQJHrO8w9e0yoj73FhD/XtaBEyXNC288Qb/fmYdItC2egMpG1kULwDObdyg
	VnE5NhUycshRXFoZi713RZQ2VIg/V7Y+bDXOekOhE98MCQin4ygm67lNZPBIO6tENaSy+eJL0Fm
	bqzs/XTMDLjR6lVVUBA/05cs71Zy3/TIPw0VEc9VatCb6LdSbGkSjadz4eKWBLWpFTwDoO5/Apu
	e+SIGewzgLg0Zp9gj5cE+asJsOYpCRD6ZvLkofCOCgJxLIo7QZAqWk/ftXqmJZSftl1cJW5v2Ik
	cXUUw=
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2866827eec.5.1795182221028;
        Fri, 20 Nov 2026 05:43:41 -0800 (PST)
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2866785eec.5.1795182220304;
        Fri, 20 Nov 2026 05:43:40 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:40 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:45 +0530
Subject: [PATCH RESEND v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-14-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1038;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=QynpQTC+tS9ewt8cTvKXC0ob9aCwyQ1VtG/dFxw7GR0=;
 b=FZbDUQLy5/rKPk183XwUoaQlvO2xvFMjsoX/3ofTAfk1NBf2M06oyjxOPBXj87iMxDLttr+ro
 Ic+UGssZrIJCSIIiqPnXLE/1eFDIukT1LoV5Yoo2qcSPsdGc//rTOlV
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX0C7iHfwVG0T5
 dHN42PZq+wNa4GxWDIy60jQpBQhYHvZS5fOvaD0Cs3WAZqHwrlfE7eEOMyDJ9XkZjk3nKcRVIKE
 iaQGNd6xM0GPH5OLYDzMVNzwnPLODwBhuA4NPSZNkzoV5Zt9iXY6f4Xc1Ev+UpH9LaDJ/kHvZ0v
 6mboohsvg/jjXSN8ne54VEp1+V1+U9wre7mrnw/0UR46mq2eS1PdpFR0d3TmPcp80E9/pNg5V0w
 svR9ZlMiXbbBXSaVWX/lu+WvZPKdBhdBW3/5uF9tuPUL98xtB3KJmsQZG4u3HgY4OTo4QbeWmBq
 gB+Ew3bwDkRjLS7FsTjf2aiY77YVpT/mKYODCFzuz3gzXcsmMm1TMDLdaGU5V0/5p4DY935NCV7
 IpMh7+Sh1lCy8eyz8UgGRh1zreqhz0PB+6MCIL9SS/3ytkA45ESMIesUpz3Cuhu5XWBiG41x2jb
 jiU3hHrJ4y8efoZE7eg==
X-Proofpoint-GUID: Bz2zMPUN_kA6WpxyoSl3KaYecrnAjvbG
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b004e8e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LWIT_UWqXYlThNCXQxwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Bz2zMPUN_kA6WpxyoSl3KaYecrnAjvbG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXyeSqRGB+tYt0
 GLKD+UUKMqPTROq251mGyuEZTjqmonA1rRpRi3vd9j1a6YPF/3fL0RqSPqLFMAs607kPZNtDnKY
 dpGyrArFgprt5K6C3etQjSsColjYXBg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054342_744107_1446852B 
X-CRM114-Status: GOOD (  12.25  )
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

On SM8650 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c8..ecd051ecd680 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4413,6 +4413,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1


