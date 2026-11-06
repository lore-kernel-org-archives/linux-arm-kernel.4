Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6161606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FeraOWlk;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q25wOIXK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JLgjZ0MjFD0gcNhr8kplmVGc16m3SOIboxAq1B73rYA=; b=FeraOWlk8uu3xP
	RL9N62v2fX/MgRgTNMC6XMx/4FbgJ43YtxzQ9l2+dzJ1bjttfeo1gaBsBQ9hvQv2t6kCckWOTpWjH
	l/o5v/cuCyl+kZSJYeP1bFaTmojUp3DiUSthpQofOadeYrCW30O8w1neAVnAqLitqfy0aa8EYc0nC
	d6RdPYPVv3rZs6cH5rQyZZTCwCNupz3rINnM+NYmoknxcuz6AuPb8dzOjgTjWJWQIOqbc2vG0puTL
	GTJ17ULfv2A9nXXMBrrxjW2h4pWmk92QgvNdiiK8/oh685RYJzt72q8nc0UX99FYo29IpUX1+vid1
	O6cTJeVSKcx3EwABEtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOqV-0000000DQ2M-4AJM;
	Fri, 06 Nov 2026 18:39:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOqU-0000000DQ23-348X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:39:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F029E60145;
	Fri,  6 Nov 2026 18:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB191F0089F;
	Fri,  6 Nov 2026 18:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990365;
	bh=JLgjZ0MjFD0gcNhr8kplmVGc16m3SOIboxAq1B73rYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q25wOIXKmzioC+Da3PBO0rQaylwf8rIoE7/ZlRL73aaVaaBvrOEVwRqKTSmlvuliv
	 6EsBD/080i7BMtIq6HrHDjOhnL+n5gJiQYfBy8a89raj5JLNmTGWPC6xkUn67rORkE
	 MGRxfZZa4ubxu5UMM7kRtLhQFIzHYMyT2zLxjCeOZIDT0hTcGRTfEYOZvsIy7jIV+S
	 JZViFr1JR+ZFulSqEuatjt6+nvFQREa6vrwNoM/cCHo6fzbC/eMEdcGQlQNqNHmwxS
	 EMbwKF0K9uHAn4pSXd3YwH8SEoTvh7MqsZS3TNGNwGdJvV/sB13P0qHiH9lZt60s55
	 NOoG0Yb82FN+g==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id D35B328D1020;
	Fri, 06 Nov 2026 18:39:23 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260602113136.49494-1-phucduc.bui@gmail.com>
References: <20260602113136.49494-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2] ASoC: sunxi: sun50i-dmic: Reorder clock enable
 sequence
Message-Id: <179397725282.3231166.8283157647826593719.b4-ty@b4>
Date: Fri, 06 Nov 2026 15:00:52 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yQjjetjtLV9VTAhhJNfE6e0bY5qQQ7dcNlDBWzZd1Mg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeyd3e7fHohMTD0pfMum91vrlszJlwo9rpmGim569FN
 +5VbPz3vaOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQAT4Shn+F/xyVDn+dWVudPZ
 k9WeL8uXaPxeeuCK1+2jjefn3Pt8ksOT4Z9x1wLBjbW2T2LzVE3XPjpUXxp3xMQlarr6/Jd/n5v
 qyPECAA==
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

On Tue, 02 Jun 2026 18:31:36 +0700, phucduc.bui@gmail.com wrote:
> ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence
      https://git.kernel.org/broonie/sound/c/86778727e320

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


