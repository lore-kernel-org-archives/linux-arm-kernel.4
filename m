Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC553606A8A3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kf2+tRkD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LlDq+DeU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=av1K61twRr3YmYkxqE3loSPySCWqt28yd74ZsgUfme4=; b=Kf2+tRkDFNYH1e
	1DK9BeKSjN5ZImqeFfPVcmcey2Kud7F2LR4IDJes1cgLWMaetaMZ7lGykzIRX0bXVSZ9owRDh4P1L
	O6TJXsSgw5L4n5KOX0rKsu64AIUkKgqesXDXGaLYLwHkkc1cd1Bk7j/2e62ws9z3BhpNvycJDfZ3J
	JD4CoRxIXaafyrlII0G+rktO+XpRim7RYXmWUv6S81IHKI3/dg97qZNcMuEREh6emOJiO8VNoDv4L
	GApMzDtsIbYRXMQdjZPbtaRz5YmKCceidS3bjoy765SNXAxH0yQWC02Z4TBmpP3ZpNWTOd3GBtP14
	Hvx//n36gUP1XTYikzaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1oT-0000000EwGu-2148;
	Sat, 14 Nov 2026 00:40:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1oS-0000000EwG7-231Y;
	Sat, 14 Nov 2026 00:40:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C57061CF9;
	Sat, 14 Nov 2026 00:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437141F000C5;
	Sat, 14 Nov 2026 00:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794616811;
	bh=av1K61twRr3YmYkxqE3loSPySCWqt28yd74ZsgUfme4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LlDq+DeUZiAI+BHUrcyL5l3n7ruZ86Zv03rxJbgLG7XNgBHwZaozunN4+zeWWv38y
	 uFk4AH2sjXAfrI8zYqTFEmHM0U/YbABuHOWvaf/7M2HLE5vCm0rqMkxVa+Iv5Vzxp6
	 H0crPCraQw1k4V5a16UHmh48Y7GzAJwWheOxq0Kz9sj5rzK5VuJiqjQDZ2YddKFvpm
	 RlLHmHiviI2QOyURRZLQHlLqvObxjwisjNgNnAzJINnxFDFr+5Fa7jemjyKMoytIzz
	 xzIm6/QNU99fHuRqqM4JtqqbxjEu2lptaiMSTdqJgEHc3XbAWidNr/0EfnmIW0VZPu
	 SQeP1uctW2XIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3CB380821F;
	Sat, 14 Nov 2026 00:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: dwmac-rk: only read the delays the
 MAC applies
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179461680977.1918448.16146594996456604743.git-patchwork-notify@kernel.org>
Date: Sat, 14 Nov 2026 00:40:09 +0000
References: <20261110-stmmac-dwmac-rk-delays-v1-1-87abb6592921@gmail.com>
In-Reply-To: <20261110-stmmac-dwmac-rk-delays-v1-1-87abb6592921@gmail.com>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: heiko@sntech.de, maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
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

On Tue, 10 Nov 2026 07:13:55 +0000 you wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> The tx_delay and rx_delay properties are only used for the directions in
> which the MAC inserts the RGMII clock delay itself: both for "rgmii",
> TX for "rgmii-rxid" and RX for "rgmii-txid". For "rgmii-id" (the PHY
> adds both delays, the recommended setup) and for RMII they are ignored
> by rk_gmac_powerup().
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwmac-rk: only read the delays the MAC applies
    https://git.kernel.org/netdev/net-next/c/6b8e9712d031

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



