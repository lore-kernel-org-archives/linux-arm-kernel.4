Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0968606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 18:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iahl6Kjs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3csON0n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2EN+tTTIpDfdpX+0xh2EG/Yy+J4hcSlHuMdhAeyfdzM=; b=iahl6KjsuZdd74
	KYMyFAW+w2AKIyPo83yoJpygyrj1/FjVpTz3MtUjqvQzYHPj2sZqS/SoH7xJJDlxOoWcuRtgGtsne
	SImEGHBY11zwHVA+Gy57XDzTjdECUAEuZTKM4nyXWDoc1oaBojw08cNjB/0uh06IV+91mpap4+ydV
	fhfT78nd5bYhNMOaQ3CU/HzyjwnQhLp4Idy6F04IR2LB1xA2d4iRNVa4zqZt7jv2Z0g3+YKTqkdhI
	r45aSImsTWk2+YGCHAZDZRIfscjEuIUbGmi9KKg9OWvFKRfMGN/29IlsSPnOwOgcwokhk7GUT55ke
	P996e0UI5A59IqjrZDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUSQ-00000001V90-3cPs;
	Mon, 09 Nov 2026 18:51:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUSP-00000001V8Z-3OvS;
	Mon, 09 Nov 2026 18:51:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F48641273;
	Mon,  9 Nov 2026 18:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CD11F0089F;
	Mon,  9 Nov 2026 18:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794250265;
	bh=2EN+tTTIpDfdpX+0xh2EG/Yy+J4hcSlHuMdhAeyfdzM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P3csON0n9TTOme8oVPC7d6fbm+/Fo8NQIIi0n3P2pG90etvYPsbHR4NLqvyBGfg5J
	 yL6elRi/RVM4/T7m+XdFbYJw81wRsp3jy1ya8QTHdozwLOL+hDTyuJMPWB8YWLdwJZ
	 5nOEgqmXSGNyyNtskEnM2Z6T269hi7P4uOAiNC7UNEjQ1hv7c/mUC/+6u7RP7erTiZ
	 Lit5rd6OC859L87f/sCFV2uNuQCUg7vcVAP5R6Ui6sknNF5Pu9Z3pidYhXxvg6Yc9J
	 61rTeCMrhOUTzvFNyaqCTyIMQaMn3rFPS1Fg1IruxNDinPCCBKTmYgi+G2BmLCBp7r
	 FVYPv352TxzGw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 0027D2F535B8;
	Mon, 09 Nov 2026 18:50:48 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, shao.mingyin@zte.com.cn
Cc: lgirdwood@gmail.com, heiko@sntech.de, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
 linux-sunxi@lists.linux.dev, kuninori.morimoto.gx@renesas.com, 
 linux-renesas-soc@vger.kernel.org, srini@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn>
References: <20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn>
Subject: Re: [PATCH 0/5] ASoC: fix error-path leaks and a NULL dereference
Message-Id: <179422704338.3711751.5250666353519171392.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:24:03 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d0vv4//pkezbLMeZ5UdIe8F87X35XBtLtvhU5Eo8fAE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+iXE8X3RtX+3aK9OD187eeSyWKYwvYGtQ5KF/qWcUV
 r9RfSv0sqOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATuVbO8L+u9eHMpsfmwt+P
 LnO6NvG7yvWdtdeSTuwVzdmtfnk670k9RoaPgR0vL0alLby+SXr1wcmMpV4CD3qT2l/9ip7Of9P
 xXR4DAA==
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 07 Nov 2026 16:08:15 +0800, shao.mingyin@zte.com.cn wrote:
> ASoC: fix error-path leaks and a NULL dereference
> 
> Five error-path defects in ASoC drivers, found while reviewing against
> linux-next next-20261030.  Four of them leak a reference or a clock, or
> drop one twice, on a path that is easy to miss; the fifth dereferences
> a NULL remote port while parsing an audio graph.  The patches are
> independent and can be reviewed, applied and backported separately.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/5] ASoC: rsnd: fix NULL dereference when remote port has no endpoint
      https://git.kernel.org/broonie/sound/c/ea3277e4a3d9
[2/5] ASoC: wcd9335: fix SLIM interface device double-put on error paths
      https://git.kernel.org/broonie/sound/c/b5aa000ab9f4
[3/5] ASoC: rockchip: rk3399_gru_sound: fix codec node reference leak
      https://git.kernel.org/broonie/sound/c/1ae5920938f2
[4/5] ASoC: sun8i-codec: fix bus clock leak in runtime resume error path
      https://git.kernel.org/broonie/sound/c/a32aac41b8ae
[5/5] ASoC: rsnd: fix SSIU node reference leak in rsnd_dma_of_path
      https://git.kernel.org/broonie/sound/c/e64753959a3e

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


