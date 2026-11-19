Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CE5606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r94HUNsG;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hBKzV7eg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EjzYXn+t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=; b=r94HUNsG4YyJI7
	pM0v7ouGaoE6zRXxldh4/0bSPKfxVw77NV4XQCMwGtTwcV3hz7c9yXKGQrL9N/oxUWzobOV2/zKBq
	QdjxpuIIPmXYW4kXn9mJxA2NdUyavw7dlHfhmg8dSLDxaKELvL4NdOxIxBF9lmu97O0UyLgWD5Nw2
	aFwpo/ezpn6RAY2szML9EZAb7358zL+PSfMVfXgwlY/orLJG/1jJfcNtRNy72peDj8iBCuRmcjwnj
	csngNCqIeTkeRy5USw+ONHTGBvToEUWHSBIcnOjMr1yezokpfFGdmdJ0R024lWbvyBxYrWFdDNbIR
	tYPcSJcV5hEEycclvwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy2P-0000000BK1Q-2r7R;
	Thu, 19 Nov 2026 09:02:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy1a-0000000BJeC-0rJk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:01:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7Znhv3718100
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=; b=hBKzV7egc7qpyYFR
	nAvLlpJdkyF3Idi/vrTGC3XgfocQKJdKyupiPJwEiUr9Rr2TVKxrDMVzKxCmhIFc
	UO+SJNXIkg4taRp/bs5iN1GWOMBlxoJz/PPEnC6jrpctMaOnBM5zTM5FqgZVLPGY
	Rx7gwvEmxIUP0yTyrJOZSD09S6Z5Ta1PVwpdN1mlpxZRgWod394uME37eu87xRXv
	7oOTW5KNTCXJ1UqepvNCIqSrYyluRprQWHKb+XsYlptAAUu6bZY6UqbAyq/oD4Tx
	HhXQhd5bowZwaWuJ+yHXageksRDkBEy2tTPT0JAQ13O1Of+QRN9esFD3n51knRcN
	F5SkVA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2rc5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:01:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso2431118a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795078904; x=1795683704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=;
        b=EjzYXn+thDbSeoyDeQAJHn+bwE14zd8hHyZjJ9EPE5Bdt2Jh+aeMHOHWu5iMhShGDd
         rE6l09lP0xss5Bw0fVo95e2LHQ5WuuTPXh4HpBtmT+XCWeZj+a6Z5aIquspgy++GJJph
         GaZ64Q+0JGfoLdTKM8fo7iM/emmsUBSxL4LClYSZfyeOGs/uerPLtUJIiH8xgI5QmTp8
         wobyNJowY/lyXPCroG/sOjP2me53PIRqFhklWE8WgsBfI63qAY7eqTeLXHnqM0rcoM1i
         1H/GXjoLjcigGxSwYIIRUVF3p299tl9/i/aGTfG3rjptIE/PdlqOhhfxfWkhsecrK7ex
         D6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078904; x=1795683704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxi+MQ8kXAC6ROWaTRv44mEbXLIae3bz9HNaUOQsmEg=;
        b=lEAxKUOPrtzJTtkWKamf1nVhzADgPDP7ypdLD4+KqWTiZkuRCHkIYsTHxRQYrLyBzk
         gaDbiU/LgrAWotlQ6m/gRgsnDlKSywO4oY5+RlfDv2YBpkee499+2m0RkZkHObsrblzP
         TqCpw4kEtGlWbLTg7fi/Ojd0HbS1xvRjyz5l/8x3ZrUwMt6f9CMKhezvlI9+Th/rCs84
         7NLZNHsKJOJK04Eib5Ni/8IYagFlMM7oe7BSh13qjEj3ofF5EwyhnuZPrfTvZQjcANMs
         rthOn5jPJzYXsmh/1rj5POi3MMNhYq3XB5hG6qj3rfeqYm7P8gu5rP42kFbZm6UVnfqm
         XKOA==
X-Forwarded-Encrypted: i=1; AL+hErHTEhlSEM92nqiqeNMJ5vlrBOEEKa3DNQMcE3cPXZi51QoUvK/QjmalFMV4AJh2tVfOrNN2kUfJg6dfe0J4H/Qd@lists.infradead.org
X-Gm-Message-State: APuU4Z+k3IAkfqh08hno7zqQcsgJcahp3fOcStFHh3GRN2WZ5+kGG5nc
	neOVH6XUIpVuutjs6VpKVNSzoOM2vCvuHw3SNCbuPeLsHbrHwRzemffh3MC2oSYX56iJ/wq2Adn
	kL5s3X7sT0lgKHkjd0WJLedKGcdKYbx5fRmwgZd3XwknQq5BMgz65a14au6lEGfXQDuVue5mJJQ
	fXFbMwtH4VjZ19
X-Gm-Gg: AZFdTZdJLCpUDCAiX64y21bmHGJRp62KB5SfyEHyR13mthYmVoGzYdECPFQOYIedJTS
	h+gh9hDOlv+WHW5xU0S+ojq/htRnzi7DYMtBsRP+1Zq0S+RQSpLFmu3nU0OJiiBY1MZ3fyMOWI9
	Kzttn9t53RN9+mv4/vwE9cwSZvr4NHnW+IF8f8WT3QpBj3cTvin3zpI1izHbO0bn9FWZ+3e+gyB
	sOFYKfALVbJhE9Xr9jtZ1lOiNvkENhVr+iR6j/LHTK/MIOWwj2WZ4zCQrmdf1ovSfsqvWMbO1XD
	TY0OXDz8Otnl8LVkNfnVJHUi1ER8oT5j+cr3+N8QwPaHXcYehgXMJkb7rXQpy2pzd6gSm/njpe1
	bvmMeXDRivSGOs09EyAsWuGE6q9WfLlyDpWYw3QyjgFm4O9xtNWiMcD4oAM4B2xhrPLM2Nsi7Nm
	rBs6nhN7NOIXRchDklDFuQ69aVP7AnlLSZei5e
X-Received: by 2002:a17:90b:1fcd:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3d0764684mr5300471a91.35.1795078904002;
        Thu, 19 Nov 2026 01:01:44 -0800 (PST)
X-Received: by 2002:a17:90b:1fcd:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3d0764684mr5300427a91.35.1795078903441;
        Thu, 19 Nov 2026 01:01:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm1689539a91.13.2026.11.19.01.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:01:42 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:01:14 +0800
Subject: [PATCH RFC 1/6] dt-bindings: soc: qcom: add QDCP provider
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-introduce-qcom-qecp-feature-v1-1-b1a730d2c57a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795078890; l=3826;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=C45KpIlwNH/YljdNNGWJBV58QJEhk0JLA42ndKrZbLg=;
 b=ev1M+t20iPdOBT1JF+M9fv5cK7IESCNZW+J0Xb25OlcWBUp6HxrkiZUYuwxXSwPT6MG2W6Env
 pau1hGehI26AVrUz+cJSIZHv1oGt+KIKTxSRtZ/hkqz8oZ9sr0m8471
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: v4YD2zxDBBmQ7Hquwf-B8YncJsnYUJD2
X-Proofpoint-ORIG-GUID: v4YD2zxDBBmQ7Hquwf-B8YncJsnYUJD2
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afebaf9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=IqNXJOJUzIoeS_XrjnMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX/0OVROFQnhu/
 Bd1cQNp86RDERZURcTk1ll0Q6OQjjQwyNss3pvR23/O8j4svW4icYNyGdy4MgKI347fZd80QrTJ
 wXqCiaBfdqG71oYpnoE9V1zv9E4rPBY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfX2zEkuppK/pzM
 rfGvw+5dkJsXUcLRyni4gSK8vPthL6MvM+enMElx5PR2pI1SVM6EKBf6kMxnaqGV/x5Eymgoby6
 77lKEWwzQcqA8i8PzumRJu1Yub11ooP/ZX2kFoc8VH4BvRUtsRiaH2kpYPHiagKzwbp4uuz3MpI
 HH5ixBaCexdVTmeJ2AdHaTJWl8iizivjYBjoPAo8bdnfl8DEEei6QBd5uPCclYLpKicJXZlqwKK
 xx+Kia7bRAT+tInGYaI9jpL63vuP7y18prfOBk/VporiQIemvE/Pmy8c9kwe5l28epRBBDBp+R9
 gJgKPzpDlU2dzcg0qjX16OM06ugMusCsriIErT74iYFYTi7QsL56d3EwpzgfcHslCgldt3+Jnxs
 eYeN2isOSIocDOXRQUBdKLrpQeQljPkaEKjkJqwCt6fg/K2CCa8edtTq4kKkUjZEZb/VJSHwpgc
 FLzAJHY1AN1a+NMHl2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_010146_374960_C7EF99A3 
X-CRM114-Status: GOOD (  19.64  )
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

Document the Qualcomm Debug Control Protocol (QDCP) firmware provider
node used by CoreSight debug and trace blocks that are owned by the
Qualcomm Embedded Co-Processor (QECP), a separate on-die processor that
runs its own firmware. QDCP is the QMI (Qualcomm MSM Interface) service,
carried over QRTR (Qualcomm IPC Router), that Linux uses to ask QECP
firmware to control those blocks.

The provider is a Qualcomm platform/QMI service node, not a CoreSight
graph device. It exposes the qcom,qdcp compatible along with
per-connection QMI service/instance identifiers; the QMI service
version is the only optional identifier, defaulting to 1.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,qdcp.yaml    | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
new file mode 100644
index 000000000000..ee0a66b12dde
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,qdcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Debug Control Protocol (QDCP) provider
+
+maintainers:
+  - Jie Gan <jie.gan@oss.qualcomm.com>
+
+description: |
+  QDCP is a QMI-based firmware provider used to control CoreSight trace
+  blocks that are owned by the Qualcomm Embedded Co-Processor (QECP) rather
+  than the application processor (AP). CoreSight-facing consumers look up
+  the provider through a "qcom,qdcp" phandle, naming a specific
+  "connection-N" child node rather than the top-level provider node, and
+  issue typed firmware requests instead of programming registers directly.
+
+  This node does not represent a CoreSight graph device. It is a platform
+  driver that establishes the QMI connections used by consumer drivers such
+  as the Qualcomm QDCP STM source and QDCP-backed TMC/ETR sink.
+
+  QECP exposes more than one independent QMI service (for example, a
+  separate service used by remote ETM/diag sources). Each QMI connection is
+  described as a child node of the "qcom,qdcp" node rather than as a
+  property of the node itself, so a single provider device can establish
+  more than one connection. A node without any "connection-N" child is valid
+  but provides nothing for consumers to reference.
+
+properties:
+  compatible:
+    const: qcom,qdcp
+
+patternProperties:
+  "^connection-[0-9]+$":
+    type: object
+    description:
+      A single QMI connection established by the QDCP provider. Consumers
+      reference this child node directly via their "qcom,qdcp" phandle, not
+      the top-level provider node.
+
+    properties:
+      qcom,service-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          QMI service identifier for this connection.
+
+      qcom,version:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        default: 1
+        description:
+          QMI service version for this connection.
+
+      qcom,instance-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          QMI instance identifier for this connection.
+
+    required:
+      - qcom,service-id
+      - qcom,instance-id
+
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    qdcp: qdcp {
+        compatible = "qcom,qdcp";
+
+        qdcp_coresight: connection-0 {
+            qcom,service-id = <0x453>;
+            qcom,instance-id = <32>;
+        };
+    };
+...

-- 
2.34.1


