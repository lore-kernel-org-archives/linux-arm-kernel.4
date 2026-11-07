Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D8E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dcR3UZrQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NzP8/1yb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bl5cMf5oVLZLpdRHQBsSexs2yAIQ352WYuyU3qzrEtQ=; b=dcR3UZrQVYKWWm
	gynM/hr/01fJTGo1BW71YKSU3OUFiKBCKMo4lQrgIOvkgP5Ikpzi8sP8Lz2oRUI68/LDYecxQ4k06
	2RdSJCRkJCHZKc4c2lfxgjQNXvWOZGJ8lM/M/hYDjV0pUCQVQs1WovTx/UFkradd1FhFcOmEzsCkp
	+XVh5gg1R/wa1g4q0b56GnXRlplbI9TBnLTiv+lQdKnpQBiPRHFWkWsw9FhNwAb4eV7z51dBVO7Ob
	MjISAa2uDIidh1haCJchFKe9Pxiz2A0VAdhnW46NVypTt2GAjxxb/YJx3254K4joEc09MPT69v3o9
	F9I4bByvL+lVfRprj2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0sf-0000000G2Ez-2eFU;
	Sun, 08 Nov 2026 11:16:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0sd-0000000G2Et-2cZo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 11:16:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C131A60D66;
	Sun,  8 Nov 2026 11:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FA01F0089F;
	Sun,  8 Nov 2026 11:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794136570;
	bh=bl5cMf5oVLZLpdRHQBsSexs2yAIQ352WYuyU3qzrEtQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NzP8/1ybPNNC63stC3DucCJWIybl+rq/FQ/wL5OSXq34eU8VNUi+Rr2FmZ+7JDfpX
	 /q/h3GIWv+KGMvni/3YslSsUuSYNA/bibl2oyyk25mDhu1zGypHExPBRsmRdeSKKTL
	 C18jQdxNPnk4rcbgg3dgiGVaAtX+zWTP/fDn1IVBV3mKnyLEHhFnZTsnVRy5DVXoqF
	 49smLFhWnF/AWJAkAtP3j97FssR/RK3ZBWokBwVe6Ovqtw7fVwHxIIH0Hq1wGQjpYD
	 1rkRaNLGmFi8DQ389fQP2shS1zMTkCF1gDH2WStNKSxNMMbDkCZ7QPE3yaOWAR7MQF
	 s+feziLNjUC/w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 65F052BF8FE7;
	Sun, 08 Nov 2026 11:16:08 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
 joakim.zhang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
References: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
Subject: Re: [PATCH v5 0/4] ASoC: cdns: Add Cadence I2S-SC and I2S-MC
 controller support
Message-Id: <179406285258.3424803.5597609174879659303.b4-ty@b4>
Date: Sat, 07 Nov 2026 14:47:32 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uhrYFssuSak78sxGGNOhK5N5ATA6z/IM+mXG+2w/KbE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+RP6Y7Vrcy+35eMN+5Yr0Z+FStwvjXWa9+trr8fKN+
 k5rnh08HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZgIewnD/1KOl2V769pP+rzl
 jbgo+DjoXkT0lZ+PppcJhInLxM+JFWT4zaZdbNrtv1cuQZm1J8NZX/3Esmydpzqi631kpC/4rJ7
 BBQA=
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

On Fri, 06 Nov 2026 18:52:04 +0800, joakim.zhang@cixtech.com wrote:
> ASoC: cdns: Add Cadence I2S-SC and I2S-MC controller support
> 
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> This series adds support for the Cadence I2S-SC and I2S-MC controllers
> integrated in the CIX SKY1 audio subsystem, together with their DT
> bindings.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
      https://git.kernel.org/broonie/sound/c/5d2a3da8b792
[2/4] ASoC: cdns: Add Cadence I2S-SC controller driver
      https://git.kernel.org/broonie/sound/c/81bb3e5fda49
[3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller
      https://git.kernel.org/broonie/sound/c/fe1cecba2f2a
[4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
      https://git.kernel.org/broonie/sound/c/a6feafc3bbed

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


