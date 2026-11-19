Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75564606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VwPwHssP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=o2Wdfeps;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hR4+yEg5;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b5K0XJ1j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=; b=VwPwHssPi5ZzYC
	Y3v9iaHFu2iCw9oajQEv0TuRTQQpDdym9jH0p9TuGqXy8cuzOUKCPEYLnkVPYklpERFhlbIjqzj/I
	1j1yexZavFTQ8w8mET2MIv/PDhOx6YZtEx2Ywo3ucdsJH81kfSQluf2RgR7U9NpwyByu+rmFio6sU
	AzYvoEfOq97HQRd0jNJUUxppN3Ig5u/qWv64uQhMzprjnc61DY5or2YlZtJbRW/zHqYf7P1Eo3Z82
	s70lo4qUcsjKZ4zS1e13kDUMcHgnaXn2gs6bXgPP+pvcgRQGS+6GNewa6jgZrvK0ZZ2PxCocmyKZW
	bNEeYSVIjvndRQzgLZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy2Q-0000000BK20-0C3g;
	Thu, 19 Nov 2026 09:02:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy1t-0000000BJo2-2HAq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Nov 2026 09:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=; b=o2WdfepshgDnaGEgihxIeAagAd
	OyWfZn8yzEfv7fCymhECeflXHmJSeKLvaczUp2D5fyHEpwhex4IHz0PXnvbV+N7mss47ZkTSMJhiq
	kEOzPMH7SBUgaTMyGEa1LnMoWqcxnTLL5x+zFiyn09G/fcu4IwEEO1/A1v6m+rWrq9C42lZNLl49R
	qzjNPmSnGrB/Ps6xduMdQ7GjDOMbUxOdS6DkIz+ElfDs2o4SQdqugvlbTsUG7UwlPoYO02fhOY/qB
	qeO9DVzcJGvvxs/difSpq7m72lprWAIRK0uoi8y//2XEnG6WZPdXIs2nAaVrwSFxmk1qYOR7KPwgu
	+YPcA6fw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy1p-0000000H1dY-1VSn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:02:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ70oRF1568834
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=; b=hR4+yEg53SHmzaOf
	EG1SQF8KAERzpL15tJczzt4cwkY1x3N8tnipH78YjIGtUI2u+YtyYyHgUymLlv8Y
	6a+xSlDyMMUmfVxbUxt1t3Ev4Rsb8fU1DAbh2Ky2LKOX4nRuTBqco5Zh7U3M10Ah
	3M7pi3cuGqvnyM1GF4AU/cp8gwsUhkF1QUomJfbgVD7Ixu/VXq8BU3PDZ7CJVV/S
	DAiZOkHk2QilVLEgFTgZpjnUpNTOortJPXrajQY4sJ5mbU9n7OTODa13JvN99nDo
	9/fbmqRu5304GdGnVJYuqjE6l3GAcNFpOzmP7GLtLumt0XIVJcuSCoKMXMT6S1GY
	WNsQhA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux8nkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:01:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so2516765a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795078916; x=1795683716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=;
        b=b5K0XJ1jyRD6e9GfYu6UMIHqmNowJJ4YZJ/Rg2SEQHiD2dH0bzSTKuftF4Y2JtCkIs
         p8id+wRjq9x1E//WKM5Xw5xobrGsLrSzUR7hmAwoor7nRHTol1Nm+h+c9DelAJxhvv72
         TmhSQ5bKyk4x/+cOPPPHoS0VK0YIAFlVOwObWkU3KuqBGfeF4GKZmG7u6kDJI+6c1Qz1
         oG4rXBVqrT0N+U2plY9KX2QcOt1pK/46tyk6frekz6AoUdqW7imRMjs/lu6+7DIiGr7o
         YSKNHKPKrE0fV2ZlzHwVoRXz1NwLUXdB2sLIABnLo9duBb19ZKabsfqbMC5LCXpUDbBM
         QkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078916; x=1795683716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=waV53ZLSAR7jtpA8EHopoVYZ6oXl2kJ41A9F8/VOZYg=;
        b=jk/953mmn557jDiljfCJWbkJLX42ncNhDr2SXOotCJoUmc+I1D6wgxJnAEPczNxM02
         arI1c7H/ymOHvbWznGoLiOtQRxomxFUrkd+Q+tsSJp1TlU/PXLA51mIDAUFanyFdPW0h
         H016NuYlEjL/LzmxiJz6vvMDulBpTL6O5piC96xliKiEyyFO+n7TPeFEXCyJbwcJCs19
         I1eS9U2QlBpebl7M2iU68OS1pCRnutspZieesxhEc8dNS15znpenH57fvwqYVoBJkMl7
         ZD10Clq/p+BhjqIrDr3x8hpz9Fry0r0HhkF5OT/gWfJy4xVyNkwZNy0vqAZoie8fczJS
         pPtw==
X-Forwarded-Encrypted: i=1; AL+hErHtLkmHHFczXI2YMoFL0m5ZgpW96Z41IucXVvL0ITio3nYUi2wdn8Yj3PMOW3VhMEqtXzxNKtWUFnmrx/XpB4eE@lists.infradead.org
X-Gm-Message-State: APuU4Z8nS5MvSVCFUTJI4Y2AyAtwWvfIrc3wRG1wo48Z7g12iBJHHDQ6
	5p8ZTavINm/Du2QgEJQpvgUH7UyDx+MKLn0xVT1Mm2qnR0D+AMW279VJdRVZdkL+nSaYFsItxnR
	iPh28xJDl9cTZuMDYNQ6GuURVjAY3nrH2IDn/bmNyAFbJX0KUm1K4LjaxUknKgz+yxIZQ10mPbJ
	sb+M+GMiNDEGmp
X-Gm-Gg: AZFdTZe8oZ2WZAytBGQ0YCMKsi7gysr2l4RbrEb0k7cnT2sonQdnbglttLH1MknLjvE
	3Pf5zGls/XPDGZlvZpL7h3/d1lAOytJFFfiDdsV2XbKqgZtkeklkp5+xHk3+T/Hp6G0jxJabO+b
	yVKHqvdMPZWJ8O2y4RZdxOIxLgtKAfp/aiOfJJJGK8M1G4CLw6hvV6P+KU4pZXJ/Vrr+XlOQfQj
	Jqcx09LnIW4aZB8P70rCFDY3fof1LjdJA7FMX7vi55omlCzuulsDbP96tU8bTboPyQOAJnE0HzF
	x413uMNleQPP913uDPpHB8cdMWngpyrfrhI49mkZBRTODPu4AOL5mwR7nzpyzX2Vq1P9iEH4G5n
	xj0qYFwuqTWts5T7ltsJPIOiCE8xJGO4QX0xdNReoOTolX4cMfGCuwwv6MDnz/AqS49K0PIUoSU
	J7xtDlICdcKhN10Gbbdaao6aXNpYQjek4LT5Pw
X-Received: by 2002:a17:90b:3c8a:b0:3b4:a90:7f3a with SMTP id 98e67ed59e1d1-3b40a9080a9mr480383a91.55.1795078916001;
        Thu, 19 Nov 2026 01:01:56 -0800 (PST)
X-Received: by 2002:a17:90b:3c8a:b0:3b4:a90:7f3a with SMTP id 98e67ed59e1d1-3b40a9080a9mr480335a91.55.1795078915451;
        Thu, 19 Nov 2026 01:01:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm1689539a91.13.2026.11.19.01.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:01:54 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:01:16 +0800
Subject: [PATCH RFC 3/6] dt-bindings: arm: qcom: add QDCP STM source
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-introduce-qcom-qecp-feature-v1-3-b1a730d2c57a@oss.qualcomm.com>
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
In-Reply-To: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795078891; l=4430;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=wgUmKqHp8cq+mf7GbzW/6vYU3g1oJuZgz4QaZbxBLrA=;
 b=sx68gFAiWywWLZiB/xQWyOxC2rvsyPB++cT5zzwjsvXP1qsEqTKbU7IitSolDWV3oR88pvRAP
 Dtq4n+vxoy4A8Az/USgfm8hLtohH/f3xEZGjO8LreQy7BMuBByD4rdx
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: WWoiQsJ19qn-wkrBRuZrl9t3RjlMa3Yo
X-Proofpoint-GUID: WWoiQsJ19qn-wkrBRuZrl9t3RjlMa3Yo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX3aLZ/GCrVDX9
 1km3o7VYGYW0DqT1LeMih3V6vmaWK7XpZPuDboob2tKVEKIWauiwGOIVFrcGKPocXN4N/I41K0V
 ubh4fDsRo8ohPMKE3AJcVS+2ivf0/lE=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afebb05 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=P3Jn8C2Hv6jw6lTxns8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfXx8R+xvEZukhg
 ut6OsMVh2yi4M1vO80RsseYP/uexXnnN4eY27xKXlwLMgTDU8fGOJrdInGJ5gwcpQhWmbtumRQB
 akFq2zSwu+rscVHmvEsyK+PbVEQaV0crNNzvELtCWyfFVJO0OvkPtFLldAlVNnzPUMdcCaeeoPi
 gD7fGOMTvRCXrVI1quyGyaUY5+trkuTIac51sTTxgAaCbgIiyt1tv8u34AwfAS+uGJ9DrrXaelM
 iE/SPkwkF2l286Kg+pdutPgrtSUF70QiPw9Z+hGvcNeCQ5yFdiWuL4A9x/wVVSlcqDdB9TBAexW
 7MMZz6N4L/dAKf2HarmWN6M4KKT8cM3fp/u/5V1YjNfio86axeAXEMA2wBlaU36yQNNT2r2IROD
 CvF6c/SG4fe+/8XlkoledoeGP7pYsiSLjNIol7ZdNedXnXbO10EStpsXRMSksE2NowzxtzmywMJ
 FGinPaeSB/HsoCHUJRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_090201_679372_5EDF2D1E 
X-CRM114-Status: GOOD (  20.84  )
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

Document the Qualcomm QDCP-backed CoreSight STM (System Trace Macrocell)
source, for platforms where the STM control registers are owned by
Qualcomm Embedded Co-Processor (QECP) firmware instead of the
application processor (AP).

The node describes only the STM stimulus aperture, the MMIO region the
AP writes trace data to. Firmware controls the STM through the Qualcomm
Debug Control Protocol (QDCP) provider referenced by the qcom,qdcp
phandle. Firmware also controls the block's clocks and power, so the
binding has no clocks or power-domains properties.

The output port must have an endpoint so the source can be connected to
a trace sink.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-stm-qdcp.yaml      | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
new file mode 100644
index 000000000000..f365ce2450ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-stm-qdcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QDCP-backed CoreSight STM source
+
+maintainers:
+  - Jie Gan <jie.gan@oss.qualcomm.com>
+
+description: |
+  The System Trace Macrocell (STM) is a CoreSight trace source designed for
+  high-bandwidth trace of software instrumentation, made up of memory-mapped
+  writes to the STM stimulus aperture.
+
+  On Qualcomm platforms where the STM control registers are owned by QECP
+  firmware, this binding describes an STM whose stimulus aperture is mapped by
+  the application processor for data writes, while enabling and disabling the
+  trace path is delegated to firmware over the Qualcomm Debug Control Protocol
+  (QDCP). It references a QDCP provider through the "qcom,qdcp" phandle rather
+  than exposing the STM programming registers directly.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,coresight-stm-qdcp
+  required:
+    - compatible
+
+properties:
+  $nodename:
+    pattern: "^stm(@[0-9a-f]+)$"
+
+  compatible:
+    const: qcom,coresight-stm-qdcp
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: stm-stimulus-base
+
+  qcom,qdcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the specific "connection-N" child node of the QDCP
+      provider (see qcom,qdcp.yaml) that owns this STM's control registers
+      and services the firmware enable/disable transactions. This must
+      reference the connection child node directly, not the top-level
+      QDCP provider node itself.
+
+  qcom,qdcp-source-id:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      QECP firmware source identifier for this STM, used to address it in QDCP
+      transactions.
+
+  qcom,num-stimulus-ports:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of stimulus ports (channels) exposed by this STM. If absent, the
+      number of ports is derived from the size of the stimulus aperture.
+    minimum: 1
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description: Output connection to the CoreSight Trace bus.
+        $ref: /schemas/graph.yaml#/properties/port
+        required:
+          - endpoint
+
+    required:
+      - port
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - qcom,qdcp
+  - qcom,qdcp-source-id
+  - out-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    stm@a06000 {
+        compatible = "qcom,coresight-stm-qdcp";
+        reg = <0x00a06000 0x180000>;
+        reg-names = "stm-stimulus-base";
+
+        qcom,qdcp = <&qdcp_coresight>;
+        qcom,qdcp-source-id = /bits/ 64 <0>;
+        qcom,num-stimulus-ports = <128>;
+
+        out-ports {
+            port {
+                stm_out_funnel_in0: endpoint {
+                    remote-endpoint = <&funnel_in0_in_stm>;
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


