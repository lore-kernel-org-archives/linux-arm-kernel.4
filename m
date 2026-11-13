Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E59960A3812
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1tucntkd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zO/WsqVR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5yZ9nFLzi/IVM9qZ/Dl5TkDwqEm3bc7pG3aeLHjq18o=; b=1tucntkdJZp/3d
	OyDjXJiy8pT5CugD39fcb3WeBCDN5rp8oTj8xT2l4X/vrKxr7lFgDUMMSDfVOH3L1pyNs2F/4eVQN
	E6i1u6r+hTZTp4AeOuwOq4Hufh8PP5LdyrBti6gjaU0p8zuzVubVMGqtp2T7wtPPunjoh6wR2lgEz
	D/NXWlqy4JpB7FDXmtlJv92VFz5VBbM0qIKPt189ycs7fnA7TdvQuuo/lLSeAuHXbH7HxywZcDGuf
	FwfQtyhSRL8/24dlMFy6VshBf1w8z7nnov6B+UTxh4TB/U7ZtxfedHqSUOlBg2nJNVFRGpbu6gVuw
	cexYHrdgDTLzJbjtDuCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSq-0000000DRJS-27R8;
	Fri, 13 Nov 2026 15:45:20 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSj-0000000DREx-2ufA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:45:15 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8b30cbfa628so11284317b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584712; x=1795189512; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yZ9nFLzi/IVM9qZ/Dl5TkDwqEm3bc7pG3aeLHjq18o=;
        b=zO/WsqVRp6FTv+Woxx3vUZky8kFAihqLWNeSxbJnpJDk6LBL3fiUkygULbtlhdS1oe
         pyME3hd5X5sieJwx1k9kbxeOqym30V7DA47JZDtxmKJxXtD4L3OrQmLQGt009XS5MKUf
         p6rBShZKS1JW3/jgjca/r1ZbxUZlL7TcTP0BR+uKIyrPHMnrA9HUMNUbJ5db3eflaCsK
         83P7ysUSyr3W+FDV1SCEoLkuphsw9r7pAR5AnOvHQopOqluHJ9JQbupFZOm/QbteuM4W
         Fljaf0PoYBM8UN1ECNokZD90462PFnD/hcPGDD5xM2KEZpMSE/fu8G6x95K6K5pG3Phy
         XAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584712; x=1795189512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yZ9nFLzi/IVM9qZ/Dl5TkDwqEm3bc7pG3aeLHjq18o=;
        b=eLsJjzpITyUc4BxQDL5EzeQ97TmDrRcFIzHN4yoGhgjJLdmCFP4VQDgooQ+7+AjJJL
         Q5N0CizhyaTPmBqWgle9h/GpINZ6F8sz1jSRHoezJkVQ9skXFc/t3kb/rJq/veKSq1CX
         5C/G1AII7Otk/4gGfUkDT3WSGwNnUQsSt6M/YvoicbKzueMClKpxQh+fr7jnwE9B17OW
         jWBeM6eSUW+Mo+ksp+myxtg6cQNDfydTBgNqP9WwF22ENh9tPNKWxhrln241EMe16W5a
         2B9odozXk3V8XGDoUlcG7OV2unMGRqmCC9fK7B9c48UP1BICU4BrfzbCtguM/h3P93vg
         XikA==
X-Forwarded-Encrypted: i=1; AL+hErH5ak+LjGXIgP0uPPQg5nmH0R1LS+mEvWRJLIov559cpyR6nP9N/tW0jiROasb4j01AUz8G4F7btGq97yejmT62@lists.infradead.org
X-Gm-Message-State: APuU4Z9H+/DS1V5EykE1oatpXEkWIrKVLRiNXOAr+X7KPC1rmwZw3v3j
	ySlo6cEMhNjx8opD1QKoCAYDeyg2GxeKF5FZrxwR0ared+GhVBDe6WWR
X-Gm-Gg: AYBFou2DexQy6U2/8r8SY0+UL4IKDwbpW42AH2YC2rkCKO+N2+7tuMf15ruNIm+mlxY
	O/2TGRGFnzniwblZFDGu8YcCFQYS5y/mxbgG9eoR1V1kp7ewm0tcaL8W/jZimzXhuXWMeO2AKsA
	IIyB8H7VVDqEFD8aLQgM/sqPwDm1lsFCoZXHAc70tb+sqi1ra+nW5PygH2NQK5++LMztdH0PYZp
	UOECXIJ80HPIVSDGZqevhWiYGlTKDeLkVuBwyaJZlZDIP+cV0KJ/EvxDEIzAPYQC9H2w9EQVcp0
	Lxqhg4uvssF5AfY8dfIyNWwWVwwwJfyrAmJPDH38DRTalPrifjZyRowlmK8U041D05fXOlbzXV3
	imGlhkqfae0e/hsvJgwr5HsU+e/WtghdUYdRI4/8fvh6EkpAWWqjf3YJagM9/ZFue3TtLkJviSN
	pGQZ1R/JyJEh9KDufZ+kPan4IVJYQsVYOt0Gg+VDpLQUm0CJx9QvYXMEgL7C1vz6jqycSesFP1j
	VtliGtD/rhVpwTj/y6nDGLjwAV8cQag7VPPGVnlj8nDjcrpELoidlTsLik9FWG81w+dwXu4cdnx
	NeQOjghXyk7MUKnhhrmxefxv0p1nQsil
X-Received: by 2002:a05:690c:389:b0:8b1:e7c:cdd0 with SMTP id 00721157ae682-8b4aa32c3femr17342337b3.64.1794584712093;
        Fri, 13 Nov 2026 07:45:12 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:45:11 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:12 -0300
Subject: [PATCH v2 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-6-59c45f0a0d8e@toradex.com>
References: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
In-Reply-To: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=6069;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=txaBxqv4+PaOkzLDW1SkXD75PImddU08PwTp86fxwao=;
 b=8y/uTmOJLn+jgmmGpDHs5PgQIZgRYwL6PxoNop4M87VGhiv8aL5HCdlSR3gN3M2fIMCiO7sm7
 yukjShAkecqDHUN1TzYBFzE2aifBUK6ybFvEIVyfZCfznAb4gJNCJGA
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_074513_768616_666077DA 
X-CRM114-Status: GOOD (  14.38  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay enabling the Toradex Capacitive Touch Display
10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
by an ILITEK ILI251x capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   5 +
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 107 +++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2a4118add28b5..e4020ea6381b8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -732,6 +732,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
@@ -747,6 +748,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
@@ -766,6 +768,9 @@ imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2-dtbs := \
 imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 0000000000000..b78322907192a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS V2 on the Verdin iMX8M Plus
+ * Mezzanine LVDS interface (J10), used with the Verdin Development Board.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
+ * https://www.toradex.com/accessories/verdin-imx8m-plus-mezzanine
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_mezzanine>;
+		data-mapping = "vesa-24";
+		power-supply = <&reg_3p3v>;
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <64500000>;
+			hactive = <1280>;
+			hback-porch = <20>;
+			hfront-porch = <20>;
+			hsync-len = <2>;
+			vactive = <800>;
+			vback-porch = <5>;
+			vfront-porch = <5>;
+			vsync-len = <3>;
+			de-active = <1>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pixelclk-active = <0>;
+		};
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight_mezzanine {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 0>;
+
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		/* Verdin GPIO_3 (SODIMM 210) */
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin GPIO_2 (SODIMM 208) */
+		reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 64.5 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 64.5MHz, or 451.5 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <451500000>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_native_in>;
+			};
+		};
+	};
+};

-- 
2.43.0


