Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1786070390
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S2TTmZeT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iACWokM5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p6yFbRoI34EBEWBA8uir1WZa2ELxczuwwTv1IUA9M2I=; b=S2TTmZeTO7mKNFx7GHVXrTrDbf
	j9Og8MhjSKQ9TraZ1y4cBZ7Xlaiq2QxZT0uAJmNfZNZui4hq/LfZl3HXRCw9JGbZ/jLYHa4M9gw3Y
	oTElVS3ky4loESCWGAcm3sQxHx2RCfZbpi8NiLRgJ4cWwg65aDNJJQrvkVtin34rZHFLwsuNcWWVV
	bqrP8vuBHJsrDCszvnm45CCWs0p/GUld+s1rnbKq4iHsLdW5uxFbJAt+BtmCu3PPrk9lwIPepkqJL
	VtePrT2n2IFU4ujf7Ew2JXPMmY2ohkQ1w962EDQFpkilw5Cm8J06e9Xy40Y9JBOLFliSu5TFAKRgf
	oTzszO5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVp7-0000000AGpU-00vF;
	Thu, 12 Nov 2026 14:30:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVp5-0000000AGp1-2wHL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:30:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7E9565869
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEEA1F00ACB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794493842;
	bh=p6yFbRoI34EBEWBA8uir1WZa2ELxczuwwTv1IUA9M2I=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=iACWokM5dCMBq+sQAlvPoQXNgbafPVCzko61mUoyValRzk3cuG01rv1kUqa0vNPCG
	 8ZsnU4+sRpAzCiefDb/gph/yB/RRigIwZSbkZNE9l6JDSK/5yJKPBrTyMAHTvbDypR
	 4JMAk0SWnMC9qzrbGrrzWGkHLyqOiqBKdEc1GtzPJUbLTgVqJ8CXix8c0BF5tYguay
	 Z/ASh8N+OAcqAuEZNG2mBCSk1uWyc1niUeTxI8er8cTAtM9PE3IoGjayPq4WcM+w6b
	 cXWFQxEACl1dHKeuATJiyu8eX5KG4RPDUqlwu01hkWA6Fl6eme9Ujj5yjhMjCDOaE0
	 3K1Xyamsr86UA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adfc004920so35599941fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 06:30:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHp67A6JofsDlGD7jxnBWSanAPHrxExbz4ChK/zAhqi4BKTeWhAMKO8gUS75uPV9Wd1ptmyr7LE6l8IHCazvRLT@lists.infradead.org
X-Gm-Message-State: APuU4Z//0TTgfU+WNJ208RTY8CJd2Fa74mEWmexrgv+9SITp7L9poLiz
	SmmOEWMkrrewqCzTUVsEu7IilQ0M+8kKng0sdv8XixXvOV85CkXyC6xTqlHjau2mLBVsoFh+O77
	vd4d4ThK1XYRJGNZHZKeLULf97Bp5lzE=
X-Received: by 2002:a2e:bd83:0:b0:3ac:e14b:4233 with SMTP id
 38308e7fff4ca-3ae126d6bccmr14164511fa.26.1794493840822; Thu, 12 Nov 2026
 06:30:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com> <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
In-Reply-To: <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 12 Nov 2026 23:30:27 +0900
X-Gmail-Original-Message-ID: <CAGb2v664HN=K_rmHo6c8vUruiO=oSx_xyP6+R=W4=mayxGfNCw@mail.gmail.com>
X-Gm-Features: AclHuK9rczOZ2CpznM4g4dhi1PV55KlcijiBk3NrxFJJUCi_uq6z_UIAjJL6B74
Message-ID: <CAGb2v664HN=K_rmHo6c8vUruiO=oSx_xyP6+R=W4=mayxGfNCw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-sun8i: Enable jumbo
 frames up to MTU 2018
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 5:41=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> The sun8i EMAC advertises a maximum MTU of 3712, but no frame larger
> than the standard 1518 bytes is actually received: on an H616 board
> (Orange Pi Zero2, RTL8211F over RGMII) every ping above 1472 bytes with
> DF set is lost, and the rx_length counter goes up for each one.
>
> There are two independent limits:
>
> 1. EMAC_RX_CTL0 bit 29 (JUMBO_FRM_EN) is never set, so the receiver
>    rejects frames longer than 1518 (1522 with a VLAN tag) bytes. The
>    Allwinner BSP driver (sunxi-gmac) sets this bit unconditionally at
>    init. Set it in core_init as well; core_init runs after every DMA
>    soft reset, including the one done by an MTU change.
>
> 2. The EMAC has no Synopsys HW feature register, so stmmac uses normal
>    descriptors in chain mode and, without enh_desc, sets max_mtu to

The hardware only supports normal descriptors, period.

>    SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN), which is 3712 with 4K
>    pages. That value is not a hardware limit. The descriptor buffer
>    size field is 11 bits wide (the same in the BSP and the QEMU model),
>    so ndesc_init_rx_desc() caps each RX buffer at 2047 bytes, and
>    ndesc_get_rx_status() discards any frame that needs a second
>    descriptor. On TX, stmmac_xmit() only splits jumbo frames for
>    enh_desc, and norm_set_tx_desc_len_on_chain() masks the length to
>    11 bits, so a linear frame longer than 2047 bytes would be silently
>    truncated.

If that's true, that sounds like a serious bug.

But that's just the limit of each descriptor. The stmmac driver already
has code for both chained and ring mode descriptors to split one fragment
across multiple descriptors for TX.

I think what should be done is just remove the "if (enh_desc)" check
before

    is_jumbo =3D priv->hw->mode->is_jumbo_frm(skb->len, enh_desc);

Now if the jumbo frame code is buggy (because no one ever ran into for
who knows how long), then that should be fixed.

> Moreover, the RX DMA only fills a multiple of 4 bytes of a buffer: on
> the H616, with 2047 programmed, a 2044 byte frame (FCS included) is
> received in one descriptor and a 2045 byte frame already spills into a
> second one. The usable size is therefore 2044 bytes, the same value as
> DESC_BUF_MAX in the original sun8i-emac submission and in the U-Boot
> driver.

And it also has code to deal with a frame spanning multiple descriptors
or buffers in the RX path. So if you say 2045 bytes is spilling over
to the next buffer, then the size limit for each descriptor's buffer
should be 2044.

I think this should be done somewhere in stmmac_setup_dma_desc() by
aligning bfsize or ultimately dma_conf->dma_buf_sz to a multiple of 4.

The limiting to 2047 bytes in ndesc_init_rx_desc() also seems suspect,
as the rest of the driver is not aware of this limiting, and would
likely cause misalignment or dropped bytes when reassembling a frame
from multiple descriptors.

> Limit max_mtu so that a frame with two VLAN tags and the FCS fits in
> 2044 bytes (MTU 2018). A device tree max-frame-size can still lower it.

So what you are doing is just papering over what is broken underneath.
Fix the actual problem so we can have MTU up to 9 KB.

> Longer frames from the wire span two descriptors and are dropped as a
> whole by stmmac_rx(), which drains the descriptors of a split frame
> since commit 834ec9530832 ("net: stmmac: drop split frames on AF_XDP
> zero-copy RX").

I doubt that's the case. This commit said it only covers AF_XDP, which
is not your normal network transfers.


ChenYu

> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 24 +++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 0c82662fbe6e..a18d3daf6a3f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/if_vlan.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/mdio-mux.h>
> @@ -219,12 +220,25 @@ static const struct emac_variant emac_variant_h616_=
emac1 =3D {
>
>  /* Used in RX_CTL0 */
>  #define EMAC_RX_RECEIVER_EN             BIT(31)
> +#define EMAC_RX_JUMBO_FRM_EN           BIT(29)
>  #define EMAC_RX_DO_CRC BIT(27)
>  #define EMAC_RX_FLOW_CTL_EN             BIT(16)
>
>  /* Used in TX_CTL0 */
>  #define EMAC_TX_TRANSMITTER_EN  BIT(31)
>
> +/* The buffer size field of the EMAC DMA descriptors is 11 bits wide, an=
d
> + * the RX DMA only fills a multiple of 4 bytes of a buffer: with 2047
> + * programmed, frames longer than 2044 bytes spill into a second
> + * descriptor. The stmmac normal descriptor code used for this EMAC only
> + * handles frames that fit in a single RX descriptor and a single TX
> + * descriptor buffer. Bound the MTU so that a frame, including two VLAN
> + * tags and the FCS, always fits in 2044 bytes.
> + */
> +#define EMAC_MAX_FRAME_LEN     2044
> +#define EMAC_MAX_MTU           (EMAC_MAX_FRAME_LEN - ETH_HLEN - \
> +                                2 * VLAN_HLEN - ETH_FCS_LEN)
> +
>  /* Used in EMAC_TX_FLOW_CTL */
>  #define EMAC_TX_FLOW_CTL_EN             BIT(0)
>
> @@ -645,6 +659,15 @@ static void sun8i_dwmac_core_init(struct mac_device_=
info *hw,
>
>         v =3D (8 << EMAC_BURSTLEN_SHIFT); /* burst len */
>         writel(v, ioaddr + EMAC_BASIC_CTL1);
> +
> +       /* Without JUMBO_FRM_EN the receiver flags every frame longer tha=
n
> +        * 1518 bytes (1522 with a VLAN tag) as a length error, so any MT=
U
> +        * above 1500 is unusable. Frames are still bounded by the RX
> +        * descriptor buffer size, see EMAC_MAX_MTU.
> +        */
> +       v =3D readl(ioaddr + EMAC_RX_CTL0);
> +       v |=3D EMAC_RX_JUMBO_FRM_EN;
> +       writel(v, ioaddr + EMAC_RX_CTL0);
>  }
>
>  static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
> @@ -1209,6 +1232,7 @@ static int sun8i_dwmac_probe(struct platform_device=
 *pdev)
>         plat_dat->mac_setup =3D sun8i_dwmac_setup;
>         plat_dat->tx_fifo_size =3D 4096;
>         plat_dat->rx_fifo_size =3D 16384;
> +       plat_dat->maxmtu =3D min(plat_dat->maxmtu, EMAC_MAX_MTU);
>
>         ret =3D sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
>         if (ret)
>
> --
> 2.55.0
>
>

