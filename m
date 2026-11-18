Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E51D606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 02:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iSJp4G9I;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hKILQxMm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rysQnyo3q2q1PCSB5zwI+CF9MYiqYHtXoPwnkzo0XVs=; b=iSJp4G9IIWK6+3
	W0kQd2slLfmisTZbWSXcuILB8lYQ3KoltB90GgrCOBdTHvxEIFQQEzWs+9/vooB3BKv4relL4su58
	U0xT1h3DbmLSJikylMLPE9Pidhzh+bOwsZCc28mptUyZRu3WFmYhdWVNyn5GNoUbitUvINy1VKRQI
	XrMRli9c9vJd/7vcTArw33KZ4LbvuO6BcDk6rCX4fFpFFK2oXYTUvBit7QZZlB7GZAG2IO3VPptmC
	IsxnDm7qAamEz52IDDLsrnWyBa9XFoha2XJqI8RXDx1cNMvos5h8ksvjJo69AkSLmScT4YiSzAx0D
	bMEEdFYXI+Y9Nssr0jng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUy3-00000007V7m-0naF;
	Wed, 18 Nov 2026 02:00:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUy1-00000007V7Y-0sAR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 02:00:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3316341684;
	Wed, 18 Nov 2026 02:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5371F000C4;
	Wed, 18 Nov 2026 02:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794967208;
	bh=rysQnyo3q2q1PCSB5zwI+CF9MYiqYHtXoPwnkzo0XVs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hKILQxMmbL6IeQNW2Gh+AJLNiaRgwPTb4uEKnMxgqzGhzZBGKAo+0/11wqAkQr76E
	 VkhmGiaWNWICew/29sChe9irFbze6kvie9BDTlaJhQsSj6mAYb5uyIW5yr1GvoxNiv
	 uZ7ontFdoMX3HLQbtsfZlo4R366jjUOgfyQqdx28sEq0D75yhv1L2fRC3ljrf91hNn
	 jqKe3gtTlkeyUBVoPIbXxRgdkId+8Hx4g/RiyWcrhUIDReYhZR94wvwsYZ6wUsSGcp
	 K8NvgGg1kwKevzeA9DVgj3M/Zi3nHd8OMrQrWKMPnrU9D5bljkvaJoR2H0V94hxfPO
	 7c2+Y4zXAjD1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1470392B1FF;
	Wed, 18 Nov 2026 02:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: re-enable on-chip parity checkers for
 XGMAC
 ASP 0x2
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179496720653.1405006.4159910100773001022.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 02:00:06 +0000
References: <20261114015554.2187341-1-zxyan0222@gmail.com>
In-Reply-To: <20261114015554.2187341-1-zxyan0222@gmail.com>
To: zhu xin <zxyan0222@gmail.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, horms@kernel.org,
 0x1207@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 14 Nov 2026 09:55:54 +0800 you wrote:
> Commit 669a55560e4b ("net: stmmac: Check more MAC HW features for XGMAC
> Core 3.20") made dwxgmac3_safety_feat_config() bail out early for
> asp == 0x2, assuming that configuration has no parity protection.
> 
> Per the DWC_xgmac databook, the ASP field of MAC_HW_Feature3 selects:
> 
>   0x1 (AS_EPPE):  all automotive safety features, with ECC and parity
>                   ports on the external application interface
>   0x2 (AS_NEPPE): all automotive safety features, without ECC or
>                   parity ports on the external application interface
>   0x3 (AS_PPE):   all automotive safety features, with parity ports
>                   on the external application interface
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: re-enable on-chip parity checkers for XGMAC ASP 0x2
    https://git.kernel.org/netdev/net/c/9c9863f9b9f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



