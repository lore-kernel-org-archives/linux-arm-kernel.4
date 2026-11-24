Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981BD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xp3IzRdX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FW8K7K5T;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=o/UP7hL3;
	dkim=neutral header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=JRxdd0JJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X1Fgh93jXfxGvJnocoZmU6fsG4UnK9XyHwZdxd2c24c=; b=Xp3IzRdX/gz6xkd/5zaHEXrRa6
	AglIat3HbpHdbic3eqxStrJjlUrbPJr0vu+iwEQv70/JelMo7beM4bHahlHFFLS0rwOFl/bm+qvBG
	ErASosEN6scQ8uYQNnxhFpfLWfGF7vMQ6aklhkLbv+eNSRcvOzIKebyS59D6rsdyak1x9m0ArSqFF
	xADxjnS/cjyA3gbGVR1VzXH+6e6VIa8J18HTFpA0UsO2D5htBjgreEivbsabAo1ri0Cs+e5p7t74w
	Ti7g3f2WXRCtUh8zRW4LtBe0LUFFeFAhUuK6U7CnsXwKvQqAW+q4dnGL6AmCaxbHyiCXDXVP15Nn/
	zwj+DAuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvX-00000005jQg-0VVd;
	Tue, 24 Nov 2026 07:26:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvP-00000005jLv-3iis
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 07:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=X1Fgh93jXfxGvJnocoZmU6fsG4UnK9XyHwZdxd2c24c=; b=FW8K7K5TLL1Qyjt083/29NTuKq
	OeFjc1ME0msj0D9ETx6Gfp478rAHtVB7+LDhnq7P4fxxGSJ7KwjNxBxTrxhf0AE0wAmFVWJqNr4iW
	hPx2xSR86u3eiZXZV83SiCSYrHNeR/dE2r/javaA5bQ4qD9J/whsjlO/jhhmU9NuZ/l3IXbTEO+83
	JqCZXEDUZLIWBZR/qr5TPSNKKjCkP2u2aZz2F6+8zyI00X79UxtV26owybmYhulUuur7Asdb5Ov+9
	Brr4T3WlBWa5L6/8n5T0EMg+NrAiYmR9jlg65OnzVKM3kk+tCVLSL2xw5rVHeJyRVU6CsyqPaK/gI
	+MjXqHgA==;
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.124])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvL-00000003skE-0PUK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:26:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795505171; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GjWxrkmCYDXAfLMjsPA/p8QJY52B8DjK4yc4H4mzSPwQBWFg06pX2Wwi6SKMuA4YsE
    qtRT0tnNd5FTldJFS3cKzrVsM18OGXlfC9dHSudJPCK2tEYeGhjdwCgGT2bpUIxunAU8
    p+HQmHVPBWGS03fg0H/kRugb8kkd8zuVypITIEMq/bRnADk1oBPOlHkyJ5mdNchXz5r5
    ri3/oWDaMO2VidJzFqMX7XnNKUmtGBjeJ+4yD3nddvxI1qLdmYeZN1thFZWQl+2OpdMP
    BmtWJ3lyWB82W8Tdl/5f4H4RTiaHSogcI8p2gYXkGNFCTqhyBdeh/3oZLOzT62qEV8Vf
    /rKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505171;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=X1Fgh93jXfxGvJnocoZmU6fsG4UnK9XyHwZdxd2c24c=;
    b=GM9GwC+LsPqlWwQxhhlyf+ehOMf0piJaMZkgGvIcp4KEl3jtVvg1bHHguAUR0PmnbH
    62aWw4SUiAPbkmnqpFa6c6S/gTWOV9cGz54+pXfJtmUz2NiW1+pBZLSOnLvbKCn53tFl
    3c/UJvzdz2wZ9dkUq8fQZ6lUpfr7BqerUS8paZDXF2GstHEg0/i2uRKSehqQ8qvB2lia
    dy5VAaW3MqsQeQC6PSfVB0z8gxyvk2EPXhYF1bv09GzzmQ/r4rTioy+5LALyems5/NpV
    qp713bf6dnzW1xdI6wX/X7+tyzsdDy4M0rd8JVggWDGOMB3UDONIY9nB0dWIB609alcA
    WR6g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505171;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=X1Fgh93jXfxGvJnocoZmU6fsG4UnK9XyHwZdxd2c24c=;
    b=o/UP7hL3NzaU7gQLSRdq7yGmqge1k31pF/TmN72zhLxfAMLLpKPESJdlztFvivTKMf
    Tv61dgV0gH7Jv21X00ZLF2Ocm8agjM+hQ/zKYuba5FK+bos0NCajmwsYsCnz02tEm5UC
    UDWwllOP+cwQP3Nt6LYlhj1nUKGrks1sJ/WcMSe76iIIQ5bny8q0kHVw1U5QUoUjoliv
    QjCjdoZMXKt/nccvSfhMsZRX44FC4oWw47hIVLkef89fUbpm0BOAVVmdGq/Vcht0dTEB
    T5FxgaR+Outaapaxdq4WaKz0OtiAFb+sD5dluJuSeNGbmsaORNmAXwjh2m34BFkpPU0f
    mqSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795505171;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=X1Fgh93jXfxGvJnocoZmU6fsG4UnK9XyHwZdxd2c24c=;
    b=JRxdd0JJ566NaO4dPGKkkX/ja5QYjFA7XdbUl1wdj628OqdzJFp02YvkbRfrOwZjCb
    SEfJ+0DrWswxl52YO3Ag==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3poLlciNVTQoM6kVxzKyrKzkpjcAwdDfiN49"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AO7Q91HG
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 24 Nov 2026 08:26:09 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Grond <grond66@riseup.net>
Subject: [PATCH v2 05/20] ASoC: codecs: pcm1754: Add PCM1773 support
Date: Tue, 24 Nov 2026 08:25:45 +0100
Message-ID: <7e12ac0772314b256a253314a24b9d0ad50ba5f3.1795505160.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_072643_161192_175B9E53 
X-CRM114-Status: GOOD (  24.71  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend the PCM1754 codec driver to support the related PCM1773 DAC.
Select the DAI name, supported formats and sample rate limits per
variant. Handle the different FMT pin polarity and an optional format
GPIO, avoiding GPIO writes when the format pin is not controlled by the
driver. Add an optional enable GPIO for the PCM1773 power-down input,
controlled by a DAPM supply event to enable the DAC after power-up and
disable it before power-down.

Keep the DAI operations instance-specific so that different variants
cannot overwrite each other's selectable formats.

Suggested-by: Grond <grond66@riseup.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes against V1:
    - The standalone PCM1773 driver reviewed by Mark Brown in V1 was
      abandoned. His comments concerned error handling, comment style
      and the distinction between memory and wire sample formats.
      V2 extends the existing PCM1754 driver instead.
    - Keep the per-instance DAI operations and variant-specific format
      handling described explicitly in the commit message.
    - Original PCM1773 implementation: bdcb6cad6be3 (Grond,
      2021-12-15, original commit timezone -0800). The present patch
      adapts that work to the existing upstream PCM1754 driver.
    - Suggested-by acknowledges the historical contribution without
      asserting a new DCO sign-off from Grond.
    - Code and commit-message review assisted by ChatGPT.

 sound/soc/codecs/pcm1754.c | 122 +++++++++++++++++++++++++++++--------
 1 file changed, 97 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/pcm1754.c b/sound/soc/codecs/pcm1754.c
index 3d0708b7566c7..f2e16a25d1891 100644
--- a/sound/soc/codecs/pcm1754.c
+++ b/sound/soc/codecs/pcm1754.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2025 Stefan Kerkmann <s.kerkmann@pengutronix.de>
  */
 
+#include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
@@ -13,10 +14,35 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
+struct pcm1754_variant {
+	const char *dai_name;
+	unsigned int rate_min;
+	unsigned int rate_max;
+	u64 selectable_formats;
+};
+
 struct pcm1754_priv {
 	unsigned int format;
 	struct gpio_desc *gpiod_mute;
 	struct gpio_desc *gpiod_format;
+	struct gpio_desc *gpiod_enable;
+	const struct pcm1754_variant *variant;
+};
+
+static const struct pcm1754_variant pcm1754_variant = {
+	.dai_name = "pcm1754",
+	.rate_min = 5000,
+	.rate_max = 200000,
+	.selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S |
+			      SND_SOC_POSSIBLE_DAIFMT_RIGHT_J,
+};
+
+static const struct pcm1754_variant pcm1773_variant = {
+	.dai_name = "pcm1773",
+	.rate_min = 8000,
+	.rate_max = 48000,
+	.selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S |
+			      SND_SOC_POSSIBLE_DAIFMT_LEFT_J,
 };
 
 static int pcm1754_set_dai_fmt(struct snd_soc_dai *codec_dai,
@@ -40,31 +66,29 @@ static int pcm1754_hw_params(struct snd_pcm_substream *substream,
 
 	switch (priv->format & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_RIGHT_J:
-		switch (params_width(params)) {
-		case 16:
-			format = 1;
-			break;
-		default:
+		if (priv->variant != &pcm1754_variant ||
+		    params_width(params) != 16)
 			return -EINVAL;
-		}
+		format = 1;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		if (priv->variant != &pcm1773_variant ||
+		    (params_width(params) != 16 && params_width(params) != 24))
+			return -EINVAL;
+		format = 0;
 		break;
 	case SND_SOC_DAIFMT_I2S:
-		switch (params_width(params)) {
-		case 16:
-			fallthrough;
-		case 24:
-			format = 0;
-			break;
-		default:
+		if (params_width(params) != 16 && params_width(params) != 24)
 			return -EINVAL;
-		}
+		format = priv->variant == &pcm1773_variant ? 1 : 0;
 		break;
 	default:
 		dev_err(component->dev, "Invalid DAI format\n");
 		return -EINVAL;
 	}
 
-	gpiod_set_value_cansleep(priv->gpiod_format, format);
+	if (priv->gpiod_format)
+		gpiod_set_value_cansleep(priv->gpiod_format, format);
 
 	return 0;
 }
@@ -73,23 +97,41 @@ static int pcm1754_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct pcm1754_priv *priv = snd_soc_component_get_drvdata(dai->component);
 
-	gpiod_set_value_cansleep(priv->gpiod_mute, mute);
+	if (priv->gpiod_mute)
+		gpiod_set_value_cansleep(priv->gpiod_mute, mute);
 
 	return 0;
 }
 
-static const u64 pcm1754_selectable_formats =
-	SND_SOC_POSSIBLE_DAIFMT_I2S	|
-	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
-
 static const struct snd_soc_dai_ops pcm1754_dai_ops = {
 	.set_fmt = pcm1754_set_dai_fmt,
 	.hw_params = pcm1754_hw_params,
 	.mute_stream = pcm1754_mute_stream,
-	.auto_selectable_formats = &pcm1754_selectable_formats,
-	.num_auto_selectable_formats = 1,
 };
 
+static int pcm1754_enable_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct pcm1754_priv *priv = snd_soc_component_get_drvdata(component);
+
+	if (!priv->gpiod_enable)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(1000, 2000);
+		gpiod_set_value_cansleep(priv->gpiod_enable, 1);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		gpiod_set_value_cansleep(priv->gpiod_enable, 0);
+		usleep_range(1000, 2000);
+		break;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_driver pcm1754_dai = {
 	.name = "pcm1754",
 	.playback = {
@@ -106,6 +148,9 @@ static const struct snd_soc_dai_driver pcm1754_dai = {
 
 static const struct snd_soc_dapm_widget pcm1754_dapm_widgets[] = {
 	SND_SOC_DAPM_REGULATOR_SUPPLY("VCC", 0, 0),
+	SND_SOC_DAPM_SUPPLY("Enable", SND_SOC_NOPM, 0, 0,
+			    pcm1754_enable_event,
+			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 
 	SND_SOC_DAPM_DAC("DAC1", "Channel 1 Playback", SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_DAC("DAC2", "Channel 2 Playback", SND_SOC_NOPM, 0, 0),
@@ -118,8 +163,9 @@ static const struct snd_soc_dapm_route pcm1754_dapm_routes[] = {
 	{ "DAC1", NULL, "Playback" },
 	{ "DAC2", NULL, "Playback" },
 
-	{ "DAC1", NULL, "VCC" },
-	{ "DAC2", NULL, "VCC" },
+	{ "DAC1", NULL, "Enable" },
+	{ "DAC2", NULL, "Enable" },
+	{ "Enable", NULL, "VCC" },
 
 	{ "VOUTL", NULL, "DAC1" },
 	{ "VOUTR", NULL, "DAC2" },
@@ -137,8 +183,14 @@ static int pcm1754_probe(struct platform_device *pdev)
 	struct pcm1754_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct snd_soc_dai_driver *dai_drv;
+	struct snd_soc_dai_ops *dai_ops;
+	const struct pcm1754_variant *variant;
 	int ret;
 
+	variant = device_get_match_data(dev);
+	if (!variant)
+		return -ENODEV;
+
 	dai_drv = devm_kmemdup(dev, &pcm1754_dai, sizeof(*dai_drv), GFP_KERNEL);
 	if (!dai_drv)
 		return -ENOMEM;
@@ -147,6 +199,8 @@ static int pcm1754_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->variant = variant;
+
 	priv->gpiod_mute = devm_gpiod_get_optional(dev, "mute", GPIOD_OUT_HIGH);
 	if (IS_ERR(priv->gpiod_mute))
 		return dev_err_probe(dev, PTR_ERR(priv->gpiod_mute),
@@ -157,6 +211,23 @@ static int pcm1754_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->gpiod_format),
 					 "failed to get format gpio");
 
+	priv->gpiod_enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->gpiod_enable))
+		return dev_err_probe(dev, PTR_ERR(priv->gpiod_enable),
+				     "failed to get enable gpio");
+
+	dai_ops = devm_kmemdup(dev, &pcm1754_dai_ops,
+			       sizeof(*dai_ops), GFP_KERNEL);
+	if (!dai_ops)
+		return -ENOMEM;
+
+	dai_ops->auto_selectable_formats = &variant->selectable_formats;
+	dai_ops->num_auto_selectable_formats = 1;
+	dai_drv->ops = dai_ops;
+	dai_drv->name = variant->dai_name;
+	dai_drv->playback.rate_min = variant->rate_min;
+	dai_drv->playback.rate_max = variant->rate_max;
+
 	dev_set_drvdata(dev, priv);
 
 	ret = devm_snd_soc_register_component(
@@ -169,7 +240,8 @@ static int pcm1754_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id pcm1754_of_match[] = {
-	{ .compatible = "ti,pcm1754" },
+	{ .compatible = "ti,pcm1754", .data = &pcm1754_variant },
+	{ .compatible = "ti,pcm1773", .data = &pcm1773_variant },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm1754_of_match);
-- 
2.56.0


