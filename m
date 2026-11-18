Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D75606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ItnRyTse;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsEmTXv0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FbHrRPcA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=ItnRyTse1P3D2u
	kc1T5b09q2WK3u1b5V41ZAJWk5hi63J09nJYfR6sVEqvT8Njdmg5g6pg7nz8u5YdqlL1OWsRGIEVC
	QuRUxTe0U72XhRgvf/B2KNeTpQZwRtya0LBsgJMP0MgywQ64s3rGh8F0gTvSen3+xvXrT64h5jMFM
	eZgZZ/kxXOhIz5JF7XlwtQgRY+4Lzho8EvWa/AuBrkQQih7zbmFs4r2N6KXUHr8mM/dscr9/akpyq
	QOamx8VRbR1Xj2bQLMsv8f8+laVa1JPNhi5BMvV6X3IzOm+dYZlG2eOSZo5YI43iOYdrncp1c+g41
	CxORa/NNJ15dBZ2aZRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTadq-000000085ns-2QVl;
	Wed, 18 Nov 2026 08:03:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTadX-000000085Zb-383A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:03:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2W5S74060171
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=SsEmTXv0vWkA11/A
	YWCmipZNB9/Xrnmzmq9H2O04cHvPsf3E+vQGdiWJEhEHsYBBs2phR2eT6DjA65d0
	8C8sO3ogZMwKiXUTuom0WdOdekB+VMxjIULmJz0FeaPU1UYjcsddvN08GRYlqnsc
	XV43Mpl1ED65oEndYU4JAvdYILLbpzNV/d0WWIqxnNaWTjdWZ5sbzV/pXYPbQAnO
	TxQKqZxun0kQRD9SpYIg3bHqwl5RdxRdebG4RxFveHjPpnvQv4CFuqCESimB/p3U
	xaguq6ls0bfydoJ1UejatBWAuNbLWgTbNo8P/65EatZsZHJRZMcfdNl9ISt/NfvR
	ftljAA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchycj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:03:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so669286a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 00:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989002; x=1795593802; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=FbHrRPcATeHgYE4roL9HCWX4YkdluGBV9T2TnMnzcMsjPHIZrXHTv+L2IQlMYJlG3I
         3v3ukXC5iclNL1A1rf3LhGIWYfHnIf1TrY5cG9LrwAHFwe6tICjRXPNdqCZfXUgNNolt
         fg7tKXnINSudI5Je4NBSr445DMygFITZDr/8bsSg+b0DuvADy+RNVjek7x0R0DIu7q/H
         Azlwg0RNZgci48as4SzjvZc+KsKQ55CAsUS+qOq6yfh6mKU21Lt4tnmNgdiqGUxF0Cga
         IKdd3UtsAhb3qWG5ZaVAyhEprCerFI6VjalT9cgmfD2AM4xGQx+DdvOMrdePj1NojS+l
         H28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989002; x=1795593802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=YRm5wKgbllSpLnhwEiDbVVTSBANef/roU+ZEmGUD4IECAuKWI+Oui0YQTymvIvsB3Y
         s96KgJGUp25naS1R1KeDexg5TeO92/gGmZGYX/e/U3k7S451G0HPcJqrTAWcuR5CgEal
         lRM1GJxeralXhWFrUgBmbFCJ8EW71joHXI3F0D0Mm6Fm419ROslkBbHb1B6FkDOJEEsj
         njhJ4lzVyS0ijseofFKJN5Q4uG2N8Zqtj29Whj3cuMswKlSqpHBBYWgNyh39/xhJNM+q
         wK48NRGP6d9YtlA4yrg1+bcQ8Dz3ZJ96FY4J0oV6rxcGydnSYxmE37BhNTFBLYGGyA2S
         7daA==
X-Forwarded-Encrypted: i=1; AL+hErHmlRbRV/9ZWDYf7ClsWFVcpmrzEQ0neCPE/rTin9xF94QhH8hnj12vF38zZXu2UJk0M0wKNEs5MF+ic6Qn1mHg@lists.infradead.org
X-Gm-Message-State: APuU4Z8Tn/NR8NpX28UYAdOgSwWcdrmHxOvAlkHIJqq3l82WrhrV9VUq
	hD3HBWE7wiob5mHXvjbJv8kRJIQU0JtacYBxipU03mj5Z0yAUCFkoRDJSi1BAxDXvbuQ02Mmj6C
	V5HeXP5sB2dKI44nSpRKHD6aMREnLNQ16Y3jOkmQxnT/swS/nxqDGCGfELQbYUFQWPVYNdrctVJ
	5pDw==
X-Gm-Gg: AZFdTZdKgoblQrmchVWrrpAjmYpRh74We+YG3QS79gzQpsYsm9PcRHyfKagalSBuPYC
	N4TJgZYVa0kuAELlU2zUT4FEJMqrEQAuy7St6eU/doWDTYMsgKRyLbi+FqITHuLUBlP4tCDU0rR
	6JVFrjV6nrQOAIE3Glkn8P46IYOZu5PwTt7Uuijsm0t8bpAxuNfWWpC4/mRiaaf9S3mHzyO90Yq
	q0PRktcdEjikPEYw6K8ddaTY9fjaJdKLHzQqS348P4AZRBqccnWdg+xxmFWFYnh0hAOh52p81w4
	5xmjNnF/+bMJu0Ni6wO/qWyTqiLVqLWnHe5dt8JHeJ0//2N0M/I9onq3MM4KwYcnmdgkgWsL5TD
	oUxdiqavolrmom+ZrL4gCwR+kzyCMfoC9sQWEj5m1OhZUrBaOBo9KxaDxdjFuGne+0UBR4OZowp
	1LNwl3dhmTPBIs30x4W15wJK0dXxdYVFmCSAcU
X-Received: by 2002:a17:90b:4a04:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b3d07598damr1763231a91.20.1794989001574;
        Wed, 18 Nov 2026 00:03:21 -0800 (PST)
X-Received: by 2002:a17:90b:4a04:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b3d07598damr1763208a91.20.1794989001103;
        Wed, 18 Nov 2026 00:03:21 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:20 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:27 +0800
Subject: [PATCH v23 6/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-6-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=0uAuvsb5ehgZ9RURv9BLhMCPJgyhvvKonYmDULG7SkPd4DrZLgbXUrsbMqHtUbbHfKuhil9kp
 819ZRtxxx5ODCvOgG+GvhrxxzOjsPYA3wxE5vyI2KaDMvD3lM4Bx3x8
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd5bca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: WHAa_hks6q9D4AdCNEiClb8sVQhnYrWv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX9hsx34viyuoh
 KHLtIQ7sP/CZyjVAYRItmrCVCNaw45K29EnJ9E1LnsHgWHjNCuaBuLyB9aJiFUd55t53q30ntlV
 2LInaIZpxoWbzHvbtn7DbcxV9yFNhjA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX6sY1nWCJiusz
 Cg3JKDccduPlE2lYpE+8a8CuU+n4n2+RVKUtCbFzeTg+8hahy8M6eH01bvAh+w6MOX4311bvAav
 S8zSd22MvEuNfecvF/vHi9agEwlWNX4tnUalJtArm95fpCw6AbrgANVWkSqqgOx7mU9Q8Bit998
 1jzleTd+CnbAibO+Oe3rrmloTVH5XwEKibgDiDktGBGtCiVHt2PUdDVfSSvI7GlZAoQMLok0uFA
 52gkgD8VWtOgVC5HP2qgABmP00LFJXVepFFOawb7EaOuWw4ocEmt2H4br96un1TfbkFixeGYdSb
 ukkM5BDq1LuUZJWs2SK2q89Sy59PMZGzKGk4k2gpoinlAbKXdeOxDudN//sN5w9R/Uf5M5L91za
 NllGpOLn729M0uieWAZWTd8GA+rb8rCU1EcQdTh60wM8NSedlpPTh8Z78cisjzl+bOqhqLeGVGu
 XSxxVbYvwmdc7MLpmWg==
X-Proofpoint-ORIG-GUID: WHAa_hks6q9D4AdCNEiClb8sVQhnYrWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_000323_965704_66BB6C2B 
X-CRM114-Status: GOOD (  13.92  )
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

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


