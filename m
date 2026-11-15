Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED91A606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AoICRrdC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gG0vhh9/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VzAxZ0RnZAjE719KYavFE7LkkGQ9v4Zgw3d/Pw+Z9SA=; b=AoICRrdCCP4p8B
	yl4dS3cgExmcxdOuCJw3++Rz1WGnT3J9BxkxYRZDCd099VmM4Tso/kpBBmGpnzIKwfWPsqnteE78L
	P27UnDFofhODQGnwgzLlQTQn7s0gzWtN3j76xark6aiMW58GxUsvFCtPzlhwUA7/xRe9aYkgEZwje
	WXmZ1gh4riFVEm3GjXi/EOXkQQqHeOiDKKCjp6g76FGMxa0HpTKzGYKTlS5q33ZNetJdcAvGMgCYc
	PsiQyI4IWrj0gX/Vi4k+mZc2ymDJWxpSRUt3XZ41f6Gx0RpYcRpnsyckij2qQmO7KP4hccvjYLPcr
	W7qyCg0r7YY0Ub5S+D/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdlo-00000000ExS-2rb9;
	Sun, 15 Nov 2026 17:12:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdlj-00000000Evy-3KrB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 17:11:57 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso5966025e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 09:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762714; x=1795367514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzAxZ0RnZAjE719KYavFE7LkkGQ9v4Zgw3d/Pw+Z9SA=;
        b=gG0vhh9/cr2ZftuFO7eq6eqUa8SGDTQYjWLrPvvGY9O9CX0sWQYgLl0g7lu6fNZiQg
         qIpplOV0zWjph0atPMIzrPb1+RVe7dg+OiX0u/T7wfUK9a6pbrxBHkBx/2CMwk9MwT6+
         1S/EJCwCNKkbh9t61xTL5kOurcpO3Ga2nyTYRupFdF0aBnFQPjB1r0Z1xlRs2kBMfv8W
         xXAcdINaXnvaP3zyl3CNRIS92+CaGcQo+1QLl0eFMU1k6XNZmW0bGsTsFGtAHxE7qSdN
         W93LH8qt/OjftKZK9BN3niBL879+kYeZhABL4cYovDki8wOWFS/lT7tH+Y3fQlMvHlc9
         zRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762714; x=1795367514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VzAxZ0RnZAjE719KYavFE7LkkGQ9v4Zgw3d/Pw+Z9SA=;
        b=SzbMViS2orYgw/+VWwsRM6MeYkUKXFdNlnresF/VIVP/imEYL8BgObFGuzHSSUHt6a
         AbClt8bKtNc2bNC8pYjtfVebbhuzkNdUzC/fuU/bLoeFyx1il8+BMkzibvL+EizeNDW7
         tqZDPLNw8AVPIDityherAhT5kkMT6gHCzS2CGdl7hBRcAPia3wY3B75UCYfTVlbTtC2G
         eG3fYhpkze2ZOCFjaU2W0K8iKzkZsicA1ZZ5Mccn2tvmbtYv1zfXQD++B/8KP/yr55IL
         U7YK8/sxGnYd8UtpB9iX5ztuWpzPfUUsdVOl8pkFbIqhJqqoDJwoEA92E1aPcw0jyKX+
         hgIA==
X-Forwarded-Encrypted: i=1; AL+hErFA1N5/rxTJ3qpgBcRcftGUotXq3ISnlo4Uo6RvLTP42tv3gVl9hr7lqOFg4Xo6G9HAE1Yir39xL0VKGYy7CzLh@lists.infradead.org
X-Gm-Message-State: APuU4Z9E9o+xgLcy9okxcD8VGYf4/hzYHjWsSjAG6YMNwyZIaotgx8yB
	VhNtEAnTQMaBUVxDseYuVoGlNeP2OwpMNRmg64MJ2CxVbn40m/+MLiJY
X-Gm-Gg: AYBFou13cmlaRF9S/b2GoK3c8uJZCwkHv/43c18YA7lMfoU6YlIHEM207bWYhucR3aH
	Xj3CoBGlQfkq6HJxooD/eg9mPMzeAvZ4OSkv6+M0heLDvhivfsV90LiAyWVQwXsukXohrp/95zz
	3+LMq3UkroBrdiS+FM3M3IGuCvWJgPTM+6cH1+UcZl2uACRrIeB/UXxHQb7/OARexPFOoSpLaz3
	Rg/st0/UN4kbVNtoNlZyVsvsFTV8NZoUWux5LQbmWGfd8UI9MBBHMGrBdVqOUw0WsKSlfuOFpCd
	ryMdInNn9e40e4PzAcXG3YUbf3mRIOhbEzpM4b6GJrSoaJFZ2udDEO0acCihaNLZSPgL3Ns/BTn
	rUlnitcx+4IyRW4IryukoKEt1jAqluYk05ku5+DEs8r71Nyqezsi6o98NzpkeOHf9RYY9ihZY/O
	GCfUyegpO66r5icTncw1z3vnSU9Lv+0m7vp58Z/OFgIIJVilhLGK8ijxCIF4tfeHbdnKGyRM9gT
	adLyqRDHfWZt8cgTxfO26XoBM7A9TUqIs+JbboH0KalvEEX8ZEl+3e9hEVP2Kcmcmb3Kb4WGOXd
	UXN5TPuzzFdHoEcM1bGPq+DSG3k9iEaG6JMAq8m2KZWBF+VDpH6Lk1WksLZBc32I7kgAjGDCziE
	vL/zXYB0VAjrPfD+g8MWut9j8D6/f8TM9rVwEENwqbixtzTiYjskuNiTjhUC/gJWA8xVDhx6iZ7
	reF0smjpHBdHw9YydkRDhQRMpHh8pdpmy4eJ2sXBcaaR/4zFXjYLcF88Fq2c9VHV5PMzRO0+0Rh
	LOeji7Gm/2Dyg==
X-Received: by 2002:a05:600c:1906:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb55ac2a34mr189672185e9.17.1794762713782;
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm501415845e9.1.2026.11.15.09.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
Date: Sun, 15 Nov 2026 18:11:47 +0100
Message-ID: <20261115171148.37784-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_091155_862551_67E9307E 
X-CRM114-Status: GOOD (  13.90  )
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

Every H6 package contains an X-Powers AC200 die next to the SoC. It is
controlled over I2C3 (PB17/PB18), takes its 24 MHz reference clock from
PWM1 (PB19), and its Fast Ethernet PHY connects to the EMAC through the
RMII pins on port A.

Describe these parts in the SoC dtsi:
- the I2C3 controller with the AC200 at address 0x10 as its child,
- a pwm-clock that runs PWM1 in bypass mode at 24 MHz as the AC200
  input clock,
- the I2C3, PWM1 and RMII pin groups,
- the EPHY calibration value in the SID.

Everything stays disabled. Boards that use the AC200 enable the
pwm-clock, the PWM and I2C3 controllers and describe the PHY package on
their MDIO bus.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 53 ++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 48c771223af4..5e48b35d13de 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -17,6 +17,16 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	ac200_clk: ac200-clk {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm1_pin>;
+		pwms = <&pwm 1 42 0>;
+		status = "disabled";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -314,6 +324,10 @@ ths_calibration: thermal-sensor-calibration@14 {
 			cpu_speed_grade: cpu-speed-grade@1c {
 				reg = <0x1c 0x4>;
 			};
+
+			ephy_calibration: ephy-calibration@2c {
+				reg = <0x2c 0x1>;
+			};
 		};
 
 		timer@3009000 {
@@ -388,6 +402,11 @@ i2c2_pins: i2c2-pins {
 				function = "i2c2";
 			};
 
+			i2c3_pins: i2c3-pins {
+				pins = "PB17", "PB18";
+				function = "i2c3";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
@@ -414,6 +433,19 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			pwm1_pin: pwm1-pin {
+				pins = "PB19";
+				function = "pwm1";
+			};
+
+			/omit-if-no-ref/
+			rmii_pins: rmii-pins {
+				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
+				       "PA5", "PA6", "PA7", "PA8", "PA9";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC3";
@@ -626,6 +658,27 @@ i2c2: i2c@5002800 {
 			#size-cells = <0>;
 		};
 
+		i2c3: i2c@5002c00 {
+			compatible = "allwinner,sun50i-h6-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x05002c00 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C3>;
+			resets = <&ccu RST_BUS_I2C3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* AC200 is co-packaged with the H6 die. */
+			ac200: mixed-signal@10 {
+				compatible = "x-powers,ac200";
+				reg = <0x10>;
+				clocks = <&ac200_clk>;
+			};
+		};
+
 		spi0: spi@5010000 {
 			compatible = "allwinner,sun50i-h6-spi",
 				     "allwinner,sun8i-h3-spi";
-- 
2.43.0


