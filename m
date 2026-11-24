Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F53606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T2i/7Sje;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yo2GIQrY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L9xop1c1Tauysu/bll/wEatp4ceuZST8V2sDyCOdmPM=; b=T2i/7SjeG3+w6nDaXkeczTRMZK
	+fHHM/qTZgqGxXl4t30Exxy52VVzf8iK30aq5OWDnUaCTYfwCWAr/Ol6+TLM8rkVD1GYR8pZILvjw
	JLPDOcgXg1iq5hBXgSAJtLnZ8ko9lyw5q3T+3vm+3Uvh9XbfOw12HaQm+COs7SYgruHsSVSi/2AE7
	oXbMeCNY9lS6Dqtniy90/M6Y4lYwAh+QeOM4HvJuG276VZ4ojO7jp4L6sGX9Hor+v+w/Qi1pX+aJs
	EdFoWce5xoOOq1Sp6tc54ntRrwmZDrMMO1HTAYATAXI7G9A3e3k0EdP/PpUDEy7V+n6pXJMQ8nNSa
	9VNZ+MsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoVt-00000006JJ3-01D6;
	Tue, 24 Nov 2026 11:16:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoVX-00000006JGL-1RsA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:16:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C354F62486;
	Tue, 24 Nov 2026 11:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64ACA1F000CA;
	Tue, 24 Nov 2026 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518978;
	bh=L9xop1c1Tauysu/bll/wEatp4ceuZST8V2sDyCOdmPM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Yo2GIQrYu0Z1gVKdMrg8D8gZKFKYjyhKDhmBQk/Xv75ZYSOcCSzoNTmybdjjUqagG
	 Of2jJ/3MTUBcshtGkiIrnkGuTvHk5TXIJJlUS1vaasAjTmbGTgIljatmWLndo3rxn7
	 SNr2G1n9+5t5SlkdRzERDrDY975d3DbthGt1SFt1tl/Dmx9fjfWp9ldY0OWW8aC4CP
	 SoLQR7C1jZXt1+VoOv/jk7qthW2gkdr/mmPUarMGsl2ZMo7mpIfQlxHJM/gQgVOTBh
	 JosppzUjwpBNC3G+4X7cEnNyl0WOZDkEdbM3UfALLUMyMce2SqVWekYBxr8BqdF4xz
	 7Uz2DS9nicZ9Q==
Subject: Re: [PATCH net-next v4 2/5] net: stmmac: dwmac-sun8i: Get the EPHY
 clock and reset before the MAC probe
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, p.zabel@pengutronix.de,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 11:16:16 +0000
Message-ID: <179551897695.3135.144965187993855310@kernel.org>
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-2-57eba8915f25@gmail.com>
References: <20261120-sun8i-emac-mux-uaf-v4-2-57eba8915f25@gmail.com>
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

- [Low] The commit message describes two failures as real bugs: "its
  -EPROBE_DEFER comes too late", and "an EPHY clock that is not ready…
- [Low] The concern: the patch fixes a real, user-visible probe failure
  (-ENODEV instead of -EPROBE_DEFER when the EPHY clock provider is not…

Pre-existing issues:
- [Low] The concern: for allwinner,sun8i-h3-emac and
  allwinner,sun8i-v3s-emac, the DT binding makes the mdio-mux node…

--

net: stmmac: dwmac-sun8i: Get the EPHY clock and reset before the MAC probe

This moves the internal PHY clock and reset lookup in get_ephy_nodes()
ahead of stmmac_pltfr_probe() in sun8i_dwmac_probe(). It also makes an
-EPROBE_DEFER from of_clk_get() on the EPHY node defer the probe instead
of skipping the node, and reorders the error unwinding so the EPHY clock
and reset are released on every failure path.

> get_ephy_nodes() runs after stmmac_pltfr_probe() has registered the
> netdev, so its -EPROBE_DEFER comes too late. An EPHY clock that is not
> ready yet does not defer at all: the node is skipped and the probe
> fails with -ENODEV.

[Severity: Low]

Can either of these failures happen on the in-tree device trees that use
this path (sunxi-h3-h5.dtsi and sun8i-v3s.dtsi)?

On those device trees, the EMAC's own "stmmaceth" reset and the internal
PHY's clock and reset all come from the same &ccu node:

arch/arm/boot/dts/allwinner/sunxi-h3-h5.dtsi, emac:
    resets = <&ccu RST_BUS_EMAC>;
    reset-names = "stmmaceth";

arch/arm/boot/dts/allwinner/sunxi-h3-h5.dtsi, internal_mdio ethernet-phy@1:
    clocks = <&ccu CLK_BUS_EPHY>;
    resets = <&ccu RST_BUS_EPHY>;

devm_stmmac_probe_config_dt() runs before get_ephy_nodes() in both the
old and the new code. Its reset lookup already returns -EPROBE_DEFER
until the CCU reset controller is registered, even though the reset is
optional:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:stmmac_probe_config_dt() {
    ...
	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
							   STMMAC_RESOURCE_NAME);
    ...
}

sunxi_ccu_probe() registers the clock provider before the reset
controller. If reset registration fails, it removes the clock provider
again:

drivers/clk/sunxi-ng/ccu_common.c:sunxi_ccu_probe() {
    ...
	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
				     desc->hw_clks);
    ...
	ret = reset_controller_register(&reset->rcdev);
	if (ret)
		goto err_del_provider;
    ...
}

So by the time get_ephy_nodes() runs, it doesn't look like of_clk_get()
or of_reset_control_get_exclusive() on the EPHY node can return
-EPROBE_DEFER.

The message also leaves out what looks like the real reason for moving
the lookup. With the later "net: stmmac: dwmac-sun8i: Register the MDIO
mux in the MDIO setup" change, sun8i_dwmac_register_mdio_mux() becomes
plat_dat->mdio_init and runs inside stmmac_pltfr_probe(). From there,
mdio_mux_syscon_switch_fn()->sun8i_dwmac_power_internal_phy() uses
gmac->ephy_clk and gmac->rst_ephy, so both have to be looked up first.

Could the commit message describe this as preparation for that change,
and as hardening for device trees where the EPHY clock or reset come from
a different provider, rather than as a fix for a probe failure?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 9fb398f7cf9ec..4acfda235394d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c

[ ... ]

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

[Severity: Low]

The commit message presents this as a fix for a probe that fails with
-ENODEV instead of deferring. If that is the intent, should it carry a
Fixes: tag?

Based on the ordering described above, though, the old continue only
turns a deferral into -ENODEV when the EPHY clock comes from a different
provider than the EMAC's "stmmaceth" reset. That seems to be possible
only with out-of-tree device trees. If so, rewording the commit message
may fit better than adding a Fixes: tag.

[ ... ]

> @@ -1209,9 +1213,15 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->tx_fifo_size = 4096;
>  	plat_dat->rx_fifo_size = 16384;
>  
> +	if (gmac->variant->soc_has_internal_phy) {
> +		ret = get_ephy_nodes(dev, gmac);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Low]

This isn't a bug introduced by this patch, but should a missing mdio-mux
node fail the whole probe on allwinner,sun8i-h3-emac and
allwinner,sun8i-v3s-emac?

In allwinner,sun8i-a83t-emac.yaml, mdio-mux appears only under the
h3/v3s properties clause. It is not in the required list, and no
ethernet-phy child of the internal MDIO bus is required either. Even so,
get_ephy_nodes() returns -ENODEV when the node is missing:

	mdio_mux = of_get_child_by_name(dev->of_node, "mdio-mux");
	if (!mdio_mux) {
		dev_err(dev, "Cannot get mdio-mux node\n");
		return -ENODEV;
	}

It does the same when there is no allwinner,sun8i-h3-mdio-internal
child, or when no child has a usable clock.

So an H3 or V3s board that the binding allows, using only an external
PHY and no mdio-mux, fails to probe. Before this patch the same error
took the goto dwmac_remove path, so the result was the same. This change
only moves the check earlier.

>  	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
>  	if (ret)
> -		return ret;
> +		goto dwmac_ephy;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25%40gmail.com

