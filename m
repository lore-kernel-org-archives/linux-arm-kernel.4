Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FC160A2613
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XSZGD/JJ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bYmi+T/L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlSuQAN2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=; b=XSZGD/JJ/hxxel
	iFf+6RFJnkT9/cBLXQAQOlOw5pbJzlkjN+EeLNRLyfW4PIqvQLu5ggD2zPAxzFmFa5fRebpKMv9qS
	YrvDkBFfxPPO6WTR+5WhvAXO1PzsiutQVfMYardBI7VAxGuh2SL1mmLoI5SImqQHyBU/XLzpZHpC+
	+RMIVHm0980L+6BC0O5DhU5OBkYM7uTfwq83e312zerEu7X7C+ucdFSBB7rxoCYuWxGn2lX/aQnZl
	jKcENQR5DZPxCoijp7EZ13GQcsBrZ51nngcVQ4S2yixu6xxzZBEfKyRTVl1T830h12ifJBbRekxOp
	bz15q1Dd2NSYnML/Yhkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtA-0000000F7X2-3Dt5;
	Fri, 20 Nov 2026 13:42:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOt2-0000000F7SA-354h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:42:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwSn1528606
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=; b=bYmi+T/LRHoqTqTd
	94Gqlb50tfiow5+v8/rkXqpFl7NdkokObmijgUeDEaWR+e9s/xS1QFWZehImv8p3
	woqw0aXLr/+6XcP9nlay0j/n4MXOypBgrKYgpOQCejOcjtSk88FTAmz+/HeQ+WKQ
	ph6O4kS2r7YX4pwaKw1aexGUQ9H1/7MVBspLbtRIjy5mjPmk3UhxoiLx1tfDkET7
	Ln5tVYMIg7c7NgVikJrnrsBQ3KaFqefCMdkdmK5iDIpYEhKHaoxL3bRzuR+ppn01
	UO9Yu1cnzw1Nsk1+3OR3yNwgiPuiKyB+FML4DLskm4o1oi6JAvpWseKO44+PHcPa
	hLOCDA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtt2j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:42:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so1301584eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182163; x=1795786963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=JlSuQAN2vN/CHDvbHjdRPufkF5OAuYPLd4LqXN9zbJ3N1EblkcNZvaraZMOELJBqMf
         qOcszLQhQt0Ln8CZ8w78I401KKu2wNIPqEmRfutm0U2kAzIFGXKGr1CnFJqPFt5dZsdT
         ZwbYULaprvQsKQE15+ZO30++v5WBLLz2y3WaBtKCvzMZgJq5wV2Zr5Z1dCrvJwfr3s8S
         lHUm+fhMhGn5OvkhKhu12sD8av6CofKNZxdNmskpyf4yMl0wUis8Gx1zr6whDWewdjN+
         b4xAYxMJuPj/H7+9YUG7LGIQuaOnzF5SqacpZCKYgeuuRkjRkR4hav1CrecCZ24ufYBv
         TK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182163; x=1795786963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=lOpgWpXW4g4TnrBI3zDfXxCQbyH/yRbX8V2Ip6WziBe/DVAZwJUDSI99CyfDhH1hDL
         0elc+k2WeuudOBw1I+MjD3tCNAkRkCwZGfQ3PDeTMPCDGAQlcVeYSJFQFkDTibt0yinn
         Y5nlyRym+WWBJapGjXMQvFX6+uVb2/pzBs/8scMioHVpBAxagXC/NuRReQSJaXmZ4iTM
         WG7BL2Ww6NLAFH/hqALIn6EBGMHA2tlVeEIfeK8hhLqI6tAMcP06YBhBbp+8BkLt5B8Q
         SPks2dvUqHe/1lKtchG28Dpz4s0iJoNudGU3Dyy2TA1moWCHRULmQWpAJ2o8EhJvGUo0
         XGZA==
X-Gm-Message-State: APuU4Z8/DtBxteR9ifVtqUcZ5EpklPnumHtlXbtVnyq1jxxW5gfvXjmE
	ESu3rYG/ED3q1LmJOzHh2TOxi5ekFCbSF+TAV5F7PpLcKpEpSZNZqJ9KZK5DZr0j2duyii3rM94
	a9+/xgrxDTDgAk39Ez9dFKB4sp6Jf9sgk4YOQrxRIKfay/dCuZUnzx4FI74ba+VHolN7/qLQSv0
	FrXQ==
X-Gm-Gg: AZFdTZeJZRah9zbrAja8XZwGu+xZ/Ju2VkEkwPb2IGa9maMJoJX2nAjdxrlruIHHX2R
	Jdayr7KZSc44AL9WKiVA9MhciYw/Dvjx/KLwdxmxjbaR66nFcWdoDBv6WnJ0SbFTtF+5MHyCXdB
	W+nWkgB9YfTRZj0SV+Ra4mDVg4I4QjZg0RQYkLAfkqEBso9Srf4Hw1t2Q/1tiBUaJSmHtpHqp8V
	eCRWxMRiGNOP0nuLxOC/j5cSjyWH63SX0slEfWu8LA96lvwIg6Mp/z4fa0v4aOPoG9Maup+8h1o
	CY8MfNCifpy+cG8Gfk4XMTAcE7B3Act9pb2glltzjZx+SNeQefIwGY0fW+YdvX8RewOdwTbhEOM
	Ygqcqepopri5OFxv66EmY+1kV2/AVAFCMU9FAl0IMmzszomXLGyo+7cv1gyvvRv7bIX+N37AyYD
	fv03Y=
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr275782eec.6.1795182162162;
        Fri, 20 Nov 2026 05:42:42 -0800 (PST)
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr275745eec.6.1795182161506;
        Fri, 20 Nov 2026 05:42:41 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:41 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:34 +0530
Subject: [PATCH RESEND v4 03/20] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-3-be30526391d9@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1065;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=nfp8+SD9J7PQP1TIlHLZz6YXOr5xoEhGVTCZWtBdhd4=;
 b=qTaOksY7gsG0/TAQ8p0w3sFjf/8jFeRmyK9JK9OfJYDfD45oWCkSu1bCDoibZtRSCsznkA/ZT
 w+97sfQhwAwD0LQcjnDqzk8oUA/ULDRgLgiINfsKeFTjv+24w8qpbBw
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: YxSHr7-VjtY3FYJVMODrHQ_fxz5-NiIP
X-Proofpoint-GUID: YxSHr7-VjtY3FYJVMODrHQ_fxz5-NiIP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX3syAuu4eEamN
 CHnFkB2YiwMFgdeHxIP7XSsvreeC6pNMpKWA8Sh3zTm7+kfyBwIdW7gz/e6U6d50QEjwKinD2Fa
 q/O0KcV/Jztdhgl7jBQrHCGQbh/3vzLvRelhe88BzCA6NFVx50LKyQoQVT+zSI8e6gv+PgHfuG1
 ROfZCMGygkdG11yJs7L9TYaEq8U5IiMyhfruU8Zv1xd97lZX7n2TB92Sjj049xsU11i2+BJs9mM
 rPVPxQrUGdBtKxWJfUbck8T46xvw4ge52EFoiGgzJw/CBLm7YxMqtGQWl/AW1ymKVTyl7pKs12J
 nO7EN4rhejd2xainiN4tPe26GnAHu9Afy5gXm82nhc8IUO8iLgjoCdLdveIr5O6lonjafoqPlcm
 lv2WXQW4cqImQ9xl8t0/HLUrM/OwnkjqIPTwL9/mO7dBjOVce3mqQt4Ge1MTS2l3YonS9KrRkfL
 j+TJEBQG3u713dlucBA==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004e53 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX+V1Ivd9Yzn2P
 bzx6VIBJbYeOdbm9wqh68XsMOMhB8txnf0x/Cz3jQcN1M45zEuYScotiIkEH/V2V5EM2iEqnjfM
 FQnbLJfihfRtaDA0jXwBrFStb9/UNh4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054244_893020_BFAEDE9E 
X-CRM114-Status: GOOD (  11.93  )
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

On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed6..c142c7cb509f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3413,6 +3413,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gfx_0_tbu: tbu@3dd9000 {

-- 
2.34.1


