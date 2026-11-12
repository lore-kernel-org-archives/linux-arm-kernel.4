Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B575F606A889
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EB1mntCV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAKgWrus
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZVpuREB8xPMvnvzIHzSU5Q+SDBQM9PRI4uI6fRX5adE=; b=EB1mntCVSD7fol
	x5hnW2g+L0Qiwn2LCYUdlbsc4Jdm9VGRnxM6TkAsdr+bpXER601X0CidxciZlprQMBX5r+CesO4EN
	NzV4GQLG1BoxPszoCcNExysDgKEYM/HTDB5pbbWoVM9AQGyrea8Pi7NFTSDZXAoENQNv0Bp2qibo8
	iPfP8ZrQyIPd6blMhxDpXBBQAQpGtLO0Jo93aVBDB9SQjwQ7flLk5dRiUU5pNy93fQAH/kZJXwFvQ
	nFwiMO/icxA3+EVijEEewpGbzQwcC0oUY+LPiNuX+sbvq0nA3WM+vw33IzvwyqO6myeI8Q/2K9uHm
	CkdQ8n0woSDVaZMJiq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVwa-0000000AIAB-227c;
	Thu, 12 Nov 2026 14:38:28 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVwV-0000000AI6A-0wt8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:38:25 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so842691241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 06:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494302; x=1795099102; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVpuREB8xPMvnvzIHzSU5Q+SDBQM9PRI4uI6fRX5adE=;
        b=wAKgWrus0q3dJQAdWy+fI8TgQPCxRz8UbqgUSeGQ1UTYoavxQmjOINGjzzKCtEjpzr
         4/dD38dchLVpoCcXqDE02hFO92HI8YU8loYkRP3XynmhzSRGvtrPiwf/7MjKXLsh+t2M
         YvrtWEKkbri22gocUlzSGAgpeVkCubDVvEva97cIVfi7vRK2Fhfg+b33UNA96cIs21wI
         v3V3sjHMUu8B2K6L/vV2OPnRBlwRX1xxm3SoMEwp/WLkTlTHbFZ+GLXJq01Xe3XNK7lY
         bSM6IjoHoguhsmd+NMrpTvEWP9InPyzsFXLWq6QiJaCVc5HMQLQNCyhxsy5eEDvBzpgm
         qARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494302; x=1795099102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVpuREB8xPMvnvzIHzSU5Q+SDBQM9PRI4uI6fRX5adE=;
        b=qDzy4tkj2XbChq+obEHIY0RdLR9oqOe9XtWHeln71+BNzfovKSDclAt8pJ/9fMzm3N
         iy8Sg1GRPqMxQLQ6eF2mCfXRuhnQyLkzes9mRUOisZG7sBVOMcPCgTfpKKIQuJGsmWjl
         MTQnW/+dEjGzgUfZ3Zp3NnuIR04PAiOSceO6/yqi7NVIGyA3n4FhClR7K7eGYmxgwvW9
         WRC21deUlySNO7TxBsptHO+2rmP4CFagnIr8BdV+9E5GQsfrteb+lTWohG7sJp5P0gCZ
         NwkcSW/RNqPdxUVRmQdzGtKJZcYG5AcX1FJt8gukNbdfamZNNOSlUqDhhyuPWUY6c5qW
         Hvrg==
X-Forwarded-Encrypted: i=1; AL+hErEVYc8WPK4L3ig0yAfg62CrtHzOy6O5Rh+W2ld16cTTeEC9q40jy8PmfogF0+YLeVJMjtozwWspTBGtuLEXJjFq@lists.infradead.org
X-Gm-Message-State: APuU4Z9yGyWAojdsyVkMzj7KHNBiP4OJsmvEK/3GHXblKSBdhjaFH1aA
	wApFO1x5QJDuxIugvHKy3y34h9HffxJFpHJlRAxXLK9XGZ2CP6fo/mhd
X-Gm-Gg: AYBFou3m4lqYX4sD4Lsuqz7THhtOGM8CghIeRQTQr3wJmkrZkoKWhr9MC9tNMav0MKm
	WVQX0c+s1W8ZxPrglfjUVQ4igoRggMMqoEB6ogMNzG+lqUr3ZP/mDCSUKe1R3QIe6igzYcfUm3v
	UlbT4d3ReXgi+o8kkL+KNLNMmLOIeRi7oJYbOp3njzVrj7xwTAz1jGFrO38Y3wgmyJBcT5Md0YO
	r7QzXP2NX1lflb3aRdLcx2wzz+E7tsBD/knQl4iytXTqBy+XHJv0eQMD6DepZutWSXyvT7ekInj
	P0eDTHZEDQw6kb6Li2Srqnv1E25SErEplmDPqPpNjRFlfK1a53WlQJR06QxsoYFyRSH3BsAr6Lm
	P9vWRSotzXREo3hQ7HhQCrRXV6sEasosYQagyJ+mJejJQ5m1K9McCKHkVPL4sRblpNYdqudeNn8
	PovvDo4hp9M81BXgSoVmALVDhuSGUcAR6hCZ27Lk2MrUpJZc5InayP67Eqn+8+G8ZgCHBx+IDIs
	Uc/UW6Apg79v2PXRFVIVRBIppD/wC5Ogm8Yy8odJW5+z/ltO3GV8rtHBwbCC9e9Xj+CRve1CE/2
	DoB2gdytTDKWvNElTfI0CLqazOe+FrTZkQ==
X-Received: by 2002:a05:6102:6884:b0:7bd:ce85:b00f with SMTP id ada2fe7eead31-7d631812c87mr733923137.40.1794494301320;
        Thu, 12 Nov 2026 06:38:21 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:21 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Thu, 12 Nov 2026 11:37:35 -0300
Subject: [PATCH 3/3] arm64: dts: freescale: imx95-aquila: Add Lotus Carrier
 Board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-3-ca150bb4b0f9@toradex.com>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=9267;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=oRQABbPT78J3ds1qH6YAq8U3BmoCtY9BHxeZLI5mJEk=;
 b=x5X4+BTojUPJqFVMsqkAXbnN1gfkUoK8ry+6pKywK5Vs5kCilmqp6sWUb1yAeDrOPAThxGnqR
 f8wSBDdKHGUDXbqReXc+4F2zU78uoVow5ibIJa/44ft+yjdeJ9TtQgj
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_063823_383416_61BD7B5F 
X-CRM114-Status: GOOD (  13.71  )
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

Add support for the Aquila iMX95 SoM mated with the Lotus Carrier Board.
Lotus is a carrier board for the Aquila family featuring a small form
factor (Nano-ITX 120mm x 120mm) and built for volume production.

I2S_1_BCLK, GPIO_07 and GPIO_08 are used as digital input readbacks for
the Isolated Digital IOs on the Lotus Carrier Board. Add pingroups
muxing these pins as GPIOs in the Lotus device tree, with no pull-ups or
pull-downs, since the Isolated Digital IO circuit includes external
pull-downs for the readback pins.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/lotus
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-lotus.dts      | 365 +++++++++++++++++++++
 2 files changed, 366 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb56..60ab650f04279 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -965,6 +965,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-lotus.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-osm-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
new file mode 100644
index 0000000000000..4ae600636106b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
@@ -0,0 +1,365 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/lotus
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx95-aquila.dtsi"
+
+/ {
+	model = "Aquila iMX95 on Aquila Lotus Board";
+	compatible = "toradex,aquila-imx95-lotus",
+		     "toradex,aquila-imx95",
+		     "fsl,imx95";
+
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	dp0-connector {
+		compatible = "dp-connector";
+		dp-pwr-supply = <&reg_dp_3p3v>;
+		type = "mini";
+
+		port {
+			dp_1_connector_in: endpoint {
+				remote-endpoint = <&dsi2dp_out>;
+			};
+		};
+	};
+
+	reg_dp_3p3v: regulator-dp-3p3v {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_21_dp>;
+		/* Aquila GPIO_21_DP */
+		gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "DP_3V3";
+		startup-delay-us = <10000>;
+	};
+
+	sfp: sfp {
+		compatible = "sff,sfp";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_19_dsi_1>, <&pinctrl_i2s_1_sync_gpio>,
+			    <&pinctrl_i2s_1_d_in_gpio>, <&pinctrl_pwm4_dp_gpio>,
+			    <&pinctrl_i2s_1_mclk_gpio>, <&pinctrl_i2s_1_d_out_gpio>;
+		i2c-bus = <&lpi2c2>;
+		los-gpios = <&gpio5 13 GPIO_ACTIVE_HIGH>;
+		maximum-power-milliwatt = <4000>;
+		mod-def0-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
+		rate-select0-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
+		rate-select1-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&gpio4 26 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* Aquila ADC_[1-4] */
+&adc1 {
+	status = "okay";
+};
+
+&dsi2dp_out {
+	remote-endpoint = <&dp_1_connector_in>;
+};
+
+/* Aquila ETH_1 */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	managed = "in-band-status";
+	phy-mode = "10gbase-r";
+	sfp = <&sfp>;
+
+	status = "okay";
+};
+
+/* Aquila CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+/* Aquila CAN_2 */
+&flexcan2 {
+	status = "okay";
+};
+
+/* Aquila CAN_3 */
+&flexcan3 {
+	status = "okay";
+};
+
+/* Aquila CAN_4 */
+&flexcan4 {
+	status = "okay";
+};
+
+/* Aquila QSPI_1 */
+&flexspi1 {
+	pinctrl-0 = <&pinctrl_flexspi1_4bit>,
+		    <&pinctrl_qspi_cs1>;
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-max-frequency = <66000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};
+
+&gpio1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_8_dig_in_rb>;
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_1>,
+		    <&pinctrl_gpio_2>,
+		    <&pinctrl_gpio_3>,
+		    <&pinctrl_gpio_4>,
+		    <&pinctrl_gpio_7_dig_in_rb>,
+		    <&pinctrl_i2s_1_bclk_dig_in_rb>;
+};
+
+/* Aquila I2C_2 */
+&i3c2 {
+	status = "okay";
+};
+
+/* Aquila I2C_1 */
+&lpi2c2 {
+	status = "okay";
+
+	fan_controller: fan@18 {
+		compatible = "ti,amc6821";
+		reg = <0x18>;
+		#pwm-cells = <2>;
+
+		fan {
+			cooling-levels = <255>;
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
+	};
+
+	gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names =
+			"DO1_EN",
+			"DO2_EN",
+			"DO3_EN",
+			"",
+			"DI1_EN",
+			"DI2_EN",
+			"DI3_EN",
+			"";
+	};
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp1075";
+		reg = <0x4f>;
+	};
+
+	/* USB-C OTG (TCPC USB PD PHY) */
+	tcpc@52 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x52>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			op-sink-microwatt = <0>;
+			power-role = "dual";
+			self-powered;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_con_hs: endpoint {
+						remote-endpoint = <&usb1_con_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb1_con_ss>;
+					};
+				};
+			};
+		};
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Aquila I2C_4_CSI1 */
+&lpi2c4 {
+	status = "okay";
+};
+
+/* Aquila I2C_6 */
+&lpi2c5 {
+	status = "okay";
+};
+
+/* Aquila I2C_3_DSI1/I2C_5_CSI2 */
+&lpi2c8 {
+	status = "okay";
+};
+
+/* Aquila SPI_1 */
+&lpspi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi6>, <&pinctrl_gpio_5>;
+	/* Aquila SPI_1_CS (Aquila D09), Aquila GPIO_05 (Aquila C21) */
+	cs-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>, <&gpio4 18 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+
+	tpm@1 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_6>;
+		/* Aquila GPIO_06 (Aquila C22) */
+		interrupt-parent = <&gpio4>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <12000000>;
+	};
+};
+
+/* Aquila UART_3, used as the Linux Console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Aquila UART_4 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* Aquila UART_1 as Non-Isolated RS-485 */
+&lpuart3 {
+	linux,rs485-enabled-at-boot-time;
+
+	status = "okay";
+};
+
+/* Aquila UART_2 as Isolated RS-485 */
+&lpuart7 {
+	linux,rs485-enabled-at-boot-time;
+
+	status = "okay";
+};
+
+/* Aquila PCIE_1 */
+&pcie0 {
+	status = "okay";
+};
+
+/* Aquila PWM_1 */
+&tpm3 {
+	status = "okay";
+};
+
+/* Aquila PWM_3_DSI. Don't claim PWM_4_DP, as it's used as SFP+ RS1 */
+&tpm5 {
+	pinctrl-0 = <&pinctrl_pwm3_dsi>;
+
+	status = "okay";
+};
+
+/* Aquila PWM_2 */
+&tpm6 {
+	status = "okay";
+};
+
+/* Aquila USB_2 */
+&usb2 {
+	status = "okay";
+};
+
+/* Aquila USB_1 */
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	status = "okay";
+
+	port {
+		usb1_con_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	orientation-switch;
+
+	status = "okay";
+
+	port {
+		usb1_con_ss: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
+/* Aquila SD_1 */
+&usdhc2 {
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	/* Aquila GPIO_07 without internal pull-up or pull-down */
+	pinctrl_gpio_7_dig_in_rb: gpio7diginrbgrp {
+		fsl,pins = <IMX95_PAD_ENET2_RXC__GPIO4_IO_BIT23	0x11e>; /* Aquila C23 */
+	};
+
+	/* Aquila GPIO_08 without internal pull-up or pull-down */
+	pinctrl_gpio_8_dig_in_rb: gpio8diginrbgrp {
+		fsl,pins = <IMX95_PAD_PDM_BIT_STREAM1__AONMIX_TOP_GPIO1_IO_BIT10	0x11e>; /* Aquila C24 */
+	};
+
+	/* Aquila I2S_1_BCLK without internal pull-up or pull-down */
+	pinctrl_i2s_1_bclk_dig_in_rb: sai2txbclkdiginrbgrp {
+		fsl,pins = <IMX95_PAD_ENET2_TXC__GPIO4_IO_BIT21	0x11e>; /* Aquila B20 */
+	};
+};

-- 
2.43.0


