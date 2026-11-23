Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7065A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YDeMS0BU;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=BJWhJ7WD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Uwx0NG3uKtnrDSAtqR9l2sngz111pr86ksoehzxrkGc=; b=YDeMS0BUXTm0V9AEf8GV0LWbP9
	Zg0p2zv5H71oV+QseenOqQWIs4wthGLx0YXHfQvcSW21dTClnDhzUXCe8qLF0fly1xYSnepvv2kxh
	Kb948mZrD2xpm08Ds8CfkelU45/Sdr2U2X1RUhGOUlKSmFsju7d6nbDQWmmQrx3fhiCOZcw5JYy4K
	l4XdQ2NnmUtCfN+zsbasqZaKAsCyNx3e9p7eWXL+N4y0ebYiWodZXllwzYh7QAljHP8mq4RUrqZ28
	PPiwCkgWvfPbpBjAnum3ODGYKDgCsRwy7XZ+104PAcKZxIVvH58EWNO7p7fzCfyKMkT0cFHbaaI6B
	gXQC4QPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRgV-000000033F7-3Xqe;
	Mon, 23 Nov 2026 10:54:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRgT-000000033DL-2Uv8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:54:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso37761705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 02:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795431243; x=1796036043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uwx0NG3uKtnrDSAtqR9l2sngz111pr86ksoehzxrkGc=;
        b=BJWhJ7WDrewjysDtS2ilhnrA/ihuAw5ryoGbnPauSvv+brWlVycSm74VRe5KN3aN4l
         UhSC/2VqVRISSBrCsedR09ioavKOcgZa0Bv6Jcwzhyew46TtY7FIfqub0ujpHmRMccIr
         rvBBILsSpl9FwLIOCAzuW6XK35lHfdVDxZpoGCDR+fAqYHht4rbinNppQPAljdszhvlj
         hIH3rdFsg+oPhTZ2gRvcK9KLy0U1HdpSEAlHdH5FeEgcySTEB8w31taJMzuyC0lmtQxG
         BHb06Blm+dlqOf6qr2INmp7gBC/M5uDmd94IcXKM7l6vyd6butzzndvfqNE2R9edhOq6
         CyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431243; x=1796036043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uwx0NG3uKtnrDSAtqR9l2sngz111pr86ksoehzxrkGc=;
        b=VUf8SgH2+977dyTEncHQLwcdu7jhvHSFAydp3P6v8cNzE8hNQH/bAzCA1lKMkIb4Yw
         FQmIynH48gll6H7EJoYF7DGNMZVt2KrJtAPFT09zT9qiO5e4VCfKVQsE2E8rinyB0f18
         01DAFREQtP3UV8U7wDzcHBKdH/6OvamstVuoSr33H0mgxmzMQ7mXTk+to+J3AUhzxM6q
         MxM71WO4sIdw5eSdOmnUvfapBDZLyn70Q65oLoEQb6PFvvENDqYuWNvzX5w02b91ae20
         zsU9pu+TRV+lBHaj7Bkp2AT4jlLqjz5JqeOUh5uDXru3mPam/7Tuxc6f5v/mxjVv6FF3
         fVrw==
X-Forwarded-Encrypted: i=1; AL+hErE0THIYUGxHJ5pxAl6Fa5dGvuePjzCn1BC3odmQzBGxuJGmZEYCJ+LKociLP9RspvnE9fu9XThSczzvTZYfqJ9N@lists.infradead.org
X-Gm-Message-State: APuU4Z+9cKUDfwLplGQIdikOHPOattpRH+2lmHNayhtdUBWI1CX00hOB
	VJExtPeiPJkDPVTEQpWwI+x/F6BzwoY+nVX13qaQeZC99kWZ78oqnq+k47BJJTTu
X-Gm-Gg: AZFdTZcFx9Y8nFGsgRmfKjReYDQlQPjeoK9MeS2YzaZbhXpnUt/jZmjd80UeyoFNGQs
	aOF5a01O9STCAUBu3gy2OWqrOz1/25ZkdH+ZzDPVSZa/8RwlA1GliNe32bdA+zsp9+yxL0zq2Qp
	ALuEFWCZg1HmFoA3Rjpa6pBfXwBR5zI3Ve5bDh9IzTCWTYHpxJ6iuIS1ZQRxE0hur/cxbri4Ekl
	a88IMUswhiT1j0UipfIDtrflo5p7rVeap8wtkus7+RQIb5K+bFHUAffBwxlLXX9f26ANSzyuF0W
	tpbIIRWcvjyeJqwmWrbOZpdTZN6lRFcUewEdl8A7mT4DQEyf4j9/23dkOYsmp2lDdAGeUGKhyL0
	LDRSdFL0ZSRI3t2b3WR/L7AlfF/L86C/Tlmcno2Km92CJGc6/B6/sb1V2+KREfWQXBQ/tl2f/H5
	PbkJfeb6wWb6QBHlNmnh/tEiluPADHjS1m2y1lqg0ertkZS2zrLdIl6TWzaj9N9LHTh6IftzQYj
	lvkFyMPAGBN+9k5lTXvJK2rdsCf/u4T+ANTCZ7tFgav3F/SpsuwbSm2PmXEXiNNdUV9/wkVHbIU
	63DLATlhWEjSnHkkhNt8RbOZhhMGWwpMe4nQt5XZ5UsSFVRkwSQLuUNj+y56NB3YpcHxr3JEbx9
	Ubek4CZyMcv6ua0AeV74N9tA01Jw6RbPDxRw=
X-Received: by 2002:a05:600c:5395:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb8880ca2fmr222661655e9.20.1795431243355;
        Mon, 23 Nov 2026 02:54:03 -0800 (PST)
Received: from nixos.speedport.ip (p200300facf0c97e239628f9633b68e4c.dip0.t-ipconnect.de. [2003:fa:cf0c:97e2:3962:8f96:33b6:8e4c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm332544245e9.6.2026.11.23.02.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:54:02 -0800 (PST)
From: Cenk Uluisik <cenk.uluisik@googlemail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] arm64: dts: rockchip: Enable Wi-Fi and Bluetooth on Orange Pi 5B
Date: Mon, 23 Nov 2026 11:53:58 +0100
Message-ID: <20261123105358.640680-1-cenk.uluisik@googlemail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_025405_651566_963EB2ED 
X-CRM114-Status: GOOD (  11.87  )
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

The Orange Pi 5B carries an AP6275P module: a BCM43752 Wi-Fi chip on
PCIe plus a companion Bluetooth chip on UART9.

Describe the Wi-Fi side below the pcie2x1l2 controller. The module's
WL_REG_ON line (GPIO0_PD0) is modelled as a fixed regulator and used
as the PCIe 3.3V supply, and the PCIe reset line (GPIO3_PD1) gets its
pinctrl group.

Describe the Bluetooth side on UART9 with hardware flow control.
GPIO3_PA6 drives BT_REG_ON, GPIO0_PC6 is BT_WAKE, GPIO0_PC5 is the
host wake interrupt, and the 32.768 kHz LPO clock comes from the
hym8563 RTC.

The plain Orange Pi 5 has no wireless module, so keep these nodes in
the 5B device tree and leave rk3588s-orangepi-5-5b.dtsi shared with
it untouched.

Signed-off-by: Cenk Uluisik <cenk.uluisik@googlemail.com>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
index 8af174777..384a70e4f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
@@ -12,8 +12,96 @@ aliases {
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 	};
+
+	vcc3v3_wifi: regulator-vcc3v3-wifi {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PD0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on>;
+		regulator-name = "vcc3v3_wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+};
+
+&pcie2x1l2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_2_rst>;
+	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_wifi>;
+	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x40 0x4f>;
+
+		wifi: wifi@0,0 {
+			compatible = "pci14e4,449d";
+			reg = <0x410000 0 0 0 0>;
+			clocks = <&hym8563>;
+			clock-names = "lpo";
+		};
+	};
+};
+
+&pinctrl {
+	bluetooth {
+		bt_reset_pin: bt-reset-pin {
+			rockchip,pins = <3 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_pin: bt-wake-pin {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		bt_wake_host_irq: bt-wake-host-irq {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	pcie {
+		pcie2_2_rst: pcie2-2-rst {
+			rockchip,pins = <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wlan {
+		wifi_reg_on: wifi-reg-on {
+			rockchip,pins = <0 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &sdhci {
 	status = "okay";
 };
+
+&uart9 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart9m2_xfer &uart9m2_ctsn &uart9m2_rtsn>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		interrupt-names = "host-wakeup";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC5 IRQ_TYPE_LEVEL_HIGH>;
+		max-speed = <1500000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_wake_host_irq &bt_wake_pin &bt_reset_pin>;
+		shutdown-gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc_3v3_s3>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};
-- 
2.56.0


