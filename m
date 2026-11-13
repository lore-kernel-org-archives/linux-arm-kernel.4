Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B97C606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aZJX4dlb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P9nK3nyN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sYL1lnLCSB3BSmi1xUja9Uhmfb4VLs1HDBquQMuilrw=; b=aZJX4dlbWUhjDq
	R7uKZU5GHP56qdDj1lCPttiC11l2gRzHeNsfk2tlcDQRKSbt0JpX/O+4stQU/YY/2JPSwXIMiMHWe
	4A2rJR+pV+jOruSJXuRamp9RY1lbuPfncUKBDg3p+sYwD9AScgzJkp9/Xow9alprEEW/N1mvoCb2p
	XOpSNzfZKUh8pcsZMsxLHaXByT63l/BBkM95MHolepKwaj4kmPMxbTqYdE0ZuE5tqLeK5GZqbsrb7
	YzqVB0cGFXwTV10iPwEPjS/9ERv8wlEe3zpPdKpw6wPIMVzhw1AuVbN+EDwk61Fkxsy7BstWbdMd2
	J2f7eQSZrneADsgtdWOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpBq-0000000CURv-3ECD;
	Fri, 13 Nov 2026 11:11:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpBl-0000000CURC-3D4f;
	Fri, 13 Nov 2026 11:11:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VMSS2515758;
	Fri, 13 Nov 2026 11:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sYL1lnLCSB3BSmi1xUja9Uhmfb4VLs1HDBquQMuilrw=; b=P9nK3nyNQzjhe+z6
	pwbDy3KsSxSTfjDK698E3sAOVc2PFcphdFVeXIv75wjFNAr5HqPWEFseYTjbl+aH
	Su64XoSTG1TmeFf1XLN1liIlidSGHq7xo9+Iy0/8L3RwqEznQjdOJXbJi0+DCrCL
	lWHCMwVpkKr9VyxIaM6cXc/icdcs8HOkDq+h82usslwg58EC5bjP6gMBxHD1tjvO
	aTbR76uqPUJMNpNMZQs8Y+Jq7+JTk9PvhGG70ppnCOhhs2gVEr4MYJs3LZUODsKV
	FY9KJNCJueNGf7nEPyTV+bPB04aFgT07rljsXt20kTI7rZNvsbP4bqfyedFggPyf
	aenYhQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bbr1e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 11:11:18 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADAtNaX2811647;
	Fri, 13 Nov 2026 10:55:23 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6ADAtM0J2811619
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:55:22 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id CB0A1A71; Fri, 13 Nov 2026 16:25:21 +0530 (+0530)
From: mohit.dsor@oss.qualcomm.com
Date: Fri, 13 Nov 2026 16:25:15 +0530
Subject: [PATCH 3/7] arm64: dts: qcom: lemans-draco-evk: Add DLC DLC0697
 DSI panel overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-draco-evk-display-v1-3-28a19c6aea87@oss.qualcomm.com>
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
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567321; l=3552;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=Idrpv+CS0Y9alTM1xz9+pdNPaG06gqN78iFhxbFMgO0=;
 b=GYSv5Wm0wVpG4WUe3bF70Q3mIZRH5YcrIAllk4LRGK64kwwOcFlRBeW2bDTeNCDAMFOKZbWeB
 ROZ2aZ8KD8RC0X8hxZzwNLqORRqpJ0+y67sujUc3loUctZSK9+AK492
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6f056 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=AN9TkSaO0KQ9k8_Tl9IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 7OekIVXjTrSY7j-4dN9NIulUMeUKdeba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NCBTYWx0ZWRfX+Nv/uZJNPWUX
 vKn4ysIeW6w83KacEYGNpnioGMra4I+QVaNyhbQMORricoWTOW1atK9cnfkozUIwHRwKLNoAM8m
 wxEs7Iam/ZgZ69olmOIWVOeV1bwrzsehQeS2nkULCozOBIsbLhDaOX/CoEuJO4m/qA/ffHY7rDQ
 xlWPRgwLi/vlEGwlsGhrEnNpftBG8TwGoyJWV71DbZyHZR0N45NnqVk3iu0X8flTQTUBNSIzQxQ
 owDfC8FtZRVarhfB7woHpNr4Yk4e4odOPjtU04/G0vgLkFRb+BxQfLYVSc1vWVDgBuuUXL2XIYK
 ccMMTFHyyZ7yMMKw2GTsHIXCnXYEUwlAfw9KD2JbNhXNr+Y+mY6o5y7E1yrS/h/KQcD1Fcwaz0t
 ZzF8soElZxWqTYHstFFXFJPmZ6IeaY13B6LUR6bDr6TOJ8yXatsodb6NN82r3/Nov5RP1dVp2ZA
 3j3dw8LFl5bFgKw8N/g==
X-Proofpoint-ORIG-GUID: 7OekIVXjTrSY7j-4dN9NIulUMeUKdeba
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NCBTYWx0ZWRfXzR2GUGN732Qv
 PvXQCMqWVyAjgwDxlaZuSUBFCC4F7kUPIPlNFHa7paOfaNCFro/4uKr9EBYJjWmqV2UeQIWqJMr
 vAyOsMLrYwhTuFYcfe0uSRfAILKlrZA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_031125_820537_B4B97A32 
X-CRM114-Status: GOOD (  15.16  )
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

From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

Add a DT overlay to enable DLC0697 panel when DLC daughter card is
connected to DSI0_B2B on carrier card.

The card plugs into the display B2B connector shared with the LT9611UXD
HDMI bridge, so the bridge and HDMI connector are disabled when this
overlay is applied. DSI0 must be routed to the B2B connector with
DIPSW2.4 set to ON.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../dts/qcom/lemans-draco-evk-dlc0697-dsi.dtso     | 81 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 3262604ffb05..90a00ab40c1a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -61,6 +61,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk.dtb
 lemans-draco-evk-hdmi-dual-dsi-dtbs := lemans-draco-evk.dtb lemans-draco-evk-hdmi-dual-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-hdmi-dual-dsi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-hdmi-dual-dsi.dtbo
+
+lemans-draco-evk-dlc0697-dsi-dtbs := lemans-draco-evk.dtb lemans-draco-evk-dlc0697-dsi.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-dlc0697-dsi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-dlc0697-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-nothing-asteroids.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk-dlc0697-dsi.dtso b/arch/arm64/boot/dts/qcom/lemans-draco-evk-dlc0697-dsi.dtso
new file mode 100644
index 000000000000..00845b6207a4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk-dlc0697-dsi.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+&{/} {
+	dlc_backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&expander2 2 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&mdss0_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		avdd-supply = <&vreg_bridge_3p3>;
+		avee-supply = <&vreg_bridge_3p3>;
+		backlight = <&dlc_backlight>;
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
+		reset-gpios = <&pmm8654au_1_gpios 4 GPIO_ACTIVE_LOW>;
+		vddi-supply = <&vreg_s4a>;
+
+		port {
+			dlc_panel_in: endpoint {
+				remote-endpoint = <&mdss0_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss0_dsi0_out {
+	remote-endpoint = <&dlc_panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&pmm8654au_1_gpios {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		bias-pull-down;
+	};
+};
+
+&tlmm {
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio84";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.34.1


