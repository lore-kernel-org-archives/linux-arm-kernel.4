Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0CE606D816
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 14:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hv3nad3+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1IRyn2/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RPPlRfAa8q8m8kCH4uT5obJP/Uf1/VTGNGMMDfFCbMQ=; b=hv3nad3+dq0E4C
	vfV8zwYiTdFFbfgc1V30O4mISJpd4PD+aKbW9+Ocvg5Llhv26UhZwXtueVahnLjA8ShslYAO0/lcZ
	1c2ieuxSL7IRUajcgktQIw3riZ7Py/mZjtOTsf97MF8rOmyaC/8vILwO3RvC93+ROTEGVjL100tVe
	qNqpzYlS4qMHRH2A3FNFd5hO8sZeMv1nXtiFwpZIz/RnK2Bh/F7mB+gZMQbUdv/jMom9eJF757Nss
	Gc1aYn7MV5ltpG9EqCZTLNB77rqLdcFfnz8+HE2SggIs498QDvUsYd0RTmgy7fhYMK3NpydbOcxwN
	kGZmprwHxvsqOxXIQySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhBZ-0000000EnrY-12P8;
	Sat, 07 Nov 2026 14:14:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhBV-0000000Enqc-2ddu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 14:14:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55E2D43D60;
	Sat,  7 Nov 2026 14:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C741F0089F;
	Sat,  7 Nov 2026 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060861;
	bh=RPPlRfAa8q8m8kCH4uT5obJP/Uf1/VTGNGMMDfFCbMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=f1IRyn2/Dk6JQfdqfRFHHDKQGpk1hoxJ7mMklxxgAGoXuepM3aaQwhHCJPPBTZyjY
	 YZCbYosjuNx9EDZ+KdOsRvOwC3ENGERUNG+/kL3CSgAGJbfWXXN+wK/QeCzH+vWn1L
	 6zuwWQrxM+JzLEVPupOA7tqs98h/VwqfHQsLBm5t7HcsHyrNSYuunJrTt5b36WroZ3
	 CIiXkaxIIb1AnrmvBKTq+d/tShMiVh/RX+Fo5i0zu/WKmn7KbdfDYLw1pQF7iGBOLk
	 R4Mf5NyOVd4hZ/NkXJb4HNcaLWhb2Q+tAo4ULKfprXH1ZVotTjZeA5FvFlS/6ZbhiA
	 6sf4KXWxSAxGw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id DBE0F29E6B03;
	Sat, 07 Nov 2026 14:14:17 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Joao Schim <joao@schimsalabim.eu>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Jiale Yao <yaojiale02@163.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20261028050626.133421-1-yaojiale02@163.com>
References: <20261028050626.133421-1-yaojiale02@163.com>
Subject: Re: [PATCH] ASoC: sunxi: sun50i-dmic: resume device for control
 access
Message-Id: <179405379422.3424803.12187103513130159217.b4-ty@b4>
Date: Sat, 07 Nov 2026 12:16:34 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Gu1jY485f4IoGWid9OKwTb1mv5ZWsLOBY84mmSMNKrE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeG1kmymo8l2CKLdzRIesYnnZH6qabygPdQB+zUwUPZ
 i/MVGbvKGVhEONikBVTZInL4n5ZX/J6Dd/BhW0wc1iZQIYwcHEKwES8Ghn+uwsysivcezXhK0vs
 yai2pyp1nlECsz9Xs23uVtjXLdRXxMjwT42Jb1YKx4ydCdu/C5RftOu0twy0EFym42kkENs9iYs
 dAA==
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

On Wed, 28 Oct 2026 13:06:26 +0800, Jiale Yao wrote:
> ASoC: sunxi: sun50i-dmic: resume device for control access

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sunxi: sun50i-dmic: resume device for control access
      https://git.kernel.org/broonie/sound/c/73ade6a51c79

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


