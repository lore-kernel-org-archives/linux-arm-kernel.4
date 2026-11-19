Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07781606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gb62FZRx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=naJe9zJl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qukOtTwYNeY65fV7GEd3+hUFNE24AN69HXQ89jir/To=; b=gb62FZRx1ayAMk
	ZotTvsIMKwXbIIvt2NoNNYo0gOL45Y+uZscQfH1nH4raFgqEbWBQzjM0uhsFefrbG/2oTrkq3Fn+I
	ZTqmegZgIr7huTZpdVhHD59M6J9PzJjnQOYBHmAQ8bGVH2bjOIMkOfJP8XeNl9FXc0UhKuK2Jm9Y5
	1FvGfxSTfuNOjF+Evp1RQshE/jAqbtcFkLn3m65cikCpWAli8vMhQXpYetIQ9UhZpMlbLgYk8FnH4
	N65295B8ikiveGFF/1LAwdC9NqjFuHQwpvMZLRexfnXI3a+gU/5QnmuaFoPOHfRAtli/TcPyfFtKA
	MNH/6nyWRmhDXDKjDk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Wb-0000000DAJJ-3bHQ;
	Thu, 19 Nov 2026 19:10:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Wa-0000000DAJ0-3pEb;
	Thu, 19 Nov 2026 19:10:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 587D34047E;
	Thu, 19 Nov 2026 19:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0AE1F000C4;
	Thu, 19 Nov 2026 19:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795115424;
	bh=qukOtTwYNeY65fV7GEd3+hUFNE24AN69HXQ89jir/To=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=naJe9zJlPJDbDr9Uzls5auFH8KkqnjthM6eaxXlB8hrSg+hQ8foeq0O4wSfSmyZFy
	 6XtXt9s6dTzaL72CUzXE1lWAAUjmEsXLrqcw58S6neziNlGosVZ2SLy6Dd/X8RBb+k
	 UtFhcuUi9hNmuuWtagAKPlPOTde5ayAeemBqG/RUnasBJj18MZh+vYZQwgtjkspv8I
	 qBRanuyR2zld1GAqteWK721ZZ82Mio95OPV31090Y1BOcmiJ37zKE87440mXfxhUYu
	 6m6A1bEL9tHjiQSzZujS0X17zKTOuwZZRjcme/O97XvO1mAD0JZxLH7VbXb98KxhMk
	 sklQSxtzurEhA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: gx-formatter: change stream lock
 from mutex to spinlock
Message-Id: <179509708687.116416.8043243616213914673.b4-ty@b4>
Date: Thu, 19 Nov 2026 14:04:46 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mNbQf2yq7zE9LqqFnCB2s6MtlcWOuguvqz25adVY+6E=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+e84RWsB8MiHt67zybwFHZLx2hNyZ+s1QXaC06Phdh
 k7mzX+EO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR458ZGY7V7/NXmP6t7Pcz
 jeWJO99/XyxxzWLnxNjWd84qE3quJM5hZPinu1fo7sa60p9casKbFnF18TF8zFX5vsRL30Lv4Er
 jr6wA
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 11 Nov 2026 11:12:47 +0100, Valerio Setti wrote:
> ASoC: meson: gx-formatter: change stream lock from mutex to spinlock
> 
> Patch 1 fixes a pre-existing bugs, present since v7.3, reported by
> Sashiko [1] while reviewing the series adding I2S input support for
> Amlogic GX SoCs [2].
> [2] depends on patch 1 to address Sashiko's comment.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: meson: gx-formatter: change stream lock from mutex to spinlock
      https://git.kernel.org/broonie/sound/c/0bd345a04dc4
[2/2] ASoC: meson: gx-formatter: add lockdep_assert_held check
      https://git.kernel.org/broonie/sound/c/e38a24552453

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


