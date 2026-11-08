Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE54606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DXT9pwwf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZ41GiMZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A+3QXez5hXJ+ayjKDjl1I9e1rtrnLR+Lcr3Xxi/T/SQ=; b=DXT9pwwflGiRv9
	D55n9JKu8aRh8yHlr6FStxQfD01YS46CKn7IsPM+DiK2XlPxgl9CneLMPvqi3kkm4ogheolTFeNmM
	2d2XAPS96K1a7A3VrMFOXSDenezwKx+NCLOQaWcW1GjqyC6qB+wdv12bFfAM3bQYnN54MuS7192Y9
	6sADjzsz3jJ/VRC/iWf2iCH+pfAPl5/Jv/Y4RZE9sJnKEu7nKbjxUkdsPZ5UKzLmm1N/JPYrOkhmy
	+rnKd2zkF4Bh0CqtPOIpONTyiLLWm+JzroRhu7L65LqpaN+QYLIesJj7xMxMPV7X0SbN3+JEoW+k7
	JDeCi0FiH4yDLbeLDwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3CI-0000000GDxy-36Hw;
	Sun, 08 Nov 2026 13:44:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3CH-0000000GDxL-3HLY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 13:44:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2ECA742455;
	Sun,  8 Nov 2026 13:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C411F008A1;
	Sun,  8 Nov 2026 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145477;
	bh=A+3QXez5hXJ+ayjKDjl1I9e1rtrnLR+Lcr3Xxi/T/SQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YZ41GiMZ7LsOgeLQxKQKzEetgdrn06s7GBXpW5tTRima1s1Nqvbclj8ChgX2bNFvN
	 j0CbbbClZjWFNbAXD3/NvFj7dQph9BSgQWgPpdQteDiqcrrDUWuwRoTHrd9dCASmE0
	 58TTOghF3xGWVTCoSFrTVTUkDKuJNlYAdFGsOTI3rEg8k79VCpTP3uRPzET5+vQc1m
	 OrKL4wIl22LBXNh7zd+Kf+i1WAjhkDpq94Te1vcj07uO6M1mgSguHwlnCvwrQcoD38
	 53zI90g274tKn2kXvzWi44MUSJpZaZDljRw1t/k7wvXujITTK2Sqa3ZKvVBNCVXB7j
	 gfWPjytunBN4A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 111522C79350;
	Sun, 08 Nov 2026 13:44:34 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, wens@kernel.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, 
 Jude Gyimah <jude.gyimah87@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261104135300.3723057-1-jude.gyimah87@gmail.com>
References: <20261104135300.3723057-1-jude.gyimah87@gmail.com>
Subject: Re: [PATCH] ASoC: sunxi: sun50i-dmic: select REGMAP_MMIO
Message-Id: <179413865613.3630016.12205411582383893622.b4-ty@b4>
Date: Sun, 08 Nov 2026 11:50:56 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ylsVSqvchlpBGitrKoVFx9daA4azP/C+WV10mY0Rnr4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+1BzUuiZTIrVp79LVu/btuubYdahFp5P3tU7yt8b1p
 in8hgvdO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR2NMMv9mTBC2PaLk5Lj+p
 +FJmF/db4RufvJwvPK8ttDvzZda1CecZ/unsjnC0j+hOS/947upc15mtPVw7045Z7tG85sWnqro
 5mw8A
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

On Wed, 04 Nov 2026 14:53:00 +0100, Jude Gyimah wrote:
> ASoC: sunxi: sun50i-dmic: select REGMAP_MMIO

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sunxi: sun50i-dmic: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/4267121a564e

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


