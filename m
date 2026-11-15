Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C63606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GSDlFteH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHYVNZOE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=62CfwsBmKGKY7Fn9rT9RDvCYZzjZgQypRjRx11DS/CE=; b=GSDlFteHVBW9ct
	L4bB3sIsu6GnIe0qWDu6IpLLE5TpMCf8raXKoTr1UE1KMFQx+UqIm0G9m1qBFbDSqvRrD5YK8Vrl9
	1B5/2xKG5LYbEfaNmbesMhK2iuwgDqBvukn4F1XeXwUrbwBJXtobYlTMJAdNvcbYr7ukzoHxccruV
	QAx3C0spdGqf6GMhd+8ODxpHOrQT3uPFPtPK+m4kcF/lcGptSaM5IyBCY4ZYO6NLH7ehkb87OJhLo
	GUKnPlCD6fdEFIWBSCGUxXcJ3KZzjCVITpoSHWFilIPAPqEPZMuUkiJp8+yYx0K+ibKL9ePbCT4Sy
	SbvttUxcs2kOqDHzLmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXjm-0000000HOrx-2pDZ;
	Sun, 15 Nov 2026 10:45:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXjd-0000000HOjQ-2UsA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 10:45:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B84E45B0D;
	Sun, 15 Nov 2026 10:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34531F0092F;
	Sun, 15 Nov 2026 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739521;
	bh=62CfwsBmKGKY7Fn9rT9RDvCYZzjZgQypRjRx11DS/CE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fHYVNZOEBPLRcgAtKvuULYHQjJhuC3nTBjIbD+QdlvSBlnXBm03raYEp8TiBsOpgm
	 FFSBpCTSayaI0R67EuTfgAYiSuDHU2J6LHKpqhUZOMdH1nH+1496g9oFcfmud/omSk
	 3LYkxT1bBip5ATI0ihVu6h1ExD6St4bdeO/Gra5Z2kLXVO6E6CV3DWqxCHRtPaYRCp
	 Ia15IqXEgH6ECyZH9Fel1lLKWMUNtec8Ctlglrpxg1vlbErWolaJcjlIlKPpzOywHV
	 JzW8P/gmusgcW8oaPpuHNBa1YmWeZSwni4Xv/o/owDV7HOav2pdFbi3xxFCIuTy2uS
	 BKFQPZbQGTMuA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 13/13] arm64: dts: synaptics: add SL2610 family RDK boards
Date: Sun, 15 Nov 2026 18:23:52 +0800
Message-ID: <20261115102401.3520-14-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add device trees for the SL2611, SL2613, SL2615, SL2617 and SL2619
reference development kits. Share their common console, memory, pin
configuration and regulator descriptions and enable the populated
peripherals.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/arm64/boot/dts/synaptics/Makefile        |   5 +
 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +++
 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +++
 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +++
 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +++
 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +++
 .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++++++++++++++++
 7 files changed, 220 insertions(+)
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi

diff --git a/arch/arm64/boot/dts/synaptics/Makefile b/arch/arm64/boot/dts/synaptics/Makefile
index de71ddda6835..810d0d08c2de 100644
--- a/arch/arm64/boot/dts/synaptics/Makefile
+++ b/arch/arm64/boot/dts/synaptics/Makefile
@@ -2,3 +2,8 @@
 # Berlin SoC Family
 dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-dmp.dtb
 dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-stb.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2611-rdk.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2613-rdk.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2615-rdk.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2617-rdk.dtb
+dtb-$(CONFIG_ARCH_BERLIN) += sl2619-rdk.dtb
diff --git a/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
new file mode 100644
index 000000000000..585872307834
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2611.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2611 RDK";
+	compatible = "syna,sl2611-rdk", "syna,sl2611";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
new file mode 100644
index 000000000000..de75c9fab6a2
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2613.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2613 RDK";
+	compatible = "syna,sl2613-rdk", "syna,sl2613";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
new file mode 100644
index 000000000000..ae03638a3a53
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2615.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2615 RDK";
+	compatible = "syna,sl2615-rdk", "syna,sl2615";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
new file mode 100644
index 000000000000..ba4ea21ac505
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2617.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2617 RDK";
+	compatible = "syna,sl2617-rdk", "syna,sl2617";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
new file mode 100644
index 000000000000..58901ac2a050
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sl2619.dtsi"
+#include "sl261x-rdk-common.dtsi"
+
+/ {
+	model = "Synaptics SL2619 RDK";
+	compatible = "syna,sl2619-rdk", "syna,sl2619";
+};
diff --git a/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
new file mode 100644
index 000000000000..78a9b28fdf99
--- /dev/null
+++ b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+
+/ {
+	aliases {
+		serial0 = &sm_uart0;
+		serial1 = &sm_uart1;
+		serial2 = &sm_uart2;
+		serial3 = &sm_uart3;
+		serial4 = &soc_uart0;
+		serial5 = &soc_uart1;
+		serial6 = &soc_uart2;
+		serial7 = &soc_uart3;
+		i2c0 = &sm_i2c0;
+		i2c1 = &sm_i2c1;
+		i2c2 = &soc_i2c0;
+		i2c3 = &soc_i2c1;
+		spi1 = &sm_spi1;
+		spi2 = &soc_spi0;
+		spi3 = &soc_spi1;
+		spi4 = &soc_spi2;
+		spi5 = &soc_spi3;
+	};
+
+	cpus {
+		cpu@0 {
+			cpu0-supply = <&vcore>;
+		};
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		bootargs = "earlycon";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	soc_i2c0_pmux: soc_i2c0-pmux {
+		groups = "GPIO23", "GPIO24";
+		function = "tw2";
+		drive-strength = <7>;
+	};
+};
+
+&sm_pinctrl {
+	sm_i2c0_pmux: i2c0-pmux {
+		groups = "SM_GPIO12", "SM_GPIO13";
+		function = "tw0";
+		drive-strength = <7>;
+	};
+
+	sm_i2c1_pmux: i2c1-pmux {
+		groups = "SM_GPIO3", "SM_GPIO4";
+		function = "tw1";
+		drive-strength = <7>;
+	};
+
+	vcore_gpio_pmux: vcore-gpio-pmux {
+		groups = "SM_GPIO5";
+		function = "gpio";
+	};
+};
+
+&sm_uart0 {
+	status = "okay";
+};
+
+&sm_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&sm_i2c0_pmux>;
+	clock-frequency = <100000>;
+
+	expander0: gpio@43 {
+		compatible = "fcs,fxl6408";
+		reg = <0x43>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	expander1: gpio@44 {
+		compatible = "fcs,fxl6408";
+		reg = <0x44>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&sm_i2c1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&sm_i2c1_pmux>;
+	clock-frequency = <100000>;
+
+	vcore: regulator@60 {
+		compatible = "silergy,sy8827n";
+		reg = <0x60>;
+		regulator-name = "vcore";
+		regulator-min-microvolt = <700000>;
+		regulator-max-microvolt = <987500>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-active-discharge = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcore_gpio_pmux>;
+		enable-gpios = <&portc 5 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&soc_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&soc_i2c0_pmux>;
+	clock-frequency = <100000>;
+};
+
+&sm_uart1 {
+	status = "okay";
+};
-- 
2.55.0


