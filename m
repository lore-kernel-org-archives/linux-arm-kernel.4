Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C88606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HYS33Vbd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ap0KempJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lXpiDegVF1b+plr59eHYo4VExzILNh4lIdXipnBTpL4=; b=HYS33Vbd7iepsJ
	mfAAaBkHIlxfaRkhMCMaTW7l1XUUYXwZVOdY8s3Zj0qU9Zy5g6r6IfRvLkcVefES8P68ZFSPGuAb3
	mQh/i8I94uqFxxSXcbruxdm+Lt0kZ576dZgMN5mv3em2sob0lq5Zo4EoUu0h7W0QlDi0tXzo8rbxr
	vv+XSAb7PbFIaUsIMNoBhws6oQILkRFFvRXBNAP0a4W84Pqxja+t0yd1N7OqhE8ydFE7aDU/TmE+R
	29rDp7zBm5TtmK7s04KJ0p9wnfr6JQVv9gh4Ivh26VX+A1B9D6+KRtx+tlDsI7wpwBGxh4VTiGwOv
	FrF9q+BNG2OBBBm5IeOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBUB-00000009hKj-2XsM;
	Wed, 25 Nov 2026 11:48:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBTz-00000009hBL-3OgU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:48:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48e09aa5264so3257002f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607294; x=1796212094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lXpiDegVF1b+plr59eHYo4VExzILNh4lIdXipnBTpL4=;
        b=ap0KempJefphjxQVmqt6kmVmdj8oGXbRI62w2g41TXsohdDcPlmsoQlliJZjAMMw3g
         2/6MHxGb8c2Geg8m98aqrrGXegn+3OmQgcAv1/bP3mnnvjl50QGBh+5Kzgd8swoXAJyg
         U/Zy+EaIJF+opDIv6guxHAsRHQXr84jVgxVzU7QXwxZnzRD5UfJw4blMgHVbx4qDYW/Q
         wevEpm6VFQUPg2XEGdWxUPmqIw/F8laHfLJoS1cmoxfYipAYR+spZFbZUKlRevJjajZh
         jdcUy75BGgwO4Jx5ggKpvWi33RxjfnBU30v8RzWAqw2Z/CCFKfJJovVvssSwIJsU0Up3
         b5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607294; x=1796212094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lXpiDegVF1b+plr59eHYo4VExzILNh4lIdXipnBTpL4=;
        b=sYIUWtPQfX9oZcF2ZqCCO5gODTdNUZ8JLsSM1FVMIbrhJy49GTOwaNUKhn7VOscaMB
         zhRsWiPLs7cwRigwmT63cq/q7sXgdbVkHX1ITsot3wE2Ybq/6188HxD8iUMA62xFVNJU
         Js1dOhZqptQBBfnctGfboN8pwiH/1oujkJxViAJ4kGu6PTAzjT76xG48xEN5BsS7xA3Y
         d+a6cYfrFV0wGy84srCoqMzgtr1d4uwICc7qly7wHGzOHvKX+5LWVmLeLoVesPoe4rDT
         0/6j3Z9HaNDduz8ZLjkzZgwptEcKiqqs8hlOBFD4OFksOcfT5ikRQuyJO4GdwPPvo7BS
         tTOw==
X-Forwarded-Encrypted: i=1; AL+hErG3oqKJOsnIGuoPWp5uwgpZHX4OIDbrtnsoV3g5YlHc2sUiX+TVmIZZVGfU8soumqB1GHL6EM4RiYG8p+AKathv@lists.infradead.org
X-Gm-Message-State: APuU4Z+fPbXyd4PXEc3wha+0OwhQfDVUizLGVkuLbFrlGzpnRf17i0tN
	AJLtS99bvwIzt/m8tDYFrG4D1fYryNx81qEg7CKxTp8Abw2D+JKyt9k1
X-Gm-Gg: AZFdTZch/83Zg+RE3T9xo+uql/D60xgmOOJHAj2ogrgskA0kJVKtIkeH6X4cjNvLeGJ
	dISOHVKSqd/kR8aJ9F7odNucgON0VuCjXR0yFEoxuP9+eiDcgsjm2brHh4chMSzxjjvYl5bolvt
	eOblnku1w7ZAhR1bkv3oc6ij/hIUEonvwdrzD6WscIVVW+HIMfITVW/ioD9kzvqqfwhBqhULE9x
	P5ohm7Ex2CkHE9BTOcWrl0r0ugN7IA6zoi/QhUL9XpTjeJmrgeJpNOzFxGqnZ6XL8ErkkcxqKPm
	puKnHdCwAWW5uLOMTY+JPxJGmsd0gNrJBnwz8PujUOs+bStTgeXHMkcPoZyGY5bbJwLynYeCuYJ
	F9vWjAi8rcRyms2y1gDMTou4T/7PE0dpdSMUZ78XBvuYLa3Z8IDCqlV19mGcyv99iZxdJymySTI
	ihT/8SAY7jv3XN6/WMpBJWfdE2Huiu6Nw1bceGcILdp4Zmy45jG4xex0fKv8ZW11Wk1bSUy+ckl
	A1iboiETdjZF94wzQZkimFeDXNczXWihOT6JDrFT+rZTzMvoubl9levNq4jBk09QZXLQbgElrkD
	RU5byAT2FZzz3f36jK0xpXgnMEso2ZbLMqSLrqDrFGgmXYjjMuE09TNyoQf4eT7/ApYiHjwbXZ8
	9PLErCg29Lq6DAwCufqI=
X-Received: by 2002:a05:600c:5303:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4bb88786cfamr337845815e9.0.1795607293573;
        Wed, 25 Nov 2026 03:48:13 -0800 (PST)
Received: from saeedvft-ubuntu.tail2d4112.ts.net ([46.100.16.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm514068355e9.15.2026.11.25.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:48:13 -0800 (PST)
From: Saeed Nourian <saeednourian82@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Saeed Nourian <saeednourian82@gmail.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add Firefly AIO-3588Q
Date: Wed, 25 Nov 2026 15:17:57 +0330
Message-ID: <20261125114757.654051-3-saeednourian82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125114757.654051-1-saeednourian82@gmail.com>
References: <20261125114757.654051-1-saeednourian82@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_034815_919874_A9B01EAF 
X-CRM114-Status: GOOD (  21.96  )
X-Spam-Score: -1.9 (-)
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

The AIO-3588Q is an RK3588 board from Firefly built from an iCore-3588Q
SoM on a carrier board. The SoM part (PMIC, CPU and NPU rails, eMMC and
debug UART) is already described by rk3588-firefly-icore-3588q.dtsi, so
this only describes the carrier:

- two RGMII Ethernet ports (RTL8211F PHYs)
- microSD slot
- USB 2.0 and 3.0 type-A ports behind a GL3523 hub, plus the onboard
  FE1.1S hub
- PCIe 3.0 x4 slot and an M.2 PCIe 2.1 slot
- PCA9555 GPIO expander, HYM8563 RTC, fan, LEDs and the recovery button
- the three NPU cores, powered through npu-supply and sram-supply

The hub RESET# lines are wired to the PCA9555 and are released with
gpio-hog nodes. Describing the hubs themselves is left for later.

No card detect events were seen from the microSD slot on this board, so
set broken-cd and let the core poll for the card.

Signed-off-by: Saeed Nourian <saeednourian82@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-firefly-aio-3588q.dts | 434 ++++++++++++++++++
 2 files changed, 435 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-aio-3588q.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index e4a0237e11..76c6cc6bc3 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -200,6 +200,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb2-v10.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-firefly-aio-3588q.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-firefly-itx-3588j.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-friendlyelec-cm3588-nas.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-h96-max-v58.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-aio-3588q.dts b/arch/arm64/boot/dts/rockchip/rk3588-firefly-aio-3588q.dts
new file mode 100644
index 0000000000..a37f16260b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-aio-3588q.dts
@@ -0,0 +1,434 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Saeed Nourian
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/pwm/pwm.h>
+
+#include "rk3588-firefly-icore-3588q.dtsi"
+
+/ {
+	model = "Firefly AIO-3588Q";
+	compatible = "firefly,aio-3588q", "firefly,icore-3588q", "rockchip,rk3588";
+
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		mmc1 = &sdmmc;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-recovery {
+			label = "Recovery";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <17000>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		led-power {
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		led-user {
+			function = LED_FUNCTION_STATUS;
+			gpios = <&pca9555 3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		cooling-levels = <0 50 100 150 200 255>;
+		fan-supply = <&vcc12v_dcin>;
+		pwms = <&pwm15 0 50000 0>;
+	};
+
+	vcc12v_dcin: regulator-vcc12v-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc5v0_usb: regulator-vcc5v0-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc3v3_sys: regulator-vcc3v3-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v1_nldo_s3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	/* microSD slot power switch */
+	vcc3v3_sd: regulator-vcc3v3-sd {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pca9555 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* 5V for the USB2 hubs behind u2phy2 and u2phy3 */
+	vcc5v0_usb20_host0: regulator-vcc5v0-usb20-host0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb20_host0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpios = <&pca9555 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vcc5v0_usb>;
+	};
+
+	/* VBUS of the type-A hub on usb_host1_xhci */
+	vcc5v0_usb30: regulator-vcc5v0-usb30 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb30";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpios = <&pca9555 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie30";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie3_vcc3v3_en>;
+		startup-delay-us = <5000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	/* 3V3 for the M.2 (PCIe 2.1) slot */
+	vcc3v3_m2: regulator-vcc3v3-m2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_m2";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pca9555 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <5000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+};
+
+&combphy0_ps {
+	status = "okay";
+};
+
+&gmac0 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy0>;
+	/*
+	 * The PHY supplies the RGMII RX delay (rgmii-rxid), so the one in
+	 * the SoC is disabled; the TX delay still comes from the SoC.
+	 */
+	phy-mode = "rgmii-rxid";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim
+		     &gmac0_tx_bus2
+		     &gmac0_rx_bus2
+		     &gmac0_rgmii_clk
+		     &gmac0_rgmii_bus>;
+	snps,reset-gpio = <&gpio3 RK_PC7 GPIO_ACTIVE_LOW>;
+	snps,reset-active-low;
+	/* Reset time is 20ms, 100ms for rtl8211f */
+	snps,reset-delays-us = <0 20000 100000>;
+	rx_delay = <0x00>;
+	tx_delay = <0x47>;
+	status = "okay";
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	/*
+	 * The PHY supplies the RGMII RX delay (rgmii-rxid), so the one in
+	 * the SoC is disabled; the TX delay still comes from the SoC.
+	 */
+	phy-mode = "rgmii-rxid";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_miim
+		     &gmac1_tx_bus2
+		     &gmac1_rx_bus2
+		     &gmac1_rgmii_clk
+		     &gmac1_rgmii_bus>;
+	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+	snps,reset-active-low;
+	/* Reset time is 20ms, 100ms for rtl8211f */
+	snps,reset-delays-us = <0 20000 100000>;
+	rx_delay = <0x00>;
+	tx_delay = <0x4f>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	sram-supply = <&vdd_gpu_mem_s0>;
+	status = "okay";
+};
+
+&i2c6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c6m0_xfer>;
+	status = "okay";
+
+	pca9555: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		/* FE1.1S RESET#, deasserted */
+		usb-hub2-reset-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "usb-hub2-reset";
+		};
+
+		/* GL3523 RESET#, deasserted */
+		usb-hub3-reset-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "usb-hub3-reset";
+		};
+	};
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hym8563_int>;
+		wakeup-source;
+	};
+};
+
+&mdio0 {
+	rgmii_phy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+	};
+};
+
+&mdio1 {
+	rgmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+	};
+};
+
+/* M.2 key-M slot, PCIe 2.1 lane */
+&pcie2x1l2 {
+	reset-gpios = <&pca9555 14 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_m2>;
+	status = "okay";
+};
+
+&pcie30phy {
+	status = "okay";
+};
+
+&pcie3x4 {
+	reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie30>;
+	status = "okay";
+};
+
+&pinctrl {
+	hym8563 {
+		hym8563_int: hym8563-int {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	leds {
+		led_pins: led-pins {
+			rockchip,pins = <3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie3 {
+		pcie3_vcc3v3_en: pcie3-vcc3v3-en {
+			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pwm15 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm15m2_pins>;
+	status = "okay";
+};
+
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8_s0>;
+	status = "okay";
+};
+
+&sdmmc {
+	/* card detect does not generate events on this board, poll instead */
+	broken-cd;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	disable-wp;
+	max-frequency = <150000000>;
+	no-mmc;
+	no-sdio;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd_s0>;
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	/* VBUS of the type-A hub on usb_host1_xhci */
+	phy-supply = <&vcc5v0_usb30>;
+	status = "okay";
+};
+
+&u2phy2 {
+	status = "okay";
+};
+
+&u2phy2_host {
+	phy-supply = <&vcc5v0_usb20_host0>;
+	status = "okay";
+};
+
+&u2phy3 {
+	status = "okay";
+};
+
+&u2phy3_host {
+	phy-supply = <&vcc5v0_usb20_host0>;
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+/* USB3 half of the four type-A ports (Genesys GL3523) */
+&usb_host1_xhci {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbdp_phy1 {
+	status = "okay";
+};
-- 
2.43.0


