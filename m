Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B76606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2p78vbZL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWg9WAKJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YdF13372jy/m199oRlOe/vzqPP9Dt54Ay4k6PphMxZM=; b=2p78vbZLHBjc6r
	6urR88Ho61ljxsS9R2s4v5TVOAmYOPZ8DvLvfcrSn6km9qvAKtI5SToWGrmvrR+7ej8Z3gaEZgb2F
	gLYkBt6gqIQ508PJDQyjizvvirCDq2H7EY9ypqcRhdNcDyvPFRXyTcHdRTltwpeSBfoYu0c/SVc29
	uw5uMD5yoJipJOVmiaMtj9COL8b/0pa1TMBaWzs19MInbdWsDQsOuEIV7Ol6d+0m/I6sE8yU4wBAq
	X9oJMnkw+kCc7Tfh9LuXADkbpi4/nbXJVPA5dnmnoQ/pwYUGRxUdVW2o8cxGdNuubUuCF6yu8gQCY
	QD7JwHUjVlKXZApKdgEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeJS-00000008m35-3Dii;
	Wed, 18 Nov 2026 11:58:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeJR-00000008m2n-3Izf;
	Wed, 18 Nov 2026 11:58:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4848440BB6;
	Wed, 18 Nov 2026 11:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E3C1F000C6;
	Wed, 18 Nov 2026 11:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795003133;
	bh=YdF13372jy/m199oRlOe/vzqPP9Dt54Ay4k6PphMxZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fWg9WAKJ0LPxwvRXKGcS2CpfyEXetZ1zj+yi+EPSH6YMcOYVMEJz2IOGISnrm8iOP
	 bVRzbOmwZn2+jRKa9N1Vhj6a1Ghgs0uRCAmLxnU2SLGTQGYaOlXHtXcKnJ/it6VgC/
	 f6cM25DIsuuik44OFgegzpm8lTcCIJf54qahEeTrRf0uXg1FE/NstSE7U3TZDAM6CW
	 qzoBbA1mVbOKOnbPyxpTSBD6Uk/4jUEQcGidmfMLYiEG4FMWKibxjlnDkMs9T95DNd
	 FiaAd8oBv92xPTitJGGdUC9En17PGbmjS3chYMH/R10uQtYNu60gw6HGbyA920T5wL
	 EUcrOTRF4YRKQ==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>
Cc: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110-asoc-rockchip-i2s-tdm-v1-0-f32951b3c527@gmail.com>
References: <20261110-asoc-rockchip-i2s-tdm-v1-0-f32951b3c527@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: rockchip: i2s-tdm: register the PCM before
 the DAI
Message-Id: <179495878868.2707353.10848747945533783819.b4-ty@b4>
Date: Tue, 17 Nov 2026 23:39:48 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1946; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W59zQSeaIH+lyhkCe/swjpF15sOyCWor0aGiYZn+l/w=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+TvqZoc+pm2Kb2+rVVXyH65hYwaQjqa8rFggvZlQ87
 PdgukZeRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACaStIWR4VuV6Z5Xbd2Ouszi
 vlb3azbvbLtyOmDawsWblf5e9HuzbjEjwzLn2YHrHUqOtLK/aYlOvflfcdLuLbH5zDs8ras3++9
 P5gUA
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 07:16:57 +0000, Arun Iyengar wrote:
> ASoC: rockchip: i2s-tdm: register the PCM before the DAI
> 
> The Rockchip I2S-TDM driver registers its DAI component before the
> dmaengine PCM component. A sound card that was registered earlier and
> waits for the CPU DAI is bound by snd_soc_component_register() as soon
> as the DAI component appears, which also satisfies the DAI link's
> platform (it defaults to the CPU of_node), so the card binds without the
> PCM component. Every open of the PCM then fails with -EINVAL from
> snd_pcm_hw_constraints_complete(), silently. On RK3588 this happens to
> the HDMI sound card whenever the HDMI codec probes before the I2S
> controller. Patch 1 registers the PCM first, as rockchip_spdif already
> does.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: rockchip: i2s-tdm: Register the PCM before the DAI
      https://git.kernel.org/broonie/sound/c/3743fe2e36d2
[2/2] ASoC: rockchip: i2s-tdm: add the reset value of XFER to the regmap defaults
      https://git.kernel.org/broonie/sound/c/49562d274477

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


