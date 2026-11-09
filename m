Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5336082BC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AfIpVuKF;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=bOkWpp6C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x7AGsOET450GqGMhY7lv5S1Lu7ewfrdv+H0Q8y9LtsU=; b=AfIpVuKFN7/hn4
	V76C3Rzwm+HqxEzG7K+wMiCRBlOFWY2FabYiN3+IfL0Lp2ZaTfdyqmDsPfrzyWcLxvkLDe95f60Zx
	ylPxm3jmqUYyQMd438CtFXdmWrqyiJ4zKiIk3Aw5TmA5y/CY8bto8TjnUNf9Aab1Lz5rBTCd252K1
	2YnsQ6yNEg8CWTNsDb2NkTEu3snCjZoddUunDgpldZ9iPoBgD/HyhlU0eDsdURxGy3DvZHSMFLXZy
	cvRBBZYZZ6Cz5et5Yrpx1/Z0oKOXs7iuRItRJdCAzFjGeoDtI6CvBh4dxpocg7NxfOALz9RjTy18c
	70RoJbaNgaCHtSjKzVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl8-0000000165g-2uFW;
	Mon, 09 Nov 2026 15:58:14 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl4-0000000160e-1DA5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:58:12 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 521B826673;
	Mon,  9 Nov 2026 16:58:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794239883;
	bh=x7AGsOET450GqGMhY7lv5S1Lu7ewfrdv+H0Q8y9LtsU=; h=From:To:Subject;
	b=bOkWpp6CD3ayZn8qsB0Vo5ILpZbwIgH1z1cSg1NHc76AvibvYKRVKexj+B3CITpiI
	 ccNVQJ0rkYNyGvvL+9iO2CkkV3fbpLH0T2oq9hgsNGyAjVKtRezSYRtCJmsUD6sttv
	 MWsE5viUxuhK590itgrUNdaJ6GWgVn8nUDIjp75BwWAjkez3CoM9/ZBtMs75rnyZyy
	 lZdfZm/PnuilidSuya+ve6zZgHUVn62yp94kjB3I/8StB2JZKavFhb5qUOfR4M+oTn
	 Ahfk6chdFyp/qmybUHLkJDqWo5VzN5HN2hPacBfOHYWf6Fk7Iqzh/piQUEpvmW8VJ0
	 319c+O25EY92w==
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
Subject: [PATCH v2 5/8] ARM: dts: imx6ull-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel
Date: Mon,  9 Nov 2026 16:57:45 +0100
Message-ID: <20261109155751.475875-6-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109155751.475875-1-francesco@dolcini.it>
References: <20261109155751.475875-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_075810_654357_813475D1 
X-CRM114-Status: GOOD (  18.07  )
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

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Iris v2 and Aster carrier boards.

The panel, backlight and LCDIF configuration is identical to the Colibri
iMX7 eMMC one, only the Atmel MaxTouch controller wiring is SoC
specific. To avoid duplicating it, rework the Colibri iMX7 eMMC overlay
moving the common part to a new dtsi shared between the two modules,
and include it from both overlays.

The overlay is also combined with the Iris v2 and Aster carrier board
device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: add the tdx vendor prefix to the overlay, shared dtsi and combined DTB names
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 12 +++++++
 ...mc-tdx-panel-cap-touch-7inch-parallel.dtso | 31 +++++++++++++++++++
 ...ri-tdx-panel-cap-touch-7inch-parallel.dtsi | 29 +++++++++++++++++
 ...mc-tdx-panel-cap-touch-7inch-parallel.dtso | 16 ++--------
 4 files changed, 74 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-tdx-panel-cap-touch-7inch-parallel.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c05cc9ff782d..a0d22028f20d 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -356,6 +356,15 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
 	imx6sx-udoo-neo-basic.dtb \
 	imx6sx-udoo-neo-extended.dtb \
 	imx6sx-udoo-neo-full.dtb
+
+imx6ull-colibri-emmc-aster-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6ull-colibri-emmc-aster.dtb \
+	imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtbo
+
+imx6ull-colibri-emmc-iris-v2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6ull-colibri-emmc-iris-v2.dtb \
+	imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-14x14-evk.dtb \
 	imx6ul-ccimx6ulsbcexpress.dtb \
@@ -384,9 +393,12 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-14x14-evk.dtb \
 	imx6ull-colibri-aster.dtb \
 	imx6ull-colibri-emmc-aster.dtb \
+	imx6ull-colibri-emmc-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-iris.dtb \
 	imx6ull-colibri-emmc-iris-v2.dtb \
+	imx6ull-colibri-emmc-iris-v2-tdx-panel-cap-touch-7inch-parallel.dtb \
+	imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-iris.dtb \
 	imx6ull-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..6d0ad21ae2d7
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Iris v2 and Aster v1.1 carrier boards).
+ *
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
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
+	pinctrl-0 = <&pinctrl_atmel_conn &pinctrl_atmel_snvs_conn>;
+	/* SODIMM 107 / TOUCH_INT# */
+	interrupt-parent = <&gpio5>;
+	interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+	/* SODIMM 106 / TOUCH_RST# */
+	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-tdx-panel-cap-touch-7inch-parallel.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-tdx-panel-cap-touch-7inch-parallel.dtsi
new file mode 100644
index 000000000000..21688c63d11f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-tdx-panel-cap-touch-7inch-parallel.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Panel, backlight and LCDIF part of the Toradex Capacitive Touch Display 7"
+ * Parallel overlays, connected through the 40-way Unified Interface Display
+ * connector, shared by the Colibri iMX6ULL eMMC and Colibri iMX7 eMMC overlays.
+ *
+ * The Atmel MaxTouch controller wiring is SoC specific and is described by
+ * the overlay including this file.
+ *
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ */
+
+&backlight {
+	status = "okay";
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhc";
+
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso
index f336f7b05a2b..340e772f5c6e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtso
@@ -17,6 +17,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+#include "imx6ull-imx7-colibri-tdx-panel-cap-touch-7inch-parallel.dtsi"
+
 &atmel_mxt_ts {
 	pinctrl-0 = <&pinctrl_atmel_connector>;
 	/* SODIMM 107 / TOUCH_INT# */
@@ -27,17 +29,3 @@ &atmel_mxt_ts {
 
 	status = "okay";
 };
-
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
-- 
2.47.3


