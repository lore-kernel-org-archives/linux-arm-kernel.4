Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD6060A2619
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kUzHo0ZI;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kmF6h3GA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=34G5UBXP1XXOFPIZxoSLVtS+iaBw1vGUFR7P08Y5xuQ=; b=kUzHo0ZIwoHcYN
	yNWmqY3cBCkhJCxoFZWc1FH/F7DxorG9XyDT18y5obWfZQnkn/aeQ0DOL8eRwoUa9h/O/K0uRQ8eG
	uJjdlQqb6nV3vfzpB+4hbYayxsevVTF7W3qeW+pEAoNTAlakAKN2ZWtk70LkC4RKGkVECz9KcNb53
	CXxjua+rIAwcetUq6zEDTE9+CFzrLbMP8ml6i+C88+/DfmaanO9dpgmzn8OqBSSozGYteWNIL+Mq/
	0BxXwGYCdgqLMbNu3wU4n4kAQ1fCyAGCQfeJIjzTNQ1b7t9AC8+QODoFVJTFma2gPCztl/4It3XzP
	3xGYb4PNnKMgEKv30JIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpXl-0000000CY2P-3LWP;
	Fri, 13 Nov 2026 11:34:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpXi-0000000CY1x-3WAO;
	Fri, 13 Nov 2026 11:34:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADA50XF1161799;
	Fri, 13 Nov 2026 11:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34G5UBXP1XXOFPIZxoSLVtS+iaBw1vGUFR7P08Y5xuQ=; b=kmF6h3GA3bkURXfJ
	x3aHiyStjdngnwBDBE/aHekpvn/RueFzQWrNqePi8/91ArMI7Nhyz2dqaBwDA8Ud
	iDFInjEMcKzz7rKvrapCuag5aY+Yfyov9ljAe/oifkejEhofy5Q7QuZD9cbwNZDq
	Cev+hui7YICbjVhrF8lvPhFwGZOFlX0LNg+WqZrBsD4JJ58wMqPyHPsvB5vDVOdV
	UjdJoONvGCZIG+EkRo2FdTo7fjOIXslB/LlELC5KQUFge3k0cQ1Et0k44R54/o1w
	l8edXIdXBOzjw+LLVi9NwVRVXWYm1u2fEmPOI+8/g0FuBwDnZt41BlRk1+uX4C8u
	aj0ZkA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g208au-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 11:34:02 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADAtOeK290287;
	Fri, 13 Nov 2026 10:55:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6ADAtNLm290280
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:55:24 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id CF55AA73; Fri, 13 Nov 2026 16:25:21 +0530 (+0530)
From: mohit.dsor@oss.qualcomm.com
Date: Fri, 13 Nov 2026 16:25:17 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: lemans-draco-evk: Add AUO G133HAN01
 LVDS panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-draco-evk-display-v1-5-28a19c6aea87@oss.qualcomm.com>
References: <20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com>
In-Reply-To: <20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567321; l=5538;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=lCaaFbQsNennmfYO3aRWgB7DYq7OAgNJ0tnLoaTBXH8=;
 b=QJbvLK1EKN2JOqp8L8PgCPmJSm1puBCvZAIAhKRJrR3sS0aYir6M5Hi+0BqSMDmq16Ijtt54d
 aaQLroGLeSZD8KT4xsTGs+rSnRoZGN+iSU5YDQWiVEp7MOMNrFT9zcQ
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfXzszPxM3Z/bij
 W33zgyrkS8EFGnhQZnfBrB6zZIpF1A0g1/tPAoD3IxeONHRFoOyv7/tIZQ9zEf/sbGKUu3PVzlL
 pHR7cYyrAj1k97TJX1Y7Oq+WepTqiMM7Xvf+IwlC/h3KrDF2XkQmFZpLmnpVS9VH0BwEiT0V5fM
 D8klVxGr4472bzCT5bmaFl5NTDnOvyCjNnpkf3nGgIgp9ErzZ1G+y+HRc4Ed7XBe2L6rxQcstr5
 p9G1/txdk9wa7RRRUHmEyJyF/zwcrvrmCI9YPdROqdOV2v8DHUAFKE5TY9WPtnllYD5dyZUspJc
 xA8n3nQuFMZ+VQZMxIMti+o0Mrh3RNjumz+b92ljIfMoxxJd0CIDn6yh/nTj68mS+G3Oh8oge9v
 BmXqhL9mpKCIoUjJRvMu8RkOMBLgivLpRVOmvOBMwhOcdWigjOnUpw4bZHYznJ8eUTKENRLvsJd
 UaggYaIVopG6p2R2zBQ==
X-Proofpoint-ORIG-GUID: 3UH6Yocr_Mbf9liVxm0OM0lOrnBlPWgk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfX6AnUuEuL+Jtl
 G4dcB2n5XbzYKRMEWdK/cdx1FOHu67JJrDHTfNhSfJficgzS2d8ef2ApRSosT7RqHBSAHcFwy8+
 QXclllLq34G8IakPCbpkjo19gC5EEyQ=
X-Proofpoint-GUID: 3UH6Yocr_Mbf9liVxm0OM0lOrnBlPWgk
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af6f5ab cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yFK77E__IYD6oYScarQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_033406_920060_C410C40B 
X-CRM114-Status: GOOD (  16.74  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>

Add a DT overlay for Lemans Draco EVK, to enable LVDS interface when
LVDS daughter card is connected to DSI0_B2B on carrier card.

There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C mux channel 1 on i2c1, with reset and interrupt
connected to GPIO39 and GPIO97. Backlight is driven by a PCA9685 PWM
controller on i2c4.

Disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../qcom/lemans-draco-evk-lvds-auo,g133han01.dtso  | 131 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts      |   1 +
 4 files changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 90a00ab40c1a..b50b38c15c6b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -65,6 +65,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-hdmi-dual-dsi.dtbo
 lemans-draco-evk-dlc0697-dsi-dtbs := lemans-draco-evk.dtb lemans-draco-evk-dlc0697-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-dlc0697-dsi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-dlc0697-dsi.dtbo
+
+lemans-draco-evk-lvds-auo,g133han01-dtbs := lemans-draco-evk.dtb lemans-draco-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/lemans-draco-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..a9d245ae86a1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lvds: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pca9685 2 1000000>;
+		power-supply = <&vreg_bridge_3p3>;
+		enable-gpios = <&expander2 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_bridge_3p3>;
+		backlight = <&backlight_lvds>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* LVDS Channel A - odd pixels */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS Channel B - even pixels */
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				lvds_panel_out_b: endpoint {
+					remote-endpoint = <&sn65dsi84_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&hdmi_bridge {
+        status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c1 {
+	i2c-mux@70 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			bridge@2c {
+				compatible = "ti,sn65dsi84";
+				reg = <0x2c>;
+
+				enable-gpios = <&tlmm 39 GPIO_ACTIVE_HIGH>;
+				interrupts-extended = <&tlmm 97 IRQ_TYPE_EDGE_FALLING>;
+
+				vcc-supply = <&vreg_bridge_3p3>;
+
+				pinctrl-0 = <&bridge_rst_pin &bridge_irq_pin>;
+				pinctrl-names = "default";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						sn65dsi84_in: endpoint {
+							data-lanes = <1 2 3 4>;
+							remote-endpoint = <&mdss0_dsi0_out>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						sn65dsi84_out_a: endpoint {
+							data-lanes = <1 2 3 4>;
+							remote-endpoint = <&lvds_panel_out_a>;
+						};
+					};
+
+					port@3 {
+						reg = <3>;
+
+						sn65dsi84_out_b: endpoint {
+							data-lanes = <1 2 3 4>;
+							remote-endpoint = <&lvds_panel_out_b>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	pca9685: pwm@42 {
+		compatible = "nxp,pca9685-pwm";
+		reg = <0x42>;
+		#pwm-cells = <2>;
+	};
+};
+
+&mdss0_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi b/arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi
index 6b7971bcdc93..dac4d4c7ab9c 100644
--- a/arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-som.dtsi
@@ -267,6 +267,11 @@ &pmm8654au_0_pon_resin {
 	status = "okay";
 };
 
+&qup_i2c4_default {
+	drive-strength = <6>;
+	bias-pull-up;
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/sa8775p/qupv3fw.elf";
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
index 89beed7de36b..49a8c568a2ae 100644
--- a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
@@ -17,6 +17,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		ethernet1 = &ethernet1;
 		i2c1 = &i2c1;
+		i2c4 = &i2c4;
 	};
 
 	dp0-connector {

-- 
2.34.1


