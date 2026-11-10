Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE57A606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 20:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0NliFZCk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Inoqt/Y6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RLqXByamkZhJZ65JXbFgm2scLbRUIk2K/YyB3fLw6kI=; b=0NliFZCkokV6NP
	81yteuSiYfbGWYJjSA87CYkl0Fk1C4XaRiKbqrz2sT1O2Hz/3wsY9MuCUCEGK1r8vw+Nu0aJ5C71T
	D104RsxPPNXRedkpGYnQkrn7i8evovJzf1hb07+AZulHzxfDBryUrdroMUk7MzBLKGvoTi1Hsd7Fo
	FFsm+ISYthY3HZUPDnTb66jMYURITxG2uJZ2ijh4QHi5MJ1V0teh0dg8XoTfOVp/vx0EdLDboTiwA
	GgJ/fSFMhEGyZ4+1KZPFCfa5sKKRIzRJNjm3PnVgbHG2fl5rl0/BiZfjjdSgEH1dwGAkXFdHKKgVe
	AW13e509HhxHEN9nQhUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQs9A-00000004xZ2-2ms8;
	Tue, 10 Nov 2026 20:08:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQs99-00000004xYZ-2zvM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 20:08:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12834413C9;
	Tue, 10 Nov 2026 20:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCB41F008A1;
	Tue, 10 Nov 2026 20:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794341327;
	bh=RLqXByamkZhJZ65JXbFgm2scLbRUIk2K/YyB3fLw6kI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Inoqt/Y6Ud+R20HCM4wfUapvecOwDM/U2H6VjptTnjQj/O01GUkxAbinHYO7ck9+J
	 56LHS4ItjN8gCoeTjrqSR8XmBgjzqT+Wu/dg67DHPve+WwC+PE2qhNnmon/K3zA6fY
	 B61xzmUB+fzuvC/jaiZDry5jVAkHhSw8wrNxt2Ri9ptBZ2+mxMv5b42eOISOq34qco
	 h6O0AizjOlJaFQzuqG2Maq4iBZMa0RAUfjN87ifHlSr4P/q2xf7nRjBFoT2hwHVuB/
	 1DFAibUWAZcHqLvCQrXzLKZLh8Xi4BFLU9swlvdccGNmJX1kXcvJFRsxBTWCSczutj
	 k8qQQynPgW0+w==
From: Jakub Kicinski <kuba@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-socfpga: Add support for Agilex5 TSN GMAC with FPGA converter
Date: Tue, 10 Nov 2026 12:08:44 -0800
Message-ID: <20261110200844.2190972-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104040320.18077-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20261104040320.18077-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: stmmac: dwmac-socfpga: Add support for Agilex5 TSN GMAC with FPGA converter

This adds the "altr,socfpga-stmmac-agilex5-tsn" compatible for Agilex5
boards where an FPGA GMII-to-RGMII converter between the MAC and the PHY
supplies the RGMII delays. socfpga_get_plat_phymode() now returns a new
mac_interface field. The new setup_plat_dat callback forces that field
to GMII and rewrites any RGMII phy_interface to plain RGMII.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 6d4bc1fe8f751..131d2a98c863f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c

[ ... ]

>  static phy_interface_t socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
>  {
> -	return dwmac->plat_dat->phy_interface;
> +	return dwmac->mac_interface;
>  }

[Severity: Low]
This isn't a bug, but socfpga_gen5_set_phy_mode() and
socfpga_gen10_set_phy_mode() both still have this comment:

	/* Overwrite val to GMII if splitter core is enabled. The phymode here
	 * is the actual phy mode on phy hardware, but phy interface from
	 * EMAC core is GMII.
	 */

After this change, phymode comes from dwmac->mac_interface, which is the
MAC-side mode. For the agilex5-tsn compatible it is GMII while the PHY
runs RGMII, so the comment now says the opposite of what phymode holds.

Should the comment be updated to match the new meaning? The same applies
to the name socfpga_get_plat_phymode().

[ ... ]

> @@ -673,10 +676,28 @@ static const struct socfpga_dwmac_ops socfpga_agilex5_ops = {
>  	.setup_plat_dat = socfpga_agilex5_setup_plat_dat,
>  };
>  
> +static void socfpga_agilex5_tsn_gmac_setup_plat_dat(struct socfpga_dwmac *dwmac)
> +{
> +	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
> +
> +	socfpga_agilex5_setup_plat_dat(dwmac);
> +
> +	/* FPGA converter supplies RGMII delays; MAC uses GMII, PHY gets plain RGMII */
> +	dwmac->mac_interface = PHY_INTERFACE_MODE_GMII;

[Severity: Medium]
mac_interface is forced to GMII for every phy-mode. phy_interface is only
rewritten for RGMII variants. What happens with phy-mode "sgmii" or
"1000base-x"? The altr,socfpga-stmmac.yaml phy-mode enum allows both for
this compatible.

In that case socfpga_get_plat_phymode() returns GMII.
socfpga_dwmac_fix_mac_speed() then disables the SGMII adapter on every
link-up and never turns it back on:

	if (sgmii_adapter_base)
		socfpga_sgmii_config(dwmac, false);
	...
	if ((phymode == PHY_INTERFACE_MODE_SGMII ||
	     phymode == PHY_INTERFACE_MODE_1000BASEX) && sgmii_adapter_base)
		socfpga_sgmii_config(dwmac, true);

socfpga_gen10_set_phy_mode() also skips its final enable:

	if (phymode == PHY_INTERFACE_MODE_SGMII)
		socfpga_sgmii_config(dwmac, true);

Meanwhile phylink and the Lynx PCS keep using the DT mode. The
GMII-to-SGMII adapter would stay disabled while an SGMII or 1000base-x
link comes up, and nothing reports the problem.

Should the GMII override also be guarded by phy_interface_mode_is_rgmii()?
The other option would be to reject non-RGMII modes for this compatible.

> +	if (phy_interface_mode_is_rgmii(plat_dat->phy_interface))
> +		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;

[Severity: Medium]
If the converter always adds both the TX and RX delays, rgmii-id seems to
be the only phy-mode that describes the board consistently. Is that
right?

"rgmii", "rgmii-txid" and "rgmii-rxid" each describe the PCB as providing
the delay in at least one direction. The converter would then add its
delay on top of that. This code rewrites all of them to plain RGMII
without a warning, so the link could fail with no diagnostic.

The stmmac core already handles MACs with fixed internal delays. With
plat_dat->has_internal_tx_delay and has_internal_rx_delay set (as
dwmac-ultrarisc.c does), stmmac_pltfr_probe() runs:

	if (plat->has_internal_tx_delay || plat->has_internal_rx_delay) {
		plat->phy_interface =
			phy_fix_phy_mode_for_mac_delays(plat->phy_interface,
							plat->has_internal_tx_delay,
							plat->has_internal_rx_delay);
		if (plat->phy_interface == PHY_INTERFACE_MODE_NA)
			return dev_err_probe(&pdev->dev, -EINVAL,
					     "unsupported phy interface mode\n");
	}

When both delays are set, phy_fix_phy_mode_for_mac_delays() maps rgmii-id
to rgmii and returns PHY_INTERFACE_MODE_NA for the other three modes:

	if (mac_txid && mac_rxid) {
		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
			return PHY_INTERFACE_MODE_RGMII;
		return PHY_INTERFACE_MODE_NA;
	}

Documentation/devicetree/bindings/net/ethernet-controller.yaml says this
about MACs with hard coded delays:

  It does however mean that a 'phy-mode' of 'rgmii' is now invalid, it
  cannot be supported, [...] Thus the MAC should report a fatal error for
  any modes which cannot be supported.

Could has_internal_tx_delay and has_internal_rx_delay replace the
open-coded rewrite here? Then inconsistent phy-modes would be rejected at
probe time.

> +}
> +
> +static const struct socfpga_dwmac_ops socfpga_agilex5_tsn_gmac_ops = {
> +	.set_phy_mode = socfpga_gen10_set_phy_mode,
> +	.setup_plat_dat = socfpga_agilex5_tsn_gmac_setup_plat_dat,
> +};

[ ... ]

