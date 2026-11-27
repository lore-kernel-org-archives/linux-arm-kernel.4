Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E66606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F1jpsM5J;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHom19kF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oGd50g5o08JPxcNGE0WIJIlu9E1Y0uUS2DPxcUBSf60=; b=F1jpsM5JZKBpJn
	ZAIWD8hsViDfX0XLX+e7HSrf+yxCoJudcz9A6qytKrh73D+8D8mumQ5tIji41E/Q3squLnBckTjhD
	Xr+FQ5gccUDl6Aek/kBUJS05xB2sHer8DEWCQnr8dx0qh+VgWzv5Z7DuZLNYdWC/V2kKfVPxRzfSd
	cpeesJmBtaLI+j3m5+F5SaRxIBp3HLe0dHnu6EOURuBT0IASUbKNcdvzCt+NSSoCU9ikylQVw+Yqw
	7KYycgeKCOhdfQyhMQUwBUA7d1unLYdHv6X73pEw+VO9+M+Iv8qfyoZ4t6OvtjPviIiHm3m6VbseP
	zzXHESnA1dQnGMQ2p2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlrf-0000000EnMe-2m8y;
	Fri, 27 Nov 2026 02:39:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlrd-0000000EnMX-2BIa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 02:39:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D511961190;
	Fri, 27 Nov 2026 02:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04AE1F000C1;
	Fri, 27 Nov 2026 02:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795747143;
	bh=oGd50g5o08JPxcNGE0WIJIlu9E1Y0uUS2DPxcUBSf60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VHom19kFh9mS7761/vdL+Jkeb7YmQspR9FrQTkJcnoHYbec4daq38/AAYG5e/pjoC
	 a82gU1ClCudXRW9ugz8yWiV43y4Azpws6cyN1vISiVqyeCMJ9PNBdiTOvqiu3zuJMr
	 l4iq9sZePePxmXbK/WCzE/LrlC2i4qXqzPo7Bbx8OaLNrqvUVIOW4HX8zGTa0sgAFx
	 TE4Cg39YYY01rHdGYNFURdf/nqYHXIe7RGZPLhUSd3YalWDCSZnftqkI+HBMa7SLmN
	 iJb9JKhIiN94BdGuwgiyZ6yfyovWSca/zDyzPvBsvrgBBQOne6aRid55gie44bD1ja
	 +d4u3ejUwXPwQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Manuel Ebner <manuelebnerli@mailbox.org>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261126203039.1777085-2-manuelebnerli@mailbox.org>
References: <20261126203039.1777085-2-manuelebnerli@mailbox.org>
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: fix kernel-doc
Message-Id: <179574323628.838304.16154354505846881981.b4-ty@b4>
Date: Fri, 27 Nov 2026 01:33:56 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aYCkCEky3OrVydiPJIsbcM5fL1XrqTwwc6hTqbmIseQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI53jofNYptM21xz7088UhV6VrfsMKjLMEZ25a2nvwfy
 PDJqsCxo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABPxvs/IsLJz4ZNXqa2Vaq5y
 zl+EP/zY/mOV9MGAO1mGL5PP7BNM+cLIcOzhpf702U++zZuXkqbqs89p+59bWRfdYzX+uy00fBO
 Uyg0A
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026 21:30:39 +0100, Manuel Ebner wrote:
> ASoC: imx-pcm-rpmsg: fix kernel-doc

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: imx-pcm-rpmsg: fix kernel-doc
      https://git.kernel.org/broonie/sound/c/2d69cae40cf6

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


