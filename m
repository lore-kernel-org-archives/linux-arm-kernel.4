Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB64B606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+yqQkVQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kmjlBZil
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uNCx6F0Jb50sazmOSgNSIQP2RpHDiNerOJw/r/EpMcg=; b=I+yqQkVQIUHsZn
	r0gbDO6ZlFXx2vVb8nri63FbQLQdNNAN5tmYjPGXFpeG8L0Yr4P78bQPpEUVNHyWM3D3nGvnc4EF4
	KebvNzdROTRCG/ik2ygBbTZcTL8Nk8KUQrIPf7D+GQSmkeuwFS+WwvVKB1+xV7aGe3wQOLPSQ2IIl
	xoQgVsdP9XQJkOndZ3w7Ak0CKaoe4oaytNXdPlng98sA6Fnb1YhtYOuKX6kmOHC3qu09Eb/ZmRQdz
	qrsaedAs1ZhdW3dhI+jG2BQ3iwfomip9i6UBmVeRbzpiH7apqhoBty+pL0wk18hGPPd8H+s11sR+b
	oHyaoPYOjRsEv2CkFlKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEq8-0000000AKWT-4A1n;
	Wed, 25 Nov 2026 15:23:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEq7-0000000AKWB-0sOP;
	Wed, 25 Nov 2026 15:23:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 968B240558;
	Wed, 25 Nov 2026 15:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8461F000C6;
	Wed, 25 Nov 2026 15:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620198;
	bh=uNCx6F0Jb50sazmOSgNSIQP2RpHDiNerOJw/r/EpMcg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kmjlBZilBpRLesFyxaHfvlpUsDA53eQMDbSrz0P5ZoSpdl/WEy3QIQPTICnYOLInQ
	 oh0SDdImWewF5vAnS6h/1R7v0rfpdZLX1cpM1S0j+j2R3FCcTSZ6P/7i1b2JBiWDmZ
	 2ATK8TqMSw7z9EvU9exJyjwr+K5MQIAlFC2qJePcdeSVIxtbt4I9KU2+I1jhSp/6I7
	 TATbxIyWdoVJTXeZvhJjDBIy244Nfei/nf65YxGZQUx8BFulyeGYbjBbHGDS6uyykP
	 1don6BG/kIeEzHyZHru26XxDbLlMvpIjF2lOZM5G6u0qmis7rEm9VIxRNBc2atGSG6
	 e5WfeSuLYNECQ==
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de, 
 Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
In-Reply-To: <20261119135808.2377849-1-heiko@sntech.de>
References: <20261119135808.2377849-1-heiko@sntech.de>
Subject: Re: [PATCH v4 0/6] spi: Implement a atomic transfer as a last
 resort
Message-Id: <179554960286.947306.16162137377244301666.b4-ty@b4>
Date: Tue, 24 Nov 2026 19:46:42 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BkRnoZ6dXxdejugLnRSwCT4+Gvx/LKOaQRRGFM8oQfc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZ/ia3cWf/26wj2uthZiV6J1rtcaB7mNXy9W5T2ef6b
 14pEyvTUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIn8eMTwP/qcmtKhyz6ydh5J
 Oxv3rrSeez77sqFy64Sfwb+u7TTfbczI8Kl+Yqxpl590/dcLH5+cmpHFzcSieltc7lz3jhTTutC
 rbAA=
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

On Thu, 19 Nov 2026 14:58:02 +0100, Heiko Stuebner wrote:
> spi: Implement a atomic transfer as a last resort
> 
> SPI devices at times are used as PMICs including a power-controller
> functionality that should turn off a system.
> 
> This happens in an atomic context very late during the shutdown, where
> no interrupts are available anymore and conflicts with the asynchronous
> nature of the SPI subsystem.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.5

Thanks!

[1/6] spi: Allow spi_toggle_csgpiod() to get called from atomic contexts
      https://git.kernel.org/broonie/spi/c/bf7dd2bcdb4b
[2/6] spi: Allow spi_delay_exec() to be used from atomic contexts
      https://git.kernel.org/broonie/spi/c/3a54ec9ea89f
[3/6] spi: Export spi_set_cs() function
      https://git.kernel.org/broonie/spi/c/a26e42ee67cb
[4/6] spi: Add infrastructure for atomic sync transfers
      https://git.kernel.org/broonie/spi/c/4ab1c64f3f04
[5/6] spi: rockchip: Fix runtime resume error handling
      https://git.kernel.org/broonie/spi/c/2aa087742af9
[6/6] spi: rockchip: Add an atomic transfer function
      https://git.kernel.org/broonie/spi/c/324d55c0103c

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


