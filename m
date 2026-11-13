Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B1B606A88F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mV7lg4JC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gME5EJ+n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+Ik0gHsfdd16nhHnjQyqDcxvqmph40nuj+OLJYJgm3k=; b=mV7lg4JCTvpe30
	iuAxfrQMWL68ZX2OYoom2CsdLOyZ81c8ULVu6LqjwsdoNiAoNXcCALaIeMQ1bNTKeX01MIhiorCsZ
	Qh19kfLOGyqcpTzNiRjdXnppFpbWaO1Tc7s4I34C5lMl3T6Ao30GN4XyMp+L95jm5nA5FG3URv0iO
	JZXaoZCOkE+csd2sO/IaJ6J8ewclg1qnjbpVIefNhrlVEmbo6bQrg/261s/jUjbKaHFzk36yu2SOX
	TONEtnL8WqlMqasX33Ub3gMmwzyCB73lM306/8UhQ2M0m+O+/1bHkHoPOJHTmWielHkPsDf7MQu8N
	mRu61E/VJQdVEbaGMMqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtZZ-0000000DSeL-0yO4;
	Fri, 13 Nov 2026 15:52:17 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtZV-0000000DSd8-2Luf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:52:14 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-7a6e560f580so1951597137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585132; x=1795189932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Ik0gHsfdd16nhHnjQyqDcxvqmph40nuj+OLJYJgm3k=;
        b=gME5EJ+nvOIUJqD/a31T3vYxwa6l5p2YZ9VLgaSs55sOGNiTY6af15GCEEnP+ITWy/
         O7OHn7rv0ONZraIYwyN+4Jc46fFWu43wSy2jC5THUjPGGc6ZLSkQ6MhSU9xaozoXxdwp
         QXY1tTTF9wozQObUQ1RimjdQJZa6QG0YMQMT+/gQizowNde/TJa9kKLjuAXPMs31GNSp
         LJnoTvRurLRQ/c2bZfDZwJBD0L4tj+C5ucW7vHdyvFtBTrtQH4bRJuf3XpmFa0EzEb4f
         8ti0agY7ed3SC9wiqG8MXpZnxN73WCCz4iilmScR2so3YKLh79sLA9MEg5vxSKEUxpuy
         KsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585132; x=1795189932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Ik0gHsfdd16nhHnjQyqDcxvqmph40nuj+OLJYJgm3k=;
        b=t6sJyKzsQd7i1DZxtB5b4t7rzPt29Ca1VcMFns696zZyCRdABFjDSNYThYm2wPbmBo
         hmygq+s8wW2Md9tBgiigPMEaMrAvz1sQpGCM9zNesTgUOwrbFrUVglf4wghP7053Qt8U
         ZkUBtqX9ifdH7qzj8iSDLXJcK/x3pEL6IeaUhpcM6h3tPcaB/7tni2XFAklBmmPV/Gx1
         a5y3IbnMecyeBdrwXOTFDvjgcOttOXQJFpal+iRlNE3CK4Rn7siHIzh9RyGUUfxigdQ/
         1unh8JJPXWJwN6xJtO/T1ThTTG6jOuZqpwUQ8xH2YMBo3XPlif3qnWCouC81YTbIvsQy
         b5Vg==
X-Forwarded-Encrypted: i=1; AL+hErFEbABOyDt+dKPbNDjMCpH0r1c33YavKcY7KSEcGNeTOz7roMnd+KTfzlU09oBfQDWoakdQlXl0R0eVtOeBW/Y4@lists.infradead.org
X-Gm-Message-State: APuU4Z8ipPPV44WAoJ/417/KG5U2D39FG6di2+O0Hxo4g2HSpH88dXVx
	eHmn6XgxKdWGOqRyctByoZbWFKcPSjEVRHkfu8xtH35gz1ZT3NSjSe69
X-Gm-Gg: AYBFou1TS+vXOzgKSSEhLGizdT6oM8DrUVfISuNv7eAsEt8YK2o7/Q2G3PJIJl3F5l6
	q4RJ205rgCLAOZDb+aNpCF+t9/VOlXLPpyXLD2q3OR+uBMzyOUBIdfzwVWa4Iljph0T1TUYs8wB
	7YbhrSqFCpEiqoWUq3KpHX5lXuPvAWMvYc3oN8mq2KqONhFISRMep2Rw148iPDI9y4yfwr8w1Kb
	FYUeUUNLrkbktps6WpXzE80weDRacH7/EC6MGJSMCupoFfLrm+EO78R/0WRYa1E7EtiuCV9dJI5
	HSWc5xfjff18ykbSC1d4iQajvyUoa/63jfIjkQf2MGf1o5s03d6Wae6ZLt5jXVpc5REqo4FRRJ9
	wNPsePAwpUmAON2EA8g6IeJbgNI6ADOBijR6KmiWMFXxsnEG9L/MNFSXrsHcBM7w75gDMSztsD9
	QX8xO6RJo3Y6BAXdUdFYfdM1qzN6Msdxz0j05nax/OOzA0/cR19J1Or3VHmtdVyIWIifleTONWP
	E9Uqr6/3T1wJthYGpbNGkK98t5V+qaSosg++lI7LOO8OQkWwy/+SP3elHfH6OoprsynG06XqX/o
	J+/brbrMbaWrYdDn/7Jm6LLemma9DPNF
X-Received: by 2002:a05:6102:6c4:b0:7d0:6cf3:d8f0 with SMTP id ada2fe7eead31-7d64d6f8a81mr959235137.18.1794585132255;
        Fri, 13 Nov 2026 07:52:12 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:11 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:12 -0300
Subject: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 DSI to HDMI adapter overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-1-327f5d37a9c5@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=4733;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=6gWisAoRL3n8veatx12VoVaqY4HAjgDwneKFrMNA53o=;
 b=YbAc7Dfi9KrryWwhYmgXbDasotxsHNMYCe2MqmRznTR9jWWd4uQiWoDUXcz/S9ifj05cVTsJk
 JBmp86tv4QrD8nPztn7gFCNOjifwXoLzo/61UqDUJ4/POQT8g+Tz7xD
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_075213_623812_A78D9D3D 
X-CRM114-Status: GOOD (  13.81  )
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

Add a device tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Toradex SMARC Development Board DSI
connector and provides a full-size HDMI Type-A output. The adapter is
based on the Lontium LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd5482843586..3c424071f8fc0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -710,11 +710,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
+imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
 imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso
new file mode 100644
index 0000000000000..270cf567ace1c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter connected via Toradex SMARC Development
+ * Board DSI connector J44. Open J95 to select the carrier DSI route.
+ *
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-hdmi-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	dsi-hdmi-connector {
+		compatible = "hdmi-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hdmi_hpd>;
+		/* I2C on DSI Connector Pins 52/54 */
+		ddc-i2c-bus = <&i2c_dsi_1>;
+		/* SMARC LCD1_BKLT_PWM (SMARC S122) - HPD */
+		hpd-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		type = "a";
+
+		port {
+			dsi_hdmi_connector_in: endpoint {
+				remote-endpoint = <&dsi_hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+/* I2C on DSI Connector Pins 4/6 */
+&i2c_dsi_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hdmi-bridge@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+		/* SMARC LCD1_BKLT_EN (SMARC S107) */
+		reset-gpios = <&som_gpio_expander 7 GPIO_ACTIVE_LOW>;
+		vcchdmipll-supply = <&reg_carrier_1p8v>;
+		vcchdmitx-supply = <&reg_carrier_1p8v>;
+		vcclvdspll-supply = <&reg_carrier_1p8v>;
+		vcclvdstx-supply = <&reg_carrier_1p8v>;
+		vccmipirx-supply = <&reg_carrier_1p8v>;
+		vccsysclk-supply = <&reg_carrier_1p8v>;
+		vdd-supply = <&reg_carrier_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_hdmi_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dsi_hdmi_bridge_out: endpoint {
+					remote-endpoint = <&dsi_hdmi_connector_in>;
+				};
+			};
+		};
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
+	remote-endpoint = <&dsi_hdmi_bridge_in>;
+};
+
+/* SMARC LCD1_BKLT_PWM (SMARC S122) repurposed as HDMI HPD GPIO */
+&pwm1 {
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl_hdmi_hpd: hdmihpdgpiogrp {
+		fsl,pins = <MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x104>; /* SMARC S122 - LCD1_BKLT_PWM */
+	};
+};

-- 
2.43.0


