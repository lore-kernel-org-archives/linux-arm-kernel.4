Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9641606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HnkiwA0B;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyLU1d6U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DGkDAf1iwgLQ/ySGo4CZw9li+oraQecEr79Tmk1GLfo=; b=HnkiwA0BgxYWBx
	CmM6seBoe/oIrjeTuydLJpLfFM5DgbvCXn8+OMmqQI3cfEETtCPC6vTNLa7amKdb9FWkkAhdEisar
	6CphSJs5R8QD3H8qiQtmCoWWvUJ5GUEoFgHeDKtREXXQoCvgnN3tuDB1hd4bdso0zj3dVdlDfjtba
	NIljgqXi4PUl2POohyPhYBmmtW279rIeHAcWn+aniSssKE3O9wkcuncdrPYSFcH2SvDzueKg+An+i
	ncIfsxXl1gWUM9t7kVTwd36cQLVO6w/Bon7UWNU0JEUCdr6BOF3tCewRYH1W+IAFD5NXzsOMDs18d
	AfWYzrwOiOVU4Tz/JYYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZY-00000003YCP-3FY3;
	Tue, 10 Nov 2026 10:59:28 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjZS-00000003Y7l-1HhI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:59:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1231452f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308360; x=1794913160; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGkDAf1iwgLQ/ySGo4CZw9li+oraQecEr79Tmk1GLfo=;
        b=eyLU1d6UygM6pwi0Ah3L4Zfh5B4zKS7/94LYZJYHMpEz4Cpb1aGae9s1zf9GJWEN7A
         AN3VAwVvDQsTAzbWYO/xi7J+UFqw5gSSTdBPxfnUimqZDDuWKqJ//as4OYRiPRnnJpDG
         cycWDpU78IdBBknAMBE6fO65jnKtxzaTM8/3QhnGQM0QYr7WVx8CqCFWvrpISzG5/3nG
         I2zvP4kcf3bHpXbvhO5vYzxjz1CGumdQBcMIHTaRdtZa2GAyqNNoQGvj4FBJI8PyYp1I
         cMLQKIYuYCp9XWUb5I6bH/NE2eJpZkJmID16fnILZHZnka32qxfP7WfkBUxeImjZQd1X
         XBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308360; x=1794913160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGkDAf1iwgLQ/ySGo4CZw9li+oraQecEr79Tmk1GLfo=;
        b=T4J240V8D/lnT/Fj2bs+Lm6T7FnWkD7SX4ehy9UxhG10FtULmlBQSTOjlLayyyupc/
         K6oYruqTFNXe4NCgfvbibrwjn0rd8kzUyTOWcRQ8H1bphgAmfgd9kt3OGCFAR2BK2u75
         TP0hvnhvlqb5Dex1f7bYG8ywn0H8FfHDGmdcfA5wbYgWSkOgBTi3xXdTvYVk8du5piFD
         9xqOH1AAWRVgNAbMYK6ZQzk+8xtBgAwQ5YwjxwmeGkHV496VRf5burxbqzDZc09GASoU
         O3vQrBq3t7HnEY60wW+Bdei3PY12zLCU9TOF5jc6S8u0mxmG2jRf9nYGT4Bcc4FmFRVp
         0GUQ==
X-Forwarded-Encrypted: i=1; AL+hErFPvEAyqkGtvM4jzIMo4ACNoR7VENGkhyZXTrFl7D4FDUoMVqf6B9qDrbML1qKXKnVdqHBlJ4chtVTeP8XPeiCc@lists.infradead.org
X-Gm-Message-State: APuU4Z8UMDHAU+/jJHAgADHURbtqLX5LBbMJKLdpuTLDstUJVCy0c1nR
	eixw5VamvCxX4eR8hwrsg7WnIz3ti4fMpCQHLWil1e4wjqXYoZlBAXAr
X-Gm-Gg: AYBFou1jrolJkHL8/8NNQ0qiaPY+8e7FWIW9JTpQALZL2vcQbOnthgwpgbMgRH1zmAA
	gFeCen1kzhnRRXEWSiYMNlnUGJzLdbxwpNYjOk/cvbDmrunDvMNpnqOOsVzLCJkn9sJxu6IRELj
	XGVYJ+bVSOZSU4U6KVy2wvVhVt+HiRnHeypt140bbh9wPKuIyIy+fVV1AqIYp2xnRZoYNFi5cP5
	z5O7qLEhTGjXUiNvOjUtcrbbIiVZsX1wcbLnEQk3i4xarEc/cXsfxcMaM9OMWXFypimFkpT7qwd
	dpbIZdG8KgS+T8YjczXb+cBG0PG0Rnt/39g2wwJqfBmcktJbbJOQErLLP1xS/sndrAsFYIK/akv
	CKJ7aTr3dxh18FvJej7KYRAfCisSvUKYYCQh5L4wwOLMFWt9zIzzqO+5d/IVA/3bri0XPG+R0lZ
	KM87ZUmWryZvUWZQuuxASjX8dmd3yK+o1Y2uvDMbsr9I4m6ymGvUflzQ3Z1d/AemNjg/uciAcQP
	NAZdjd480taV055bkY03rYNqvAKDjc+qV458+2yBd/v3ZrK/OhWfBFbUNrCxkz+RJudQ2TdFXoC
	pRbwgHHF/ceeFEZ2PQbv35FtocWlklMcenpj5FxEU64kLj5ICoQBZAd+Gay33/qDDVafwx9lA9e
	gr/oO44GYT9YVxOhxQ/sQXLSxCX/zV8DNdcFxaeHFmc0F0/R6R4E=
X-Received: by 2002:a05:6000:24c4:b0:492:b1c5:6db6 with SMTP id ffacd0b85a97d-49835e20e10mr4901092f8f.6.1794308360444;
        Tue, 10 Nov 2026 02:59:20 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:20 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:16 +0100
Subject: [PATCH v2 4/6] ARM: dts: imx6dl-colibri: Add Toradex Capacitive
 Touch Display 7" Parallel with Touch Adapter
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-colibri-imx6-overlays-v2-4-9776c186d953@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4596;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=I2N4IIgnqZ9lXk9WuHPxr/mHiETXFvJEgNN5qC1ebNs=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JP5Qq813zeHH+b/w3uTD+h2SX1dV55ZZfJ774QKK
 9niWMHUjlIWBjEuBlkxRZaMJ6qCfAohsh4czckwc1iZQIYwcHEKwEQenGBkOJ4457apv9T05W2T
 9ANuCrDeOTsl7bXc4+aS7zHpZ8/3MDL8L9itFX4o7Ly6p1/cu+PNDJfa+Q94Ze+eV1BzsGnuHd0
 p7AA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_025922_454359_1F680F44 
X-CRM114-Status: GOOD (  16.71  )
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

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex Capacitive Touch
Adapter, the connection to the various carrier boards is documented in
the datasheet [1].

The touch interrupt and reset signals on SODIMM 28 and SODIMM 30 share
their pads with the Colibri PWM<B> and PWM<C> outputs, disable PWM1 and
PWM4 to avoid the pin conflict.

The overlay is also combined with the Colibri iMX6 V1.2 Evaluation
Board v3 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Link: https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
Link: https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso | 57 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 7f527e2b9090..02d21d62b370 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -88,6 +88,10 @@ imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx-hdmi.dtbo
@@ -141,11 +145,13 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
+	imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
new file mode 100644
index 000000000000..ffc54438d33b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtso
@@ -0,0 +1,57 @@
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
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ * https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
+ * https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
+ * https://www.toradex.com/accessories/capacitive-touch-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&atmel_mxt_ts {
+	pinctrl-0 = <&pinctrl_atmel_adap>;
+	/* Colibri SODIMM 28 - TOUCH_INT# */
+	interrupt-parent = <&gpio1>;
+	interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+	/* Colibri SODIMM 30 - TOUCH_RST# */
+	reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};
+
+&pwm1 {
+	status = "disabled";
+};
+
+&pwm4 {
+	status = "disabled";
+};

-- 
2.55.0


