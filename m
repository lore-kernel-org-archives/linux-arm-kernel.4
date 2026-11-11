Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D3B606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CZXa+onB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rPz95Sb4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Yp8lqH6axhct/I1kovHzSzHwkmW7n4Ch/SpgYzqnw64=; b=CZXa+onBZ+TvMC
	WqT4ywjDU869k07GUYi+EPB90NJ24DQhYiOGyuc64K9xB1cyt5ZaIkzsFkmNo0HYmEfw30tlliX+j
	AkkdoceXczRy21RgZ3ed7epHo/UBjCmoDNJMTYanCPPCytzXwTBXERXAhS6PAjUif4umb034hMpgX
	6o4gvdp2RN77ULYnhsmIRLkMS7fLadOAM9gqqXyrOSVJ9TBkTJXJrWLJ4fcmXSbOswVZCCucI+hul
	QarE9D/4dx+borAevl6RkJqkYyuiYvK9JKRS7ayrOLKih2mBiEGHeqVC347Mktwv7ZSEdfzYozkz+
	sWwuGhCzTVpvYWC81T1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBCe-00000007CCZ-0eUh;
	Wed, 11 Nov 2026 16:29:40 +0000
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBCZ-00000007CAd-0Edu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:29:36 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-3678f64d078so3947667eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414574; x=1795019374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yp8lqH6axhct/I1kovHzSzHwkmW7n4Ch/SpgYzqnw64=;
        b=rPz95Sb4YKgOuYnDjx56qJAJi4fKp70U1jo36l0TxK8ZF5Z0QHNmUogFmccZ6qQxiw
         lK2IPzz5bu2kXwYtvKZh4JL2Ab3fxxyQpceM3Bht5Fg7PxTXi2VOXiYVcUz0s/RNP7tC
         cgJFfLfFa2FeCozY4IZREMAqWzg6Q/y6IUEAQnDxM1MdmzNK9Swnbf+Hj+nr5E6o2yf8
         4PspUgdD95kHUvLzUZcJZXVDcbQuKok6Kg9iSlS9bo4lJMQBN697OyxqoYLMlRL0R/Rx
         BoG0GVgbDDDaXKCpU3jM6Bye8Zbfj2DWX/B2Cxph6wes2ZdvWxR2oSNrWN48nkJfbxna
         c20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414574; x=1795019374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yp8lqH6axhct/I1kovHzSzHwkmW7n4Ch/SpgYzqnw64=;
        b=QsyD2oZ0MnPivfW7fWZpY1DDinqboAZUFUfe/NNJpChk1+NZ0q9hWBaU1Bi6s9oFP5
         vs7Af/Sf5EjzFfu3g30jwKpSSdLwYf8K/hUV6ILNkdQ3+GOz6U9YQFybOtn4SNiDFI6t
         dRbACS0UJJdrBu5mBD2fvxQvI/Pw65Qsyup2ssP9+jeLyBN6mfmWrwvJ5WzLBUj16uMv
         aY4zHFWz9eMmCIy8bduoV+CztFY+flopC5i0/5Q9Uzm4MyIc0dPacpyfiGNBAgL3pqEN
         3tzS3zlymdKZPdDPyRiouqDVs35t6dxoeRijnDa83Uu1xnKl6lKn4wSYNSSTKmWNoqRD
         +YBA==
X-Forwarded-Encrypted: i=1; AL+hErG+I7qoh7UL13/EO48vPHZtLxv7QyLVeI3Y8HdqCjFn7n7dOsyyD7NhGrXBQiVK5/EN6lDv+zA/37mv9Lgk0lFI@lists.infradead.org
X-Gm-Message-State: APuU4Z8l7p/+FJuigY12pWx+1TKDz2uqhn2YnLnSIY0X6f2lPB9ZP0WT
	79az4UVSRW2Jqopboi36tIFrrBh6OToQE/t0UfiwB/6TY9tcvZysZCxM
X-Gm-Gg: AYBFou2RFEwWwweJ1cvKOarD/z4bLceJ1TSWLRFk6RxPKVJIk5w0yRz7hDF2Did3exN
	U+g9Mzbbc+XK3XyPfsK+Tb5dXJIqyQA8vAccAJ2oqbC9FPjqrlzYwERBJrwvG5F7+rA/3rYuRx4
	44KjFTazaTzHkGtSqw9s3jM2qf257bzhmvnJEuqwAI47LVm4GRmg9q7bvEmnyFp3wzvqJBxQmbZ
	c/iHtkL+Ap0GIhIJN17QbJfDWNYnK6/epeBdsKl8L6Kh+JCPi3jmiZyBnhPPojAIM2ULu4zLSQ3
	xlrjSV3sPs19STlkxzOBFAzFky3jVit6c06kGhoLUfMzEKhGdMwKjHAA8+VL4oPijZyk9aveQg2
	l6Gd1W9p52phuEsZRei9ec1Hc7UBgo3oTUaIOcrq2ckDBOv4fP6tG39joFzT2qSt/5ivHhp1aZt
	G/nRDpvw9e3jrKz4FGAyK/r0fJ+KR0/NeZheTpahpuZ93+RBXfY6DoMuhbC5yqfZxqPA3sYtUNE
	jkS6bLTKwEWmZ/aSjfyEyfUk+cBhEXoNOyYy3froIruP2XA2VimIq1GOlqDklvvTnpvcgp4SMBr
	KaEJstuujHpgrEhKKsxRszrPl/UYaHLzqWeEmYsVRZnQZR2JpA==
X-Received: by 2002:a05:7300:681c:b0:36a:18e2:64c with SMTP id 5a478bee46e88-37685d72786mr3532806eec.11.1794414573884;
        Wed, 11 Nov 2026 08:29:33 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm34892599eec.16.2026.11.11.08.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:29:33 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Wed, 11 Nov 2026 11:29:17 -0500
Message-ID: <20261111162917.97532-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111162917.97532-1-cyan2254650260@gmail.com>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_082935_520796_3AB96307 
X-CRM114-Status: GOOD (  18.39  )
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

Add devicetree support for the ALINX AX7Z020B development board.
The board is built around the ALINX AC7Z020 system on module with a
Zynq-7000 (XC7Z020-2CLG400I) SoC, 1 GB DDR3 SDRAM and 32 MB QSPI
flash, and provides Gigabit Ethernet (JLSemi JL2121 PHY), USB 2.0
host, MicroSD slot, dual CAN buses (SN65HVD232 transceivers on
MIO 10-13), I2C RTC/EEPROM/LM75 and the serial console on UART1.
DevCFG FPGA manager is also enabled.

The two SMA AD inputs and the spare differential pair are wired to
XADC aux channels VAUX1, VAUX9 and VAUX12. The XADC hard macro is
always accessible from the PS, so expose these channels via the
driver's xlnx,channels property.

Link: https://www.alinx.com/
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  70 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 142 ++++++++++++++++++
 3 files changed, 213 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

diff --git a/arch/arm/boot/dts/xilinx/Makefile b/arch/arm/boot/dts/xilinx/Makefile
index 9233e539b1..5c4bcd9492 100644
--- a/arch/arm/boot/dts/xilinx/Makefile
+++ b/arch/arm/boot/dts/xilinx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ZYNQ) += \
+	zynq-alinx-ax7z020b.dtb \
 	zynq-cc108.dtb \
 	zynq-ebaz4205.dtb \
 	zynq-microzed.dtb \
diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi b/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
new file mode 100644
index 0000000000..1e80045cdc
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DTS for ALINX AC7Z020 System on Module
+ *
+ * Copyright (C) 2026 Pufan Jin <cyan2254650260@gmail.com>
+ */
+
+#include "zynq-7000.dtsi"
+
+/ {
+	compatible = "alinx,ac7z020", "xlnx,zynq-7000";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+	};
+
+	pmu@f8891000 {
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
+};
+
+&clkc {
+	ps-clk-frequency = <33333333>;
+};
+
+&devcfg {
+	status = "okay";
+};
+
+&qspi {
+	bootph-all;
+	status = "okay";
+	num-cs = <1>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "boot";
+				reg = <0x00000000 0x00500000>;
+			};
+
+			partition@500000 {
+				label = "bootenv";
+				reg = <0x00500000 0x00020000>;
+			};
+
+			partition@520000 {
+				label = "image";
+				reg = <0x00520000 0x00a80000>;
+			};
+
+			partition@fa0000 {
+				label = "spare";
+				reg = <0x00fa0000 0x01060000>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
new file mode 100644
index 0000000000..472d9fcaaf
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DTS for ALINX AX7Z020B Development Board
+ *
+ * Copyright (C) 2026 Pufan Jin <cyan2254650260@gmail.com>
+ */
+
+/dts-v1/;
+#include "zynq-alinx-ac7z020.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "ALINX AX7Z020B Development Board";
+	compatible = "alinx,ax7z020b", "alinx,ac7z020", "xlnx,zynq-7000";
+
+	aliases {
+		ethernet0 = &gem0;
+		serial0 = &uart1;
+		serial1 = &uart0;
+		mmc0 = &sdhci0;
+		spi0 = &qspi;
+		i2c0 = &i2c0;
+	};
+
+	chosen {
+		bootargs = "";
+		stdout-path = "serial0:115200n8";
+	};
+
+	usb_phy0: phy0 {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+		reset-gpios = <&gpio0 46 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&adc {
+	xlnx,channels {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* AD1: XADC_AD1P/N, E17/D18 */
+		channel@2 {
+			reg = <2>;
+		};
+
+		/* AD9: XADC_AD9P/N, E18/E19 */
+		channel@a {
+			reg = <10>;
+		};
+
+		/* Spare pair: XADC_AD12P/N, F19/F20 */
+		channel@d {
+			reg = <13>;
+		};
+	};
+};
+
+&can0 {
+	status = "okay";
+};
+
+&can1 {
+	status = "okay";
+};
+
+&gem0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethernet_phy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet_phy: ethernet-phy@1 {
+			reg = <1>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					default-state = "keep";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_ACTIVITY;
+					default-state = "keep";
+				};
+			};
+		};
+	};
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1338";
+		reg = <0x68>;
+	};
+
+	temperature-sensor@48 {
+		compatible = "national,lm75";
+		reg = <0x48>;
+	};
+};
+
+&sdhci0 {
+	bootph-all;
+	status = "okay";
+	disable-wp;
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	bootph-all;
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	dr_mode = "host";
+	usb-phy = <&usb_phy0>;
+};
-- 
2.56.0


