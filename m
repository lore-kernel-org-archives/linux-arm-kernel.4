Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35123606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kuQXw91u;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=McAmwcbq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DWMbNnBwrSvxR91OdU/d68rdNUGtXeSdpUo+91mTRCQ=; b=kuQXw91ujNFS01
	3Da71UZcuSoQBVsZAw+YRrevp7otLNQ1VKo3dmMbg4aKnFast/hkKz6v3zgFzBcp8QhURqxAHrMgn
	Qph7RLaODSn+N61sbshzM3kl37SyzFEGCQu24hrZtt2sQ7TxONNoUT5IpEcJ21Z7AQGJGv8nxz/Br
	BUSrFGEcVTS1YQpXzqHX/MwhmPVlEmmwVWRbM4th/E9fFjg1vJoAOW4K7pchsmBBpNUneqpTKaQl7
	gY7nxBmtWZDz/18//Aa/Yp3VSYzYzgSi5XDjYnLhXVN8d5ExFr84BjS4ZlrZ1OXHfasZjQUaCbSCJ
	1mUkO4eQaENx8tEJzNgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtZg-0000000DShF-1Xcy;
	Fri, 13 Nov 2026 15:52:24 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtZa-0000000DSes-2Oir
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:52:20 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-99bf7b97f12so1602415241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585137; x=1795189937; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWMbNnBwrSvxR91OdU/d68rdNUGtXeSdpUo+91mTRCQ=;
        b=McAmwcbqhkIsOhq1OvX1wZYf7p4Uq9spZI1OAj6757IZiQbuvMTIbRwd+VOfr3EE/3
         q8IlXoD/p9gzshmK6WA1RDah+kBGg4cfKDOIcHcRSMho0WkfYQbq5mlKY9fbPo77oGw0
         ATFDrEYOhWZquo8E4h6+0AA6BFLqXgsN3TW9OX6/mgl/MMpNa8wPXR/NCrJPmQXf/PDP
         aIR15OMehp3RrmkTixK/c2dTayg+OsBBEJBh7gyDva9y/ZnRQfoQK4TyZq4NlQpkEGep
         N0Uugo0LSFGCFzZ2ZHwjt7fwpR08su4MBoKzLSlWDVKFKqaL06ny3yzLW7KJtiXBPmx1
         7cJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585137; x=1795189937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWMbNnBwrSvxR91OdU/d68rdNUGtXeSdpUo+91mTRCQ=;
        b=ezvOZIzGeRhGUogC4FQ+srzyQvuzmRpceafDNS0LcMoe1rzmmJFFa6odcnTyZBQ9E0
         16/eMu+jQJGkPUZq1qwQFw5uFpeVrAb7zwaW+OTablcndiFjp+Sinm9roDWNH9QalM1t
         GRQ2N0RHQ8tHqdelGvs7RqPN5eIS+HEt6mdf35BrpoSo1eujmqiVpO7ruKYaZzFeeWnV
         nmsyR+IUbYUrIBhppyZednr4fLgLwkwPdl7Ynf9MagYsvTCVpmtiRrRuMWVSdrQa7fC1
         yzzkf1t1H6K7oQnzRCsYwrLJKtkL5b/y0Vl6gGwZ/4/dbQE6ms7f/WTmM6GvPWDg9CDa
         BJ3g==
X-Forwarded-Encrypted: i=1; AL+hErGdL9lnojTUjdIn5NYpLbEu/lof2aCg0VY/jhmuOXYQQmgr02rSCA0LpNZ0XwHvHtQ4T9b6zF1RU1skZD+GehWK@lists.infradead.org
X-Gm-Message-State: APuU4Z+kqz8FzZZacxeX14llNJKN4Zig7XwW1igIiJPus/oJUJsWcYBe
	oYBjkFwyfeGPSGTdtbdhRZlcidr5Yb2FbmgizDzrg0wLf1sTNA1UE8ry
X-Gm-Gg: AYBFou1rCN9sEjtVL2ZEjP4dTALXRuqdmZjsKGxexaH8mQjTcVPTMQ63nn/ZqwMslrQ
	AwpqpyQF5I3HfZVq2C+7USAlA2ROoX+6QfXBQqgOnCrwSRQxSeY34imDaa2aY4/wLtMcfOx3OZy
	73mTjHHRPEz1+mARvNFei2kw1ch44iWQoILNGtlC5CvkAXjg6hRMvF+cil20Zg4dpMd6WVOzBQo
	hueWn96uZrSsThYEBpwTahbyQdKm0P0IRtelKhcC5c3xLwjW9Ggs32MjBpOQZ+PK28eg7I4Xfx5
	+yUQ5reBkn6hn7SME8At2eshwlYcjBY2XLEJROc4P59FMHb0iyIpKewSnJQ/soKcdWNW2sV0XhZ
	bKmtBUA/dGhJ4bdEYqSWiB2wP/lOJsc8qSFumn4Uqh5KwAf8thnFhAUAEXyzeNC1QdgKXXG9R5Z
	2ORaNtqojym1jgnfFrNvW1toYeIWMQOIiCU4zIhdNtqNTc90WoLkcuobvx8hLYsWpZzei/Rbimo
	/PsEJfM7Fv5jgSsCfYLi8BelXyvM7WCzeRWIdUndv5P8GnG7gOiy4SiOjCD0kQuwbuO7wOCc4Ad
	7S7KruU5Mjaq5tLmqF09wtzI2KybhEzq
X-Received: by 2002:a05:6102:5cc2:b0:7d3:133e:a37 with SMTP id ada2fe7eead31-7d6317565eamr1801920137.11.1794585137127;
        Fri, 13 Nov 2026 07:52:17 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:16 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:13 -0300
Subject: [PATCH v2 2/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 10.1" DSI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-2-327f5d37a9c5@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=5963;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=8tSv2NTD2MUtmsbvIWyNFuTbONv2OsskqyqrqbBXQSY=;
 b=k97Ha0Tg8b/3D2ikrlVa+2pF4Eg8qVw8z5phEKBeB7NU9nPtGSNUsGI6qPB83Wyvg/v2RS8J9
 47IVK5ghI1tB1wTWX0t/Pm4nENKKvZaK4CNT2JYUD+kZCh1q9YxJZzV
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_075218_646575_375B51C7 
X-CRM114-Status: GOOD (  13.62  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display
10.1" on the Toradex SMARC Development Board DSI connector. The display
features an internal Texas Instruments SN65DSI83 DSI-to-LVDS bridge
driving a Riverdi RVT101HVLNWC00 10.1" WXGA IPS TFT LCD panel. The touch
input is provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...arc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso | 123 +++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 3c424071f8fc0..b147b93b2a067 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -710,6 +710,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
@@ -717,6 +719,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
+imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 0000000000000..170411a705233
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" DSI connected via Toradex SMARC
+ * Development Board DSI connector J44 through the Toradex DSI Display
+ * Adapter. Open J95 to select the carrier DSI route.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-dsi
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-display-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lcd1: backlight-lcd1 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD1_BKLT_PWM (SMARC S122) */
+		pwms = <&pwm1 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt101hvlnwc00", "panel-lvds";
+		backlight = <&backlight_lcd1>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		/*
+		 * Use a combined horizontal sync and back porch of 96 pixels. The
+		 * panel data sheet value of 88 pixels results in unstable display
+		 * output with the i.MX8M Plus DSI display pipeline.
+		 */
+		panel-timing {
+			clock-frequency = <69300000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <64 64 64>;
+			hfront-porch = <72 72 72>;
+			hsync-active = <0>;
+			hsync-len = <32 32 32>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <15 15 15>;
+			vfront-porch = <15 15 15>;
+			vsync-active = <0>;
+			vsync-len = <8 8 8>;
+		};
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+};
+
+/* I2C on DSI Connector Pins 52/54 */
+&i2c_dsi_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		/* SMARC LCD1_BKLT_EN (SMARC S107) */
+		enable-gpios = <&som_gpio_expander 7 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_carrier_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				dsi_lvds_bridge_out: endpoint {
+					remote-endpoint = <&panel_lvds_bridge_in>;
+				};
+			};
+		};
+	};
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2132";
+		reg = <0x41>;
+		/* SMARC GPIO8 (SMARC P116) - DSI_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};

-- 
2.43.0


