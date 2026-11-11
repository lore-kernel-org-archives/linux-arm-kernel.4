Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D3E60A2609
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 01:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m/Bsc2Xc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmXnS+n3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SPTNYPvwkrprqbuEPvtVawLHaH9MDFVszNUbyTC+uZA=; b=m/Bsc2XcJqM45Q
	g8tsmSLxfMnOfzOu9/GiL5M5nlSrk9buwB8sRhNKtJOw+M7cGwJOHs+8tCwjrqE1pf0EPfTpWjE1U
	OJ/+VYDTTPexEhInIgp1sKs2e0aLzX+joW7QM5ehoRy2b7s44JsDvpjVDWsZnVfCLkcfp2ZprCdba
	RQDAApXl0k+IE/Lyu4wMfeo0DpmwJcOKc9atw0uoE+BQSXvF3aSSTsV06I5+ISTOwHLhtCfO3JZAU
	Lcpf7Zc/tQFFG6RwzuHrH6RGnnj02nsX15kpD+3SmC3EjMeMgXbNKTWq3fruMiGJ5vasuGd/G73RV
	Ms5BS4T31J5E9goyBM5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxA9-00000005Ndc-45fn;
	Wed, 11 Nov 2026 01:30:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxA8-00000005NdU-3eRy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 01:30:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 052BC61183;
	Wed, 11 Nov 2026 01:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A891E1F0089F;
	Wed, 11 Nov 2026 01:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794360606;
	bh=SPTNYPvwkrprqbuEPvtVawLHaH9MDFVszNUbyTC+uZA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NmXnS+n3IVDwNxKKJ5V9afdFDokjBHTG4CEvcTjqLjSPbmA16QbyM4qUqZJH4kWGx
	 wuuDIMHe10E2+kW15qyqHOq68ikQzKQU1BppCkx5QSoj7i/SOPHqu48J9uF9+CNvhk
	 BpXV2UPIq2LispUYGY0+Ded7XC6wjuGtzGawjC+7XEx56aGpI7Fp5HArpgAM9kPM7y
	 wMS6bW6bzMWxji5hV+hx3fEGnKwZxtbZp8ugExV3tUmZqCWaBZUJn0wZGhy4AH1Nzs
	 yqWslI8hLBKdfjBTqFAOu3VOSoLqml+q9yc0XDTnpQSR8nRhs47zFAd0RbM6QnEGl3
	 YuDvaW0fQfMXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B22C380CFE6;
	Wed, 11 Nov 2026 01:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: dwmac-socfpga: Enable multi-IRQ
 when
 per-queue IRQs present
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179436060543.157602.5564991900162840266.git-patchwork-notify@kernel.org>
Date: Wed, 11 Nov 2026 01:30:05 +0000
References: <20261105023245.4683-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
In-Reply-To: <20261105023245.4683-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Nazle@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Asmade@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Muhammad Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 dinguyen@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  4 Nov 2026 18:32:45 -0800 you wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Agilex5 and other SoCFPGA platforms can wire per-DMA-channel TX/RX
> completion interrupts through the GIC as named platform IRQs. The common
> stmmac platform code already parses "tx-queue-N" / "rx-queue-N".
> 
> Follow the same approach as dwmac-s32: if all configured TX and RX queue
> IRQs are present, set STMMAC_FLAG_MULTI_MSI_EN so the existing multi-IRQ
> request path and INTM=1 programming are used. Otherwise keep the single
> macirq path.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwmac-socfpga: Enable multi-IRQ when per-queue IRQs present
    https://git.kernel.org/netdev/net-next/c/79ee9e676872

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



