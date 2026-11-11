Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADD9606A881
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0CRBWZvS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NQ3K80Qo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kH63A4Q8NhJGmF9dCXy668pUMjIxPVBUhCn9NoDFJ2o=; b=0CRBWZvSB81D8S
	Y5JkKuu1Jckzd6kKBDWJ9fLvHcRHapZ+QPKNSw1wLK/07w1BXMzJSuaFoEpEgX4mfgbTaquJU4sra
	nbk/Nbhvhqe6vxnfRaVW2IFAJJn17vEamzKJ3fyw2WbFB6ilQXXfLYtzLcKiZk5cc4DLpFvaIV5qc
	UF8xDThzjRSbiwENzCungxyv2JCeGYA+5zgiuwNzIS5CuYFVvCn8HgcWnquM2QLCRw/tip/rEdbuA
	8jnr3Zs/t6X64TAUWTxeRio5IcbtkCevfIU7mSFJpPpPtKgflncUIfEZ4gmpPpQO8NHOhqSDrGzV7
	b6aD52+Bu1crwqmRAXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTJI-00000009mS4-1Obx;
	Thu, 12 Nov 2026 11:49:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTJH-00000009mRv-2e5G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:49:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB455401B7;
	Thu, 12 Nov 2026 11:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E76A1F00A0C;
	Thu, 12 Nov 2026 11:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484182;
	bh=kH63A4Q8NhJGmF9dCXy668pUMjIxPVBUhCn9NoDFJ2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NQ3K80Qo2q3BL07IZpeFRUivMoPaMOVcJYxjzGx0tcJcgm4EeEH9gcDfaqOxphkNG
	 4+MxAWdn6B9irz24jPAXNdMZgvvfY9Mri6qErqmu3AGnL7j0gh0X/HkWISiJ77x/NM
	 wcdmBa/hLp3GhTX76C1yEdSp4g2h3EBgYXqBfaElrfMw0iZAAW3E4dGW0KXI772XJE
	 7QIGZfetbzPSgYuMCtQOp+9MDnU+GWsMwJ0I8ybv8J5YBXFpy+E1Rq638+Mbf4pleY
	 e5c2eixsB8gfI7s3Prz/9CAG4EPzNONXb9s7DHQGbPIv6muRUVHMWCIVnE55pwwora
	 OyznJ7ojj6RUg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
 Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pablo Mazzini <pmazzini@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>, 
 Andreas Kemnade <andreas@kemnade.info>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-hwmon@vger.kernel.org, 
 mfd@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261108093602.329554-1-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
Subject: Re: (subset) [PATCH v3 0/5] sy7636a: power the panel only during
 updates
Message-Id: <179441948592.393238.163548015139580869.b4-ty@b4>
Date: Wed, 11 Nov 2026 17:51:25 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tAX4JPP5kVuvXSOIYyzrfdqHyXORq/eq+6a96LBatXo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+Lr/kpG5TctlIuGON9dnug+cdZdn2r5yv8u8uD+u/P
 UIVCpJ1HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhI1xOGf7oO+4suV7VltqyV
 WM/wbt7dvlchVRr7TXWOrDzf4PaGT56R4WiCdLdg4W51W4b/Ejt/xk/af+lqgsDUPVtnzNuZXNL
 LwwUA
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

On Sun, 08 Nov 2026 09:35:57 +0000, Pablo Mazzini wrote:
> sy7636a: power the panel only during updates
> 
> The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
> can not power the panel only during updates.
> 
> Read the temperature only while the rails are on instead, and bind the
> regulator to the I2C device directly, with the hwmon driver as its
> auxiliary driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5

Thanks!

[1/5] regulator: sy7636a: don't wait for power good if already on
      https://git.kernel.org/broonie/regulator/c/7d9a62b7e554
[3/5] regulator: sy7636a: bind to the I2C device directly
      https://git.kernel.org/broonie/regulator/c/5f828ac25ef9

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


