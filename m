Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E82E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 11:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F5AYGwZK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WMz0X66j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DSWbuaX0SJuwDI4LQsCoGiLcfjjnNXDBy8qwE7KddlA=; b=F5AYGwZKfi9Hrr
	Yf4REE7NPR1SFradFRgNX2HJD9Kn1WMTC0MFWYZgaxI8eaZ+AOFkU7LvNqIA22qKynYqBKWJHEtgt
	h6VvBcp6gaEG23sM9Anf5ft0lLDdscv6x4xKFSnQrurX+GIJ9wpmCutAT9W7qsvlRqYQebG2GpPNG
	WeP+ndwooaXSXWHkXHfMN4D3CozYg++txS1Hpc7tgMSIMzdbq1qNGR8hsyayM4rbZsLVKvxe1yQiH
	mUCWP7gXg4HT4uDg5ZSgLcjk2nFpdije5bPffOlhusxMOPXXF9q70GdUkIyJby0zcCEBvjk4iK5ON
	kkSOCFGYNrWgqPK36Xhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1OZ-0000000G66I-45HC;
	Sun, 08 Nov 2026 11:49:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1OZ-0000000G65v-0HqZ;
	Sun, 08 Nov 2026 11:49:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 94F8641772;
	Sun,  8 Nov 2026 11:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A8E1F0089F;
	Sun,  8 Nov 2026 11:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794138550;
	bh=DSWbuaX0SJuwDI4LQsCoGiLcfjjnNXDBy8qwE7KddlA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WMz0X66jbpOohzsjuh9vxcswu8HYEcikxFzY4dXmi1VM8IX8FrDwIjI7tvd/d85/G
	 t5WPkKOgnDBMk7EesnJ1q3pISxPevscLytTJMTBfNyo7fS4+T/6glOsSRggAkZsOmo
	 TaTl84edzchzGKPlrys2DoZ7Byu6/PMotPFE+oypk2gRy2M56iQvjagHW+1+Cpgf3e
	 ZvipXoZyLGKpc+/FN7GgQmLBI4kJf0qsKxDaMe+eB+1V2wH+eRmIKK6FZoiRnwt0gG
	 tYofxFgjId/uxbnTcW87RYa/uBvsLyFupyIpqJcbm6hJvqYjXW82LbH+xQtzD8tslb
	 OaRa+9Qh9rUmw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id F0C312BF95D0;
	Sun, 08 Nov 2026 11:49:07 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/3] ASoC: codecs: rk3308: restore audio and
 headphone support
From: Mark Brown <broonie@kernel.org>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: broonie@kernel.org, heiko@sntech.de, linux-sound@vger.kernel.org, 
 luca.ceresoli@bootlin.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-kernel@vger.kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 huangtao@rock-chips.com, sugar.zhang@rock-chips.com, lxt@rock-chips.com, 
 xing.zheng@rock-chips.com
In-Reply-To: <20261101044149.2018744-3-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-3-zhengxing@rock-chips.com>
Date: Sun, 08 Nov 2026 11:49:06 +0000
Message-Id: <179413854645.3630016.583220481348524508.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5345; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+YDT/dn4HPJjiVmxqxZl4zbdPOrhe2/fO2TYbbPmE6s=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+JG7OuXHtxJ6vy/a0HpcWWPnpTOEN098lq8UKmb80d
 STefN49oaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATOS7DyHCjw7O+intRWv3l
 fQ+NQ2NKN+StFNvT+JRh26O0M1duFbsyMtz657SIkyEzQ8NnpTbP3NXcfXn7Fte92lr2Pc/Lunf
 XY34A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Restore the vendor analog enable and disable order and settling delays
> through shared DAPM supply events for codec revisions A, B and C. Use
> virtual intermediate widgets to prevent coalesced or repeated analog
> writes without adding startup, shutdown or hw_free DAI operations.

This change is far too big and complex to be a single patch, doing a
whole bunch of different things with limited overlap.  It's all really
difficult to follow, please split it up into independent changes.  The
jack detection should be split out at a minimum, and probably there
should be multiple refactorings.

> +static int rk3308_codec_output_routes(struct rk3308_codec_priv *rk3308)
> +{
> +	static const struct snd_soc_dapm_route routes[][2] = {
> +		{
> +			{ "L_LINEOUT_EN", NULL, "DAC_L_HPMIX_SEL" },
> +			{ "R_LINEOUT_EN", NULL, "DAC_R_HPMIX_SEL" },
> +		}, {
> +			{ "L_HPOUT_EN", NULL, "DAC_L_HPMIX_SEL" },
> +			{ "R_HPOUT_EN", NULL, "DAC_R_HPMIX_SEL" },
> +		},
> +	};
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rk3308->component);
> +	u32 mask = rk3308->dac_output == 11 ? 3 :
> +		rk3308->dac_output == 0 ? 1 : 2;

Magic numbers...  I have no idea what this is intended to mean.

> +	int i, ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(routes); i++) {
> +		if (!((mask ^ rk3308->output_routes_mask) & BIT(i)))
> +			continue;
> +		if (mask & BIT(i))
> +			ret = snd_soc_dapm_add_routes(dapm, routes[i], ARRAY_SIZE(routes[i]));
> +		else
> +			ret = snd_soc_dapm_del_routes(dapm, routes[i], ARRAY_SIZE(routes[i]));
> +		if (ret)
> +			return ret;
> +		rk3308->output_routes_mask ^= BIT(i);
> +	}

This is dynamically hotpluggin DAPM routes at runtime which is a really
weird way of doing things.  Why are you doing things this way?  Normally
routing changes would done through DAPM routing changes in mux and mixer
widgets.  Why are you doing things this way?  It's a lot of code, and
the userspace impacts are likely to cause confusion.

> +	if (!ret && rk3308->hpdet_jack)
> +		snd_soc_jack_report(rk3308->hpdet_jack,
> +				    output ? SND_JACK_HEADPHONE : 0, SND_JACK_HEADPHONE);

This is going to report that the user has inserted or removed something
physically based on a control write, this is obviously not something
that should happen.  The user can physically see if something has been
plugged and this is going to report something different...

> +static int rk3308_codec_hpdet_init(struct platform_device *pdev,
> +				   struct rk3308_codec_priv *rk3308)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	if (rk3308->codec_ver == ACODEC_VERSION_A ||
> +	    of_property_read_bool(np, "rockchip,no-hp-det") ||

Why do we need this property, the machine driver sets up the jack?

> +	    !of_find_property(np, "rockchip,detect-grf", NULL))

of_property_present()

> +		if (headphone)
> +			for (gain = 0; gain <= max(gain_l, gain_r); gain++) {
> +				regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON05,
> +						   RK3308_DAC_x_HPOUT_GAIN_MSK,
> +					min_t(unsigned int, gain, gain_l));
> +				regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON06,
> +						   RK3308_DAC_x_HPOUT_GAIN_MSK,
> +					min_t(unsigned int, gain, gain_r));
> +			}
> +		rk3308_codec_resync_adcs(rk3308);
> +	} else {
> +		/* Vendor DAC disable steps 3-19, after the external amps are off. */
> +		if (hp & (RK3308_DAC_L_HPOUT_EN | RK3308_DAC_R_HPOUT_EN))
> +			for (gain = max(gain_l, gain_r); gain >= 0; gain--) {
> +				regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON05,
> +						   RK3308_DAC_x_HPOUT_GAIN_MSK,
> +					min_t(unsigned int, gain, gain_l));
> +				regmap_update_bits(rk3308->regmap, RK3308_DAC_ANA_CON06,
> +						   RK3308_DAC_x_HPOUT_GAIN_MSK,
> +					min_t(unsigned int, gain, gain_r));
> +				usleep_range(200, 300);
> +			}

The ramp down has a delay but the ramp up doesn't, is that intentional?

> -	SND_SOC_DAPM_ADC("ADC1_WORK", "Capture", RK3308_ADC_ANA_CON05(0), 2, 0),
> -	SND_SOC_DAPM_ADC("ADC2_WORK", "Capture", RK3308_ADC_ANA_CON05(0), 6, 0),
> -	SND_SOC_DAPM_ADC("ADC3_WORK", "Capture", RK3308_ADC_ANA_CON05(1), 2, 0),
> -	SND_SOC_DAPM_ADC("ADC4_WORK", "Capture", RK3308_ADC_ANA_CON05(1), 6, 0),
> -	SND_SOC_DAPM_ADC("ADC5_WORK", "Capture", RK3308_ADC_ANA_CON05(2), 2, 0),
> -	SND_SOC_DAPM_ADC("ADC6_WORK", "Capture", RK3308_ADC_ANA_CON05(2), 6, 0),
> -	SND_SOC_DAPM_ADC("ADC7_WORK", "Capture", RK3308_ADC_ANA_CON05(3), 2, 0),
> -	SND_SOC_DAPM_ADC("ADC8_WORK", "Capture", RK3308_ADC_ANA_CON05(3), 6, 0),
> +	SND_SOC_DAPM_ADC("ADC1_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(0), 2, 0),
> +	SND_SOC_DAPM_ADC("ADC2_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(0), 6, 0),
> +	SND_SOC_DAPM_ADC("ADC3_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(1), 2, 0),
> +	SND_SOC_DAPM_ADC("ADC4_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(1), 6, 0),
> +	SND_SOC_DAPM_ADC("ADC5_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(2), 2, 0),
> +	SND_SOC_DAPM_ADC("ADC6_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(2), 6, 0),
> +	SND_SOC_DAPM_ADC("ADC7_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(3), 2, 0),
> +	SND_SOC_DAPM_ADC("ADC8_WORK", "HiFi Capture", RK3308_ADC_ANA_CON05(3), 6, 0),

Why the rename?

-- 
Mark Brown <broonie@kernel.org>

