Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865CC606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 04:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sk1Gi6+0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fo2sJyOz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ce09li/mRE3QKbeYZW0hYgjy4tmbydFrUNpFWj4zNGo=; b=Sk1Gi6+0U26S9fHlZNegCsbPEy
	HcpJZ4apYEtcAbOOrDN8QE2XDktk5OaIqrHKsDjCcavB/06/lGYL0GplmJZlxlf3jbhgFj5g03Gtg
	LQK7TxcA+HC1XTb3apBrnxTAmZcVwdkoz77lJqAFqPXMx+ZZmg1UPC1hAe1kjfNKiON2UAh9iUlC9
	+01a7SpC8FLdzkF52hivq7SybyvmHFa2Lg9XUtkzR2DyH6LFkZQGfm0tN24AjHgf2Q+OY1/8Pxh6+
	IfdYvagM9jK7kHsLWLhvwLdbCDW1LozqHCwdxUGxB/97ZqVM25qhzbtYBbPYoS7f50E7jNJno+htK
	F4bWUCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWqX-00000007gL9-2DfT;
	Wed, 18 Nov 2026 04:00:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWqV-00000007gL1-3N7o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 04:00:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3075043BF2;
	Wed, 18 Nov 2026 04:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD081F000C4;
	Wed, 18 Nov 2026 04:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794974431;
	bh=ce09li/mRE3QKbeYZW0hYgjy4tmbydFrUNpFWj4zNGo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fo2sJyOzhoOIx3tm7h6MSHaw2g65Rdo7lkEFqCZA5pMcvsSs2luGzSNylqaOHkBrz
	 ZXLS0J6AXNLqEfhmLzE/Y3me9hev9Ip3uIk8JPtLjryuTxU0yPPgabZKL0Ejp9nev6
	 cLuj9wQ9z9SHNHfgu1EVR45eqD9RI7Ge5XYdMzgadCgVoai8fDGAT7diGzZTQEv534
	 Pj9D5nmoX/pAVeC5kEiFd5Y/W4HGqc9v1Dw7x1ffHULi0ZBa7m42/8BS7SFjaRTGbG
	 PMdTJlIs751SFo+vYN56dGXymMvfZrwsWe49EVzn4EbvMAoo76NrBJnWCEZ76AIL69
	 XXhTAOr7ImL3A==
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, clabbe.montjoie@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 04:00:29 +0000
Message-ID: <179497442968.3136.18415990643273213851@kernel.org>
In-Reply-To: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
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

- [Medium] Clearing EMAC_RX_DO_CRC (EMAC_RX_CTL0 bit 27) whenever
  NETIF_F_RXCSUM is off may also turn off the MAC's Ethernet FCS…
- [Low] When RX checksum offload is turned back on, frames the sun8i MAC
  received while EMAC_RX_DO_CRC was clear can be marked…

--

net: stmmac: dwmac-sun8i: Honor the RX checksum offload setting

Before this patch, sun8i_dwmac_rx_ipc_enable() always set
EMAC_RX_DO_CRC. With the patch, it sets or clears the bit based on
hw->rx_csum, so that turning off RX checksum offload through ethtool
also turns off the hardware checksum engine.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73b..98cc7503bddeb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -705,7 +705,10 @@ static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
>  	u32 v;
>
>  	v = readl(ioaddr + EMAC_RX_CTL0);
> -	v |= EMAC_RX_DO_CRC;
> +	if (hw->rx_csum)
> +		v |= EMAC_RX_DO_CRC;
> +	else
> +		v &= ~EMAC_RX_DO_CRC;

[Severity: Medium]
Does clearing bit 27 of EMAC_RX_CTL0 also turn off the MAC's Ethernet
FCS check, and not only the IP/L4 checksum engine?

The bit is named after the CRC:

    #define EMAC_RX_DO_CRC BIT(27)

The probe code says the hardware features were "copied from Allwinner
drivers". That code sets this bit with the comment "Enable CRC & IPv4
Header Checksum". The Allwinner manuals describe CHECK_CRC as "Calculate
CRC and check the IPv4 Header Checksum".

On this path, sun8i does not have the hardware strip the FCS.
stmmac_rx() removes it in software without checking it:

    /* ACS is disabled; strip manually. */
    if (likely(!(status & rx_not_ls)))
        len -= ETH_FCS_LEN;

The only FCS check left is the hardware RDES0_CRC_ERROR bit, which
ndesc_get_rx_status() turns into discard_frame.

Suppose bit 27 does control CRC calculation. After "ethtool -K ethX rx
off", the path is stmmac_set_features() -> hw->rx_csum = 0 ->
sun8i_dwmac_rx_ipc_enable(). Frames with a corrupted FCS would then no
longer set RDES0_CRC_ERROR. They would reach the stack as good frames,
with the FCS silently stripped. That behaves like NETIF_F_RXALL rather
than "RX checksum offload off".

Is there a datasheet reference or a bad-FCS test showing that bit 27
gates only the L3/L4 checksum? If the hardware ties the two checks
together, a different approach may be needed. For example, keep bit 27
set and, when rx_csum is 0, stop discarding frames whose only error is
the IP or payload checksum.

[Severity: Low]
Can frames that arrive while EMAC_RX_DO_CRC is clear be marked as
checksum-verified once RX checksum offload is turned back on?

When "ethtool -K ethX rx on" runs, stmmac_set_features() publishes the
software flag before the MMIO write that re-enables the engine:

stmmac_set_features() {
    ...
    if (features & NETIF_F_RXCSUM)
        priv->hw->rx_csum = priv->plat->rx_coe;
    else
        priv->hw->rx_csum = 0;
    ...
    stmmac_rx_ipc(priv, priv->hw);
    ...
}

NAPI is not disabled, RX DMA is not stopped and the ring is not drained.
Meanwhile, stmmac_rx() may run on another CPU and read the flag
directly:

    int coe = priv->hw->rx_csum;
    ...
    if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
        (status & csum_none))
        skb_checksum_none_assert(skb);
    else
        skb->ip_summed = CHECKSUM_UNNECESSARY;

sun8i uses normal descriptors. ndesc_get_rx_status() never returns
csum_none, so nothing in the descriptor says whether the hardware
actually checked a given frame.

Any unchecked frame still in the RX ring would then be passed up as
CHECKSUM_UNNECESSARY. That covers frames received before the writel()
in sun8i_dwmac_rx_ipc_enable() and frames received just after it.
Before this patch, the bit was never cleared, so this state could not
happen on sun8i.

Swapping the two writes would narrow the window, but it would not cover
frames already in the ring. Would RX need to be quiesced or drained
across this transition?

>  	writel(v, ioaddr + EMAC_RX_CTL0);
>
>  	return 1;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f%40gmail.com

