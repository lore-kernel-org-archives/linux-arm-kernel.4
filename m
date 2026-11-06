Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B576606D803
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T6FAjW/d;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Y0OFJrYE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sWWjal4kg7Bb+zbbKRMSSMoIbhDieiVkL3VfmhZSjks=; b=T6FAjW/dtsS+Nn
	52qvsE9Z6nCvv8eZUKj7u7F/NyaJjz7WOv7Ci7a97HmhcgVtuth6It7RJj5kOvDbZPAmpkJnGQ6hu
	MPK/cXl0WEy+sloqipriOmEciN9/9EmU6XO0/SYih/SmoRFRZXRUuS94fbYzAvO9I8S7ulPT7EYRU
	J0x2bqfkoPifhCVdXDfp1C4B6IRdry2TaY63oFZHdZqGWv+TT7b78yLiqFGsqMYXIgljL5qLhjMHp
	iOgFGM5/vrcMO7FUwvfbmx7rpC5+xXKfjSl/qFzlnuzRAftBUahuta/h+S/QE66Zs1VFG7ljQckgU
	ndZx5/RHS4pxIYSVXJfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRwA-0000000DkNF-1Q4f;
	Fri, 06 Nov 2026 21:57:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRw7-0000000DkHB-0GHA;
	Fri, 06 Nov 2026 21:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794002240;
	bh=KU/YEFe4JzRFcgmGM8I2qV26IQDEGg/npT6S9CcZluo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y0OFJrYEBo/ZQ67iXHxq68DAVcxSc/5yJ65BxIMtmzxoi6mIORZMgZo0OSnbpeK9W
	 F3k6upV8o8u3wonv2/Bc21V5yWa6Oo46Vz6D5UtXwL6oyVP54EMV6hCy54YSWpYdZ5
	 zFprHrXSAkKITZVb3Ue5s3YcCvAU/OsLOhZPFqj+sFIJOtvhpeRLSD3PyWmlsO7tRG
	 yBFAdKOLn077SceHMW05PzJazRH8qpcQnlGpltvZFipyyt5PvyUNq5oOgnpKiwbSD1
	 nY1HpfIGbhIpG9JLdNf/4Zc986KZoQVMDrJAFTW16L6aZ6zjFImgY16Epq5wj9eV7C
	 H/NFutHBdiGJw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A910517E0A80;
	Fri, 06 Nov 2026 22:57:20 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 19411480035; Fri, 06 Nov 2026 22:57:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 06 Nov 2026 22:57:10 +0100
Subject: [PATCH 5/5] arm64: dts: rockchip: Add Bluetooth to RK3588 EVB1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-rk3588-evb1-dt-updates-v1-5-bdbe16223589@collabora.com>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2510;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KU/YEFe4JzRFcgmGM8I2qV26IQDEGg/npT6S9CcZluo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGruTUDhUQVicPoNxtxccVrec0dAAQEnlbepf
 Z4vNAZIrbhsJokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7k1AAAoJENju1/PI
 O/qaWycP/jrWeVm6udq9KbIRARBPUsUY5H8nx4/zJ59EvCTZ0ELerG4Mp+NWNlMs3HtbqwUtbd0
 COZCYCtnI25b0kRefTr2GOJFk6qmWnVguUlbGB2Wlr4Sqr+3WSngSdDYZ26cxBbsEiOMeZPOP7o
 J5ckOgx8/nx4Z9Sc1FFoU2yGzqtwKwAI7F/UD5ryLVazmILZSWiSRkgxkNsdrd8Chm6iR4WSfO9
 Z0kJ4Aq7prDbDCYuwzPnBW85MtapNLhYBUC/Tze9z8j0Wf6QfsZISfmP6shagUDs6Hbu8qaZk2p
 qiPzhMQ+OwT3M2aHFUKQMzwY+J4sayWdurhmnFVs4CoG/zmdcxgjqK3qAlrEgsKV6DrYI2noIyI
 Cg8Zj5FSEUBxjBhlJ/+T00VQISo96rmS3RnNiwysDEfZTrMvNh95QyBCIGwmfv/nYl+5qQkFNOU
 LCr2aHFApUjimDjhhcBCTNzvHVDSjk9ZBbf+AcVsUq1iSLEbSZMGLnC4pJYlJhi0dVA7uiSqgeJ
 dsINdbO+nAcaWwRVHW+oLaIOuyo/TZLmhWz0D6KUDHt9Vq7f6A9p/+zfvGJS6WsNifN+G5M/tgO
 Ueej5Cwc6FcUxQ5T4Cp/pVRNAOwNu+NzXJyOjfEijP+imyQXfe846m2rxHnrQEvrWtZ+VIj5V62
 a/B/iTW3EsUblJCSbm58plA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_135727_366591_F496CA7B 
X-CRM114-Status: GOOD (  13.56  )
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

The RK3588 EVB1 has an AP6275P WIFI6/BT Module. The WLAN side is
connected via PCIe and already described. This adds the BT side, which
is connected via UART. BT is also connected to I2S, which can be used
for BT audio. By default BT audio is routed via the HCI UART interface
instead.

The added I2S complexity is avoided for now, but would require the
following steps:

1. Setup "brcm,bt-pcm-int-params" in the bluetooth node
2. Add a simple sound card for Bluetooth using &i2s2_2ch (using default
   M1 pinmux) on the CPU side and "linux,bt-sco" on the codec side
3. Extending "linux,bt-sco", so that it supports 2 channels, because
   the Rockchip I2S hardware cannot output single channel

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 327ca13b60f0..f578e7dd5aa1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -695,6 +695,20 @@ speaker_amplifier_en: speaker-amplifier-en {
 		};
 	};
 
+	bluetooth {
+		bt_pwr_en: bluetooth-pwren {
+			rockchip,pins = <3 RK_PA6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake_host_irq: bluetooth-wake-host {
+			rockchip,pins = <3 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake_gpio: bluetooth-wake {
+			rockchip,pins = <3 RK_PA1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	rtl8111 {
 		rtl8111_isolate: rtl8111-isolate {
 			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -1522,6 +1536,29 @@ &uart2 {
 	status = "okay";
 };
 
+&uart8 {
+	pinctrl-0 = <&uart8m1_xfer &uart8m1_ctsn &uart8m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio3 RK_PA1 GPIO_ACTIVE_HIGH>;
+		interrupt-names = "host-wakeup";
+		interrupt-parent = <&gpio3>;
+		interrupts = <RK_PA0 IRQ_TYPE_LEVEL_HIGH>;
+		max-speed = <1500000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_wake_host_irq &bt_wake_gpio &bt_pwr_en>;
+		shutdown-gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc3v3_pciewl_vbat>;
+		vddio-supply = <&vccio_wl>;
+	};
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };

-- 
2.53.0


