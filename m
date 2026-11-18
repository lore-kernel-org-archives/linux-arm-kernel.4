Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CA360A2601
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vb1rYEXu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IYq09nlD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mPThn7hmWxFFOkKLnM6RILYilZeG4F+al+8NhYqs7bc=; b=Vb1rYEXubN6W7Z
	HJ5dvbMTNYAFNWM6GE8dHHNvCa0PO58cBGPhfUyr+a90Td2wyS5J0eJdUwYeKJt1Q9DL2wRdLytpZ
	A1DjVUyjYjVk7cSpmzJKLvWc7958w04ps5Hlb/5TvUsgmuRSAiF+3ZAcmQRSg7nltZCBQm2ZSrFJd
	V500Cn3cdD6MGDLAWCgOoLs8G6OXbdVkhazmComGLy7T8CxOT4fwIA3Up54TjWBfhkQ/sphRJDJJh
	fYe1sBDEOb1FL3diMxCQkVL5fUf+f11DohLKsqj6+uIJG9fVB7WYQn8EBcI85CIVddNefMV2yvBDA
	8SWCvRL01r26oM0jFLrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Ze-0000000C8FC-1utq;
	Thu, 19 Nov 2026 13:53:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Zc-0000000C8Es-3uT8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:53:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 243D160F2F;
	Thu, 19 Nov 2026 13:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71F51F000C6;
	Thu, 19 Nov 2026 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096391;
	bh=mPThn7hmWxFFOkKLnM6RILYilZeG4F+al+8NhYqs7bc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IYq09nlDw/S4RjUpNqJF6KkGRmXYo7CUAsJkzaP3keSHT15nm7ChlfA9OTyaJOvgt
	 cNAL+/2p7nX4MMLT4N2EdDYjfocOyV5a2tEyhvsUm32Q6jOcipUvJsbl8FmJaP3o6t
	 yTS2l1N07JitPxe06LuH4HBRJ7guCvmaqYE795I5XmfOxTSiLzpaDcjvLJhdeugiH/
	 jcv1PTmkXmmibUnkNAmg0jQiMExL/rHORH7r+P6yjYcYJyaJJl2qzDmRkH06uVgOyu
	 sXwWONtVvn6sAIQOw55m8a8siN2XULku53n3QID3tciwVcc0CCfl4bPFpdhdpJgtb4
	 ybzBqW5z3O09Q==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261111100616.31211-1-phucduc.bui@gmail.com>
References: <20261111100616.31211-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: atmel-i2s: Fix clock and slot width
 handling
Message-Id: <179501012503.349622.11739221636052053078.b4-ty@b4>
Date: Wed, 18 Nov 2026 13:55:25 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458; i=broonie@kernel.org;
 h=from:subject:message-id; bh=J7RtMztD0VkcpU5WGmYpngD3kqOdRp9XomIjDn+CNtw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/Xd+9f7vZLXmrF6+opzXoZaylR4zGy4dncH/6YHzn
 E9zg736OkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARlRcM/6POh++8Vnboo+nr
 f+8lRdilDZd+P/MmKP/6bIn3ifMarnIx/BVb/7V8/u3dRTZTw00cYlte+jmq9iq31ngo/V7A73p
 nHTsA
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

On Wed, 11 Nov 2026 17:06:14 +0700, phucduc.bui@gmail.com wrote:
> ASoC: atmel-i2s: Fix clock and slot width handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series simplifies peripheral clock handling and fixes the
> I2SC_WS slot width configuration in the Atmel I2S driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
      https://git.kernel.org/broonie/sound/c/a19f318322c5
[2/2] ASoC: atmel-i2s: Fix I2SC_WS slot width configuration
      https://git.kernel.org/broonie/sound/c/f0903e6544fb

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


