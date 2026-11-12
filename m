Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F2B6070ED6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0APCeF0Y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hRnyO6Gb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XqxvGKuVPssJZSZRPlK7a+uKuLMjgN9I+a+B7IeQ4+I=; b=0APCeF0YXrSNGn
	ZrM+9Nm6QHeaOjzut1I1sTw6R55u7sDaN0cQjA2E7w7L60m4LYTaaXnDBuqNqVU5iDja1o/zSiEUk
	+Pe7tdpU6WqAr+dUfPvDuRLZaNQPqtMduBSjB19Duv3Gw2lBYr6e0bROkdCvH3/G785uDNkiGTvBJ
	waa8b6RBXulnqoxqs7vgR/siSZzNnJRlOkxaLMZhWQuWbzElDKanb2eDOIAIEZw3ljZuZbIecOqpz
	8Rl219uDPj9eA6gO6N5FulHleuzSUse3+NyAYpYTZ5tJXPmrj3bRhe4bKds7Hwj4l+m+Ugr11OLst
	coVBq30aZef6P18QKqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYmP-0000000AmYF-3RyT;
	Thu, 12 Nov 2026 17:40:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYmO-0000000AmY8-1q8F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:40:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 31359455CA;
	Thu, 12 Nov 2026 17:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8521F000C7;
	Thu, 12 Nov 2026 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794505208;
	bh=XqxvGKuVPssJZSZRPlK7a+uKuLMjgN9I+a+B7IeQ4+I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hRnyO6Gbz3V9n+cZRavTV1Msfpts/Rlk+bsAuKFYyQBLZfhacsutiQ0lYMdlZS+RF
	 72e1Bve9i/LCOVhhmiNFRtearJ1NABZN/FmiuLhuyhHefhbzymMBc/NKy9ohFb55Jx
	 2QtK29idhBjafdj1d2KXOF+CZ1smJ0nDg/5JPatfWNSpcaeD/OiPpLOwYZ1ngqL0Yp
	 AY03QsF0j9U1WYjyudE3ukEbMyLFLiElwdi1jhR5OEUvwxbnQOxVapuod3F2PHw7zq
	 5hJtk3iVAWXQzOzTRGlrvrJ3Baf7Reo95wWNWZfUXjRcmFtNdknLRPREbu8GZgk/Cs
	 Dl1xNs3EsxxMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1527380AA78;
	Thu, 12 Nov 2026 17:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net 0/4] net: ti: icssg: Fix device_node handling in
 prueth_probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179450520678.558080.4368477021495049038.git-patchwork-notify@kernel.org>
Date: Thu, 12 Nov 2026 17:40:06 +0000
References: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261110064118.1138-1-laixiangwu@cmss.chinamobile.com>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com,
 rogerq@kernel.org, jan.kiszka@siemens.com, diogo.ivo@siemens.com,
 haokexin@gmail.com, horms@kernel.org, linux-arm-kernel@lists.infradead.org,
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Nov 2026 14:41:13 +0800 you wrote:
> Hello,
> 
> This series fixes the device_node handling in prueth_probe() of both
> ICSSG drivers.
> 
> Patches 1 and 2, carried over from v1 unchanged, fix a device_node
> refcount leak on the "ti,mii-g-rt" and "ti,mii-rt" syscon lookup
> failure paths. Patches 3 and 4 fix the port scan loop that is shared
> by both drivers: a port whose reg property cannot be read is skipped
> instead of being routed based on the uninitialized value, the node
> reference is taken only for a port that is actually accepted so an
> out-of-range reg value no longer leaks it, duplicate reg values are
> rejected, which is what the existing "port0 and port1 can't have
> same reg" check intended but never caught, and that unreachable
> check is dropped.
> 
> [...]

Here is the summary with links:
  - [v2,net,1/4] net: ti: icssg-prueth: Fix device_node refcount leak in prueth_probe()
    https://git.kernel.org/netdev/net-next/c/562687bb3da5
  - [v2,net,2/4] net: ti: icssg-prueth-sr1: Fix device_node refcount leak in prueth_probe()
    https://git.kernel.org/netdev/net-next/c/17d181b3789d
  - [v2,net,3/4] net: ti: icssg-prueth: Fix port scan issues in prueth_probe()
    https://git.kernel.org/netdev/net-next/c/677ad7add2fe
  - [v2,net,4/4] net: ti: icssg-prueth-sr1: Fix port scan issues in prueth_probe()
    https://git.kernel.org/netdev/net-next/c/e74ec6f501bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



