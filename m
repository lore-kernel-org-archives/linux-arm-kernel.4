Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249D660A5BD4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZLj5R927;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=Dvn5a4p5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W5tIw3pY4xf2AiHrKTA7p2regxxRaERCXmVIzX7a4PI=; b=ZLj5R927YvhQ2w
	SKZaihoM1JzS21RuE7AxWHXwnJrO5bRojGsoy+4NvZ0mgjQyHhMZotY6oZlKwTlF42LvAGQiveOaf
	RJlxtE24YZkPQPCYpFh5Jn45lA8iiahSYXgweiWhlBEZuZrbbKX8ZWnwpuEHERY6Wa3KJC+Ke2ncS
	MqUR8uLf2DgDfoKx+w4aWXh13gYKxl47KqUKmJNwB24mfoyLLNCV6xxwe0TTUM9IZoXKy0U7IU7D/
	ARm3LVldNEY5gRetmQaHb6g2MXRp9F782k9BsIZnxKroY1spNfJ4T+uyOYLFPRFW31mNCdsTpmM5i
	AeTKUdUAxTbgUalaotJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl9-0000000166f-0TO0;
	Mon, 09 Nov 2026 15:58:15 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRl5-0000000160w-0UPC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:58:13 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id E03FB26675;
	Mon,  9 Nov 2026 16:58:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794239885;
	bh=W5tIw3pY4xf2AiHrKTA7p2regxxRaERCXmVIzX7a4PI=; h=From:To:Subject;
	b=Dvn5a4p5G0Y5gz+4Je1sH6cDzjkNTkRwnbfNVu23JxKEwye1IMiJ7P6WgkmBopzo8
	 9Gexv7W3+IiR70KCx/RMw3klqDNTm95LTPb2sYxZhAlol2oJn/dQ81SYyEE2CJpazl
	 LxC80jDEt9MPQqupAk3dabe+zFYcZimtfudFnlyvgu84SrYNQGMeSjUH6AqNjrikCN
	 zreeJhFG/Cz7Fxg77HQzlrOfIZbqI/VBlp/lcHCUUdi5JKu0shLSXHKor3I73mOcUb
	 B9+lXgmdUy9WFRAlXHRGgfnzABthC7ZK2bxl43Kt1y3+xPaUletcY9OvZRhIjeaxEk
	 SNY13ipwgM/HQ==
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
Subject: [PATCH v2 8/8] ARM: dts: imx6ull-colibri-emmc: Add VGA overlay
Date: Mon,  9 Nov 2026 16:57:48 +0100
Message-ID: <20261109155751.475875-9-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109155751.475875-1-francesco@dolcini.it>
References: <20261109155751.475875-1-francesco@dolcini.it>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_075811_489613_DF52F707 
X-CRM114-Status: GOOD (  18.49  )
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

Add a device tree overlay for the VGA output on the Colibri iMX6ULL eMMC
parallel RGB LCD interface. The VGA output is driven through a
non-programmable video DAC without VESA DDC I2C signals to a DVI
connector. The DAC power-save input is driven by the BL_ON signal on
SODIMM 71, like on the Colibri iMX7.

The overlay content is identical to the Colibri iMX7 eMMC one, only the
GPIO driving the DAC power-save input is SoC specific. To avoid
duplicating it, rework the Colibri iMX7 eMMC overlay moving the common
part to a new dtsi shared between the two modules, and include it from
both overlays.

The overlay is also combined with the Aster, Evaluation Board v3, Iris
and Iris v2 carrier board device trees to provide ready-to-use DTBs.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: no changes
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 21 +++++++
 .../dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso | 24 ++++++++
 .../dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi | 61 +++++++++++++++++++
 .../dts/nxp/imx/imx7d-colibri-emmc-vga.dtso   | 52 ++--------------
 4 files changed, 112 insertions(+), 46 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 060bb01f9396..4fc8fa5e8c79 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -373,6 +373,22 @@ imx6ull-colibri-emmc-eval-v3-tdx-panel-res-touch-7inch-parallel-dtbs := \
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtbo
 
+imx6ull-colibri-emmc-aster-vga-dtbs := \
+	imx6ull-colibri-emmc-aster.dtb \
+	imx6ull-colibri-emmc-vga.dtbo
+
+imx6ull-colibri-emmc-eval-v3-vga-dtbs := \
+	imx6ull-colibri-emmc-eval-v3.dtb \
+	imx6ull-colibri-emmc-vga.dtbo
+
+imx6ull-colibri-emmc-iris-vga-dtbs := \
+	imx6ull-colibri-emmc-iris.dtb \
+	imx6ull-colibri-emmc-vga.dtbo
+
+imx6ull-colibri-emmc-iris-v2-vga-dtbs := \
+	imx6ull-colibri-emmc-iris-v2.dtb \
+	imx6ull-colibri-emmc-vga.dtbo
+
 dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-14x14-evk.dtb \
 	imx6ul-ccimx6ulsbcexpress.dtb \
@@ -402,15 +418,20 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-colibri-aster.dtb \
 	imx6ull-colibri-emmc-aster.dtb \
 	imx6ull-colibri-emmc-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
+	imx6ull-colibri-emmc-aster-vga.dtb \
 	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-emmc-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6ull-colibri-emmc-eval-v3-tdx-panel-res-touch-7inch-parallel.dtb \
+	imx6ull-colibri-emmc-eval-v3-vga.dtb \
 	imx6ull-colibri-emmc-iris.dtb \
+	imx6ull-colibri-emmc-iris-vga.dtb \
 	imx6ull-colibri-emmc-iris-v2.dtb \
 	imx6ull-colibri-emmc-iris-v2-tdx-panel-cap-touch-7inch-parallel.dtb \
+	imx6ull-colibri-emmc-iris-v2-vga.dtb \
 	imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6ull-colibri-emmc-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
 	imx6ull-colibri-emmc-tdx-panel-res-touch-7inch-parallel.dtbo \
+	imx6ull-colibri-emmc-vga.dtbo \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-iris.dtb \
 	imx6ull-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso
new file mode 100644
index 000000000000..4ecf221de27e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-vga.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx6ull-imx7-colibri-vga.dtsi"
+
+&vga_encoder {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_bl_on>;
+	/* SODIMM 71 / BL_ON */
+	enable-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi
new file mode 100644
index 000000000000..7e323698f338
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-vga.dtsi
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector, shared by the Colibri
+ * iMX6ULL eMMC and Colibri iMX7 eMMC overlays.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ *
+ * The DAC power-save input is driven by the BL_ON signal on SODIMM 71, the
+ * SoC specific pinctrl and GPIO are described by the overlay including this
+ * file.
+ */
+
+&{/} {
+	vga_encoder: vga-encoder {
+		compatible = "dumb-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					remote-endpoint = <&lcdif_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&dvi_connector_in>;
+				};
+			};
+		};
+	};
+
+	dvi-connector {
+		compatible = "dvi-connector";
+		analog;
+
+		port {
+			dvi_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lcdif_out {
+	remote-endpoint = <&vga_enc_in>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
index 363c0c2cc43e..ae3d8da02e67 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
@@ -14,51 +14,11 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
-&{/} {
-	vga-encoder {
-		compatible = "dumb-vga-dac";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_bl_on>;
-		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+#include "imx6ull-imx7-colibri-vga.dtsi"
 
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				vga_enc_in: endpoint {
-					remote-endpoint = <&lcdif_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				vga_enc_out: endpoint {
-					remote-endpoint = <&dvi_connector_in>;
-				};
-			};
-		};
-	};
-
-	dvi-connector {
-		compatible = "dvi-connector";
-		analog;
-
-		port {
-			dvi_connector_in: endpoint {
-				remote-endpoint = <&vga_enc_out>;
-			};
-		};
-	};
-};
-
-&lcdif {
-	status = "okay";
-};
-
-&lcdif_out {
-	remote-endpoint = <&vga_enc_in>;
+&vga_encoder {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_bl_on>;
+	/* SODIMM 71 / BL_ON */
+	enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 };
-- 
2.47.3


