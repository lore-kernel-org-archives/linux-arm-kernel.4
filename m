Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A398F606A6A2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QKrONRpf;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vLlRJEb8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=odH1W3Fi9GNbi7dCUOZXZg0rZVE2x7cWfH47Ss3QQR0=; b=QKrONRpf7KZbeA
	Bx/iZm+V/z7hFfzWuQ4z2kfyM3YdDmnuCCVtHKCLFkdkmpGC4M2wrPGqKjqCmGNL0jaS1kfsaloYv
	evt3rK0/wW/hI3WkXnfZ06mbt9I5GLVhHSHwp8ygUYnQNoSswi8igVKSZGXWbI5odOLLxxLttizAI
	uZn5CgzfO+SXqMonwJoD7fPbyEyEwIR7CZiwQrp/VooIBmh0forAjV0lWjiWtXPTGAjHip8e/dySb
	+ozgqE2XpiOgHR0zjqE17iu9FyxA12S6+M6Dw+XRY1K+wJZcs9sqNOOw9zyH1dN6XH3VNFhbcGLf/
	6zyVPHLyaMti+BeA/A7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAmc-00000001OHv-0Rk9;
	Sun, 22 Nov 2026 16:51:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAmZ-00000001OHL-1PFT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:51:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E4DC1A1786;
	Sun, 22 Nov 2026 16:51:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50CA060512;
	Sun, 22 Nov 2026 16:51:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 407BA11E624EE;
	Sun, 22 Nov 2026 17:51:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795366271; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=odH1W3Fi9GNbi7dCUOZXZg0rZVE2x7cWfH47Ss3QQR0=;
	b=vLlRJEb8rXtT4eD7/MWgeYKI56QggNTzC1SZIMRYtzsk623ufNRqfVNA8UhqIIutP+qJC6
	ppfR2pVI8obtbkAUS8t8hxQZ+3CGnJiUQRwEw1uU/xT3vaoX+0aiyikzUav+op7SnCTuBh
	umGPGI3IE/fPb4eVcdqyuTqyxAd3pT4GEQjrWjbI56U4ERJs2iVatqVBarQAmIVRSFpoUG
	nUOdJeY4ZYTBCFFcHi6S6LYYQJaufgQwfUd2C1Mk7YmBdho9aEnGwj2C/5uvyV8vCGP4r/
	bWE/EgaEf5SX4ESO7KtT8Vhkj+dka/cA6njZ/WaUlFaBlZNQztGadrNtLmxMNQ==
Message-ID: <3608fc23-1d62-4118-be0d-fa1d2ed3e399@bootlin.com>
Date: Sun, 22 Nov 2026 17:51:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/5] net: stmmac: dwmac-sun8i: Get the EPHY
 clock and reset before the MAC probe
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
 <20261120-sun8i-emac-mux-uaf-v4-2-57eba8915f25@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-2-57eba8915f25@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_085115_527256_7F8823F8 
X-CRM114-Status: GOOD (  21.01  )
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
> get_ephy_nodes() runs after stmmac_pltfr_probe() has registered the
> netdev, so its -EPROBE_DEFER comes too late. An EPHY clock that is not
> ready yet does not defer at all: the node is skipped and the probe
> fails with -ENODEV.
> 
> Look up the clock and reset before stmmac_pltfr_probe(), and defer on
> the clock as on the reset.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

This is a step in the right direction, thanks

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 34 ++++++++++++++---------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 9fb398f7cf9e..4acfda235394 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -775,16 +775,15 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
>  }
>  
>  /* Search in mdio-mux node for internal PHY node and get its clk/reset */
> -static int get_ephy_nodes(struct stmmac_priv *priv)
> +static int get_ephy_nodes(struct device *dev, struct sunxi_priv_data *gmac)
>  {
> -	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
>  	struct device_node *mdio_internal;
>  	struct device_node *mdio_mux;
>  	int ret;
>  
> -	mdio_mux = of_get_child_by_name(priv->device->of_node, "mdio-mux");
> +	mdio_mux = of_get_child_by_name(dev->of_node, "mdio-mux");
>  	if (!mdio_mux) {
> -		dev_err(priv->device, "Cannot get mdio-mux node\n");
> +		dev_err(dev, "Cannot get mdio-mux node\n");
>  		return -ENODEV;
>  	}
>  
> @@ -792,7 +791,7 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
>  						"allwinner,sun8i-h3-mdio-internal");
>  	of_node_put(mdio_mux);
>  	if (!mdio_internal) {
> -		dev_err(priv->device, "Cannot get internal_mdio node\n");
> +		dev_err(dev, "Cannot get internal_mdio node\n");
>  		return -ENODEV;
>  	}
>  
> @@ -801,8 +800,13 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
>  		struct clk *ephy_clk;
>  
>  		ephy_clk = of_clk_get(iphynode, 0);
> -		if (IS_ERR(ephy_clk))
> +		if (IS_ERR(ephy_clk)) {
> +			if (PTR_ERR(ephy_clk) == -EPROBE_DEFER) {
> +				of_node_put(mdio_internal);
> +				return -EPROBE_DEFER;
> +			}
>  			continue;
> +		}
>  		gmac->rst_ephy = of_reset_control_get_exclusive(iphynode, NULL);
>  		if (IS_ERR(gmac->rst_ephy)) {
>  			ret = PTR_ERR(gmac->rst_ephy);
> @@ -814,7 +818,7 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
>  			continue;
>  		}
>  		gmac->ephy_clk = ephy_clk;
> -		dev_info(priv->device, "Found internal PHY node\n");
> +		dev_info(dev, "Found internal PHY node\n");
>  		of_node_put(mdio_internal);
>  		return 0;
>  	}
> @@ -1209,9 +1213,15 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->tx_fifo_size = 4096;
>  	plat_dat->rx_fifo_size = 16384;
>  
> +	if (gmac->variant->soc_has_internal_phy) {
> +		ret = get_ephy_nodes(dev, gmac);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
>  	if (ret)
> -		return ret;
> +		goto dwmac_ephy;
>  
>  	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  	if (ret)
> @@ -1230,9 +1240,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	 * so after stmmac_dvr_probe()
>  	 */
>  	if (gmac->variant->soc_has_internal_phy) {
> -		ret = get_ephy_nodes(priv);
> -		if (ret)
> -			goto dwmac_remove;
>  		ret = sun8i_dwmac_register_mdio_mux(priv);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Failed to register mux\n");
> @@ -1247,10 +1254,11 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  dwmac_remove:
>  	pm_runtime_put_noidle(&pdev->dev);
>  	stmmac_pltfr_remove(pdev);
> -	reset_control_put(gmac->rst_ephy);
> -	clk_put(gmac->ephy_clk);
>  dwmac_syscon:
>  	sun8i_dwmac_unset_syscon(gmac);
> +dwmac_ephy:
> +	reset_control_put(gmac->rst_ephy);
> +	clk_put(gmac->ephy_clk);
>  
>  	return ret;
>  }
> 


