Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE19606CE40
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aY7VdACM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CS8qps0P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F6q/MsZ5jDBuuA4szE84/+BxFmPAPx64/M8+UUIYUAE=; b=aY7VdACM0/qEoF
	OTyh6Hr/RiBfoBr8CIAShN5BkbkmxiwEfG/f0QNmwBiV237RknUArMhukAQeKH3jD3TJXzQ/48nn/
	4pYgyozik0x62Tuo+qucvXlDu/028AZPiC1Rocj+1UKTmCwNzYNZcwT1bjANA3jK9agZXQeP1C4uk
	8AUuLxvfFpJsfUhZt//5irFJO8NLKursTzep71xPv2ENJGK2xQgQetIUl82cMEQaZwxQYqcf1Y4gF
	WoVs7GcagD7Xol0u1NCkQieQ8+c0L54ErGhc0KDQnYP8loo4moaXBzd1AKj5sCWWLnp0+CbxCwO0L
	vMaoPCcNFow4fjfaNT8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiAd-0000000Et7l-3E7V;
	Sat, 07 Nov 2026 15:17:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiAc-0000000Et7f-3WZ2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:17:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CD5C4129D;
	Sat,  7 Nov 2026 15:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E7F1F0089F;
	Sat,  7 Nov 2026 15:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794064650;
	bh=F6q/MsZ5jDBuuA4szE84/+BxFmPAPx64/M8+UUIYUAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CS8qps0PV2S7q/9M8Krw90/z0ppwy2RL1OvwvJjd1L9+yqaH9FGDn1WdfckLto179
	 Qh3VXPpFjXTHMlbGAB61rgnG6wmXT45Ll4HY+m9jqtpYbR4zevkH/h85VHdDkVYYNv
	 oZVeWeDpwWyT8X56lxzQC37LBZIWsrd6KKxuDSJhs0CbgrcpiDB9SLp3K2qZHRgZQb
	 otCww9tDSKbtQd7N3AZ/nie8UgaCKPN9MUqAKzkrHqeDiKaGh68bLOJrlr+YAEBQJL
	 O8okJoKJGTtehRru/KCGNgu9k1YzdM+3Lygm7Dtj1NWG6vHhY3TeC+RZEmlxTme0dN
	 ljieQ3SFC3i2g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 1DC9B2AB3127;
	Sat, 07 Nov 2026 15:17:28 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260602114437.50324-1-phucduc.bui@gmail.com>
References: <20260602114437.50324-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v3 0/3] ASoC: sunxi: sun4i-spdif: Cleanup and runtime
 PM improvements
Message-Id: <179405444330.3424803.15883456865264287709.b4-ty@b4>
Date: Sat, 07 Nov 2026 12:27:23 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YZvUmFfdUmWuzhzoqlmjzL9oD0KOHNnuLRk/oEZ0bfg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeO7JneE4oF2d6P/nKVPYdOmemv9/fYPnm5TdPo7/fn
 /feOiYf0lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJuK1lZPhhP/PMhbO9dcuO
 xHyePb/48dTnqpsUkq5sz7161OvLAdcHjAzvuB6cZ2ieNbvTzOWm2lHbLyu/yDxTX/qKN/u0+RX
 z/TP4AA==
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

On Tue, 02 Jun 2026 18:44:34 +0700, phucduc.bui@gmail.com wrote:
> ASoC: sunxi: sun4i-spdif: Cleanup and runtime PM improvements
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi,
> 
> This series contains a few improvements for the sun4i-spdif driver,
> including guard() conversions and ensuring the device is resumed
> via runtime PM before kcontrol register accesses.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/c5f9ddc7d2ec
[2/3] ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register access
      https://git.kernel.org/broonie/sound/c/f003dfe0842a
[3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
      https://git.kernel.org/broonie/sound/c/a4a9384fdf2c

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


