Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601C0606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bqsyNmKe;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZ/dM1u6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D744codKNdjWB0cIKo4OC/V775hatd/33THb99xe3yY=; b=bqsyNmKejq5k3D
	jjjBiBenRVw+c2IH5iAhBtQtITm0kMn+6ljFySJijZSHQrz73XR0k2aILKpoKESozTeu0VUeDwoo3
	TkHoCxedYWDo6q+F4GDo1dQHo8sJbTjTT6Mk3nEqxYnBeoisbOzgaGUp1igO0HjZqswHl+QA5P/80
	i1PLXbPYEkim8kO1dCjI4jAmUeRFwxTm/VUYGUoaQ8BwhjzUWGtpRFo8OwbNwk3xrZWwBIjvAfEOi
	eSjGInZsoW34jf4PTdzUSxe5Nxsh00mbNFST8tHhlmLXB3MD1zPxA82r69uJXpdorBL+qFbSSwB6U
	gCAiBSS97RXbBEx79S5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5wS-000000048r4-1whP;
	Mon, 16 Nov 2026 23:16:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5wR-000000048qj-3YUa;
	Mon, 16 Nov 2026 23:16:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8995E40ACA;
	Mon, 16 Nov 2026 23:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43E11F000C4;
	Mon, 16 Nov 2026 23:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794871011;
	bh=D744codKNdjWB0cIKo4OC/V775hatd/33THb99xe3yY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IZ/dM1u68/w4ysDuF2c/9CTIYBd8/rFn5rCBuddDvWtSTc4jm3uO+TCFPOfimXYSz
	 t8JmCxAfr+W425w+VYBo9mBMQMa/YxwMecLbewFm6yXjEZp+OAjE5TlqPKwTE8nc8K
	 +gkYfojo8Jk+EN8F2g01KQ8p8kyXahhMagLjnu401xUHol7LTWXQ8cjPuGg8cF3QKv
	 K9ast/IxtW9TP+dTJ5mp1g6c0Q3YuVPr80OKJlP5VfYwqzZgnwL78gks74c2qSO3s0
	 J/i9DphSXgS62lUxieCZv/CS1km+yTO6GNrBDVt4ndV2QIPzVvG/zbemvxwFbFpndZ
	 o3Uf7zZ1pyuFA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
References: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
Subject: Re: [PATCH v2] ASoC: meson: aiu-fifo: prevent sleeping when
 spinlock is held
Message-Id: <179485994155.2504946.8052884083469699014.b4-ty@b4>
Date: Mon, 16 Nov 2026 20:12:21 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YoWPz3fhDSUGPyw/AXIX0PwVKHHA0Y9uh1d/YQgfCLQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+993bumy3uZLDM+M/qUWzL133LQhcMW93+QKdmB1TF
 i7eJL74XUcpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAm4iDC8FfmtI6mlqnJ1wX7
 Z01zdc73m8ehtmeF0TS9Fb33LhxLPVrC8N8n8ECJcFeYUdvV2R0zrzWoheWauH9dt2bpb6nn9Xm
 rZJkA
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

On Fri, 13 Nov 2026 14:56:34 +0100, Valerio Setti wrote:
> ASoC: meson: aiu-fifo: prevent sleeping when spinlock is held

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is held
      https://git.kernel.org/broonie/sound/c/0d40a91ca56e

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


