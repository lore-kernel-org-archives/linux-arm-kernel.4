Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731AF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 00:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YD8vP5Zf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+zLfT/Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rsXTtReWmAlr2TN0IozOLiOE8/fqHvyQ7TmPrFjU4hU=; b=YD8vP5Zf4oQlS/txOz/Pc52HlK
	tttWhtaGCl6ZYVTWvtR4gMB50NC/8XOAnNx7lTW+Q2Wvoq1F8Shtp9GQaMRikgP8CmPpvzZFvfQL8
	h2KeponnezyfwqkfefdX+jrqMIYwrMcULqmwIrDPAKo6Ub3mVRAmvL4idgPyopziFxs8d91/pW7Qc
	ohHz1IJJruTFyHTZAYYVOWWsBxJpVbwFiqGoIHdwUpDfhCvc6+sM5vKx2oA2yLDTAyWCkoc7afON7
	Tc/ShzcHic8XwwRztF6luS5asWZr1kIkvmwfu9grrQYdcpLhOyxogw7VqT0vh3zwdI197gcdR9w8F
	05ZNKp3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0Zp-000000087yH-0kJH;
	Wed, 25 Nov 2026 00:09:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0Zh-000000087wG-1rpt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 00:09:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD95662387;
	Wed, 25 Nov 2026 00:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F341F000D2;
	Wed, 25 Nov 2026 00:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795565364;
	bh=rsXTtReWmAlr2TN0IozOLiOE8/fqHvyQ7TmPrFjU4hU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D+zLfT/Q5hSPSnYw/mfJZsi2EYa/liVgN0SXBKV9rL/6k6oZlMIUVIelS+5Rc5t9Y
	 NbesPCcZ76ygs4412nrSJ4VbB7XwV0Vu/0joVcaB7VqYC6GvQx0cnhsapXY9z4D6HO
	 nwAw0Qe2OpkyauyOZQt3SXPT7Q7oRoPiDzKQlxlmoHIML2xlZSyu/92URmwCeUhf/9
	 WjRyTGiPlrTGinZchs+ZruPErotwbpJ1RpUgipAuRaPaMgbC2CYm110J/TdhtRVy2O
	 bJIxiU2JSjvS8EC/pVNo9IDeS/v0vb6VZUlnNrEzxXIk/wuFqC4Gjx32i+jtiWwNhF
	 T3kE6XJ3Skfxw==
Subject: Re: [PATCH net-next v2 2/3] net/stmmac/dwxgmac: Extend MTL/DMA
 support to 16 queues
From: netdev-bot+sashiko@kernel.org
To: sagar.cheluvegowda@oss.qualcomm.com
Cc: j.raczynski@samsung.com, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, cs0617.lee@samsung.com,
 k.domagalski@samsung.com, k.tegowski@samsung.com,
 abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com
Date: Wed, 25 Nov 2026 00:09:22 +0000
Message-ID: <179556536283.3135.8042221243416854963@kernel.org>
In-Reply-To: <20261124000415.4067701-3-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261124000415.4067701-3-sagar.cheluvegowda@oss.qualcomm.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] dwxgmac2_tx_queue_prio() in
  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c still only handles…
- [Low] The commit message says "The only caller,
  stmmac_rx_queue_dma_chan_map(), walks the queues below…
- [Low] The commit body of "net/stmmac/dwxgmac: Extend MTL/DMA support to
  16 queues" contains revision history that only makes sense on the…

--

net/stmmac/dwxgmac: Extend MTL/DMA support to 16 queues

This commit extends dwxgmac2_map_mtl_to_dma() to cover 16 MTL/DMA queues.
It adds the XGMAC_MTL_RXQ_DMA_MAP2 and XGMAC_MTL_RXQ_DMA_MAP3 registers
ahead of raising the maximum queue count. Queue indices that are out of
range now trigger a WARN_ON() and return.

> The only caller, stmmac_rx_queue_dma_chan_map(), walks the queues
> below rx_queues_to_use, which the devicetree parser limits to
> MTL_MAX_RX_QUEUES. A queue above 15 is therefore a driver bug, not
> bad input.

[Severity: Low]
Is stmmac_rx_queue_dma_chan_map() really the only caller?
dwxgmac2_rss_configure() in dwxgmac2_core.c also calls
dwxgmac2_map_mtl_to_dma() directly. It does not go through the
stmmac_map_mtl_to_dma() callback:

dwxgmac2_rss_configure() {
    ...
	for (i = 0; i < num_rxq; i++)
		dwxgmac2_map_mtl_to_dma(hw, i, XGMAC_QDDMACH);
    ...
}

Here num_rxq is rx_queues_to_use. That value can also come from ethtool
set_channels, not only from the devicetree parser.

By the end of the series both paths are limited to at most 16 queues, so
the WARN_ON() still can't fire from either one. The reasoning in the
message is what is off, not the behaviour.

Could the commit message mention this second caller, given that the
WARN_ON() justification rests on the single-caller argument?

> bad input. v2 reported it with netdev_err() through hw->priv_data,
> but that back-pointer was only added by v2 1/3, which this series
> replaces, and a log line from a void callback does not stop the
> caller from carrying on. Use WARN_ON() instead: it needs no
> net_device and its backtrace points at the caller.

[Severity: Low]
This isn't a bug, but this text refers to "v2 1/3" and to an
hw->priv_data back-pointer. Neither will exist in the tree once the
patch is merged.

Could the version history go below the --- separator? The technical
reason for WARN_ON() (it needs no net_device and the backtrace points at
the caller) can stay in the message.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index e50c0f4c482d0..8aa69647a207d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -259,9 +259,26 @@ static void dwxgmac2_map_mtl_to_dma(struct mac_device_info *hw, u32 queue,
>  	void __iomem *ioaddr = hw->pcsr;
>  	u32 value, reg;
>  
> -	reg = (queue < 4) ? XGMAC_MTL_RXQ_DMA_MAP0 : XGMAC_MTL_RXQ_DMA_MAP1;
> -	if (queue >= 4)
> +	switch (queue) {
> +	case 0 ... 3:
> +		reg = XGMAC_MTL_RXQ_DMA_MAP0;
> +		break;
> +	case 4 ... 7:
> +		reg = XGMAC_MTL_RXQ_DMA_MAP1;
>  		queue -= 4;
> +		break;
> +	case 8 ... 11:
> +		reg = XGMAC_MTL_RXQ_DMA_MAP2;
> +		queue -= 8;
> +		break;
> +	case 12 ... 15:
> +		reg = XGMAC_MTL_RXQ_DMA_MAP3;
> +		queue -= 12;
> +		break;
> +	default:
> +		WARN_ON(1);
> +		return;
> +	}

[Severity: High]
The commit message says the dwxgmac functions are being prepared for 16
queues before the macro is raised. However, dwxgmac2_tx_queue_prio() in
the same file still handles only 8 entries:

dwxgmac2_tx_queue_prio() {
    ...
	reg = (queue < 4) ? XGMAC_TC_PRTY_MAP0 : XGMAC_TC_PRTY_MAP1;
	if (queue >= 4)
		queue -= 4;

	value = readl(ioaddr + reg);
	value &= ~XGMAC_PSTC(queue);
	value |= (prio << XGMAC_PSTC_SHIFT(queue)) & XGMAC_PSTC(queue);
    ...
}

At this patch ARRAY_SIZE(tx_queues_cfg) is still 8. The later patch
"include/stmmac: Increase max DMA/MTL channel count from 8 to 16" makes
it 16. After that, can the mqprio paths in stmmac_tc.c call this
function with queue indices 8 to 15?

Both tc_mqprio_config_queue_prio() and stmmac_reset_tc_mqprio() run this
loop:

	for (i = 0; i < ARRAY_SIZE(priv->plat->tx_queues_cfg); i++) {
		...
		if (i < priv->plat->tx_queues_to_use)
			stmmac_tx_queue_prio(priv, priv->hw, prio, i);
	}

tx_queues_to_use can be 16 there. The devicetree limit is
MTL_MAX_TX_QUEUES, and XGMAC_HWFEAT_TXQCNT is a 4-bit field plus 1.
Neither loop is bounded by qopt->num_tc or dma_cap.numtc.

For i = 8 to 15, queue is 4 to 11 after the subtraction. The expression
prio << XGMAC_PSTC_SHIFT(queue) then shifts a u32 by 32 to 88 bits. For
i >= 12, XGMAC_PSTC(queue) expands to GENMASK() with bit positions of 64
and above. Both shifts are undefined behaviour, and UBSAN reports them
as shift-out-of-bounds.

The hardware also ends up programmed wrongly:

  - For i = 8 to 11, the mask truncates to 0 in the u32, so nothing is
    written.
  - For i = 12 to 15 on x86-64 and arm64, the shift counts wrap. The
    write then likely lands on the PSTC4 to PSTC7 fields of
    XGMAC_TC_PRTY_MAP1 and overwrites the priorities already set for
    TCs 4 to 7, usually with 0.

A CAP_NET_ADMIN user triggers this by adding an mqprio qdisc with
hardware offload:

ndo_setup_tc
  -> tc_setup_dwmac510_mqprio()
    -> tc_mqprio_config_queue_prio()
      -> stmmac_tx_queue_prio()
        -> dwxgmac2_tx_queue_prio()

XGMAC uses dwmac510_tc_ops, whose setup_mqprio is
tc_setup_dwmac510_mqprio(). Removing the qdisc runs the same loop
through stmmac_reset_tc_mqprio().

The earlier patch "net: stmmac: separate the TC count from the queue
count on XGMAC" bounds the rx_queue_prio callers and
stmmac_mac_config_tx_queues_prio(). These two mqprio callers seem to
have been missed, so writes to TC_PRTY fields for TCs that don't exist
can still happen on XGMAC.

Should these loops be bounded by the TC count? Alternatively, should
dwxgmac2_tx_queue_prio() reject queue >= 8?

>  
>  	value = readl(ioaddr + reg);
>  	value &= ~XGMAC_QxMDMACH(queue);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124000415.4067701-1-sagar.cheluvegowda%40oss.qualcomm.com

