Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE37606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VUCytrrr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nzD4WruF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t/fqj7Fk1lWeFs/i6Ocg/Lv16mYoYdPNp4/eiwP/oTY=; b=VUCytrrrUB/F8j
	Ij/kLZvyIDTixGhpolx4B/81JJndTPe8ug4FGQ2I8fonTyXC6KU0lZ02JgFFloiXeq1y0k/TsotLr
	HW2w1OhumcSKckC++yiF5RmEwU0xw6t7MePWxIde5IkkQlIK7vfSIKcS+PtzYw/x2ply4h90q5Yaf
	dpOO81uPn8VC5PRNHHJZ62SXgiEUzqbHaXKnxrtnv3jfWDKncVymtzWv5g+k68ALNSa1bQTagpZuU
	kf9uYhFrgMOrzfUZQht8/oWPXxwY/lA8bi7+gcrc2HPZLt2JW3bhVcYqQNFJ3MadDr9v4VSAaKQKH
	D5nh+PdCiS3FLkb/ER5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbvs-0000000DqJJ-3wLR;
	Thu, 26 Nov 2026 16:02:48 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbvg-0000000DqB5-0exA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:02:39 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-386d1859e1cso1633889eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708955; x=1796313755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/fqj7Fk1lWeFs/i6Ocg/Lv16mYoYdPNp4/eiwP/oTY=;
        b=nzD4WruFfgnQNBZx6XXb+XR4lmTiYsr5tpskYfY8S+wWFdydu0fzRO01eojXvcaQ2o
         tNGdFiX7lmb9JK8nkAs+4nM2TWcx4MwFWpW8dqh8bbuS0L/S8nDIvVHMvVTzd7AlkJwR
         6ht88Um2wqvpzZ0Wu7o59NYa+0BRC6RUvXqd2QiOIHm7s2FcMTP9VRtMbdWzT2yB1zYq
         F0UMQY4W6xTieOeZ/wzgdia3eRfcGvNDV1u2YU/ETqIQUgKbFrSay+djk8y9qSt+osnD
         W2MXy7c0SJB6hTm1TlX3zIOfnd5yiZVFiPfqfF38UZVsvQgshgefXlD3zXEN+FTzDqc0
         cXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708955; x=1796313755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/fqj7Fk1lWeFs/i6Ocg/Lv16mYoYdPNp4/eiwP/oTY=;
        b=wftwcB8xq5CIjyJa24xE2rgJv8p2/Ps+t0/A2CtrFMwqVO3eONqburJYN72173oYNs
         /aYjvSLyeR6vMe0u+l8zK52bTUccOoX418GCF0siB//yld1do5p1Qv+0117fXuvAo3Xc
         F26OCiPrzyTU8COv1Fwp+04+EQdIIWckxSG3ie+NZqK16YYVWOZxt+yLAkBm5TfIAbam
         1SVsV9UeX+6mIML9BhhDgaMLBkjq8d6+rTYbYEhDdVo5V83Vo5KXT8SpSWEOiLHEgWSo
         l08FY4IWaDPKEo3rUlDDiON5AoxrZIeMB1Nf4U2CppGb18YZ8Ojhy+nGf+xBxAbvw7FG
         Po7g==
X-Forwarded-Encrypted: i=1; AL+hErGHmJyoFdoBYTx9makUJPPJLplMC+fRO3VXN0/YpYDhS/N8U1yjUehtYcAOYPa9ocGGtxwrx/qd2gV4auOsTInr@lists.infradead.org
X-Gm-Message-State: APuU4Z+ptWcjkcb1gyEpDRxG/AXNwhrmosbV7imjvrZQ3RqMf4MJmd7l
	/1wcIifvZjv9BzXTMfQmSK41Ko5IzPqC+U7sJ3Xn6U7BkOXZZRaiWriaBTXz41Bc
X-Gm-Gg: AZFdTZfSZYUwK0HxJDI11UWDJf/ilepAD0cfC1FUj9jdXeb8yTdpkd4uSRILYCJlQxj
	Xm2upzQJxEYacOPmj9ZmmCTPY3dK7Yz6iNQ9A7povAENKHnpCMs4abPj2FaGayd2UX16ZZvek/X
	OwKCz2LVAFruq3L2HrZcnqbwgBEIdXCH4kcdSzT1eAH0DPK7KkeY8WbrFKXuKH6hapzPLqKViBc
	pDuGxIeAHRW+RHcsYjqqyQwH+SKGrGU76tQgjvXYiN25/AwjQTgOHImySaYN0kDt5czcb3aBN0Z
	mO1uat3b7j1BQjyW9qSlgc5kDSPf2w76Wy/WKqJkzIbvLPNFZc6Mu8eZ/Su6H5Yb02YZ7f0dWJ9
	P1LYeuZKoDKbgAV+JppWlM2Vic5Qe4UWpfs2s3W/nuENEAm5ITiR7UdJBMOauZJJqFtYKwm/zEu
	0UyV6dfP44K/zmtXOrB8Kf99sj5oL3LK7gpKqbAS8OKYlMODU0IFoQFOTgWnaT6OMX+QMtzTNxQ
	Qxh0ibg3POyvtj7fdvxSjFNrrUg69AhOmHFQ5WDJWPQ9WR4aCzNbMeRZVkWGFDBJY1Bo35IZqLD
	I5Dy3i5EMXiQBA3jy3MCsYpzqjIHyVeAjnea0WNr862d
X-Received: by 2002:a05:7300:e003:b0:386:a75c:4a78 with SMTP id 5a478bee46e88-386a75c4cb3mr14449229eec.15.1795708954927;
        Thu, 26 Nov 2026 08:02:34 -0800 (PST)
Received: from localhost.localdomain ([183.82.206.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm80062260eec.11.2026.11.26.08.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:02:34 -0800 (PST)
From: dineshkumarv85@gmail.com
X-Google-Original-From: dinesh.v@adlinktech.com
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk@kernel.org,
	conor.dooley@microchip.com,
	s.hauer@pengutronix.de
Cc: daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v5 3/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 board support
Date: Thu, 26 Nov 2026 21:31:02 +0530
Message-Id: <20261126160102.52163-4-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126160102.52163-1-dinesh.v@adlinktech.com>
References: <20261126160102.52163-1-dinesh.v@adlinktech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_080237_645649_D2314180 
X-CRM114-Status: GOOD (  16.96  )
X-Spam-Score: -1.9 (-)
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

From: Dinesh kumar v <dineshkumarv85@gmail.com>

Add device tree support for the ADLINK LEC-iMX95 module
with the I-Pi SMARC Plus carrier board.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 118 ++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 609 ++++++++++++++++++
 3 files changed, 728 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..bb02809bb225 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -965,6 +965,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-lec-ipi-smarc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-osm-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts b/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
new file mode 100644
index 000000000000..cb5db5e21aae
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (C) 2026 ADLINK Technology Inc.
+ *
+ * https://www.adlinktech.com/products/Computer_on_Modules/SMARC/LEC-IMX95
+ * https://www.adlinktech.com/products/computer_on_modules/SMARCStarterKits/I-Pi_SMARC_IMX95
+ */
+
+/dts-v1/;
+
+#include "imx95-lec.dtsi"
+
+/ {
+	model = "ADLINK LEC-iMX95 on I-Pi SMARC Plus Carrier Board";
+	compatible = "adlink,lec-imx95-ipi-smarc",
+		     "adlink,lec-imx95",
+		     "fsl,imx95";
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+};
+
+/* Ethernet SMARC GBE0 */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Ethernet SMARC GBE1 */
+&enetc_port1 {
+	status = "okay";
+};
+
+&lpi2c8 {
+	status = "okay";
+
+	/* SX1509(2) U1001@IPi SMARC Plus */
+	i2c8_gpio_expander_3e: pinctrl@3e {
+		compatible = "semtech,sx1509q";
+		reg = <0x3e>;
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+		/* GPIO2_IO22 (module FAN_PWM_1V8) is the expander IRQ on this carrier */
+		interrupt-parent = <&gpio2>;
+		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_gpio_exp_3e>;
+		pinctrl-names = "default";
+		gpio-line-names =
+			"E_GPIO1_0",		/* 0 - CN101 Pin 29 */
+			"E_GPIO1_1",		/* 1 - CN101 Pin 31 */
+			"E_GPIO1_2",		/* 2 - CN101 Pin 32 */
+			"E_GPIO1_3",		/* 3 - CN101 Pin 33 */
+			"E_GPIO1_4",		/* 4 - CN101 Pin 35 */
+			"E_GPIO1_5",		/* 5 - CN101 Pin 36 */
+			"E_GPIO1_6",		/* 6 - CN101 Pin 37 */
+			"E_GPIO1_7",		/* 7 - CN101 Pin 38 */
+			"E_GPIO2_8",		/* 8 - CN101 Pin 40 */
+			"",			/* 9 - TP1002 */
+			"",			/* 10 - TP1003 */
+			"",			/* 11 - TP1004 */
+			"",			/* 12 - TP1005 */
+			"",			/* 13 - TP1006 */
+			"",			/* 14 - TP1007 */
+			"",			/* 15 - TP1008 */
+			"";			/* 16 - OSCIO / TP1001 */
+		semtech,probe-reset;
+	};
+};
+
+/* SMARC SPI0 */
+&lpspi6 {
+	status = "okay";
+};
+
+/* SMARC SER1, used as the Linux Console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* SMARC SER3 */
+&lpuart2 {
+	status = "okay";
+};
+
+/* SMARC SER0 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* SMARC PCIE_A */
+&pcie0 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+/* SMARC SDIO, microSD slot */
+&usdhc2 {
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_gpio_exp_3e: gpioexp3egrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO22__GPIO2_IO_BIT22		0x1fe
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-lec.dtsi b/arch/arm64/boot/dts/freescale/imx95-lec.dtsi
new file mode 100644
index 000000000000..4c4b06d65e61
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-lec.dtsi
@@ -0,0 +1,609 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (C) 2026 ADLINK Technology Inc.
+ * https://www.adlinktech.com/products/Computer_on_Modules/SMARC/LEC-IMX95
+ * https://www.adlinktech.com/products/computer_on_modules/SMARCStarterKits/I-Pi_SMARC_IMX95
+ */
+
+#include "imx95.dtsi"
+
+/ {
+	aliases {
+		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port1;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		gpio4 = &gpio5;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		i2c7 = &lpi2c8;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		rtc0 = &rtc_i2c;
+		rtc1 = &scmi_bbm;
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial2 = &lpuart5;
+		serial3 = &lpuart7;
+		spi0 = &lpspi6;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x1 0x00000000>;
+	};
+
+	reg_pcie0: regulator-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "RC210_EN_3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&i2c2_gpio_expander_71 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		bootph-pre-ram;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-name = "VDD_SD2_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <12000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		linux_cma: linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x7f000000>;
+			size = <0 0x3c000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+};
+
+/* Ethernet SMARC GBE0 */
+&enetc_port0 {
+	pinctrl-0 = <&pinctrl_enetc0>;
+	pinctrl-names = "default";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+};
+
+/* Ethernet SMARC GBE1 */
+&enetc_port1 {
+	pinctrl-0 = <&pinctrl_enetc1>;
+	pinctrl-names = "default";
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+};
+
+&gpio2 {
+	gpio-line-names =
+		"SMARC_SPI0_CS0#",	/* 0 - GPIO_IO00 */
+		"SMARC_SPI0_DIN",	/* 1 - GPIO_IO01 */
+		"SMARC_SPI0_DO",	/* 2 - GPIO_IO02 */
+		"SMARC_SPI0_CK",	/* 3 - GPIO_IO03 */
+		"",			/* 4 - GPIO_IO04 */
+		"",			/* 5 - GPIO_IO05 */
+		"",			/* 6 - GPIO_IO06 */
+		"",			/* 7 - GPIO_IO07 */
+		"SMARC_UART0_TXD",	/* 8 - GPIO_IO08 */
+		"SMARC_UART0_RXD",	/* 9 - GPIO_IO09 */
+		"SMARC_UART0_CTS_B",	/* 10 - GPIO_IO10 */
+		"SMARC_UART0_RTS_B",	/* 11 - GPIO_IO11 */
+		"SMARC_I2C_GP_DAT",	/* 12 - GPIO_IO12 */
+		"SMARC_I2C_GP_CK",	/* 13 - GPIO_IO13 */
+		"UART3_TXD_1V8",	/* 14 - GPIO_IO14 */
+		"UART3_RXD_1V8",	/* 15 - GPIO_IO15 */
+		"SAI3_TXC_1V8",		/* 16 - GPIO_IO16 */
+		"SAI3_MCLK_1V8",	/* 17 - GPIO_IO17 */
+		"SMB_INT_B_1V8",	/* 18 - GPIO_IO18 */
+		"LVDS0_BKLT_PWM_1V8",	/* 19 - GPIO_IO19 */
+		"SAI3_RXD_1V8",		/* 20 - GPIO_IO20 */
+		"SAI3_TXD_1V8",		/* 21 - GPIO_IO21 */
+		"FAN_PWM_1V8",		/* 22 - GPIO_IO22 */
+		"LVDS1_BKLT_PWM_1V8",	/* 23 - GPIO_IO23 */
+		"SPI6_SS1_1V8",		/* 24 - GPIO_IO24 */
+		"",			/* 25 - GPIO_IO25 */
+		"SAI3_TXFS_1V8",	/* 26 - GPIO_IO26 */
+		"TPM_INT_N_1V8",	/* 27 - GPIO_IO27 */
+		"SMARC_I2C_PM_DAT",	/* 28 - GPIO_IO28 */
+		"SMARC_I2C_PM_CK",	/* 29 - GPIO_IO29 */
+		"SMARC_CAN1_TX",	/* 30 - GPIO_IO30 (SMARC CAN1_H via transceiver) */
+		"SMARC_CAN1_RX";	/* 31 - GPIO_IO31 (SMARC CAN1_L via transceiver) */
+};
+
+&gpio3 {
+	gpio-line-names =
+		"SD2_CD_B",
+		"SD2_CLK",
+		"SD2_CMD",
+		"SD2_DATA0",
+		"SD2_DATA1",
+		"SD2_DATA2",
+		"SD2_DATA3",
+		"SD2_RST_B_1V8A3V",
+		"SD1_CLK",
+		"SD1_CMD",
+		"SD1_DATA0",
+		"SD1_DATA1",
+		"SD1_DATA2",
+		"SD1_DATA3",
+		"SD1_DATA4",
+		"SD1_DATA5",
+		"SD1_DATA6",
+		"SD1_DATA7",
+		"SD1_STROBE",
+		"SD2_VSEL_1V8",
+		"SD3_CLK",
+		"SD3_CMD",
+		"SD3_DATA0",
+		"SD3_DATA1",
+		"SD3_DATA2",
+		"SD3_DATA3",
+		"CCM_CLKO1",
+		"CCM_CLKO2",
+		"DAP_TDI",
+		"DAP_TMS_SWDIO",
+		"DAP_TCLK_SWCLK",
+		"DAP_TDO_TRACESWO";
+};
+
+&gpio4 {
+	gpio-line-names =
+		"ENET1_MDC",
+		"ENET1_MDIO",
+		"ENET1_TD3",
+		"ENET1_TD2",
+		"ENET1_TD1",
+		"ENET1_TD0",
+		"ENET1_TX_CTL",
+		"ENET1_TXC",
+		"ENET1_RX_CTL",
+		"ENET1_RXC",
+		"ENET1_RD0",
+		"ENET1_RD1",
+		"ENET1_RD2",
+		"ENET1_RD3",
+		"RTC_INT#_1V8",
+		"IOEXP2_INT#_1V8",
+		"ENET2_TD3",
+		"ENET2_TD2",
+		"ENET2_TD1",
+		"ENET2_TD0",
+		"ENET2_TX_CTL",
+		"ENET2_TXC",
+		"ENET2_RX_CTL",
+		"ENET2_RXC",
+		"ENET2_RD0",
+		"ENET2_RD1",
+		"ENET2_RD2",
+		"ENET2_RD3",
+		"CCM_CLKO3",
+		"CCM_CLKO4";
+};
+
+&gpio5 {
+	gpio-line-names =
+		"QSPIA_DATA0",
+		"QSPIA_DATA1",
+		"QSPIA_DATA2",
+		"QSPIA_DATA3",
+		"SKU_CONFIG1_1V8",
+		"SKU_CONFIG2_1V8",
+		"SKU_CONFIG3_1V8",
+		"SYS_STATUS_1V8",
+		"SD2_WP_1V8",
+		"QSPIA_SCLK",
+		"QSPIA_nSS0",
+		"SYS_RST#_1V8",
+		"PCIE1_IMX_CLKREQ#_1V8",
+		"MCU_INTB1_1V8",
+		"MCU_INTB2_1V8",
+		"PCIE2_IMX_CLKREQ#_1V8",
+		"ENET1_INT_B_1V8",
+		"ENET2_INT_B_1V8";
+};
+
+&lpi2c2 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+		pagesize = <64>;
+	};
+
+	/* U1000 SX1509BIULTRT_SEMTECH on module */
+	i2c2_gpio_expander_71: pinctrl@71 {
+		compatible = "semtech,sx1509q";
+		reg = <0x71>;
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+		interrupt-parent = <&gpio4>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_sx1509q>;
+		pinctrl-names = "default";
+		gpio-line-names =
+			"ENET1_RST_B_3V",	/* U2001 RTL8211F phy 1 reset */
+			"ENET2_RST_B_3V",	/* U2101 RTL8211F phy 2 reset */
+			"USB_HUB_RST#_3V",	/* U1800A USB hub reset */
+			"RC210_EN_3V",		/* U1300 RC21008 PCIe clock generator enable */
+			"LT9611_RSTN_3V",	/* U1500 LT9611 HDMI bridge reset */
+			"HDMI_INT_3V",		/* U1500 LT9611 HDMI bridge interrupt */
+			"PCIEA_RST#_3V",	/* SMARC P75 PCIE_A_RST# */
+			"PCIEB_RST#_3V",	/* SMARC S76 PCIE_B_RST# */
+			"TPM_RST_N_1V8",	/* U2400 TPM reset */
+			"SMARC_LID#",		/* SMARC S148 */
+			"SMARC_SLEEP#",		/* SMARC S149 */
+			"SMARC_CHARGING#",	/* SMARC S151 */
+			"SMARC_CHARGER_PRSNT#",	/* SMARC S152 */
+			"SMARC_BATLOW#",	/* SMARC S156 */
+			"SMARC_TEST#",		/* SMARC S157 */
+			"DSI0_TE_1V8",		/* SMARC S144 DSI0 TE */
+			"";			/* OSCIO, TP1000 */
+		semtech,probe-reset;
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	rtc_i2c: rtc@32 {
+		compatible = "epson,rx8130";
+		reg = <0x32>;
+	};
+};
+
+&lpi2c8 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_lpi2c8>;
+	pinctrl-names = "default";
+};
+
+&lpspi6 {
+	cs-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>, <&gpio2 24 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_lpspi6>;
+	pinctrl-names = "default";
+};
+
+&lpuart1 {
+	bootph-pre-ram;
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+};
+
+&lpuart2 {
+	pinctrl-0 = <&pinctrl_uart2>;
+	pinctrl-names = "default";
+};
+
+&lpuart5 {
+	pinctrl-0 = <&pinctrl_uart5>;
+	pinctrl-names = "default";
+};
+
+&lpuart7 {
+	pinctrl-0 = <&pinctrl_uart7>;
+	pinctrl-names = "default";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-0 = <&pinctrl_emdio>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* U2001 RTL8211F */
+	ethphy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <1>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&i2c2_gpio_expander_71 0 GPIO_ACTIVE_LOW>;
+		eee-broken-1000t;
+		realtek,clkout-disable;
+	};
+
+	/* U2101 RTL8211F */
+	ethphy1: ethernet-phy@4 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <4>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&i2c2_gpio_expander_71 1 GPIO_ACTIVE_LOW>;
+		eee-broken-1000t;
+		realtek,clkout-disable;
+	};
+};
+
+&netc_timer {
+	status = "okay";
+};
+
+&netcmix_blk_ctrl {
+	status = "okay";
+};
+
+&pcie0 {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	supports-clkreq;
+	vpcie-supply = <&reg_pcie0>;
+};
+
+&pcie0_port0 {
+	reset-gpios = <&i2c2_gpio_expander_71 6 GPIO_ACTIVE_LOW>; /* PCIEA_RST#_3V */
+};
+
+/* U1900 AW-CM276NF Wi-Fi/BT on module */
+&pcie1 {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_pcie0>;
+
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&i2c2_gpio_expander_71 7 GPIO_ACTIVE_LOW>; /* PCIEB_RST#_3V */
+};
+
+&usb3_dwc3 {
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+};
+
+/* eMMC on module */
+&usdhc1 {
+	bootph-pre-ram;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+/* SMARC SDIO */
+&usdhc2 {
+	bootph-pre-ram;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+};
+
+&wdog3 {
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x50e
+			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x90e
+		>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x50e
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x50e
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x50e
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x50e
+			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e
+			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e
+			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e
+			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e
+			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e
+			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e
+			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e
+			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
+		>;
+	};
+
+	pinctrl_enetc1: enetc1grp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x50e
+			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x50e
+			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x50e
+			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x50e
+			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x57e
+			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK	0x58e
+			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x57e
+			IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK	0x58e
+			IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0		0x57e
+			IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1		0x57e
+			IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2		0x57e
+			IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3		0x57e
+		>;
+	};
+
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL		0x40000b9e
+			IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
+			IMX95_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c8: lpi2c8grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO13__LPI2C8_SCL		0x40000b9e
+			IMX95_PAD_GPIO_IO12__LPI2C8_SDA		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpspi6: lpspi6grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO00__GPIO2_IO_BIT0	0x1fe
+			IMX95_PAD_GPIO_IO24__GPIO2_IO_BIT24	0x1fe
+			IMX95_PAD_GPIO_IO01__LPSPI6_SIN		0x3fe
+			IMX95_PAD_GPIO_IO02__LPSPI6_SOUT	0x3fe
+			IMX95_PAD_GPIO_IO03__LPSPI6_SCK		0x3fe
+		>;
+	};
+
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B		0x4000031e
+		>;
+	};
+
+	pinctrl_pcie1: pcie1grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO35__HSIOMIX_TOP_PCIE2_CLKREQ_B		0x4000031e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
+		>;
+	};
+
+	pinctrl_sx1509q: sx1509qgrp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_MDIO__GPIO4_IO_BIT15			0x1fe
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		bootph-pre-ram;
+		fsl,pins = <
+			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX	0x31e
+			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX	0x31e
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			IMX95_PAD_UART2_RXD__AONMIX_TOP_LPUART2_RX	0x31e
+			IMX95_PAD_UART2_TXD__AONMIX_TOP_LPUART2_TX	0x31e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			IMX95_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e
+			IMX95_PAD_DAP_TDI__LPUART5_RX				0x31e
+			IMX95_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e
+			IMX95_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e
+		>;
+	};
+
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO08__LPUART7_TX				0x31e
+			IMX95_PAD_GPIO_IO09__LPUART7_RX				0x31e
+			IMX95_PAD_GPIO_IO11__LPUART7_RTS_B			0x31e
+			IMX95_PAD_GPIO_IO10__LPUART7_CTS_B			0x31e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x15fe
+			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x13fe
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x13fe
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x13fe
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x13fe
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x13fe
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x13fe
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x13fe
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x13fe
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x13fe
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x15fe
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		bootph-pre-ram;
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x158e
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK			0x15fe
+			IMX95_PAD_SD2_CMD__USDHC2_CMD			0x13fe
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0		0x13fe
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1		0x13fe
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2		0x13fe
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x13fe
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		bootph-pre-ram;
+		fsl,pins = <
+			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0		0x31e
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		bootph-pre-ram;
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0		0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1		0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2		0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
+		>;
+	};
+};
-- 
2.25.1


