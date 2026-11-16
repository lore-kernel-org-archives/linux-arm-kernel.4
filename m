Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5F7606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 04:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m6UNQd9k;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sq32BQPw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P6MXyLorrEi2Q6poZtanQJsUY+XSMKVdKruJnDJpfew=; b=m6UNQd9kP6nfz3vq1p0OltPCu9
	bOlMhUg9EWHFXbqKLLknzAKU7w0OueSGzxTzRHSK8TmYymLirs9UvUYsu5qg6DP5oC0mXBt6YcNC1
	XY8ySPUuz+sa210VASrhP7+35YsVh1tJl6xWIw9zQFjl+E+hRBdGE+ScFG1aSVgnI1CxnvWvHBLzd
	Qxg+itgw+uDNkUTlMkIqOtXbBEbWumwP7yP8Hg6H1tAylCWtInFp+WNk7OZ2Du/+rqhckNnl9ffpN
	WdG+42K3e14lvuHGkfjPC1JilRmiZMEma+jH2AWEdlJYDDbuGuElfFLqobPTAckT46QbEL7oAataf
	apaASg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSo4z-000000016O1-1PyJ;
	Mon, 16 Nov 2026 04:12:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSo4y-000000016Nv-0b9r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 04:12:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97D2440871;
	Mon, 16 Nov 2026 04:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A0B1F000C4;
	Mon, 16 Nov 2026 04:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794802347;
	bh=P6MXyLorrEi2Q6poZtanQJsUY+XSMKVdKruJnDJpfew=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Sq32BQPw4RrZOevkYexKbQFHBwyonASywftHViXVbbXPXczpj3lp3xN6jwNdn9NI7
	 KsZ78/YodpQkXSuyZbrbgfL0ek4SKzBI2WMTe9zS8FmZG/XIpNtxu1Yj1cOXQz8HCp
	 1iyQxWBVHDyZktkJR/g0DVZCTPToggHpavQGKrleaXS1GbJbA4q+GM0pIErB1Er17Z
	 LN+mp4SMbUaLJr0aNK+GFcIPbXt/vH2za8HvaFP3oC+mE4PTL5lzNIEhI4PnOe7rJG
	 n3puxhsjA1sJoLICYh5/Nc4Xr9AzYxUayeGgTMrzYMxYtYDGz4bDti/DN2e1Y8NdTW
	 xmTFtuVGFRQuw==
Subject: Re: [PATCH net-next v5 1/6] net: xilinx: axienet: Introduce
 axienet_config for MAC-specific ops
From: netdev-bot+sashiko@kernel.org
To: suraj.gupta2@amd.com
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 04:12:26 +0000
Message-ID: <179480234612.3136.14924278307079342368@kernel.org>
In-Reply-To: <20261114182947.2908628-2-suraj.gupta2@amd.com>
References: <20261114182947.2908628-2-suraj.gupta2@amd.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] net: xilinx: axienet: axienet_probe() fails on software-node
  devices
- [Medium] This commit is presented as a no-functional-change refactor,
  but it also contains a real fix for a NULL pointer dereference.

--

net: xilinx: axienet: Introduce axienet_config for MAC-specific ops

This commit adds struct axienet_config, which holds MAC capability flags
and MAC-specific callbacks. It is filled in from the OF match table, and
the shared 1G code paths now use it. It also puts a NULL check on
lp->mii_bus around the MDIO teardown in axienet_remove().

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 7e83c4b5f1931..125ad3dbf6aa9 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

[ ... ]

> @@ -3149,10 +3297,12 @@ static int axienet_probe(struct platform_device *pdev)
>  	lp->tx_dma_cr = axienet_calc_cr(lp, XAXIDMA_DFT_TX_THRESHOLD,
>  					XAXIDMA_DFT_TX_USEC);
>  
> -	ret = axienet_mdio_setup(lp);
> -	if (ret)
> -		dev_warn(&pdev->dev,
> -			 "error registering MDIO bus: %d\n", ret);
> +	if (lp->axienet_config->mdio) {
> +		ret = axienet_mdio_setup(lp);
> +		if (ret)
> +			dev_warn(&pdev->dev,
> +				 "error registering MDIO bus: %d\n", ret);
> +	}
>  
>  	if (lp->phy_mode == PHY_INTERFACE_MODE_SGMII ||
>  	    lp->phy_mode == PHY_INTERFACE_MODE_1000BASEX) {

[ ... ]

> @@ -3235,7 +3383,8 @@ static void axienet_remove(struct platform_device *pdev)
>  	if (lp->pcs_phy)
>  		put_device(&lp->pcs_phy->dev);
>  
> -	axienet_mdio_teardown(lp);
> +	if (lp->mii_bus)
> +		axienet_mdio_teardown(lp);
>  }

[Severity: Medium]
Could this NULL check go to net as its own fix, with a Fixes: tag and
Cc: stable, and this refactor then be based on it?

Without the guard, the current 1G driver can oops on unbind. Every
failure path in axienet_mdio_setup() frees the bus and sets lp->mii_bus
to NULL. The failure paths are an MDC divisor overflow, a timeout in
axienet_mdio_wait_until_ready(), and a failed of_mdiobus_register():

drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c:axienet_mdio_setup() {
    ...
unregister:
	of_node_put(mdio_node);
	mdiobus_free(bus);
	lp->mii_bus = NULL;
	return ret;
}

axienet_probe() only warns and continues, so the device binds with
lp->mii_bus == NULL. Then, on unbind or remove:

axienet_remove()
  axienet_mdio_teardown(lp)
    mdiobus_unregister(lp->mii_bus)
      reads bus->state on a NULL bus

The commit message already describes this:

  It also hardens the existing 1G path: a failed
  axienet_mdio_setup() already left lp->mii_bus NULL while probe only warns
  and continues (e.g. a 1G device using a fixed-link), so unbinding such a
  device would dereference NULL in mdiobus_unregister().

The fix is part of a large refactor and has no Fixes: tag, so stable and
LTS kernels can't backport it. No other patch in the series carries it
on its own. Two candidates for the Fixes: tag are the commit that made
MDIO setup failure non-fatal in probe and the commit that clears
lp->mii_bus on failure.

[ ... ]

> @@ -2894,27 +3042,13 @@ static int axienet_probe(struct platform_device *pdev)
>  	seqcount_mutex_init(&lp->hw_stats_seqcount, &lp->stats_lock);
>  	INIT_DEFERRABLE_WORK(&lp->stats_work, axienet_refresh_stats);
>  
> -	lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev,
> -						    "s_axi_lite_clk");
> -	if (!lp->axi_clk) {
> -		/* For backward compatibility, if named AXI clock is not present,
> -		 * treat the first clock specified as the AXI clock.
> -		 */
> -		lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
> -	}
> -	if (IS_ERR(lp->axi_clk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(lp->axi_clk),
> -				     "could not get AXI clock\n");
> -
> -	lp->misc_clks[0].id = "axis_clk";
> -	lp->misc_clks[1].id = "ref_clk";
> -	lp->misc_clks[2].id = "mgt_clk";
> +	lp->axienet_config = device_get_match_data(&pdev->dev);
> +	if (!lp->axienet_config)
> +		return -ENODEV;
>  
> -	ret = devm_clk_bulk_get_optional_enable(&pdev->dev, XAE_NUM_MISC_CLOCKS,
> -						lp->misc_clks);
> +	ret = lp->axienet_config->clk_init(lp);
>  	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "could not get/enable misc. clocks\n");
> +		return ret;
>  
>  	/* Map device registers */
>  	lp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &ethres);

[Severity: High]
This makes missing match data a hard probe failure. Doesn't that
break devices that are not instantiated from DT?

device_get_match_data() only asks the device's fwnode, through
fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev). For
an OF node that resolves through axienet_of_match. software_node_ops
does not implement .device_get_match_data, though, and axienet_driver
has no id_table either.

The driver still carries MODULE_ALIAS("platform:" AXIENET_DRIVER_NAME).
Probe also reads its configuration through device_property_read_u32()
and the fwnode helpers, so a parent driver can create the AXI Ethernet
device by name with a software_node attached. The ptp_ocp TimeCard
child device is one example. Such a device has no OF match, so
device_get_match_data() returns NULL. axienet_probe() then returns
-ENODEV before it touches the hardware. Before this patch the same
device probed fine as a 1G MAC.

The commit message says no functional change is intended for the
existing 1G path, and this is one. As far as I can see the later
patches in the series keep this lookup as is, so the regression is
still there at the end of the series.

Since every device bound by name today is a 1G MAC, would it be enough
to fall back to &axienet_1g_config when device_get_match_data() returns
NULL? Or would you rather add a platform_device_id table whose
driver_data points at axienet_1g_config, and have probe use
platform_get_device_id() when there is no fwnode match data?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114182947.2908628-1-suraj.gupta2%40amd.com

