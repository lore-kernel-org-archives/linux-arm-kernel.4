Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48652606D818
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RIw8Gkdu;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=j66VxG5p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LOpRR3SM0gOpsUi1esldJeDTln8WrcBJiq5/+cZZX3s=; b=RIw8GkduAEQEbo
	EBMgP/nZv8QZ/oXMcdPWDfFE7XedSmiuROgmcGHVxCHhOrfN6d2qgcEpd59PccqTmRfY41aBAvUW+
	mR65GMY9RPAtmHstu91fOvwHLTbDVBqDIndg6jHdSVivNHsrrQ6aKpAGfpDwpRiRTlu3BgVdzCBji
	vw1gACxR5LQwleeLnlbONKPWVro543n7AytVQCJKOWMYi2LnHrnQAueRCoQWLOA/6JbaWQw8o+2D5
	W6J/InQc4baBXfb/2Mn7LMnKQpqF4/l1eyMzzncWqRx3vk9Wzs7a0k5g0/MrJTIYglv9l028zhHp8
	9aVILQ5+H1StXzt0WV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRw9-0000000DkLj-3PNj;
	Fri, 06 Nov 2026 21:57:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRw3-0000000DkFi-0k1I;
	Fri, 06 Nov 2026 21:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794002240;
	bh=e/xBfo+fiNINWUlXj13cPgRnznqBSzqTdZXHzg5SYV4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j66VxG5pNKXr4HAG0pU+jMFrkDj3VqmNuXZYErJB+HvjBUZMiUa1gYIW0Hqp23kCg
	 jpOfZblExs1zvjSZaSueaj8Ebch2H72M3XVR5hMJlodiObxuhpF12e1c3m5WqctTEG
	 ZtKyVYkiEy1QjPhMF81GmFgGRMwyuWerywd2aiKBDYIKA3vyezr/Nzh+Furpn3COPg
	 pD2tKlhmX1eyhFaoSFaZeUQWW1pcAqXh3YDnyMs1usJu2g5dFKNvPB7z2g11hsAwRV
	 4y+TLZjiT7A4NqqXXvDp4lju7HNlWrW3yAu4pfO+zjQopwZ0dO+6wyNAUH5L0o9HKX
	 LmVOUR0WPVLHQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F04317E09FA;
	Fri, 06 Nov 2026 22:57:20 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 17794480031; Fri, 06 Nov 2026 22:57:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 06 Nov 2026 22:57:09 +0100
Subject: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-rk3588-evb1-dt-updates-v1-4-bdbe16223589@collabora.com>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3770;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=e/xBfo+fiNINWUlXj13cPgRnznqBSzqTdZXHzg5SYV4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGruTT+exGRRuRDMIgsWZ1FSOXAbWHue0ck1t
 FQpv1U5xPgG+YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7k0/AAoJENju1/PI
 O/qainQQAJvg/Sj27GTzm9Dpix8sk0RKE12I4rGRqKfEtzM/DKs8dbSdF+O8VZJjERT4q3r/j0b
 s8yu7o3cEx1rIxnD8V1RdAt3eQTzUVXYUSDFjpa3148K6XSOhnkhVs9KQsJa2EQGj+3nvvCgEmw
 AfegsR+NpqXCDp180WTfrMu/d3rZ+CSssJ3Og3P+oUK+tkYSwFcnMapGgHrHDmxRylUbib926wa
 1v1sTZktU/2BR10nyThK2GMAFxN534Kas2RN8cjqfRjrFt8C/oOQMCqNZhDntyF7SEPUvluIWQ7
 wHSzD8BheG02Me9g4YeguhJ54ujgiG1EzRX7aeGTYm1LxxojO7Pyj6ahivQ2L3o/sEwcWjncuKr
 EkDPbzOqFDlHFciRFMPrILq5c8AksGQWD4E4HyiNP0SxOerGTP0dajnZfDnNaCyGTM3YT+BfPxQ
 s83DDFXiQx+9CFNWRinKWkujVU+i4tfDM3qeUC6xQPLrIIORkohmHNBBq/Vw8bouwUuH2Kf6n0z
 AMNh7JwRqUVoOnd0+4OIyQ2WzKxRbRo97Hk2uWbiEwoISHVzr+s/yckf/9R5tVT743102M+px4C
 sAzTIoXQipxZIU/Z8Glga2ZegoU8oCOblwvcE6pXhurIWu05tcDtb6iMuGh9P3GnHhuimbqJwkz
 ddPyISLQ6gfy2mSgDP0cpXg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_135723_795226_0878860E 
X-CRM114-Status: GOOD (  10.61  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RK3588 EVB1 comes with a W552793DBA-V10 Touchscreen/Display
combination. It contains a Wanchanglong W552793BAA panel and a
Goodix GT1158 touchscreen. This adds the DT description of it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 90 ++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 6a95a8bb6fb8..327ca13b60f0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -204,6 +204,15 @@ vcc12v_dcin: regulator-vcc12v-dcin {
 		regulator-max-microvolt = <12000000>;
 	};
 
+	vcc3v3_lcd_mipi: regulator-vcc3v3-lcd-mipi {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_lcd_mipi";
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc_3v3_s0>;
+	};
+
 	vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3_pcie30";
@@ -338,6 +347,43 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "wanchanglong,w552793baa", "raydium,rm67200";
+		reg = <0>;
+		backlight = <&backlight>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_rst_gpio>;
+		vdd-supply = <&vcc3v3_lcd_mipi>;
+		iovcc-supply = <&vcc3v3_lcd_mipi>;
+		vsp-supply = <&vcc5v0_sys>;
+		vsn-supply = <&vcc5v0_sys>;
+		reset-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
+
+		port {
+			mipi_panel_in: endpoint {
+				remote-endpoint = <&dsi0_out_panel>;
+			};
+		};
+	};
+};
+
+&dsi0_in {
+	dsi0_in_vp3: endpoint {
+		remote-endpoint = <&vp3_out_dsi0>;
+	};
+};
+
+&dsi0_out {
+	dsi0_out_panel: endpoint {
+		remote-endpoint = <&mipi_panel_in>;
+	};
+};
+
 &gmac0 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
@@ -495,6 +541,22 @@ hym8563: rtc@51 {
 	};
 };
 
+&i2c6 {
+	status = "okay";
+
+	gt1x: touchscreen@14 {
+		compatible = "goodix,gt1158";
+		reg = <0x14>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&gpio0 RK_PD2 GPIO_ACTIVE_HIGH>;
+		AVDD28-supply = <&vcc3v3_lcd_mipi>;
+		VDDIO-supply = <&vcc3v3_lcd_mipi>;
+	};
+};
+
 &i2c7 {
 	status = "okay";
 
@@ -543,6 +605,10 @@ rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+&mipidcphy0 {
+	status = "okay";
+};
+
 &pcie2x1l0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_0_rst>, <&pcie2_0_wake>, <&pcie2_0_clkreq>, <&wifi_host_wake_irq>;
@@ -664,6 +730,12 @@ hym8563_int: hym8563-int {
 		};
 	};
 
+	mipi_dsi {
+		lcd_rst_gpio: lcd-rst {
+			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	pcie2 {
 		pcie2_0_rst: pcie2-0-rst {
 			rockchip,pins = <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -692,6 +764,14 @@ vcc3v3_pcie30_en: vcc3v3-pcie30-en {
 		};
 	};
 
+	touchscreen {
+		touchscreen_pins: touchscreen-pins {
+			rockchip,pins =
+				<0 RK_PD2 RK_FUNC_GPIO &pcfg_pull_up>,
+				<0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	usb {
 		vcc5v0_host_en: vcc5v0-host-en {
 			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -1534,3 +1614,13 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
 		remote-endpoint = <&hdmi1_in_vp1>;
 	};
 };
+
+&vp3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	vp3_out_dsi0: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
+		reg = <ROCKCHIP_VOP2_EP_MIPI0>;
+		remote-endpoint = <&dsi0_in_vp3>;
+	};
+};

-- 
2.53.0


