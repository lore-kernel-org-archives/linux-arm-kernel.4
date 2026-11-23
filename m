Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAC9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H/3q1s00;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f9WnWcZb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8IQP6+LjELPqxZ68IqsA0UX7HOkypEPSY/Xrk/5T/nw=; b=H/3q1s004kxSPZ
	KqxfntT9qh4yVQRfSJqYVMGThVuKKt6LKyvXyoTTQ3QRIckcO5nSs7J+ETu49wL+lVFAhX72osp+i
	UvCf6ZEywwCnBOvoShyUP4vHxqhQG/uGMEa0bn3w3ETiiQTb+NJ9i6bHmsFm1l3fyFiV1LfNxkVl7
	Mh4Mhk0AmSc6CI6JTvwAbjihmbUEwUM9m/SYa47C3ZZYntHXziInr6w6njJkgKmCfIpf5D7tJpw3P
	njDYUhsmrx8fbOuZrqICETsu/QzgL8pESi5V1Avl9YpZ9SyKcAWXJCnkWi4RJIBuaMqMjqYonmNik
	WEQjRRjwYxPVSobKlHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpPX-00000006UOX-1jdc;
	Tue, 24 Nov 2026 12:14:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpPV-00000006UNn-0uXy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:14:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1289161CD7;
	Tue, 24 Nov 2026 12:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FDF1F000C0;
	Tue, 24 Nov 2026 12:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522447;
	bh=8IQP6+LjELPqxZ68IqsA0UX7HOkypEPSY/Xrk/5T/nw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=f9WnWcZbBrsgVuT2da2zP3kNYit6klaRV5TI+XxfWFoSsIhQ1EBtkBZiBgEOar2lh
	 ZFYNRFZKSnkHJHKp8N2sU4EoxCfJSkKKSUS3GEzbYgUHBTLhEUgoSBwDFmmBJBeRG5
	 Dq16ZQnxyS/bpCu3tRojTUCHju0XhAHiQmFBEQ6z3gGX5gWMy4ujfnD9VAbKANLCCk
	 lUH9wLII+m+tDN04/j+bNc26yBrjajxiB43+gpL2ZEoGRFC0y/asicaB58r+nKt1pC
	 CDNpI/fQ9G3VJ7kFvFpF1wiSh+zJCDfQzpk74d6yHGBboXOZo+Zl8UDTH72fHZIb1H
	 Nk/x7W4Nkr2Bg==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261116042633.497423-1-phucduc.bui@gmail.com>
References: <20261116042633.497423-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: atmel-classd: Improve clock and probe
 handling
Message-Id: <179546158517.25092.4588094985508101442.b4-ty@b4>
Date: Mon, 23 Nov 2026 19:19:45 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ep+Dg/OTQrrUr8QHP2WNK+T2zk1oiHyVdSjj6q25MnA=;
 b=kA0DAAoWL+9zsLPQOIkByyZiAGsFf4uhXarYbXiGRbip4BWJMIqpXkDRQfpd54xbKFGQgBRxs
 Ih1BAAWCgAdFiEEXmoL6X9066wOwaGGL+9zsLPQOIkFAmsFf4sACgkQL+9zsLPQOIkWnAD/Vwzy
 y8n7QHpROhnHy2c8hLDwTST7uqDKK3jD7/Ie+MABAJGoKEX3xMh7l3q589T3XJXUsmCB2CRpi8Z
 AX4CRQJQK
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

On Mon, 16 Nov 2026 11:26:31 +0700, phucduc.bui@gmail.com wrote:
> ASoC: atmel-classd: Improve clock and probe handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series simplifies probe error handling and fixes the
> peripheral clock lifecycle management in the Atmel CLASSD driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: atmel-classd: Simplify probe error handling
      https://git.kernel.org/broonie/sound/c/94531f24f5b4
[2/2] ASoC: atmel-classd: Enable pclk during probe
      https://git.kernel.org/broonie/sound/c/76f1c241d10c

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


