Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED81606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=blZoFjyg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2+tfzmQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UAq7MrYEM1V5cj3QNFw+UcWW884bfuWwHboSgaumfuM=; b=blZoFjygRmbuSejpmrg1oGzTMe
	hue1RpzBwH5otA2aD9SjlO2+2Tx1r4RLqoNSvBqIs10pfGGSwysy3QF9gWMbU1dHhR5fpsX5785nA
	d31BGXFV5NdLeS638bev3sKEC45CQlflBcTUewJhl8wEUv3S3lnR2SOkdnvfW2pqN0dHMhUR03NY+
	mNrx2vuZAQOmVjTSGGWJlt7dHbK9dhF6mf9LVk4bhVKFp23Fynix+UejXK+Zog/Lgp7KdR72PufTI
	M2AwJ4Rt77vgF5Mbo3EWcMwF6nv362zLDcN1Iv+K8ErDZybrpivHfbl0QZvwetp1DJd+62x3SonwK
	+ocJZZxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSu15-00000001yb4-2jy5;
	Mon, 16 Nov 2026 10:32:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSu14-00000001yaY-0kEA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:32:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56688628C1;
	Mon, 16 Nov 2026 10:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1841F000C7;
	Mon, 16 Nov 2026 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825169;
	bh=UAq7MrYEM1V5cj3QNFw+UcWW884bfuWwHboSgaumfuM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T2+tfzmQB5svkYlX4orvot/HbYFh+MWGZHAAw8LU+au7i3hc3oOLy7U93RwMraLwW
	 Ot4KLq+xdSWZ8S9b7Q4NOLrbwp1YNSz8HzaJDrhLJi92lE4HwHRUN8qlXNTWG7xMD2
	 1fQai5iji2MeOR9N+Do3WGnQta31/IKO9v1RyB+vq8wmK6FT1560W9i1hjLyOH0SAm
	 3y0SulrgeTHcsbE70G/bcfbQz/trk/XxRRgpDMVqv3QzZL/9wLQU9iFdYX4M56/7AI
	 nSvwEKFOTGC0GBZJ4SF7hsqu5xaK9ni+p3cuEb/cbpqgKO22U37EiTklwyz8DmzG3b
	 e8XKQrxvim3cQ==
Subject: Re: [PATCH net v3] net: stmmac: Clear DMA errors for multi-channel interrupts
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 magnusleatti@kernelriot.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 16 Nov 2026 10:32:47 +0000
Message-ID: <179482516756.3136.16592047633231652675@kernel.org>
In-Reply-To: <20261113103236.2184751-1-maxime.chevallier@bootlin.com>
References: <20261113103236.2184751-1-maxime.chevallier@bootlin.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 (1) · Low: 1 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In multi-MSI (INTM=1) mode the patch makes the MAC vector
  responsible for fatal bus errors.
- [Low] stmmac_dma_err_interrupt(), called from the MAC hardirq for every
  channel, adds another unserialized writer of the plain `unsigned long`…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch adds
  a new hardirq source that arms it.
- [Medium] This problem wasn't introduced by this patch, but it concerns
  how dwmac4_dma_interrupt() acknowledges status.
- [Low] This problem wasn't introduced by this patch, but Loongson is not
  covered by it.

--

net: stmmac: Clear DMA errors for multi-channel interrupts

This adds a DMA_DIR_ERR direction and a DMA_CHAN_STATUS_MSK_ERR mask for
dwmac4. On GMAC4 cores, the multi-MSI MAC interrupt handler now calls a new
stmmac_dma_err_interrupt(). That helper acks AIS/FBE/RPS/RBU on every
channel and calls stmmac_global_err() on fatal bus errors. The goal is to
stop the RBU/RPS interrupt storms seen on dwmac-motorcomm.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> index 43b036d4e95bd..a7caac3c98e6c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> @@ -173,6 +173,11 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
>  					 DMA_CHAN_STATUS_TI | \
>  					 DMA_CHAN_STATUS_MSK_COMMON)
>  
> +#define DMA_CHAN_STATUS_MSK_ERR		(DMA_CHAN_STATUS_AIS | \

[Severity: Medium]

This is a pre-existing issue, but does putting DMA_CHAN_STATUS_AIS in this
mask actually clear AIS on 4.00 cores?

dwmac4_dma_interrupt() acknowledges with:

	writel(intr_status & intr_en,
	       ioaddr + DMA_CHAN_STATUS(dwmac4_addrs, chan));

In the 4.00 enable layout, the enable bits and the status bits sit at
different positions:

#define DMA_CHAN_INTR_ENA_NIE		BIT(16)
#define DMA_CHAN_INTR_ENA_AIE		BIT(15)
...
#define DMA_CHAN_STATUS_NIS		BIT(15)
#define DMA_CHAN_STATUS_AIS		BIT(14)

If the 4.00 status register has AIS at BIT(14), then intr_status & intr_en
never includes AIS. In that case neither this mask nor the existing
single-IRQ path would clear it. The new check in stmmac_mac_interrupt()
accepts every GMAC4 variant, including 4.00.

It isn't clear whether AIS on 4.00 is sticky, or just the OR of the
enabled sources. If it is the OR, it would clear once RBU/RPS/FBE are
acked. The current multi-MSI users also appear to be 4.10+ cores.

> +					 DMA_CHAN_STATUS_FBE | \
> +					 DMA_CHAN_STATUS_RPS | \
> +					 DMA_CHAN_STATUS_RBU)

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> index a0249715fafaf..02aa1a3dd1e25 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> @@ -150,6 +150,8 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
>  		intr_status &= DMA_CHAN_STATUS_MSK_RX;
>  	else if (dir == DMA_DIR_TX)
>  		intr_status &= DMA_CHAN_STATUS_MSK_TX;
> +	else if (dir == DMA_DIR_ERR)
> +		intr_status &= DMA_CHAN_STATUS_MSK_ERR;
>  
>  	/* ABNORMAL interrupts */
>  	if (unlikely(intr_status & DMA_CHAN_STATUS_AIS)) {

[Severity: Low]

Can one hardware event now be counted twice in the abnormal counters?

stmmac_dma_err_interrupt() runs this path from the MAC hardirq for every
channel. The per-channel RX/TX MSI handlers process the same bits:
DMA_CHAN_STATUS_MSK_RX contains RBU, RPS, AIS and FBE, and
DMA_CHAN_STATUS_MSK_TX contains AIS and FBE.

The counters are plain unsigned long increments:

		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU))
			x->rx_buf_unav_irq++;
		if (unlikely(intr_status & DMA_CHAN_STATUS_RPS))
			x->rx_process_stopped_irq++;
		...
			x->fatal_bus_error_irq++;

Suppose RBU, RPS or FBE arrives together with RI or TI on a channel. Both
vectors can then read the bit before either one writes it back. Could
rx_buf_unav_irq, rx_process_stopped_irq and fatal_bus_error_irq in
ethtool -S then count the event twice? The concurrent read-modify-write
could also lose increments.

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 25894771e9e9f..0bcbf837d9cc8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3145,6 +3145,22 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan, u32 dir)
>  	return status;
>  }
>  
> +static void stmmac_dma_err_interrupt(struct stmmac_priv *priv)
> +{
> +	u8 channels_to_check = max(priv->plat->rx_queues_to_use,
> +				   priv->plat->tx_queues_to_use);
> +	int status;
> +	u8 chan;
> +
> +	for (chan = 0; chan < channels_to_check; chan++) {
> +		status = stmmac_dma_interrupt_status(priv, priv->ioaddr,
> +						     &priv->xstats, chan,
> +						     DMA_DIR_ERR);
> +		if (unlikely(status & tx_hard_error))
> +			stmmac_global_err(priv);

[Severity: Medium]

Can the per-channel MSI handlers consume the fatal bus error before this
loop sees it?

DMA_CHAN_STATUS_MSK_COMMON contains AIS and FBE, and it is part of both
DMA_CHAN_STATUS_MSK_RX and DMA_CHAN_STATUS_MSK_TX:

#define DMA_CHAN_STATUS_MSK_COMMON	(DMA_CHAN_STATUS_NIS | \
					 DMA_CHAN_STATUS_AIS | \
					 DMA_CHAN_STATUS_CDE | \
					 DMA_CHAN_STATUS_FBE)

dwmac4_dma_interrupt() acknowledges whatever it saw, no matter which
vector called it:

	writel(intr_status & intr_en,
	       ioaddr + DMA_CHAN_STATUS(dwmac4_addrs, chan));

On the RX vector, stmmac_msi_intr_rx() ignores the return value:

	stmmac_napi_check(priv, chan, DMA_DIR_RX);

On the TX vector, stmmac_msi_intr_tx() only reacts to an exact match:

	} else if (unlikely(status == tx_hard_error)) {
		stmmac_tx_err(priv, chan);
	}

If FBE arrives together with TI, status is handle_tx | tx_hard_error, and
nothing recovers.

Either vector may read DMA_CHAN_STATUS before
stmmac_mac_interrupt()->stmmac_dma_err_interrupt() does. In that case FBE
and AIS are already cleared, this loop sees a clean register, and
stmmac_global_err() is never called. Would the channel DMA then stay
stopped while the carrier stays up?

Even when the TX vector sees a pure tx_hard_error, it only runs
stmmac_tx_err() for that one channel, not the global reset.

The commit message says the patch will "call stmmac_global_err() upon
fatal bus errors", but that seems to rely on the MAC vector reading the
register first.

Would it make sense to drop AIS/FBE (and RBU/RPS) from the per-channel
masks in multi-MSI mode? Another option is to have the per-channel handlers
act on tx_hard_error the same way.

[Severity: High]

This is a pre-existing issue, but this patch adds another hardirq path that
can trigger it. stmmac_global_err() queues priv->service_task through
stmmac_service_event_schedule(), and nothing cancels or flushes
service_task before teardown.

Only STMMAC_DOWN stops the queuing, and it is set and cleared only inside
stmmac_reset_subtask(). Neither stmmac_release() nor stmmac_dvr_remove()
sets it.

If a reset is pending when the driver is removed, can this sequence happen?

stmmac_dvr_remove()
  unregister_netdev()          <- closes the device under rtnl

service_task (blocked in rtnl_lock() until now)
  stmmac_reset_subtask()
    dev_close()                <- no-op
    dev_open()
      stmmac_open()
        stmmac_init_phy()      <- uses priv->phylink and the MDIO bus

stmmac_dvr_remove() continuing
  phylink_destroy(priv->phylink);
  stmmac_pcs_clean(ndev);
  stmmac_mdio_unregister(ndev);
  destroy_workqueue(priv->wq); <- the work is only drained here

That would be a use-after-free of phylink and the MDIO bus. IRQs and DMA
rings would also be left allocated on an unregistered netdev.

stmmac_tx_timeout() and stmmac_safety_feat_interrupt() can already trigger
this. A fatal bus error on the multi-MSI MAC vector adds one more trigger.

> +	}
> +}
> +

[ ... ]

> @@ -6498,6 +6514,9 @@ static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id)
>  	/* To handle Common interrupts */
>  	stmmac_common_interrupt(priv);
>  
> +	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
> +		stmmac_dma_err_interrupt(priv);

[Severity: Low]

This isn't a bug introduced by this patch, but Loongson multi-MSI is left
out here. loongson_default_data() sets:

	plat->core_type = DWMAC_CORE_GMAC;

loongson_dwmac_msi_config() sets STMMAC_FLAG_MULTI_MSI_EN, so Loongson also
uses stmmac_mac_interrupt() as its common handler. This check skips it.

The check itself looks necessary. loongson_dwmac_dma_interrupt() only
masks for DMA_DIR_RX and DMA_DIR_TX:

	if (dir == DMA_DIR_RX)
		intr_status &= DMA_STATUS_MSK_RX_LOONGSON;
	else if (dir == DMA_DIR_TX)
		intr_status &= DMA_STATUS_MSK_TX_LOONGSON;

so DMA_DIR_ERR would fall through unmasked and ack RI/TI.

Loongson's per-channel RX mask already includes RU/RPS/AIS_RX/FBI_RX, so it
isn't clear that a storm happens there. Could Loongson send abnormal-only
DMA interrupts to the common vector, the way dwmac4 does with INTM=1? The
commit message already notes that Loongson was not tested.

> +
>  	return IRQ_HANDLED;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113103236.2184751-1-maxime.chevallier%40bootlin.com

