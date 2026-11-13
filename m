Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE7D60A2621
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lPzUhI1n;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pr/78kRP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SL7U9XOTOx+APgRR8YLQnTh8OeScFnHHAxVLwwDeNFU=; b=lPzUhI1nL2JTP4
	37Yg1AQeBQcoj3iHYsMwXzn6USMiUwc1cr4wdSLIElljYkL9imUNw0L444gZqDa0c1o2+g/osSn6k
	d/Kf9FwSUW2mMwcN6GWbNBlQ4VaTKCFUuWovaAOv86b6FxMrV+u0+Xw83YUR6RiiBaRj/q2NvnBsP
	vckFaLOL3WbNucOfbm+n0unxju5tqicZx9cSsH0teI7HG3Yl/W4j5DxmoB0AfjXeqaaRoEDUpPKvv
	YlcmVu0RZqTJB2ZBiKXwMIrJZsHVzR2OjBmZjc6Oy5uboBYWDStkM3W9t9ZWQhnOIvG5K4MupO2x7
	MwGxY8w3NjqPkgRTI0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSg-0000000DRBn-0JxY;
	Fri, 13 Nov 2026 15:45:10 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSb-0000000DR9b-3ZMD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:45:08 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8b2d14968c9so13665057b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584704; x=1795189504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SL7U9XOTOx+APgRR8YLQnTh8OeScFnHHAxVLwwDeNFU=;
        b=Pr/78kRPEE1LaOy1t1SsvMjo3GDNB2RNGCsJR0VnpC4UpVYxQ/AjkvOc5k7ZhSBGMH
         EtOz0EEVepxFcd3aM+hvgFDOXijJfRVJrIwnec69525WRs1lz8Kr/GmkGuYshF+9SWvg
         5W/2cqBs+JxUQd9LPQZFg+kr3yV0YkUO8mkKqf/UjId9BozeFQDCXKsWY8ThWSNigbD7
         o5yW0YNiU2cZ+ptLH3GccZ+Uu8jY8XnIQCuitTANkoRxF0dXO0uyvf8pU2svYvpgKNgb
         yMyTdylREMn26eRQ9+mkXCknkkjyLNSUAvruze2CP5BuR47cqTViM33lQ5tr/+0ni+JF
         wTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584704; x=1795189504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SL7U9XOTOx+APgRR8YLQnTh8OeScFnHHAxVLwwDeNFU=;
        b=mlOfJv7iypyw7Jp2+67tensDm/sr1eIE0Uvwa5Qow6cbJR/CUmobtwo3AQPqwGjXRY
         h26835GCWSn2VafoePWayL4NyV9aTeMTaZ1C+vXUzjOzhDuGAoxX8nLaBb3I7ow57Bo8
         PIuWjArsK6dV85FCv/YajtBodmVJeo6jlQDy0EPEbDVu7+T59Z8Vw2sKHO8gT+mL62cN
         0fhCldzfyVNNvuXhDLFX+iJLt+N1mw/v1bDoKSz+NF6lEPWec7EZAN00s7DgErdrzg/x
         11QUggqCGSgL205vgRty+DLDjVYY4S2Lnj5NXDCh9cVdBjye+awwbL/COTyafVoAaBZ/
         Fgbg==
X-Forwarded-Encrypted: i=1; AL+hErER4MHqyE2Kad2pCVHcaQUykfufvQWMGfHUrZ/YyroLbSj5d5KVO3fGIpHW76+e5yXitW7yDvtXJ/G/rk1vaVeU@lists.infradead.org
X-Gm-Message-State: APuU4Z+uO3bLEmYHj3KvyWnV1DTRoSkZSoXE5e9C9V4PTAGu2OWZh9MW
	n86pM5Lqsauy1QuTKT3SQeDUI/SbbyGcqCxgo6lgcOrf8udhrussfrS2
X-Gm-Gg: AYBFou3nDm7LOoOIYbTmzArBie2jcGEXsXQ+TOyw74BAgLeAHQM4zjHjWg4bJhsgcbi
	pwdJLSQb5fsC8BbfHXy6i6zcKtfnpHM7FXsXMK2H9xXXBhSydowQIR+5r2tdH8axOtA07FM3no9
	wT6J8Xv10JnnKbD1owQq37BfhGSqeZ9ze+Os/SoHCAAr798wtzbBtK7YSxipAN/v2Q9LYI2ra2S
	7niTnbT/V4wKDylPTj5hEFhadnRceU8fbItW4zdVsfPnpJFDm9q38j32zNStdBxQ7t/szQ2Yr6s
	fl/jkdQr0vmZsc5qrZsBLXrEZIJKBKN3L4gwknTu0yjvTpALn+MvEKAF99ooFZ5kNMHsbqS2+2+
	QiEPr5a7IkG8lNvs9aOoMKNmcOxFTwQ0opV2s5ja6uRVrP7R2/XdF0eNOJTlRiBfHrgf+02sikx
	aPb6VKMRJJHfYpejwmRr9eJuK1mZw5kddlL5L9IWgCyA4ijh/53zQCmQGB1nARS2oHJJnt66Ln6
	aW4lF5/P3bn76XTdzEXjbxpBoroci3TOWXiauIG4It/hNdpFBs4D06IBaCkGOj3EAD3PQ5oZgx6
	o/Ro0pfNHlVO/vQwLfgcXs6JqBrh06MZ
X-Received: by 2002:a05:690c:19:b0:8b2:9c73:95aa with SMTP id 00721157ae682-8b4aa3c17dfmr16559497b3.68.1794584704381;
        Fri, 13 Nov 2026 07:45:04 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:45:04 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:10 -0300
Subject: [PATCH v2 4/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS V2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-4-59c45f0a0d8e@toradex.com>
References: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
In-Reply-To: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5946;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=aCRXq5ggGAK0uezl8OeiOliynvx2lSh59aVdl5UwyoE=;
 b=ZLl09oRDrgj0qFrvx1+g1k3SBVWb33UfmuULHRjl3TW6/lpRWdHewv41x4OqGTbG3O+o+jb/v
 B3QeEJxo6qLAi6Nk/emeF3zSufNsZ6v+lqy4RQdF9LF9FCOePBlrI0x
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_074506_018966_5586D4C1 
X-CRM114-Status: GOOD (  13.85  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS V2 connected via Verdin iMX8M Plus LCDIF on carrier boards exposing
LVDS interface (e.g., Mallow). The panel is an Opto Logic
SCX1001511GGC49 10.1" WXGA TFT LCD and the touch input is provided by an
ILITEK ILI251x capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   5 +
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 118 +++++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 915507fe936de..51c74fbb8e0ce 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -741,6 +741,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtb
@@ -748,6 +749,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
@@ -763,6 +765,9 @@ imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-na
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	imx8mp-verdin-wifi-mallow.dtb \
+	imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 0000000000000..6b0c1a10ae2a9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Verdin iMX8M Plus
+ * LCDIF on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		power-supply = <&reg_3p3v>;
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <64500000>;
+			hactive = <1280>;
+			hback-porch = <20>;
+			hfront-porch = <20>;
+			hsync-len = <2>;
+			vactive = <800>;
+			vback-porch = <5>;
+			vfront-porch = <5>;
+			vsync-len = <3>;
+			de-active = <1>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pixelclk-active = <0>;
+		};
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 0>;
+
+	status = "okay";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
+			    <&pinctrl_i2s_2_sync_gpio>;
+		/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-parent = <&gpio4>;
+		interrupts = <31 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&iomuxc {
+	pinctrl_i2s_2_d_in_gpio: gpio4io30grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;	/* SODIMM 48 */
+	};
+
+	pinctrl_i2s_2_sync_gpio: gpio4io31grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31 0x184>;	/* SODIMM 44 */
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 64.5 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 64.5MHz, or 451.5 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <451500000>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_native_in>;
+			};
+		};
+	};
+};

-- 
2.43.0


