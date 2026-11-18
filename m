Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12900606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 03:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c7kj5hgW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=en1D0uBC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nxw3T6hIiyrliHjAIUAtUnPcNMPfg3kcXV8A3vdG7MQ=; b=c7kj5hgWAr4J8e
	GQ0u+QaNswdRlSvM7YI38RLciizceFRoe+l3dSfSI1CTup/abAkuJ+fwBB2py8iYseLszPQE+h9hG
	6i50jUUQ7/A9LZ1lIbFFSVOkYg15kQl9t78VuY1nVZU6Z23ASejzAv3STbm9Kvoqo0Lc5ER8o3K4i
	GRw5Jtp4/6xUtT+SJJ6nHvrHCY8U9rhO2mWJN3tOIVnbKhgriXfyvZuZGN381V+4GA9ai7j5VRfSx
	uM7u8/EeAqsKn3fqxLpIRhB/ppp7OzBiWClTPkdY+mgzbBut0YJa33ZwTuaoz3VPT3fZuQ3qhiqh9
	EKN0Oa7/XoYs8y6JePSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVu5-00000007a6X-2gk6;
	Wed, 18 Nov 2026 03:00:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVu4-00000007a6R-0Ey6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 03:00:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14189618D7;
	Wed, 18 Nov 2026 03:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4641F000C4;
	Wed, 18 Nov 2026 03:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794970806;
	bh=nxw3T6hIiyrliHjAIUAtUnPcNMPfg3kcXV8A3vdG7MQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=en1D0uBC01DCLbTYgyzEy15JLNWkhpp3JeKaP08htwXR6RsSGmnok+L7B+zvO9BEu
	 M5cv7/Bh005CER+hzdom7cAemdgX7TWGC22UwsAFY7vrA9AC1r3sQjrIWB3ZkLbZQ4
	 mrTJCaAcv4/QgVwtVgoj26GKngxRiiEZq6tAkdzPB3R7dy/C2vPCpbFmJlDVQyxfYM
	 yWVvRfIbcnHgNRTZfATI+KAILfN6eceDv6rtsmDX18fVEfZXqzaCChuczkHQY1eryO
	 nA0YKeXBpcicjdZmP89bCJFb91I+WPU8soYudxoKzaPO6aROS3FfHEypO3jZfzeudE
	 NvNIhDzjqnKRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43F4392E981;
	Wed, 18 Nov 2026 03:00:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] net: sparx5/lan969x: fix RX ring stall on frames
 from inactive ports
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179497080553.1433107.371747421258981777.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 03:00:05 +0000
References: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
In-Reply-To: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, memoriaru@foxmail.com, netdev@vger.kernel.org,
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 10:56:03 +0100 you wrote:
> On Sparx5 and lan969x, a received frame whose source port does not map
> to an active port is never consumed from the FDMA RX ring: the NAPI poll
> stops on it, and finds the same DB again on every following poll.
> 
> Patch 1 fixes Sparx5, where the same skb grows on every poll until
> skb_over_panic().
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: sparx5: fix RX ring stall on frames from inactive ports
    https://git.kernel.org/netdev/net/c/81d2cf1c6d56
  - [net,2/2] net: lan969x: fix RX ring stall on frames from inactive ports
    https://git.kernel.org/netdev/net/c/1a47bc214d00

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



