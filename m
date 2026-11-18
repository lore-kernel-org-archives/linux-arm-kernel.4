Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B991606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rwCUqOty;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZQ309IrD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q9WUHTlO0OL7ov0XoQ5MNiIU/yUGdfQMqepE1wOdJH4=; b=rwCUqOtyzVSusWIIYaRJSqmfhN
	r8RJL4x5gCAWr9+gmULyttJLSGaCJHn2R3yZANLHg7XZgcUG0T2uWN6uswu19gJiUHlvzDIqp82EX
	B9PF+UpJKtNsz+IWvPrkk9NEuRiKawo2Z4DBtR7kE8tppnnzK2w8/Vn7ajyaQsicUvh9D61AFoXDL
	uRmz+tHSAR5qeNUyRWN7pS9LQGzDzgH+fva9WzrOyp+x6FKIOjnsVgkZk41+p5LYIRyKepU1uBwfw
	W5eVhRxuiYJdCU+to1l5yVfestokmGkRG5LE2jOLdJetnef86Vb654x1vkDpvYiV5KgjfNAsNHLa/
	yYuVWRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeB7-00000008ksF-0eap;
	Wed, 18 Nov 2026 11:50:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeB6-00000008ks8-3Bic
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:50:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A894861D32;
	Wed, 18 Nov 2026 11:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979E31F000C4;
	Wed, 18 Nov 2026 11:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795002615;
	bh=Q9WUHTlO0OL7ov0XoQ5MNiIU/yUGdfQMqepE1wOdJH4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZQ309IrDa2l0cFZ6/AuFZKU5bfrJ/lmmoxAsIXlzN3NSu+TRBfKRxfx+J5FApFzSv
	 lAhBLdaEkcmop/GtXP0yVkIG/Z3p2/s00DUETpogKi9rjcizGTgIA6hBWOqwyg7DQg
	 FEqRMdOqJf9aUYG5BlOx2GsSWqoBcWNbzY8+JGpoLJ84lxKDAYmrYXpUy7StaolFvO
	 M19WAC/tk27L8wXeDb2KtUc6LRDPWrRz6qgbCSobhxk8WcuHDblpk3uKxtAj9P9CW4
	 f0VJ+WPnsQUVBgexe50OhpBEurz+5spKr/xjK0drrUjgvPwA9fYhOi84Qe2uyWFVX1
	 opHoosXUarHNw==
Subject: Re: [PATCH net-next v3] net: stmmac: program the FSM timeout timer
From: netdev-bot+sashiko@kernel.org
To: zxyan0222@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
Date: Wed, 18 Nov 2026 11:50:14 +0000
Message-ID: <179500261410.3136.4534383206218105780@kernel.org>
In-Reply-To: <20261116114923.1157920-1-zxyan0222@gmail.com>
References: <20261116114923.1157920-1-zxyan0222@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The FSM timer fix does nothing on any in-tree XGMAC device.
- [Medium] On dwmac5-class cores, the patch arms a watchdog by default,
  and when it fires the driver resets the whole device.
- [Medium] The value written to TMR (CSR clocks per 1us) comes only from
  clk_get_rate(plat->stmmac_clk) (stmmac_main.c:3698-3700).
- [Low] The commit is presented as a bug fix ('the advertised timeout
  protection is ineffective', 'The issue was hit in testing on dwmac4…
- [Low] stmmac_safety_feat_configuration() logs 'unable to get a valid
  CSR clock rate' whenever dma_cap.asp is non-zero and csr_clk_mhz is 0…

--

net: stmmac: program the FSM timeout timer

This patch programs MAC_FSM_ACT_Timer after TMOUTEN is enabled on dwmac5
and XGMAC cores. TMR is derived from the CSR clock rate and NTMRMD
defaults to a 1s timeout. A csr_clk_mhz argument is added to the
safety_feat_config callback, and an ntmrmd field is added to struct
stmmac_safety_feature_cfg so platforms can override the default.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> index f1bb981cab7cd..c1e3d634f1530 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c

[ ... ]

> @@ -245,6 +247,24 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
>  		value |= TMOUTEN; /* FSM Timeout Feature */
>  	writel(value, ioaddr + MAC_FSM_CONTROL);
>  
> +	/* Program the FSM active timer so the timeout checker actually fires.
> +	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
> +	 * Default to a 1s timeout when the platform did not select one.
> +	 */
> +	if (safety_feat_cfg->tmouten && csr_clk_mhz) {
> +		u32 ntmrmd = safety_feat_cfg->ntmrmd;
> +
> +		ntmrmd = (ntmrmd >= STMMAC_NTMRMD_1US &&
> +			  ntmrmd <= STMMAC_NTMRMD_64SEC) ?
> +			 ntmrmd : STMMAC_NTMRMD_1SEC;

[Severity: Medium]
If the platform passes no safety_feat_cfg, dwmac5_safety_feat_config()
uses all_safety_feats instead, which has tmouten = 1 and ntmrmd = 0. With
this change, ntmrmd = 0 becomes STMMAC_NTMRMD_1SEC. So every dwmac5
platform with asp >= 2 and a CSR clock now has a 1s FSM timeout armed by
default. dwmac-mediatek, which sets tmouten = 1, is affected too.

Before this patch the checker never fired. Now an FSM timeout is reported
through MCSIS, and dwmac5_safety_feat_irq_status() always treats it as
uncorrectable:

	err = (mtl & MCSIS) || (dma & MCSIS);
	corr = false;
	if (err) {
		dwmac5_handle_mac_err(ndev, ioaddr, corr, stats);
		ret |= !corr;
	}

stmmac_safety_feat_interrupt() then turns that into a full device reset:

	if (ret && (ret != -EINVAL)) {
		stmmac_global_err(priv);
		return true;
	}

Is a 1s default safe for FSMs that can legitimately stay active longer?
One example is TX held off by repeated PAUSE frames at 10 Mbit/s, where a
single maximum pause quantum is about 3.4s.

The commit message only says a stuck FSM is now reported. Could it also
say that a timeout now triggers stmmac_global_err()? Could it explain why
only NTMRMD is programmed and LTMRMD keeps its previous value?

> +
> +		value = readl(ioaddr + MAC_FSM_ACT_TIMER);
> +		value &= ~(MAC_FSM_ACT_TIMER_NTMRMD | MAC_FSM_ACT_TIMER_TMR);
> +		value |= FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
> +			 FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
> +		writel(value, ioaddr + MAC_FSM_ACT_TIMER);
> +	}
> +

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 7ad08651675e8..b3f99a6dfcd72 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c

[ ... ]

> @@ -873,6 +875,25 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
>  	value |= XGMAC_TMOUTEN; /* FSM Timeout Feature */
>  	writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);
>  
> +	/* Program the FSM active timer so the timeout checker actually fires.
> +	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
> +	 * Default to a 1s timeout when the platform did not select one.
> +	 */
> +	if (safety_cfg && safety_cfg->tmouten && csr_clk_mhz) {

[Severity: High]
Does this block ever run on an in-tree XGMAC device?

XGMAC_TMOUTEN is set unconditionally just above, but the timer write
requires a non-NULL safety_cfg. dwmac5_safety_feat_config() has a NULL
fallback:

	if (!safety_feat_cfg)
		safety_feat_cfg = &all_safety_feats;

dwxgmac3_safety_feat_config() has no such fallback.

As far as I can see, plat->safety_feat_cfg is only allocated by
dwmac-intel.c, dwmac-mediatek.c and stmmac_pci.c, and all of those are
GMAC4 cores. The XGMAC users never set it: dwmac-socfpga.c, dwmac-tegra.c
and the generic "snps,dwxgmac" binding in stmmac_platform.c.
stmmac_safety_feat_configuration() passes the pointer through unchanged.

Both dwxgmac210_ops and dwxlgmac2_ops use this function, so the path is:

stmmac_hw_setup()
  stmmac_safety_feat_configuration()
    dwxgmac3_safety_feat_config(safety_cfg == NULL)
      XGMAC_TMOUTEN set
      timer block skipped

That leaves TMOUTEN on and NTMRMD at its reset value, which is the state
the commit message calls the bug. Yet the commit message says the problem
was hit on dwxgmac.

Two comments also don't match XGMAC behaviour: "Default to a 1s timeout
when the platform did not select one" here, and "0 selects the default 1s
timeout" in include/linux/stmmac.h.

Would it work to copy the dwmac5 NULL fallback here? Another option is to
gate the timer write the same way TMOUTEN is gated.

> +		u32 ntmrmd = safety_cfg->ntmrmd;
> +
> +		ntmrmd = (ntmrmd >= STMMAC_NTMRMD_1US &&
> +			  ntmrmd <= STMMAC_NTMRMD_64SEC) ?
> +			 ntmrmd : STMMAC_NTMRMD_1SEC;

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 4da7289626387..0d5f48896d8d1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3691,10 +3691,19 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
>  
>  static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
>  {
> +	unsigned int csr_clk_mhz = 0;
> +
>  	if (priv->dma_cap.asp) {
>  		netdev_info(priv->dev, "Enabling Safety Features\n");
> +		if (priv->plat->stmmac_clk)
> +			csr_clk_mhz = clk_get_rate(priv->plat->stmmac_clk) /
> +				      1000000;

[Severity: Medium]
TMR is derived only from plat->stmmac_clk here. Elsewhere the driver
treats a fixed plat->clk_csr as authoritative, as in
stmmac_mdio_bus_config():

	/* If a specific clk_csr value is passed from the platform, this means
	 * that the CSR Clock Range value should not be computed from the CSR
	 * clock.
	 */
	if (priv->plat->clk_csr >= 0)

Does this leave the timer unprogrammed on the Synopsys GMAC5 PCI
platform? In stmmac_pci.c, snps_gmac5_default_data() sets clk_csr =
STMMAC_CSR_250_300M with core_type GMAC4, and stmmac_pci_probe() sets:

	plat->safety_feat_cfg->tmouten = 1;

Nothing assigns stmmac_clk for PCI devices, so csr_clk_mhz is 0.
dwmac5_safety_feat_config() then sets TMOUTEN and skips the timer block
because of the "safety_feat_cfg->tmouten && csr_clk_mhz" check. That is
the state this patch is meant to fix, on a platform that explicitly asks
for the timeout.

There is also a latent problem on Intel mGbE. intel_mgbe_common_data()
registers stmmac_clk as a fixed-rate clock at the PTP rate:

	plat->stmmac_clk = clk_register_fixed_rate(&pdev->dev,
						   clk_name, NULL, 0,
						   plat->clk_ptp_rate);

clk_csr is set separately, to STMMAC_CSR_20_35M or STMMAC_CSR_250_300M.
Intel currently sets tmouten = 0. If it ever enabled tmouten, would TMR
get the PTP rate instead of the CSR clock rate?

> +		if (!csr_clk_mhz)
> +			netdev_warn(priv->dev,
> +				    "unable to get a valid CSR clock rate\n");

[Severity: Low]
Can this warning show up on platforms that never use the rate? It fires
whenever dma_cap.asp is non-zero and csr_clk_mhz is 0. The callees only
use the rate when they program the FSM timer:

  - dwmac5: asp > 1 and tmouten set
  - XGMAC: asp not 2 or 4, and a non-NULL cfg with tmouten set

stmmac_clk is optional. stmmac_probe_config_dt() does:

	if (IS_ERR(plat->stmmac_clk)) {
		dev_warn(&pdev->dev, "Cannot get CSR clock\n");
		plat->stmmac_clk = NULL;
	}

stmmac_pci.c never sets stmmac_clk at all. So dwmac5 with asp == 1,
configurations with tmouten = 0, and the XGMAC platforms would print
this warning on every stmmac_hw_setup() call (open, resume, reinit).

Could the warning be limited to the cases where the timer is actually
programmed?

>  		stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_cap.asp,
> -					  priv->plat->safety_feat_cfg);
> +					  priv->plat->safety_feat_cfg,
> +					  csr_clk_mhz);
>  	} else {
>  		netdev_info(priv->dev, "No Safety Features support found\n");
>  	}
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 00be2df63d220..35c39cd6b6307 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -168,8 +168,25 @@ struct stmmac_safety_feature_cfg {
>  	u32 edpp;
>  	u32 prtyen;
>  	u32 tmouten;
> +	/* FSM normal-mode timeout value (MAC_FSM_ACT_Timer.NTMRMD). The TMR
> +	 * field (CSR clocks per 1us) is derived from the CSR clock by stmmac.
> +	 * 0 selects the default 1s timeout.
> +	 */
> +	u32 ntmrmd;
>  };
>  
> +/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
> +#define STMMAC_NTMRMD_1US		0x1

[Severity: Low]
This isn't a bug, but no in-tree driver assigns ->ntmrmd. So the new
field and the STMMAC_NTMRMD_* constants have no in-tree users, and netdev
usually doesn't accept interfaces without in-tree users.

The commit is also presented as a fix ("the advertised timeout protection
is ineffective", "The issue was hit in testing on dwmac4 and dwxgmac").
There is no Fixes: tag pointing at the commits that added dwmac5/XGMAC
safety feature support.

Would it make sense to split the fix from the new platform knob and add
a Fixes: tag?

> +#define STMMAC_NTMRMD_1MS		0x2
> +#define STMMAC_NTMRMD_16MS		0x3

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116114923.1157920-1-zxyan0222%40gmail.com

