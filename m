Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367CF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ULLjdsS2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=apS/MljX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lAtDglAyGhv+VlnVH8lG4/rJZAFJRFJmGCz7AGksEO8=; b=ULLjdsS2sssJ4nAim92GOaZf3q
	P7IqDq58MJ0UpAsN+N33aTLmiqQ8jI9/oDpjHMZj1u+1UT7hsFoa4Utg8t+w6Rk7haIKG4/RUVUMR
	AZ0VEnrSHaDgy2ioMEqhpongtcjVQN8KVYb0B5VNvPZQYFhwVmsjrE6yeMX7TH9LjixoyVZOGkgF9
	HalRn/oiWm9+suAHtLCtsq9cEvblE2Y/wylXKG62zm3PiWjKUJXWTxwguEMsqiXRyRpL5TF9pXKi8
	mq5ehIzVtOsyFHahmDpn/AnHSGXRfF7BzXrhO5aWWp2GlRu5IM2pWJYgYvruAaGsnj+ZzYQOK8YLe
	c6DfXJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCT9-00000001Xz4-1dui;
	Sun, 22 Nov 2026 18:39:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCT7-00000001Xyj-05I2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lAtDglAyGhv+VlnVH8lG4/rJZAFJRFJmGCz7AGksEO8=; b=apS/MljXunN4YkuWtEK6bNo4wX
	N5yhZYG4GXmfiJnlx/L2HsgUg73eqsMBWvOJ5/8iCw52H4lroAM5b7z9sTR8+S+b9yY6qbJvij+uD
	/nGHDRbWh9GHsTBiXrF2xlyJHpPzZKdicP907fVrN2IxDB58ozMzr4mI2wa8R27UvTck=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVCSn-000bPx-Kt; Sun, 22 Nov 2026 19:38:57 +0100
Date: Sun, 22 Nov 2026 19:38:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool
 rx-all
Message-ID: <ba116748-1650-4816-97a6-69eeecd4b2cb@lunn.ch>
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
 <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_103917_076590_83FE0BA9 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +static void sun8i_dwmac_update_rx_ctl1(struct stmmac_priv *priv, u32 clear, u32 set)
>  {
> +	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
>  	u32 v;
>  
> -	v = readl(ioaddr + EMAC_RX_CTL1);
> -	v |= EMAC_RX_DMA_START;
> -	v |= EMAC_RX_DMA_EN;
> -	writel(v, ioaddr + EMAC_RX_CTL1);
> +	guard(spinlock_irqsave)(&gmac->rx_ctl1_lock);
> +	v = readl(priv->ioaddr + EMAC_RX_CTL1);
> +	writel((v & ~clear) | set, priv->ioaddr + EMAC_RX_CTL1);

Netdev does not like these magical guard constructs. scoped_guard is
acceptable, but good old fashioned lock/unlock is preferred.

It is also unclear why this now needs locks, when before it did not.

This patch is too big, does too many things. Please break it up into
smaller changes, with good commit messages, which are obviously
correct.

	Andrew

