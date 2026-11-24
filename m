Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1491A606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fqCDUc0G;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B8AMKnA8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PktzGNvC8aCyQfnjlw/S3jzDcAv/5mUKdGHerPfp2M4=; b=fqCDUc0GPHEXd+
	lhiyJxUbzjuzR1/1OBJpth7P/TSD0B739R39OL7UXMWlFnWhfba3K5yz1lRi0yAsCFqvz1YrovjvP
	U1TozwtQvoZT/Ho7LWbaqJ6tuHD1WOmpdGY8oh8JBHmICHcIpzKb251qRoh5IVns5yW5JEABGqowN
	nJ62A+asqjfvAYh8bpYHVjBx1jFD+JqMn9HqoK5VT5582IM2ZPBTBqYRr1d6LBIFpLU0l/V/bgDz6
	7z8kDfTlu6txm4UT6n5KV4ggJu+8RIlMeWsjrx2ftvs2+3HCXI6gVuANuVvg2QNquVfJ3d+NiX5Gf
	vmI+1dYUyIyNQOAdZDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsxQ-000000073BF-1p7w;
	Tue, 24 Nov 2026 16:01:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsxP-000000073B8-2VOY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:01:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF69A6277C;
	Tue, 24 Nov 2026 16:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D6E1F000C0;
	Tue, 24 Nov 2026 16:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795536082;
	bh=PktzGNvC8aCyQfnjlw/S3jzDcAv/5mUKdGHerPfp2M4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B8AMKnA8Bqm8hPzpFQhd6BsGz/zjzoy9PwqXhsYENrIgOINMXqAL8LZaGzNyztRqT
	 PP6jhKV7CcdkDIZsLemc2V8PXGSRwB7+eZ7BfdSTsFsBNtgCwLVGT3fvPFwJNLBgck
	 JMPNh2WFWwacN9VL8xZIKtj0ejDoCXQ6OcqWVsVi1sKgaoxQ0+T1o/bl4O2kS8pmpK
	 aoq+PTtEkibkhEuGPYOzTPwBAvzy0T+VrpH3++96MRk+BD167CvIOiu4kUGe3DffTF
	 yzzbhknQ3YU2cK68OmI2ppb7Z8orcUuYWkjx7J7cBI1t7R11O5m9s+ATregAoiqcXc
	 LxmuEgACpJiTw==
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
In-Reply-To: <20261116110212.522478-1-phucduc.bui@gmail.com>
References: <20261116110212.522478-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: atmel: mchp-pdmc: Clear busy_stream in hw_free()
Message-Id: <179552778389.264265.15656602591905172713.b4-ty@b4>
Date: Tue, 24 Nov 2026 13:43:03 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oeSQnfDbKUTfmp2jIdejhqYlZegz2av7F1bIGmHQXqI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZt5wTi7u2TMDz8GHOhSntLjJKv3Yk6Din3dbI28K77
 6anSlxIRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZyvYuR4drNR2cyzy/edHgb
 1yLbqFMZBz9l9j20+fCXW+v7Rx9lw3OMDFfWczSpPOW5Et36JM+6t8I6py5vianjk0eHA6NVBfe
 VsAMA
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

On Mon, 16 Nov 2026 18:02:12 +0700, phucduc.bui@gmail.com wrote:
> ASoC: atmel: mchp-pdmc: Clear busy_stream in hw_free()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: atmel: mchp-pdmc: Clear busy_stream in hw_free()
      https://git.kernel.org/broonie/sound/c/98fe26341049

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


