Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9652E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 00:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WLqf2z/7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a5sDloga
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Pulm5x7G4dTnPOGRPvkWjRQBu0sc7WIEs/VaZ0XqfGQ=; b=WLqf2z/7eYRFrn
	RgVsUgcUvc4pMdPNPPlEFgzCQb5CMd88g/4t3GsvyQFCHy5XyuQ5z4xl+/c6maZ2fwY/en2xBkA7B
	wcmw8/ZMe0elr39EHZWt+tO8WW7pyuj60cm2jEV+S41oB/irTPYl6AyWpg1YC22O8Cvl86kBpD1iH
	4OaQouaqTHXbcZIMJsHTr9t4LfcWC46D17uO0hD9OhFG3EEadArRAuH1Gf3kQn8h1k7aJqN7Q/FS7
	gN6OsZbjWI1Uuy0eBv14B1ZwPXn0kJyH8EisHt4MQJgjFrwx8kay0Lkdy5VkxM8ZVxCXPs/0weXsu
	nWBzgSCS37q6vTkd5Lew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIrK-00000008Gcc-1y9X;
	Thu, 12 Nov 2026 00:40:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIrJ-00000008GcC-0a8P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 00:40:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F67E60F36;
	Thu, 12 Nov 2026 00:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1331F00A05;
	Thu, 12 Nov 2026 00:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794444008;
	bh=Pulm5x7G4dTnPOGRPvkWjRQBu0sc7WIEs/VaZ0XqfGQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=a5sDloga3by4UHoc0i01LyT1JanaR19dPLmAaL/0p+1sskYrJU7Tpc5rcNkCm0C/A
	 2m3el+NB+fEdMypU7JBJWFSklVBA6/RkMcmZRnooGbKbuQsyZkkKYXEo1MJfHJBgPA
	 DyB9bqAmyBdy93YbZuKKclRCjfKEMwTtcNlDuWw+RHAZfhVLTsit2u619V8af3HARN
	 EJzApFAHin0VecpHPP16+JmerZOAKRPA57kisVt/ybHN29BeAljDZ3T0cITv2JpzbV
	 bUsGblHe3FlDBU6vZEDU8KMVnIwGQ5aT7rKIF0591mbNTEa+1QsvpyPSq6ckRx0jAY
	 heMgLge6PqIqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 211BA391AFCA;
	Thu, 12 Nov 2026 00:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6 RESEND 0/4] net: stmmac: fix DMA descriptor
 ring
 cleanup issues
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179444400693.1731667.7461680068493203190.git-patchwork-notify@kernel.org>
Date: Thu, 12 Nov 2026 00:40:06 +0000
References: <20261106090507.1020751-1-dinghui1111@163.com>
In-Reply-To: <20261106090507.1020751-1-dinghui1111@163.com>
To: Ding Hui <dinghui1111@163.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  6 Nov 2026 17:05:02 +0800 you wrote:
> From: Ding Hui <dinghui@lixiang.com>
> 
> Hello,
> 
> This is a resend of v6, originally posted on October 24, 2026,
> when net-next was closed. The four patches are unchanged.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,RESEND,1/4] net: stmmac: guard against NULL pointers when freeing TX/RX buffers
    https://git.kernel.org/netdev/net-next/c/2bfa1143e190
  - [net-next,v6,RESEND,2/4] net: stmmac: clean up partially allocated DMA rings on error
    https://git.kernel.org/netdev/net-next/c/4d5e7a647e3e
  - [net-next,v6,RESEND,3/4] net: stmmac: release descriptor resources through priv->dma_conf on open failure
    (no matching commit)
  - [net-next,v6,RESEND,4/4] net: stmmac: hold RTNL when reading descriptor rings in descriptors_status
    https://git.kernel.org/netdev/net-next/c/241c2a868326

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



