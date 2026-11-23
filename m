Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499C8606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nfab199/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hP6mj4zp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q3qGM9Qy57cVjK1+KGIJlLy1Vw4Q8SXTPS0xOWRA8sQ=; b=Nfab199/Eaz6ht
	fYilTz9Aljk20MAIbAEZyv2ABHldCldagkUUeegZmgQFG6sZRV3HWaq1ZuGeBaLBSGpnfugF7q/C9
	LhN4iOr8PHxVVNP8OYd/9aHFqByqbRFMKANJRKf+9yVy/STS+w4ARnlcNXxaGgXMEEIfndZHolbLO
	NUNXVh8OnryckjCwG2l+EG/YNKYcrggAeU9EH9NVXjtCrsPI1DTbAaDjK0IIl3m+9hq0FTpWDMis+
	HXGeFNBm1AQi2548yzecrNNHkabRJ03H1RU+3LMVd5TZeD37QVT+UwXphdHt1bK+HKwxKCinh7r0B
	ONx7UJ1/yKza6dgqJLFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVokJ-00000006MXT-2s9U;
	Tue, 24 Nov 2026 11:31:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVokI-00000006MX5-0Cpq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:31:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AE83623C5;
	Tue, 24 Nov 2026 11:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D821F008B2;
	Tue, 24 Nov 2026 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519892;
	bh=q3qGM9Qy57cVjK1+KGIJlLy1Vw4Q8SXTPS0xOWRA8sQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hP6mj4zpBvCMnt331ApoLcM/EzFJdkOQ0GKsGIwM6rXUl9fXR9PpeeeCKOVahaf/+
	 TapgVEyLnfqMcvxpeEJFtizvFXH1G5+yyA0Qmc4qw5lBZKlfakiSt32WPDNuMarveG
	 AfSi1ycHFWrX5ztj6VycNVo0inJxipzydzfIgIxZlYZU2AqtaPxrEW1ui3/m/k62l1
	 r01EDYCEkz7UPpvB+th4u5h7Ou1D/TLepSI4nezhObegXj+Rs3ndDDsiqucG1a9eU2
	 53oHD0bs0k+DZ7pgrjOfaV4AI1rcRnq4gGn2fRW0PsRcf+prP/G2Srb8CiqU2q7fF1
	 u/RlK23s5higw==
From: Mark Brown <broonie@kernel.org>
To: Ryan Wanner <ryan.wanner@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
In-Reply-To: <20261113-spi-atmel-poll-short-pio-transfers-v2-1-f280762685e2@microchip.com>
References: <20261113-spi-atmel-poll-short-pio-transfers-v2-1-f280762685e2@microchip.com>
Subject: Re: [PATCH v2] spi: atmel: poll short PIO transfers
Message-Id: <179545926826.25092.9908100181391728430.b4-ty@b4>
Date: Mon, 23 Nov 2026 18:41:08 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lS+VtYxRGDrxj2oCgEImHpbzYp61PHJSeMh1QIq9P8c=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZSyesmHslPHWmot8Or+1PS+KSkqV3Hz2sweTxJSA6h
 TdOQ7elo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABNJL2L4X8wvLqLlO+Ow+yOB
 hG1xbafs0n85hxdsNfes3sz9qUdZguEX09VGlYP/FB0WiKuwbSnIvPzoM7v2giJ9k+w3Z3YqSrV
 zAQA=
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

On Fri, 13 Nov 2026 16:20:32 +0100, Jens Emil Schulz Østergaard wrote:
> spi: atmel: poll short PIO transfers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/1] spi: atmel: poll short PIO transfers
      https://git.kernel.org/broonie/spi/c/24e635993ca5

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


