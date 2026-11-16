Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDB2606AB7D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yaal+bhd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V/28g+05
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/E7B+CLgw+x/SfaWIPOPoPWBEopRUEi6rBKwGolhOO4=; b=yaal+bhdWLNdNRM9DwgxqMwZ4o
	/XB85I6cXVYwVv2FhQAYJszKlx4zbzS6HZzy4kuArV/4rBK5IS01Hg4P/JxJFQrG5CSGEugIhK2at
	0IY/Q9RuvxyTmu8uuyHV7jZeRY3uT3DoGEtYR7IBMXGOwfGOAX/eAiXtcJZ1pWtJzNxGTYjOIEVIe
	HeG6Hq07iPAeCfDpNGN7q+M1oufUxzlYkOMN7T8csQPLW2Z5eT2A3bcvOIcr6T2t0xb0Zr70V4Rq0
	SmAQ49Vc7e15vKJmtUKm0gTmTFrZOJKGt/j+gUDteR0ZFw1OQbQm9BYII4qPlvEstkesvYFI0zxHA
	sV1FgooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuej-000000028NI-3zHf;
	Mon, 16 Nov 2026 11:13:49 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSueh-000000028Lm-1Rgt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:13:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1737547f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 03:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827625; x=1795432425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/E7B+CLgw+x/SfaWIPOPoPWBEopRUEi6rBKwGolhOO4=;
        b=V/28g+05FlIezoHIx9pkDpGMcravD/kdwsHNursa5J6ttv6AmAVX7zh8/qBypjdkxe
         dSZE4K6gOd1C+Y1rOvGGTrr8bTpAcT5TMqMTUuze3nVZx+MAEGOLcQcXnudpurSOhe6o
         8jGQ1n1bxZX1/uaW0Gr5HHunqFeBWqUWX+aZPElCJ9pEG90voGogDmhm43RBoSvn1daG
         VPc0K+Q98fweni4WDA30Sk8shO6ga9kqc6+Xl2GP3o5bwiYyIDwj7dfUXcTdW2vHZGVM
         0gSj3QbJyPiMgMcrjVN+eH+UFaZ93P1VgEKniO/PyWb8E4n2BeKi4ZLkNyNOo/hzoHG9
         cjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827625; x=1795432425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/E7B+CLgw+x/SfaWIPOPoPWBEopRUEi6rBKwGolhOO4=;
        b=LmVVrlL907gSwtxcvOGgX/DcgDRpF1vEdTAoKFV5c6AxXwnwV5kZPIOTR7+Mlx3nKi
         silX3jgonP9H9Iw2Nyg/u4PVip7GJFIxGE97cHClvVlC9cQE3eNwomfWcP9gOItod29H
         vuSEl9d45MLyWW5N9iFQfy5atHJzkzra6gisXAf4qN4uwgVMiyiuYccS4JTqxc/s6zAU
         MLSjP18+UAlfpn2ZTsT22CdvP6Hwk91D3f0cJTAcj9ZqUiA9VVlpknQtpDGlyruhTFak
         qtedX6gAJAt4mf1ZzeJBu/QnhlVBRN09dLRfaRQhgh79IkOG0X8aVvuoGTOEARtHZzRn
         yG6Q==
X-Forwarded-Encrypted: i=1; AL+hErFekgT3yxEJVXofahbFsKFZKN1hsYwyAgnbAx2Toyw6yksBLfq67y6Hv3i2J6Buh9jAkaZY9ehEfbG7UPn/canr@lists.infradead.org
X-Gm-Message-State: APuU4Z+3CXaQhoijPo2A+6V4oJ4AqjmYZwP3UVHM9RQ0qGBx+RG4JEIj
	EGVWuiAOaRGo/MWtCcNfYIIVLWkBJcre5k8SObfvjbdtx7ZZfm81G4uE
X-Gm-Gg: AZFdTZcCHYBfAv6J58GeiCtTgKdyw41k7Aviu9YlYXdMdI2uv1inB2HqNi4zXpQO64Y
	67vNRPAm35FwPyJPRmtJ/ThwHl4pSBm17W+nshjVsy/8XMoMWWOuDmtrJXKwZ/QXPqCurUnjfau
	+rLvMiOtKWoYEirBmnvfbWc9EreOH50JpHySc5/3LNDMz5fsgLVW7x0nYc5IPsRrgnTna/U8BqB
	Jj1CDr/jKXEqbNtmlF5a0Lc2rNz4pJJ6wbGNqAdxFrZJPY39lKh8/O2vmtR/DWmA9Kn4hWbtORI
	jwqyF0Z0csHePd3thZUg/7hb0a7otpuZo0AGF3dAVOhg3OJavdP5ENb+s5KUqLH/fhEfwWcLOCN
	vlymlVKO53ISWUCFIOmrkCtchpad87lD1EpuaCcMQ/dOkMOrq3brEJmyvYeqU/5NeyZI+8wCIve
	8kLTt5eTyuuRxIGm7KTL+SX5ed9dLt+JOJeGzEx+P6KS8gRxSseOqkKLS9a5PS3mGuqO6te1erT
	ZzLbaYw0oSjjTXPZyglrDRSwrztzD8gj4wOHs6NjeXhtZ7r8/fe9O1K/2PAP488tfK9mofaRfz1
	tEaoXI5ycVSEdtiNALBR4PdWXUo+PJJ0C0a268qNOQKjuPIHXST6NKTcr1ZCHSIb3+nGz4u6LYC
	oRdOzgE+kQl8Pav6B9gfl2fvSGax9b+HGIwoCdbpI9nH3qaeXB3ShNTk=
X-Received: by 2002:a05:6000:26ce:b0:48b:e50:7159 with SMTP id ffacd0b85a97d-49c71b5bfbemr20650347f8f.30.1794827624837;
        Mon, 16 Nov 2026 03:13:44 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c18b9sm18061420f8f.20.2026.11.16.03.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:13:44 -0800 (PST)
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
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var: Add Cortex-M4 support
Date: Mon, 16 Nov 2026 12:13:36 +0100
Message-ID: <20261116111337.15740-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_031347_424020_E2B91830 
X-CRM114-Status: GOOD (  17.12  )
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
include, and add -m4 DTBs for remoteproc and RPMsg support.

Reserve ECSPI1, I2C4, PWM3 and UART3 for the Cortex-M4 firmware. On Sonata,
also disable the buttons and PCIe, which depend on GPIO expanders on
I2C4.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  7 +++
 .../dts/freescale/imx8mm-var-common-m4.dtsi   | 60 +++++++++++++++++++
 .../freescale/imx8mm-var-dart-sonata-m4.dts   | 44 ++++++++++++++
 .../freescale/imx8mm-var-som-symphony-m4.dtso | 31 ++++++++++
 4 files changed, 142 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..9574763dec09 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -245,9 +245,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-prt8mm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-mini-111.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-var-dart-sonata-m4.dtb
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
index 000000000000..98790a28694d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-common-m4.dtsi
@@ -0,0 +1,60 @@
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
+		syscon = <&src>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts
new file mode 100644
index 000000000000..35e3ea43e5ec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata-m4.dts
@@ -0,0 +1,44 @@
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
+#include "imx8mm-var-dart-sonata.dts"
+#include "imx8mm-var-common-m4.dtsi"
+
+/* The buttons use a GPIO expander on I2C4. */
+&{/gpio-keys} {
+	status = "disabled";
+};
+
+/* Reserve the peripherals used by the Cortex-M4 firmware. */
+&ecspi1 {
+	status = "disabled";
+};
+
+/* The touchscreen reset uses a GPIO expander on I2C4. */
+&ft5x06_ts {
+	/delete-property/ reset-gpios;
+};
+
+&i2c4 {
+	status = "disabled";
+};
+
+/* The PCIe reset uses a GPIO expander on I2C4. */
+&pcie0 {
+	status = "disabled";
+};
+
+&pwm3 {
+	status = "disabled";
+};
+
+&uart3 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony-m4.dtso
new file mode 100644
index 000000000000..f2a1618edcf5
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
+	status = "disabled";
+};
+
+&i2c4 {
+	status = "disabled";
+};
+
+&pwm3 {
+	status = "disabled";
+};
+
+&uart3 {
+	status = "disabled";
+};
-- 
2.47.3


