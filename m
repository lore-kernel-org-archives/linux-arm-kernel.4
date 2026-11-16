Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B1B60A260A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dPxWKY/g;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jsG1lsIw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r132SAdA06PRgqTYVS2JcCR63njeCiFKuORU3KC+nDs=; b=dPxWKY/g8hDLHJtQ7PKGHrzb97
	jVR1vl5I2vRpFUEPX1DQcOHzdlWwh/vR5bRmMM6Rt1hyLfIzJTur2gFt8H2/z/zGpmw1NMmiU9q0N
	+PJg6K2H3dKcH5GTWG4zZG1oOQWIAz/LQnr5/Mxj9KbMkBs/+XzcJTy/2eLMk0Uhx5LnsnEzOQkIe
	Hvm5cwIKmIUCdcKoRro4+TNYAyoDsfAnFEaOuJYL4vk6yu8CthN17IeJz2aHNlvCsRqSOCPcbjIop
	Z6kF0MM4pJNEY6WF/qUGjQRKfLcVKOSCz2tBAwR41taLNlrISToPFAus0ab5P0jj5De+w2GFxpC6p
	7kT7TKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxAD-00000002iZY-2mPj;
	Mon, 16 Nov 2026 13:54:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxAC-00000002iZG-1KwK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:54:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 64E6B601FF;
	Mon, 16 Nov 2026 13:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8A31F00939;
	Mon, 16 Nov 2026 13:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837267;
	bh=r132SAdA06PRgqTYVS2JcCR63njeCiFKuORU3KC+nDs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jsG1lsIwomGEJPRulw+J9IOMIPhSEI/1L3q7SbqlvCsL+Jh/xsOVnDRT60s8cJdnU
	 ET+U8E1zh5FKiqrW/6V80mUSz0od/cb3Ah7dG1xmNxrF288O9fWj4YnRgkUeRd/OVk
	 RGI+g0ho4SEDBzVI0SUoUDHkiSsRvqz45K5wBNbJOV0tqYo52QSU9mCwZjQ2viv+3y
	 fXws0v9H6L4+kaMBX/gzGEiJVIrp2uWQrQAKJ7UwTB5ieTpQk2SVmThCOz5qqKuV/i
	 nEfTNJnbUEawV1krTs/YV+veN7EKw+ED/k1eKzAygGv+RgYxMKqY5drqKe42kD7cn2
	 98nipByPKcaoQ==
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-sun8i: Enable jumbo
 frames up to MTU 2018
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 clabbe.montjoie@gmail.com
Date: Mon, 16 Nov 2026 13:54:25 +0000
Message-ID: <179483726554.3136.14444857396156719322@kernel.org>
In-Reply-To: <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
References: <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says "A device tree max-frame-size can
  still lower it", but for this driver that is false.
- [Low] The max_mtu clamp fixes a real, user-visible bug, but the commit
  is framed as a feature ("Enable jumbo frames") and has no Fixes: tag.

--

net: stmmac: dwmac-sun8i: Enable jumbo frames up to MTU 2018

This patch sets the JUMBO_FRM_EN bit in EMAC_RX_CTL0 from
sun8i_dwmac_core_init(), so the sun8i EMAC accepts frames longer than 1518
bytes. It also clamps plat_dat->maxmtu to 2018 in sun8i_dwmac_probe(). With
that limit, a frame with two VLAN tags and the FCS fits in a single 2044
byte descriptor buffer.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 0c82662fbe6ea..a18d3daf6a3ff 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c

[ ... ]

> @@ -645,6 +659,15 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
>  
>  	v = (8 << EMAC_BURSTLEN_SHIFT); /* burst len */
>  	writel(v, ioaddr + EMAC_BASIC_CTL1);
> +
> +	/* Without JUMBO_FRM_EN the receiver flags every frame longer than
> +	 * 1518 bytes (1522 with a VLAN tag) as a length error, so any MTU
> +	 * above 1500 is unusable. Frames are still bounded by the RX
> +	 * descriptor buffer size, see EMAC_MAX_MTU.
> +	 */
> +	v = readl(ioaddr + EMAC_RX_CTL0);
> +	v |= EMAC_RX_JUMBO_FRM_EN;
> +	writel(v, ioaddr + EMAC_RX_CTL0);
>  }

[Severity: Low]

JUMBO_FRM_EN is now set unconditionally. A peer can therefore send oversized
frames that reach the RX DMA even at the default MTU of 1500, and those
frames span several descriptors.

Dropping them correctly depends on commit 834ec9530832 ("net: stmmac: drop
split frames on AF_XDP zero-copy RX"). That commit made
ndesc_get_rx_status() return discard_frame | rx_not_ls for non-last
descriptors, and made stmmac_rx() test status & discard_frame and drain the
split frame.

On a tree without that commit, wouldn't stmmac_rx() treat the last fragment
of such a frame as a new packet? The commit message cites 834ec9530832 only
as background. Could it be listed as a prerequisite for backporters?

Related to this, the max_mtu clamp in sun8i_dwmac_probe() also fixes an
existing problem, but the patch has no Fixes: tag. Before this patch, the
driver advertised a max_mtu of 3712 and was in this state:

- stmmac_hw_init() forces chain mode for STMMAC_FLAG_HAS_SUN8I.
- stmmac_xmit() calls stmmac_is_jumbo_frm() only for enh_desc.
- norm_set_tx_desc_len_on_chain() masks the length to 11 bits:

    p->des1 |= cpu_to_le32(len & TDES1_BUFFER1_SIZE_MASK);

So with an MTU between 2048 and 3712, a linear TX frame longer than 2047
bytes was silently truncated. Would a Fixes: tag make sense for that part?

[ ... ]

> @@ -1209,6 +1232,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->mac_setup = sun8i_dwmac_setup;
>  	plat_dat->tx_fifo_size = 4096;
>  	plat_dat->rx_fifo_size = 16384;
> +	plat_dat->maxmtu = min(plat_dat->maxmtu, EMAC_MAX_MTU);

[Severity: Medium]

The commit message says:

    A device tree max-frame-size can still lower it.

Is that true for this driver? stmmac_probe_config_dt() reads the property
only for a few compatibles:

stmmac_platform.c:stmmac_probe_config_dt() {
    ...
	if (of_device_is_compatible(np, "st,spear600-gmac") ||
		of_device_is_compatible(np, "snps,dwmac-3.50a") ||
		of_device_is_compatible(np, "snps,dwmac-3.70a") ||
		of_device_is_compatible(np, "snps,dwmac-3.72a") ||
		of_device_is_compatible(np, "snps,dwmac")) {
		...
		of_property_read_u32(np, "max-frame-size", &plat->maxmtu);
    ...
}

None of the compatibles in sun8i_dwmac_match[] can carry an snps,dwmac
fallback under allwinner,sun8i-a83t-emac.yaml. So plat_dat->maxmtu always
holds the JUMBO_LEN default (9000) when this min() runs, and the line always
sets it to 2018.

The binding does accept max-frame-size on these nodes, because it includes
snps,dwmac.yaml through allOf, and that pulls in ethernet-controller.yaml.
If a board sets max-frame-size to cap the MTU for a PHY or switch limit, the
driver ignores it without a warning.

Should the commit message be corrected, or should the driver parse
max-frame-size itself?

If the property is ever parsed for these nodes, the min() has a second
problem. plat->maxmtu is an int filled by of_property_read_u32(). A value
below min_mtu, or one that is negative as an int, passes straight through
min(). stmmac_dvr_probe() then only warns:

	if (priv->plat->maxmtu < ndev->min_mtu)
		dev_warn(priv->device,
			 "%s: warning: maxmtu having invalid value (%d)\n",
			 __func__, priv->plat->maxmtu);
	else if (priv->plat->maxmtu < ndev->max_mtu)
		ndev->max_mtu = priv->plat->maxmtu;

In that case ndev->max_mtu stays at SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN).
Wouldn't that bring back the TX truncation and the RX split-frame drops that
this patch is meant to prevent?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17%40gmail.com

