Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF437606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=akRUSo6D;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KNapicCu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2juA0rqU8pu1DpmHAS526Dnda9RFqW2YMGL8zHBIuM4=; b=akRUSo6DTLP1x1
	Hd9SkWU73Q16b/HlESYbqBgEl7LgfUECfwCulKv1J7KeV9n5VofRJBgZD3foq7VXVzM0m80TO2N48
	77qk9OVkbm+MGA4s99duw1BDSR2mbQoH4Q4JNn8GFD6S+D2HV9u+mfegpEDcsQrpKg8COs947pMvV
	gFoC93iwrKKqhSi3mgFtuy+AubE816QZdh+TxJNwdwUe5zF8fin8LBmlzk8U0m2TEeKFsmhm+cgB8
	chc4hmUScQu++fX9t1gqumRsGQV8hLxuvPi2lrBVaZUXcSwxo0vOiEP7qfxit62cAE4naeK4ivAGk
	rkOz97Vl3eSklcXFZlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpe9-00000006VwR-2Zb6;
	Tue, 24 Nov 2026 12:29:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpda-00000006Vqc-3CR1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:28:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 39B8540304;
	Tue, 24 Nov 2026 12:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538501F0089E;
	Tue, 24 Nov 2026 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523321;
	bh=2juA0rqU8pu1DpmHAS526Dnda9RFqW2YMGL8zHBIuM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KNapicCuWhX/vW62nc3qkqVu6EVdptRq5g7QrCTBE7iTolKDnGTd+/SoZD2r2skx5
	 Gl1VhBF2gtrhLXGPeFJrQ7DVI3zg3/IcyAw5RGZMoSV7vbIuM/RPILwGikSX0X64IE
	 lWf5Bh1DRIzHumptedgqKhyav21cxBdmr2oumhTxQZmGLB+Nt2UhENm3HNg8XfpDg+
	 +MOPE+oicT1XvPkVsIWOjVEU07jjU3mflUZ8YkxLi0OEe+IcXflO/63d9tKWLxqiFY
	 Ovieuvz5a7sZAVg0L2OEB6/lgWmRbobe8+pP5UATDj0AVFPWCacr9t3T2E3nWQSeCk
	 ZPaqgNIRX89vQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Arun Iyengar <aiyengar1990@gmail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com>
References: <20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com>
Subject: Re: [PATCH v2 0/2] spi: sun6i: Add dual read support for the H616
Message-Id: <179546093021.25092.9731522702680875589.b4-ty@b4>
Date: Mon, 23 Nov 2026 19:08:50 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Gl/xhCYINcG9OHOKX7Xhzx/xdThzJjdJ2Z4+WZuW27E=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZm76yZzvv2j7z+uWwWfyFzA9+7Rae+01toovFWvUpU
 0pO3dCI6ihlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBESjYzMnzdvzjnyO26xjy1
 c09msOUFZ1p4iaScOiko7iBjv0PgSAQjQ8eu45GFnd88Ofd+PJv4v/CD/BmGOvG1FxIL9qjLLvP
 byAcA
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

On Mon, 16 Nov 2026 05:55:24 +0000, Arun Iyengar wrote:
> spi: sun6i: Add dual read support for the H616
> 
> The H616 SPI controllers support dual and quad transfers but bind
> through the H3 fallback. Patch 1 lets the binding allow those bus
> widths for the H616, patch 2 enables dual reads in the driver.
> 
> Developed with Claude (Anthropic), which wrote the code and the commit
> messages. I reviewed them and tested on an Orange Pi Zero2.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/2] spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI for the H616
      https://git.kernel.org/broonie/spi/c/b4d26b2d6b61
[2/2] spi: sun6i: Add dual read support for the H616
      https://git.kernel.org/broonie/spi/c/908db9a4ca30

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


