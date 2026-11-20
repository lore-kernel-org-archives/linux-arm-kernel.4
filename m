Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CB2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bnwkkHh5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JjrBR//B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cimqzB4bCIhynChpt7iVluTD5pnTnQawyp+LKN/vPns=; b=bnwkkHh5Xaw7lbLuYYuFdWWl9L
	tY9RnVl23o0Cln8Y/vWdtY7FAqif+ZO2v8VxVJoZ4UXyVEBygDZ2jJ1oTz5qDvPqAlW1Vnjc7YbYP
	0bq9vFM3Z0YHlvWEIssCooVj07HaTQ4zU8ygVqgwM1+XJuCRJIPLYKCkfXOzKTYWhegj05pI8fDH6
	93GG9BAo2CVDQ4coTpl3lzWiSGZFfQAQRClnZznZJwrTHPHHwG57Gx3PZzMfCwlnrDdIve04nqu89
	Md+BF+eB1j7jhVmYR7F2sIbPcysnf7RxS9CCFXxICvGhnnY7jGXyvbtHofneI0jANZu7WvnkaP/Rp
	16QaJ8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPfW-0000000FGNB-06Ux;
	Fri, 20 Nov 2026 14:32:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPfT-0000000FGLp-1dLh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:32:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso9547495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 06:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185165; x=1795789965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cimqzB4bCIhynChpt7iVluTD5pnTnQawyp+LKN/vPns=;
        b=JjrBR//BC4pl6V7EQM/0CcPnGSWQshDzy3L2wFIDBd7pCQ7K51bMuqdgrXuTiYLqbS
         TSPm5N4hwCLby2TqxXEzrq03a+0wBG64ekoke5FI0fBrv4WGwEXmTdpldUjuwf4uAUlJ
         szmtXDejTjcUrJ05w5H4kiUCtliE6FctzXku7fHwk2jCORzRThzOO/CbYwyZFMScSsh8
         TOHbYIK1c1cIc3/eUMCsAGZPZDSQloNNoWNQhIPOdrm9sGPiaxmgOBA5x1Ell3daeVsQ
         FOlZdd1miLKryLFrEMwubTPsfoDGs83wuMneftwcR6OpBk8YXZnocPM0/WNQEMlnJePg
         enng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185165; x=1795789965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cimqzB4bCIhynChpt7iVluTD5pnTnQawyp+LKN/vPns=;
        b=AsVa+AD4RrDuPgIezd2bx3DvPM5npIr080X5dF9uqX+DmTILFbESEzn+pkto7/Ct6+
         gVu3ufbQSHBLbc23++6UDs9Ri8N5Gy78wBXmkg5N3P9ub2F69zxx1fqLR5tc3WFpxcDe
         TwtxnxL903Cn4rewBfH4mwl+3t1ycwdC3wM+nsB4Q5Aw2uAAept/Wol36sF4qCr4ZcF5
         2HdBL3wThHK6w5X9nxgSMP7Tim7tKPIulox1JAwrLrCESoja6IoNRGcYUzG6x38T5+PG
         3oDkSqf5O8yJV15GB42agZkzgCzSk9VTtEvIgnDV36k2Js7DvMtRqbCM1wteC3FOOF3M
         AmXw==
X-Forwarded-Encrypted: i=1; AL+hErF8yU/eHY9l2kLu/eDG3ZjmC6c+wsFdQmFlegNmxyM4IN/z0ZG9bcYc+n4A9+CY7is0x4/oAPv38IAXt9C3Y3yQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/q978yMemjWE1bSeCmpaMrbkvFPS2Pfm5gtWEoxxwVX8/20UOJ
	vEvvCL3cGVdULvtPnOYQzt0J5bbnOEKO40l9A3Rrw6nU1kFgjoMR30QB
X-Gm-Gg: AYBFou2O9k782LttObmO8NtvjkibFVpkJq2R+8dCpGCI8S+CbXy9IFE1GVhsL544lDN
	XZdfdgnxqQif/ClmMNqTWL0EDaP9OmMWGfyRnWuHotpiCfdCaLLa45I5O7LwLeEf8bB+f+Tv5jG
	6nRsJhWnRxZGGBnO8jOqXbSGsFeb3HCoSx63207NFfULWRzMQ5oaNQivJGOnqC2JG6icDAYr8LC
	A4D+Ewnjr1kgIa6J7luS+96agc+NS2d/cidEHUwDaGkSK0zJKyxVYVApGUttq8LNe62QZvkWskt
	05dXszQ4HkNLGZWnXfk1rQI9nGDCCx3GihHtVufwM0LaRf9mo+PMrkCPqDCvrKAy1tzoEG+Zaqd
	3THt9SENyFCSY+cLFMh8hEEMc5wQ4t4Cm2kH4rau+qKU9xsn02tSyvegzCeIeLcDG9XX9/KM/CX
	GQEScAHT4jZac5OUlLdrLX/WKmTPeEdAViKGlJVdUtf7nZydz6dpWBxauRyZFGLsQ1MucIj9KGY
	9mTA1euLNi8hLhaohtzSRg61H/g3A7BJOpsoP0k7z4OcsVb2GI7v6tLlRgTLz5vjA1/hn1qGFCU
	HPZnpk/iwih82EAR5ZmGtDU3E+b7Jd1YzlqIfDBuMz36ixBGz3mmNmPhWf3WJi5T4cSTJa8hAs6
	ziz0ENIAAtSLj/Y6i9jdjXSsjdG3c9rTKVE8iO/qlMCOWW8A=
X-Received: by 2002:a05:600c:8b5c:b0:4bb:741d:ea0 with SMTP id 5b1f17b1804b1-4bb8880f621mr78246415e9.17.1795185165293;
        Fri, 20 Nov 2026 06:32:45 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm6378286f8f.59.2026.11.20.06.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:32:44 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx8mp-var: Add Cortex-M7 support
Date: Fri, 20 Nov 2026 15:32:41 +0100
Message-ID: <20261120143241.17297-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_063247_519172_48F45DAA 
X-CRM114-Status: GOOD (  17.58  )
X-Spam-Score: -1.8 (-)
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add Cortex-M7 configurations for DART-MX8M-PLUS on Sonata,
VAR-SOM-MX8M-PLUS on Symphony and VAR-SMARC-MX8M-PLUS on Echo.

Share the reserved memory and remoteproc configuration through a common
include, and add board overlays and combined -m7 DTBs for remoteproc and
RPMsg support.

Mark the UART, I2C, SPI and CAN controllers used by the Cortex-M7 firmware
with "reserved" status. Disable PCIe on Symphony and USB-C on Echo,
since their reset and role controllers depend on the I2C buses reserved
for the M7.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/Makefile        | 13 ++++
 .../dts/freescale/imx8mp-var-common-m7.dtsi   | 68 +++++++++++++++++++
 .../freescale/imx8mp-var-dart-sonata-m7.dtso  | 31 +++++++++
 .../freescale/imx8mp-var-smarc-echo-m7.dtso   | 36 ++++++++++
 .../freescale/imx8mp-var-som-symphony-m7.dtso | 36 ++++++++++
 5 files changed, 184 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ae28e6b02a5c..3745688a5b4a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -723,9 +723,22 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-ultra-mach-sbc.dtb
+
+imx8mp-var-dart-sonata-m7-dtbs := imx8mp-var-dart-sonata.dtb imx8mp-var-dart-sonata-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata-m7.dtbo
+
+imx8mp-var-smarc-echo-m7-dtbs := imx8mp-var-smarc-echo.dtb imx8mp-var-smarc-echo-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo-m7.dtbo
+
+imx8mp-var-som-symphony-m7-dtbs := imx8mp-var-som-symphony.dtb imx8mp-var-som-symphony-m7.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony-m7.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony-m7.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
new file mode 100644
index 000000000000..9d554a175fbf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Common Cortex-M7 configuration for Variscite i.MX8M Plus modules
+ *
+ * Link: https://www.variscite.com/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vdev0vring0: vdev0vring0@40000000 {
+			reg = <0 0x40000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@40008000 {
+			reg = <0 0x40008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@400ff000 {
+			reg = <0 0x400ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@40400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x40400000 0 0x100000>;
+			no-map;
+		};
+
+		/*
+		 * Keep this region aligned with the Cortex-M7 DDR region in the
+		 * boot firmware's RDC configuration.
+		 *
+		 * RDC DDR addresses are encoded as:
+		 * (physical address - 0x40000000) >> 1.
+		 */
+		m7_reserved: m7@7b000000 {
+			reg = <0 0x7b000000 0 0x1000000>;
+			no-map;
+		};
+	};
+
+	cm7: imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&m7_reserved>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "m7-reserved-ddr", "rsc-table";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
new file mode 100644
index 000000000000..c5cc032fb4be
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite DART-MX8M-PLUS on Sonata-Board
+ *
+ * Link: https://variscite.com/carrier-boards/sonata-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-var-common-m7.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&ecspi1 {
+	status = "reserved";
+};
+
+&flexcan1 {
+	status = "reserved";
+};
+
+&i2c3 {
+	status = "reserved";
+};
+
+&uart3 {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
new file mode 100644
index 000000000000..2b91511084f4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite VAR-SMARC-MX8M-PLUS on Echo-Board
+ *
+ * Link: https://variscite.com/carrier-boards/echo-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-var-common-m7.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&ecspi2 {
+	status = "reserved";
+};
+
+&flexcan1 {
+	status = "reserved";
+};
+
+&i2c2 {
+	status = "reserved";
+};
+
+&uart4 {
+	status = "reserved";
+};
+
+/* The USB-C role controller is on I2C2. */
+&usb_dwc3_0 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso
new file mode 100644
index 000000000000..710ddff2fb11
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M7 support for Variscite VAR-SOM-MX8M-PLUS on Symphony-Board
+ *
+ * Link: https://variscite.com/carrier-boards/symphony-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-var-common-m7.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M7 firmware. */
+&ecspi2 {
+	status = "reserved";
+};
+
+&flexcan2 {
+	status = "reserved";
+};
+
+&i2c4 {
+	status = "reserved";
+};
+
+/* The PCIe reset GPIO is provided by the expander on I2C4. */
+&pcie {
+	status = "disabled";
+};
+
+&uart4 {
+	status = "reserved";
+};
-- 
2.47.3


