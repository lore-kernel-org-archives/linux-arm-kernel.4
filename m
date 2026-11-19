Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AEE606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z5HopOgF;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TCF1HdB6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wgYjYUZ3QIkK0AEoJ4/p43i9GAC2oi4NfbE7KQ+Uf+g=; b=z5HopOgFE39lrD
	Oi/6revJn/E82tPQtC+pkH3t9T1UWOBZFPv+8bmMO2sX56nNhGaK1cHFHhL1KoH6qQCtODYIb0bdp
	NWf+y3M/01QL3cLqNKa3dmzqJ96cYuQWLid444GYcRAP6+cOJg/H56UmRclj7NIAfldSgnKwHvFOn
	flkJ6cYD9TPkoNRguCQ+QC9EY+2rJRRRfxW5tsDYxQ3xq7Xh8ia3W+UZkrazotm3sxL7MbXHWpBQf
	pCGgTq7D9Xixql3BdvI6qVtEyH31wIaMRuGhh/Dji/Lb6Smo6cFhPXebL4Am1JzV05QyvfNGY/jBm
	9fT0L3k+tHFcENTGDiRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6qx-0000000D08S-2cHI;
	Thu, 19 Nov 2026 18:27:23 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6qj-0000000CzvF-0CEk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795112829; x=1826648829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ZQPkKWyBz8uWwXAJNSTZHjO8viWWXx38ay1CJbUccI=;
  b=TCF1HdB6I98p1q1+hsmXNJoak04lhiilB3mVo2fNYjUfJQF3I5vm58MK
   /uzSP7oj97QumuEFe2B8lwu4ACLk3vCTLYXCgDf9wD+UlKStS49ZL685q
   v5tKR32yn5pyBJIZy/Lzr1VdPG5szxnZkzegZ3hQRCqQA9PrlDT4KtAE1
   kNNQSlRHTL7/2O73FtoYc3iLcCGY3u1UFpo75WK6LfzNKVMrkO30MKJ8z
   DglA7mzw8F1Duh2zqyoFdJ4XTlWoP0trmVj5GwHgs47wCGSDIJPaZvzLW
   eJu6ywiMkbdC+ZESJ4mg0qGEGGrxYEqAJiuawyGCycl8r+mYzBubbPBeY
   Q==;
X-CSE-ConnectionGUID: MWaE+kH7R722RxKYa5H32w==
X-CSE-MsgGUID: xTknsvmmTb6IkdOqqzu9mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3861827"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3861827"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:27:09 -0800
X-CSE-ConnectionGUID: aP1HVpaAT0mIp7fwTUzyEw==
X-CSE-MsgGUID: BFmp1qDcT0qG2fCcFfh8Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="12479537"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 10:27:06 -0800
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	maciej.lawniczak@intel.com,
	Dawid Glazik <dawid.glazik@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v6 3/3] ARM: dts: aspeed: Add Intel JNCRP BMC
Date: Thu, 19 Nov 2026 20:19:40 +0100
Message-ID: <b951060fa8114532a96dad7a9373e739d239b071.1795114204.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795114204.git.dawid.glazik@linux.intel.com>
References: <cover.1795114204.git.dawid.glazik@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_102709_099265_7D5E3F67 
X-CRM114-Status: GOOD (  16.60  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

JNCRP is an Intel x86 server platform with Intel Xeon host processors.
Its BMC is an AST2600-based platform management controller on the
platform's DC-SCM, providing out-of-band management of the host
through KCS, network and MCTP over I3C.

The BMC controls platform power and reset, and monitors CPU and memory
thermal and fault signals as well as host processor module (HPM)
presence, FRU and fault signals. It also captures POST codes.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v6:
  - Added &uart3, &uart4 and &uart_routing, with the default UART3/4
    pinctrl removed to keep pins L4/L5 and B6/B7 as GPIOs
  - Reworded the platform description in the commit message
  - Rebased onto the current aspeed/arm/dt
v5:
  - Removed bootargs from the chosen node, earlycon is for debugging only
  - Added a description of the platform to the commit message
  - Rebased onto the current aspeed/arm/dt
  - Capitalised the first word of the subject
v4:
  - Rebased onto aspeed/arm/dt of bmc/linux.git, no other changes
v3:
  - Sorted nodes alphabetically
  - Sorted properties per dts-coding-style
  - Removed lpc-snoop label
  - Removed &i3c_global since it's enabled by default
  - Added &kcs3 and replaced flash layout with 128MB one
  - Restored Reviewed-by from Andrew Lunn, dropped by mistake in v2
v2:
  - Reviewed-by: Andrew Lunn for nodes: &mdio1, &mac1
  - Replace bootargs console=ttyS4,115200n8 with stdout-path = &uart5
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 293 ++++++++++++++++++
 2 files changed, 294 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 9c6b604f2b65..6f1fdb8f6f15 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -60,6 +60,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ibm-sbp1.dtb \
 	aspeed-bmc-ibm-system1.dtb \
 	aspeed-bmc-intel-avcrp.dtb \
+	aspeed-bmc-intel-jncrp.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-inspur-nf5280m6.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts
new file mode 100644
index 000000000000..e277494fa528
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2025 Intel Corporation
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	compatible = "intel,jncrp-bmc", "aspeed,ast2600";
+	model = "Intel JNCRP BMC";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+
+		status = "okay";
+
+#include "openbmc-flash-layout-128.dtsi"
+	};
+};
+
+&gpio0 {
+	gpio-line-names =
+		/*A0-A7*/ "", "", "", "", "", "", "", "",
+		/*B0-B7*/ "PWRGD_AUX_PWRGD_BMC_CPU", "", "", "", "", "", "",
+				"FP_ID_LED_N",
+		/*C0-C7*/ "FM_FORCE_BMC_UPDATE_N", "RST_RGMII_PHYRST_N",
+				"FM_TPM_EN_PULSE", "", "", "",
+				"DBP_HOOK3_CPU_FBRK_OUT_R_N", "DBP_PRSNT_IN_N",
+		/*D0-D7*/ "CPU_ERR0_N", "CPU_ERR1_N", "CPU_ERR2_N", "DBP_ASD_BMC_PRDY_N",
+				"FM_SPD_SWITCH_CTRL_N", "", "", "",
+		/*E0-E7*/ "", "", "", "ID_BUTTON", "", "", "", "",
+		/*F0-F7*/ "", "", "FM_AGGREGATOR_MODE_N", "", "", "",
+				"FP_LED_STATUS_GREEN_R_N", "FP_LED_STATUS_AMBER_R_N",
+		/*G0-G7*/ "", "", "", "", "", "", "", "",
+		/*H0-H7*/ "", "", "", "", "", "", "", "",
+		/*I0-I7*/ "", "", "", "", "", "", "", "",
+		/*J0-J7*/ "", "", "", "", "", "", "", "",
+		/*K0-K7*/ "", "", "", "", "", "", "", "",
+		/*L0-L7*/ "", "", "", "", "PREQ_N", "FM_P3V3_SW_ENA", "", "",
+		/*M0-M7*/ "", "", "", "", "", "", "", "",
+		/*N0-N7*/ "", "", "", "", "", "", "", "",
+		/*O0-O7*/ "", "", "", "", "", "", "NMI_BUTTON", "",
+		/*P0-P7*/ "RESET_BUTTON", "RESET_OUT", "POWER_BUTTON", "POWER_OUT",
+				"", "", "", "LED_BMC_HB_LED_N",
+		/*Q0-Q7*/ "", "", "", "", "", "", "", "",
+		/*R0-R7*/ "", "", "", "", "", "", "", "",
+		/*S0-S7*/ "CPU_CATERR_IERR_N", "CPU_CATERR_MCERR_N", "FM_BMC_FRU_WP_N",
+				"FM_INTRUSION_CABLE_PRES_N", "PWRGD_CPU_AUXPWRGD",
+				"FM_P3V_BAT_SCALED_EN", "REMOTE_DEBUG_ENABLE", "",
+		/*T0-T7*/ "", "", "", "", "", "", "", "",
+		/*U0-U7*/ "", "", "", "", "", "", "", "",
+		/*V0-V7*/ "SIO_S3", "SIO_S5", "", "SIO_ONCONTROL",
+				"SIO_POWER_GOOD", "", "", "",
+		/*W0-W7*/ "", "", "", "", "", "", "", "",
+		/*X0-X7*/ "", "", "POST_COMPLETE", "", "", "", "", "",
+		/*Y0-Y7*/ "FM_BMC_CMOS_CLR_R_N", "PLTRST_N", "FM_BMC_SAFS_EN",
+				"IRQ_PSU_ALERT_LVC3_N", "", "", "", "",
+		/*Z0-Z7*/ "", "", "", "", "", "", "", "";
+
+	status = "okay";
+
+	spd-switch-cpu-hog {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
+		output-low;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	multi-master;
+
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	multi-master;
+
+	status = "okay";
+};
+
+&i2c8 {
+	multi-master;
+
+	status = "okay";
+};
+
+&i2c9 {
+	multi-master;
+
+	status = "okay";
+};
+
+&i2c10 {
+	multi-master;
+
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	multi-master;
+
+	status = "okay";
+};
+
+&i2c13 {
+	multi-master;
+
+	status = "okay";
+};
+
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	multi-master;
+
+	status = "okay";
+};
+
+&i3c1 {
+	i2c-scl-hz = <1000000>;
+	mctp-controller;
+
+	status = "okay";
+};
+
+&kcs3 {
+	aspeed,lpc-io-reg = <0xca2>;
+
+	status = "okay";
+};
+
+&lpc {
+	lpc-snoop@80 {
+		snoop-ports = <0x80>;
+
+		status = "okay";
+	};
+};
+
+&mac1 {
+	clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>,
+		 <&syscon ASPEED_CLK_MAC2RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_rgmii2_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdio1 {
+	status = "okay";
+
+	ethphy1: ethernet-phy@0 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <0>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <50000>;
+		reset-gpios = <&gpio0 ASPEED_GPIO(C, 1) GPIO_ACTIVE_LOW>;
+	};
+};
+
+&rtc {
+	status = "okay";
+};
+
+&sgpiom0 {
+	bus-frequency = <2000000>;
+	gpio-line-names =
+		/*A, 0-7*/ "CPU0_VRHOT_N", "LED_POSTCODE_0_LSB",
+				"CPU0_THERMTRIP_N", "LED_POSTCODE_1",
+				"CPU0_MEMTRIP_N", "LED_POSTCODE_2",
+				"CPU0_MEM_VRHOT_N", "LED_POSTCODE_3",
+				"CPU0_MEM_HOT_N", "LED_POSTCODE_4",
+				"CPU0_MON_FAIL_N", "LED_POSTCODE_5",
+				"CPU1_VRHOT_N", "LED_POSTCODE_6",
+				"CPU1_THERMTRIP_N", "LED_POSTCODE_7_MSB",
+		/*B, 8-15*/ "CPU1_MEMTRIP_N", "FM_ASYNC_WARM_RESET_REQ",
+				"CPU1_MEM_VRHOT_N", "HPM_FRU_READ_DONE",
+				"CPU1_MEM_HOT_N", "FM_ASYNC_GLOBAL_RESET_REQ",
+				"CPU1_MON_FAIL_N", "BMC_BOOT_DONE",
+				"CPU2_VRHOT_N", "NMI_OUT",
+				"CPU2_THERMTRIP_N", "AGGREGATOR_MODE",
+				"CPU2_MEMTRIP_N", "RST_I3C_PCIE_HUB_N",
+				"CPU2_MEM_VRHOT_N", "",
+		/*C, 16-23*/ "CPU2_MEM_HOT_N", "HPM0_PRESENT",
+				"CPU2_MON_FAIL_N", "HPM1_PRESENT",
+				"CPU3_VRHOT_N", "HPM2_PRESENT",
+				"CPU3_THERMTRIP_N", "HPM3_PRESENT",
+				"CPU3_MEMTRIP_N", "HPM0_SOURCE_TO_DESTINATION_FAIL",
+				"CPU3_MEM_VRHOT_N", "HPM1_SOURCE_TO_DESTINATION_FAIL",
+				"CPU3_MEM_HOT_N", "HPM2_SOURCE_TO_DESTINATION_FAIL",
+				"CPU3_MON_FAIL_N", "HPM3_SOURCE_TO_DESTINATION_FAIL",
+		/*D, 24-31*/ "FM_BMC_VAL_EN", "HPM0_FRU_VALID",
+				"FM_SERIAL_BOOT", "HPM1_FRU_VALID",
+				"FM_INTRUSION_CABLE_PRES_N", "HPM2_FRU_VALID",
+				"USB_OC_P2_3_N", "HPM3_FRU_VALID",
+				"FM_SYSTEM_COOLING_MODE0", "FM_S2D_DISCOVERY_DONE",
+				"FM_SYSTEM_COOLING_MODE1", "", "", "", "", "",
+		/*E, 32-39*/ "DBP_PMODE_S0_PWROK", "", "DBP_PMODE_PLTRST", "",
+				"DBP_PMODE_GLOBALRESET", "", "DBP_PMODE_CPU_PWRGD", "",
+				"FM_SMBUS_RDY", "", "FM_LEAK_DETECTION", "",
+				"FM_LEAK_CBL_PRSNT_N", "", "FM_LEAK_CBL_FAULT_N", "",
+		/*F, 40-47*/ "CPU0_SKTOCC1_N", "CPU0_SKT_FAULT_LED",
+				"CPU0_SKTOCC2_N", "CPU1_SKT_FAULT_LED",
+				"CPU0_MISMATCH", "CPU2_SKT_FAULT_LED",
+				"CPU1_SKTOCC1_N", "CPU3_SKT_FAULT_LED",
+				"CPU1_SKTOCC2_N", "", "CPU1_MISMATCH", "",
+				"CPU2_SKTOCC1_N", "", "CPU2_SKTOCC2_N", "",
+		/*G, 48-55*/ "CPU2_MISMATCH", "", "CPU3_SKTOCC1_N", "",
+				"CPU3_SKTOCC2_N", "", "CPU3_MISMATCH", "",
+				"HPM0_PRSNT_N", "", "HPM1_PRSNT_N", "",
+				"HPM2_PRSNT_N", "", "HPM3_PRSNT_N", "",
+		/*H, 56-63*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/*I, 64-71*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/*J, 72-79*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/*K, 80-87*/ "FM_BOARD_REV_ID0", "", "FM_BOARD_REV_ID1", "",
+				"FM_BOARD_REV_ID2", "", "FM_BOARD_SKU_ID0", "",
+				"FM_BOARD_SKU_ID1", "", "FM_BOARD_SKU_ID2", "",
+				"FM_BOARD_SKU_ID3", "", "FM_BOARD_SKU_ID4", "",
+		/*L, 88-95*/ "FM_BOARD_SKU_ID5", "", "FM_BOARD_SKU_ID6", "",
+				"FM_BOARD_SKU_ID7", "", "", "", "", "", "", "",
+				"", "", "", "",
+		/*M, 96-103*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/*N, 104-111*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/*O, 112-119*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+		/*P, 120-127*/ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "";
+	ngpios = <128>;
+
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart3 {
+	/delete-property/ pinctrl-names;
+	/delete-property/ pinctrl-0;
+
+	status = "okay";
+};
+
+&uart4 {
+	/delete-property/ pinctrl-names;
+	/delete-property/ pinctrl-0;
+
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&uart_routing {
+	status = "okay";
+};
-- 
2.43.0


