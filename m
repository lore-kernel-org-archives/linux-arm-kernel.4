Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447A1606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ooXikNal;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OYqINeJE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vm/22rXzQM17elB9kgIgwFIHAgus38vU4r9AveaQCjs=; b=ooXikNal+3l+pU
	VLFNpheUg+lyKc2jR8jESkwpWNaDcSOy7NnvmU/OUhF1zFmsX3STqQdLpIbKmJ3hN3gMPCM+I8NiD
	AfwVGJ0ysKN29P6JVGU9ohXzdflFUInXJnKAgK3qPyYnGBNC1lG5VhZqVVcpddg+629G4jk6XIf8F
	W9pSKkwk9by5wpRjTHdYPqYaZL2Zu7lMa1yL49fafb2/rLFX4x+0z+3A/TPe97S1blaRnJvauOPRr
	3BargB1oO2WoGP1fiPPHszZR2HWse17TRttrubBunxYTCHDjpuCmaiM6vojjQT7fq8C8M7rOZ0eOV
	6yxn8pGAFxDXB4PplVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNXJ-0000000Bh32-1OFF;
	Thu, 26 Nov 2026 00:40:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNWy-0000000Bgxe-2urU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:40:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A49C42AE6;
	Thu, 26 Nov 2026 00:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DD11F000C4;
	Thu, 26 Nov 2026 00:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653608;
	bh=vm/22rXzQM17elB9kgIgwFIHAgus38vU4r9AveaQCjs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OYqINeJE5ulIsGN5z6fy6i6zkucHpvIvITZm16JZLZtyGC9xyOKtvmA8CqyKRld56
	 IhQ2NPxOLQi3YpazTjzrEKknS/rJbE6meROanu+IYmeqVq6mmCtAMGSP1WDL/J1KiL
	 ZHeCBaMG0Jau/cqIbNwh7hw0TRkVmc/GlGwLBgcLopaXB6hC+xZrwCPOe6bYMAae9b
	 T343yPKnAa1K+bynlpBVf/a0dZSSjjfZYwXqm9LncgjhPOxTRB2KghcoFntN4eTOEX
	 RUrdB5WuX9sDIDkglq4/CWKEGS0kiizbDAbDV4z0HFMKWVq2qViAzeVFrjjrOFDwBo
	 /q6sbu7i9JZlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14DC3809A24;
	Thu, 26 Nov 2026 00:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/9] net: sparx5/lan969x: add support for
 changing the MTU
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179565360677.1416723.16277992235721163795.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 00:40:06 +0000
References: <20261120-sparx5-mtu-change-v3-0-55c272fe1acc@microchip.com>
In-Reply-To: <20261120-sparx5-mtu-change-v3-0-55c272fe1acc@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robert.marko@sartura.hr, horatiu.vultur@microchip.com,
 jensemil.schulzostergaard@microchip.com, horms@kernel.org
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

On Fri, 20 Nov 2026 12:56:57 +0100 you wrote:
> This series adds support for changing the MTU on Sparx5 and lan969x.
> 
> Currently, there is no ndo_change_mtu callback, and the MAC maximum
> frame length, the FDMA buffers, the queue watermarks and the TAS guard
> band are all fixed for a 1518 byte frame. This series makes them follow
> the MTU, and sets the maximum MTU from the 14000 byte frame limit of the
> MACs. As the FDMA is shared by all ports, new buffers are allocated
> while the FDMA keeps running, and the FDMA is only stopped briefly to
> replace them. Details are in the commits.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/9] net: sparx5/lan969x: stop the FDMA channels properly
    https://git.kernel.org/netdev/net-next/c/0198a175917a
  - [net-next,v3,2/9] net: sparx5/lan969x: free the FDMA buffers on init errors and deinit
    https://git.kernel.org/netdev/net-next/c/74dc2d0d4706
  - [net-next,v3,3/9] net: sparx5/lan969x: add a helper for setting the MAC max frame length
    https://git.kernel.org/netdev/net-next/c/ff9afebc9cb1
  - [net-next,v3,4/9] net: sparx5/lan969x: pass the FDMA rings to the init and alloc functions
    https://git.kernel.org/netdev/net-next/c/91df1aa502b1
  - [net-next,v3,5/9] net: sparx5/lan969x: size the FDMA buffers from the port MTUs
    https://git.kernel.org/netdev/net-next/c/3a13261eaf43
  - [net-next,v3,6/9] net: sparx5/lan969x: add support for resizing the FDMA buffers
    https://git.kernel.org/netdev/net-next/c/c18f9b51d8fe
  - [net-next,v3,7/9] net: sparx5/lan969x: scale the queue watermarks with the MTU
    https://git.kernel.org/netdev/net-next/c/c634ae1440b7
  - [net-next,v3,8/9] net: sparx5/lan969x: scale the TAS guard band with the MTU
    https://git.kernel.org/netdev/net-next/c/f86caad45529
  - [net-next,v3,9/9] net: sparx5/lan969x: add support for changing the MTU
    https://git.kernel.org/netdev/net-next/c/a1334b92fb6b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



