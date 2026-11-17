Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5B7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0OURAR1C;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwTbb81B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=u+qNamCxkMzKl4KY6j5kHOZ4VWCPeD2SfTKkXZTtvl0=; b=0OURAR1CSrzwaVBZkwWs9hl4oS
	f7+Dv1TO7fWL5OOnWbPZRVTXFeJSh/6Wkq8cIg1YoPXSnCH2UKyFu2F4778IhWrur2NPFk7dEkCHU
	M71HwBf78eKBD/p7I55/NjN2emoGdr8dyfZcZkjwKmMKHUxiURsBGz3nljMgouwpP1DkBANySoOIs
	QO1XSQkwWupepGIk8wNku5BL24g84D92Jpb/4H/o0i0NtJpcEF5bmavrOlhm7WQXRGYlog+G4vAGN
	Q6ibzA0ULcRrL6SkFdJZEkcq352AtM3uOdUJYFWYgAd3U7zwTbE8Igr4Yo4cSZnhkSj7TUdAuiuKV
	Jaz6Mv1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRGJ-00000007Bjb-1atH;
	Tue, 17 Nov 2026 22:02:47 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRGF-00000007BiO-07SH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:02:44 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so285022766b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 14:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952961; x=1795557761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+qNamCxkMzKl4KY6j5kHOZ4VWCPeD2SfTKkXZTtvl0=;
        b=DwTbb81BYhxqjfTdY/uw+1jAyQYJ52qCn3Pg4nTb5C607rVm1+PY1r+bHtFzHomCWq
         z67dlYxXJAEYhGRzvjwn12XVNRDyV7uz+Ohp2cfUGIku2IMoKo3cyUpIIBDf467b8Zl8
         +lAJKebqEECt38w+/3MUIOvfWsDP3nlA62moj2ykvJ4V0ZT0NXs4TXY9S0KAB6HUpAFt
         YEAkQ0vFMR2LoG6vph/HmV+ZF+0mA3/R++bddZqbyWoKzuI1be5lmVUqe1SY4QWzKyK6
         Ku2N+8Qr6cUY3WfhhQ6kccLfTObpCYWDkSjP5JUEhs98B9dJRvzb8ufGD0cqEgsG0JNF
         B5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952961; x=1795557761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+qNamCxkMzKl4KY6j5kHOZ4VWCPeD2SfTKkXZTtvl0=;
        b=b6PEMkWlXHbU6YRenAvIR+XtxrDVNbWUOVzKaijcQELTONObpU5tnUznXuwPEkkt80
         e6smk+H9xfO5A2frJgGGfv3hT5YCK+6XSrGEODaaH7TxBiCt1943E5/BapW7uK8HeUQi
         eF6D4CjyFYXRfu4M/p+1NOsPBb179UVYvIxJU0nGbpff7eDFYPfW0gj/Juf8vQ8duc8k
         B1BePx24S9ZXOgRIOdEoupw/WBT+Sq5olUuCJ89fPetw2MnezzNnMj8m3BkE0YL8lN2Q
         GBTcDBHTK0FaNfTU0U7/6t+fprMETsgeN9xeex4v3pLx17JYF/VH29wXqgjeN2MIYPAR
         Fyrw==
X-Gm-Message-State: APuU4Z97DmtLBamybBidjPHRUz8CXrcYDRn76E2Yz5mhQjVxdaUQ4/de
	geTx3XlQyUiKcNqgH1IucKd9hBsqLLfDaxklUD8Lap3pLDqByqiKB8KD9a0jVeZZ
X-Gm-Gg: AYBFou2fPtrfKPVC/5uvFtuWYSM8shRD+OdRAIeqCjkU7PhP9p2/l9sg/5r/27m0rO3
	rZu5P4MvhLCunQdlKL11JfGXTql2GF+lD0DBBb227sE0NYiDSPPMOi97JNtzE7DHTPFUgiTxuxN
	KXYsQe4PrMuTqoTlssslXIHuWRhus4leY1mqyqpZfJZXVcjf4Per8MZgbjyWK4VGloHkQOsA3tN
	7y5Y5SA6npKd5pJxX3BeuAW/dICXEClyjI6GxHPu6BU2hBB+ipHc3O9xg3U4pomZV113ppDbjes
	zswImnZRGRtQUC/a2jiV48mDfXZZFx50fdVQUKutjWolGPAjs+sN6IrAU2hpZ84i4t4ezo3Elnp
	/qW2W2F8inGfuG3fkT7zvrXo4rpUuFwScYjfYXVYUTmTCoGSpa6TWjKYDm0uRs9GJDdWZ2JXMmr
	zum7nCccv0OLpKZUjWCIectUvrAXxfq8FbVsUcSFYofUVRKFO4hh5VVqrmNrjHygnG6s/hvW9XY
	9R3RdslDC++9Jq5v7ad2j3HM+OEfJRnZo7ZcbBIpMv9bQHsVEe31G5wiATZ5neTze6xQponwwtQ
	wHvuR01gZ5L8VXn9RzlsuRpxo22Aq9H8c3MXqocSsa3KI1yMR0oRd4MBJA==
X-Received: by 2002:a17:907:728a:b0:c50:6222:7b1c with SMTP id a640c23a62f3a-c510e3c9618mr45908366b.23.1794952960855;
        Tue, 17 Nov 2026 14:02:40 -0800 (PST)
Received: from rea.tail766d.ts.net ([194.9.79.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cb340fdsm25525266b.76.2026.11.17.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:02:40 -0800 (PST)
From: ImAthanasia <pwnzorius@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ImAthanasia <pwnzorius@gmail.com>
Subject: [PATCH] ARM: dts: armada-370: Add WD My Cloud EX2 (Gen1)
Date: Tue, 17 Nov 2026 22:02:17 +0000
Message-Id: <20261117220217.250710-1-pwnzorius@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_140243_121612_32A4C675 
X-CRM114-Status: GOOD (  19.10  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

This adds a board file for the Western Digital My Cloud EX2 (Gen1) NAS
(board RD-88F6710 "KingsCanyon", Marvell Armada 370 / 88F6710), which has
no mainline board file today.

Enabled by the board: both SATA ports, USB2 and USB3 hosts, gpio HDD
status LEDs, the 4-GPIO chassis fan (gpio-fan, 1500/1700/1800/2100 rpm
speed map), the rear reset button, mvneta ethernet with the Marvell
88E1510 phy (rgmii-id), fixed regulators gating USB and SATA disk power,
and the NAND controller with the stock fixed partition layout.

The NAND node sets "marvell,nand-keep-config". This is required on this
board: the stock bootloader programs controller timings that mainline does
not reproduce, and reprogramming them corrupts reads and aborts writes.
This is the established pattern for NAS boxes on this platform, not a WD
quirk: the same property (with nand-on-flash-bbt and ECC 4/512) is used by
armada-370-dlink-dns327l.dts, armada-370-netgear-rn102.dts and
armada-370-netgear-rn104.dts, and by WD's own EX2 Ultra / Mirror Gen2 board
file (arch/arm/boot/dts/marvell/armada-385-wd_cloud.dtsi in OpenWrt).

The file is derived from the Armada 370 DB reference design with the
community GPL description for the WD My Cloud Mirror Gen1 as the hardware
reference, adjusted to the EX2: NAND moved to the mainline
nand-controller + nand@0 binding (the legacy "nand@d0000" node has no reg
resource), and the gpio-fan node does not claim an alarm gpio overlapping
one of the fan speed GPIOs.

Tested on hardware with 6.12.117: boots unattended from NAND with a USB
root, RAID1 md0 assembles, LEDs/fan/ethernet/NAND operational; UBI/UBIFS
volumes attach, mount and persist across reboots. The DTB passes
dtbs_check with the same legacy-dtsi warning set as the existing
armada-370 boards (57, identical to armada-370-netgear-rn102.dtb), with
zero board-specific findings.

Tool-assistance disclosure: portions of this patch were prepared with the
help of an AI coding assistant; I reviewed, built, and tested the result on
hardware and take full responsibility for its content. Signed-off-by is
mine (human).

Best regards,
ImAthanasia
https://github.com/ImAthanasia


Signed-off-by: ImAthanasia <pwnzorius@gmail.com>
---
 arch/arm/boot/dts/marvell/Makefile            |   1 +
 .../marvell/armada-370-wd-my-cloud-ex2.dts    | 285 ++++++++++++++++++
 2 files changed, 286 insertions(+)
 create mode 100644 arch/arm/boot/dts/marvell/armada-370-wd-my-cloud-ex2.dts

diff --git a/arch/arm/boot/dts/marvell/Makefile b/arch/arm/boot/dts/marvell/Makefile
index fc4273b..e923397 100644
--- a/arch/arm/boot/dts/marvell/Makefile
+++ b/arch/arm/boot/dts/marvell/Makefile
@@ -164,6 +164,7 @@ dtb-$(CONFIG_MACH_KIRKWOOD) += \
 	kirkwood-ts419-6281.dtb \
 	kirkwood-ts419-6282.dtb
 
+dtb-$(CONFIG_MACH_ARMADA_370) += armada-370-wd-my-cloud-ex2.dtb
 dtb-$(CONFIG_MACH_ARMADA_370) += armada-370-wd-my-cloud-ex2-appliance.dtb
 dtb-$(CONFIG_MACH_ARMADA_370) += armada-370-wd-my-cloud-ex2-appliance-big.dtb
 dtb-$(CONFIG_MACH_ARMADA_370) += armada-370-wd-my-cloud-ex2-appliance-big-keepcfg.dtb
diff --git a/arch/arm/boot/dts/marvell/armada-370-wd-my-cloud-ex2.dts b/arch/arm/boot/dts/marvell/armada-370-wd-my-cloud-ex2.dts
new file mode 100644
index 0000000..6394ba0
--- /dev/null
+++ b/arch/arm/boot/dts/marvell/armada-370-wd-my-cloud-ex2.dts
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Device Tree file for the Western Digital My Cloud EX2 (Gen1)
+ *
+ * Board: RD-88F6710_Alpha_KingsCanyon, Marvell Armada 370 (88F6710)
+ *
+ * Derived from the Marvell Armada 370 DB reference design and the
+ * community WD My Cloud Mirror Gen1 description.
+ *
+ * Copyright (C) 2012 Marvell
+ *   Lior Amsalem <alior@marvell.com>
+ *   Gregory C Clement <gregory.clement@free-electrons.com>
+ *   Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+ *   Allester Fox <fox.axon@gmail.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "armada-370.dtsi"
+
+/ {
+	model = "WD My Cloud EX2 (Gen1)";
+	compatible = "wd,my-cloud-ex2", "marvell,armada370", "marvell,armada-370-xp";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x20000000>; /* 512 MiB */
+	};
+
+	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000
+			  MBUS_ID(0x01, 0xe0) 0 0xfff00000 0x100000
+			  MBUS_ID(0x09, 0x01) 0 0xf1100000 0x10000>;
+
+		internal-regs {
+			sata@a0000 {
+				nr-ports = <2>;
+				status = "okay";
+			};
+
+			usb@50000 {
+				status = "okay";
+			};
+
+			usb@51000 {
+				status = "okay";
+			};
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&reset_button_pin>;
+		pinctrl-names = "default";
+
+		reset-button {
+			label = "Reset Button";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		led-0 {
+			label = "hdd1-blue";
+			gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-1 {
+			label = "hdd2-blue";
+			gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-2 {
+			label = "hdd1-red";
+			gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-3 {
+			label = "hdd2-red";
+			gpios = <&gpio1 20 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+	};
+
+	gpio-fan {
+		status = "okay";
+		compatible = "gpio-fan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&fan_pins>;
+
+		gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>,
+			<&gpio0 16 GPIO_ACTIVE_HIGH>,
+			<&gpio1 0 GPIO_ACTIVE_HIGH>,
+			<&gpio0 6 GPIO_ACTIVE_HIGH>;
+		gpio-fan,speed-map = <0 0>,
+				     <1500 1>,
+				     <1700 2>,
+				     <1800 3>,
+				     <2100 4>;
+	};
+
+	usb_power: regulator-usb {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&xhci_pwr_pin>;
+		pinctrl-names = "default";
+		regulator-name = "USB3.0 Port Power";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+		gpio = <&gpio0 13 GPIO_ACTIVE_HIGH>;
+	};
+
+	sata_1_power: regulator-sata1 {
+		compatible = "regulator-fixed";
+		regulator-name = "SATA-1 Power";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		startup-delay-us = <2000000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&gpio1 22 GPIO_ACTIVE_HIGH>;
+	};
+
+	sata_2_power: regulator-sata2 {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&sata_2_pwr_pin>;
+		pinctrl-names = "default";
+		regulator-name = "SATA-2 Power";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		startup-delay-us = <4000000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+		gpio = <&gpio1 24 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&pciec {
+	status = "okay";
+
+	pcie@1,0 {
+		status = "okay";
+	};
+
+	pcie@2,0 {
+		status = "okay";
+	};
+};
+
+&pinctrl {
+	led_pins: led-pins {
+		marvell,pins = "mpp52", "mpp53", "mpp57", "mpp55";
+		marvell,function = "gpio";
+	};
+
+	fan_pins: fan-pins {
+		marvell,pins = "mpp6", "mpp8", "mpp16", "mpp32";
+		marvell,function = "gpio";
+	};
+
+	xhci_pwr_pin: xhci-pwr-pin {
+		marvell,pins = "mpp13";
+		marvell,function = "gpio";
+	};
+
+	sata_1_pwr_pin: sata-1-pwr-pin {
+		marvell,pins = "mpp54";
+		marvell,function = "gpio";
+	};
+
+	sata_2_pwr_pin: sata-2-pwr-pin {
+		marvell,pins = "mpp56";
+		marvell,function = "gpio";
+	};
+
+	uart1_pins: uart1-pins {
+		marvell,pins = "mpp60", "mpp61";
+		marvell,function = "uart1";
+	};
+
+	reset_button_pin: reset-button-pin {
+		marvell,pins = "mpp64";
+		marvell,function = "gpio";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-0 = <&uart1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&mdio {
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&eth1 {
+	phy = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&nand_controller {
+	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		label = "pxa3xx_nand-0";
+		nand-rb = <0>;
+		marvell,nand-keep-config;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x00000000 0x00500000>;
+				read-only;
+			};
+
+			partition@500000 {
+				label = "uimage";
+				reg = <0x00500000 0x00500000>;
+			};
+
+			partition@a00000 {
+				label = "ramdisk";
+				reg = <0x00a00000 0x00500000>;
+			};
+
+			partition@f00000 {
+				label = "image.cfs";
+				reg = <0x00f00000 0x0c900000>;
+			};
+
+			partition@dd00000 {
+				label = "rescue-firmware";
+				reg = <0x0dd00000 0x00f00000>;
+			};
+
+			partition@ec00000 {
+				label = "config";
+				reg = <0x0ec00000 0x01400000>;
+			};
+
+			partition@d800000 {
+				label = "reserve";
+				reg = <0x0d800000 0x00500000>;
+			};
+		};
+	};
+};
-- 
2.39.5


