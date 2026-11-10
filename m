Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A78860A2627
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RE7wfduN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhkHfCvf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H2zQQpARwnq+vf+Mp/QmtkzAppeZMOu3L3E13bjdY2s=; b=RE7wfduNTxof1S
	l+dkRlD5boCQYspAqMgYIqEhRsInK22YOHUkkT7Yz0wG5aFeAs0LvDginI1rSQCFa83OTl4sTSQJO
	Dw6Qy+k7wG0ngSIFnDgrK1Hur/xIMcFV7ub13QBZV3vDpqQUFUBsOERBF7kEAWxP4/Z/BXXSXYy8k
	7mPw6us46iTIUWtOnq45U9Bp2tX/UWzSQB2KuIMhoq8ld3aINUncpisxuw4fwuNTWeBXQNHajmgxU
	w2/KWQJROBgA7TY+TA1eKoAMYLUz8qhf2S8UCMx3vBkMdz277nGkU6K8Jy0LMy8VoNAhJSP7KDzvp
	s6fKAcHm6COkm0wVsJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtZe-000000054XR-0u1V;
	Tue, 10 Nov 2026 21:40:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtZc-000000054Wx-1iYR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:40:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 78D65605C5;
	Tue, 10 Nov 2026 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6D91F008A2;
	Tue, 10 Nov 2026 21:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794346811;
	bh=H2zQQpARwnq+vf+Mp/QmtkzAppeZMOu3L3E13bjdY2s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BhkHfCvfglc88Qqknr2GUZoSd5jv5susrcb7l38IO2bokVDGoppYczf/JdDgJjxR4
	 q+xalbY2wRfo6Yd9LI9PKWjapVtcO2Lx7Y5Fo4XYHK5CNM2Zwa20QZ9nJOtNWAMMyW
	 uuRsM+/RVWDlClNbzqlxDQAlRg1ufIpCdA1qBwaX0q8VZ3BD0fWnSTebvGvCZLVxAU
	 fNgRIPwB6wK2yWHN8oqp0vh56yj+I/nziHGIEuDK1weCmcWWAJ8v1PVyVELkvd58Kb
	 hDns6136/i7IWM9+qY95EVK6JwwuV0KoCRmFHyb617kHVtnEqnve41M88AcfMXYHmT
	 CmYr0onmNL0qA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 210D439E8A40;
	Tue, 10 Nov 2026 21:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: stmmac: rebuild VLAN priority steering when
 filters change
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179434680967.71955.2289215330785245096.git-patchwork-notify@kernel.org>
Date: Tue, 10 Nov 2026 21:40:09 +0000
References: <20261104-submit-stmmac-vlan-prio-v1-v2-1-6cfc71e636ad@gmail.com>
In-Reply-To: <20261104-submit-stmmac-vlan-prio-v1-v2-1-6cfc71e636ad@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 piotrwejman90@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
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

On Wed, 04 Nov 2026 11:51:41 -0700 you wrote:
> The RX queue priority callbacks preserve previously assigned priorities.
> Passing zero from tc_del_vlan_flow() therefore leaves the deleted rule's
> priority mapped to its RX queue. Clearing the whole queue instead would
> also remove priorities belonging to other installed rules.
> 
> Save each VLAN rule's priority and rebuild the complete per-queue masks
> after insertion and deletion, starting from the platform assignments.
> Resolve overlapping platform masks with the same last-queue-wins ordering
> used during initialization.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: rebuild VLAN priority steering when filters change
    https://git.kernel.org/netdev/net-next/c/edf10f5c2513

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



