Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366EA606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 00:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LHIOehd+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fA+aN76e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1/9FVMg6kywcce5P8F50oXpupxOmDgZiF5njySBM1es=; b=LHIOehd+ETobsK
	2toTaZCDoPKGj23YmP45xsjjk29KtUPffmFfkv6WgqaAC45Xj4CcxkBNbpWkQZsPg6GKSdpns65Ps
	9ohBpUEQr4jbdKKeSSDRCHkl8Js0vPTwhraE7St+BxqSS7KxQEsSMRJIHk0+Fn8nxVlYKwrGbes3I
	850hgzkcu6kJSD0JTGpO76aZFg/oPaDzbMh5d69bh+2hpMX7mG8D+CU5yyvIgey5WdPIwbgcwwatS
	AZBtYYeI34b5KrumjkvhyxRx2wtgfRP7rh2orswvjKx3hbKGTKjypvbuLCiZ6aKQFWsXxoh5vkMAa
	qjCfQkuzJWAjyttCOLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpZR-0000000AXTM-38ZC;
	Thu, 19 Nov 2026 00:00:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpZP-0000000AXTG-38JN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 00:00:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB8CC61F9D;
	Thu, 19 Nov 2026 00:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F1C1F000C6;
	Thu, 19 Nov 2026 00:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795046406;
	bh=1/9FVMg6kywcce5P8F50oXpupxOmDgZiF5njySBM1es=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fA+aN76eXvZMhSHhMmaricbYXvgI4y198sLkyXqF54ORYmglTp/wE9V/2Q9J85OKD
	 gAY0l4YsEKQtbpzCBnLrf/qSVwv1v6yHIYSma/ad6Jdch8HHTB+N72wU71eso8pvwn
	 omPS9C0HDlhHBRmWsIhhbFhNqHn0uV88TI42f4Aef6jtQMBgWRT+lWRPwGbZKijFEa
	 e1i3ZMmiKZselfoJt6quqfCnesypkmzrB6SNWC8uJuEFksWfX5sfQ/Ch+MYBSpWewz
	 rgSQGWmKOcg0pv6YEVY0tzwnCB3W9+/8BTFuRI/cdAI5hAvbMjfkQ9hBXEgR9A90pQ
	 tkHrwZB9XG6Jw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7730F3808210;
	Thu, 19 Nov 2026 00:00:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: drop the rest of the frame when
 napi_build_skb() fails
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179504640528.2628008.5659141402667774044.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 00:00:05 +0000
References: <20261113-stmmac-rx-skb-fail-v1-1-fcaae89f2d2c@gmail.com>
In-Reply-To: <20261113-stmmac-rx-skb-fail-v1-1-fcaae89f2d2c@gmail.com>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Jose.Abreu@synopsys.com, lorenzo@kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lorenzo.bianconi@oss.qualcomm.com, stable@vger.kernel.org
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

On Fri, 13 Nov 2026 17:13:40 +0000 you wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> If napi_build_skb() fails on the first buffer of a frame that spans
> several descriptors, stmmac_rx() drops that buffer but goes on with the
> next descriptor of the same frame as if a new frame started there. The
> rest of the frame is then passed up the stack as a frame of its own. A
> frame spans several descriptors when it does not fit in the RX buffers
> of one descriptor.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: drop the rest of the frame when napi_build_skb() fails
    https://git.kernel.org/netdev/net/c/ece404eac250

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



