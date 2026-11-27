Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D468F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lIdm/GCl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2aXDSzV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7dqHBm/FTiAyvk5ZYqiwe2yYETVzuAeppZiw/mS/tFw=; b=lIdm/GCltoJ1MV
	sLfyhLSOhpIDPs94BFwRD9bBn9xAN+jjQJjG4Som79Ha4xJi/GPabM4qMrALj+IcduPTwFR996V2K
	5xs2x8J8OMpKsLRu4FuOh7CutqW1Tj0Hn0L7vhboEitQqu0w3tuDr6vOADJed35Z9AF8G+uDLOB93
	J507oqI+7w/RXgu0DKIp3HH/edAk6S7pnUpZ/8Fci9fE3LptolxE2FpacK+itmhMuR+T+zPEqVL/s
	KmKERpK9LqPrwH2m/1NFb1odtxFVEP9KA2Raif4LVniVLLkRXZ98U3yZJn2NLG4yH7aXXwgkynhH5
	W3z5ScrRbSYc07Ez5sLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtNB-0000000FdF8-2zZZ;
	Fri, 27 Nov 2026 10:40:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtNA-0000000FdEw-1IkN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:40:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F352627C7;
	Fri, 27 Nov 2026 10:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015A81F00897;
	Fri, 27 Nov 2026 10:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776007;
	bh=7dqHBm/FTiAyvk5ZYqiwe2yYETVzuAeppZiw/mS/tFw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=b2aXDSzV+z80x7l7HjkCwIkMnKryyUlBGgkj8BB58kU7/J7aOrkqk5kgPF1Zgae94
	 S6gEaUb2Jf8rG+54LkP3Pvtup/7DIyzvbomsiwIeeiP++fPcHR1yD+5qKpcT8htFSq
	 wn/zy1Vl2pNla5tFjFyzTsD0RCg99Lb+SfaomoufEacs/n1+1q7Cbu//ZTc9xXnGD0
	 j7yicXNjwSOE58gkl0EoRnsILBvJtlnbuSS+PAMDIl1wJQrwI7TcEg6ir2dFjI9AdE
	 H4fM751ZEhLPPV+0702ywQhdqhr1VuvFD6R5ekE6HJ5UXTfbsDVB2tYUntl/5L6v/E
	 kMXyULfhEWrHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB85C38003C5;
	Fri, 27 Nov 2026 10:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: sparx5/lan969x: only check the DSM calendar on
 sparx5
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179577600550.905521.3058207882449579825.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2026 10:40:05 +0000
References: <20261123-lan969x-dsm-calendar-check-v1-1-0891cf3f4259@microchip.com>
In-Reply-To: <20261123-lan969x-dsm-calendar-check-v1-1-0891cf3f4259@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
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
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 23 Nov 2026 16:01:29 +0100 you wrote:
> sparx5_config_dsm_calendar() calculates the DSM calendar of each taxi
> and checks it with sparx5_dsm_calendar_check(), which compares the slot
> distances of each device against data->avg_dist[]. Only
> sparx5_dsm_calendar_calc() fills in avg_dist[].
> 
> Before this patch, the check also runs on lan969x, where avg_dist[]
> stays 0. Any device with two or more slots, e.g. a 10G port sharing a
> taxi with four 1G ports, fails the check, and the switch fails to probe.
> 
> [...]

Here is the summary with links:
  - [net] net: sparx5/lan969x: only check the DSM calendar on sparx5
    https://git.kernel.org/netdev/net/c/cc02d3b82669

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



