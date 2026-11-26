Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAEC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jy35eLhk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m86bHrey
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+YqA/EUQPSROfYWDD2Mvnwhj+ldCwxHuIMAYVYFeAJo=; b=Jy35eLhkd0frlV
	gNWMey/ZVx3IFsj4fyK/LGJghP9s37VHLR/slXjolRGeozxWuRpIYO4KnhP4tPrHMHmvJHCuiV/EP
	meJetpV7YSctCN/uwpKEq9SPoAZV+nnmEEjgKA6iMAl/VL2nsQQPQOBj5fTYEpehfbhkCHp7Yz5wF
	8Uj4PCtTHdoPcIzCWr/VL65KyXQkPmFUNNKA4GH8I2vHFFYw2jQIqwFathGTxxQNlR+U7XI8z9WAp
	IDyRMYU7A0qmrZp5gEF1IdJqLHzeypRv+yboPR1t16tzlbAsmhKviSr6zUPfeN1ftFUX8EV68kxai
	Li6Hg2VM7+kec7WQNemg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfuS-0000000ERUK-2FAR;
	Thu, 26 Nov 2026 20:17:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfuQ-0000000ERUD-3aBY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:17:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C52543AF4;
	Thu, 26 Nov 2026 20:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32C91F00895;
	Thu, 26 Nov 2026 20:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795724253;
	bh=+YqA/EUQPSROfYWDD2Mvnwhj+ldCwxHuIMAYVYFeAJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=m86bHreyKf05alTxdTLfpkfpZ4/iohEt/1ajg350dyq1y9g0miHep87fG2nEkyt32
	 Xlvbf++C3rjA8sFUGax3rchbcF6/F4oRnA7ePWnHB1aTIVY+5U5CtkNcHmmyE7q9Dw
	 Hkr72NTQu/YJILk0Z1pLWMh1bXZ2aWbNIccWYCPYjBxglQPh2cDn7YDQUPfWg1aJwe
	 eLbNxStJ2vT1nWHK+9uzWNJ2BmLIrBR+iwS3EjEENj82nBNivaKqdFsU0oTe5uEj/h
	 ZNdehegeXabDpbXFU21ohmQDC+Krjl873lvbirL18IoAzLrOHO6jYDbNo4kTEzrj9a
	 uhBENFISGI9Tw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 shengjiu.wang@oss.nxp.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20261126102528.1531824-1-shengjiu.wang@oss.nxp.com>
References: <20261126102528.1531824-1-shengjiu.wang@oss.nxp.com>
Subject: Re: [PATCH v2] ASoC: SOF: imx8: Switch imx8ulp DSP control to
 reset framework
Message-Id: <179570816156.142532.252987832768462132.b4-ty@b4>
Date: Thu, 26 Nov 2026 15:49:21 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fqUxoi0I4me6jqtgp/a5cIp3cTRehPE5dY23SN1KjSM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5Jt94fGBx/r3sgj8XAo86ee8PPZD0pzWtR/Sk7SflL
 2b/pzqu6ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBELroz/Hefluxa0rXxYdWD
 G1N/FMfLyLecV7ZT+XyzQdTc5cCeRysY/juqZuu6h6gEnXcvvBq5RDp7Ud7Bt6/YBBuPap85pvp
 nAQsA
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

On Thu, 26 Nov 2026 18:25:27 +0800, shengjiu.wang@oss.nxp.com wrote:
> ASoC: SOF: imx8: Switch imx8ulp DSP control to reset framework

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: SOF: imx8: Switch imx8ulp DSP control to reset framework
      https://git.kernel.org/broonie/sound/c/50529c05b08b

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


