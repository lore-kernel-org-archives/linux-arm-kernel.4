Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C86606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OCL0rqUN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIVfpXmh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TEZpFpmffuQgsA7wHSJ9KvqILxRMLO1TQcfZqtrUdh4=; b=OCL0rqUN6E47hC
	tXipz6d5a4okXdhwV1ecexcNdIb+JBN4H9IdfajZNMhsCGnJXTIIzmMfoV+g7tk4zkfMe/YUOCYWF
	YIO5wdCu9w4tjaDEkm7dj7GTjW/qqNLUtu+TwbaXSnn4YxTBDCyq6q1TLTf69gxepopWFbAWO2qEU
	WXDKePCqyf5itEBl0+d4uWSntBd/NmGy1YoQxCPZ2lcV7OBAgeQ90qqY/N2zDoQ1J3TlL40pta55S
	7fSjRsYiGR30yXMLiWqFl2CAwyy2ZLgxWPRc60O9izhqjHrCbc9c1G3L7QAVOu94O+lAVj4+WpvyL
	CWgQBR6uVvKYKIR4pmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGzC-00000007zcO-2wxi;
	Wed, 11 Nov 2026 22:40:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGzB-00000007zcD-2BTQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:40:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E21B404B8;
	Wed, 11 Nov 2026 22:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C641F00A05;
	Wed, 11 Nov 2026 22:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436808;
	bh=TEZpFpmffuQgsA7wHSJ9KvqILxRMLO1TQcfZqtrUdh4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VIVfpXmhJUD7IubH5EEoQ8qr/rmNnAzCk8A6zI51ixsYfPkrXvpaj6m29W7c5jiGD
	 a0rEC8u8SNRb3D6X+POh5EcgmzUfq/k04uNd5lArAuY9/odZtW6kuLtiQEC6Af04Va
	 fQ+/njH4QOccgDyvlwoYrRBASdIB8QddWoG6BE/yVWytxSKp4InpcZpx+IttPSWLFB
	 KC/ZqZjwBFI4CfjqRgK6QDmjDOlFuWLyXZaKBySjva34fCszKNi/HZU/cEyNeN2eVk
	 PN8kTUOMuN45nj7O1XXOEv2eGZcuCBH5zleaqJX8R8Mi3rhe/igM72TTMTnG4oz118
	 og1BMVfihdU+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D81C4391AFAA;
	Wed, 11 Nov 2026 22:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/5] net: sparx5: add tc matchall port policer
 offload
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179443680768.1682529.11013685548418051653.git-patchwork-notify@kernel.org>
Date: Wed, 11 Nov 2026 22:40:07 +0000
References: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-0-b45a3a26bed5@microchip.com>
In-Reply-To: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-0-b45a3a26bed5@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, robert.marko@sartura.hr,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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

On Thu, 5 Nov 2026 14:19:34 +0100 you wrote:
> This series adds offload of tc matchall filters with a police action to
> the ingress port policers of Sparx5 and lan969x, which are both served
> by the sparx5 driver.
> 
> In hardware, each ingress port has four single-rate leaky bucket
> policers. A policer drops the frames that exceed its rate and burst.
> The four policers of a port share the pass and drop statistics counters
> of the port.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/5] net: sparx5: Drop redundant POL_ prefix from POL_UPD_INT_CFG
    https://git.kernel.org/netdev/net-next/c/de6c6d0fe1a2
  - [net-next,v3,2/5] net: sparx5: Add registers used by the port policer
    https://git.kernel.org/netdev/net-next/c/08543a66f15a
  - [net-next,v3,3/5] net: sparx5: Track shared tc blocks and per-port policer state
    https://git.kernel.org/netdev/net-next/c/54d7dad1a3bb
  - [net-next,v3,4/5] net: sparx5: Add hardware programming for the port policer
    https://git.kernel.org/netdev/net-next/c/b18f7b93e0f7
  - [net-next,v3,5/5] net: sparx5: Offload tc port policers via matchall
    https://git.kernel.org/netdev/net-next/c/a53151fbbcd6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



