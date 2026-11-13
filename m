Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CE0606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cMpiJNXY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P+rr6HIf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zIWRN9vLoPyHTcFB7Jp/w2r6/s827ZL0kNYZ9k2LMNg=; b=cMpiJNXYzhV/GR
	QneoEPRkIH9qebham8AiJpQn9Ch6GL2cxHz5ApIg8aeLQkJBq9YRvq4ZIPhOJf5Fnbk+l06LoIzDR
	kMMrllMiLVf7rBM0KNRaW/E9IzKibLLftu7RVmNjmJMrWonnE8FxuiMnYtmi8emPzG1Ze3FqkREVC
	s8MqVHryuMBlBS/GhxEcyY0eIjokp81rd0rbiymovNixpobUAkrVkN0wL2DSpRw9wr/DHCnFp0kgq
	uDXUzy0+93TK3EeoQXvSSpWG9Arg27l6w3mNrggVVHA5HTtUXzBSsysMHhEAbEUMmbjje/FX5rd8V
	i3vdDNST18qJiPwsxjZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtZl-0000000DSkQ-3tc8;
	Fri, 13 Nov 2026 15:52:29 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtZj-0000000DSiT-2UnN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:52:29 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso342581137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585146; x=1795189946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIWRN9vLoPyHTcFB7Jp/w2r6/s827ZL0kNYZ9k2LMNg=;
        b=P+rr6HIffIfFL1+qY1pEAcVWdHW2LhSI84/e5I05AnjE+Wl3Vjf5M7Zg0CRqQA6pFu
         +g9rbHx3NJ7hR7S7gJLdil6H144IiR2eIaub6DSWXV4f2yfQLdViUaPmJ2+gQs+lDuT2
         lgZvuy6YKNv2BAzifI8ECPFXM+ZDkzaqECaMLZvnUP6yV3B3x/w2gq6IhREzXBQd9mXd
         j6NIbhKreuW66HAlvoh8T3pj5ZDe6RioLraiq1MicArSzW5BN8Vk9u2qdudtDBS3ScUF
         HVZPpkN3P6dmqHmQOh3NIu6SlsKy9eUNLYY2PAEe2tTMk3nhMRtbQYs0yAyQdKkloXE4
         3cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585146; x=1795189946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIWRN9vLoPyHTcFB7Jp/w2r6/s827ZL0kNYZ9k2LMNg=;
        b=iM+qt3YYG+Jxg0KRK8+bvkRVQJmL5bazhyz031dY+S7FgkE6wUWjDxC1dvam1vy497
         5iwvhDwO5RKJhA7curP+6CJVDjHHe+gufnN4+OsnK29J2Tpw8N8urRDIfv+cfmOGfznp
         E/+nlt+VFjnMIZWN2HXlxfTkJR5H30d8K0D9AwUVExWlONn43c2kJtrmuPJCyZ3JjhF7
         RVLSz96Cppq5uUSSQP39d/DAcGp4LA6GGJN4vOSL5i4mqL8MWxjPBnxuGtbLpGvVVwWI
         CxnhS1s0IDCyVQZrfKuuzWn/2cLo4hMmtf2SvTP+XfoOmvv6k/V0MDr1cDNR/U1lOkxr
         5PUg==
X-Forwarded-Encrypted: i=1; AL+hErFvLBko9F2wVzHjleLsJtk2vv5D12QstQSJCI252OcaWPJA2EY1p/zyrkQZy33QxfflzA2AumRAfMl1OqU2VRpK@lists.infradead.org
X-Gm-Message-State: APuU4Z9fStMyktosCGstOZgI7EUFnk5+ZXTdHLcyyl3MC0bWg/4AVnWY
	mJ0l83psuNxLKnRZG2rndUr5WBYbXiDApB6MX5m1NpYsLVMqCDUJ7i+n
X-Gm-Gg: AYBFou1t15QYMw1DRV4Z06KqYyC0x5AUM7PhOoqAOkwchlQ7GMzlHQjDQ0gmT4VKl/t
	T/GdgeWld64TyIIWt7hqBUhfME/eHsWt2GXTNjqO8xTrE5ate79EtWZ+orFnbhbnOpfQcDDAktp
	6cdPXF9i2IsyltLZvL1h30xlHHaItb4WMamZs9dpnDElh0FMkLt+Pm2v8dhmzhgi5MLwXkuCZg6
	5SYewPz4Oh0Hm4mA+v+soegP5JpB7XnZcs9IjHJcU1DpgHJ6HYlDXSO+ORY09mPZMa+WhCHWrkp
	53od4Pue2kS9ddGdUMG+W+uJvL9Sz49RHqhRNAIQSaTx/G0iQS2+d2h8MSGdSzlrHwc2AP5f3Po
	TxDqF1xcpPwcUPY9+H7PQqN4VBdu5io5VaiCYCi2Th/ylo+U11P4zKTbEDUhnPhinEi0IEfWTnV
	9h2qUjfE1ICEAAamxfy89/mJcaR0/QlLIXJJ+/ivYMroZfekm632Gu0BfunsrZYgXGTo+c9tZRW
	2DfmVRoeN9coixj4aTJysFaYqeoXqZkKrM+/7GNeDULH7XGSKBwfR6p0j0D1PdmL3s9rTrk78HQ
	1QYPA7FX/C6Mo6zKW0DarqR1Y+GepzR4
X-Received: by 2002:a05:6102:3e8e:b0:7cc:23e7:e74a with SMTP id ada2fe7eead31-7d64d7454e6mr798389137.14.1794585146176;
        Fri, 13 Nov 2026 07:52:26 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:25 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:15 -0300
Subject: [PATCH v2 4/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 10.1" LVDS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-4-327f5d37a9c5@toradex.com>
References: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
In-Reply-To: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=5136;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=qBu6AF0oDnpXjHX9V9XIiZrMULpT0BgZODCiPSH/VuU=;
 b=ahR6En2etBvCKOtaQfJtXALIXppt4UGBMA5qhBII05IfV4TUQf5OfmbYr7WbIYp8KjD+SMqRb
 TMgC4/CTUM9Bi0UcVUo4aj+qatRT6GhLyEicl53UdjGXCC1cgIMKO4k
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_075227_682654_7C73785D 
X-CRM114-Status: GOOD (  14.07  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display
10.1" on the Toradex SMARC Development Board LVDS0 interface. The panel
is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the touch input is
provided by an Atmel maXTouch capacitive touch controller.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 ++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 80 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b147b93b2a067..604bb35675930 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -713,8 +713,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
@@ -722,6 +724,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..a177cf61cc383
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Toradex SMARC
+ * Development Board LVDS0. Connect the panel to J48 and the touch
+ * controller to J49.
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
+&{/} {
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD0_BKLT_EN (SMARC S127) */
+		enable-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
+		/* SMARC LCD0_BKLT_PWM (SMARC S141) */
+		pwms = <&pwm2 0 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_lcd0>;
+		power-supply = <&reg_carrier_3p3v>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+/* SMARC I2C_LCD */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		/* SMARC GPIO6 (SMARC P114) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
+		/* SMARC GPIO4 (SMARC P112) - LVDS_RST# */
+		reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_lvds_native_in>;
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 71.1 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 71.1 MHz, or 497.7 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <497700000>;
+
+	status = "okay";
+};

-- 
2.43.0


