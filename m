Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01557606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1PaXUZ4H;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X3TTtCYE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2ETb1QafyRI6/oHfjDrfqCfUkUUni7k0hQ6WfP0vU/8=; b=1PaXUZ4HxXXa5N
	1qm0x9geIzuz6YKJb5BYu0hQWel+0BStMZXOJfnB8UjWs7ghCHhSlnkhk4q2IO+eoKu+imOzW7GTk
	mf4uhmSWfrwDSB0Bifq8gfQtTaZ5PfKl8XXpliUeXVP9b7Xl/D0Ml3pZ8PVrUxqLtbVx880fU4xvK
	pLRKLlIt294MxGcb9RLvuYj6NTm38KXJlv2wPz2U+/GmJExuscHBnN9bZr59Js2e04p+FGI06Ev9W
	CegCdAzhPu6l/KzEuqKc2lO6ztKCJZRe16RBUF7Lq0D+YGpAdRL3nyWVExZtwqZ2n4H2TjtE4oOk0
	swuHFxfA+5IUOF5M0k7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtzv-0000000Fm2e-0ciQ;
	Fri, 27 Nov 2026 11:20:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtzt-0000000Fm2Q-46rW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:20:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 345DD61B56;
	Fri, 27 Nov 2026 11:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7A91F000C1;
	Fri, 27 Nov 2026 11:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778408;
	bh=2ETb1QafyRI6/oHfjDrfqCfUkUUni7k0hQ6WfP0vU/8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=X3TTtCYEl/CNkWbszOL2/NTMFsJu73ACHXYum+HEh6WIPYXMg2ynyTzq+I8Cd4qOY
	 EOzIRa8w69HfAYLkkI22528BwZDYPEZvCdnWgzsrYySdtZSMd9BFPNHFdllshGY7Xl
	 0v+M0Ox7zmAQ8C610RyONIuZrWe4GrJgdJowCy+mF0zjfRZekmSS44aEeJ2OARFZ+V
	 fHoygLNWwMA5lI9B0pCf8Q5ocEYgCESOKLWFzT8kIZmq1CeI2Mu18Lp+5kngfoC5XL
	 pWGMUb9NdIhocvWFxtw0sBuV8KG7ogq2vvaAwBafk4pO7FE/HIyKMfWSfOEalQ1MDA
	 yBLOwW8BM+bkQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 717AB38003E0;
	Fri, 27 Nov 2026 11:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 net-next 0/9] net: dsa: netc: add PTP support for NETC
 switch
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179577840725.924205.8910316217595010398.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2026 11:20:07 +0000
References: <20261119030534.1892935-1-wei.fang@oss.nxp.com>
In-Reply-To: <20261119030534.1892935-1-wei.fang@oss.nxp.com>
To: Wei Fang (OSS) <wei.fang@oss.nxp.com>
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 richardcochran@gmail.com, linusw@kernel.org, linux@armlinux.org.uk,
 wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 19 Nov 2026 11:05:25 +0800 you wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> This patch set adds PTP timestamping support to the NETC switch, so that
> the switch ports can be used for IEEE 1588 PTP synchronization.
> 
> The NETC switch has no time registers of its own and instead shares the
> PTP time of the NETC Timer, which is a separate PCIe function driven by
> its own driver. The first 3 patches prepare the Timer driver for this
> role: tidy up its 64-bit register access, drop an ineffective reset, and
> export netc_timer_get_current_time() so the switch driver can read the
> current PTP time across the driver boundary in a race-free way.
> 
> [...]

Here is the summary with links:
  - [v8,net-next,1/9] ptp: netc: use ioread64_lo_hi/iowrite64_lo_hi for 64-bit register access
    https://git.kernel.org/netdev/net-next/c/1f1bfb52b44b
  - [v8,net-next,2/9] ptp: netc: remove unnecessary pcie_flr() call in probe
    https://git.kernel.org/netdev/net-next/c/0dd839917efe
  - [v8,net-next,3/9] ptp: netc: export netc_timer_get_current_time() for cross-driver use
    https://git.kernel.org/netdev/net-next/c/9b844ef56d60
  - [v8,net-next,4/9] net: dsa: netc: tie setup resources and reset to DSA setup/teardown
    https://git.kernel.org/netdev/net-next/c/f320f1e55e65
  - [v8,net-next,5/9] net: dsa: netc: use entry ID instead of pointer to track host flood rule
    https://git.kernel.org/netdev/net-next/c/bc6680acf83a
  - [v8,net-next,6/9] net: dsa: netc: check return value of ntmp_ipft_delete_entry()
    https://git.kernel.org/netdev/net-next/c/585b422eaa71
  - [v8,net-next,7/9] net: dsa: netc: enable ingress port filtering lookup by default
    https://git.kernel.org/netdev/net-next/c/26b51309ef3d
  - [v8,net-next,8/9] net: dsa: netc: add PTP two-step timestamping support
    https://git.kernel.org/netdev/net-next/c/d2c3f304034e
  - [v8,net-next,9/9] net: dsa: netc: add PTP one-step timestamping support
    https://git.kernel.org/netdev/net-next/c/8b5aba6d328e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



