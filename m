Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FEA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ie3f+Ql6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWwl+S8x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mnw6E1h7bjfHhFgcDHd+fVMgItD42/KW+vwcJIrj1Cs=; b=Ie3f+Ql6p8PyZNC5qaoY095+If
	iH4xNIu/eDOI2HTtKXyLgOyhDWAgSQiMSc9PLVQ7NaJknYaHEiY06bmEkGdJAbUNN47qbYVAbyhH4
	g7Sz6Ie/zM3XSkYUHUZHMEEuuQCkn2rF9n2gnq1uh5vyhB6OHXB3P8YrOhakKQTCzzAbhSlExNgss
	c4FQloXh2kxInXaGMRMy0h8OfrHtl8z6ffRNOW3do50FipWEwaR64i4xDAZaG3Z0q0O91LXSsPaG1
	Rgr9e4888EJhZ1bOxcqU6jT1R3hpUdUcrD2PoYR+SBRu0Bq5q7hipeFmonAbkySgVYhrXhH4PMaQE
	ZkBB0/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsjw-00000006xDV-1POg;
	Tue, 24 Nov 2026 15:47:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsjj-00000006x9m-3hFO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:47:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5515D61D63;
	Tue, 24 Nov 2026 15:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D121F000C0;
	Tue, 24 Nov 2026 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795535234;
	bh=mnw6E1h7bjfHhFgcDHd+fVMgItD42/KW+vwcJIrj1Cs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VWwl+S8xDi+iSPm5J3H3Y2yII0plP3fQQHf4974Vo5SIvkxXxysZJoHbrcEW65xuA
	 qQc69KmjxB/6YUCFSTUeXTiJSp2FUKd+POPfrBpSy+u/WhcZM8rl2gROZUAUKFdWak
	 eFVWuL4qBHQ7hgjI437RDB65un0cSDswsEqM59HAAtj2Yqu4CfJ0rLvLaciTCkwmtc
	 4EyBdZqLYf07592ekZKOcqirdHwGypFCymgTlmZrUy7EC0lXVlZn5DihWla8hujsUK
	 st08k68Op6Gm/OtFEhXGaUygAi4Svc8AaJixgEv626Ko25b5rKDNOR87+4JOPionKJ
	 gg3VwJhUlZsNw==
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool rx-all
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 boon.leong.ong@intel.com, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, clabbe.montjoie@gmail.com, kuba@kernel.org,
 o.rempel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Date: Tue, 24 Nov 2026 15:47:13 +0000
Message-ID: <179553523359.3135.5161173895419384474@kernel.org>
In-Reply-To: <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com>
References: <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch adds a `set_rx_all` member to `struct stmmac_ops`
  (drivers/net/ethernet/stmicro/stmmac/hwif.h:322) but no…

--

net: stmmac: dwmac-sun8i: support ethtool rx-all

This adds opt-in NETIF_F_RXALL support for dwmac-sun8i. With it, complete
frames with a reported wire error, and runts the MAC can forward, are
delivered to the stack and are not counted in the good packet and byte
totals. A new set_rx_all op in struct stmmac_ops updates the runt
forwarding bit in RX_CTL1, and a new spinlock serializes those updates
against the DMA start/stop bits.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 047d809b8b889..2cfadc6861047 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -319,6 +319,7 @@ struct stmmac_ops {
>  	void (*set_mac)(void __iomem *ioaddr, bool enable);
>  	/* Enable and verify that the IPC module is supported */
>  	int (*rx_ipc)(struct mac_device_info *hw);
> +	void (*set_rx_all)(struct stmmac_priv *priv, bool enable);
>  	/* Enable RX Queues */
>  	void (*rx_queue_enable)(struct mac_device_info *hw, u8 mode, u32 queue);
>  	/* RX Queues Priority */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 2f33fc0126b11..0a893c2cea78b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -6453,6 +6466,11 @@ static int stmmac_set_features(struct net_device *netdev,
>  {
>  	struct stmmac_priv *priv = netdev_priv(netdev);
>  
> +	if (((netdev->features ^ features) & NETIF_F_RXALL) &&
> +	    netif_running(netdev) && netif_device_present(netdev) &&
> +	    priv->hw->mac->set_rx_all)
> +		priv->hw->mac->set_rx_all(priv, features & NETIF_F_RXALL);
> +

[Severity: Low]
This isn't a bug, but should the new op get a stmmac_set_rx_all() wrapper
in hwif.h like the other struct stmmac_ops members have?

Every other MAC op in that table goes through stmmac_do_callback() or
stmmac_do_void_callback(), which checks both hw->mac and the op pointer
for NULL:

drivers/net/ethernet/stmicro/stmmac/hwif.h:
#define stmmac_core_init(__priv, __args...) \
	stmmac_do_void_callback(__priv, mac, core_init, __args)
...
#define stmmac_rx_ipc(__priv, __args...) \
	stmmac_do_callback(__priv, mac, rx_ipc, __args)

Here stmmac_set_features() calls priv->hw->mac->set_rx_all() directly
and does its own NULL check. A few lines below, the same function calls
stmmac_rx_ipc() through the wrapper.

__stmmac_dvr_probe() also reads priv->hw->mac->set_rx_all directly to
decide whether to advertise NETIF_F_RXALL.

Both sites check for NULL today, so nothing breaks now. Only
sun8i_dwmac_ops sets this op, though. If a later caller copies the
direct call without the NULL check, could it oops on every other MAC?

>  	/* Keep the COE Type in case of csum is supporting */
>  	if (features & NETIF_F_RXCSUM)
>  		priv->hw->rx_csum = priv->plat->rx_coe;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3%40gmail.com

