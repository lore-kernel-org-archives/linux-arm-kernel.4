Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40783606D804
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FvG9pCxG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WfFErCpX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y/U4/Y+c7YCJH2gj37MU9+SaDQx2kcmCGuUGv7p5siI=; b=FvG9pCxGTSf/Rk
	+2QOS5K9XUSKhzO6FkdgGQ6D0kJhiTLYfuDTr6PFila5m3pS01ImiO+TK1rWXxBz7pvkT0BUSgQ9A
	5kqTjyi1faODT/UoK0HgzUho6qlmTX2M0kHpklhoN5rPyS2GKe0kmEGggzsRYO6XLB5O18uNPmJop
	6uXfyW08ZWmXVost+Xh8wddVVoYqGo8f96NYhenCTyFm5yVidQjoIOlQFGnPlT5jJHQWlQ72SwL7k
	vmbBh/M6m6q9M/Q3gE+IosaYkR8THYYZ1jL/SJtdMmBmzGZWHdGyh01QqXcjSPq4m79MZ9/uYTLrF
	+8qPxjw46laFHsjMnACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhgb-0000000EqYt-3Krp;
	Sat, 07 Nov 2026 14:46:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhga-0000000EqYc-335L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 14:46:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56AD760252;
	Sat,  7 Nov 2026 14:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4851F008A1;
	Sat,  7 Nov 2026 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794062787;
	bh=Y/U4/Y+c7YCJH2gj37MU9+SaDQx2kcmCGuUGv7p5siI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WfFErCpX1VeGCOCpYaYsSl0Cr5jlTysRBNrmJvQLMvInGZeEq9NfWCUbnGqRAQJNI
	 +jUHamn7SAOO5GBFtEIjLGZnN1ZZqmCNZKMEgTv3yXDtFbRAAn4OBksp598rw6lnQw
	 a9UXMTWfRdjj7/MLv65ljDg6jvH0OythlBq1ToNmFT6MQlEW4p+/U5RfrTyTeUQr+2
	 eTltb1CL1wsWjcYT1dPBqhG6SQ4qJRnCP7AZRTqde7Q2W3yOcHVUOAXKRfEiUR0PHQ
	 Y6kLBqcDX4ozHCUfEV2npck49pSiPIhpTXKjBpyAcEXVkVI5Jjk5nnYStnc0+ORlhT
	 xyqFYnX1Qurww==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9E02E2A4C628;
	Sat, 07 Nov 2026 14:46:24 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/4] ASoC: cdns: Add Cadence I2S-SC controller
 driver
From: Mark Brown <broonie@kernel.org>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
 p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106105208.1246554-3-joakim.zhang@cixtech.com>
References: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
 <20261106105208.1246554-3-joakim.zhang@cixtech.com>
Date: Sat, 07 Nov 2026 14:46:13 +0000
Message-Id: <179406277372.3424803.17958802824910186591.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=broonie@kernel.org;
 h=from:subject:message-id; bh=v4HdLYm98sCKNpNKmPbLCJ65MizgcuLnPoOUw1rjLew=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeWx7YyDDRdY2E6mKrrLtcFw2ynjdnK27f2h7QdLBGW
 Pbfud/WHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhIYTgjw139u1V1O0VLn9Td
 e6sz/3mC/B73YD5+OdNr1xpWenPtCGX47+Ej1dof41KR/Du4nfHNQgWGJV/ffLFtNTld8myDcu4
 uVgA=
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

> Add support for the Cadence I2S-SC controller found in the CIX SKY1
> audio subsystem.

> +static int cdns_i2s_sc_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *cpu_dai)
> +{

> +	} else {
> +		/*
> +		 * I2S mode: mono maps onto the left audio channel, while
> +		 * the frame still carries two slots.
> +		 */
> +		if (slots == 1) {
> +			i2s_sc_priv->is_mono_in_i2s_mode = true;
> +			slots = 2;
> +		} else if (slots == 2) {
> +			i2s_sc_priv->is_mono_in_i2s_mode = false;
> +		} else {
> +			dev_warn(i2s_sc_priv->dev,
> +				 "I2S mode supports up to two channels\n");
> +			return -EOPNOTSUPP;

You should really set constraints in startup() which limits to two
channels if the DAI is configured in I2S mode, that way userspace won't
get upset when it tries to do 4 channels..

> +static struct snd_soc_dai_driver cdns_i2s_sc_dai = {
> +	.name = "i2s-sc-aif",
> +	.playback = {
> +		.stream_name = "I2S-SC-Playback",
> +		.channels_min = 1,
> +		.channels_max = 16,
> +		.rates = SNDRV_PCM_RATE_8000_192000,
> +		.formats = (SNDRV_PCM_FMTBIT_S16_LE |
> +			    SNDRV_PCM_FMTBIT_S24_LE |
> +			    SNDRV_PCM_FMTBIT_S32_LE),
> +	},
> +	.capture = {

The DT binding allows either TX or RX DMA to be omitted, the driver
should only register the directions it's got DMA for.

-- 
Mark Brown <broonie@kernel.org>

