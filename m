Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454E7606A8BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L0BlXVxj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YqmAvoQX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DZX7LrkkoITSV9q8/hf9tQANgdUAkilb9PapYVkP0Us=; b=L0BlXVxj0DQ8Td
	I2H/RpyHfJ7RyBc/O+GMflz39EFzcm8TE4BzZWafQlyJ++xXSt4ztFPAaGhS/2mMHTK1zD1RXZKgf
	0ySNKFOSBwEAnFvrtQ7ORRbTwfG4fZg7OnoiC6Kok6pYN+pGOZP3fjBbEeSnsAXo814hOqUHentQ3
	SYLVtNBYyKH4vqbqJlQKGl8uaOPSNbhg0IU1O/lI75CvD10/NVcE2ZsUKCrK1lU68jvyu9iDLnLSu
	aDbvYuho5OaLWZU1PHmdOnRc3IPPyky8a49o5gFD6RnHK2iqByR/XShMkU4MSLuKqYYDgQNwPHgBH
	hz1mRxOCXSjSds4f7kxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRStm-00000009g30-19rk;
	Thu, 12 Nov 2026 11:23:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSth-00000009g2o-3yh4;
	Thu, 12 Nov 2026 11:23:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DFBA63629;
	Thu, 12 Nov 2026 11:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84BA1F00A09;
	Thu, 12 Nov 2026 11:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482597;
	bh=DZX7LrkkoITSV9q8/hf9tQANgdUAkilb9PapYVkP0Us=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YqmAvoQX8W4N+wqZSyw9pDbbUpniRn45n7LV6ZTubKpQXfpqBlFX4JcoAfVoZAIlS
	 OLASWhwS0rZjwY2tt6LsppgyHiLisBJgYxORqQGH8GydG3Od699tTjKm6x+Eqx9Fq9
	 fqpBzyJB0pTPWq+WFptNg+vhtcaBcuVubPOQvrPyOFv74DaFluwQ/sV9GjXdENntVL
	 uB7UZ5EQbZd014TkijwPVJ2BNPvwfAWcGtFR36y3jzwh6vbA4rTZOqn1rWfUpKKuqc
	 ImWGVpkZJRNg1PLXnpN2SoYoEDEHYEg8uYQBD2BK/HMLr+h7zj+IWX8qCZEBOOicC5
	 7fqJWGLRqDkjA==
From: Mark Brown <broonie@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-spi@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110-spi-bcm2835-kdoc-return-v1-1-dffdfcc36233@yahoo.pl>
References: <20261110-spi-bcm2835-kdoc-return-v1-1-dffdfcc36233@yahoo.pl>
Subject: Re: [PATCH] spi: bcm2835: Add missing kernel-doc Return sections
Message-Id: <179441977679.393238.9199268057403171713.b4-ty@b4>
Date: Wed, 11 Nov 2026 17:56:16 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WxllxCixDuNeTCya0yxN5aR0r/TIzJI3BYcLFM2baPM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+LlwUd+xWgOOCyIXfLpjOipJ/w7ysnbNxw59nZk+Cr
 T48CtvM3VHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJvFNi+Kfn3XP5sNGtTO6a
 wN+MHOIqL49/nqJp2X0hVndH3JZd8xYx/A/fHLl0pdPcy9JSz92nn3k2WTmDObDrxcm3nU3T09t
 st/MBAA==
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

On Tue, 10 Nov 2026 22:33:02 +0100, Tomasz Unger wrote:
> spi: bcm2835: Add missing kernel-doc Return sections

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/1] spi: bcm2835: Add missing kernel-doc Return sections
      https://git.kernel.org/broonie/spi/c/2a28392d4b4c

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


