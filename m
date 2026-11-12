Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5201E60A2619
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HQoAlzel;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R5aEfpPh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XAIZnoux/n2tbjv162cNDAMdWgGrOolZSCwfLvbKHTE=; b=HQoAlzelT/1ctS
	S2mmw9LAUZGiX+BqW+ggik3oT1WLAg4Q2tyLrStCmyn3kQtLcgyFsBqMpq4ulXnGEKTQiT/ZcLZcZ
	OHOgJAX3s6Paang9lafN+2DoHZeH6oOYSwPAa8XYKUPOaqH+lccXkpniSnpNsisS/dDEM7bbnCNx+
	Yrp7D/j8kFVOeHu41WWn6oaaIevV0Fd+s55ROKlpBThZDVARitcc2ey2oJwhHiyHkgJvmhRizjjkY
	seaMI2z3QGdLalCJHCmNlhBRzDplyAX7zPM98C1M9Z+cIcIde6FDlSqq1ox+Fpb6CIkgaD7sU/jdS
	6pAKUA9Dy7/+0LUMPRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVwU-0000000AI65-0u1U;
	Thu, 12 Nov 2026 14:38:22 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVwQ-0000000AI4N-0tct
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:38:19 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-7cc81984fceso1492145137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 06:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494297; x=1795099097; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAIZnoux/n2tbjv162cNDAMdWgGrOolZSCwfLvbKHTE=;
        b=R5aEfpPhrlRvXHvxQtSEG1qtYllzVhJEAAuvGETEtG0ZzMLxcw0sIWuWYOXGx8i2jZ
         4iycgUjC25TDfPr7lmui1qgpGD8ev94PvFyhBuv3paH04G/2LdnZ1VPjA+gj4sEX/U8T
         cQvvKtuxQp5GG9un2OpjTFcDNcue1nOXXTI73mAz7ka2zbEYAyqhVFsBc01pSlCrSdFZ
         tWR5LhbxgkTM1iN8fej1otzPviTIX7RTw/5qtYgmWP46zlQTTFVSyyCQOyK21G8cy3MK
         VQVp0JUJUm8dOM4IyQMEegAeLZFbC+PoSTIXPSB5o4H2RLTmKlGDhfmcszkZS3iGH1rU
         QKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494297; x=1795099097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAIZnoux/n2tbjv162cNDAMdWgGrOolZSCwfLvbKHTE=;
        b=aiPcO99nDesq+Bs/ZCBe5ZVcBJlNtC0+SccZ9yRHbOTKOsGqcx4qtQ3EI4g0gPPmFm
         l1N+GtqlMeU+UD/jhHUSEC41Db23GfRYCvB0YS106k0borKYzcJA7EY6JNYRoekd/iD+
         mvusQ/AdTenKPCCJejxLRllVwwg+MUNLbb9Ay3tqFd925Goub8S872mhHtpLgGQ0QAY+
         ytpC7dvNDVAmkBMCSRyLzj3DrUMs8zhWmqtIl+uqX/V92ifULY4suoXYhUC06SxaLnVN
         FBcnj9DAaRykNXbZ4ZYv3SVoS7zmyBP3GfRmB5WTa4il/TJbLfjGtkqxs3y2FbhlOYqL
         ozEg==
X-Forwarded-Encrypted: i=1; AL+hErGdPqoR98RnFMVC59Xp4PVU6PQOUubPBK3l4vvslrDvQGKEQjIdb5R0HtGtNAy5j+rVPhHWtywGI/gQWfLu2cp6@lists.infradead.org
X-Gm-Message-State: APuU4Z/dCQTajQU2NYV8iGdFIFIjXoCL/SlhQ63d9zrsPig2ZzRre/H1
	kaY8qtZL2J4QIAB+dsWZZtVj0+Zh2AkHo2r5vxn9qOuPB7/ixpASCHx6
X-Gm-Gg: AYBFou0aOcrqi+YqieaQ2vydtKAUypogfHINfKjjE62ba99GjjaEqi9EK7SDqt2+c+3
	hSDZEWbtHfSN6NCmd4QHRsQAudH19xFbKjKKIS1Wlq29jT33mRLa3qeHpXAS1/5kvRCS3vv9zF2
	0UbrNbj23sZ5VYE5WBvx+KFbTQ0hcFCJ/EniYuiqrPpF2tt08gD4re8gNFFuX4ZFJh3kkYU8xLv
	ngscrTxes3ODs0NgT2cLQ/QBP3LIE4yh0GYneRPrpKxWSc1ybm82eDVvj8tUyDJCDHmpwbN5+fz
	agusFT5vt/RBvpRaavVFgcT6H6jC4qU1FqU06HnqwhFejltCeJf2EUxigyZtlc7qonx8saCwiWm
	v5pHFyS0W2HWkJYLx1lS4Lr7ddvGiWHSBEAMjRzfSsrAz3Di8R/9oz10a4XwEDiZrXwsI7hiPXN
	VUQQQpJp+EJ+v+lp7SsB6/hXr7lMYsGpGcNB8weT4vQpBNUWBDnh4/ZaHFbtN4ejqqeO+XkPRbd
	2rKMcos6FEBxVEYI1BKbxpV7gfo0M4wSlQsEYUg1h3RAp9d+fA8RLJEoWNKz9S4rgLTdwK0VR10
	FRKviEHdDmRvVnreLwHgCOgRSvaJinCeexkWi9iv4Lg5dNlChbNIynw=
X-Received: by 2002:a05:6102:c4f:b0:7d2:75bf:2fb3 with SMTP id ada2fe7eead31-7d4edd1c21dmr1830857137.1.1794494296470;
        Thu, 12 Nov 2026 06:38:16 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:16 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Thu, 12 Nov 2026 11:37:34 -0300
Subject: [PATCH 2/3] arm64: dts: freescale: imx95-aquila: Add GPIO
 pingroups for the Lotus Carrier Board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-2-ca150bb4b0f9@toradex.com>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=3366;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=E6ByCUL0N/O7LejHb/X4auWSlo2ji9+18EP0glmb2AE=;
 b=kfiguU1plVyEnzHlHbVhmFtsvSJI1nrPiCltOAJzbi1SapThDG0yPx+EWCJJJBvaKpqrocvLg
 RtvqJCcTPwkD5IZL3ScBoHZCa8ifHFmHWe7d6TDcrTjEJPFevtjwiEb
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_063818_315502_9359B5F4 
X-CRM114-Status: GOOD (  12.93  )
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

The PWM_4_DP and I2S_1_* signal pins, except for I2S_1_BCLK, are used as
GPIOs for SFP+ low-speed signals on boards which contain an SFP+ Cage.

Add pingroups muxing those pins to their GPIO functions and update the
gpio-line-names properties with the newly added GPIO pins. Additionally
extend the modified gpio-line-names arrays to their full size.

Also add the I2S_1_BCLK pin (AQUILA_B20) to gpio-line-names, as it is
used as an Isolated Digital IO readback on the Lotus Carrier Board.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 61 ++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index dbb0b44583a55..369d5aa469ce7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -277,7 +277,29 @@ &gpio2 {
 			  "",
 			  "AQUILA_B42",
 			  "",
-			  "AQUILA_B43";
+			  "AQUILA_B43",
+			  "", /* 10 */
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "", /* 20 */
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "AQUILA_B58",
+			  "",
+			  "",
+			  "",
+			  "", /* 30 */
+			  "";
 };
 
 &gpio3 {
@@ -323,18 +345,20 @@ &gpio4 {
 			  "",
 			  "",
 			  "",
-			  "",
+			  "AQUILA_B23",
 			  "AQUILA_C22",
 			  "AQUILA_C21",
 			  "AQUILA_C20",
-			  "", /* 20 */
-			  "",
-			  "",
+			  "AQUILA_B21", /* 20 */
+			  "AQUILA_B20",
+			  "AQUILA_B22",
 			  "AQUILA_C23",
 			  "AQUILA_D23",
 			  "AQUILA_D24",
+			  "AQUILA_B24",
+			  "AQUILA_D25",
 			  "",
-			  "AQUILA_D25";
+			  "";
 };
 
 &gpio5 {
@@ -1041,10 +1065,30 @@ pinctrl_sai2: sai2grp {
 			   <IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_SAI2_TX_DATA_BIT0	0x11e>; /* Aquila B22 */
 	};
 
+	/* Aquila I2S_1_MCLK as GPIO */
+	pinctrl_i2s_1_mclk_gpio: sai2mclkgpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_RD2__GPIO4_IO_BIT26	0x31e>; /* Aquila B24 */
+	};
+
 	pinctrl_sai2_mclk: sai2mclkgrp {
 		fsl,pins = <IMX95_PAD_ENET2_RD2__NETCMIX_TOP_SAI2_MCLK	0x31e>; /* Aquila B24 */
 	};
 
+	/* Aquila I2S_1_D_IN as GPIO */
+	pinctrl_i2s_1_d_in_gpio: sai2rxdata0gpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_TD3__GPIO4_IO_BIT16	0x31e>; /* Aquila B23 */
+	};
+
+	/* Aquila I2S_1_D_OUT as GPIO */
+	pinctrl_i2s_1_d_out_gpio: sai2txdata0gpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_RX_CTL__GPIO4_IO_BIT22	0x31e>; /* Aquila B22 */
+	};
+
+	/* Aquila I2S_1_SYNC as GPIO */
+	pinctrl_i2s_1_sync_gpio: sai2txsyncgpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_TX_CTL__GPIO4_IO_BIT20	0x31e>; /* Aquila B21 */
+	};
+
 	/* Aquila SD_1_CD# as GPIO */
 	pinctrl_sd1_cd_gpio: sd1cdgpiogrp {
 		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0	0x1100>; /* Aquila A1 */
@@ -1070,6 +1114,11 @@ pinctrl_pwm3_dsi: tpm5ch0grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO06__TPM5_CH0	0x11e>; /* Aquila B46 */
 	};
 
+	/* Aquila PWM_4_DP as GPIO */
+	pinctrl_pwm4_dp_gpio: tpm5ch3gpiogrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO26__GPIO2_IO_BIT26	0x31e>; /* Aquila B58 */
+	};
+
 	/* Aquila PWM_4_DP */
 	pinctrl_pwm4_dp: tpm5ch3grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO26__TPM5_CH3	0x11e>; /* Aquila B58 */

-- 
2.43.0


