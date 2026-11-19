Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD63606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aZacgkNj;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=hX2b4MKc;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=ljolNwnm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=enTEOHvfW4nekSyq09ifSasy3xLT4hReQ5Lq4FUBa4Q=; b=aZacgkNjw5SMmU
	w7mkS2sRdGjuBLyKyroZQ4/KV0foEiiJMetbv2zlSdvzTagHe4MuU6Oi3YpLDEARrNc5DYzpZlUG4
	uQC4yRZ8Y4jlCL7bGPmGG/1V/SvhTAZbqVhWabIv+PnMBF95OB0irAosyMoiDlgtZV2qINt+tzjaB
	4WqM29OdEh1qdcqPFdzD7WXKjiHUR0TV/+0zA123UljRGK0I1RBW0m8TdxGZo0p+5c5qDO5t/nK8W
	4Iim4XlKoUqBxqEIkkLxp9a2kFnTdYcoQJHtNS4+jr4abkEgfGKAGjGfBQGOwJg8n98+abuZCHpND
	N6ZCpr0fT/AHJSvk1J2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU12c-0000000Bori-0AsN;
	Thu, 19 Nov 2026 12:15:03 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU12U-0000000BomJ-2suE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795090494;
 bh=enTEOHvfW4nekSyq09ifSasy3xLT4hReQ5Lq4FUBa4Q=;
 b=hX2b4MKc68kE1XmYEkadPB23WZKVBLLdnFXgVhzLvFMvZ9vfIiSLrBiER6pWPfc1sNfchXM5X
 ftkZ2GEXlMtguzWLErf5uqEY5LNGvUxRZ7P7YPireESLVmTmQZ/z7dEWCmKugCN2RU5G2fLMkqN
 q/gQBMLQ1hAkeh1C+5VAwc5DOORtTduJzMe6TZ06TSFyOniWMpZNd/K93scdIUZWk9cZefRI1i0
 WemMYWcrQxtOgK2jjC95ZJ545UxdZOOnuiWIrB48FiAkwcKlzjRw+zVPkHa0ujCkRUmvfSVJB71
 Ir+E/KkaySEluztyujtx6XN3NNKW9EU7q5pv4F0UEVYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795090494;
 bh=enTEOHvfW4nekSyq09ifSasy3xLT4hReQ5Lq4FUBa4Q=;
 b=ljolNwnmAkGfBPlLlEygThULugtJj2pg5kVKZWJBJNKx+p/1XhXU4CP16YXbaIBQ4mX3jSb/Q
 QHdQpCjc0S/0QLa1le1fp29l6lmsIYWBgA9nwcaJrB0iYS7Th1QJGGJ7FLjEbvuhHf/PwhviUcW
 lpECbfLkFWFS5uECyQXJMoA=
CFBL-Feedback-ID: 6afee839d37bc4966df1610c:2b3daeb54761424bc43b799f7a8619b6
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6afee839d37bc4966df1610c
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
Subject: [PATCH 2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi NEO3 Plus board
Date: Thu, 19 Nov 2026 12:14:32 +0000
Message-ID: <20261119121433.550704-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119121433.550704-1-jonas@kwiboo.se>
References: <20261119121433.550704-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_041455_025269_DF5F743A 
X-CRM114-Status: GOOD (  13.60  )
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

The FriendlyElec NanoPi NEO3 Plus is a compact headless SBC based on the
Rockchip RK3528A SoC. It shares most of its design with the NanoPi R28S
and NanoPi Zero2 boards.

Specification:
- Rockchip RK3528A
- 1GB/2GB LPDDR4/LPDDR4X RAM
- eMMC module socket
- MicroSD slot
- Gigabit Ethernet with Realtek RTL8211F PHY
- 1x USB 3.0 Type-A host port
- 1x USB 2.0 Type-C device port
- 26-pin FPC GPIO connector
- 2x LEDs (SYS, LED1)
- HYM8563TS RTC with battery connector
- Fan and speaker connectors
- Debug UART and buttons
- 5V/2A power via USB-C (non-PD) or 2.54mm header

Link: https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO3_Plus
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3528-nanopi-neo3-plus.dts  | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-neo3-plus.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 3df63c35b4bf..bfb1a232e414 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -96,6 +96,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-hinlink-h28k.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-mangopi-m28k.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-neo3-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-r28s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-neo3-plus.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-neo3-plus.dts
new file mode 100644
index 000000000000..26f7aa4fe1ae
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-neo3-plus.dts
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3528-nanopi.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi NEO3 Plus";
+	compatible = "friendlyarm,nanopi-neo3-plus", "rockchip,rk3528";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio4_b2_usr_btn>;
+
+		button-user {
+			debounce-interval = <50>;
+			gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+			label = "USER";
+			linux,code = <BTN_1>;
+			wakeup-source;
+		};
+	};
+
+	vcc0v6_ddr: regulator-0v6-vcc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc0v6_ddr";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <600000>;
+		regulator-max-microvolt = <600000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	usb_host_5v: regulator-5v0-usb-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren>;
+		regulator-name = "usb_host_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&combphy {
+	status = "okay";
+};
+
+&led1 {
+	default-state = "on";
+	function = LED_FUNCTION_STATUS;
+	linux,default-trigger = "default-on";
+};
+
+&pinctrl {
+	gpio-keys {
+		gpio4_b2_usr_btn: gpio4-b2-usr-btn {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
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
+&usb_host0_xhci {
+	extcon = <&usb2phy>;
+	status = "okay";
+};
+
+&usb2phy {
+	status = "okay";
+};
+
+&usb2phy_host {
+	phy-supply = <&usb_host_5v>;
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};
-- 
2.56.1


