Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8230E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NIHKgpip;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j6KfHbaj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XhlAzIOShLXamqfkISKDjFv5wlAzHJo0q2uLVbv54uo=; b=NIHKgpipRtzZsUTwcjTlG0ThGQ
	3l/HQxRZmIcoGqAOy1gqegIHxnoQtNJw6qfJ8nkYYi421PeoEusyeljh9HoU3qyYJrg8BKH6NvQRC
	iL3AfIkagZ/hRaaN90hzw6snNY5lWVWAxDf8vIQEbiD/V1Vf4Hfifn0ihIWUTgbjFoogvhuSeA9B5
	dUvS5nrVijQuRpG2BuNJfN5G7maMmkdV4MYYhpYJgr9moYSXKxHpAPXNnCMfvxozXYL03vqRIvAYk
	vssbF3Q5zDI4Ni5jEbr/xU+Yl23ORG5IsHP2Z5jmOVzHPZ+Nat2WCd23HzUhXVSsEiN8HNVgriBOA
	fKn8TYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWanv-0000000Dbtf-08k7;
	Thu, 26 Nov 2026 14:50:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWans-0000000DbtY-49fZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:50:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B195C41FA1;
	Thu, 26 Nov 2026 14:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBC01F000CF;
	Thu, 26 Nov 2026 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704628;
	bh=XhlAzIOShLXamqfkISKDjFv5wlAzHJo0q2uLVbv54uo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j6KfHbajGACGKybgPg1QbCSt3vnPpvTBVbQqo/sxczFU4BHmH+9EtNsh9uErPHPdl
	 iTQF7HqJXHkvBbJFIqPjZGg8uKUjEz346GYLp4Ijsn9VYR/P2QkxhqyjX9mwypuhTa
	 MWx7OWwqyIEdivEmj06J7KUeZpwIJBuIMXZH9rHiuj9kWvdzc8cX36rQY2F8vX+GfE
	 bjnu7G45ytBv3Ig8Xtz/0HWCQeT19VyVYigkSlq2uSHpHd2lttICLdTM9pMDpcy+gg
	 JTxyBHFzuql1ZR1x4nMlL4ctKuWWcH3+Wrf8fLRJnmakQ6dmeKZjD4hh7Mm02er4zD
	 UifKsWNM9PcxQ==
Subject: Re: [PATCH net-next v13 2/5] net: stmmac: remove software VLAN tag stripping
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 horms@kernel.org, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 matthew.gerlach@altera.com, boon.khai.ng@altera.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, nb@tipi-net.de
Date: Thu, 26 Nov 2026 14:50:26 +0000
Message-ID: <179570462642.3135.18427694806922403936@kernel.org>
In-Reply-To: <20261125-stmmac-rx-mb-v13-2-0f6bac53e8d5@oss.qualcomm.com>
References: <20261125-stmmac-rx-mb-v13-2-0f6bac53e8d5@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In __stmmac_dvr_probe()
  (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c),…
- [Low] The patch carries 'Fixes: 534df0c1724b', which marks it for
  stable backporting.
- [Low] On DWXGMAC (stmmac_rx_8021ad_offload() true),
  __stmmac_dvr_probe() now adds NETIF_F_HW_VLAN_STAG_RX to…

--

net: stmmac: remove software VLAN tag stripping

This removes the software VLAN stripping in stmmac_rx_vlan() and changes
stmmac_has_ip_ethertype() so that it still recognises IPv4/IPv6 behind a
single in-payload C-tag on RX. NETIF_F_HW_VLAN_CTAG_RX and
NETIF_F_HW_VLAN_STAG_RX are now advertised only when the VLAN ops and the
descriptor ops provide real RX VLAN offload.

> The DWXLGMAC mis-advertisement was introduced when the RX VLAN offload
> gate was widened to all xmac cores, so tag the fix accordingly.
>
> With NETIF_F_VLAN_FEATURES possibly empty, EEE RX clock stop may be
> enabled on some platforms; the preceding selftests patch blocks RX
> clock stop while the ethtool selftests run.
>
> This depends on the preceding selftests fix.
>
> Fixes: 534df0c1724b ("net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN stripping")

[Severity: Low]
Is the Fixes: tag in proportion to the change? On DWXLGMAC,
dwxlgmac2_vlan_ops has no .rx_hw_vlan:

const struct stmmac_vlan_ops dwxlgmac2_vlan_ops = {
	.update_vlan_hash = dwxgmac2_update_vlan_hash,
	.enable_vlan = vlan_enable,
	.set_hw_vlan_mode = dwxlgmac2_set_hw_vlan_mode,
};

With the old hw_vlan_en = true, stmmac_rx_hw_vlan() did nothing, and
dwxlgmac2_set_hw_vlan_mode() only sets EDVLP. The tag stayed in the
payload and the VLAN core removed it in software. The only visible effect
seems to have been the wrong CTAG_RX/STAG_RX advertisement.

The same Fixes-tagged patch also does the following:

- removes the software stripping path;
- drops CTAG_RX on every dwmac100/dwmac1000;
- changes the RX checksum trust rules in stmmac_has_ip_ethertype();
- makes STAG_RX user-visible in hw_features;
- depends on the preceding selftests patch.

Through the NETIF_F_VLAN_FEATURES check in stmmac_phylink_setup(), it also
enables EEE RX clock stop on every such platform that does not set
STMMAC_FLAG_RX_CLK_RUNS_IN_LPI, not only on "some platforms".

Could the minimal DWXLGMAC advertisement fix be split out for net, with
the cleanup and its EEE side effects going to net-next?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ca4c7fb11b73f..7896364c43e95 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -8275,15 +8248,17 @@ static int __stmmac_dvr_probe(struct device *device,
>  	ndev->features |= ndev->hw_features | NETIF_F_HIGHDMA;
>  	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
>  #ifdef STMMAC_VLAN_TAG_USED
> -	/* Both mac100 and gmac support receive VLAN tag detection */
> -	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
> -	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
> -		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
> -
> -	if (dwmac_is_xmac(priv->plat->core_type)) {
> +	if (stmmac_rx_8021q_offload(priv)) {
> +		ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
>  		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
>  		priv->hw->hw_vlan_en = true;
>  	}

[Severity: Medium]
Does this make RX clock stop reachable from set_rx_mode again?

dwmac1000 has no .vlan ops, and neither does DWXLGMAC without
vlhash/vlins. With CONFIG_VLAN_8021Q enabled, these cores now end up with
no NETIF_F_VLAN_FEATURES. stmmac_phylink_setup() then does:

	if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI) &&
	    !(priv->dev->features & NETIF_F_VLAN_FEATURES))
		config->eee_rx_clk_stop_enable = true;

As a result the PHY may stop RXC while the link is in LPI.

stmmac_set_rx_mode() runs with BH disabled under netif_addr_lock_bh(). It
cannot use phylink_rx_clk_stop_block(), which needs RTNL and a sleeping
MDIO access:

 *  FIXME: This may need RXC to be running, but it may be called with BH
 *  disabled, which means we can't call phylink_rx_clk_stop*().
 */
static void stmmac_set_rx_mode(struct net_device *dev)
{
	struct stmmac_priv *priv = netdev_priv(dev);

	stmmac_set_filter(priv, priv->hw, dev);

Commit c171e679ee66 notes that the hardware needs RXC when MAC address
configuration registers are written. On these platforms, could a
multicast join/leave, a promisc/allmulti change or a secondary unicast
address update reach stmmac_set_filter() while RXC is stopped? That would
leave the address or hash filter unprogrammed.

The selftests patch covers the ethtool selftests, but the commit message
does not mention this path. dwmac100 should not be affected because it
has no EEE.

These platforms did run with RX clock stop before c171e679ee66, and they
still do with CONFIG_VLAN_8021Q=n. Whether dwmac1000 filter writes
actually fail without RXC is therefore a hardware question.

> +
> +	if (stmmac_rx_8021ad_offload(priv)) {
> +		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
> +		ndev->hw_features |= NETIF_F_HW_VLAN_STAG_RX;
> +	}

[Severity: Low]
Should STAG_RX be added to hw_features here? On DWXGMAC this tells
userspace the bit can be toggled on its own, but stmmac_fix_features()
ties it to CTAG_RX:

	if (stmmac_rx_8021ad_offload(priv)) {
		if (features & NETIF_F_HW_VLAN_CTAG_RX)
			features |= NETIF_F_HW_VLAN_STAG_RX;
		else
			features &= ~NETIF_F_HW_VLAN_STAG_RX;
	}

stmmac_set_features() also has only one combined hw_vlan_en state.

So "ethtool -K <dev> rx-vlan-stag-hw-parse off" with rxvlan on, or "on"
with rxvlan off, is always undone. ethtool then reports [requested off]
or [requested on].

Before this patch STAG_RX was only in features and showed as [fixed],
which matched the coupling. The coupling in stmmac_fix_features() already
adds STAG_RX back when CTAG_RX is re-enabled.

> +
>  	if (priv->dma_cap.vlhash) {
>  		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
>  		if (priv->plat->core_type == DWMAC_CORE_XGMAC)

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125-stmmac-rx-mb-v13-0-0f6bac53e8d5%40oss.qualcomm.com

