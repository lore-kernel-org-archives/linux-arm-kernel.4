Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98110606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N/nhwt6f;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5Q+/YvM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f+/6cPyVL7K4OQJ17M0iF+OL3WNe7td3ln+qN/9TMlU=; b=N/nhwt6ftuleXa
	2eBu043dYn1rpE2w2zBLzI0i7bKOzY3QjZ1hW84QuI3ceiaSxf498u4tOIFIzeIfmPNsp+9LKhlYh
	wQjkZu+no24eYzhxiuphMsl25OgZnAufQaTnhV126aimFGFokxie9aUADqaXEebv/LZ29oF7hVBwO
	Q9K9oA4WJZrXuX1n0TDhA8Xq016NCQ7psppTLzFfQbbEnApuMhf3RbiBa0WDyOkfaRv6PLv1AqEwI
	Ys07X4wXplEhjSSaPBBPS7I2TVuiRWbKJNqEQUz7ITAD1J6ABastxDOiwxyF65ZC3OFSSUXgYx0qg
	l5wTaPWhluaZVHx3ufPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLnV-00000006OF7-19NM;
	Tue, 17 Nov 2026 16:12:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLnU-00000006OEy-0ZBR;
	Tue, 17 Nov 2026 16:12:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DCC061185;
	Tue, 17 Nov 2026 16:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0249E1F000C4;
	Tue, 17 Nov 2026 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794931958;
	bh=f+/6cPyVL7K4OQJ17M0iF+OL3WNe7td3ln+qN/9TMlU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O5Q+/YvM44QUk3wBqsXYQ26kDyelxtYbP2AvDJgP4Icc/O+WTKurgKpLEx1KD7NA8
	 tPenRS3dAbuIf+ZA0sVhuKWsb0thB07Tj4fdspfYaeKZccr5Z4VNt7eBiDxYP0gUH9
	 hACBTwj/SuWTmcHINjid+6p6xgMetH4SlRfegPdhSprjLRGO8vpDql5MSFeBrMXjuR
	 s/4+X5HfeD4LNzr7DxslN5CaxeWh8xKzYCE2VAor1bkNJ72Q9/Yj1O5nx/G+BPUDs3
	 Y8P5WOBKpRS8WFFLctyKlgqQ+hAOa2kzz3OklN9BaYLZio7xB169v6rkmlY0aXC/eS
	 F3ZTrVkwWBo5w==
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Mark Hasemeyer <markhas@chromium.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 kernel@collabora.com, Alexander Shiyan <eagle.alexander923@gmail.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261110-spi-runtime-pm-fix-v1-1-8601ebb2f6a8@collabora.com>
References: <20261110-spi-runtime-pm-fix-v1-1-8601ebb2f6a8@collabora.com>
Subject: Re: [PATCH] spi: Fix runtime PM imbalance on pump transfer message
 error
Message-Id: <179492736789.77896.11207792576309707845.b4-ty@b4>
Date: Tue, 17 Nov 2026 14:56:07 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GPDZObiCK6E7h0QOgxLM+QhPzWZiBmUAKR9S9vrKWUY=;
 b=kA0DAAoWL+9zsLPQOIkByyZiAGr8fPPI7inKTe2wtGgZeTG4r2RF9kW8nGMEgXFbp+eQObqro
 4h1BAAWCgAdFiEEXmoL6X9066wOwaGGL+9zsLPQOIkFAmr8fPMACgkQL+9zsLPQOImb3wD/Whxe
 fbfRYX67y/ghbpoJ3vURtSdkY1/y/tSBKKYneZsBANtXLZCDy3LmaNxdZU9ahvCM+nBfEhqwv0l
 JVvHp5QMN
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

On Tue, 10 Nov 2026 01:41:58 +0100, Sebastian Reichel wrote:
> spi: Fix runtime PM imbalance on pump transfer message error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: Fix runtime PM imbalance on pump transfer message error
      https://git.kernel.org/broonie/spi/c/bb5caf7a2e0b

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


