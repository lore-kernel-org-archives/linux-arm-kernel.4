Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F37606A6B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DZ401gop;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dHtiqf+m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Up2cFk5w62BEtco6hx3g7yToc/DUMq6gy1VzglFX7TU=; b=DZ401gopA6Qgcn
	4ZIVcqKlR/yh952cDSWYauX37ax/26CaQL+PawrFCMUhnTkppq106aj7PhWgsGhrqujFwzNYDxzPH
	X+W6ZtPshLd8T3Uk+V2uXXGZoSS4mNBzTDcqMjkZM0/wrClv91q3kuzaxs6smnDodEmI3f/4IUvFI
	OyIGJcdCfUsgQ24m1Q6/k6cUmZXJzalbg7ItYnXE5xEG7DA42LxTZ7xmWflUUyzda8e6O7Jf6n6TM
	HE3ylPN5fusUVCb9+od+Wt2PWCM+WQyIdTCGxQ4KnsK3k+N2zLcXbFTX/9Em7SoHIeddCU4Hg/68k
	l3rd0gcgVdi79Kdw6fyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZIx-0000000GYK8-1ZTd;
	Sat, 21 Nov 2026 00:50:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZIw-0000000GYJx-1cts
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:50:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 227CB4476E;
	Sat, 21 Nov 2026 00:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069FE1F000CA;
	Sat, 21 Nov 2026 00:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795222210;
	bh=Up2cFk5w62BEtco6hx3g7yToc/DUMq6gy1VzglFX7TU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dHtiqf+mc0oc/6z5VIN5xiSZW7BsVHlo8E2p2RbE60CTmgqhXX5gBuUehkFWOPenO
	 9MPPLZ1khDHR49A/ZPvhH1FL2FZQmWq7gkXcUdT14gIXVOwpCk4TcrrhkfvgHkfunV
	 djbDLlHo93OMEmfr8EQPV+fLsUXiBE8OLgYSuQgsYLFXzQxI6svc6LFjgr3otzfwiA
	 5yynzkWm3NQTibmX1qNENlXgYnyuK9Qyui04zW2TzkHfcTvkTzN8SBt9dYteeIxugQ
	 KWoDJU7TSvofB0JfuBNk5aCdtLkfEAOgU8aAab5wlskN81ucyH38Jdvd3TvszguF0M
	 rgpfikQM1so7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1526380AA4D;
	Sat, 21 Nov 2026 00:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from
 the descriptor
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179522220852.862800.14468159947649215133.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 00:50:08 +0000
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 ovidiu.panait.rb@renesas.com, recv.jo@gmail.com,
 muhammad.nazim.amirul.nazle.asmade@altera.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 17:21:34 +0100 you wrote:
> Stmmac's double VLAN handling hasn't been working great for a while,
> it's been recently reworked for dwmac4 by Ovidiu Panait. In that work,
> it was found that the tag stripping hardcodes the 8021Q tag type for
> XGMAC while stripping the tag, while the IP actually reports the outer
> tag type in the descriptor.
> 
> The tag type can be one of 6 different values (note inner/outer is
> reversed in the macro names):
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: xgmac: Report the VLAN tag type from the descriptor
    https://git.kernel.org/netdev/net-next/c/d82b4f3a8a2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



