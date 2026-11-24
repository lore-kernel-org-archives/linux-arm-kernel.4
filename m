Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0405F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TAP4TH/R;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U54QDspb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZomSebAG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xtnMeRk0k0X/YY378KWkQdBLEz1neR4yAcGqKsNa8lo=; b=TAP4TH/Rj+JNVHh4aYdU4wB13Q
	d3ftsvmG/OG6tGdv2BzhxBDXQMPxuFj0GiEkV88eZs4abZ0d4GSpra5d21ScpRl0ohFNo353oOqg6
	5OesKlFE48m61S7wuE/AjTl9TSo5jXG9s4XMKr6johM+7VaVGI4BRpnKKnSPHrxXGQAHPae4pwBu9
	WQmJRtopY2x2dzKWd2D59J6d4onrJIYyD/yvIkTbwtukbExBm0N95/wE5t+buw/xZNqxuIIhI4I+r
	pfmKs9O0qpMoYcmDlZksMM6wLqjPp7sRDS5TdOasnwuY4vgKwvDkaBNlwZgJ1A4ZCiEAiOy1Ev4CA
	UDZdcHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoA9-00000006H47-20x0;
	Tue, 24 Nov 2026 10:54:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoA7-00000006H3X-3pRw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 10:54:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8V10q4129094
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 10:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xtnMeRk0k0X/YY378KWkQdBLEz1neR4yAcG
	qKsNa8lo=; b=U54QDspbURrXSFvwLCDnst4SWJrgGzcewuAFI+pXYnHplW/6MFC
	a7u2D6vIyX1jn6NTv02kFtu5ljRnqAXMfnx3A+E/SnK+z6VsYLkFXsbr/wxUFAim
	WBy5B43P47xCERB6OkVo7WGc85ImIibAjESElACLlJ6iUwT4ARZDVdBPDRDsFQwb
	gZTrIofwsI2m8jEuGNr4UGIR3htH/sHmIYk85YiwCvuL1w9CXX3F1FadoMqJMxUh
	iPLdlu9fmu/UZaIQpndXY1mm/+9ypiTFGJ+vkDHvrlDbQ/H0gr40U9e1FLsuy/np
	ZU2NVlmp/wycRwq4DmFOwMSJO6geEo3i1GA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2ab6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 10:54:11 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b45597c7so5304010c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 02:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517650; x=1796122450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtnMeRk0k0X/YY378KWkQdBLEz1neR4yAcGqKsNa8lo=;
        b=ZomSebAGwYosTKAcR7LHAyTqzZAFu8wBredwm0+yMcAURyjImauSdsXOVAwmBxAYRw
         3y5lgVKcQbg6kgLpA7/9a/A7gWCUCp5XTDk6+yTZ28x2p0mMyU7tsqgM5MNPGoVGhj2s
         kuI4TZe0mh5nhJMBgEuFe762h8Ha+eIBrp2Pl256Md8Nz9i+GC6x8giFB0JwYcupvuo9
         rTJSWaVPN+30NqjrtXU0Rbourdlr7kgFcGAVvq5i0Ew8XVF86WAPOyzENlD784q6y2js
         U21ukkcTikziQrckubNWM6GAm2n9yMTSpDTFZnYHslm5dI0oih0E6iXsMkyxDXqaCL7b
         jUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517650; x=1796122450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtnMeRk0k0X/YY378KWkQdBLEz1neR4yAcGqKsNa8lo=;
        b=nJhFNLA+m2BwrGtJTIESeGewJGcH2HNtCrVX4a+ktnLVTWnM/A3660HSMIbM7O6PfF
         5j0UfSLvyErjf3OfQiNR/8gJWJr29VqFNQDTt7hdQPN10XaNuCT2lwkW6vIYHsDbya22
         Iy6ZCrUbgAXPeCUPII6uel4FIBp4UrTwNqrEjRgKJAP8UtZ7wt1JKzHPdthfgeHHF4Zo
         Ps/aIE3wsk1IKdClB/SEeO7HM0L0HmqY/RQF86EZTclRlQyT49lW00Bbcl034YWxVASq
         XD94CqXfQoft6svNwWgi1J57U2fgnb0X8E8Aooc7xaU+rXxxRW9FV6v3F59r5yFYE89k
         u+1w==
X-Gm-Message-State: APuU4Z9zne30ssXRjqn86EOfVukJK29xlnwXi5eDMAp21qD5+xZr2E/b
	OUFX7/OQfDwqZLTtqvYksDyGfLKvBpRgiQpEbAnrMA+fpecOWMz7AU602CWfEZNh8iFYImhpRXu
	Ml56+R3VnqfHQ5sJXN6zXZ3EqehD5cwO7IL+XQUGljz2zhG7lkmgYOPhPd3fHXRbwWu7BTX1DUj
	IQzQ==
X-Gm-Gg: AZFdTZePIrEZgDHkJj6YBCEAlQjFpjXEl66wRvi0pDu7vRpLhRbZiSLWPOBIdl4Ww7a
	JmCD0QEfx7GEahDYiPfYxN+IgCpIJPRwFkho/wczT+JKSm28EKyYte0D1sfA7UlIEFuj5rPhTRC
	+oDLgqYzlXo2CH4qhzxz82swndQrPxwlef4Bzl+njgQaYktyaMko98sJnbcg9mo67KDtR9QaMtt
	FQTxY3FE7u70+2V9xpIHgMA6rgohbzn/NM2afdZVpMV1ErMNduS6b8YDPRQivKMSfJFnEBohC8h
	N9ZWGJTeoZcISwU5QwfYTDP4KRhN+rJxVNG1GtO/KDUaopblN98WIWjnAIiU9VPpQVhgT19Jhbo
	JwYRwZwbae7+okebWnA6+TvQnKkE5ESacwzAFfct/cgQYERf0ArSuy61ic4vUKN6MbzuEPC1Na2
	sCrRNgiD9PUMZxQkJMM/6oYgS5gp8LV61biJ6w2WNB/TxzThnZfEn27vs=
X-Received: by 2002:a05:701b:2313:b0:151:5d01:9316 with SMTP id a92af1059eb24-1b5568b0f32mr15389023c88.23.1795517650498;
        Tue, 24 Nov 2026 02:54:10 -0800 (PST)
X-Received: by 2002:a05:701b:2313:b0:151:5d01:9316 with SMTP id a92af1059eb24-1b5568b0f32mr15389004c88.23.1795517650083;
        Tue, 24 Nov 2026 02:54:10 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm39083831c88.13.2026.11.24.02.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:09 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: iommu: Add Seca SMMU compatible
Date: Tue, 24 Nov 2026 16:24:04 +0530
Message-ID: <27f6e560a71f770078ef26137207905870c6ce58.1795517644.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXxVXLsJZJckgk
 SDIGIdSJ9w7LKD9k64igyMLq8S1cx96FWbKsh6PqSKZExOeO5NPe5zV6OjWNYRhZjUWnsRrsKtI
 BKto9At0Q0F79d4jmcsjZFwJA8D76ME=
X-Proofpoint-GUID: WYArQ7H3A7WSpG41Z9Q9Zz8pD5XZLTse
X-Proofpoint-ORIG-GUID: WYArQ7H3A7WSpG41Z9Q9Zz8pD5XZLTse
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b056cd3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX8H1x0cujBMBt
 CBoEib+YntsUsL1p6aOsMoeU78JTOuR7w5Hq+45/FY29ciUQ1q/u93WR/T/4Qeyr+uBTUNyCtcH
 z5NtqhX9IQMrN4KV+tZ6sFrHajXg1aFRTaHSGA+FpgCLT6Ynj//nfDMkDKdxMfHkfaTm6zIuCYm
 0B4M3jUs6V12+Dm8ZoOw8G+5zh3WFw0IlgD0viVHToR1UJEiOCCEswVu6rSU0GNI1JuMhdawAzq
 1ByawPxq5yKyGt9gdKGa7gS6iWgvdQFToTeOndwIS5LbYwKjvy+RpDbVccX32xOV5cIZuMVra5T
 HnPZkH8FX5M70LHdfyAWRPZgA3jLNONzkWqI7YIf4Leyu6ziDnFgOuEvneRmp/bCpXflBo6fVMv
 gqEsGuIMseyXZ5S6zgKlnENGuvY7FzZ41h5jfh0nwGIAeoFCzpmeHWRBdnrblOHqKqQ+Vr5NR3s
 OkYh9W1owHXX8waTfhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_025411_957170_63359524 
X-CRM114-Status: GOOD (  13.51  )
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

Add qcom,seca-smmu-500 compatible string for the SMMU instances
in Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..6700d3151783 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -59,6 +59,7 @@ properties:
               - qcom,sdx55-smmu-500
               - qcom,sdx65-smmu-500
               - qcom,sdx75-smmu-500
+              - qcom,seca-smmu-500
               - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0


