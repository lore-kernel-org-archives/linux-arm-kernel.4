Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E4606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wXPIH7xY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eFigLCy/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K2ju9qj8VW7F0OaAq/MmzwyhBksHQqR8HS2jOmsdH9M=; b=wXPIH7xY+/k2gEPVQAh+evXcun
	uwMLcvGJNOa3QTACRX4MCha/iLnQFW7Q8gurE84D84vXzjRBdA9wEcotyQeSBD5nG0CokDH2lL+1C
	grbYCFm35OQdwpTLkSN/CRiEiLKQhHw7gJKeT8/RYaEKPoNqJT0sliFoKw3zjygMGXiaYgkeLADau
	k/lkvF28akU78QGsGDih6Cj7tDYlRfR21Zl5F+nNnl0ygu21rYD05u6k5GzZTPoNSdorE/HCia+0t
	ive27Ejca2XpHVXYA8S6wXbruH6NxKoKwvlGKuta/DtxGYqGKd4ko41UZCkju38FNY4VM/S3WHrpl
	SwEyQ6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWD4r-00000009zdQ-3RpU;
	Wed, 25 Nov 2026 13:30:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWD4q-00000009zdG-36ru
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:30:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F977436D3;
	Wed, 25 Nov 2026 13:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A73A1F000C6;
	Wed, 25 Nov 2026 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795613424;
	bh=K2ju9qj8VW7F0OaAq/MmzwyhBksHQqR8HS2jOmsdH9M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eFigLCy/qHxP/IG/Ib86GzqMKh9R3nM91EMHHjqEw1c6Wk6rvG0JJlhNhVgiFnCzt
	 ueSxu750Kzf2JaP0c3ikK5daCp6C/kzXUiC2SJRGgxC0n9YtT+X+hccxcCM8iTn4MD
	 SURxlTf8eynHBsK3H2BdbF7FVy5Us4jb++GAOtbbw0OpxNhgp2SJpdCbV4VK9Deq4I
	 aErE3FO36vzIqL+MLHjwzeflMsYCBwbAkFYmnM80meqqhWnvryMt/0C49+yKoUHEib
	 qwEy3MzGCKH6kDRs6Y+vuDTkCT6QSa88QdAwuOSzVNSK9im0A2Y2LYicR80m8GDAhl
	 Du4M3Ip91bUuw==
Subject: Re: [PATCH net v2] net: stmmac: Advertise TX checksum offload only
 when supported
From: netdev-bot+sashiko@kernel.org
To: prabhakar.csengg@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, vinschen@redhat.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 prabhakar.csengg+renesas@gmail.com, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Date: Wed, 25 Nov 2026 13:30:22 +0000
Message-ID: <179561342293.3135.3941627441868252725@kernel.org>
In-Reply-To: <20261124132802.2003605-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261124132802.2003605-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The fix does not cover the bugged_jumbo case, so DSA user
  ports can still advertise TX checksum offload that the stmmac conduit…

--

I found one possible regression: on bugged_jumbo cores, DSA user ports can still show TX checksum offload after the conduit has turned it off. The draft reply for the list follows.

net: stmmac: Advertise TX checksum offload only when supported

This patch changes __stmmac_dvr_probe() to add NETIF_F_IP_CSUM and
NETIF_F_IPV6_CSUM to hw_features only when priv->plat->tx_coe is set.
The aim is to keep TX checksum flags that stmmac_fix_features() later
clears out of vlan_features. DSA user ports inherit vlan_features.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a685ce4638f61..d32d3e7b1b8c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8147,8 +8147,9 @@ static int __stmmac_dvr_probe(struct device *device,
>  	ndev->xdp_metadata_ops = &stmmac_xdp_metadata_ops;
>  	ndev->xsk_tx_metadata_ops = &stmmac_xsk_tx_metadata_ops;
>  
> -	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
> -			    NETIF_F_RXCSUM;
> +	ndev->hw_features = NETIF_F_SG | NETIF_F_RXCSUM;
> +	if (priv->plat->tx_coe)
> +		ndev->hw_features |= NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;

[Severity: Medium]
Does this cover every case where the conduit drops TX checksum offload?
stmmac_fix_features() has a second reason to clear these flags, and it
depends on the MTU:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_fix_features() {
    ...
	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
		features &= ~NETIF_F_CSUM_MASK;
    ...
}

In stmmac_probe_config_dt(), the snps,dwmac-3.40a compatible sets both
tx_coe and bugged_jumbo. The snps,dwmac-3.610 and snps,dwmac-3.710
compatibles set bugged_jumbo, and tx_coe comes from dma_cap.

On those cores the new tx_coe check still passes. The checksum flags are
then copied into vlan_features once, during probe, while the MTU is still
1500:

	ndev->vlan_features |= ndev->features;

When such a stmmac is a DSA conduit, the DSA setup raises its MTU:

dsa_conduit_setup()
  dev_set_mtu(dev, ETH_DATA_LEN + tag overhead)
    stmmac_change_mtu()
      netdev_update_features()
        stmmac_fix_features()    /* clears NETIF_F_CSUM_MASK */

This clears the checksum bits from conduit->features only. vlan_features
is not updated afterwards.

The user ports take their features from conduit->vlan_features in
dsa_user_setup_tagger() and dsa_user_create():

	user->features = conduit->vlan_features | NETIF_F_HW_TC;
	...
	user_dev->vlan_features = conduit->vlan_features;

Nothing in net/dsa appears to react to NETDEV_FEAT_CHANGE on the conduit.

So could the user ports still advertise IP_CSUM and IPV6_CSUM while the
conduit has them turned off? That looks like the same symptom the commit
message says this patch removes:

  "DSA user ports inherit vlan_features and can therefore advertise TX
  checksum offload even though the conduit cannot perform it."

Packets should still be correct, because validate_xmit_skb() on the
conduit falls back to software checksumming. The problem is limited to
which features are reported.

Would it make sense to also clear in vlan_features whatever
stmmac_fix_features() clears, or to handle this on the DSA side, so that
bugged_jumbo conduits are covered as well?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124132802.2003605-1-prabhakar.mahadev-lad.rj%40bp.renesas.com

