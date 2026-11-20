Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9960606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QF4YhkvM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FW2Zc0mP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/hW96zxuTk5ld/IlSdO1JUuxAcYc/tMjLiVGZKJqIFk=; b=QF4YhkvMuh3dYVMdXlQnvfduPL
	gQmx4dvzTLL/FVwUrm4Po50kcTFu+BFIJjltjE3eh719ruEzS7VBF54IB1PBSkmXh0MqrT3bQX56r
	50yGItIk1sjfcyKvgUiys4/T6pq1jJnXp/g2o6CXVm5zwLk1k4aCBr4ViRxl2j2559qb3Pl+eyDDF
	oIHOqPwtZsbPnPDshc4oIjnYdMVHeCrospCOuhfuXPIABhJt1VBEYQejycx42bitoWB7ETsZ6USpS
	y8B1GyMOv+0d98RDQ+p1SWUZMoqpP/t0ZGWp4Zn7PFW0086Hbq6YA4ADBmOyKE1cMjFkbiKG+dLFN
	NAi7BJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL2L-0000000ETJT-4A07;
	Fri, 20 Nov 2026 09:36:05 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL2J-0000000ETIl-1mR0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:36:04 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-49d64a88222so1164055f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 01:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167361; x=1795772161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hW96zxuTk5ld/IlSdO1JUuxAcYc/tMjLiVGZKJqIFk=;
        b=FW2Zc0mPzpygspL34Q744+LXytP28oZacqL49igHxPf58DzQR2mfs1vInY0lcEP5A3
         lmI1ILcuJH9WjmMVLEJ9W8wGDyWqroO16koW5e3qhhZoCVY3TXRGvbRhgZdAEmI67IS9
         Eof1uTjT1qCy20/6KFNQRlCYLyIABXc4t316EV0n1OcOHlF6xJKyEIOPVcLINc9qSz9X
         RNcTSNociRdst7oqgoNm6R2kDVtrVTRiuzrSBqJszCuvM2FoE3G17LZ/iQkuHzZpzCSy
         qJxcJTtTuA+jGUX5KtescYMhqip6iiqmmFKULcqZB/yLqupihgzDshrGO2GOmmU/bA3S
         A2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167361; x=1795772161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hW96zxuTk5ld/IlSdO1JUuxAcYc/tMjLiVGZKJqIFk=;
        b=y0f6xkQtZv7pdO4EFvI051LSZP3w9hGjwGhcHXIdsjdm3D0VWSUa6fl/AJUHbw1Icm
         xHi3u+nY7Wlw9TEASXksL5v0/aR3EDntl4lUrmtMMwYbWr2ULKljNePaxoU6Fkcq/yX9
         NFqZZfSVUMUjb4qXXcYOpacUwW4cizOMTJsOgMpAXndlX7ZIMHK2yEaFJbkLuDPfsZR7
         d5WL93vxeZd5hAlI7i4o1HFrWGqEQx3J7U/mKHDrxXrPy+k08ZXoDcWm+k1c7T2tEdyn
         /fOZwCTCPzd0WVsXvgDr7t1E1pnW5bz5zLaD+JDyKrO3Q9itNCoVRfHLM03dVQWZs6GE
         fd2g==
X-Forwarded-Encrypted: i=1; AL+hErE4X8AVYsckv9jSy4EYQOlNV/NmgtBp1u3I4QaqNu94r2bg9hLjAi6TJssvYUq6qVmvxMkhXqp//OfJFcc0yBdK@lists.infradead.org
X-Gm-Message-State: APuU4Z8BHMbiIPw/ESY3WiuqIoTi5TzbyyaSKlSDo5k7XV7Wi5hm6YII
	+SVbG8W0NLbw71FYmbA/yg3DDk3zltvgfbrVAA0TBq+SEWatiD2Q1gIk
X-Gm-Gg: AZFdTZfJBEugNBi0Ri47NSv/WTthoP4SE8yl/J0p3e2Ww9NVX6cCf6xeTAIQAQN6E29
	8E9rE/Rnyx37T17zkbpkuwL/eIcOu7KlQnMNyRgt86JMsXDnUaFzApJPgMrkyxKIvFzDsB19Gc6
	unrAQh7RHzDX1A8JtaqOzsgAH8/PZ+G4kpY6/ZA7js6SC/MB64Jys4QxoCAsyNb0+Eqq0qD9eBA
	It6RY6cGZzvo5jUkCUSj3JzjHyGC5QP9CN9ExNyevcetnyl+yryB7DAV/85sr60c1YyVYZzEDdA
	joY9v/zy+3axJ4vzFiCs9ttJ2atPk1iQS+oOoLR4yxSDMzvSDfUpzgciXFl+5v8WxCiN5ReL7ut
	HbWuz+TBYVwyGJZlBavoLW5cL+PtZvKHlbOqxF1FD+Eopk1km7tzmEE20hWzQdqIxXuzaKxy3V+
	IuZKQw7cT8StA8k4Z8uM/qwfBuTumcG2mFGtMzBkXkqYzcMI9AzFaj2kWibyWmHrz8QfcuIdtzZ
	nBuiLOr9319UfzFtUVzSmt5w5mfB37wIEc5Xq7A2O8Rw3frn+HRZR5Ovr4KUjf8Iwva/qMFTLbJ
	e6FlI4Y2URyGF1/nRBP2G0QSuEw7gYDqG7t+VtkNLqzT7FGOvWEnbQImHYKgC10AZxnVVSCjnh2
	FOifITtDjkZTVyDMkwFvLvQxglleEveSuIEWURXcJ9VzZfq4=
X-Received: by 2002:a05:6000:184b:b0:4a7:9630:7b36 with SMTP id ffacd0b85a97d-4abb3f15ddbmr5085151f8f.21.1795167361168;
        Fri, 20 Nov 2026 01:36:01 -0800 (PST)
Received: from GLaDOS.station ([193.207.34.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm4664645f8f.57.2026.11.20.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:36:00 -0800 (PST)
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
Subject: [PATCH v3 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Fri, 20 Nov 2026 10:35:57 +0100
Message-ID: <20261120093557.4513-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_013603_525334_16EEE957 
X-CRM114-Status: GOOD (  19.21  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add Cortex-M4 configurations for DART-MX8M-MINI on Sonata and
VAR-SOM-MX8M-MINI on Symphony.

Share the reserved memory and remoteproc configuration through a common
include, and add overlays and combined -m4 DTBs for remoteproc and RPMsg
support.

Reserve ECSPI1, I2C4, PWM3 and UART3 for the Cortex-M4 firmware. On Sonata,
also disable the buttons and PCIe, which depend on GPIO expanders on
I2C4.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Change disabled status for peripherals reserved to m4

This patch depends on commit ebb21cc5d1c0
("dt-bindings: remoteproc: imx_rproc: Document memory-region-names to avoid implicit ABI")
for validation of the new memory-region-names property:
https://lore.kernel.org/r/20261023-memory-region-name-v9-1-ad597887dfe9@nxp.com

v1->v2:
 - Add memory-region-names as requested by Frank Li.
 - Convert the Sonata M4 configuration to an overlay, so both boards use
   the same approach and the overlays can be reused across board variants.

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx8mm-var-common-m4.dtsi   | 62 +++++++++++++++++++
 .../freescale/imx8mm-var-dart-sonata-m4.dtso  | 49 +++++++++++++++
 .../freescale/imx8mm-var-som-symphony-m4.dtso | 31 ++++++++++
 4 files changed, 151 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..c542613ed3ea 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -245,9 +245,18 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
+
+imx8mm-var-dart-sonata-m4-dtbs := imx8mm-var-dart-sonata.dtb imx8mm-var-dart-sonata-m4.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtbo
+
+imx8mm-var-som-symphony-m4-dtbs := imx8mm-var-som-symphony.dtb imx8mm-var-som-symphony-m4.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-legacy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-som-symphony-m4.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw71xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw72xx-0x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw73xx-0x.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
new file mode 100644
index 000000000000..ba2457d0ec91
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M4 configuration for Variscite i.MX8M Mini modules
+ *
+ * Link: https://www.variscite.com/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include <dt-bindings/clock/imx8mm-clock.h>
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
+		m4_reserved: m4@7e000000 {
+			reg = <0 0x7e000000 0 0x1000000>;
+			no-map;
+		};
+	};
+
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		clocks = <&clk IMX8MM_CLK_M4_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&m4_reserved>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+				      "m4-reserved-ddr", "rsc-table";
+		syscon = <&src>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
new file mode 100644
index 000000000000..2f290c3ae467
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M4 support for Variscite DART-MX8M-MINI on Sonata-Board
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
+#include "imx8mm-var-common-m4.dtsi"
+
+/* The buttons use a GPIO expander on I2C4. */
+&{/gpio-keys} {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "reserved";
+};
+
+/*
+ * Keep the touchscreen enabled without its optional reset GPIO, since the
+ * GPIO expander on I2C4 is unavailable to Linux.
+ */
+&ft5x06_ts {
+	reset-gpios = <0>;
+};
+
+&i2c4 {
+	status = "reserved";
+};
+
+/* The PCIe reset uses a GPIO expander on I2C4. */
+&pcie0 {
+	status = "disabled";
+};
+
+&pwm3 {
+	status = "reserved";
+};
+
+&uart3 {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
new file mode 100644
index 000000000000..ff5675cfc191
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Cortex-M4 support for Variscite VAR-SOM-MX8M-MINI on Symphony-Board
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
+#include "imx8mm-var-common-m4.dtsi"
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "reserved";
+};
+
+&i2c4 {
+	status = "reserved";
+};
+
+&pwm3 {
+	status = "reserved";
+};
+
+&uart3 {
+	status = "reserved";
+};
-- 
2.47.3


