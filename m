Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F6A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QTNR+mVc;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOwsBQAd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LRF5QTWppdjUyNg9f7oWi7JO8GIaHo80pSnFUSRChkM=; b=QTNR+mVcO30IdVqBCzWrBceJhk
	5IxOIml1iQK7eYeueNqrK7cXTnUbcamaFB28c7sPPSEqDa+s9abTOaGBZfKmglsPIBQP1mdd6Otc0
	E2tuwuosxg6I+Vbg7tjvfifqC8KpDiGHtmbcZTRK11+14/vJRjSH8wpazCTKLaY1AtM/dgahsCUya
	gNIdSnK57rIcEg+UhefdOvPKmHWPDljLUyTMsxyJ+23/eGo2/r68sAe6GfRKneCuqOPCWQa5R3ve9
	yfWaYdem62+d8OrtuyRAfjg4kHLp/XRhEkOiAs7mQjpe3nUZcHLAJg1Mzh7ArEs+RQeBN3+8gw5IC
	kNErIQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCpr-00000009xPX-1K9D;
	Wed, 25 Nov 2026 13:14:55 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCpo-00000009xOl-0t7u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:14:53 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-7d2bf046d7fso3261592137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612490; x=1796217290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LRF5QTWppdjUyNg9f7oWi7JO8GIaHo80pSnFUSRChkM=;
        b=iOwsBQAd4qw/DPRnTdWOOeedZ+PkMpHGnaro+0G0aE0nhttq3qhjiFbN91JWRPxuv6
         cSC7CMVl9Fe4ZVetWhe2rH3ahF88/msa1CHmDcXKBnAOSDtaLdUqFjgpzuLT5hyNGJGY
         y8AveDM4T0UEknT5SIYGVLnxPOIswxYUnHodirqueIATrhaULTCbIBsVaxkOVFH2a/BM
         JQtahiXkRmvud7pJpNteDQeKt6cANKPkI6mbs9typskXb7v7TLOYsJsN7Fw7ywPW0ld2
         fOQTZWfHZaV2iwVWiZvzVsITIdVIdEIlZ51CRgn5MgdAYCE0XyxyZQ+S2JFUHZUnHePH
         23Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612490; x=1796217290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRF5QTWppdjUyNg9f7oWi7JO8GIaHo80pSnFUSRChkM=;
        b=JcInkga7mMVfugb27OYyrDW3y2I6mTGDso4KfVRMojNw1kj4I1Hp41VMjZvc9Q2vaB
         Wwh/fVriQEKBE/EVn/U0/gB/l4SRV3aaL+5rlnexncfu1ioIZ8T5WoADEnsHGivtxj5t
         BPWskYVM1lehBzPrpTMLeGjdJV2ogtoN45AnQd8iuSNc7975bxGFPD4cirmXxftimyQg
         TnC08EdtXp8xwwftPIDTev3aXOtKLb1Py3r2BZ2GTAgA6EgI5uz2dNRNTF5BhAlXXrTo
         +vToVANXhEozfJwzzlLupr2OYhT6Yl4s3htXymXBemPFOzMIP6JY4cWJhDVJhOOjDGFt
         bhzg==
X-Forwarded-Encrypted: i=1; AL+hErHHZMCm8Wb8QJoO3pbHgJpop1doVDA5ey7UT6d0ysY6LQ5VKA84pOmOd+CN0e3O5FsNVZmiVh1JlOJIbv6OKJgj@lists.infradead.org
X-Gm-Message-State: APuU4Z89oWZNJGcb7jjFXTNVN4L6Tx+sn5WanF1XDOeA5K/rLNMDzizH
	VjMlO2s/8Y9mEMIAYJHc/TUFjb19OYAWylvsJ3Vdr4tcYjrleRXT7CHh
X-Gm-Gg: AZFdTZcIZ7csXLAuL+bouhvf+ruHPMNt8nfHVb4vFsABoIPUks+SQFJ5lqDBFMAJbut
	9mp+jp5MFzT+nVXuVyvv18JRp78/8jCFCGZQVeau4qlrLoSQ90ZfwU95VcL7CKia5deu/MqCl87
	lViI2cTd3wXfNINlPAUNNVObZy3dKb0Cobzdn/gFvXCjM0MOs3s2scOFdWgGVOf7vUvFmr3+Bk1
	IfqCsy/s5YuVW++ZZYeyWWSSky9aY+gNu337A9KZKxI2Wz4i1epE4gHVxjhH7+LAUTDx4JlHizm
	60XsOYvU+j34oeTLQd0NtgsKPVKJFKtmy95ATQfDtVsKoTAzjtOIJO+OvdHTd6ECe4+VgEf4g/7
	IBzUEo8bmvzLVbl9aM8FT1C6DcgHqLE2OoCYJnta25tvZz08HNFAMg6zDx31FbNo+so/Dwk/yJz
	s+l9SwMMcSdwDIV3bhM8v9BLFIbybGbc3+TLq+ZSnJbCb54vXlgcmI8WgmgRRW8ZJoawZHIVvvB
	sKo61G5LWnnMcTQFgEiufWcOapGwtxXY7SZkIdmtALveHEp/ShOgKAvs85ifQ3Z6BmwWh6mlX+U
	RhepBhw2lNmGsjk9kHrCN26bCpaCoSUmbeV/W2OGioBlIoB8yloHoBn/m/dmDOlfD+HBy+kYkF+
	RruusJ0VAzj8uEveyehaoHhv0wc/K7fVVA9YA00s7BPAJwKVg
X-Received: by 2002:a05:6102:f97:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d7396157a3mr8531352137.36.1795612490432;
        Wed, 25 Nov 2026 05:14:50 -0800 (PST)
Received: from localhost.localdomain ([2804:1b2:aa42:30d0:f600:3026:6717:b8b7])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7fa0467sm18908745137.6.2026.11.25.05.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:14:50 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: allwinner: add Radxa Cubie A7Z board
Date: Wed, 25 Nov 2026 10:14:35 -0300
Message-ID: <20261125131435.33190-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_051452_281051_8F9AF944 
X-CRM114-Status: GOOD (  23.19  )
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

Add the device tree for the Radxa Cubie A7Z, an Allwinner A733
board with LPDDR4, a microSD slot and a 40-pin header.

Enable the UART0 console, AXP318W PMIC on R-I2C0, MMC0, RTC and
green user LED, and describe the board regulators and pin bank supplies.

The device tree is based on Enzo Adriano's Cubie A7S board description
and has been tested on A7Z v1.11 hardware.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
Changes since v1:

- Fold the LED patch into the board DTS, as requested by Krzysztof.
- Apply Andre's MMC, regulator and pin supply review comments.
- Set DCDC9 to 1.24 V and use GPIO_PULL_UP for card detection.
- Drop cap-sdio-irq after Chen-Yu questioned its use on the A7S;
  sunxi-mmc already sets MMC_CAP_SDIO_IRQ.
- Update node names and property ordering following review.
- Rename osc to hosc to match Enzo's v5.

The A7Z binding entry is not included here. Andre asked Enzo to
include it in his next revision.

Base: sunxi/for-next at 2ba07dfcd45b, with Enzo's A733/Cubie A7S
v5 [1] applied first. The runtime dependencies are the ones in the
cover letter of [1], plus the A733 EINT-mux fix [2], which I applied
locally for the card-detect test.

Tested on a Cubie A7Z v1.11 with a v7.4-rc1 kernel carrying some of
those dependencies, not the full set. All eight CPUs boot, PMU
counting and overflow interrupts work on both the A55 and A76, the
AXP318W probes, and MMC0 runs at 3.3 V and 50 MHz with a matching
SHA-256 readback. Three card-detect hotplug cycles passed with
GPIO_PULL_UP, on the previous revision of this DTS. Regulator cleanup
at about 32 s gave no errors, and the green LED blinks in heartbeat.
The test DTB had a local 16 MiB no-map reservation that is not part
of this patch. I have not tried PCB v1.10 with GPIO_PULL_UP, and
v2.00 is untested.

[1] https://lore.kernel.org/r/20261121-a733-cubie-a7s-dt-v5-0@gmail.com
[2] https://lore.kernel.org/r/20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com
Previous version:
https://lore.kernel.org/r/20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com

 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 349 ++++++++++++++++++
 2 files changed, 350 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 9d1e740ff19e..62fab1d727d0 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -70,3 +70,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
new file mode 100644
index 000000000000..fea9d90d43c7
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+// Copyright (C) 2026 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Radxa Cubie A7Z";
+	compatible = "radxa,cubie-a7z", "allwinner,sun60i-a733";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	osc32k: clock-osc32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	/*
+	 * Discrete SY8089 step-down regulator, present on v1.11; v1.10
+	 * feeds BLDOIN from SWOUT2 and CLDOIN from PS instead. The schematic
+	 * names this rail LDO2V5-INPUT, but it is set to 2.4 V.
+	 */
+	reg_ldo_input: regulator-ldo2v5-input {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo2v5-input";
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_ps>;
+	};
+
+	/* PMIC PS output, fed from the DCIN pins. 5 V is nominal. */
+	reg_ps: regulator-ps {
+		compatible = "regulator-fixed";
+		regulator-name = "ps";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v0>;
+	};
+
+	/* Board wide 5 V supply from the USB-C connector. */
+	reg_vcc5v0: regulator-vcc5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0-sys";
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
+&hosc {
+	clock-frequency = <26000000>;
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	/* v1.11 has an external 10k pull-up on PF6, v1.10 does not. */
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
+	disable-wp;
+	vmmc-supply = <&reg_swout2>;
+	status = "okay";
+};
+
+&pio {
+	/* VCC-IO */
+	vcc-pb-supply = <&reg_swout2>;
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	/* VCC-IO */
+	vcc-pf-supply = <&reg_swout2>;
+	vcc-pg-supply = <&reg_bldo5>;
+	/* VCC-IO */
+	vcc-ph-supply = <&reg_swout2>;
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_bldo1>;
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
+		aldo156in-supply = <&reg_ps>;
+		aldo234in-supply = <&reg_aldo1>;
+		/* v1.10: BLDOIN from SWOUT2 and CLDOIN from PS */
+		bldoin-supply = <&reg_ldo_input>;
+		cldoin-supply = <&reg_ldo_input>;
+		dldoin-supply = <&reg_ps>;
+		eldoin-supply = <&reg_dcdc9>;
+		ips-supply = <&reg_ps>;
+		vin19-supply = <&reg_ps>;
+		vin23-supply = <&reg_ps>;
+		vin45-supply = <&reg_ps>;
+		vin678-supply = <&reg_ps>;
+
+		regulators {
+			reg_aldo1: aldo1 {
+				/* Port L powers the PMIC's own I2C bus. */
+				regulator-name = "vcc-pl-usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds0";
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
+			reg_bldo5: bldo5 {
+				regulator-name = "vcc-pg";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo1: cldo1 {
+				/* LPDDR4 VDD1. */
+				regulator-name = "vcc-pm-lpddr";
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
+				/* DRAM PLL and PHY 1.8 V. */
+				regulator-name = "vcc-pll-dram";
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
+			reg_dcdc1: dcdc1 {
+				/* Board 3.3 V loads and the SWOUT1/2 input. */
+				regulator-name = "vcc-3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				/* System and DRAM core supply. */
+				regulator-name = "vdd-sys";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
+				/* Powers the running Cortex-A76 CPUs. */
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
+				/* Powers the running Cortex-A55 CPUs. */
+				regulator-name = "vdd-cpul";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				/* DRAM PHY supply. */
+				regulator-name = "vcc-draml";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				/* DRAM VDD2 and VDDQ. */
+				regulator-name = "vcc-dram";
+				regulator-min-microvolt = <1100000>;
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
+				/* ELDOIN input, needs at least 1.2 V; firmware leaves 1.24 V. */
+				regulator-name = "eldo-input";
+				regulator-min-microvolt = <1240000>;
+				regulator-max-microvolt = <1240000>;
+			};
+
+			reg_dldo1: dldo1 {
+				/* SoC eFuse supply, no consumer is modelled yet. */
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
+			reg_eldo6: eldo6 {
+				/* Standby CPU and USB supply. */
+				regulator-name = "vdd-cpus";
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
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc-pd-pj";
+			};
+
+			reg_swout2: swout2 {
+				/* VCC-IO to the console and microSD. */
+				regulator-name = "vcc-io-ph-usb";
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&r_pio {
+	/*
+	 * PL powers the PMIC bus itself, so firmware must keep ALDO1 enabled:
+	 * vcc-pl-supply = <&reg_aldo1>;
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


