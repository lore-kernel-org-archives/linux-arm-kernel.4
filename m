Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DE4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z5f+f0Zk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OpfWyFnk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7U5/oPNA61To3l+OLw5KiVMFyR8yHy/dQ+YA2x5sy5M=; b=Z5f+f0ZkRlQeZT
	SF7f3DIyVBSYEGfmo/+0Iqt3xweQ5lGRMVw2UdZb3OC5MlpGvgE4MXzYvQAV4bjr07T79OHI2bPrK
	xVAfwvfbKQJNMSo96xzaTaKW+Lpqin8LYAZPdX5qQotCSEoTcN1LjwbuDR/e1bBhUOBaN3IlZ2Jy0
	8SxSRydj+7crVIad+jHtbS3XkXdc53+MmnBD4rCID+7uLHNsAjEBF/LSTxpDklxu7atUGoojChAbw
	CmFBD8HXO8KwmeLJ/Ep/YUkaanngiipGOtcRIacXQruD3Mj3LrKlEmBKAViLSjGyHWCeOP86NwXHM
	/ZtFyVMFWofN+j8YhrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZoG-00000004g9n-1yMW;
	Mon, 23 Nov 2026 19:34:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZoE-00000004g9h-3hyf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:34:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30D0E60CFA;
	Mon, 23 Nov 2026 19:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994B91F000C0;
	Mon, 23 Nov 2026 19:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795462477;
	bh=7U5/oPNA61To3l+OLw5KiVMFyR8yHy/dQ+YA2x5sy5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OpfWyFnk66JRHBn/s28v0EJ64r+VfYvnGpFjq0nNBUnoP7wXpbT+dJ/lceQFzK7rZ
	 7DjHluk9fDu02UJ4Ilu9zsrSCP0PW74hOjrLhNTDwT2ux4Nh6b6e8uNQ6TFJ5PkOrY
	 iyYOOT2TkemxO32Shk7P41JlMpGRMaP0MeiWi8zob2TwH/D8E746yXg77WwPopFBja
	 dL/QYdGCn6Rsw6xc2KSMZip5Yopq/4TgNlpWHYtkpVPA/3ZbayfdQaRsjHQ+TAknjy
	 H5S6FE4sqPZ/z0jBrayVOjyU4cGDGkbVdf/nLVT2yFSMfhz/AvcWhX7lOkjYTWBeef
	 4STfnA6gunXGg==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261116092407.514998-1-phucduc.bui@gmail.com>
References: <20261116092407.514998-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: atmel: mchp-i2s-mcc: Improve clock and IRQ
 handling
Message-Id: <179545596619.25092.12030050594894587664.b4-ty@b4>
Date: Mon, 23 Nov 2026 17:46:06 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Fjw3yoNVux7SR6d4Qoh2zf6Zz2xQTYeiFbXu/V8odWo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZpnomMRudrw36emKC9qQ1s9cXZ+ydsNoqVjB7Pvv3D
 VO6MzZN6ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEtrxlZFipIzM7+PrstcsX
 b4jVOlvU9u+7tnLX87eZ7v0TeSZZy35k+Ke2TbHk6CHOtKoTszca6/q9euqSHfnpsO9NP5/sgAi
 Nu0wA
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026 16:24:03 +0700, phucduc.bui@gmail.com wrote:
> ASoC: atmel: mchp-i2s-mcc: Improve clock and IRQ handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series simplifies clock management using devm APIs and ensures
> the peripheral clock is enabled before requesting the IRQ.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_optional() for gclk
      https://git.kernel.org/broonie/sound/c/035a0a1562ef
[2/3] ASoC: atmel: mchp-i2s-mcc: Use devm_clk_get_enabled() for pclk
      https://git.kernel.org/broonie/sound/c/0cce417afa52
[3/3] ASoC: atmel: mchp-i2s-mcc: Request IRQ after enabling pclk
      https://git.kernel.org/broonie/sound/c/3376223461b3

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


