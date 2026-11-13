Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD463606A8B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HIxB9i7O;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FSwNqngd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CfsJcWiWo3pVKRPryoM7AoQydDYjteLi5x8NUPXncGU=; b=HIxB9i7OgrAOce
	Avm1/nyz7XqI7WzLNOGNfrboQDVcwzzNSo6TDQ+qGdCi0Ss7N3Ih5Kfta1xWEkoNDNMLDgYQhuda+
	jTbT27B0BBBGjiun3WUavZ4k/udpCXvudonpivKr2zOQq2pwkXocZKRGXwRp7mjPFhgBuOIjiu4HK
	UN914UDgTyKig8x0hxWzRfwbCRYN0fAouMb3hYMrmcizN6WkbBhFFv6rI30graR0EiiRB4tZeAfzq
	KtBskjKRb9Uz11yjJVIPNHriAXgXOPCdmm9eUXHyCwytfgpROlDSErcbyx9iPnUhgLVnh45E2AygO
	vBV3kr9YZixCvDjpZmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSq-0000000DRJ7-1Jvq;
	Fri, 13 Nov 2026 15:45:20 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSf-0000000DRAn-1iXN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:45:10 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b30cbfa628so11283697b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584708; x=1795189508; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CfsJcWiWo3pVKRPryoM7AoQydDYjteLi5x8NUPXncGU=;
        b=FSwNqngd6fDkPifWwQBDqKgWRYTPho0ByrhPSHjs1O5bPrh4HMJr8XL1nJh5tuJ4JR
         7TyY8PHi/KC0X834kFVtKfPqv4vqqHyjduVKnWDpBEuoU+tMScRphcJYmrKN9vrq4pHD
         PNhGf9+IVqWRnClFhMqlc/Man6SSRovupex3JJQhoTj0B/DTLcwUTBySio7u9fUkHqTu
         DOs5HmFS23u3pAL2zewKxfpAhiDozkT6pTo4dRykRkMqd1QRI6iI/xiuMtgNnpQhznqH
         rN1RijVcN1ZqOpsJKlhOTamkz4Y3VbvoNmypfFGiIXkKAgJoqVZngxGiOqLdj9sT+N+9
         xy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584708; x=1795189508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfsJcWiWo3pVKRPryoM7AoQydDYjteLi5x8NUPXncGU=;
        b=FWIewQQndI+8z3SNzUncs0DmNnA0O3Yl2QecCop/WfIei7RfWmAVvExAy4fzJrneJ8
         u+W9P0nkIree6SpGmvOJwDxEhg5XghuTzzN2FtrMtNtReOdKal383sWlsmtlBtoxhbRX
         H0KQH921KGFacSz0qK/xXOWzRF7sPeuGG0y/kqWIHfnI9MWkatbrqtCNM7Cg0B0ogHuH
         p666s7S2i151B5n1fjw8DigvPwq1sOZBHMaF+K8glmJ0/+qnb55b4uPJLfqfG/aHXCrP
         fwUhTC8/bWwcCvuICnHK8LpsbDIARfRJkbVztzAMiIgNaeOYKAD9oKVQ+QQbH0ddTgIq
         WmcQ==
X-Forwarded-Encrypted: i=1; AL+hErEyIFjNSMGrM8UDGt08h0N9KRKlBwkyfE2Iyhjg0xCa9hOhuhCvC1BZ+ea5hCETR7U1saGsFgNEk0RyKL12OWDy@lists.infradead.org
X-Gm-Message-State: APuU4Z/oKquTo26NUS40cBXaUcAPA1hMPM+0YAndihLup155MRR6Z+Fl
	khD/8kiJB9ecTJOkRTk+ARY09+sYqVk2aYTUBx8uaQmGtPlL1CVvR0MQ
X-Gm-Gg: AYBFou3tuSEcUsJAIZepeXguMQzFZ2OvaJHPeQkK/+v/u8ntseSpEXP+8XZNft4nM4g
	LnXZIKkyBNTD09H31cW848Zcj9/o1xiawYGXaUTaYCg5BVQZIUl0E1kIqt5nC+1bUnQm38G8/Rh
	Y+p0qDs2n0jBiBthSsApQT849C5CJlB+6N+7vkEWbc4vOnGUWshJTAZtRU3GIR9mxwcHXl4pEp1
	XyvcEgr+btTPdOXsz0dbhGPp9piTGUXecCyKOo1NRX6iaG/l2NlC9o/1xETsJlI5tOlW2IuDmb6
	fWtQPMfXwqXjiRa+lJdIiYaMemTWQHZXYrtu34M98W6aoOx+VHCIchD8PQCgGZHml+pgmdQt/No
	Un7JbHBjZgknoCzixrgmtIwSIaj0Qu+ma5Zsd7W2415cTQX3dW2nN5lS1zVn3NOWDCvUkqqIKlk
	GOdiR/LZkoDnGidh3DMNBImPf6Sd8cXwFlam1ICRFiZEuMCmlByQn5rrzYFDUFvd1Gga+2XFU7j
	CyQaiHWnmhfDlQKkkBicERI95P+Jw25AN8I2AD+BsXEanpW50S/zCxIjyLT3vif+DkQat8byGdG
	bhcN8eJyomYyGqNELZLTahqvrblPMopc
X-Received: by 2002:a05:690c:c4e8:b0:8b3:5eaf:29e1 with SMTP id 00721157ae682-8b4aa25c264mr17934757b3.24.1794584708193;
        Fri, 13 Nov 2026 07:45:08 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:45:07 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:11 -0300
Subject: [PATCH v2 5/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 DSI to LVDS adapter with the 10.1" V2 display
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-5-59c45f0a0d8e@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=6412;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=vzIjLmWFSOX7Q6KoUjTuv+EQnM6QYoejqFUSsc1st0w=;
 b=sg58hm4Vc+Xkmyt5ji7AMipyZqNirhtACUMRUsS5Q4GGg/S6FTko7vm/p0KIGG87WsY6dtve4
 2FxxDenshHJCFY2RHf9s5rxYC8VKUzgpaPKI/Bndg5GHhLI9eUYoiNq
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_074509_485953_33893A52 
X-CRM114-Status: GOOD (  14.29  )
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

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
touch controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   5 +
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso | 129 +++++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 51c74fbb8e0ce..2a4118add28b5 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -733,6 +733,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
@@ -744,6 +745,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
@@ -758,6 +760,9 @@ imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-td
 imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
new file mode 100644
index 0000000000000..32828e9bc5345
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1" V2, used on Dahlia (X17) and Development Board (X48) that expose DSI_1
+ * via a Samtec LSS-130 connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-lvds-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	panel-lvds-bridge {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		power-supply = <&reg_dsi_lvds>;
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <70000000>;
+			hactive = <1280>;
+			hback-porch = <55>;
+			hfront-porch = <55>;
+			hsync-len = <45>;
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
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_lvds: regulator-dsi-lvds {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&backlight {
+	/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+	pwms = <&pwm3 0 6666667 0>;
+
+	status = "okay";
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>,
+			    <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&lvds_ti_sn65dsi84 {
+	vcc-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_lvds_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			dsi_lvds_bridge_out: endpoint {
+				remote-endpoint = <&panel_lvds_bridge_in>;
+			};
+		};
+	};
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


