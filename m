Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B313606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ysRhyMPh;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=VjWGY+EU;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=aRe2HT8T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FNzEHA4/L2PAmJ+F/LcXdz2bE0OJ7mWf/LIjnfOf7EY=; b=ysRhyMPhI36dxM
	pVgpZwuLVEkEopey7J+J1k+q92fG5V3zexE/pQCiBzN89yC/PuyU5GE/msjUSkcNf12+z3xTQERC5
	EXxVd5qkfLFEMEuTsV5zjQLUqAzGJK4smbZouWDa5W4i2jzamtGEtluiPWEWbP53Jd2/ObjQfBfcb
	P1O9T7jz0i0khYUNsbTEcYso08a78fi6237VcWPjltjovbGDY5PYih+jzKks5RGvG+HPQtgbPA4Hf
	uPdwRzh9FkbIs1WdftYtn8IntUJ5b1UO9bjWFPRe5fiNSlGyM2qBwoylhOytJRPJWY1GRKuj/vcD/
	cWVqFVgFXqUYN3nHl4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWf8Z-0000000EIfs-392z;
	Thu, 26 Nov 2026 19:28:07 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWf8V-0000000EIcs-3ZT4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795721283;
 bh=FNzEHA4/L2PAmJ+F/LcXdz2bE0OJ7mWf/LIjnfOf7EY=;
 b=VjWGY+EUTHPGWXNjyu4ahufFC79ZLB9uid1h5mJnRSqG0ER0uJ8IagptCUPJAd4TWoX3ZkZQr
 OZZw9A+4T52bySIasaKkLsPZ1AKDHldmUs6kon5uZPF5pqAiZYDihOy1sSMg/m4D0oNyImNDub5
 FciBy6WoRe4WTLPi99yNSvKxIpNzQXWNp/r5hdHid3zHRhCf1gxkhG3W1wU3/+To1F1L9sB8aJ/
 B9IsvPJbAt37RgcLvcQCJWE1c627jMXsgiyEwrqq+BUPogCgge2y3eH1hWMsmDAu5i2tmRT62rm
 05prWgkxe/AKcEcU0Suk3GsHvHfiozUWKhUa5y2/VbDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795721283;
 bh=FNzEHA4/L2PAmJ+F/LcXdz2bE0OJ7mWf/LIjnfOf7EY=;
 b=aRe2HT8TnhOe/zAfIlPreafo0z9AjM30YctZEcErKY97nX3xO2D1/fkaULmVrluYyT5pNGtz/
 O3g3nu4IAvYIIhbpg8xkWU9SUspvbyPR/uwcgHKBCBAevMCAztiZSfvHvJpF56wiizCdfJNHLum
 cnS3JRhIBE6psn8PwiLz/AA=
CFBL-Feedback-ID: 6b08883ab69a54ed847adb5e:08f0c09a429f60df47897387344267c7
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b08883ab69a54ed847adb5e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: rockchip: Add ArmSoM Forge1 board
Date: Thu, 26 Nov 2026 19:27:45 +0000
Message-ID: <20261126192746.1595707-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126192746.1595707-1-jonas@kwiboo.se>
References: <20261126192746.1595707-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_112803_894800_AF39F7F7 
X-CRM114-Status: GOOD (  14.78  )
X-Spam-Score: -2.0 (--)
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

ArmSoM Forge1 is an industrial-grade product powered by the RK3506J
triple-core Cortex-A7 application processor. It is specifically designed
for industrial gateways, HMIs, PLCs, handheld POS devices, and home
appliance display/control applications.

Link: https://docs.armsom.org/armsom-forge1
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- Remove unintended use of zero-width space in commit message
- Add spi_nand label to flash@0 node
- Drop rtc_int pinctrl, it was not referenced and unclear how RMIO may
  affect how hw description of RTC IC may end up
---
 arch/arm/boot/dts/rockchip/Makefile           |   3 +-
 .../dts/rockchip/rk3506j-armsom-forge1.dts    | 223 ++++++++++++++++++
 2 files changed, 225 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index faebeb20f467..ef11b2b95ae4 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -49,4 +49,5 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3506-luckfox-lyra-plus.dtb \
 	rk3506-luckfox-lyra.dtb \
 	rk3506b-luckfox-lyra-ultra.dtb \
-	rk3506b-luckfox-lyra-zero-w.dtb
+	rk3506b-luckfox-lyra-zero-w.dtb \
+	rk3506j-armsom-forge1.dtb
diff --git a/arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts b/arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts
new file mode 100644
index 000000000000..ddc752059d50
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "rk3506.dtsi"
+
+/ {
+	model = "ArmSoM Forge1";
+	compatible = "armsom,forge1", "rockchip,rk3506";
+
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		mmc0 = &sdmmc;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:1500000n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-maskrom {
+			label = "MASKROM";
+			press-threshold-microvolt = <0>;
+			linux,code = <KEY_SETUP>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&run_led>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	vdd_0v9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_0v9";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+	};
+
+	vcc_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: regulator-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc5v0_usb20_otg1: regulator-5v0-usb20-otg1 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb20_otg1_drv_h>;
+		regulator-name = "vcc5v0_usb20_otg1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc_ddr: regulator-vcc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_ddr";
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&fspi {
+	status = "okay";
+
+	spi_nand: flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		bootph-pre-ram;
+		bootph-some-ram;
+		spi-max-frequency = <80000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&gmac0 {
+	assigned-clocks = <&cru CLK_MAC0>;
+	assigned-clock-rates = <50000000>;
+	phy-handle = <&rmii_phy0>;
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth_rmii0_miim>, <&eth_rmii0_tx_bus2>,
+		    <&eth_rmii0_rx_bus2>, <&eth_rmii0_clk>;
+	clock_in_out = "output";
+	status = "okay";
+};
+
+&gmac1 {
+	assigned-clocks = <&cru CLK_MAC1>;
+	assigned-clock-rates = <50000000>;
+	phy-handle = <&rmii_phy1>;
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth_rmii1_miim>, <&eth_rmii1_tx_bus2>,
+		    <&eth_rmii1_rx_bus2>, <&eth_rmii1_clk>;
+	clock_in_out = "output";
+	status = "okay";
+};
+
+&mdio0 {
+	rmii_phy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rmii0_rstn>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio0 RK_PC2 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&mdio1 {
+	rmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rmii1_rstn>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio1 RK_PC7 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pinctrl {
+	ethernet {
+		rmii0_rstn: rmii0-rstn {
+			rockchip,pins = <0 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		rmii1_rstn: rmii1-rstn {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	leds {
+		run_led: run-led {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sdmmc {
+		sdmmc_det_l: sdmmc-det-l {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	usb {
+		usb20_otg1_drv_h: usb20-otg1-drv-h {
+			rockchip,pins = <1 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdmmc {
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA3 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	no-sdio;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_bus4>, <&sdmmc_clk>, <&sdmmc_cmd>, <&sdmmc_det_l>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.56.1


