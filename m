Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557D8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2v4VNEd3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LXpg6Mlc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8HXTdBx+SxdOqOwpmjK3g8i363gl+UZ3UF6asyHvinI=; b=2v4VNEd3LWBcglb++/kt4RBSS5
	92YNOPeMmRiLomJ0iM93VNAXu01v0jxYX05tjit2gZO1YHn5vXM9BZ96NQBrwp66zs/kZgYpm9d9q
	nlWR4gag0uc2+k7PlS3qnFc/OdiJPgITjKWZ2v5Y9Bjwq3t24cfH+8+p9GGTGsyfgI0knFxa94IgV
	5+0SsxZsurpv1zgdkUQZFT6dvx5DHO+bbyRS2jq6XSb9pxnWsAIZZ9U7vtbFDMD7zQh0ZwGhyQN4V
	tn8l+Q43YVxxtKNf8x2wBa71O5cJMIqpSXwtJiNpPiadZrmKX35xtKkhxD51MWYg3Z0j+/B1GKEZK
	jGFRlGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu0E-0000000Fm6x-18Ql;
	Fri, 27 Nov 2026 11:20:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtzy-0000000Fm33-1Kjm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:20:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C023A62488;
	Fri, 27 Nov 2026 11:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5290B1F00897;
	Fri, 27 Nov 2026 11:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778413;
	bh=8HXTdBx+SxdOqOwpmjK3g8i363gl+UZ3UF6asyHvinI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LXpg6MlcIPEgIQtp4kHnwFCFdeGxlOpim/OSiegx915arepcSeYn2d5oEClkqMGfE
	 lHNYOVsD3nyRjPBrd9pqf5VHqA6c+uW1D4djOqJQyuhgppGlHzoMbXuRUBsaz0taxW
	 d9iaACLPVk7X2NcAPjADTU0gluonkC1GjnmKpCwq0CA7r6aekOclvUfc1/N1qk7eBy
	 zxWng+E/pOp9Alua5j4AeHRUuBIJIHN+Jb/ZSVPa1LWM57uGf8jZaUNYt5EE50fjbb
	 DDQSJoWxvPf4mRIzYncNnV6ZT7F1psIExB8MzwZ1EibwR7ely1kZQoW1s6qeMy/NKK
	 lNNTwhIfEcqYg==
Subject: Re: [PATCH net-next v5] net: stmmac: program the FSM timeout timer
From: netdev-bot+sashiko@kernel.org
To: zxyan0222@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
Date: Fri, 27 Nov 2026 11:20:11 +0000
Message-ID: <179577841185.3135.2742871511764810584@kernel.org>
In-Reply-To: <20261125111929.3395740-1-zxyan0222@gmail.com>
References: <20261125111929.3395740-1-zxyan0222@gmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch arms a 4 s FSM timeout that had no effect before.
- [Medium] On platforms where csr_clk_mhz ends up 0, the fix silently
  does nothing.
- [Low] With this patch, a timed-out FSM is no longer just 'reported'.
- [Low] The patch is presented as a fix for a functional defect found in
  testing: TMOUTEN is enabled but MAC_FSM_ACT_Timer is never programmed.

--

net: stmmac: program the FSM timeout timer

This commit programs the MAC_FSM_ACT_Timer register in
dwmac5_safety_feat_config() and dwxgmac3_safety_feat_config(), so the FSM
timeout checker enabled by TMOUTEN actually fires. It uses a fixed 4s
NTMRMD timeout and derives the TMR field from the stmmac_clk rate. The rate
is passed down through a new csr_clk_mhz argument to the safety_feat_config
callback.

> The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
> not reported through the safety interrupt despite TMOUTEN being set.

[Severity: Low]
This isn't a bug, but should the commit message mention that a timed-out
FSM now leads to a full adapter reset, not just a report?

dwmac5_safety_feat_irq_status() and dwxgmac3_safety_feat_irq_status()
hard-code corr = false for MCSIS errors. As a result,
stmmac_safety_feat_interrupt() calls stmmac_global_err().

When a usable stmmac_clk is present, this becomes the default in these
cases:

  - GMAC4/5 cores with asp >= 2 and tmouten set. This includes platforms
    with a NULL safety_feat_cfg, which fall back to all_safety_feats with
    .tmouten = 1.

  - Every XGMAC core with asp != 0x4, because
    dwxgmac3_safety_feat_config() ignores safety_cfg and sets
    XGMAC_TMOUTEN unconditionally.

> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

[Severity: Low]
This fixes a defect that was hit in testing. Should it carry a Fixes: tag
and say whether it is meant for net or net-next?

The missing timer programming goes back to the commits that first enabled
TMOUTEN. For GMAC that is "net: stmmac: Add support for DWMAC5 and
implement Safety Features". For XGMAC it is "net: stmmac: Implement Safety
Features in XGMAC core".

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> index f1bb981cab7cd..37e70b82c8b56 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c

[ ... ]

> @@ -245,6 +247,19 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
>  		value |= TMOUTEN; /* FSM Timeout Feature */
>  	writel(value, ioaddr + MAC_FSM_CONTROL);
>  
> +	/* Program the FSM active timer so the timeout checker actually fires.
> +	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
> +	 * Use a 4s timeout.
> +	 */
> +	if (safety_feat_cfg->tmouten && csr_clk_mhz) {
> +		value = readl(ioaddr + MAC_FSM_ACT_TIMER);
> +		value &= ~(MAC_FSM_ACT_TIMER_NTMRMD | MAC_FSM_ACT_TIMER_TMR);
> +		value |= FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD,
> +				    STMMAC_NTMRMD_4SEC) |
> +			 FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
> +		writel(value, ioaddr + MAC_FSM_ACT_TIMER);
> +	}

[Severity: Medium]
The 4s value is justified by a single PAUSE frame with 0xffff quanta at
10 Mb/s, which stalls the transmitter for about 3.36s. The commit message
also accepts that a flow-control stall counts against this timer ("could
wrongly report a flow-control stall as a stuck FSM").

Can a link partner keep the transmitter paused for longer than that? Under
802.3x the peer can send a new PAUSE frame before the current one expires.
A congested switch or a misbehaving peer could then hold off transmission
indefinitely.

If a refreshed pause doesn't restart the FSM activity timer, would TTES
fire after about 4.19s at any link speed?

That error is handled as uncorrectable:

dwmac5_safety_feat_irq_status()
    err = (mtl & MCSIS) || (dma & MCSIS);
    corr = false;
    if (err) {
        dwmac5_handle_mac_err(ndev, ioaddr, corr, stats);
        ret |= !corr;
    }

stmmac_safety_feat_interrupt()
    if (ret && (ret != -EINVAL)) {
        stmmac_global_err(priv);

dwxgmac3_safety_feat_irq_status() behaves the same way. The reset path goes
back through stmmac_safety_feat_configuration(), which re-arms the same
timer. Could a sustained PAUSE stream then cause repeated adapter resets?

Separately, only NTMRMD (bits 19:16) and TMR are programmed here. The
read-modify-write keeps the rest of MAC_FSM_ACT_Timer unchanged. LTMRMD
(bits 23:20 in the databook) is not defined or mentioned, so it stays at
its reset value.

Is a paused TX FSM timed by NTMRMD, or by the large mode LTMRMD field?

The margin is also small: 4.194s against 3.36s is about 25%.

The same timeout is programmed in dwxgmac3_safety_feat_config(), where
XGMAC_TMOUTEN is set unconditionally. Platforms there cannot opt out
through safety_feat_cfg->tmouten.

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ca4c7fb11b73f..4ee4952a14273 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3707,10 +3707,16 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
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
Can csr_clk_mhz end up as 0 here on platforms that ask for the FSM
timeout? It stays 0 in three cases:

  - plat->stmmac_clk is NULL.
  - The clock rate is below 1 MHz.
  - CONFIG_HAVE_CLK=n, where the clk_get_rate() stub returns 0.

In that case both config functions still set the enable bit but skip the
MAC_FSM_ACT_Timer write. dwmac5_safety_feat_config() sets TMOUTEN based on
safety_feat_cfg->tmouten alone, and dwxgmac3_safety_feat_config() sets
XGMAC_TMOUTEN unconditionally. The timer writes are gated like this:

dwmac5_safety_feat_config()
    if (safety_feat_cfg->tmouten && csr_clk_mhz) {

dwxgmac3_safety_feat_config()
    if (csr_clk_mhz) {

Doesn't that leave the state the commit message calls broken, with
TMOUTEN set, NTMRMD at 0, and nothing logged?

At least one in-tree platform seems to hit this. stmmac_pci.c never
assigns plat->stmmac_clk, but it does request the timeout:

snps_gmac5_default_data()
    plat->clk_csr = STMMAC_CSR_250_300M;

stmmac_pci_probe()
    plat->safety_feat_cfg->tmouten = 1;

Tegra MGBE (XGMAC) gets its platform data from
devm_stmmac_probe_config_dt(), which looks up the "stmmaceth" clock. That
clock is not in the Tegra mgbe_clks list, so stmmac_clk is NULL there too.
If that IP reports asp, the XGMAC timer write would also be skipped.

stmmac_mdio_bus_config() already prefers the platform-provided CSR clock
over the stmmac_clk rate:

    if (priv->plat->clk_csr >= 0)
        value = priv->plat->clk_csr;

Could this fall back to a rate derived from plat->clk_csr, or at least
warn when the timer cannot be programmed?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125111929.3395740-1-zxyan0222%40gmail.com

