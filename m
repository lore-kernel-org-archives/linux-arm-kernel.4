Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1764606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 03:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ahQuIA00;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdb1wEHo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=psyl4qUMnHJ7E35cGuROJkuzGX0++eVKi2SRi2Q22TA=; b=ahQuIA00aPJ76O
	LMeRvkImpqWDWtJU6yMGIzJYl10nGhvnVBleoppriYK196c0ZPY2q0P5FBdcy9+iI4aHDnl1LppMK
	2uXn93EvqgTxa/aeciDMFjIgJjCR0yuvNGfDuckUaPzC4Ko9NK/jhwnQlse2BYy+aPpyfN+1gilMN
	falZVV01E7RXUxbBonmPvdUkQDvRYLpJfN6GFyDSgJ8af7ExMxc3y6GI+QUjplczy8NeNnibiWg5w
	ppMUWp2Nf3jVuCAu7ikGvl4bmcBVrgyZspRJs2LREZjaTl+9dwbR9Hgrjz2ai8i+3fVD+cBkYbv+d
	fJe2drPUanJmHkkO+qvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmbF-0000000ErcB-1mOc;
	Fri, 27 Nov 2026 03:26:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmbD-0000000ErbG-3ucv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 03:26:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96A1C435AB;
	Fri, 27 Nov 2026 03:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1EC1F00897;
	Fri, 27 Nov 2026 03:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749971;
	bh=psyl4qUMnHJ7E35cGuROJkuzGX0++eVKi2SRi2Q22TA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jdb1wEHokSHuV/K1LOOpiVjOzkop5mEw2GY8bpu18UnMcITWvYLFCCsHIOuBawM1a
	 SWCm4lvP8k/emGCkVdntDDh9IJmYWOFG98EdlBfg8dGIYUxFbfcrBQJU4ewu5m4IfO
	 ICD5NoTYMNhcDhBqQfMOVnC0oSvDushuT5W46TxBQJJrbQOel/1I2sXp9gXRh46oRF
	 +AOuCnIVmZindlW09xqzparmGE1OcD9gloGm5kPnjlvYwh/B3qjAjSkZNLtAIaWX0y
	 I1cLVFeiBA2QCMFdH54WXowt49QCZASFG27TLPvFQo0mQkpsn3RuvPw6vmCKN2rno3
	 15fmA36vV3ceQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sashiko-reviews@lists.linux.dev
In-Reply-To: <20261127020029.1618525-1-romain.tisserand@gmail.com>
References: <20261127020029.1618525-1-romain.tisserand@gmail.com>
Subject: Re: [PATCH v2] ASoC: sun8i-codec-analog: Add the headphone
 inversion switches
Message-Id: <179574555051.838304.11873761399543336374.b4-ty@b4>
Date: Fri, 27 Nov 2026 02:12:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DfCMJDOEfs4h5g4ABy5IcNQl+5IEVbmoqQzSi38+0hI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5fviv2f0sdFlGws1n5/+f6jmSatkiHqIlfrD0tXz5Y
 YMpU7pYOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRyXwM/yurYt1tOC0mH8vW
 erxn3l7TLRxVPxaIRyip5vztzsu1z2NkeN9uOfE+p8Zrj+muRc+FA4uVPzb4LlrBIfzFJtGvtoG
 FFwA=
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

On Fri, 27 Nov 2026 03:00:29 +0100, Romain TISSERAND wrote:
> ASoC: sun8i-codec-analog: Add the headphone inversion switches

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sun8i-codec-analog: Add the headphone inversion switches
      https://git.kernel.org/broonie/sound/c/f8c89079cd90

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


