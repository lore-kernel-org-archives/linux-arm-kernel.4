Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A70606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TEvosKVj;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YGvjbnNe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kuKL7b/uFjj/kh9m7DzaXizkG9DLYfZ9ZZ4A8ixWy+M=; b=TEvosKVjRK+UdW
	oxOFNXoXfdb2oNOHkoz/l+hTHTly0M0lEx3sThH8T3krrnVgzyT6cDLkM/VTHamQ4w0pSxvbNnWKE
	AwUr7kBBtGkdslPYKWvLkFHKlebe12Wf4YAoedhp/IQPWCUSRM8wMd+GjcgeDABNPg4h29Ptopc8X
	uBY4XE35f+KGImlG6v8VFsEnxBQFCZ2qi6SCm9nlWoH2QOdbr1fIT4Lh41gxuewqyKNhDk1CsKhKa
	NFcrPHUdqc5A+0gEXtwvRkoEAVet2zNXOBHZnOW60QJmZlgtw9dQb3DI5bRNM+m0dP+Wm4QviGRpK
	al67YIuOYsmWjkiym8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVB0g-00000001PD5-013p;
	Sun, 22 Nov 2026 17:05:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVB0c-00000001PCk-2vma
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:05:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4809F4E416E5;
	Sun, 22 Nov 2026 17:05:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1424760512;
	Sun, 22 Nov 2026 17:05:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CE3D11E62428;
	Sun, 22 Nov 2026 18:05:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795367142; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kuKL7b/uFjj/kh9m7DzaXizkG9DLYfZ9ZZ4A8ixWy+M=;
	b=YGvjbnNewMZ6IUn+9z5/8MlcfTA2Afsxl5UPqe+BGo7wK7Tm9GGkm1Fb6T5lxf9RUTuT/r
	qaTnPzpaf4rREvTgdOKoyY1Ry7V1OMXGpqAl4j66dtypvX4S4il7hmK8Jv0muYTKmhh0uf
	8h1FsrgjkwNezaJ8MQK8Oue/PlDdgyXGuNzGw2lfmUXhlWpE63H4G4aHBuGVoO3E2RkGdq
	48AXZfEL2QfJaq0vT63p12g1+yokd4ckHLOByKoGiUK8Yr/V7L5PiPnxsfR6n+Kzv2xvkA
	qmmF7BiqrRRsm123bdVZVzvUO3LFdVkCziVjd8dMTyKoYh2/WAobwysXRxAgyw==
Message-ID: <fa13b218-97ef-49b6-ab8f-4e6707837a91@bootlin.com>
Date: Sun, 22 Nov 2026 18:05:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 4/5] net: stmmac: Add MDIO init and exit
 platform hooks
To: aiyengar1990@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
References: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
 <20261120-sun8i-emac-mux-uaf-v4-4-57eba8915f25@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-4-57eba8915f25@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_090546_906091_220AD331 
X-CRM114-Status: GOOD (  15.26  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/20/26 11:45, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> A glue driver that adds devices on top of the stmmac MDIO bus, such as
> an MDIO mux, can only do so after stmmac_dvr_probe() has registered the
> netdev.
> 
> Add mdio_init(), called once the bus is registered, and mdio_exit(),
> called before it is unregistered.
> 
> Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 11 +++++++++++
>  include/linux/stmmac.h                            |  2 ++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 7396b68899c6..fb1f7b1a5323 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -682,8 +682,16 @@ int stmmac_mdio_register(struct net_device *ndev)
>  bus_register_done:
>  	priv->mii = new_bus;
>  
> +	if (priv->plat->mdio_init) {
> +		err = priv->plat->mdio_init(priv);
> +		if (err)
> +			goto mdio_init_fail;
> +	}
> +
>  	return 0;
>  
> +mdio_init_fail:
> +	priv->mii = NULL;
>  no_phy_found:
>  	mdiobus_unregister(new_bus);
>  bus_register_fail:
> @@ -703,6 +711,9 @@ int stmmac_mdio_unregister(struct net_device *ndev)
>  	if (!priv->mii)
>  		return 0;
>  
> +	if (priv->plat->mdio_exit)
> +		priv->plat->mdio_exit(priv);
> +
>  	mdiobus_unregister(priv->mii);
>  	priv->mii->priv = NULL;
>  	mdiobus_free(priv->mii);
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 00be2df63d22..e94f9cab973d 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -296,6 +296,8 @@ struct plat_stmmacenet_data {
>  	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
>  			   void *ctx);
>  	void (*dump_debug_regs)(void *priv);
> +	int (*mdio_init)(struct stmmac_priv *priv);
> +	void (*mdio_exit)(struct stmmac_priv *priv);
>  	int (*pcs_init)(struct stmmac_priv *priv);
>  	void (*pcs_exit)(struct stmmac_priv *priv);
>  	struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,
> 


