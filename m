Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1935F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ycPYaSaG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qak6zpwX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9JDW8BjO8pV2V62+zC72GsPlWIjoxqy4Dkv4PW8Y9/w=; b=ycPYaSaGA/TChr8V2R813SaXQu
	1sI+++ZyVCil1qZLyGrZN3tWGereyiQ9mnsyBF22JpstIyvTPxSKVBShu8+XtJtt/Olnf/ncbrcTG
	uFLkRsr5T6a62qjpxIZzWK2TcZ7FILvopngzyyduQHgRiXerq/W9qDSzEfQG/Y53YUx4Fjj++vhYX
	Mjw+1Cd6dL8QYFRDh93tl+g6qJVtLQ+XJUIZHdkeWpPDAddqeQy0J49OuoVRipkHlRJVp4G/W/lW4
	AFtAwHEh4vrIhgtnvSOT8YxIFNILSpdqN13/x19xqnLJTXIN//qtRLNZYxI8WlYeUyNWYjlSdPFM9
	0M89ogNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVOr-00000003nxf-3oxF;
	Mon, 23 Nov 2026 14:52:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVOj-00000003nvg-2TsP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:52:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 424FA43DC7;
	Mon, 23 Nov 2026 14:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C253E1F000D1;
	Mon, 23 Nov 2026 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445521;
	bh=9JDW8BjO8pV2V62+zC72GsPlWIjoxqy4Dkv4PW8Y9/w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Qak6zpwXQJLL3Kvq6BKWq53jr5EnQT+eXPjt5h9GM9HBjjdLh8vjMyXNOJ3ihQOmR
	 oKSJyZ0ARs+nkqN3CUTDERe7H7uXl1iFvONORXopVNbfNZajlZvSqpoXFRT/vXUFtm
	 4xxzBjadJV/vlVscAEFb1qk8HB+EX5nT3/2mSSQromZXe1m/UKTTqfa0ggEp0y0qnc
	 rxp1gwWEDnxihTYnd7RveF0HylGtogWM7lsHvmO7J9tXjoA1U/fRvz/sr4hx0BjwHI
	 D1CKEUYtXjsoErHwgqloaC9NIIwv+GBnPKFsLgqY3OYk4UzmAmuPzYN0enAOeu4jCh
	 Q2dGMnPGPwkCw==
Subject: Re: [PATCH net-next 2/3] net: stmmac: dwmac-sun8i: emit pause frames
 when the RX FIFO fills
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, willemb@google.com,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Date: Mon, 23 Nov 2026 14:51:59 +0000
Message-ID: <179544551937.3135.9976133356956488963@kernel.org>
In-Reply-To: <20261122144926.284857-3-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-3-maxime.chevallier@bootlin.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Unserialized read-modify-write of EMAC_RX_CTL1 in
  sun8i_dwmac_flow_ctrl() (drivers/net/ethernet/stmicro/stmmac/dwmac-…

--

net: stmmac: dwmac-sun8i: emit pause frames when the RX FIFO fills

This commit sets the RX FIFO flow control thresholds in EMAC_RX_CTL1 from
sun8i_dwmac_flow_ctrl(). With these thresholds, the MAC sends pause
frames when less than 2K is left in the RX FIFO and stops when more than
4K is free. The new bits are set only when TX flow control is requested.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index c63f4d87de509..75c743dfe3483 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c

[ ... ]

> @@ -766,6 +772,17 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
>  		v &= ~EMAC_RX_FLOW_CTL_EN;
>  	writel(v, ioaddr + EMAC_RX_CTL0);
>  
> +	v = readl(ioaddr + EMAC_RX_CTL1);
> +	v &= ~(EMAC_RX_FIFO_FLOW_CTL | EMAC_RX_FLOW_CTL_TH_ACT |
> +	       EMAC_RX_FLOW_CTL_TH_DEACT);
> +	if (fc & FLOW_TX)
> +		v |= EMAC_RX_FIFO_FLOW_CTL |
> +		     FIELD_PREP(EMAC_RX_FLOW_CTL_TH_ACT,
> +				EMAC_RX_FLOW_CTL_TH_2K) |
> +		     FIELD_PREP(EMAC_RX_FLOW_CTL_TH_DEACT,
> +				EMAC_RX_FLOW_CTL_TH_4K);
> +	writel(v, ioaddr + EMAC_RX_CTL1);

[Severity: Medium]
Can this read-modify-write of EMAC_RX_CTL1 race with the RX DMA start and
stop helpers?

EMAC_RX_CTL1 also holds EMAC_RX_DMA_EN and EMAC_RX_DMA_START.
sun8i_dwmac_dma_start_rx() and sun8i_dwmac_dma_stop_rx() update those bits
without a lock:

    v = readl(ioaddr + EMAC_RX_CTL1);
    v &= ~EMAC_RX_DMA_EN;
    writel(v, ioaddr + EMAC_RX_CTL1);

The phylink resolve worker reaches sun8i_dwmac_flow_ctrl() through this
path:

phylink_resolve()
  phylink_link_up()
    stmmac_mac_link_up()
      stmmac_mac_flow_ctrl()
        sun8i_dwmac_flow_ctrl()

That path holds pl->phydev_mutex and pl->state_mutex, but not rtnl.

On the XDP and XSK paths, the DMA start and stop callers hold only rtnl
and never call phylink_stop(). One example:

stmmac_xdp_set_prog()
  stmmac_xdp_release()
    stmmac_stop_all_dma()
    free_dma_desc_resources()

The same applies to stmmac_xdp_open()->stmmac_start_all_dma(), and to
stmmac_disable_rx_queue() and stmmac_enable_rx_queue() during XSK pool
setup.

If a link-up event is handled while an XDP program is being attached or
detached, two interleavings look possible.

In the first, flow_ctrl reads RX_CTL1 while DMA_EN is set. Then
stmmac_xdp_release() clears DMA_EN and frees the RX rings. Finally,
flow_ctrl writes back the stale value, which sets DMA_EN again.

If the sun8i RX DMA resumes on DMA_EN alone, could the hardware then
access the freed descriptors?

In the second, flow_ctrl reads DMA_EN as 0. Then stmmac_xdp_open() or
stmmac_enable_rx_queue() sets DMA_EN | DMA_START, and flow_ctrl writes
DMA_EN back as 0.

Would RX then stay stopped until the interface is reconfigured?

Before this patch, flow_ctrl did not touch EMAC_RX_CTL1, so these writers
could not overlap. Could accesses to this register be serialized, or could
the thresholds be programmed from a path that is already ordered against
DMA start and stop?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122144926.284857-1-maxime.chevallier%40bootlin.com

