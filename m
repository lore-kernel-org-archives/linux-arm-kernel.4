Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE13606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bqv78ZrZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKLG/c1Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ArVPK6BKpDUZcAFpoyGnP6MOmVeqaCHP2/9qAGR6yYA=; b=Bqv78ZrZBcuaOH
	xy5HShomfhrBXri470unZEx13wqnylNyahCXkxG0zS/nX2LThK2KR0tsek9B5dfn47U2MFZjSae9G
	WBG/jtBJV+S522wLqKImwc0ds7k0e3sAg4b6rlQxdPlwN8iLpANtw8gB/Us/3k/pIzFW1OTq00QDr
	fI3cX/kCJkXE2VoQX6++gr0SbMRBfXgvvG+pV2rtvdqxi/YsKdSIZv5z/obcQeZX8A3djwGwyfW9x
	W+VMPBitHY6/i+Et/X1c4a3Xez8NKaXXuHxo2ibp9W+I+lc6/CK0wBpFC9s+Ea4QBhR4pVaLwrywv
	j+Xvs3G7JgGtkgbpeTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcpF-0000000DzUK-48AT;
	Thu, 26 Nov 2026 17:00:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcpF-0000000DzSx-0BJZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:00:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C894453E4;
	Thu, 26 Nov 2026 17:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC851F000C4;
	Thu, 26 Nov 2026 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712400;
	bh=ArVPK6BKpDUZcAFpoyGnP6MOmVeqaCHP2/9qAGR6yYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NKLG/c1QN2Scs8+qoJdavof3eQ+1oZRCah7zQ3XxaYeMJPt2fWZEu9ujrFrasfcoO
	 yqOFr/1Zlj3DnmOX+2bMPR6l3Yk9k7QGTpSx6qHhlDxMg9gFo9M/gOrkJQ+FUTgOKD
	 wjr3wPpgmyqAV6ZhXyQbJNX5WufHndIFPy60jsKkshTIXofIoHsZ6UzXqE5+kpqDTc
	 eTm2Bgrzt7X4RSMsoRgShl7TUwTVV9el5c8Gh8TPQBzLck4o0L7tU2tnr8xQu2vyst
	 ILSoLNhp5ipidg+TRNTpt446Em4N9gLcd4V/Lxqndnmhpt3wWHN5Hbt+2MBRQH43+O
	 wesAUBG/qzP2g==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119103413.31729-1-phucduc.bui@gmail.com>
References: <20261119103413.31729-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: atmel: mchp-spdifrx: Improve driver cleanup
 and error handling
Message-Id: <179570252647.142532.8118528768282595011.b4-ty@b4>
Date: Thu, 26 Nov 2026 14:15:26 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jAqLfns8tJYxcs2fnPmiZAEiggeYiEvvhYnmI0s4E8g=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5UnsKpxwW/n9Fs0hhQYq2HWO9RI3TW0cRL379WlbJF
 7d8Js7sKGVhEONikBVTZInL4n5ZX/J6Dd/BhW0wc1iZQIYwcHEKwET61RkZ9nrX8Ifc+jFvRYrN
 S55P87XTwpab8EWu03xje/RCoVv2SYb/SXYZts8y13itVv/rr5pwePPT9HY7vx9BHQfvNa7dsUS
 AAQA=
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

On Thu, 19 Nov 2026 17:34:09 +0700, phucduc.bui@gmail.com wrote:
> ASoC: atmel: mchp-spdifrx: Improve driver cleanup and error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves probe error handling and runtime PM cleanup,
> adjusts IRQ registration order, and fixes error propagation in the
> ulock get callback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: atmel: mchp-spdifrx: Improve probe error handling
      https://git.kernel.org/broonie/sound/c/3c762dbdc06d
[2/4] ASoC: atmel: mchp-spdifrx: Use devm helpers for runtime PM
      https://git.kernel.org/broonie/sound/c/0918434ce540
[3/4] ASoC: atmel: mchp-spdifrx: Move IRQ request after runtime PM setup
      https://git.kernel.org/broonie/sound/c/e3414e02d7fe
[4/4] ASoC: atmel: mchp-spdifrx: Propagate runtime PM errors in ulock get
      https://git.kernel.org/broonie/sound/c/648e08bdb51c

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


