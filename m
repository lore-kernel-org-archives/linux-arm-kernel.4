Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8EC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S5r1mONY;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=J8Uat55c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5xzFaNjdBU2+3j5ofh/IAiAGHMFfV4HPNdcRnthw2k4=; b=S5r1mONYEPob4y
	gsZemD5rUnBp6WIw4FNhGsdwCkh8zlAodxfGvwbjDElSzaOxHKAy3SZnKCj4CUN51K5ngNHWkhG+F
	7e6b10R2aERdfcsNZUVoKov3m8/uNucH9pvLGbRnq4Axo9yg0nC5YrCfgIHQI/xBw1jx1gccYmlYP
	H/1lnzWQi6SXpq4QzTc285SAJaXvMHDLpv4IsC1iTzCz4nYmi8vqKjN7DBL1Wkgis1n5A47NHiY1j
	ULELgOFDD7m9J2rxfzBC413QJwBCZdyubY3aSjP2mMHz9NIrf9v8foxfUjkzrVcYz6V4GjY1Auld2
	BxH1KxAr/eXpP/XDzCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl8-0000000165D-2Ipz;
	Mon, 09 Nov 2026 15:58:14 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl4-0000000160d-126G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:58:11 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 2DB8726664;
	Mon,  9 Nov 2026 16:58:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794239883;
	bh=5xzFaNjdBU2+3j5ofh/IAiAGHMFfV4HPNdcRnthw2k4=; h=From:To:Subject;
	b=J8Uat55cuxs2U/x9zu70hgT7pCcrEBVnNxXvyWdiA6QEI/xouLkfWO6DKaauruTTK
	 G4j8c8zvH9sniRvBQRXgMWJgOCGuxHVmKn1DgElYio+caJKdRG72Iw2p9NxF8mcnM+
	 YE+jF6MbBYC9sRkE/pcRjZX1643eaP0NvIUxiuam5djt/9/KbyGlMgaz+FoI7YEYAz
	 Kb81q2fF3UIcwnW0dODqON8l6hi/DZh4piWzfat/DhCZiIrvHwr9P2ZOYaxsPkmdTG
	 u9IabiWgHIVBbYGBWzAJ9XTWT+yPvfghuQGIZpmrY9y2Q6ADPPnNnb1qWkZQ9bK2ug
	 3iUYa+LOEKddQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-bsp@toradex.com,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 6/8] ARM: dts: imx6ull-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
Date: Mon,  9 Nov 2026 16:57:46 +0100
Message-ID: <20261109155751.475875-7-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109155751.475875-1-francesco@dolcini.it>
References: <20261109155751.475875-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_075810_599799_996E4063 
X-CRM114-Status: GOOD (  18.42  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6ULL eMMC parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex Capacitive Touch
Adapter, the connection to the various carrier boards is documented in
the datasheet [1].

The panel, backlight and LCDIF configuration is identical to the Colibri
iMX7 eMMC one, only the Atmel MaxTouch controller wiring and the
conflicting PWM channels are SoC specific. To avoid duplicating it,
rework the Colibri iMX7 eMMC overlay to include the dtsi shared between
the two modules, and use it from the new overlay as well.

The overlay is also combined with the Eval carrier board device tree to
provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Link: https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
Link: https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: add the tdx vendor prefix to the overlay, shared dtsi and combined DTB names
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
 ...ap-touch-7inch-parallel-touch-adapter.dtso | 46 +++++++++++++++++++
 ...ap-touch-7inch-parallel-touch-adapter.dtso | 16 +------
 3 files changed, 54 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index a0d22028f20d..7332167aee44 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -365,6 +365,10 @@ imx6ull-colibri-emmc-iris-v2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6ull-colibri-emmc-iris-v2.dtb \
 	imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtbo
 
+imx6ull-colibri-emmc-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter-dtbs := \
+	imx6ull-colibri-emmc-eval-v3.dtb \
+	imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
+
 dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-14x14-evk.dtb \
 	imx6ul-ccimx6ulsbcexpress.dtb \
@@ -395,10 +399,12 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-colibri-emmc-aster.dtb \
 	imx6ull-colibri-emmc-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6ull-colibri-emmc-eval-v3.dtb \
+	imx6ull-colibri-emmc-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6ull-colibri-emmc-iris.dtb \
 	imx6ull-colibri-emmc-iris-v2.dtb \
 	imx6ull-colibri-emmc-iris-v2-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtbo \
+	imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-iris.dtb \
 	imx6ull-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
new file mode 100644
index 000000000000..14615f3089e3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector and Toradex Capacitive Touch Adapter.
+ *
+ * Toradex Capacitive Touch Adapter connection with the various carrier boards
+ * is documented in the datasheet [1].
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
+ * https://www.toradex.com/accessories/capacitive-touch-adapter
+ * https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "imx6ull-imx7-colibri-tdx-panel-cap-touch-7inch-parallel.dtsi"
+
+&atmel_mxt_ts {
+	pinctrl-0 = <&pinctrl_atmel_adap>;
+	/* SODIMM 28 / TOUCH_INT# */
+	interrupt-parent = <&gpio4>;
+	interrupts = <16 IRQ_TYPE_EDGE_FALLING>;
+	/* SODIMM 30 / TOUCH_RST# */
+	reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+/* Conflict with SODIMM 28 / TOUCH_INT# */
+&pwm5 {
+	status = "disabled";
+};
+
+/* Conflict with SODIMM 30 / TOUCH_RST# */
+&pwm6 {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
index 890461f92442..aa8ae9418b44 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
@@ -22,6 +22,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+#include "imx6ull-imx7-colibri-tdx-panel-cap-touch-7inch-parallel.dtsi"
+
 &atmel_mxt_ts {
 	pinctrl-0 = <&pinctrl_atmel_adapter>;
 	/* SODIMM 28 / TOUCH_INT# */
@@ -33,20 +35,6 @@ &atmel_mxt_ts {
 	status = "okay";
 };
 
-&backlight {
-	status = "okay";
-};
-
-&lcdif {
-	status = "okay";
-};
-
-&panel_dpi {
-	compatible = "logictechno,lt161010-2nhc";
-
-	status = "okay";
-};
-
 /* Conflict with SODIMM 28 / TOUCH_INT# */
 &pwm2 {
 	status = "disabled";
-- 
2.47.3


