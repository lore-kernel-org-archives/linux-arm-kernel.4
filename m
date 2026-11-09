Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB83606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 21:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VbObbLc9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJE843tZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IeL20zffwri2QEDJY4S8vD79Aj6Kzet8Q6gkziCyfEI=; b=VbObbLc9cE0T9l
	3j5XbjRTRej6aOQh+2lLarPai0iCSJMCyEwRvzdjzfaED5A7D/bdS2/8MoUxDMgtPqur09AgHn510
	cbjDKoHieIwEpBdf/h47ZjV55wUdBWCTSDnLwg5x57CN0OMjcDcjrZ1W9alMB2sNvzrz095VtbjLR
	O6pDDh1C6mciGZEDYaWkW+mOpsqoHi+TjrWnJITqz1iYugrafQchwZv+YWHFY+yDT05Wx72hPDC56
	2CWcoUAY3tnbqsuZy3ztXZ1t1lk7Dq6ioTomUNc/OjWXpFZHrspaIYaQQi18/E6rSFBj+QS5p4v7R
	N/G85gmTLkbSlJpSaZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWt8-00000001liu-3Q9Z;
	Mon, 09 Nov 2026 21:26:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWt4-00000001lgB-46Z3;
	Mon, 09 Nov 2026 21:26:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55D3845A53;
	Mon,  9 Nov 2026 21:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BF21F00906;
	Mon,  9 Nov 2026 21:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794259606;
	bh=IeL20zffwri2QEDJY4S8vD79Aj6Kzet8Q6gkziCyfEI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TJE843tZMJvDkZkZhzeFMq7/WzZ2ynMba7QxPwSHivmYkbarlQTo5KItiqeEc2k0p
	 udFUN+U07fO9+WrHHqg+dtHxiXmggEZKE6ALV6HPs/GLa2XayOSyyhTRYSAcU0z+rf
	 Hnmdw3BkT41PwyO9U5cPu5UX9gvd/6Z06z07ckrpk30k3G/OHObgyH7g8uJU/+X5KD
	 cUO2w33HslzPuTT+1fbz14H5KKowu8IFG1eJj4wJDS9VlJPjXa0ppCUmWRr8PcGCia
	 5oLywuD3V6NrsseuIomYdUWC7yc65xPUYyy9jyBUnmNCgo15rlJW9VZjEg87ZKbB51
	 RohhXsfG6J09w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id AD2C83021AF7;
	Mon, 09 Nov 2026 21:26:32 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: jbrunet@baylibre.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Jude Gyimah <jude.gyimah87@gmail.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, 
 martin.blumenstingl@googlemail.com, linux-sound@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: meson: fix missing REGMAP_MMIO
 dependencies
Message-Id: <179424961953.3711751.2485850214120950980.b4-ty@b4>
Date: Mon, 09 Nov 2026 18:40:19 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703; i=broonie@kernel.org;
 h=from:subject:message-id; bh=scQ/NZ7UXcdBK6jHeXkafGF4axf0CmZWt+PDuXO6Y38=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+WXXsii9b+2z6OU22tW4s/7teGs9908busUvKOj79/
 cwvdxS9O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRW0sZ/hmoF4jft13BuGaD
 Usft6Rxn+D3zpPUmtc+sd593sSNH/D8jQ2PStxgjn5g3uxa3Hq8vWRH4f06Jjs7GL8muwgeVZkq
 d4QMA
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

On Mon, 09 Nov 2026 16:41:16 +0100, Jude Gyimah wrote:
> ASoC: meson: fix missing REGMAP_MMIO dependencies
> 
> Each of these drivers can be built into vmlinux while the code
> providing a symbol it calls is a module, which fails to link.  The
> same shape in 4 drivers, so they are here as one series.
> 
> Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: meson: aiu: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/cc2f13940cee
[2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/12d753e6ca1d
[3/4] ASoC: meson: axg-spdifin: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/4603b51f1dad
[4/4] ASoC: meson: axg-spdifout: select REGMAP_MMIO
      https://git.kernel.org/broonie/sound/c/10ac156211d2

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


