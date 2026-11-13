Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A74606A8A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oHD49xuY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLmi81HJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HS8PPeqYM/99TwtIsC0HfLuufEZcQH3nS14cV+C4Nnw=; b=oHD49xuY9x/t5K
	nCcjjPRgp5zIzlNNTzX0eJi0A1rVPdjZuQxJxrlqoHiwsJuXXHGxx1vHOUZhKBA67yCICZnjELngR
	JlDevVF+0l6Yi+awHTnG0YMSPTNUHBfVLsvUz6pxKkAEn8uUbbHw+qZgvodM3JBaWmYr1fUbGvB5/
	Aw2ShGcAJ/Z7Zx/+Lmm0DZHY5UC8rzm8WsoCE1uiKEqQ/NHsii2Njd/lHNKiEcyBmYAy++hVEe1S7
	6uAUEI8/tlXqtTmAXgqtT0cniKULICY4ZEjA63wXVBWXwMqZNbozttKlxrOZZcvqrvMlckSl0EV/Z
	zxrQgk1AYTNEcdHUEgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtZv-0000000DSpO-0DsT;
	Fri, 13 Nov 2026 15:52:39 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtZo-0000000DSm7-1clV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:52:33 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so306231241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585151; x=1795189951; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HS8PPeqYM/99TwtIsC0HfLuufEZcQH3nS14cV+C4Nnw=;
        b=BLmi81HJO/cg6PC0Io8EgsbtNQKhmPfacua6bE5tX6fv1p6NNN5Ua8gw3eeXm5CwRM
         XHGD/kWaBxR7HvsaQrbb5kH3QCEGSpR5kVWHriNDFekqlI/eSwZyhZZtUqtyHZ+VHYzr
         p7i9JQNdfSUzfCQMRlF7hrgvJtqnVMgw2+zmzrw4rzjzVzlWGAsIMuhvOltgLytC16eO
         pFcbtPPvpz9g6votlcrUq+/oFrKT2y3KjszFNColyTqcodxvluG+j+db/QOwfFZHrrCe
         ZR1JU2DKiUdYWGLX1bu/a8huAgaC1STfVubYq48E9whozYnYMLytN14h7OK+YchBDKR/
         r5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585151; x=1795189951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HS8PPeqYM/99TwtIsC0HfLuufEZcQH3nS14cV+C4Nnw=;
        b=GQJ2zCsVNSt1WQYgorPDaIgVgcMr+GjUIiqzbGIqgWVcS1v5Gd0YxGLNXTCsQkfcrs
         JVnGukrvBwAuCRKuCoydlUkuHbqkKIjppLzJxVL5xWhm/Br0D/eocm5zUGQLSg/yexNP
         65UIJvTmvsQUoUcrQT53RuTJUD0Bb5lwjE1U6m9T3xzzN5qBKRu7URPehhtxPj6MgyPi
         8qRTqPDdQhbm70bv321OL5gQtVaDEdq6YK6eZV+z31hlmP91vVVxDtXx1yV14zYlyf+p
         9vpQ6+Xi2/soxW2NozQc988AJ+JGVdd5Bqx2pc8+3fsgtSRyd69OoBqztDToR6OwlIbe
         gMaw==
X-Forwarded-Encrypted: i=1; AL+hErG3GWXmfjk/MoL4RJT++aepbayJPGCEB2VEQPm613bmSyxJgBUIPZMd9X5nCjLuRj1sJKPtOjvDbCMPhBVxQw54@lists.infradead.org
X-Gm-Message-State: APuU4Z/oM92YuMqn/Y5IBnhMB3eyrYPYcgqF1vMOzExJxzuQQEQfuV8p
	R6uY0D/yAKQZYupGu9OBrPbnMoShp2PHBTDSVuxSwdrn27y5llgp0eOP
X-Gm-Gg: AYBFou1qaEiPUyjWw0FCDFB1HNV4OneNf0b5V7xeiqWEmOxi67kVn0dx2di+P271MZ2
	WWY0ZjGpLIOtE6BXRrGNUUJn5udOwb4yvN5wWrKj0aUdIfwKq6Sho6DXV5QlxXnRRLdWHuGdt3Y
	HqZiWGpsP3MXhgl16vgaAyn4EMssBJeo8J+UPdGJYxxdPtyek3voJwRuNtmH0+Xd1EG3DO9sER4
	Q8xicTa74+rvhdgsb5RnwoXQK23aHFXi3jVFNV3lWMhm6g++Q8DbWoiYBAjfx9cLn4rW2MGwr0x
	wiKzQhrs+q2Efzhousw6oybVPaAHmYak5Vd0wgCRBCAhQ/an2KF1tsHvMiBb5HBm+BxxnfIRjut
	VRjt+e/fSOn8cszBJKHXci+Q7hH2GBIrY+lcHp4HLWYv48UEZhIC20VHkdIvV4YUq0DG6VGwxu6
	gIJaqqFPECJFO6sgITsILxz/9uu2QMXpenxcnK4CdtUi+HHeEoXNLfxlfEW9Dj/4ZvtfKwfKKC1
	qyiS59QCrQcj1H5gexIqqlZB0IV17Qk7/i+MyA83/WLN3BMwhE90OzLEIUwkv4xCX9udHQTu71D
	wwd4zmvuZrq6eVIcs/Au+fneygULZDq+M9RfpN46/1UTR2M1vOK6jA==
X-Received: by 2002:a05:6102:2c85:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d64d80d3b9mr811140137.24.1794585150917;
        Fri, 13 Nov 2026 07:52:30 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:30 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:16 -0300
Subject: [PATCH v2 5/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 10.1" LVDS V2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-5-327f5d37a9c5@toradex.com>
References: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
In-Reply-To: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=5590;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=OZsqf/Mxkw+YXhvycv2OCRQ35UFpHe7rjP/Hh/ssQlk=;
 b=uF1NmeAHqkz7VMUSPPnJDBCC2AGpB/Cuqety/UIZlEyshp4f8Y6cdLZA/+OfFpPLwTSiwWptq
 z1EuJaxRsYKBS2WIYr9/7fjK+EIU41XZgjD201AKOx0GGjyaHCAn6mE
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_075232_486095_7F251F20 
X-CRM114-Status: GOOD (  14.04  )
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
V2 on the Toradex SMARC Development Board LVDS0 interface. The panel is
an Opto Logic SCX1001511GGC49 10.1" WXGA TFT LCD and the touch input is
provided by an ILITEK ILI251x capacitive touch controller.

The overlay is also combined with the Toradex SMARC Development Board
device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 +
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 98 ++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 604bb35675930..f7f09d3cde5b9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -714,9 +714,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inc
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
@@ -726,6 +728,8 @@ imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mp-t
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v2-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 0000000000000..0235aa1acbacb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Toradex SMARC
+ * Development Board LVDS0. Connect the panel to J48 and the touch controller
+ * to J49.
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
+&{/} {
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD0_BKLT_EN (SMARC S127) */
+		enable-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
+		/* SMARC LCD0_BKLT_PWM (SMARC S141) */
+		pwms = <&pwm2 0 6666667 0>;
+	};
+
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_lcd0>;
+		power-supply = <&reg_carrier_3p3v>;
+		data-mapping = "vesa-24";
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
+/* SMARC I2C_LCD */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		/* SMARC GPIO6 (SMARC P114) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_RISING>;
+		/* SMARC GPIO4 (SMARC P112) - LVDS_RST# */
+		reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_lvds_native_in>;
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
+};

-- 
2.43.0


