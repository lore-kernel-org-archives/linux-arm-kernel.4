Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC067606A338
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SJR9Afby;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VFY2AKBx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UxBE2kratI3peZVoig/BaR5gMKQfOUkKkOtVQC7f2+I=; b=SJR9Afbya6Yp2PKMHVFF7tlMYo
	C/IbC1b/5fm6YEzkqNmhJ5yAWAYyDc9jgWEZIjWG2rEsZM6XMHE0uAYsoyICsvzv2SNhCmkcV6zQA
	drp/ldeP+s/BOVoWG5/5lFMVVeGqJjPHXRVMexo2R+26LCtZ70LhdOotKmujyTXYKHF/4yDG4yA0P
	0rhIX/X4meBgUHi1iRa5YWVDMwrUbCdN7lGp8Gr5GBD9Cc78VKzbcjvOKM3fbq+Z951BzL3V3kTNP
	pNdxQ5GRGm+A+YUBVDFcup8qibduA8Pepj6iH2oq6BFBPvKZmVlHMd/hn9m0JMDcl8Khv6eK2sO7y
	uCyvzfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOZ2-00000002SqF-0YLz;
	Mon, 23 Nov 2026 07:34:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOZ0-00000002Sq0-2Pey
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:34:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B671060D61;
	Mon, 23 Nov 2026 07:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85EA31F000C0;
	Mon, 23 Nov 2026 07:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795419249;
	bh=UxBE2kratI3peZVoig/BaR5gMKQfOUkKkOtVQC7f2+I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VFY2AKBxNYZ9+F/kob1QBYeW4+FfyLcfFW7TAJ8dZGG1LlFB7xOVM8lSqciufb6Bx
	 t4qEBrKf0VlrB0mctj+a9npqb4l+YVTxko5VS9/bONACvBPkMhmwqpHwBGvimHNEmD
	 kmJETLaPlLFN6zYUyKVGDC+Di5IdR/5YrjZa4mb2f8dRiN+BL8j5whoLwGRxT3ZL/5
	 gJWcflZaofuMUM2Q5pSXjp/MdllSfTk0vDX7y0xrtg/ITXcAZbNT42RMy0tt8CgmYz
	 up1mYT3kGD7E6K4lH+HiO7gfJsoUr8B9OPZYWd3F55KFCnFyocADNJ0QQw/lg1dMWW
	 mrMfDfYUzmo7A==
Subject: Re: [PATCH net v2] net: stmmac: dwmac-sun8i: deliver RX checksum
 errors to the stack
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 clabbe.montjoie@gmail.com, kuba@kernel.org, o.rempel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Date: Mon, 23 Nov 2026 07:34:08 +0000
Message-ID: <179541924803.3135.15389726327210335290@kernel.org>
In-Reply-To: <20261122-submit-sun8i-rx-features-v1-v2-1-24a2564f6edf@gmail.com>
References: <20261122-submit-sun8i-rx-features-v1-v2-1-24a2564f6edf@gmail.com>
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

- [Medium] The commit message does not describe the patch's changes to
  shared stmmac code.

--

net: stmmac: dwmac-sun8i: deliver RX checksum errors to the stack

This patch turns on error frame forwarding on the sun8i EMAC. It adds a
sun8i RX status decoder so frames that fail the checksum check reach the
stack with CHECKSUM_NONE instead of being dropped. To do that it adds a
per-MAC rx_status hook to struct mac_device_info, used by stmmac_rx() and
stmmac_rx_zc(), and it moves the EMAC_RX_DO_CRC setting into
sun8i_dwmac_set_mac().

> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index a972bee66504b..706feb7bcbeda 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -615,6 +615,8 @@ struct mii_regs {
>  struct mac_device_info {
>  	const struct stmmac_ops *mac;
>  	const struct stmmac_desc_ops *desc;
> +	/* Defaults to the descriptor format's decoder unless the MAC overrides it. */
> +	int (*rx_status)(struct stmmac_extra_stats *x, struct dma_desc *p);
>  	const struct stmmac_dma_ops *dma;
>  	const struct stmmac_mode_ops *mode;
>  	const struct stmmac_hwtimestamp *ptp;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73b..0ad2203f76c34 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c

[ ... ]

> @@ -654,7 +659,7 @@ static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
>  	r = readl(ioaddr + EMAC_RX_CTL0);
>  	if (enable) {
>  		t |= EMAC_TX_TRANSMITTER_EN;
> -		r |= EMAC_RX_RECEIVER_EN;
> +		r |= EMAC_RX_RECEIVER_EN | EMAC_RX_DO_CRC;
>  	} else {
>  		t &= ~EMAC_TX_TRANSMITTER_EN;
>  		r &= ~EMAC_RX_RECEIVER_EN;
> @@ -698,16 +703,9 @@ static void sun8i_dwmac_get_umac_addr(struct mac_device_info *hw,
>  			    EMAC_MACADDR_LO(reg_n));
>  }
>  
> -/* caution this function must return non 0 to work */
> -static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
> +static int sun8i_dwmac_rx_ipc(struct mac_device_info *hw)
>  {
> -	void __iomem *ioaddr = hw->pcsr;
> -	u32 v;
> -
> -	v = readl(ioaddr + EMAC_RX_CTL0);
> -	v |= EMAC_RX_DO_CRC;
> -	writel(v, ioaddr + EMAC_RX_CTL0);
> -
> +	/* The receiver always records the checksum result, even with RXCSUM off. */
>  	return 1;
>  }

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 8ae95e91a36ab..047d809b8b889 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -125,8 +125,6 @@ struct stmmac_desc_ops {
>  	stmmac_do_void_callback(__priv, desc, set_rx_owner, __args)
>  #define stmmac_get_rx_frame_len(__priv, __args...) \
>  	stmmac_do_callback(__priv, desc, get_rx_frame_len, __args)
> -#define stmmac_rx_status(__priv, __args...) \
> -	stmmac_do_callback(__priv, desc, rx_status, __args)
>  #define stmmac_rx_extended_status(__priv, __args...) \
>  	stmmac_do_callback(__priv, desc, rx_extended_status, __args)
>  #define stmmac_enable_tx_timestamp(__priv, __args...) \
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a685ce4638f61..20e9aa7b14f56 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5723,7 +5723,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
>  		p = stmmac_get_rx_desc(priv, rx_q, entry);
>  
>  		/* read the status of the incoming frame */
> -		status = stmmac_rx_status(priv, &priv->xstats, p);
> +		status = priv->hw->rx_status(&priv->xstats, p);
>  		/* check if managed by the DMA otherwise go ahead */
>  		if (unlikely(status & dma_own))
>  			break;
> @@ -5926,7 +5926,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		p = stmmac_get_rx_desc(priv, rx_q, entry);
>  
>  		/* read the status of the incoming frame */
> -		status = stmmac_rx_status(priv, &priv->xstats, p);
> +		status = priv->hw->rx_status(&priv->xstats, p);
>  		/* check if managed by the DMA otherwise go ahead */
>  		if (unlikely(status & dma_own))
>  			break;
> @@ -7732,6 +7732,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>  			return ret;
>  	}
>  
> +	if (!priv->hw->rx_status)
> +		priv->hw->rx_status = priv->hw->desc->rx_status;
> +

[Severity: Medium]

Should the commit message also describe the changes to the shared stmmac
code? The subject and body only cover dwmac-sun8i, but the patch also
changes the RX path for every stmmac platform:

  - It adds a new rx_status hook to struct mac_device_info.
  - It removes the stmmac_rx_status() wrapper from hwif.h. That wrapper
    went through stmmac_do_callback(), which checks for NULL.
  - stmmac_rx() and stmmac_rx_zc() now call priv->hw->rx_status()
    directly.
  - stmmac_hw_init() sets the default from priv->hw->desc->rx_status.

The default has to be set after hwif_quirks runs, because
stmmac_dwmac1_quirks() is what sets mac->desc for dwmac1000/100. The
message does not mention that ordering requirement.

All four stmmac_desc_ops tables set .rx_status today, so a NULL
dereference does not appear reachable. But this patch has a Fixes: tag
pointing back to the original 2017 dwmac-sun8i commit, and a backport will
depend on this plumbing. Could the message describe it?

Separately, the commit message says:

  Keep the hardware checker running whenever the receiver is enabled.
  Turning RX checksum reporting back on can then use the result already
  recorded in queued descriptors without flushing the ring.

Is this actually a change in behaviour? Before the patch,
sun8i_dwmac_rx_ipc_enable() set EMAC_RX_DO_CRC every time it was called,
from both stmmac_hw_setup() and stmmac_set_features(). Nothing cleared
the bit, including sun8i_dwmac_set_mac(false).

Moving the bit into sun8i_dwmac_set_mac() looks like a code move that does
not change how the hardware behaves. Could that paragraph be reworded so
it does not read as new behaviour?

>  	/* Set alternate descriptor size (which tells the hardware that
>  	 * descriptors are 8 32-bit words) when using extended descriptors
>  	 * with ring mode. Only applicable for pre-v4.0 cores. Platform glue

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122-submit-sun8i-rx-features-v1-v2-1-24a2564f6edf%40gmail.com

