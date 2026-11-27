Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fds4RHY6;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=uyVvfU2L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+HFIONYMyMDDZopTqPOG1qW817WGxvF++upBMBAVHVk=; b=Fds4RHY6CXZj4E
	8UjACv1ApxG4dtcZgqQ2X/Mn6FZHobkT2WuamaYVhjh1uerD/5eHuFl696nP2xNrddQpXUTETwbzA
	PQSZZAjJIvDKUt2XHQ0yVUOTLoKWKcwaiiAE2M31RZlv3GX0LrEgBIZHPN5s7hU3bSj2w4pxtGoOh
	c1Nw8cdrcta1EEPzAMnltEoFRaz0dz9m/T5Tmh0+b5K0BjBhLUEZxceNR7r9xbOerGlw55Bd2btoO
	pSOSSt2AlWD6Pyn9G3qXX9nCDGMWQJLEQaWclgVu/Y/NttSaa3YzY5YaNL1DNWWcIRfIoYy4RvCbb
	wQpI4DfLX95zj0rpzoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpqY-0000000F54A-2UBE;
	Fri, 27 Nov 2026 06:54:14 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpqQ-0000000F514-2uzk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:54:07 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 4DA8B4C958;
	Fri, 27 Nov 2026 17:53:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795762438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HFIONYMyMDDZopTqPOG1qW817WGxvF++upBMBAVHVk=;
	b=uyVvfU2LFFgEShveIp6KudfaF9C0VMwOrGyn1cgY0PmfJeehYB77FRi7zVcgb1sXpa8A6J
	0ZA1Dehmwpg73Q22HmGzdmcnVsiWdpJuUhZP1aytn1yLNyt3d0K4q2n9kVpXUVq/q6wd5x
	GdfIWMLBGlbEXuyI4HDF142MwXRPf7iOviInUl9ARy8NTB60nHHAN8Pzw5Ii7RsF5JvaHC
	RJVzlkvfpSu8YdF3ppDfzyri/WkqY885h6unkLmnPCw41XCIWKfoYQ0F0Ha0xPlING3Din
	adXQ6xbtgWPIwyDJQqZeP37UdKOBNWAMCgW3WHL1OZfcpwvmqNIq4rcg2bDXPw==
X-GPT-Reason: legitimate; the message is a technical patch submission
	for a Linux kernel device tree, which is a standard developer activity;
	the sender (alastair@d-silva.org) perfectly matches the recipient
	mailbox (alastair@d-silva.org) and the content is non-promotional;
	there are no phishing signals, no URLs, and the content is highly
	specific to technical development.
From: Alastair D'Silva <alastair@d-silva.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH v2 2/2] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro board
Date: Fri, 27 Nov 2026 17:53:43 +1100
Message-ID: <20261127065343.1449675-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127065343.1449675-1-alastair@d-silva.org>
References: <20261127065343.1449675-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_225406_890553_F9E8E9BD 
X-CRM114-Status: GOOD (  14.19  )
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

Add the initial devicetree for the Xunlong OrangePi 4 Pro board.

Enable UART0 console, SD card (MMC0), and the AXP318W PMIC on R-I2C0.
Omit audio, WiFi, USB, and Ethernet for follow-on series.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index cdeb966031ee..199ce022d94d 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -72,3 +72,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-orangepi-4-pro.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
new file mode 100644
index 000000000000..374287d962a8
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2026 Alastair D'Silva <alastair@d-silva.org>
+ */
+
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Xunlong OrangePi 4 Pro";
+	compatible = "xunlong,orangepi-4-pro", "allwinner,sun60i-a733";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&hosc {
+	clock-frequency = <26000000>;
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
+	disable-wp;
+	no-1-8-v;
+	vmmc-supply = <&reg_dldo1>;
+	status = "okay";
+};
+
+&r_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+	clock-frequency = <400000>;
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
+		regulators {
+			reg_dcdc2: dcdc2 {
+				regulator-name = "vdd-cpu";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-always-on;
+			};
+
+			reg_dldo1: dldo1 {
+				regulator-name = "vcc-sd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
-- 
2.53.0


