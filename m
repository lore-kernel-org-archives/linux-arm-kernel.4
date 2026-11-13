Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B6560A2624
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jQT7zRWt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYS7pboM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qHtE73vhqIdWc0I+UqTverKQ3sxYALK0cFNNVPTEYDU=; b=jQT7zRWtP99GCZ
	KFGmLMKx30r/+kVkQ9QMj1tV6rf/ypT/83aM1e5jIkTASQhQ0mUco+gxEkEGVo099dyGGtMxmPR1s
	UE1qN2yvSx+pXegkojoe/szaKzcTBji2aEkHAUIqhACU9d3qcZLoIhK7qbD2vP1Sf8KKOoAXNMyzn
	v/P7smXrvK7jKfLOVpwcVsGg0cbMGczkKEBwWlOEsapffNqS06ZnqTSRACWlFkkZRRZObSKH7o9Ua
	GdLxce8pNeIy2zfrdh88mmlTZHI2m8eItTL9EerC+kSWW0ERd4pOiaqEqz+Dy0KdkBaiMWB6A1qDD
	yOkecuc6k+D0gyw4E5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSf-0000000DRBT-44ac;
	Fri, 13 Nov 2026 15:45:09 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtSX-0000000DR6r-2M8O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:45:03 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-8b3b57a31f7so10002627b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584700; x=1795189500; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHtE73vhqIdWc0I+UqTverKQ3sxYALK0cFNNVPTEYDU=;
        b=BYS7pboMah1FGhXAgx+tK16JBJHnQop7MszkFHR0NK6P2TLdYc3GNUdVnK1xKFQVVF
         Df1JYjK9/xtvBYLC0b97CNM0SKSazUOmmPZZH401TR9p+tRa+XiCumrZin81kwpJAER/
         sNmUDNcQ16xIoRrI5TNfx8y27VleiWhIwz46mQKv3UnRjpB0msAydeu5ovzEa9T+9a5X
         73FUYP+kJW/qw5BIAe0CJc2bZbhziA12ZVlIZhAo7yr+1f/cXP92/YYouIIQ+j+2aD50
         9OLXOeZyrwWFljXoI1WWtbPgERrNjULjhS5jXp6Y5HgVbKHtKfRWw2HAXKmjEFUpBK5O
         w1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584700; x=1795189500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHtE73vhqIdWc0I+UqTverKQ3sxYALK0cFNNVPTEYDU=;
        b=r6kOv8uAchZIUdP2p8S1rgw81Sd1FrlSbfPtMemH7zEeEAAXTUbqVVcu4QGrSGQGY7
         af4//sBQX9AGM5SsiRsC53xVC+zZ9duR2+LhJ8qFksq91PIAJf6gl/9gtcYqayNboxM9
         1bI8VEJdENghpSsSx4tr2tQz8Caa19RzvDhQTZQ3m6gnB4pf+Sz7gtPPE70qiAnvfkQG
         i7BMLwjnQWQnxyMQZ2RncNd4/fjxyeZw4725epYxOVRBKjpQLJSL58Lskss5J99WQc1P
         b+oe6s3g6SYZXJuHB7e1gsWYX63Ji2JUKE5ViuHhtz4f8XopZGFgFU1jyJi+w9611lWT
         fHpQ==
X-Forwarded-Encrypted: i=1; AL+hErH1fvy+FdEA2YAF9t7D805ndW790Am7Jfcd3bXgcoCYHCIoEUFgB3ixGLq5SSY+aXM39LlX+xCBJG8s2cOTtqMC@lists.infradead.org
X-Gm-Message-State: APuU4Z/sKp2fIbyDmheno7Q/F19t3ueVGPvKND9KWNU0pVWno+Dk3cbD
	uP/5fD+PVSiAkUgye3ng1Ej8VBelZx0sIxAKgzz3JnQ5Ucy8XD6gNgXU
X-Gm-Gg: AYBFou33sT2Or5ABtr56PPO8EQynqvf/1IFKO+yIgzT13HRKMDY7B6HfeWjeU/0hnch
	x9bhD2U5L/55Er8lL3hOtPajKZFlHyQOtxskx6UQZ7B1xpbZEeS5B/PCZUL+duBm3CQfLJzFyBY
	Dl/Qo6rAIQKw28Gw6V28iW+ZY7ZJvpMF63vsXdqpdH3UXcFhXlSKqUEBlZMNBhTdWWlOOjT4Lsm
	GGMKx3VMLMZW8vf5UB/7yxu3v43Dcd6Cw0VlkQP8evek838oSpJEbzFHzzZNQEYfLuwCe8vtYA6
	sNINnlx8GtJahBWjSzlEbR7b8mFiUfK30PgI/REG7x8KRsvvV2IdiHSP55pBAevYipD8s5dw92U
	8mCWHZbhmJEHD47pEC31uylFXtBUFAQKuKOl4KyeQvx4tqzThSa53r+dOhRkdpjzMVtjGklfMcj
	mF/nt0cFaYvtzhckMjcOI3xQkD/L8woBxWG1Ria4/0GKrvKda8xj4J7Sfuw9/869yMpX6QYBJe7
	l79LErU2SDEiszjJ9sNPXODg7VNiP+zJs3I2/VfaVxkjAILHbTn0esv9G2wyXKfCRaP6FOy1Wyu
	+Y0kEZ8DWtOftPifL/m1vVlJtUR8EzBm
X-Received: by 2002:a05:690c:386:b0:8b0:b1dd:c09a with SMTP id 00721157ae682-8b4aa29f563mr16924097b3.64.1794584699912;
        Fri, 13 Nov 2026 07:44:59 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:59 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:09 -0300
Subject: [PATCH v2 3/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-3-59c45f0a0d8e@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5024;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=wd7JjVXjadga4ELg+VIdxEXEfAr2w33RKXLjgv7ivC4=;
 b=CqHxEnZYhjZDB9Wuj005NZAt0tE3LkmC2TXKbUNRJIFlIkB0k7ZbxzCsVtfUjv+USdQuubvQx
 EuoP9sp1y3HC6AUu/J0/9s1LVOIm2+2g/qB5IzVpXd8aw3Y5a/Qi/D6
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_074501_682317_952DF807 
X-CRM114-Status: GOOD (  13.55  )
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
10.1" LVDS on the Verdin Development Board with Verdin iMX8M Plus
Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
on the Mezzanine LVDS interface (J10). The panel is a LogicTechno
LT170410-2WHC 10.1" WXGA IPS LCD and the touch input is provided by an
Atmel MaxTouch capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 71 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4cd72926b80e0..915507fe936de 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -731,6 +731,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
@@ -742,6 +743,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
@@ -754,6 +756,9 @@ imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-td
 imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..ce426288081c8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS on the Verdin iMX8M Plus
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
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_mezzanine>;
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
+&atmel_mxt_ts_mezzanine {
+	status = "okay";
+};
+
+&backlight_mezzanine {
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


