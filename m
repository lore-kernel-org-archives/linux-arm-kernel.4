Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10811606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EyzGqVGl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGeqiLGv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KSEeh67sBSl8sIpNlrndQe4Z/1v2xOVb0YY4a7skXG4=; b=EyzGqVGl+zemQPQz2+9NonPaCD
	XLs2YLgDsPvjPoFLOgVEHWmOzHaIdNwnRLFKkYTH/X3AjVepo6staffAKEijmXkOpdZvePR+9gi3M
	hMcSxZ1yCfB26treXLURDtjZgx7qCxmaJvcsqXEkniqBKRfDlqO7aIlSbvp8uuqjDSK67ekXC06HL
	mg40IIdHOd1ng38vgWFG2DlDdclH8Am9lFKbGJ6oSBFLzpkqDVhAP7aXwN9UX9oTDmlpY6koKVvdp
	cB0/DqLsvBgfeBXRmkJGRsLJi0rQn6gi1zUngkkIiPapyljwAFts4jToLrL5xm1MUoJiIAVj11vDW
	TxJfxDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWud0-0000000FvsE-0Ril;
	Fri, 27 Nov 2026 12:00:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWucz-0000000Fvs1-22F6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:00:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08422437C2;
	Fri, 27 Nov 2026 12:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AD01F00893;
	Fri, 27 Nov 2026 12:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780832;
	bh=KSEeh67sBSl8sIpNlrndQe4Z/1v2xOVb0YY4a7skXG4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BGeqiLGvmtz6wML/hLm/I0ulbG3cd12KoGOEax3nm7FKWy2VEa3cLOR7Ea5SRoaU8
	 YuzGNbIVkfnBKPdubyGT7pICc9UcJJzNo5RFJuIwsLcVwX1KCCUsnY5e7gLqC/11Fs
	 JbzjniiBnONjWPu/J+JVWenjVsnsumDpoqJIdIrvQINOD/Pze3gpEajRikUQ+wjSuJ
	 wwwcRjx5JISz9v7uZYbvkcZmlZov9vUbst9AgZ9dgFzNoQbmL14hya9CRmCg3iRn7o
	 mzCL1lzNPGirySVXH5o4OuL5qUFfXUZw0g8sAAO7ngJw6cCcyVZklwW/FO6YOqM+Nm
	 /c1SdX27KEkCg==
Subject: Re: [PATCH net-next v6] net: stmmac: program the FSM timeout timer
From: netdev-bot+sashiko@kernel.org
To: zxyan0222@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
Date: Fri, 27 Nov 2026 12:00:31 +0000
Message-ID: <179578083166.3135.13505754138480842888@kernel.org>
In-Reply-To: <20261126115912.3145086-1-zxyan0222@gmail.com>
References: <20261126115912.3145086-1-zxyan0222@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] stmmac_safety_feat_configuration() takes csr_clk_mhz only from
  clk_get_rate(priv->plat->stmmac_clk) / 1000000.
- [Medium] With NTMRMD now set to 4s, an FSM timeout raises a MAC safety
  error.
- [Low] The patch fixes a defect that users can see.

--

net: stmmac: program the FSM timeout timer

This patch programs MAC_FSM_ACT_Timer on dwmac5 and xgmac cores after
TMOUTEN is enabled, so that the FSM timeout checker actually fires. TMR is
derived from clk_get_rate(stmmac_clk) in MHz and NTMRMD is set to a 4s
timeout. The safety_feat_config callback gains a csr_clk_mhz argument to
carry the rate down.

> The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
> not reported through the safety interrupt despite TMOUTEN being set.

[Severity: Low]
Since this fixes a problem users can see, should it carry Fixes: tags and
target net? Each core has its own origin commit.

The DWMAC5 path dates from:

Fixes: 8bf993a5877e ("net: stmmac: Add support for DWMAC5 and implement Safety Features")

The XGMAC path dates from:

Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")

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
What happens once this 4s timer expires? Every MAC safety error is
handled as uncorrectable in dwmac5_safety_feat_irq_status():

	corr = false;
	if (err) {
		dwmac5_handle_mac_err(ndev, ioaddr, corr, stats);
		ret |= !corr;

stmmac_safety_feat_interrupt() then does:

	if (ret && (ret != -EINVAL)) {
		stmmac_global_err(priv);

That turns the carrier off, sets STMMAC_RESET_REQUESTED and resets the
whole controller. dwxgmac3_safety_feat_irq_status() takes the same path.
Before this patch NTMRMD was 0, so this path never ran.

The commit message only says a stuck FSM will now be "reported". Should it
mention that every timeout now causes a full controller reset?

Is 4s enough margin? The commit message says "a shorter timeout could
wrongly report a flow-control stall as a stuck FSM". It only accounts for
a single maximum-quanta PAUSE frame (about 3.36s at 10 Mb/s).

A congested link partner can keep sending fresh PAUSE frames before the
quanta run out, so the transmitter stays paused indefinitely. If PAUSE
stalls count toward the TX FSM activity timer, as the commit message
implies, could back-pressure from a peer that lasts longer than about
4.19s cause repeated resets? Whether a fresh PAUSE frame restarts the
timer is hardware behaviour that can't be confirmed from the code alone.

Was there a reason not to use one of the longer encodings (16s, 32s or
64s)?

On XGMAC, dwxgmac3_safety_feat_config() programs the timer whenever
csr_clk_mhz is non-zero:

	if (csr_clk_mhz) {

It doesn't check safety_cfg->tmouten, so platforms have no way to opt out
of the new timeout.

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

[Severity: High]
What happens on platforms that request tmouten but have no stmmac_clk, or
whose stmmac_clk runs below 1 MHz? In that case csr_clk_mhz stays 0.

dwmac5_safety_feat_config() still sets TMOUTEN, but skips the timer write
without logging anything:

	if (safety_feat_cfg->tmouten && csr_clk_mhz) {

dwxgmac3_safety_feat_config() always sets XGMAC_TMOUTEN and also skips the
write when csr_clk_mhz is 0.

At least two in-tree users that explicitly request the timeout checker
appear to end up in this state.

stmmac_pci.c sets plat->safety_feat_cfg->tmouten = 1 and plat->clk_csr =
STMMAC_CSR_250_300M for the GMAC5 PCI device, but it never assigns
plat->stmmac_clk.

dwmac-mediatek.c also sets tmouten = 1 and probes through
devm_stmmac_probe_config_dt(), which looks up the "stmmaceth" clock:

	plat->stmmac_clk = devm_clk_get(&pdev->dev,
					STMMAC_RESOURCE_NAME);
	if (IS_ERR(plat->stmmac_clk)) {
		dev_warn(&pdev->dev, "Cannot get CSR clock\n");
		plat->stmmac_clk = NULL;

The mediatek-dwmac binding lists axi, apb, mac_main, ptp_ref,
rmii_internal and mac_cg as clock-names, with no "stmmaceth". As a result
stmmac_clk ends up NULL.

On both platforms TMOUTEN is enabled while NTMRMD stays 0. That is the
state the commit message describes as broken.

Could this fall back to plat->clk_csr? stmmac_mdio_bus_config() already
treats plat->clk_csr >= 0 as the platform's CSR clock range. Failing that,
could the driver warn, or leave TMOUTEN off when the timer can't be
programmed?

Separately, stmmac_clk is not always the CSR clock. dwmac-intel registers
it at the PTP reference rate, and include/linux/stmmac.h says it may be
hclk_i, clk_csr_i, aclk_i or clk_app_i. Where it differs from the real CSR
clock, TMR would be off by a factor of f_stmmac/f_csr, and the 4s timeout
would scale by the same factor.

No in-tree platform was found that hits this case, since Intel sets
tmouten = 0 and does not use XGMAC.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126115912.3145086-1-zxyan0222%40gmail.com

