Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8860606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rKZ9ZFhS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mouDwUea
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I1+vR9QxfCce51TW0jo5Fo/3ZflfP0wWJngCGR19FuU=; b=rKZ9ZFhSByUa0R
	i/pHDj2VlUpLWXI7LUzhPmRBk6XoTi50eajKS5excrxMYyph3R7IQXbQybdluulDa7f3KJEQPGlad
	PVW+7J6LrZLEMPPjNt6DJl5YuGMq7TZ4KFR/rkWMyfllpGLVM93vsYvSU074aDpNC6w7VpaQupzG8
	J8ZmyElTG1Rpf0NDtFJhrUBjfFd5lyhRR9bbCQhNfEYk5PrqqbOrfDIhnDRgGpEdi7vbFff0VGkmK
	PwxkQvIxL99EE0X6BfYLBB9hPkPY5DXDEngss2Y7xLRt3q6i2VBVZatZBTkj9XRcD++GVfZizHTLj
	6BmQhF67+bPFcQ32Ka0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaXi-0000000AxAE-34tT;
	Thu, 12 Nov 2026 19:33:06 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaXd-0000000Ax8U-0ZNe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:33:02 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-3712b6d9843so249752eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 11:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511980; x=1795116780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1+vR9QxfCce51TW0jo5Fo/3ZflfP0wWJngCGR19FuU=;
        b=mouDwUea2fEXhXnzq/wWgTPpQTS8RPt26aqZzH5eYhHsXD/qzhJ5vavyLMoYm3+C6k
         x78GtjmIHPhyA0j7d2941d1PGa2wdIF/2EmXt7ZMl8JSpL/SXNBE+euxYsq27oHapuRU
         2ge2rz4iW9mb1zKGr2ZDT7NgvXt+m5m48rh5F5s8i5R55mCKvQtNwRIZw2IacQDBfcHc
         RKPd3ES6ALXWV3jzKjWuOhzLJbvuxT/sHKJkew2qNaXzkWIdFuwq1aixq+m5iCDw05Qe
         HBVZPPHr3rzihT/cMPgBOY00TWeP1782xnnsjXdbNPhy4/mgAuS2aOpVmZgK2rQziNzg
         /wAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511980; x=1795116780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1+vR9QxfCce51TW0jo5Fo/3ZflfP0wWJngCGR19FuU=;
        b=eLhIfinsao8pyypLF7pz7jr+IlrH7psRzuJJmF1UEA/xzq4so/o/sOnBKowz9A1OHc
         ESt6+gUBX8PWoSn7yR/lh1KwJJR13+GX4zVjVuNa+R7robY1WxOd3+doCWM55nW0T5TR
         +v/bc8Jgt62AQS+fgxHG2e0TwuNCJ09X6Cqvnl7+Dbl/mCzuNW5Dwjm1CNGxNTC1i3Ay
         UI4HlQdi/emL+Ki2xhxDBYXS3kgivovfM/gVzimWRSiPlXs3ZxM84ThVcxJUzKSON4rm
         oDvakuDBWuSuIvPf3HKUZezaZBf92/bNqwSpzUcjzWPe8Jh9JIUAcyV+zW+NSQ/myPo1
         Noew==
X-Forwarded-Encrypted: i=1; AL+hErHFvmgR/N2sV05X0MPPWcu8/8wYvONaoOQFK7oJamn2S7OGyeKo2zS3JhbMTxioU4SSXh1ExIwGStCbexNPm/wi@lists.infradead.org
X-Gm-Message-State: APuU4Z8rBEdFAQjY9g4B6Xva7b2Sal3Kzx2TzJrud80ucofv85hPSkM5
	twg1GoNx5YsvTdLJNVhdAgqRuBUJkdbhxyYnGnELUUvhylv+HGMJzz/0
X-Gm-Gg: AYBFou0tJfHY8JZXvSOKQteCHIdAXwlo9a4YKpK/n7J8Tx0bwyTaghTBZCpw5/3vtS3
	rElMTkFBoiK5rHXyomwJXbMY7dRZIY5g3SXdg2ephEJSuK8P3uaqbUDaovSe3yPzxgLlT0ja85g
	BtRNsDiW295UAAA6n7CeS+EH0sOeSGuYRjTO5oOe8RazK7vn4lsmbdW5cmHG95CK7ZnupE2TtNE
	S9uP+n/QHIDrnsZ2UdBvkcm7zDF4OIBW+mUefqmEXFF9Km8PtVuMIrIzbVAgbkEpDLWRu68pj7z
	2gCNvfJ41bbNWMuU1TYwIuszhaLt3lDpw4/FLOqcER3yO7M8ZMQLbTN0evyVtp+8dpdIH0NkXl0
	83aJIoTuAHwpf0edHKpWLZwk5KbOC7SXTfZVQ9F6AMyPzhNp3aA9Yo6JIYP2AxHrzlKCOU5Y+Vb
	zSHeQrbp0rRJDvPUefYjibxQ2QztvWu9T4qNYx7yk6feLfAMhsxRvmyNAyQKw0ggS7L6bZ1QZ2/
	+5+MkbI9KM038jcjRuF4efOMo+Z6vvpOKTKt0acs627SJLXMu9Duq3q+KpaDwVE+2Yj4TiNwO4s
	N/Or5+X1MCwTfC8yF2TlV5UVOo3+gmE3JHvRXy48oSwMyQuiKw==
X-Received: by 2002:a05:7301:713:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-379684ae563mr104749eec.36.1794511978886;
        Thu, 12 Nov 2026 11:32:58 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm565379eec.14.2026.11.12.11.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:32:58 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Fri, 13 Nov 2026 03:32:45 +0800
Message-ID: <20261112193245.250149-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112193245.250149-1-cyan2254650260@gmail.com>
References: <20261112193245.250149-1-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_113301_192979_7E9B9246 
X-CRM114-Status: GOOD (  17.99  )
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

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  71 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 146 ++++++++++++++++++
 3 files changed, 218 insertions(+)
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
index 0000000000..d60e58657b
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
@@ -0,0 +1,71 @@
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
+	num-cs = <1>;
+
+	status = "okay";
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
+				reg = <0x00000000 0x00500000>;
+				label = "boot";
+			};
+
+			partition@500000 {
+				reg = <0x00500000 0x00020000>;
+				label = "bootenv";
+			};
+
+			partition@520000 {
+				reg = <0x00520000 0x00a80000>;
+				label = "image";
+			};
+
+			partition@fa0000 {
+				reg = <0x00fa0000 0x01060000>;
+				label = "spare";
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
new file mode 100644
index 0000000000..f232371a51
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
@@ -0,0 +1,146 @@
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
+		stdout-path = "serial0:115200n8";
+	};
+
+	usb_phy0: phy {
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
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethernet_phy>;
+
+	status = "okay";
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
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	temperature-sensor@48 {
+		compatible = "national,lm75";
+		reg = <0x48>;
+	};
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
+};
+
+&sdhci0 {
+	bootph-all;
+	disable-wp;
+
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	bootph-all;
+
+	status = "okay";
+};
+
+&usb0 {
+	dr_mode = "host";
+	usb-phy = <&usb_phy0>;
+
+	status = "okay";
+};
-- 
2.56.0


