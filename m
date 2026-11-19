Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68811606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sKZ664XH;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=w3e7fPDN;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=EgVP6vG2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l97TtMy7x+yYt7ekyvNFTrCiW2KW55M+lbA28Kc94gs=; b=sKZ664XHKV77oa
	/Jc00jd/Dd3p1biIK62qWm8u30WtKpgZzSgBTnB2g5pOHuhMQoCdR+l3sKxn6rur+y60pZoxsca5r
	45XHFCDRZBYxK71Zg83RpE+PMeh1Orh/Cf7aocOR6FUuSw/7fd1qwGQbBM+qF3nsmaF/CD5eRBZR3
	bO2jF5Q7t6fem+y/SKLUbozRZWizG4MFXWR/wdvVZxciSxSm0ryxUKUoy6lpeRfMNuC4NizpKmCiI
	Yi1t5a0yj8YF0XFkjeKr7bGTdVukQb3UOkzoX5rgDdFN699/QEalOdZD4TvV/1K2A4UmjyJ6eMxsb
	UFMWxjsQZO5dRGR/VhIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3xI-0000000CQ19-2l4F;
	Thu, 19 Nov 2026 15:21:44 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3wu-0000000CPfC-053p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101679;
 bh=l97TtMy7x+yYt7ekyvNFTrCiW2KW55M+lbA28Kc94gs=;
 b=w3e7fPDNaQ9gmny6vK45nadiIhzQ/DIGfcgcOBqZXnSaZRf1qJVWl4cEqh84uDLinqztOUr6V
 TWAGOhsSOtjlf1neIA0W+tLQ+kkXvVjhl6wIB9e0pyx3O9zqz6K24Yh+6hFGC+ewhajp3zqY40g
 pMaeGVFe+ZIlXxHvQOzGXZB42JY8Thq946x7zMeIerEiAzGMBZp0uKz7XtxXRghdjR88cUZVYej
 cEPGiQalbO6wqQtH4rt3QMHeLpQikFWXaiJ97+lHoS0hyvnuuThWfc4LH/bS5sfpgv9RVGDptoN
 yJpha2T/atXEJeCRuy7gpj46SqvigVtIHKAB+Wl59KIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101679;
 bh=l97TtMy7x+yYt7ekyvNFTrCiW2KW55M+lbA28Kc94gs=;
 b=EgVP6vG27fF5hDSmHXNWMYy9esAIfzbqfJ4lGgohRl63i0okdrCwu6Mk7ZLopHLkl85fd2T4m
 mV0fOv3WpDUTWnHEjWjkEwybT9m0qQMdk/ryWYdfScQ3d1mV/YVIXPJvIf9O4Y9EDhRqxHm0ck/
 En2WPJgBEctlB9huF8dmCCo=
CFBL-Feedback-ID: 6aff13eb83f3cb488062baa0:7efa6f550ad28fee942e68e7188c25ae
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13eb83f3cb488062baa0
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.33
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
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 4/8] ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus boards
Date: Thu, 19 Nov 2026 15:20:47 +0000
Message-ID: <20261119152055.556266-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119152055.556266-1-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_072120_060801_616FF6E6 
X-CRM114-Status: GOOD (  15.48  )
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

Luckfox Lyra and Lyra Plus is powered by the Rockchip RK3506G2 SoC,
which integrates three Cortex-A7 cores, one Cortex-M0 core, and 128 MB
of DDR3 memory.

Link: https://wiki.luckfox.com/Luckfox-Lyra/Luckfox-Lyra
Link: https://wiki.luckfox.com/Luckfox-Lyra/Luckfox-Lyra-Plus
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm/boot/dts/rockchip/Makefile           |   4 +-
 .../dts/rockchip/rk3506-luckfox-lyra-plus.dts |  31 +++++
 .../boot/dts/rockchip/rk3506-luckfox-lyra.dts |   9 ++
 .../dts/rockchip/rk3506-luckfox-lyra.dtsi     | 124 ++++++++++++++++++
 4 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index e9f9e0ac3bfd..df620116bb2d 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -45,4 +45,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3288-veyron-pinky.dtb \
 	rk3288-veyron-speedy.dtb \
 	rk3288-veyron-tiger.dtb \
-	rk3288-vyasa.dtb
+	rk3288-vyasa.dtb \
+	rk3506-luckfox-lyra-plus.dtb \
+	rk3506-luckfox-lyra.dtb
diff --git a/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
new file mode 100644
index 000000000000..c8991f4179bd
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+#include "rk3506-luckfox-lyra.dtsi"
+
+/ {
+	model = "Luckfox Lyra Plus";
+	compatible = "luckfox,lyra-plus", "rockchip,rk3506";
+
+	aliases {
+		ethernet0 = &gmac1;
+	};
+};
+
+&gmac1 {
+	assigned-clocks = <&cru CLK_MAC1>;
+	assigned-clock-rates = <50000000>;
+	phy-handle = <&rmii_phy1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth_rmii1_miim>, <&eth_rmii1_tx_bus2>,
+		    <&eth_rmii1_rx_bus2>, <&eth_rmii1_clk>;
+	clock_in_out = "output";
+	status = "okay";
+};
+
+&mdio1 {
+	rmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
diff --git a/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
new file mode 100644
index 000000000000..b7f11c7c510f
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+#include "rk3506-luckfox-lyra.dtsi"
+
+/ {
+	model = "Luckfox Lyra";
+	compatible = "luckfox,lyra", "rockchip,rk3506";
+};
diff --git a/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
new file mode 100644
index 000000000000..d02d3a18b052
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "rk3506.dtsi"
+
+/ {
+	aliases {
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
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-recovery {
+			label = "Recovery";
+			press-threshold-microvolt = <0>;
+			linux,code = <KEY_VENDOR>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&led1>;
+			linux,default-trigger = "heartbeat";
+		};
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
+	vcc3v3_sd: regulator-3v3-sd {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sd";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3>;
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
+};
+
+&fspi {
+	status = "okay";
+
+	flash@0 {
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
+&pinctrl {
+	leds {
+		/omit-if-no-ref/
+		led1: led1 {
+			rockchip,pins = <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
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
+	disable-wp;
+	no-sdio;
+	vmmc-supply = <&vcc3v3_sd>;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.56.1


