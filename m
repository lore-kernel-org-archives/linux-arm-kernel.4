Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECDA606A894
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S63cqm2C;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AIA0+3yF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DBVF96rc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=S63cqm2C+fbOsg
	Wta3zyKhntzXpTEpExIF+kbOv3kG3i4TON05OsUuaDEuJ0F96hGx8vcVHoIlmrrotwkRsdXjNVc7g
	hyaNiBhyTYRYGO7nbmDaNz2/B8aeKgJTE/z1kGGOrviT6agY107nt4RWbTPGhW9Y4B9/bWmfXPc9m
	HduPEAjV6/k1ylnN6KtpPkF1tNnSz+s1rhVM50+VOqQwI3gbXbltrY5rH93CUbsJZCh4Nw7/vT1IH
	s2/7VmB5EkY1i51c5fkzbBD4ixy8PKiFrNIz2vhKyLmDsLoLRYH96pzp6+/Esjy3bs1TOeQLFcX6B
	p5wlFg64KRwl+ycZXgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDh5-00000004mt1-2BdS;
	Tue, 17 Nov 2026 07:33:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDh1-00000004mrk-3XlG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:33:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6MHt13981269
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=AIA0+3yFYr6iy7Nswix4qKnXpl2
	quVLQcOVke+g2SmYUuONiFX0dvabXwBiROhLFNlGVLcX7J2p6DVOW3Af70XuT5mu
	4m0lwP97HIRmsWf+PFZp8sos+Hc93hsYrDt3hqvqWNTQvU7TjeB+bQ8b9w9mzSsW
	2JRKWSthrWNA5eai8dKCfk3UBzMokuQt/C8tsjj6oXqCMsiTL5EdrZ3Ymrwgzqq3
	QIff81j1r9HOTjcYktoo0IfGymZcT5PkxoKXU/qE9EnG0uVKLd3A+nQAtL1xWCr0
	zPT90strtf9YmpraUhJqKnrLy8rV1BQk9kow+AnBcr3gYpwFZ9NHaCsKY8g==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd088j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:33:26 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-85c1135c289so3031835a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 23:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900806; x=1795505606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=DBVF96rciPvGBFxoqB49HtlqYzaRIC8MIccbBFQ9Woh1bC5Bbumm7QatiKju/tgn04
         q1namwVseBPtrBOcTPCEmWcafKKqrwsd0TK5BsP/s5ZDckqDS9I80At+PxADLhsTv9dm
         Z+zsb6rHqzlC0jm4mdGweSppkrk2d8HxdUW4Zbq2MTcgq5R8iRYaNMwOO7TRNNXPstmd
         Sp7gTlSgLDWq0vkbBSrR7gmgyPy9JR9hhiRZOdxh5j1XtoejTA1XdJQTQHO1wKZS64Ba
         7YC2Agb3+JpunWY8H9BwydxiTvKCFaOIEnIIONDeXfl2ytYgdHSWjizF1AucrqqfVW4I
         jzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900806; x=1795505606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=C23Z4OTsejvyO4XeSIB7kwhPw4NGaD3DKOFE0PgLhqKjW7kUlx44s/eloR6sFTYXNW
         YMfVI/xC+kaKXZ7upapyjMOuqH3udGh+swNkrsABcCVS5x+uePvrTmE1bzgYYS2IR4Mp
         fIBVRra5hH/jl1GU8pr1NiTBLO12kkEpQkE+KIYLptJ+e9eTiv1QaSlW55cqCGWuMzI1
         CG+0lAs2tiM4SpxxVg/8NXWB7K0zJp005qDAmLbIc0LxWmaNEhYbLEMKoFaD46nw9/tW
         /tYYPcHDzMfm6PqMbFMJWKrzOnLw2L1Dd2aWVfBQkY/7VNFltu7hxk4CfM06XPJ4Bt2n
         x8XQ==
X-Forwarded-Encrypted: i=1; AL+hErFKPwaMbDMF8Gz7iQ2vRZRtoR9X1SgcuRzwBGax0lPHvSb+R+cbI7AzSDHXspqTfVLS1bayfHOEzRcDQqz97vPE@lists.infradead.org
X-Gm-Message-State: APuU4Z/8jnW8hFX5ZW3Mb1iF+GwtmlfWeFqER8xz81wtRLeQ7TtT9G7O
	130lJaXYn3f9APAOw9htNwFAPPwjpXKzHAH8H1pMeq3lXUmOJBIYePIYevGEwRtikXKUikGLtCf
	anquzRSGM24kuY96oz/VNP+mQA1vJa6do2IyLz+50498572SsrdySWgW1C+47cY6yNmjF13Uk64
	o6sg==
X-Gm-Gg: AYBFou3HW2nE1Bw2HW6ztxEVLXA0Mr4QEW7iypM6IIAoS/L5p+7U+7XkcDG2yLezWsJ
	5dwRxB5APH6TCgu4ixJ5h3nh5Ys8Hl6+17TqbrB9Kfzmh1I6rnuAHLTUSLFkibvoU4VrUe+k7G8
	vRovbtrN7SGT41bkqhjUNeBRYGx1U0Gue+vB4etxYOp6YdcDJ3p4OOv3DcNtlD8rC2rIwR6KVJX
	bh4Q5rEc7eE6F2sc5DPA6LPVlje1L98fcRrD+qXL3PcdQseyYWUcGqT9MUHZFlJSIoC9Vu4Vuv1
	EtaOahT89y0YdqDmJ7/cgbern8W3xP6EjTGOuF7MfeF8X/KMj/Kz9J627rz6RSOPQmNqawIEJ4K
	6rr5SD3K7lar3lOTy+4ZA6N3NuaT3IMe4paVB/ipd6IWW+GOfvzg7eS2AofDzeBa3aSuR2hKsA3
	hF355t4+znJ7Cj6BBPE7Oj7oobGhnyUKcNpA==
X-Received: by 2002:a05:6830:34a1:b0:862:a48e:24d2 with SMTP id 46e09a7af769-862a48e257dmr9070516a34.15.1794900805996;
        Mon, 16 Nov 2026 23:33:25 -0800 (PST)
X-Received: by 2002:a05:6830:34a1:b0:862:a48e:24d2 with SMTP id 46e09a7af769-862a48e257dmr9070422a34.15.1794900800721;
        Mon, 16 Nov 2026 23:33:20 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:20 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v19 1/8] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Tue, 17 Nov 2026 15:32:58 +0800
Message-Id: <20261117073305.3854951-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc0346 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX9p93FJvQo/W1
 Zbq5rPxFs/icZ6oFsZalKpQ2bnG3ziM/UCiaLnYNolIRybusJBPYZ14E9+4L1yWmP2/KD3V9Jgz
 ILxbOeD8qOkW8FnlW7D7iY1Ux0HFHDw=
X-Proofpoint-GUID: durv8aSSEYgZTi3IuOYcq_LYlyjG8RCP
X-Proofpoint-ORIG-GUID: durv8aSSEYgZTi3IuOYcq_LYlyjG8RCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX4KYf54e/RT6O
 TA1bVEKdIz08rjIitGiP8RkYsTFht9igYV0ALjZckgQ7ZuBQgB8qkS4LlpIENg+XvJWAAjChdTp
 NsxH4RR3IaGuLtwS0krkBkNWvtsne9L9LhZMgXnEYLqUtGOt02g9gw3N6LhuM43Pjc6710ZD9L0
 KGZONEGrsrlVeS41L/f4DRSF78x/wTCgQzqDzlBR5Hrj/SVnXx0Bxi23QDyS7SAUweEdRVZFHwq
 V2YK7bzo11FBpxzlwSsHZrkkSJ3d/17wI6IK3PKgYdKwj/kc9wLToHtq3UaoECM59xNAVmAaDfm
 kmsAyCXZbTmKFmqOYwYf6QEoPIVYs6IpDnUV8CWt5WsVDTPnFD5mZsA+RFSELcm/4git/kMUYHG
 ljCe+dzicAqKU1VMpegNP7WJuk65VkUUZMsBjcBWGfALgDq7wrgA9R8U2T5mPvCZuHb4FTLlWrr
 qu391P/8WMQVKpe+6kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_233328_032928_96AF7380 
X-CRM114-Status: GOOD (  22.23  )
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

The Trigger Generation Unit (TGU) is designed to detect patterns or
sequences within a specific region of the System on Chip (SoC). Once
configured and activated, it monitors sense inputs and can detect a
pre-programmed state or sequence across clock cycles, subsequently
producing a trigger.

   TGU configuration space
        offset table
 x-------------------------x
 |                         |
 |                         |
 |                         |                           Step configuration
 |                         |                             space layout
 |   coresight management  |                           x-------------x
 |        registers        |                     |---> |             |
 |                         |                     |     |  reserve    |
 |                         |                     |     |             |
 |-------------------------|                     |     |-------------|
 |                         |                     |     | priority[3] |
 |         step[7]         |<--                  |     |-------------|
 |-------------------------|   |                 |     | priority[2] |
 |                         |   |                 |     |-------------|
 |           ...           |   |Steps region     |     | priority[1] |
 |                         |   |                 |     |-------------|
 |-------------------------|   |                 |     | priority[0] |
 |                         |<--                  |     |-------------|
 |         step[0]         |-------------------->      |             |
 |-------------------------|                           |  condition  |
 |                         |                           |             |
 |     control and status  |                           x-------------x
 |           space         |                           |             |
 x-------------------------x                           |Timer/Counter|
                                                       |             |
						       x-------------x
TGU Configuration in Hardware

The TGU provides a step region for user configuration, similar
to a flow chart. Each step region consists of three register clusters:

1.Priority Region: Sets the required signals with priority.
2.Condition Region: Defines specific requirements (e.g., signal A
reaches three times) and the subsequent action once the requirement is
met.
3.Timer/Counter (Optional): Provides timing or counting functionality.

Add a new tgu.yaml file to describe the bindings required to
define the TGU in the device trees.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..76440f2497b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trigger Generation Unit - TGU
+
+description: |
+  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
+  to sense a plurality of signals and create a trigger into the CTI or
+  generate interrupts to processors. The TGU is like the trigger circuit
+  of a Logic Analyzer. The corresponding trigger logic can be realized by
+  configuring the conditions for each step after sensing the signal.
+  Once setup and enabled, it will observe sense inputs and based upon
+  the activity of those inputs, even over clock cycles, may detect a
+  preprogrammed state/sequence and then produce a trigger or interrupt.
+
+  The primary use case of the TGU is to detect patterns or sequences on a
+  given set of signals within some region to identify the issue in time
+  once there is abnormal behavior in the subsystem.
+
+maintainers:
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Songwei Chai <songwei.chai@oss.qualcomm.com>
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,tgu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: qcom,tgu
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    tgu@10b0e000 {
+        compatible = "qcom,tgu", "arm,primecell";
+        reg = <0x10b0e000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb_pclk";
+    };
+...
-- 
2.34.1


