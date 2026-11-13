Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1B0606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b7HLASpJ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMaPPvCh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GpFWbDLS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=b7HLASpJE5hRHQ
	FfpBiqPfzTG7PGJdb/RwPBp26LlZlg7kY9B22PsrkDOKqQNnimZAb5ZmQL5cV1NbgcwulxvGu15ta
	Be/TIv+9iCSAscLZVQ4adiBr87XADVjm/O40xq32pGAqehFpAagzEE8/nHumVv3PoRBOaSDhxygk+
	bh3W9+bDcZS+92azKx1M7LwId94ZI1GmFktesKZ3sMdiXbLjeHHcw5m/brzbqYgRKXV+zRs2tRC8D
	zY3wzS3lQqcmxPgGTHIhA89VFiMCRVjQ7SEq63DHrbpBN+evmv1wwqbAbfDqSTzjWwqi0bh5RgEzJ
	KBPZ58UXMzojMOIf6cIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhNC-0000000BWAh-0Ycb;
	Fri, 13 Nov 2026 02:50:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhN9-0000000BW9q-0Weg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 02:50:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KQwh1534500
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=dMaPPvChjPIWoGHE0eNbrKwZq4Y
	Rj+KhWx6ukFPAMbnpJ97J97ve250cZF8L17bcLjLyWFvlq1LNrmLXFqdiXr3B4ew
	ustXxhpuy6W01y337tQJRng3EDzf+m/afUxgIiCknQx8MsjY3XqZ2u8yKi1eUrFC
	A8ZR9Or+E629kp1UlSrwAK9sCg4CffflQlxH7xRbisZL9WFA5QwExUCriJmBuHz5
	0c3p9JVUL7lbg8LC7i0WJnEqSJdktT59vUluLU5PPSMK0AeOOaPqaDrhNJs7yQ9N
	5iFtO5cAGQybaOxrS9MYqTSxdN4k9XXeGUllfkQygsAvlzT1lWHrFhI2vjg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1ba577-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:50:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea63087d79so4907875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538238; x=1795143038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=GpFWbDLSCvo0+X3R3SLbP0EwDGKu7iqz2wPP/ikpzbNqlahOAg/FgpdhjtCP0691Aq
         GeuQwsJYuU8nsc8/86YLTLAa/N4gpzOrKPF7TvMXDDcx6IKLYBo4YvxF0ieQm0HQha4f
         D2luTCrk2TS4jXJz6fHCMq/9ovUhPSj/2kbS2TcrBEHw+C1UArIrXHjObLPppj5kcFFr
         9BaX5D2PGavhygyZ0oRjr0kg6PIwSSZxiKLduz86NwTF77bqSxk4r9CrUJBE3hVgJgdt
         Myta6J9W6IE2k/i5neBbOi83k5kTL2y9mFatMhyObznJ6OUM74ArPNkHt98DQKesrarh
         7T8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538238; x=1795143038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=oCpMyeWQl3/P3pCG1tf6jZ/4cOxbP74zHWLSQBDTkC+A9nnncUuE72koTZXajRwohJ
         BeDW2oujrEx+BQ1qvjmen4GW4WqM3F/wlnRDUb+G/UQZRcZ7n8hqOZY4Rl2sAsPi+vu3
         Xuh26/CXmrvUJ38JQXnjxdL5C5c1IXSHgdj7xKfYuFy57YMhkCNpT0/URsUz8HXB3ZEv
         ogQFPLd3xAfjUSQ4IOn9JmQH3v6qAeQnecjio2cHk1RxTCAeI7kusvg/m92001QEPgAO
         8caU99r4w6hSsV+yW3oPIp03P+cKMgcrJ39B4iMAv4NbkFSPmxRD185AMqTqG5M8nEQU
         tAvg==
X-Forwarded-Encrypted: i=1; AL+hErFithBO6vib2pNpRASCaFOzOvufyJkf5G6sro6+ktZgWxhv/AjXxt87be6nkZdIEM81mfVmtY06T45DMXDmyasN@lists.infradead.org
X-Gm-Message-State: APuU4Z8jltmY+FLOVluxOZtFI7LDWG/WDxgI43htbhV6TZCvstI+YVfA
	hw7Wn0p9we9HZO+addZ4mVIbszpdKKRZIT5HsQv+026Zr8xGSjKdMq40+mbsxv6xAGDHKc9arGq
	AjVIPLbP9NJvCFkQh1LwM4ll0+IvjCIfuFdDBYQKxdrkU5vPc51Y4eVfuGFeh6QSow6ugYn+NNQ
	bKMg==
X-Gm-Gg: AYBFou0uF5kAs2C5blSOG0dTAOmXqmHHdDhDucAUjp/kohq20oyERvRMW4jVUVeeN40
	/MbNW+GUATAZr1YLzPVT2tLhvooM3e+De5xMKs0N+u+PeuCQQfmz7m3+xg5LTFN7mzLCGkoIL4z
	pUtYqB5RlDndIWvsoKOybfQvAqUUXy5lKCmjy4pjcG6H7BJ7oInfSedwusk0ORfkUE6U8ywoSmG
	Yp4k2aSOAm7e+dlxm5kMY2KeTMCLfgCRD90huDLwM8yUV7NFVkWtsXe7AT3ZZ1Fovvib9rIMmjr
	qHIx1WCh95LBEzJEFbEP213+UHcxhcboTiu3U+jwQTxLXsI/+u6Gn4/ae7nSnaPoel+3Y9Q2H/Y
	CRgtZKRtElVeuVU7H/pyUMBUaJjjUvKBihwRc2W7Ih6qGa5eJreDo5vZqfiAUjhPYuTjT3HmE4V
	4R071fxGM=
X-Received: by 2002:a17:903:3845:b0:2df:4dc5:e12e with SMTP id d9443c01a7336-2ee0decfddbmr10972585ad.27.1794538237633;
        Thu, 12 Nov 2026 18:50:37 -0800 (PST)
X-Received: by 2002:a17:903:3845:b0:2df:4dc5:e12e with SMTP id d9443c01a7336-2ee0decfddbmr10972345ad.27.1794538237107;
        Thu, 12 Nov 2026 18:50:37 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:50:36 -0800 (PST)
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
Subject: [PATCH v17 01/10] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Fri, 13 Nov 2026 10:49:26 +0800
Message-Id: <20261113024935.3173715-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af67afe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: yTxPTTlrjYatnd67F88I0nYWMBN4vGzZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX9M341ZWdkwkG
 Dxs+PB2bnAhxFYzz+mzY9Sj97xGybxs/i9wFTeJotqTgwuWs+yZ2zH8qQMnCOfHR1ewdGejIR9R
 9UCIbp9WwuCOPkzOuGJmzhek1hfmkUiaoZAbVkLNfw0zuBIsqIyARTSUjGcqeR/1OIFhJfBIm0i
 +yhIa6cowzCGJBjtHM6+X+x+H692D9/d7XJ+ULvC08/A1BR+VWkF47x93m203JZtakG9Tmx7chI
 l8rHVZwfgo/LHYNOa54aXUmve0IhqmxZWKjTKwrGOG0tADVyk1kFO0d2B3pirrd5yuK1uoqAvLL
 uaratr25eeb3sUOJtTV2dx31kTiFHIASu7Eb4ZTeNnBIKomSFaFFw/8I27oWiw3zgRRTzudDEVj
 roWc1/PwWA1Ql4b2Z2lbYCy3pDXEP151SZA8JszvNkH7e8jAzOnlEDPkexzBGa0dAf6fM6oYwcd
 qmVbIeGGlEh/B5flt/A==
X-Proofpoint-ORIG-GUID: yTxPTTlrjYatnd67F88I0nYWMBN4vGzZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX4pgJmAYbidoH
 w+l1sUqLZlXX9iA8sBg/dbMOzFpuW9xfJeDRUjFDUlGHEFiGeLXgFNsqo9u7QcB8soxlQ6h34Gd
 WH3vEaAokNOhEUh55NvT9l2hiMKQ3ac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_185039_174751_088EBC40 
X-CRM114-Status: GOOD (  22.28  )
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


