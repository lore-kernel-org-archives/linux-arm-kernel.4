Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D297606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=11saR5Wa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WWDk2Z24
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rgoIgw35YcjRzBDNQLX8AgVyjJr3fxJKdB7QZhfiyn4=; b=11saR5WaY6pSCQ
	dPu97hJRLgw20His6hoQAbczVFHTCaHP6V2yJ4t28nfoF6qUUI/loAK3U96wQ1qtYMf7hCZAYyaP6
	+59Wzf+TPWoS5uQDx8LIEfwiJX8athNP8COxOLkh30a9pb6ZGmllFP3OHt9qq80cqud0F/iisEE3B
	oi8jFhQSPc6yoOzRbsAEJ2y2c4ni7BBMQrhwuqU9JSUaWz5yWuuq2arUuMIXwhuAGpxYPwwc1SJih
	/Tz6UPqadIMShNb0nTLsPCjnb5HmG9eKC+nYdtlAAiyFHiigWBNPYoLDp9gA/Kewy0JIXgczVx5G4
	6sj5TnXLivIasAem6O1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhIS-0000000Eapq-49Eb;
	Thu, 26 Nov 2026 21:46:28 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGz-0000000Ea1f-3vDi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:45:18 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso6706193f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729496; x=1796334296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgoIgw35YcjRzBDNQLX8AgVyjJr3fxJKdB7QZhfiyn4=;
        b=WWDk2Z24cUpxrt0IxXevyVhrjVL4MpKjX8ZxqefvzvrmzBONSrPP+K26T3MFkrdByx
         XQHDRjRIkWarXud/xhQ1Q0shkWMCnnZnvCyEVJycUUzvkvSgw2+ejpVTtJrriJ2aSwjO
         boVVVz5s7zzI/LfhORMf2q19NJbFxReujgChURYnmqn1Wfz1tWkAqmhMm8U7wCKZewRt
         OGCxSXzoWDmro6MeXQI48XLEHiet4jWZb9UfbCb4CcaPxMYMDkzC6MIlx8svlkEdUGHi
         x+eSHFq06b5zS6186kq8MsEkXIUIRTHsocpsbhPY4URsOlcBNAYzkZcZGzVvTOhOf22A
         YWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729496; x=1796334296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgoIgw35YcjRzBDNQLX8AgVyjJr3fxJKdB7QZhfiyn4=;
        b=nIwqyjmAaDs0jBTIiTIU/tIUOuzK0XW6IZWpjyuqY0IG3L0iY7UzXcuKUgLViTzzld
         +YcrOlKWoFtxG+Ok7bexqV4F6JKM8Hd/J+4c3eq8afbX4+k4Or4RM4u3INJsKlKdbs5o
         X5j1q/GaEsOIBJo3dxTIYFh+ohoJekLwDOo/Q2MPAoY90ci2enrIdgZ/322WDMZypC3Z
         IP4lr8b+6tcFJAGQWAuG7KqGwZT43faQP09AUxAh94ye1YnZjkFw0KBBVTjf47Xx3PFh
         q1yD92W04D0BvRQIDNmaOfpJFOWpbEX41S43t+8G9H3PUxnwda5lM825izq6/A8aGA+o
         jC8w==
X-Forwarded-Encrypted: i=1; AL+hErHbQf+feXh/sgEf/RIjF9tf74KRuI7Jh+je88tjE6EsZjKwa2f+LXCVPM084JHxT+BSeCCDgP3bTnSMZA94Vafq@lists.infradead.org
X-Gm-Message-State: APuU4Z9R2dyysDEavqKUimnE2DsKSX+Zo77o/piT/8qSEa4MkdOtozmB
	XwY0j1ZdJpKWAYfvjUGL8SZeKtL253PvJRsy2QPNrbTyDgUdD9onfOZu
X-Gm-Gg: AZFdTZd1TTJORrnQeyADo34mav4cIFPFF8QPLuzgOby3HFFp00v6Cqec0gQ5DW3B6XH
	U5usPCScFaTO1BOEoyGTQIK0NXm1+zjpGm+CA/Hp81YDORz7Sb8SLhaFS+WdwzA6bkVboMwHYuB
	j1hLEWwULDfwuF/58FX/GyYur6wvkfbhqufgzq8/lvYtQqRsgqcg+EofeQkWM2G3tGmUZQK/16w
	h2ALUri2wHEvwv37ASRJ9hwrgzB28NVaRDau8i+LPIR/8M2jtr1CLTxq4DDM6x+VZmjL6AaKrwr
	L01QDNNzeeLj1w7C4cEG+ul0hk+SJpZt+ZelETEX3zilfEXB56eLazoMwxlrMzuyTnPCywXddb1
	m/YX5AOm+JELkm2HuatTyctqN415DoCsYzaSBdHcGqJOQKtjnhzuJlV6PYelGvKBkqFfZU83KVX
	koQxV1BAj/n+wGuNpTAmRv04m1TqR1sRHd0rkS7OSlP0Ar4LM+9Qf1WNvn0TvZHn7S1NHsonkyO
	POW+P0Tb2aG5FhU+06kWlpOCg3qoKNurdfBcJbUn/bSkyxJfxM9n2Iu6/8tvB5W3JG4X5B11job
	0mePDaYTymXdPwvzsIIgCQgHtbeEJJ+9qeggknEaKthqFHHmuwFKcuyTJCdWo3KlOreRGYkTtGj
	qG3wKJI6ba2BRVuGU74ibrbcrQ7uVt8cNRvD9v3OrXK+nM1mt/QJ290YMzKxFqWbUYcvdJWnN9S
	dBLtj7rYNp6NQUi2brdDeCeiXiPT99sQlB7yXYv0+i0N8JA4JGcs105gGBbkxU9dSc6ULNVU/N0
	eDXh8BH5OmNa+ZO7PULhpe7ZefqVH8cVfC6cC1wWQ==
X-Received: by 2002:a5d:5846:0:b0:4a6:4ac6:d950 with SMTP id ffacd0b85a97d-4abb400ae95mr45098156f8f.39.1795729495913;
        Thu, 26 Nov 2026 13:44:55 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:54 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] arm64: dts: allwinner: h616: Enable HDMI on several boards
Date: Thu, 26 Nov 2026 22:44:33 +0100
Message-ID: <20261126214433.3562326-12-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_134458_029017_781E4AF0 
X-CRM114-Status: GOOD (  12.76  )
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

Now that H616 display pipeline is added, enable HDMI on several boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   | 30 +++++++++++++++++++
 .../allwinner/sun50i-h616-orangepi-zero.dtsi  | 25 ++++++++++++++++
 .../allwinner/sun50i-h616-orangepi-zero2.dts  |  5 ++++
 .../dts/allwinner/sun50i-h616-x96-mate.dts    | 30 +++++++++++++++++++
 .../allwinner/sun50i-h618-orangepi-zero3.dts  |  5 ++++
 .../sun50i-h618-transpeed-8k618-t.dts         | 30 +++++++++++++++++++
 .../sun50i-h618-yuzukihd-chameleon.dts        | 30 +++++++++++++++++++
 7 files changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
index 7906b79c0389..c5226a427eaa 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
@@ -26,6 +26,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -75,6 +86,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -84,6 +99,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 };
@@ -178,6 +204,10 @@ reg_dcdc3: dcdc3 {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index 0d3e761f6466..51c8ebdbdc88 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -22,6 +22,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -64,6 +75,10 @@ &codec {
 	status = "okay";
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
@@ -81,6 +96,12 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -113,6 +134,10 @@ flash@0 {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 90c25e12e189..0f25b043e020 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -28,6 +28,11 @@ &gpu {
 	mali-supply = <&reg_dcdcc>;
 };
 
+&hdmi {
+	hvcc-supply = <&reg_bldo1>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dcdce>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
index 085f3e4e8eaa..568de6f57015 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
@@ -23,6 +23,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the DC input */
 		compatible = "regulator-fixed";
@@ -42,6 +53,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdca>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -55,6 +70,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_bldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 };
@@ -202,6 +228,10 @@ sw {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
index c51d4d9120de..4a1754eeb0b6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
@@ -31,6 +31,11 @@ &gpu {
 	mali-supply = <&reg_dcdc1>;
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
 &mmc0 {
 	/*
 	 * The schematic shows the card detect pin wired up to PF6, via an
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
index efe0faa252f5..2f09a5cabed5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
@@ -24,6 +24,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the DC input */
 		compatible = "regulator-fixed";
@@ -61,6 +72,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -74,6 +89,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 };
@@ -177,6 +203,10 @@ &pio {
 	vcc-pi-supply = <&reg_dldo1>;
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
index 9e275f0217ec..11b087dad0c1 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
@@ -24,6 +24,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the USB-C socket */
 		compatible = "regulator-fixed";
@@ -52,6 +63,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -73,6 +88,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
@@ -187,6 +213,10 @@ reg_dcdc3: dcdc3 {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
-- 
2.43.0


