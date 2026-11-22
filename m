Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC36606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QzcWrejc;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=c0ZPCe7n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LaFUW1FwoGNlZJgmSu4oNHIToLGpfe4LYC35AWNKoIc=; b=QzcWrejct1K3Ei
	lqqLbLqfE5ur9y+CDultSvwfSYvix6kTLdzbi0u9/MihRY7pqcdNoXr/7k3eTDoldwHdodce5sm/U
	ANtZBVnhG7MSarX+ms9KRlFEJmIjw8Z8Xbi13klseV61/A8rVG9BlRxoZO6SzVm/nDL0rUGfAlqBa
	vihFk9ydzCczd/aF5qhUbCYgY8ORXdHFeyXH74EK7SODADpehkuNQtZyHGfPe0unFVR9OX6HkDT2U
	RThiE3zTUqmBHA9LXggYsHAY/KAhwI02QX0Y//7gdAPPxFSWh9sMRoDOFQ5rXsss0Jk56lVXYzq8+
	LXrPU4siwyslSHOZoLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBTR-00000001RVv-3kRI;
	Sun, 22 Nov 2026 17:35:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBTM-00000001RV6-2PQ9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:35:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C7210C6223F;
	Sun, 22 Nov 2026 17:35:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D03C60512;
	Sun, 22 Nov 2026 17:35:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2A4911E61B2A;
	Sun, 22 Nov 2026 18:35:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795368924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LaFUW1FwoGNlZJgmSu4oNHIToLGpfe4LYC35AWNKoIc=;
	b=c0ZPCe7nPcWduyfPg/JBixjwZW7G1+N+4DOYFmZDsSnGep8AQm9XDUKhtSbWOR88w/KS/L
	WLGoDoQBsCYt2vypVckzcj/z+0Ton4ugvrL2NhVXfhN407c8GK1imgVVApTNuiYuL1nQgS
	WwPOyYX+/ac2tr1FdPy7q4Jq8ipihAOW8l8vDav1aGOzkFhuFot2ZKIyfY3s9cP3nwVBDe
	qyRjNg6wn+Z6feFPVaRhNgl+qSPo1+c9lA/kLv6icus/QhmXRkDEmwBmmISWzA3dwWkdyj
	XUo90C442YG1j1LORXueQxeSfTxDnANLuoj4vFVuWghNNKyClde54Hzwz+TmVA==
Message-ID: <7de5e572-dba5-4429-90fa-3cddb2e5cad8@bootlin.com>
Date: Sun, 22 Nov 2026 18:35:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 5/5] net: stmmac: dwmac-sun8i: Register the
 MDIO mux in the MDIO setup
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
 <20261120-sun8i-emac-mux-uaf-v4-5-57eba8915f25@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-5-57eba8915f25@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_093528_922846_4A9048C2 
X-CRM114-Status: GOOD (  21.87  )
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
> Both PHYs sit behind the mux, but the mux is registered only after
> stmmac_pltfr_probe() has registered the netdev, so an early open does
> not find the PHY. On remove, the mux goes away before
> unregister_netdev(), and unbinding with the link up oopses in
> phy_stop().
> 
> Register and unregister the mux through the new mdio_init() and
> mdio_exit() hooks.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Looks good, I tested that on Allwinner H2+, the mux probes fine. This
has run on the stmmac netdevCI anyways and no breakage reported on
other plaftorms.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 41 ++++++-----------------
>  1 file changed, 10 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 4acfda235394..0ec25ae0b77e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -17,7 +17,6 @@
>  #include <linux/of_platform.h>
>  #include <linux/phy.h>
>  #include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/regmap.h>
>  #include <linux/stmmac.h>
> @@ -941,6 +940,13 @@ static int sun8i_dwmac_register_mdio_mux(struct stmmac_priv *priv)
>  	return ret;
>  }
>  
> +static void sun8i_dwmac_unregister_mdio_mux(struct stmmac_priv *priv)
> +{
> +	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
> +
> +	mdio_mux_uninit(gmac->mux_handle);
> +}
> +
>  static int sun8i_dwmac_set_syscon(struct device *dev,
>  				  struct plat_stmmacenet_data *plat)
>  {
> @@ -1133,8 +1139,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	struct stmmac_resources stmmac_res;
>  	struct sunxi_priv_data *gmac;
>  	struct device *dev = &pdev->dev;
> -	struct stmmac_priv *priv;
> -	struct net_device *ndev;
>  	struct regmap *regmap;
>  	int ret;
>  
> @@ -1217,6 +1221,9 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  		ret = get_ephy_nodes(dev, gmac);
>  		if (ret)
>  			return ret;
> +
> +		plat_dat->mdio_init = sun8i_dwmac_register_mdio_mux;
> +		plat_dat->mdio_exit = sun8i_dwmac_unregister_mdio_mux;
>  	}
>  
>  	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
> @@ -1227,33 +1234,8 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto dwmac_syscon;
>  
> -	ndev = dev_get_drvdata(&pdev->dev);
> -	priv = netdev_priv(ndev);
> -
> -	/* the MAC is runtime suspended after stmmac_dvr_probe(), so we
> -	 * need to ensure the MAC resume back before other operations such
> -	 * as reset.
> -	 */
> -	pm_runtime_get_sync(&pdev->dev);
> -
> -	/* The mux must be registered after parent MDIO
> -	 * so after stmmac_dvr_probe()
> -	 */
> -	if (gmac->variant->soc_has_internal_phy) {
> -		ret = sun8i_dwmac_register_mdio_mux(priv);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Failed to register mux\n");
> -			goto dwmac_remove;
> -		}
> -	}
> -
> -	pm_runtime_put(&pdev->dev);
> -
>  	return 0;
>  
> -dwmac_remove:
> -	pm_runtime_put_noidle(&pdev->dev);
> -	stmmac_pltfr_remove(pdev);
>  dwmac_syscon:
>  	sun8i_dwmac_unset_syscon(gmac);
>  dwmac_ephy:
> @@ -1269,9 +1251,6 @@ static void sun8i_dwmac_remove(struct platform_device *pdev)
>  	struct stmmac_priv *priv = netdev_priv(ndev);
>  	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
>  
> -	if (gmac->variant->soc_has_internal_phy)
> -		mdio_mux_uninit(gmac->mux_handle);
> -
>  	stmmac_pltfr_remove(pdev);
>  	reset_control_put(gmac->rst_ephy);
>  	clk_put(gmac->ephy_clk);
> 


