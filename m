Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A46606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C2pAVWbW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yVEHRJFJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pvF6QhKLZwUOSdpU5it2yFnQfDJc4l9yR6jPH+WNhbY=; b=C2pAVWbWj7uED3
	YrmVdppfFt/jpmJUE/UDcND/Lfv/S76PDDM8KJTClQhNHH8Sdeobl7zVbC8qMYUQ89SN334NCBZpb
	Y+cNTD0mMCrcbBD91v6Il5z9qCvNgrtHJb4BYxj3ZTKTxBL9+W9QS8uwC/Ty3wAAhsfzSWZ50jJfP
	Ko8ZE+Iaw54T497LPZ/dVThsDx9uEwZp9mMwQIzsvTVqPxGQSmFJ7CYz0VUKfbMXq3uG9jF3obdeO
	d4kMUpjgfzvzq0ZXTMPdo3VYUrObJwTqzCSlu8S2Zi4NNjaiKvtItut/Q6VEX3GUmD+bDgYSL6gZ8
	A2sjW0B7cskactV7Y9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZZ-00000003YDD-0Nl6;
	Tue, 10 Nov 2026 10:59:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZU-00000003Y98-1Ahw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:59:25 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1583111f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308362; x=1794913162; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvF6QhKLZwUOSdpU5it2yFnQfDJc4l9yR6jPH+WNhbY=;
        b=yVEHRJFJkHx7PNsBQnjtiHeM+IDiKkHwsTI+FiiPv3qWfZZDzJE6EXppq53yyq576d
         SPbqnhZpN9jLoAHHljh66m+3Q/m6j9magSm7notQTzVsNQCVd5mg5RglxBH+IZMakz46
         PDdbPstUOzmav12Nht0I/0PCsmALn7nVZlUVtlqLkKMLC4w5lJgE1B8u8B8PGQSmgqqE
         9czaNRvpyrQiBwhDV/Z6+Hx4ZN3dZj7bRPlMZZHiwLws766cFlYL5kZA2ERKBQYXojaY
         Fx177a2YKnls1wZ9L+RylbraEBZAAgk5ZTlnLnD2OFbdn/HtmrRq1sJo6fujugKf0Nrv
         8dqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308362; x=1794913162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvF6QhKLZwUOSdpU5it2yFnQfDJc4l9yR6jPH+WNhbY=;
        b=g20Jb7Ng4bQelSxTT4tP6R/dLIAHPqccgkWKBqj4OJWvauxXOFpSHkSIkZPCGNHb1r
         KqARjjbTNRmL65Qgbia6uYwXsuJF/JlfoIcKnZ7/Epy9B4+WeiQUaynJ6YeYDq7HTC6N
         M9//4K4khiJb+Ceja5gcR91NaZeTUTxRjcZd7yoTsCJdLCw01n3fk372AcOut6kMGGou
         iz8mcOrADdUZ2Ds6jSZ3XuL+BsXWwCAcFXkYv1A/SzDoq5Ub056MBM99LSdgjyn1DqOe
         1Ar3+0JDoM1vmjqDJWFNndPQlzgdTLbTwBg0GH7ongznsCERPV1mEpK5BrWWYB/XG0GH
         pTAw==
X-Forwarded-Encrypted: i=1; AL+hErENKvGFRKB63zwJyebtysO9Oe2RH/PrYdj8LDGbxDw+hNNQY1TMPw6xFu2r3deX63Slumkx4R6+Oo9QckBCP/9E@lists.infradead.org
X-Gm-Message-State: APuU4Z8j6Pj0OBpn+yDeheswffN2XHM08keNUKXYYMZmdNZ0Gbc/Hb/X
	N4ISdrhQALRslTd23OnJ4u47SNpWvAW8xGIW0Uz0MDS6HxbeZ2fccB8L
X-Gm-Gg: AYBFou0IF4xCFyesPJDNO0E4LDuqVbNmhfGe99xjN1eLSCTwi52KZcK/FZF5FoEn3e6
	XrsueU5cEsYT2rOReN6865CM2Nzoh90cKHvF9uPAvSIhdU45ZVIaZSyyz+zqsdLOj5S6wO3ggKt
	6jSIMtVsVaHXXLjQwgfWLEUALHMrM6V/1CP11OzjxPYD249QA9xaEy4665wAs1tsSgG83WalUve
	MyNXcNUJLfYJnyOGmnX8cN+Sb/BI8alL/d8+FataVLzGViOhhlAD2tYNuBU98FHON9172FrFEUJ
	3YtmQCWoCdTST4D/ZhYml1zUi7SJ9ty8L9E/sHsy3oNMH0796M7qlaKxFQ8PPUOUnsHkJyZjv6e
	C2g+5nZBx8eBgULpKOohqah5Lxx8YBEWHksgGjOS3mFVcD1qm9+FDWDHMLG7ni+KrSSJ5mLZ7ch
	qFUm7QHwhcY+dgoXUXZ1JzK182MGZ09tDkYvNfp5/WfbSa1e0CJn6ySPB0I2i47ie0TAfSBLpKe
	wTAYLZsG8GEeOrvP20uWpCWcD6GbPup/BxWn5+85Iz9yz3+mm5qC58Yd9RKOljweBKg0f2fbb/J
	Jyc4LHeEPvr9vKYz73NQb9QbZnbLZ1TcaC7cVVZEcBmQPMr0phNNk+8DJnQpq4Ha7phw0MoGmYF
	z3kvbaHiaeq6VgUbUcJwhvXJiUClpBEDg/MyDACAG62mtvF77skM=
X-Received: by 2002:adf:e00b:0:20b0:491:273c:9649 with SMTP id ffacd0b85a97d-4982ecf6922mr2926241f8f.15.1794308362368;
        Tue, 10 Nov 2026 02:59:22 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:21 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:18 +0100
Subject: [PATCH v2 6/6] ARM: dts: imx6dl-colibri: Add VGA overlay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-colibri-imx6-overlays-v2-6-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4935;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=BTOXFn7FRMReU92cBtLstQ5vnpngA8gkkNTJbTILgmo=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JPZo//o0vZ5PDcNAx6brspzm/9t6edJf1f6+Gzfs
 PWJkfSuNR2lLAxiXAyyYoosGU9UBfkUQmQ9OJqTYeawMoEMYeDiFICJKEgyMnSkxU3lErp3ny+r
 IcJp+ezJG2qS4v+l1a379uVgXhXLztcM//Su3Xp7TElgf8qi1XJ+R7jXrJ6u2c+7TUo5/vgJi9B
 di/kB
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025924_360389_A99D4599 
X-CRM114-Status: GOOD (  16.01  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the VGA output on the Colibri iMX6
parallel RGB LCD interface. The VGA output is driven through a
non-programmable video DAC without VESA DDC I2C signals to a DVI
connector. The DAC power-save input is driven by the BL_ON signal on
SODIMM 71, like on the Colibri iMX6ULL and Colibri iMX7.

The overlay is also combined with the Colibri iMX6 V1.2 Aster,
Evaluation Board v3, Iris and Iris v2 carrier board device trees to
provide ready-to-use DTBs.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                | 21 +++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso | 67 +++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c15b09c058eb..cd4c8062e678 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -84,6 +84,10 @@ imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-aster-vga-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx-hdmi.dtbo
@@ -96,10 +100,18 @@ imx6dl-colibri-v1.2-eval-v3-tdx-panel-res-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-vga-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-vga-dtbs := \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx-hdmi.dtbo
@@ -108,6 +120,10 @@ imx6dl-colibri-v1.2-iris-v2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-vga-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -154,15 +170,20 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-aster-vga.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6dl-colibri-v1.2-eval-v3-tdx-panel-res-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-eval-v3-vga.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-vga.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2-tdx-panel-cap-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-iris-v2-vga.dtb \
+	imx6dl-colibri-vga.dtbo \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso
new file mode 100644
index 000000000000..f22f1969a6a8
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ *
+ * The DAC power-save input is driven by the BL_ON signal on SODIMM 71.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	vga-encoder {
+		compatible = "dumb-vga-dac";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_bl_on>;
+		/* Colibri SODIMM 71 - BL_ON */
+		enable-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					remote-endpoint = <&lcd_display_out>;
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
+&lcd_display {
+	status = "okay";
+};
+
+&lcd_display_out {
+	remote-endpoint = <&vga_enc_in>;
+};

-- 
2.55.0


