Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DB6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=05Q4LXFV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLszMzLw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dQm7LikkEBfw+B+30vtpusJDOLGfvvT4vrOt4kNA/ro=; b=05Q4LXFVnpdPfj
	UgCRQXHOYSP8mrL4H6dLtLJe0xYgOVQXE19hlcmfyiB6jKrbBoqz1aTfjRqJiej9AWgFOkUw7kfVT
	LQrSEIiXA4XOXemU/U8CTcH/5sfsKv3jmYuLn2wry8F2vur2nI1L1k9eJUFkDcEC0Y1NiNgaknGQ0
	3SYJ3vwN00DfVuewcPcHzAMKVI3cbAN1BuJB6HnUuhohFEgAvVmRoiL1RAuVixC9xGGYG2pOIIU3S
	RvBtXsxFlzXOizyNH1E3x9k0REm0xCBAM9/xbTDDjiv6agxBrF5LhdcyZx8DyV1XFpalTpUO6JMrw
	YAtygD3gMEqo+5O/fqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNXJ-0000000Bh3b-2ROQ;
	Thu, 26 Nov 2026 00:40:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNX0-0000000Bgxm-1XWX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:40:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CAC0E620DE;
	Thu, 26 Nov 2026 00:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA541F000C6;
	Thu, 26 Nov 2026 00:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653609;
	bh=dQm7LikkEBfw+B+30vtpusJDOLGfvvT4vrOt4kNA/ro=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=MLszMzLw+jzjvra04ywRzp1QJWuOntXAHvCjzCxa1FBbYR8paD1DpYZmVkCy0tc5t
	 NlG2gcGOyVqA3RIfIEM+zaLu76C1Dkh/WcCYlALdDyIxA7iijjM7IrmJn/reFdELcC
	 XuWTwtjulRB0Q/Do96Yt9NvXESAHj4cIvxla0d8uc1KwOvdWVV/0Z5Jzinq231oH2+
	 fiiNi54+LGPwIw76rWl/l9OHAW4FEwKe95YTAZbI3m+ItG78954SegDAUuRR8xcY04
	 RJI6DMiHFyseI80WPu2m4xHHAq8EuXMaOTATc3IHK4PRdBdorgSMY6gNGe6ombmyvZ
	 LU4Dejv7shBHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7750E3809A24;
	Thu, 26 Nov 2026 00:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: stmmac: dwmac-sun8i: enable Flow
 Control
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179565360801.1416723.7797795365715043690.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 00:40:08 +0000
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, willemb@google.com,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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
by Willem de Bruijn <willemb@google.com>:

On Sun, 22 Nov 2026 15:49:22 +0100 you wrote:
> While running the "ethtool -t" selftests on H2+ (orangepi zero), the
> Flow Control selftests consistently fails.
> 
> I originally blamed that on the fact that the board was connected to a
> peer that didn't support Pause and that we didn't negotiate Pause at all.
> 
> The ethtool selftest are sensitive to what the Peer advertises even
> though this is a full loopback test, but it is what it is :(
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: dwmac-sun8i: allow controlling TX and RX flow control separately
    https://git.kernel.org/netdev/net-next/c/1e38a237abdf
  - [net-next,2/3] net: stmmac: dwmac-sun8i: emit pause frames when the RX FIFO fills
    https://git.kernel.org/netdev/net-next/c/22fc89783468
  - [net-next,3/3] net: stmmac: dwmac-sun8i: configure the pause time for TX flow control
    https://git.kernel.org/netdev/net-next/c/24276dd35154

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



