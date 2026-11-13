Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17CA60A2602
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qRYtm0XQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmru2QD7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q0mk9TaZ4jjNeW0s27BsKd5edLJnpGl4TDx2zVL7cGw=; b=qRYtm0XQ9BN/Oy
	if0oZoazMYp7EnKP5+A060T+ymqG4XXVGmUH3URsKV2LCeViPzRMTmRBqIgYfrgronTtNmYalHjpU
	B2AEXHrQLlknjBH2pXvtNl3Q0Mzj3PV1NDvyqceSGgXMQ+whlwQifC0XfnA4bi/gn0aj3h85CcVK3
	szxo9o53QM+6QKcpEe2GVlFMSTVVJxEm9qcX+Z7GsD27aQY3uGHsgmxTKbcHMcUGBDPBlbkk43+JF
	P/Aqks2pr7el37+T1qkX2RYJ+m3TojRBz0D7A2pl0QlinEzBNg3PebHIrbdxCZSJZG3JWhgWATX5k
	it4S35wlnjbLEnWSWu9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSS-0000000DR4d-2ES0;
	Fri, 13 Nov 2026 15:44:56 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSO-0000000DR3K-1Dvm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:44:54 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b31448caccso9679797b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584691; x=1795189491; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0mk9TaZ4jjNeW0s27BsKd5edLJnpGl4TDx2zVL7cGw=;
        b=nmru2QD7jJ8nObQlJ2lJAcuHIbZWNXGOyhzFnCO/0nm3XDyOdi5MYWC8VzHu1mlbdJ
         W57Ek27q4JOkE9rGTa0LCt7xbFN43TBz31WxCrcvDCJmEc5jodJLzX/Sh/kEdf3JBSfy
         o97A4fVCr4ljJ540FNIajq4ihzGmtJZIePLahdmfxkuNelXFJfkujZB1kTX4L4NC2MRn
         MN1ew0NJ9TrgtJ2pt/dZhtQuux22sijruHMhDF1tG6Zf4oINFQf5GhyV3n4ULshU3OLM
         Y+5or2c6m7nXGb4ObMuh401jpkibex0hRQa09mwi2/5MIo6nHIWZpc09XnZvFlJsRznf
         +wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584691; x=1795189491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0mk9TaZ4jjNeW0s27BsKd5edLJnpGl4TDx2zVL7cGw=;
        b=jZ/9ql8+WNVms922Zpxie/i3rKtcHvmamHqGupFDbweFHGA4LGntLlePWOTaQm3U+b
         aIO5iCRDY6HoVHzEhJ2n7O/FykyI+VB/BKEosr4bEmQTr1l8X4fZEeshArEELIXLrPqj
         1nEaJ6PxnjrRu2SMQ6h6HQ//qKrLOrdQIijQovo5ZhWPtfqmRtkXpANJeKVLED63GaiC
         Putx8qWPhCHkQi8qyjtLysCkwQJNeDlBe/28qkPZIFQ7XWJVBJHu5fqwz8iPC9CfOixs
         t74yFqFfCmnrERz9H1ZsnPTpDbAJ6Rk3FLH1CdqlV3mJBDVsA8tJlqqwqvAKITgllR0o
         IvRw==
X-Forwarded-Encrypted: i=1; AL+hErGiybgdzRIJdTs/fcsE4jvLnOHf4yo76IL1v83kPxmE8jdoBZknhdkBYKd1EAAizMd5Jc2FM3Es+MB4mXFJq9oN@lists.infradead.org
X-Gm-Message-State: APuU4Z/fPFwIddX8ACpmjE9b1U/9dz3zKuLDNI0LuFDQ3Eh9OhV4Tbjj
	iVdh32pxswWqn5ne+30+8A3Lhj6s2KJbarNBGq7wJA3pHYzaP4Tj9V8X
X-Gm-Gg: AYBFou1+hRwMNWauhjYH2joDinIbw2jI7lU4SlHbYHwHNqjRNClyYopqn5G4PUX9yiJ
	4E7BqtwOcLUYWYQsYlZgt1ezpBiB40jAfTH9H144mN6ysleO7ccExXUKHB/eF3LOum9E9hMcLHj
	C7GgpFdUFaX3fgJ6hwl4vtUXtIqDtZJChSTNT15MuEsZhXq0dhZqEDf7RdfWbtpEcJ5AJebE+9j
	gAVcIbFwjKS1mb9LfjHBiFO4R0oRKa6XPO1ziCh90ZM2uYzqeGdxOcw1fhUXSniEFm6iDAhg9Gb
	BsBc8ZI6Cjlsw9k5bEthPxrIFaQT6Mfjo/MKOWjSotp2B3/vuRUks2payv111YXVHD9QG0nWeXX
	dCtVFqygiReI70jUe/qmr6raSOEdqt6xiRtVWJsz831B/+By4v4z3JO1HhzRXywU+WwShM4FZlq
	1YniuFES0R/spsMwgPsvNfHxIqADyPbSEe365i42O4LMW5MOLjED/UM71NdrqUifDr3AX4ko3nw
	pJE6/m7zm2ZyoBe9H01ODkBDG2JNJQoPN2UM+tYxQiKEnGVB+hHiUE8Vt0QeBMb/uce8rx+YyHu
	REoJdgq/sNHMEJTdNJFpPwAkWscr7mPJ
X-Received: by 2002:a05:690c:e1c6:10b0:8b0:aba3:a3e2 with SMTP id 00721157ae682-8b4aa352b0bmr14048677b3.37.1794584690765;
        Fri, 13 Nov 2026 07:44:50 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:50 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:07 -0300
Subject: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-1-59c45f0a0d8e@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5076;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Tz5ERP1gVTN03h114IyqCZCKmbVPmIkPUTjRMol8SJQ=;
 b=wR+GtWb98MCONzVOGNbUDPA93mS4bj4kcZJot5NE7c145bcOglNZ86saT0GQG4JZBxBfB/aPs
 MpDCMjXDL1vDV2oWrh7/oK8mtUXQwPIjueZ32LyQJfdDqf2tNuswd+k
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_074452_637107_E7B40DEA 
X-CRM114-Status: GOOD (  13.56  )
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

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via Verdin iMX8M Plus LCDIF on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is a LogicTechno LT170410-2WHC 10.1"
WXGA IPS LCD and the touch input is provided by an Atmel MaxTouch
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 95 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd5482843586..79ba27665f4d2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -738,16 +738,21 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
 imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-tdx-uart-mcu.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
+imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
+	imx8mp-verdin-wifi-mallow.dtb \
+	imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..9079c6284dfae
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Verdin iMX8M Plus LCDIF
+ * on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_3p3v>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 PWM_POLARITY_INVERTED>;
+
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_i2s_2_d_in_gpio: gpio4io30grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;	/* SODIMM 48 */
+	};
+
+	pinctrl_i2s_2_sync_gpio: gpio4io31grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31 0x184>;	/* SODIMM 44 */
+	};
+};
+
+&atmel_mxt_ts_mezzanine {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>, <&pinctrl_i2s_2_sync_gpio>;
+	/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+	interrupt-parent = <&gpio4>;
+	interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+	/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+	reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+	vdd-supply = <&reg_3p3v>;
+
+	status = "okay";
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
+	 * This display uses 71.1 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 71.1MHz, or 497.7 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <497700000>;
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


