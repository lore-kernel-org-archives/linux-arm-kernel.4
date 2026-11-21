Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999BE606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 01:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LZSjdemL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J/4E/bd8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FHj/Zy9VIbTu9QHe6UylXawidw+Q/iF3Pt00xxs1BPo=; b=LZSjdemLrNQvEY
	p0JdhrWnNJ8RIjKt+/LSai5ZC/3ipYbcCk/81ndp5Erj7+RVU82+j++Q0cumh2DdLPbJ7PYVWwJ8H
	deHqGkEm5UuqWR+nP1naAE/JCt1Iyo0Z9wzWf/cTTdIlYnxY9JTP05ysvG+jWHt5f91bG+/2ZpfaY
	dsCowEM2z/BQahY1p3/1M6348UVFE7dKgceVAfKd70ASbWRSFR0BsxA6ts++Z9ONM8lmvt6QkWG/u
	DdQGax7u4ItW3sAAzSJasL+0ygdvs7mN+W6DxW2scVB15p+R9HWDxkDCxMgxiB22fsMybr5EoaVlf
	WSL9IhU5TWInC+qi0UXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUaFP-0000000GfN2-0Z9N;
	Sat, 21 Nov 2026 01:50:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUaF5-0000000GfGo-05jd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 01:50:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7100D456CC;
	Sat, 21 Nov 2026 01:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068401F000D0;
	Sat, 21 Nov 2026 01:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795225814;
	bh=FHj/Zy9VIbTu9QHe6UylXawidw+Q/iF3Pt00xxs1BPo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=J/4E/bd8Au4OIjhaT6SE0R/7Ov89wx4DvLWNvHIYvgph3V3/jfWJVOe2Xw9palJ2S
	 tKnxYSkwyndOLgx2y19EY2gLpej9kvv9r5c8DwxI3O4o9fzApVg4+jvbcUw3BHk9rn
	 8yi3x9A7egQCCmBsQAwHqEBvlHmQNWTQhks/4bhmc5gO3Pn/dHHmBJn+mB/erefGJq
	 ea3kbuIGOzttHUGv775pD2rQLEnnJiWhjGA/nUZ+KnSlYbIzi6ezPKPzyrWVU2HFeT
	 YRAn0/Fzi2v0QHY2cGxh0gs7IOrTECTVtsI8Dg4NL3i2hf8z32m0XrHDYXEKPxLpYU
	 wYzW1y6u5qang==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1504380AA5E;
	Sat, 21 Nov 2026 01:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: stmmac: Disable checksum insertion for XDP frame
 TX
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179522581252.882976.1234416180646847261.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 01:50:12 +0000
References: <20261116134848.4793-1-jszhang@kernel.org>
In-Reply-To: <20261116134848.4793-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org
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

On Mon, 16 Nov 2026 21:48:48 +0800 you wrote:
> stmmac enables TX checksum insertion for XDP frames whenever the queue
> supports it. XDP frames carry no TX checksum offload request, so this
> can overwrite a checksum already present in the packet.
> 
> dwmac can only do HW checksum for normal particular packets
> layouts, such as TCP, UDP etc. The stmmac_has_ip_ethertype() has
> well demostrated this limitation. Different with normal tx where the
> common stack supplies the skb->ip_summed metadata, XDP path doesn't
> have the necessary metadata. So to make the XDP always work properly
> when transmiting arbitrary Eth frames, dwmac HW csum needs to be
> disabled by default.
> 
> [...]

Here is the summary with links:
  - [v2] net: stmmac: Disable checksum insertion for XDP frame TX
    https://git.kernel.org/netdev/net-next/c/7e7ef57374f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



