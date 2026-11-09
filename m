Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A40606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2nUmR1ya;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqCTYuMN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UYW1wrkZr6Ve325KimyEhngJfnF/nxRsNmxSJ9VLYKA=; b=2nUmR1yaSpGMw5o/ZCVDk2aZcX
	BKI/xiMKN9M5/9tMreeTgKn9UeoEUc2ee8st3fl2rjg/dU5AvW/ts6HWnWm+92I9zVwJmS5ln9Jv9
	/BjIkAbw1yFHT9Kw8JghHGCJ12+skxWUB455q2Mq6W9td9j3J1mHHF3QpbjuUsV0XX1tq0AEilPU0
	SFEOuJfU/LnzzA+tCxVBajQT3BTOJw3ZKg1dwmR6UveFyMuEzGE3ZsNNLDKYr6sfccxvMee51/UbC
	MyBzA0aj1/xJIii0pLIIpA1ZVaBjUCejvUN//IjXI43DkHM+2V72RqEQoa8IY0o7jlEagxTqMqtOy
	tC/+4OtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVe9-00000001c1E-2EPv;
	Mon, 09 Nov 2026 20:07:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVe1-00000001bzZ-1J80
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:07:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9909060F01;
	Mon,  9 Nov 2026 20:07:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794254828;
	b=B8SmZYrxmpRa2dFKX1uf/k2AixEZrULsJs8/xQcAeBNwxpmYSim/MXdcn8kNO3xAQwM2
	 rAyuHXFTWkQNaw6R9eKBEr7akJ9bBIeKAgAG55zAd4YOAzXN1zF6qfLv+zJ6DnmioJR1X
	 b89dqb4brvOpgMu54ItKgra9Am/G9Y6b08z7CjmmwTiootdHjFqfr2d/1v/oLf+atun+x
	 vop5+/wLvkmN3N7z1HpOcK4ZYBQkp+E4SeG3W7HzLR2czPOR3TXTjlAAMW6YMs2J7J6h4
	 JCvFJ/zaFFadofW2n2y+YNL9YEWeHVCboivOh22IdwqJFqdLdPxqCCy3ZfvGSyFuYyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794254828;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UYW1wrkZr6Ve325KimyEhngJfnF/nxRsNmxSJ9VLYKA=;
	b=NFpAeNnZHts6bhmW0n1c+dNPSNOL3J+Ee7Vq5/cWjTzKoawgcYtr7L1XGnPwJzRgBeIn
	 6R4GVhSQtXPPJVlmgqrbeaedbXWfueDHBwX0CoW80QqueYJ15U3vv3XHBrC39FaRNEEg/
	 495D1wk1xdul+nr/DWeehra49o5vjGSwV28q5cTNtF0ksI6exEfXeBSGtjYtlPcxdD8DH
	 G3wf5HrJNOpyL0Fz1c6u6o74DtjRg3Mvaa+fqPXSYqkZWBYZT70sT4lr8TH1r9B7PqXha
	 wz3ut8SeKq5I3bmR6mG5oYT9NZclBsUlqP8dDt3c9JR0Hpgc/clWJ8G+oMOweUK+nnw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A25B1F008A2;
	Mon,  9 Nov 2026 20:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254828;
	bh=UYW1wrkZr6Ve325KimyEhngJfnF/nxRsNmxSJ9VLYKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NqCTYuMNsI5bOix0FJYUSlgiUlJbo3p+6ZqDK1vIT/l6zHlC5nPgSbks9k7JoKKfK
	 uDDt2A9+d/HPzXC5+dGjf6ExHngoBXDrSyDbSl5CBhJtv92Hgz7Wo9rY1qvSESFrPT
	 pRbPhZDupJsUzWBUkNgIJW7ZaNCgatEd5vh0f83+B8cPk0tUuUupkNggWXV5lLlmLC
	 wUhTUI/3QtcHdNtU8UO/KCCw245HCA7JkxpG7E2tSxTUQsrt7ScjvyAHbQrAq8Aizq
	 Rgaxe30qzzlU1/oCffwy78DukK8GPcQH3SgXXO755hPaoo2V9Eaj6lQ0Hmp5VY81in
	 mNfrT4D0xH8eA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 939B148630;
	Mon,  9 Nov 2026 20:07:06 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Mon, 09 Nov 2026 20:07:06 +0000
Subject: [PATCH 2/2] arm64: exynos: Add initial support for Samsung Galaxy
 Tab A 10.1 (2019, 4G)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-gta3xllte-support-v1-2-dc0c4bfa8b44@mentallysanemainliners.org>
References: <20261109-gta3xllte-support-v1-0-dc0c4bfa8b44@mentallysanemainliners.org>
In-Reply-To: <20261109-gta3xllte-support-v1-0-dc0c4bfa8b44@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794254826; l=4320;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=+LL3c8/ipkqWVv9r1KZLMf00kFeNiLI3tGaS/IhfK9M=;
 b=1kcjAI2er2E/jruRzNf2zvKZqzyiw+XYus1gGcAgQ2acyyMcd1aNiyOmUIXlsCD2XHRwvi2Iz
 Qkz61dJ2YHIC5f5Xxk/8vUV3LDCgTxMrvwqS7Z3qwA+FGzR1DS7nJYb
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Umer Uddin <umer.uddin@mentallysanemainliners.org>

Add initial support for Samsung Galaxy Tab A 10.1 (2019) is a tablet that
is based on Exynos7885, this patch adds support for the LTE variant.

This device tree adds support for the following:

- SimpleFB
- 2GB RAM
- Buttons
- Internal eMMC

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 130 +++++++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 7534b773d28f..f1946a95cb42 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7870-j6lte.dtb		\
 	exynos7870-j7xelte.dtb		\
 	exynos7870-on7xelte.dtb		\
+	exynos7885-gta3xllte.dtb	\
 	exynos7885-jackpotlte.dtb	\
 	exynos850-a217f.dtb		\
 	exynos850-e850-96.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
new file mode 100644
index 000000000000..0e4e6c0b20e1
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Galaxy Tab A 10.1 (2019, 4G) (gta3xllte/SM-T515) device tree source
+ *
+ * Copyright (c) 2026, Umer Uddin <umer.uddin@mentallysanemainliners.org>
+ */
+
+/dts-v1/;
+#include "exynos7885.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Samsung Galaxy Tab A 10.1 (2019, 4G)";
+	compatible = "samsung,gta3xllte", "samsung,exynos7885";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &mmc_0;
+		serial0 = &serial_0;
+		serial1 = &serial_1;
+		serial2 = &serial_2;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer0: framebuffer@ec000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xec000000 0x01400000>;
+			width = <1200>;
+			height = <1920>;
+			stride = <(1200 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		cont_splash_mem: framebuffer@ec000000 {
+			reg = <0 0xec000000 0x01400000>;
+			no-map;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3dd00000>,
+		      <0x0 0xc0000000 0x40000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&key_volup &key_voldown &key_power>;
+
+		volup-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa1 5 GPIO_ACTIVE_LOW>;
+		};
+
+		voldown-key {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa1 6 GPIO_ACTIVE_LOW>;
+		};
+
+		power-key {
+			label = "Power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa1 7 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+};
+
+&mmc_0 {
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	cap-mmc-highspeed;
+	non-removable;
+	mmc-hs400-enhanced-strobe;
+	card-detect-delay = <200>;
+	clock-frequency = <800000000>;
+	bus-width = <8>;
+	samsung,dw-mshc-ciu-div = <3>;
+	samsung,dw-mshc-sdr-timing = <0 4>;
+	samsung,dw-mshc-ddr-timing = <2 4>;
+	samsung,dw-mshc-hs400-timing = <0 2>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd0_clk_fast_slew_rate_3x &sd0_cmd &sd0_rdqs
+		     &sd0_bus1 &sd0_bus4 &sd0_bus8>;
+
+	status = "okay";
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_power: key-power-pins {
+		samsung,pins = "gpa1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};

-- 
2.56.0



