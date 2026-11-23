Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3A6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i41qgiXB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CZzfTLHC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fJOKPES6EfNRlBk263JdcwhHP4l7tgpc3L2Hnean48g=; b=i41qgiXBHJ/660
	4n98RjxAL60LKoqnOhBljCuojWgxZsb+Psuvd5A3rxNuRHR6ETAdb44lf/I5vWSGVh2e+9OEJNEPZ
	9jYU34dm8+FeRNBcG8g7ZDuhGPVB0XbNQmwYyNgNFKJX/umfZhpsGE1hV8qFiFlG4OARrxWkJf/1m
	X0+9pTmkEezCKIsGo2qsrBITLBFVe+99X515K3KBOoBXZ5TQFn/W5HchLFfJxHm1g/dD4RPSJp4e8
	lkD7Vd5r9962v3d8LxehtY7lBw/qVUVmkHtohnFtX+c4YmZ/v1FWmolfRWOedgrJEhLHxwWz3/vMI
	w3IwT1iOlZApwkMW3Whw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWg0-000000049rP-1Kd3;
	Mon, 23 Nov 2026 16:13:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWfx-000000049qb-3Snv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:13:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EE3A60E8E;
	Mon, 23 Nov 2026 16:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93B31F000C6;
	Mon, 23 Nov 2026 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450432;
	bh=fJOKPES6EfNRlBk263JdcwhHP4l7tgpc3L2Hnean48g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CZzfTLHCTlFoPjfw38gkT+cQtX4XshQDUmiNMjJOJhJapK3QwnYcXN5jkElWTFPxz
	 PYdac8Ih8gCV0CJvwxEpICnnc/pJnxTvsCI4zlHmXN+5WGRrcCgqI10m5ZL7ssj0Zt
	 SMtPr+iOckjkLE5Kh2ya+gBGSfAqkfknBJ3RjeB2O2ZCNzgPXWenYyLdrqDgs1PTYL
	 Z5Ku0Csx7cgSXjLPDGXYj5WGcaTeTO5YBCReUPAtDAPP7Bkzyb4hAkfLGdO0Dd24z8
	 gshhIJF2DLI7XtP4KoD9oWX3Sq59CbJbNsnn1hFOImlmihZzgImP7poHp+9joRX6gz
	 iieYXkIAvttmw==
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
 festevam@gmail.com, nicoleotsuka@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261119075832.50172-1-zhujun2@cmss.chinamobile.com>
References: <20261119075832.50172-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: imx-audmix: Balance SAI node references with
 devres
Message-Id: <179544446306.25092.17878563004182142170.b4-ty@b4>
Date: Mon, 23 Nov 2026 14:34:23 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IjdY+BmDoyMLbbgkDtaHI5ljGDk4FavOF8Hs2Z9fLoU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZ0mzFmDmc/Sa+PjTjfc6puRuYTjX9/FSklilrxapbV
 Bp7+8yZjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzkUxzDL+bdaXXGxkWvmFgl
 NslmCmXEswvKG04u1dr0erbj4gubvjP893fdxfFrxvqLSh6dyRZ8ryr7n63Pv71lEudEIeGD7Rs
 WMgAA
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

On Thu, 19 Nov 2026 15:58:32 +0800, Zhu Jun wrote:
> ASoC: imx-audmix: Balance SAI node references with devres

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: imx-audmix: Balance SAI node references with devres
      https://git.kernel.org/broonie/sound/c/0151278a98ca

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


