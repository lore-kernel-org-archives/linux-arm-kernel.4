Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B14E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b9xXtvTA;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RhB7QdfK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6t8zMEHWOq/TMcqyQcFtZHat+KMa7yPUF6stD0po4a8=; b=b9xXtvTAbKkMat
	rodHYBm2yues32/G1VhZpJUmK4641ysaIY5ylKcLqoNB/UuJ1bmF8iu5FgBtby9HKerARFZCXioju
	qK1yCVh/XTAwQ908cv6V346hw0dLuD6OeOe5kUBbRuZylA3Q+sT59TN3mH5Z9OShQ9tF3EK7ejChv
	kmFDZMdWO+gkrXkpnOXGM4ChqH0zx8SkBb2wx4w8+NO+EpD2lIkNFuV4kC31R7wAlW9lAaETUKb3a
	2yUA9oik3xLl4MmeDN6MIh+aEVnY46zK2vYxFzaA00bKDDxDSmZhtJmWk3OVvu4FXHqTS25mfM/t3
	zwd9FGQnMT0myohrtR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdCJ-0000000E3Kb-1E8F;
	Thu, 26 Nov 2026 17:23:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdBg-0000000E39X-07Q1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:23:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DA371CE0;
	Thu, 26 Nov 2026 09:23:08 -0800 (PST)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5637F3F632;
	Thu, 26 Nov 2026 09:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795713791; bh=MM9n/DJpa5JgVDUvJl3UrEXOEQhNBvmadA6mv/jc9fo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RhB7QdfKoTzZdolKyQ5cyY8aURiuPOZBVNaY2N70lM3z9nP0jutzeOMJAPJxRU4SU
	 I9QNRsSnBEAAUSl39VHju4Jzk0mxkUewI1kghUgjdGtOjFmHfrGcwon6IIquVxGSlV
	 NvHZ/9MxRyi7gfZm91eB8R8VtFsJgSEGzXtjTC0g=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: add Radxa Cubie A7A board
Date: Thu, 26 Nov 2026 17:22:53 +0000
Message-ID: <20261126172253.1097838-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126172253.1097838-1-andre.przywara@arm.com>
References: <20261126172253.1097838-1-andre.przywara@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_092312_148313_7BE29578 
X-CRM114-Status: GOOD (  18.23  )
X-Spam-Score: -4.4 (----)
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

The Radxa Cubie A7A is a single board computer using the Allwinner A733
SoC. It features:
  - Allwinner A733 SoC (6*Arm Cortex-A55 + 2*Arm Cortex-A76)
  - Imagination BXM-4-64 MC1 GPU and 3 TOPS NPU
  - 2-16 GiB LPDDR5 DRAM
  - AXP318W PMIC
  - eMMC and UFS socket
  - single lane PCIe 3.0 via FPC connector
  - microSD card slot
  - bootable SPI NOR flash
  - HDMI 2.0 and MIPI-DSI connector
  - MIPI-CSI camera connector
  - GBit Ethernet socket, with optional POE support
  - unknown Bluetooth and WiFi
  - USB-C 2.0 OTG port (also primary power supply)
  - USB-A 3.1 host port
  - 3* USB-A 2.0 host ports (via hub)
  - 40 pin GPIO connector

Add initial support for the peripherals we have DT bindings for so far,
including UART, PMIC, SD card, some EEPROM and an external RTC chip.
The PMIC rails assignment has been determined by the schematic.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7a.dts   | 385 ++++++++++++++++++
 2 files changed, 386 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index f38375fff1753..011323d668b7c 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -70,4 +70,5 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts
new file mode 100644
index 0000000000000..9017cadf6c6a9
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (c) 2026 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Radxa Cubie A7A";
+	compatible = "radxa,cubie-a7a", "allwinner,sun60i-a733";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		power-led {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_GREEN>;
+			/*
+			 * The LED is connected between VCC and GND, so it
+			 * turns on as soon as the board gets power. But a
+			 * transistor allows to pull down the anode to GND,
+			 * so the LED can be turned off.
+			 */
+			gpios = <&pio 9 26 GPIO_ACTIVE_LOW>; /* PJ26 */
+			default-state = "on";
+		};
+
+		status-led {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 9 27 GPIO_ACTIVE_HIGH>; /* PJ27 */
+		};
+	};
+
+	osc32k: osc32k-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	/* discrete SY8089A DC/DC step-down regulator */
+	reg_vcc2v4: regulator-2v4 {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo-input";
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v>;
+	};
+
+	/* board wide 5V supply from the USB-C connector */
+	reg_vcc5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu4 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu5 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu6 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&cpu7 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pg_pins>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "belling,bl24c16f", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		vcc-supply = <&reg_aldo1>;
+		wp-gpios = <&pio 2 7 GPIO_ACTIVE_LOW>; /* PC7 */
+	};
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-mmc-highspeed;
+	cap-sdio-irq;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;   /* PF6 */
+	disable-wp;
+	vmmc-supply = <&reg_swout2>;
+	status = "okay";
+};
+
+&hosc {
+	clock-frequency = <26000000>;
+};
+
+&pio {
+	vcc-pb-supply = <&reg_swout2>;	// via VCC-IO
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	vcc-pf-supply = <&reg_swout2>;	// via VCC-IO
+	vcc-pg-supply = <&reg_aldo1>;
+	vcc-ph-supply = <&reg_swout2>;	// via VCC-IO
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_aldo1>;
+};
+
+&r_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+	status = "okay";
+
+	axp318w: pmic@36 {
+		compatible = "x-powers,axp318w";
+		reg = <0x36>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		aldo156in-supply = <&reg_vcc5v>;
+		aldo234in-supply = <&reg_aldo1>;
+		bldoin-supply = <&reg_vcc2v4>;
+		cldoin-supply = <&reg_vcc2v4>;
+		dldoin-supply = <&reg_vcc5v>;
+		eldoin-supply = <&reg_dcdc9>;
+		ips-supply = <&reg_vcc5v>;
+		vin19-supply = <&reg_vcc5v>;
+		vin23-supply = <&reg_vcc5v>;
+		vin45-supply = <&reg_vcc5v>;
+		vin678-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_dcdc1: dcdc1 {
+				/* VCC3V3 on GPIO connector and power LED */
+				regulator-name = "vcc-wifi-hub-pci-gpio-led";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-name = "vdd-sys-dram-ve-combo";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-name = "vdd-cpub";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-name = "vdd-gpu";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <960000>;
+			};
+
+			reg_dcdc5: dcdc5 {
+				regulator-name = "vdd-cpul";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				/* Voltage set by DRAM init routine */
+				regulator-name = "vcc-draml-vddq";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <600000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				/* Voltage set by DRAM init routine */
+				regulator-name = "vcc-dram";
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc8: dcdc8 {
+				regulator-name = "vcc-ufs-io";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			reg_dcdc9: dcdc9 {
+				regulator-name = "eldo-input";
+				/*
+				 * The schematic says 1.25V, but the
+				 * granularity of DCDC9 is 20mV in this range.
+				 */
+				regulator-min-microvolt = <1240000>;
+				regulator-max-microvolt = <1260000>;
+			};
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc-pd-pj-lcd-ephy";
+			};
+
+			reg_swout2: swout2 {
+				/* SoC VCC-IO and USB 3.3V supply #2 */
+				regulator-name = "vcc-io-sd-emmc-ph-usb";
+				regulator-always-on;
+			};
+
+			reg_aldo1: aldo1 {
+				/* PortL (this PMIC) and USB 3.3V supply #1 */
+				regulator-name = "vcc-pl-usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_aldo5: aldo5 {
+				regulator-name = "vcc-ac101-codec";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds-lcd";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo4: bldo4 {
+				regulator-name = "vcc18-codec";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-name = "vcc18-lpddr";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo2: cldo2 {
+				regulator-name = "vcc18-hdmi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-name = "vcc-pll-dram-avcc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo5: cldo5 {
+				regulator-name = "vcc-pc-combo";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_dldo1: dldo1 {
+				regulator-name = "vcc-efuse";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_dldo6: dldo6 {
+				regulator-name = "vcc-ufs";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+			};
+
+			reg_eldo1: eldo1 {
+				regulator-name = "vcc09-lpddr5";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-always-on;
+			};
+
+			reg_eldo6: eldo6 {
+				regulator-name = "vdd-cpus-usb";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_rtc_ldo: rtc-ldo {
+				regulator-name = "vcc-rtc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&r_i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c1_pl_pins>;
+	status = "okay";
+
+	rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		interrupt-parent = <&r_pio>;
+		interrupts = <0 3 IRQ_TYPE_EDGE_FALLING>;	/* PL3 */
+	};
+};
+
+&r_i2c1_pl_pins {
+	/*
+	 * The schematic shows external pull-up resistors, but still the
+	 * internal pull-ups are required somehow.
+	 */
+	bias-pull-up;
+};
+
+&r_pio {
+	/*
+	 * Specifying the supply would create a circular dependency.
+	 *      vcc-pl-supply = <&reg_aldo1>;
+	 */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&hosc>, <&r_ccu CLK_R_AHB>,
+		 <&osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
-- 
2.43.0


