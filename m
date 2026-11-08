Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B63606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 21:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zQu3LGMQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IYkctm+P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nwKFqp+H5YggATRuxpPQ2JLO3+LdBN2PnTSM+VuGKKc=; b=zQu3LGMQlvnfI0
	DivXacCVUmX3BgaNdlxrkbdJeGJx27W31Dslla3O7nziNV/b319ZrzfrKm+QpAoNIRcOcIGM07PNf
	BGj80dgzZ4QraFOtPeMMuzxynbIiL5Ys1iOe+xhMF8LWmtLWD7H9rAhbwwQ4ms7DHDsCuqQ+uyF1w
	RPDylDMm8hQE3SKGqdWSJXrUq7hJJSW2iX7ILYGGGg/pk/mF3V7/46Zv8f0c18UsOntkIj3k9GAPz
	Utb5JPq7VRKPF6We3dhkHSVHort/E0w5czbyliD8GjcsiJyc3COz/H4etX6ZoLqeG9hdpaTsI5bhH
	Z2RHiSbJl6RwMo8MLwBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAmZ-0000000GlDX-0gOR;
	Sun, 08 Nov 2026 21:50:35 +0000
Received: from mail-dl2-x09.google.com ([2607:f8b0:4864:38::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAmW-0000000GlBz-1Xb7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 21:50:33 +0000
Received: by mail-dl2-x09.google.com with SMTP id a92af1059eb24-19305bcb6d5so123901c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 13:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174632; x=1794779432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwKFqp+H5YggATRuxpPQ2JLO3+LdBN2PnTSM+VuGKKc=;
        b=IYkctm+P6ZDe0ZNsSc7sBp8a8+x1f6i8htZFemPjVWDUwo8PVU45e5xnAWwL1sfkPQ
         g1SzWgsdO0W0R2muWt3t+FEmYDvQaQcjjpiEr5KBqwdTfBwhlEbpDsHVaxNB03wtN1Oe
         gOhWHsU11reSmw5F0tAsBa3j6o95cty/GSom4Aowxa3V1Yn296b7fgyO8AmYVr+ZhtRG
         8A/OdVdu4iov1Ta4g763A0ok1UNDMVuKHGuD6O/a/hpCQnG2VJ817hPn3HmRmMAz9HLb
         lIgKLI+kY7C4jAQ8u+ePAy+VdJmL/DO6h89oDYq6gdHR6Uwzm7nkbWtvopXY2w2e/0R7
         Aigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174632; x=1794779432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwKFqp+H5YggATRuxpPQ2JLO3+LdBN2PnTSM+VuGKKc=;
        b=cJmaQ1mKUOTJE14MdmydpCcOy8E3iIOqz0JepOjRtOAjcqi5fuEVT6GRxkh/8UIkB0
         9EJMXQyxZcCXzbBZ3gO/wT8y3+gBlMRgLlMtJblWk4BdLCHZd3oQCJE2wL83qGBQn/j7
         m3++tSRN6weDDyJ9wnJfd91dF3UGbRgFtd4iTyeZrI5BUgx8DacFVqA1wrnprMZDfJbu
         ZGBj18GD9/vh44SNgc897gktrHk+kd5MeNLU4GDpBUexhnMyrcoQbiRHDvV88vugqENn
         f/KmGLGLt5Q/JzObHc2iigCjqT4IJL97n7yVD5HrWR99y3wJ8941inIN0lUN/8JVUCms
         jlEw==
X-Forwarded-Encrypted: i=1; AL+hErGDSUNCx3+Jwcq+7sDl6hgNrA7YLWyEpQn3VipknmplSaRhZMEb6XDjeT1OLlAIwjcFZoCtd0Ti+uxWJ542C8kd@lists.infradead.org
X-Gm-Message-State: APuU4Z8HtFlxeBo1xB9b4IY93Kl2j5Si5OpwkMgsHzwFNNmonGgs8Pgf
	X/c5mhz/p4LeDIbaAzuFqmpTlddNPvbqo2mXSY+Fpln6+hUhUqhaVxjW
X-Gm-Gg: AYBFou20uKyRgK7Hd4T4++WpWGttFC9nftSvPGRDm8kSK8NEkhLdPkvpSJuo7bZwzpm
	jCSf7W235DUKEoHUS6LmNiRt+/ta31IejDOAfkNWsPEuzemAkn5j0ABujZyaB/ujd+lMDgrHxGs
	wPPf2+6neYKPXu/Y1nu+T0olg4owcj40TII1cLvS0vlD1ZR/rbcwGfL6jhOTSa227h4GI/21iDz
	oITckyfsgTZvL8t2BPSLRZQ3BvQbWPQZAVL0dwA1yxaeDZAiNMV6UEmUBpSdgRl+84beWlIVB6D
	pwjyiBff1YVpU1isnmFE561bpKwXZldUKOPaCl2IKCuQQ8qdgnXsJK0alFUKpxHsBURTjnqnDqE
	vU+sqoKxGhmKknhrI69mehWyIkqkiQH2bphHCA2n/G358wBYy8akYX29LlS081oFMiZ+CeszGFk
	ySgDma5sO5FOGzYvYqf8gOBEPEuq1znhCJHfffDJRO5G7ZEPUt7czntFDgrD6ED76C3nxZv8KRq
	bwszkOJl8sHCU096fZ5gp9Pf56IDWpz81kjGPH0BYsvm3kee5op2gEqid5VZ0h85fSGP2nRN7pM
	Xx65apMUfAAXI2eQeyRPAomQJv9iV/zusIZXii+y4p1pTMR+1A==
X-Received: by 2002:a05:7301:da07:b0:369:fdae:c9fd with SMTP id 5a478bee46e88-37256038e90mr5078656eec.13.1794174631525;
        Sun, 08 Nov 2026 13:50:31 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm7587575eec.17.2026.11.08.13.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:50:31 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Mon,  9 Nov 2026 05:50:10 +0800
Message-ID: <20261108215010.351256-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108215010.351256-1-cyan2254650260@gmail.com>
References: <20261108215010.351256-1-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_135032_413677_9864816B 
X-CRM114-Status: GOOD (  17.90  )
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
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  72 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 137 ++++++++++++++++++
 3 files changed, 210 insertions(+)
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
index 0000000000..2da08424f1
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
@@ -0,0 +1,72 @@
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
+/ {
+	pmu@f8891000 {
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
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
index 0000000000..4dfef96ad3
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
@@ -0,0 +1,137 @@
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
+		channel@10 {
+			reg = <10>;
+		};
+
+		/* Spare pair: XADC_AD12P/N, F19/F20 */
+		channel@13 {
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
+	ethernet_phy: ethernet-phy@1 {
+		reg = <1>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_YELLOW>;
+				function = LED_FUNCTION_ACTIVITY;
+				default-state = "keep";
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


