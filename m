Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126BC606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FwcoYPUR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kShyJxs/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mxdgof000Vz5ORJZP+5WXGdU/JvR5z9YICxMThMmF1s=; b=FwcoYPURxPpeP0
	lru5Wf6sdj1jnQrj59LD7ZK5cxtkSnU5Whhd16hz+XWMUcsXz4Zj9jGoncb9is6Ik68rJasvpl3lQ
	vixWopdm/uYjsYy356LMVPPvT9HLTMVo1R127JtRbpXpYpLcu1zYNudOyid6zy9eNokErL1pmh21P
	WmFVUqYUq0CL7TCNKhXTZt85ptRo0vb2ZxpnnaP/wkwLpMNpB/o6jRSoWNw0u1P/VK81xuGUzcAuS
	k+rNffaiavrplFiTV+akRCDwaSVZYsUPZ0osidc5ERtP7C2kkohFxQDeMTTrMg2kBq5ot1Diy6qyE
	eW1ESpOfOar3pdOGoejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJjE-00000006221-29B4;
	Tue, 17 Nov 2026 14:00:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJjD-0000000621r-31U3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:00:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6654043B8C;
	Tue, 17 Nov 2026 14:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EC21F000C4;
	Tue, 17 Nov 2026 14:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924007;
	bh=mxdgof000Vz5ORJZP+5WXGdU/JvR5z9YICxMThMmF1s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kShyJxs/EqUlHzDNT15IHiB1HqUG1go8Y3siT2kTz/CrBJXG+gUCyd9qK0sM3oFY0
	 w231hLSonV/VIoO19sGVJnxxC7lZ2u9d2AjDEhAEgzfcc69QB0c1GUSoHWahkLP6zt
	 JFjk2/Ag/vo7Eq1xEXxKB85S5e8rE6os8K4CaLUkpUxN8K9DzF6oSkqr+Dr5/Qbff/
	 +4nCKW9mtoNSriRUT1hMPUYgPsuVAuMLcjjlLV4iGYznZaAzuhE4r+R0/vZNDBv3n9
	 p7k8JiTPyBOzrY5ALBB7phMDp6lyiM5fzVS2khjnjvpdTZ8oY+NZInwjc2U8G20/vz
	 +O+lOxRTl4Glg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A385392704C;
	Tue, 17 Nov 2026 14:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/4] net: lan969x: skew the core clock by 200 ppm
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179492400607.603902.8524686313704472023.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 14:00:06 +0000
References: <20261113-lan969x-core-skew-v1-0-b9b02b863d38@microchip.com>
In-Reply-To: <20261113-lan969x-core-skew-v1-0-b9b02b863d38@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 Steen.Hegelund@microchip.com, p.zabel@pengutronix.de,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 13 Nov 2026 11:19:39 +0100 you wrote:
> At its 328.125 MHz default, the lan969x core clock is too close to the
> line clock frequencies for the high accuracy phase detectors to work as
> intended, which degrades PTP accuracy. The core clock should therefore
> be skewed about 200 ppm up. The PTP time of day (TOD) increment is
> already set up for the skewed rate, but the driver leaves the core PLL
> at its default, so the TOD and the clock that drives the scheduler run
> 200 ppm apart.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] net: lan969x: add the core PLL registers
    https://git.kernel.org/netdev/net-next/c/5f8d69a43e72
  - [net-next,2/4] net: sparx5/lan969x: enable the switch core after clock setup
    https://git.kernel.org/netdev/net-next/c/ae590854818f
  - [net-next,3/4] net: lan969x: configure the core PLL
    https://git.kernel.org/netdev/net-next/c/39d5dff49d71
  - [net-next,4/4] net: sparx5/lan969x: scale the nominal TOD increment in adjfine
    https://git.kernel.org/netdev/net-next/c/7e8651f87504

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



