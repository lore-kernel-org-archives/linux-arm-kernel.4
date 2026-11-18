Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F76606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 01:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s8SKwAmL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QahyQvvr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=stKX8v7egk0zZugg0clBzB0g2nXPfMAc1nM463RQGB4=; b=s8SKwAmLe3jv9h
	1yMWqc1DvY8FGvcI9+eEEKLmwltXLpH6EljvL2hptIfJkK+R0JFZlGNub9MxN2eO+ZV0vYURkUR7n
	DeOojLK/3o5W2ue+h2cxR6mSkpmoW+Rai8owwHDAApIv/BWbjDtmgYhpioEwu4QkdRXIc/eGipOLP
	AlpjjZPqrDGA+hWEeBr1jUD/gY3KDM2sKw1ZFxla8DCIkpIEKdLX9Kjzo4pnCL4k2ElE692nVbPii
	mrSfe0OeyMjSwC0aIvUCsumeySJZzHerH8ISBeU+2GdROaBLWrMY6EFkioPDxG3LGb4gDgu+St/Q0
	eW3TDCsZIWLiFPm4eDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTULJ-00000007R2z-37pJ;
	Wed, 18 Nov 2026 01:20:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTULI-00000007R2W-0BxX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 01:20:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C113615A3;
	Wed, 18 Nov 2026 01:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED301F000C5;
	Wed, 18 Nov 2026 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794964806;
	bh=stKX8v7egk0zZugg0clBzB0g2nXPfMAc1nM463RQGB4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QahyQvvrlN7RALoJe9aq16eLMxP9iicXG3Yl12vxxJtUx8KNmd/M6fGueR+YS263A
	 RnQY7q6VA79+3ydrTZkZpdzHFzTpx+iYuuXkhDhP7UcBroDKRnUBTDRXUp5pFE5ZgA
	 SKcpkc3DBjnfMdRvFey4vIID2piRaJLo0v0ClkvIM+hXXiRpx5/17b58gc5Icmed+K
	 7TsALGVCM1vVWahyg5nqssu3SDdehcG/9gjjZcNvyX5ZajyH/dZIaF36lyFNyi2ngW
	 xhDub4R/48lRthEajHIsuFpYe62xpfZBufHsv46L2GfEMjcNN3eNnia0RIsXaSmJkx
	 9T3D7h2xjPA8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43A1392B1FE;
	Wed, 18 Nov 2026 01:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: stmmac: Clear DMA errors for multi-channel
 interrupts
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179496480553.1388923.380362008993952961.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 01:20:05 +0000
References: <20261113103236.2184751-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20261113103236.2184751-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 magnusleatti@kernelriot.com, thomas.petazzoni@bootlin.com,
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 11:32:35 +0100 you wrote:
> The Multi-MSI interrupt handler doesn't clear the DMA error interrupts,
> and this leads to interrupt storms when one of these interrupts starts
> firing :
> 
>  - The RBU (rx buff unav) which triggers under high traffic load
> 
>    This triggers easily with iperf3 and small udp packets, and shows
>    when running the netpoll kselftest
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: Clear DMA errors for multi-channel interrupts
    https://git.kernel.org/netdev/net/c/686b5f47f8cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



