Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F06606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JkVp1oNO;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=ZTi0SnQ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OKhL1RyQfYU1mPuHr0IfuJwmsiVrtkgY2MGvOoQEXQI=; b=JkVp1oNOw41+DQ
	Io/sFeVUXzYVsDsrF6TaJPs1jajd12akkFBENGtZ+Zq1KcmLHtOFa9ANHh6G9xXay3W4xk85tRg9a
	lf1aKvmI2MA+0Fc7WisfwAME2fLcOQAy/O2V1FmJsFWkH0CJ//DM0XWzR6GS295/5fwlT08YIXL4x
	Ow6hai4TVihPSTBYFEvTMzICzMksCFzUTXGFqFdh+EueEsUjHaMTLM4LDYYeDOF9O8dqvA+OZgLUP
	LpRcNTht3XjYa5DEdt/fBTVrQ39ldi+/6PZkLDxpWZMhWv7aRpwDuPA+0M1V5h2qxFjSdTUHERkwf
	F2qyBtk1qVbn5WJoSvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIqT-00000000o0y-24Qk;
	Sat, 28 Nov 2026 13:52:05 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIqA-00000000nuS-0MkU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 13:51:47 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jcBXc3F2tzKmKQ;
	Sat, 28 Nov 2026 14:51:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKhL1RyQfYU1mPuHr0IfuJwmsiVrtkgY2MGvOoQEXQI=;
	b=ZTi0SnQ761ftQ76weU0n1A3/YmDfFdNU1xg7TdNjlucRyuClqIcli1CZ28xqIHJegWFDkK
	hqnN9ExaiasEDTNFivXo/6fpEbvYOXGN98xR1FNFKUZnNgZVU2J+5vMxxH73SlKe+oh830
	llLOC+ocz9vWMBDSeLIpbvvCSesZaW8e5sWWkbvHRM41txTjRMgiT+1zNsUsdOo6WAUasI
	+FwJUGAnBwI2HUY+v8Jsb455Bk4GvernpEr9cWEvvSKi7ie2Z4f7M42F2Pj4/xgUXkJpax
	HeY0NEVzIrXK9LKKoGwqSoQq6GKdnUeZO+4euFPMwJtFMPm5c2AWx2Hrv31Wtw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 14:51:33 +0100
Subject: [PATCH v2 6/7] arm64: dts: exynos: gs101-raven: add S6SY791
 touchscreen
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-6-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcBXc3F2tzKmKQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_055146_297327_08BF1FA3 
X-CRM114-Status: GOOD (  10.62  )
X-Spam-Score: -2.8 (--)
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

Configure USI11 as SPI controller and add the S6SY791 touchscreen with
its supplies, reset and interrupt lines.

The touch SPI bus can be muxed between the AP and the AOC coprocessor
via TS_SPI_SEL (gpp26-1). Hog it low so the AP owns the bus.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
index 7c4273796a22..02b19e39055a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
@@ -47,3 +47,53 @@ &framebuffer0 {
 
 	status = "okay";
 };
+
+&gpp26 {
+	/* TS_SPI_SEL: low = AP owns the touch SPI bus, high = AOC */
+	ts-spi-sel-hog {
+		gpio-hog;
+		gpios = <1 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "ts-spi-sel";
+	};
+};
+
+&pinctrl_gpio_alive {
+	ts_irq: ts-irq-pins {
+		samsung,pins = "gpa9-0";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+};
+
+&spi_11 {
+	cs-gpios = <&gpp23 3 GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	pinctrl-0 = <&spi11_bus &spi11_cs>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	touchscreen@0 {
+		compatible = "samsung,s6sy791";
+		reg = <0>;
+		spi-max-frequency = <10000000>;
+		spi-cpol;
+		spi-cpha;
+
+		interrupt-parent = <&gpa9>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&ts_irq>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&gpp26 0 GPIO_ACTIVE_LOW>;
+
+		vdd-supply = <&s2mpg10_ldo25m>;
+		avdd-supply = <&s2mpg10_ldo26m>;
+	};
+};
+
+&usi11 {
+	samsung,mode = <USI_MODE_SPI>;
+	status = "okay";
+};

-- 
2.56.1


