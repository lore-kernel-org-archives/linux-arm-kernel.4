Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262CC606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cV4qvLK/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgAJbx8I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HzZaPDLW6Ok2/D816MTzOvdhBrNsHMyuYZFKk6EjbIE=; b=cV4qvLK/I+LVKb
	YYaVD+uTe5WVIX/fRw8ctIALa9oElN+FlxXo8qFP+9gOn8RStyzRwQWS50Tr24AILzNRIE+oNQVeT
	6FCHoRM2tC1RILgo1npVkypkmX7DLt92JEyNMm90gwhtQcJmNdD/XeGO9Rt9QB5WngdiDYZPAFAOK
	KUFKDfZRSC4ydOx3iNz2Rrspq3m24aEA+rZ64yPiPhv5zT6u4yIyI1ItMv5oL9L5KOC2uw0IFFMme
	gmVq4l9WyBZLzhnAUrl2yEUOn6nmp2GIRSv2Sr/sgADAy7z4+bdrT1p6qCXx3VZl0qK45zj1gSEGO
	BLHMLUe/fhTA7EfqDVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSY-0000000DR7v-3UYM;
	Fri, 13 Nov 2026 15:45:02 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSS-0000000DR4c-3F4w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:44:58 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b4a2688f96so13820737b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584696; x=1795189496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzZaPDLW6Ok2/D816MTzOvdhBrNsHMyuYZFKk6EjbIE=;
        b=cgAJbx8IKLBDPIH8NvroWPXdXWoliX6rBnFJp56fVdLfRjBYBhXxk3nEo6zJTfMY7M
         B9msQtqJ1H35dzOX58nJpOtUX95c9JhSv7Zl3JcvE6OcKIEz8HNwa9c5Ky/lUgfS8jTW
         yonctSXbYJJgaH+8ibh/NXZwsG7QkO3El7/xpFw3F4NPFP2vLJ9IIdUiYRYE7+dFwqKB
         /l+UXjzasxdzEynukbZCD0G8CsQ5s731xjnroEElOXB9WfOXAtnkzmsywkocf6H0r+lQ
         04AgYHgu183p7mX2+rChL/qjSAn6xTj6XphZjMWMtcLoLXdJmJiggQaGN7Iy8pLvbu0R
         WUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584696; x=1795189496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzZaPDLW6Ok2/D816MTzOvdhBrNsHMyuYZFKk6EjbIE=;
        b=SRGVskLOURqLx6fas+v3ktbSAGuHwfICXKMjWe1qebbXQCibjovrOgCKsc6n5ewPMY
         QdpX9ItTsBua2K0zcsjrk0m/paRPvYRXhOWHvYJT+ERdqrPJ9shsIxvpqe+2m1xny7+9
         MwXxpG748lYo/ouuC0LuDX0dXPSICdk83V+8WIJ4KiKkwhdp0DghtfnyHa8aJReqxF+Q
         dVs026wZfX7WG0FI71cMgxO5uqpQiTHvKrzCxPXIf8tvOR8cMXWieNGFzD0ExEsyWrLB
         1sT3/EgfroxCmHAW2enqqWmvJFwfLSq9UDTvquT5C6Tm0caJvEI042pxZ6EIIvcS7VCF
         YvDw==
X-Forwarded-Encrypted: i=1; AL+hErH7WaeO0P1rg+VqP/4/Yoo0LfMPazaRpxbXYhcl2CONe74yy3dLNumfkZCk7h67M5ZRuC+01Mpw1wIknWhv3cX/@lists.infradead.org
X-Gm-Message-State: APuU4Z+HrqH3Qw6io71/HDM/hIR/gaIaJ3hS4mGItJsSS8GT4Nrt9YNW
	AVE062vqjxszDA75pgGrLUnt/JqpKj26AT77JlBm4IofcwBI1abXSsmt
X-Gm-Gg: AYBFou2F06h4Wwe/b9hDEoFD8WyGl1YkfLnceRnOzwyGR2zTsxsMmJ55XZyvPFG81H/
	zrXxITSey0H7lfawPs9/wTKEeug3LYwNO8jDg54SW+i1W/WzrEzi3z0bWuDAnGS3n8OD4lWCMgE
	dEVR575Sn4G7aKFPy4/aaDp8O43QYy28n/XvHYV+Tld5iU4bUCHfHKfYi/pylX/3b8UpsUHS1r7
	scs1+QkIuyP+LpkDU5+Yd6Y9AFjcM8SqfFgc7os/lXMJHzAU39zb5qi4wUkVqSeRR69jouPZ77s
	/QOIkfEi2/2eXZA0ZwBCiQWAa6p8lkh2gFa8+xrXeW2BEdspYpzT6a+UhJCvtPyXCRMU6xs7sfy
	kCKRsxw1Pja/UJHiyVkVBqXGn1Lq5s1YTAdTiS0bR85EhIfh2+fihI6YthYAcIqztKfvAq7BpUn
	vvLvxosOpjIr6rxTQIWFji4bG6PdNs78RBmBU6lqpVl7/FhuDOFr5fYJ7vd1OD7brTz20aaKjfR
	Rbm11fjZMvq4r9G2qPeuXni628LCAsqbGOUwaK1RfF59WKeXjoaDgYAjoTQQmXwQ0V5p3gbjE4/
	rdKTcM+qxs93QLnpQnCWZJHUVPcW4MGi
X-Received: by 2002:a05:690c:f8a:b0:8ab:485b:9bc8 with SMTP id 00721157ae682-8b4aa257b89mr17110137b3.24.1794584695620;
        Fri, 13 Nov 2026 07:44:55 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:55 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:08 -0300
Subject: [PATCH v2 2/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 DSI to LVDS adapter with 10.1" display
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-2-59c45f0a0d8e@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5177;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=T1cPEZIk+cuERyGphRtG8eWr+AAKWp75eJwZYeMfJY0=;
 b=LHKy+f8d1gKR/GQgJynp2HgVYUNYmk0XOSunC+OOaw980MREimd2/L5xubXvJDkIdWBDQcgh4
 uRE4lIFrIVkD1TX4bIvf5s3tzcG6LCXacLKXzfpm83SN8yT2NiDNGMi
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_074456_849687_7B1A849B 
X-CRM114-Status: GOOD (  13.59  )
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

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA LVDS
panel. Touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso | 94 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 79ba27665f4d2..4cd72926b80e0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -731,6 +731,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
@@ -740,6 +741,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
@@ -749,6 +751,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
 imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-tdx-uart-mcu.dtbo
+imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
new file mode 100644
index 0000000000000..da05a02568893
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1", used on Dahlia (X17) and Development Board (X48) that expose DSI_1
+ * via a Samtec LSS-130 connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-lvds-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	panel-lvds-bridge {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_dsi_lvds>;
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_lvds: regulator-dsi-lvds {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&atmel_mxt_ts {
+	vdd-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&lvds_ti_sn65dsi84 {
+	vcc-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_lvds_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			dsi_lvds_bridge_out: endpoint {
+				remote-endpoint = <&panel_lvds_bridge_in>;
+			};
+		};
+	};
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};

-- 
2.43.0


