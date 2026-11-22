Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18783606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UvcTOzmw;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0TwXIxCZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j6ElqDaZMsgeILsrFsQEoNXzC/7MuQ/oW+AvP106PHQ=; b=UvcTOzmwUeAAVx
	ihPSRZ7v/8bjgXgNuOR+3H7kLBsRDC68dsSBYkAi3o+WXKXSLe5xnQ9yakwvnn7AgUwUsZOw5/ooo
	x2zZosWiq77n9PYC9p4NH1PmdQdDDYJSjxm1+IySXVQCqNXdmkic/h8RmazilC370cMtxfIJJkszE
	KUnK7sB4eLAvFS7PvGVly3U9+VnHXYN0S8rG/t7qOm1qwyDCFcA8YIKk7Lcw61HFo/whuUuLyREHx
	mC5m/FX2ogWgbYA+7KqsGt+hEpinzztwrWlV6+vwAae4a0Z57F+SWp2N4/bYYwMmQkxVm2b18JoV9
	04YXziyvAIf6dFT5r3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAir-00000001NuL-1idr;
	Sun, 22 Nov 2026 16:47:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAio-00000001Ntb-2eAY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:47:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 39C5DC6223F;
	Sun, 22 Nov 2026 16:47:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6834460512;
	Sun, 22 Nov 2026 16:47:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B72611E6257F;
	Sun, 22 Nov 2026 17:47:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795366038; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=j6ElqDaZMsgeILsrFsQEoNXzC/7MuQ/oW+AvP106PHQ=;
	b=0TwXIxCZpyJzluO4Otef5fhtskfek3eFZUrcY7zZkbxpkJlQOqLSIlU+bdnxEI4ZcE6k/Y
	qV9im3CO5OK3zdgCZaEdt6NA5BtHerVgTVW5gjQtj3kH2ih4GDsARlOZWIEso0wAlhUYHI
	lCGXvNiBOwG/9lyqpBWsMb55IJ4U6ZUeu5WMfrVztpNK9fs+7mEdPz6S0nHDvTIbKK9OnC
	oCUDsyagmtk47GYt27K+/BsfgVufIElepIBh1zSTXybHhc1BeazZunRmnNR96DWPyGICk5
	UeSBlPFaLHJRQyaHvAeGK4MxazJxBWLo9oBPJ3mblZRE1qUl9HKaTfbJ1BpWWA==
Message-ID: <366c33c9-6747-424f-8df8-71f94320a857@bootlin.com>
Date: Sun, 22 Nov 2026 17:47:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/5] net: stmmac: dwmac-sun8i: Put the EPHY
 clock and reset after the MAC
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
 <20261120-sun8i-emac-mux-uaf-v4-1-57eba8915f25@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-1-57eba8915f25@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_084722_824638_86EC11A5 
X-CRM114-Status: GOOD (  16.42  )
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
> sun8i_dwmac_exit() unpowers the internal PHY through ephy_clk and
> rst_ephy, but the probe error path and sun8i_dwmac_remove() put both
> before stmmac_pltfr_remove() calls it. If mdio_mux_init() fails after
> the scan of the internal bus has powered the PHY, this is a
> use-after-free.
> 
> Put them after stmmac_pltfr_remove(). The explicit unpower in remove()
> is then redundant.
> 
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73..9fb398f7cf9e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1236,7 +1236,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  		ret = sun8i_dwmac_register_mdio_mux(priv);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Failed to register mux\n");
> -			goto dwmac_mux;
> +			goto dwmac_remove;
>  		}
>  	}
>  
> @@ -1244,12 +1244,11 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> -dwmac_mux:
> -	reset_control_put(gmac->rst_ephy);
> -	clk_put(gmac->ephy_clk);
>  dwmac_remove:
>  	pm_runtime_put_noidle(&pdev->dev);
>  	stmmac_pltfr_remove(pdev);
> +	reset_control_put(gmac->rst_ephy);
> +	clk_put(gmac->ephy_clk);
>  dwmac_syscon:
>  	sun8i_dwmac_unset_syscon(gmac);
>  
> @@ -1262,14 +1261,12 @@ static void sun8i_dwmac_remove(struct platform_device *pdev)
>  	struct stmmac_priv *priv = netdev_priv(ndev);
>  	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
>  
> -	if (gmac->variant->soc_has_internal_phy) {
> +	if (gmac->variant->soc_has_internal_phy)
>  		mdio_mux_uninit(gmac->mux_handle);
> -		sun8i_dwmac_unpower_internal_phy(gmac);
> -		reset_control_put(gmac->rst_ephy);
> -		clk_put(gmac->ephy_clk);
> -	}
>  
>  	stmmac_pltfr_remove(pdev);
> +	reset_control_put(gmac->rst_ephy);
> +	clk_put(gmac->ephy_clk);
>  	sun8i_dwmac_unset_syscon(gmac);
>  }
>  
> 


