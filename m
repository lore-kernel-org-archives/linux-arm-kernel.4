Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEA360A2618
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w+kBATds;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ca8aUqrU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZqVycc2LvlUaprw2Ls07bj56pe8u/NNOBMCtJ/AFS44=; b=w+kBATdsTg74vfZD/L79t5MVi+
	QR3+6Yf7QwFea8kgnnX+mI9dUm8V+ouYKbefAL1rKDiT1V0ESRNEK7Z9fPrpdSzmHPZX4rclOnRQ/
	Uj4s6p/2B1OHDDUNr8QLZ/YCJbLVNOoK2cockWZ2GDGikSo1szCxRleDVP1whyKUTlX+v9gpR6bf0
	HNDFF8jvqQEwUuY796pOa243TVtWaA8OWgH7QsAMTfvIYd9aLzISqF2aHHNAHSn21Gb4bqKevxnLu
	kBaDYA1GJ86ezf0S7UDzLGfd1xNpf/8FnH3pVUoaw6qLJHuSir4d3e9c2uFulgEyBIIjuY7p2Wjsn
	YmHKZhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbbN-000000029it-1Q8U;
	Tue, 10 Nov 2026 02:28:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbbJ-000000029eb-1G5p;
	Tue, 10 Nov 2026 02:28:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A51D6347E;
	Tue, 10 Nov 2026 02:28:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794277724;
	b=bXWcyMCTBHjM6tq98bB3cX+0PV/s/ktoqadaBmNYmiUT91oSIBrl3of7GO3u1kUwmOYp
	 Rvgmu+NkGAEm8gpPSjzwkQ+6lOIvmxFdsw83n5ZYcwAutkvVTIxXTT+9wamG5OOpA3WJO
	 HuOBUHkk70XqqxKJmPB+DWZVffoNVlFSqMCMr1U1wUp4Oh6NSvILBQCjEAdpKRPqmvEqS
	 3yX9RV2+Y5YEinUcL7mEMqo87Gmlv0/G/8CxMN2PX/rAvKgVVa7RzdiicDKYlDIHV1l6j
	 iDghRkohNKM+De9/jF8P4Kga3hPcJRXbZ2j3kJlUaaK8zD9MO18Kga0fKmkJX9oOE9A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794277724;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZqVycc2LvlUaprw2Ls07bj56pe8u/NNOBMCtJ/AFS44=;
	b=0Oe7KLLkc8j3Cpl0MAiMkySJoX3gXqz5jtnIoIOvVwxlAmPYVoQ/n7A/loT37wKj3kJG
	 LmtwSWKEKKAHHwU9/BmL3J8qxnOPPtSgZzc0bY3QTFv6gYb5Fp1hMtlosYFtvh0FqJfRg
	 Sli7TpMqmNWN1AFKTXKjeYKYX2QxC5iuhMWM2Vkhia4vpOKAWj7Vs03APNLLyfdODzp1R
	 2au7D3axkCELEfNQP6VHndtAJmStuMIy+gDqetmo4PzgI11aGh4lZhkttTQC9sdWAKDgm
	 XqYds2v6arFymwP7yYL/j3jDr3sfARU8TVyicw8TaOHFtzMzwl2qcAXXmCLT/51FYCw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56DB71F008A3;
	Tue, 10 Nov 2026 02:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794277724;
	bh=ZqVycc2LvlUaprw2Ls07bj56pe8u/NNOBMCtJ/AFS44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ca8aUqrU7qbc2RmXSNRVGPQirtHZDPTz77wfZwFL+g6/P/YzVjh0gkPWOIFLjZ0yV
	 cOmOxhApxFs26V4p2EPyeeaP8/m2WZAuVFt4XCxm1cR/HnYXlV/C2179H2NE0zeZhh
	 KwJkkxAk4xxCnQkZBwHAGmTz8U9C+a+RTOmfScjEGoJdtZwlFgQMAMORzJObVWgD7+
	 UZsvoW2/ZoeLUI6/nmANCKyq/Fir9ZO30/bPR+nfL/1pURnjj/e8OqvDFzs/RzmRkc
	 uMvxB+LPCM+lT6lkpOfXetc9ZhF8sJ1R3tbo1oocoNRdfXR9Jh5lz2Y2wLkaCStQUV
	 rCbsBxP3zKc8w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D346448774;
	Tue, 10 Nov 2026 02:28:41 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Tue, 10 Nov 2026 10:28:26 +0800
Subject: [PATCH v8 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-audio_drvier-v8-3-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
In-Reply-To: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794277720; l=5023;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=11hDEGmkESVqDEUzJaCmdn1TV8Fy1sH/bmdnlw0tZp8=;
 b=/85pETYf9mjWldkS6Pl3OyIKF8kIqluerJqqRr7GHDchBi95Ur0pFn0hbSzb4+gVsdf4Okp//
 TrFmzdeSRW5D//zaOW3a70cAPAWI1G0a36ZKlIW4HuD4aQtAiA2ULVR
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jiebing Chen <jiebing.chen@amlogic.com>

The S4 requires additional clock control bits to be turn on while enabled.
The S4 has 8 TDM lanes, instead of 4 on previous SoC.
Update the widget accordingly.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 sound/soc/meson/g12a-toacodec.c | 64 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index a95375b53f0a..01be0cbc79a9 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -40,6 +40,10 @@
 #define  CTRL0_BCLK_SEL_MSB		5
 #define  CTRL0_BCLK_SEL_LSB		4
 #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
+#define  CTRL0_BCLK_ENABLE_SHIFT_S4	30
+#define  CTRL0_MCLK_ENABLE_SHIFT_S4	29
+#define  CTRL0_DAT_SEL_S4_MSB		20
+#define  CTRL0_DAT_SEL_S4_LSB		19
 
 #define TOACODEC_OUT_CHMAX		2
 
@@ -123,6 +127,19 @@ static const struct snd_kcontrol_new sm1_toacodec_mux =
 			  snd_soc_dapm_get_enum_double,
 			  g12a_toacodec_mux_put_enum);
 
+/*
+ * The S4 lane selector is one bit wider than the SM1 one, which pushes the
+ * data selector up by one bit as well.
+ */
+static SOC_ENUM_SINGLE_DECL(s4_toacodec_mux_enum, TOACODEC_CTRL0,
+			    CTRL0_DAT_SEL_S4_LSB,
+			    g12a_toacodec_mux_texts);
+
+static const struct snd_kcontrol_new s4_toacodec_mux =
+	SOC_DAPM_ENUM_EXT("Source", s4_toacodec_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  g12a_toacodec_mux_put_enum);
+
 static const struct snd_kcontrol_new g12a_toacodec_out_enable =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
 				    CTRL0_ENABLE_SHIFT, 1, 0);
@@ -141,6 +158,17 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
 			    &g12a_toacodec_out_enable),
 };
 
+static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
+	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
+			 &s4_toacodec_mux),
+	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
+			    &g12a_toacodec_out_enable),
+	SND_SOC_DAPM_SUPPLY("I2S BCLK EN", TOACODEC_CTRL0,
+			    CTRL0_BCLK_ENABLE_SHIFT_S4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S MCLK EN", TOACODEC_CTRL0,
+			    CTRL0_MCLK_ENABLE_SHIFT_S4, 0, NULL, 0),
+};
+
 static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
 					 struct snd_pcm_hw_params *params,
 					 struct snd_soc_dai *dai)
@@ -226,6 +254,16 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
 	{ "OUT Capture", NULL, "OUT EN" },
 };
 
+static const struct snd_soc_dapm_route s4_toacodec_routes[] = {
+	{ "SRC", "I2S A", "IN A Playback" },
+	{ "SRC", "I2S B", "IN B Playback" },
+	{ "SRC", "I2S C", "IN C Playback" },
+	{ "OUT EN", "Switch", "SRC" },
+	{ "OUT Capture", NULL, "OUT EN" },
+	{ "OUT EN", NULL, "I2S BCLK EN" },
+	{ "OUT EN", NULL, "I2S MCLK EN" },
+};
+
 static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
 	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
 };
@@ -234,6 +272,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
 	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
 };
 
+static const struct snd_kcontrol_new s4_toacodec_controls[] = {
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 7, 0),
+};
+
 static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.probe			= g12a_toacodec_component_probe,
 	.controls		= g12a_toacodec_controls,
@@ -256,6 +298,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
 	.endianness		= 1,
 };
 
+static const struct snd_soc_component_driver s4_toacodec_component_drv = {
+	.probe			= sm1_toacodec_component_probe,
+	.controls		= s4_toacodec_controls,
+	.num_controls		= ARRAY_SIZE(s4_toacodec_controls),
+	.dapm_widgets		= s4_toacodec_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(s4_toacodec_widgets),
+	.dapm_routes		= s4_toacodec_routes,
+	.num_dapm_routes	= ARRAY_SIZE(s4_toacodec_routes),
+	.endianness		= 1,
+};
+
 static const struct regmap_config g12a_toacodec_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -276,6 +329,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
 	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
 };
 
+static const struct g12a_toacodec_match_data s4_toacodec_match_data = {
+	.component_drv	= &s4_toacodec_component_drv,
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 19, 20),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
+};
+
 static const struct of_device_id g12a_toacodec_of_match[] = {
 	{
 		.compatible = "amlogic,g12a-toacodec",
@@ -285,6 +345,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
 		.compatible = "amlogic,sm1-toacodec",
 		.data = &sm1_toacodec_match_data,
 	},
+	{
+		.compatible = "amlogic,s4-toacodec",
+		.data = &s4_toacodec_match_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);

-- 
2.52.0



