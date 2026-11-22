Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E8606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mPTwupzW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6FbkVu5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jRxJug/Y1WR98+oKDtwiqnL5a0+fWq49VTbpoM67nmI=; b=mPTwupzWNCTe3OSSgRkCirMpu7
	57N4PvoK8wwkq59e21RznYAnp8qPgvyrWOj+BXN7huROSHolNlUVGvuNrQbgoCY/LLozutG/yyBZA
	k4RMr+qx6DZAUe4lmZQn/BSzvkZxP7PX8P61rX5ZiFVh+ITIRs76UymwpMYR54Al6KppALeiCF/Dk
	G7R24Tir/LAB2inGbfbGFZ9u7NDZbimoBec03dl0yZDRmUk7aNk+ZeJzm2sKshPYcO3CRZwRPOMdB
	gf73xCroM08HJWCISMoparhtc1u0iNRMB/40b0UHChzpfBbJ77INAdtENasvZkx76nnItAHj00EU9
	bvOAkKWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV1yb-00000000ozx-35wy;
	Sun, 22 Nov 2026 07:27:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV1ya-00000000ozq-2MxL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 07:27:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B659144F3F
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD9A1F000D3
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795332423;
	bh=jRxJug/Y1WR98+oKDtwiqnL5a0+fWq49VTbpoM67nmI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=S6FbkVu5BgQO29DX6U30yzL0DFo/On2Mx4EHxvghcK/CX5rbIRKYkICiatN+NYuKm
	 NZHuONpPqleoDfcTeyUZEu7v3JUQw5fMoUd/1JWG/29OQI33kNPcVAf0ZEuo/3FaWS
	 uLw5/+E7X9IPfvCbRU67QuRrBQYVAebwdQhiTLfHruF15OuwzMkug19e8PEPwLu1b4
	 aQJwaBSHIUxIkZES4bu5qpmPORDOt2nQ1fdzhshXbunBDFvLKvJXdiUZujew5b/86d
	 GqoO5nUYLNgVPqJ0bNEyxAIHtepTBEY7eR+YaaPdPxtIxqjr7LFVl6c9BpQhBs1K41
	 Q1guFWQHz73PA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3acef9307c7so18124841fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 23:27:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF+fYr3d7vzXWAL8RaE3jRaKLpuNdGYIxM8porHIRu5aAAcZMr9nPCrdtlcs2ckDdbVhdmjSkLMpnYgSp3ANwDd@lists.infradead.org
X-Gm-Message-State: APuU4Z9AlVGli7/ebrj6UhVXwSmC3wilT5FB5SgCSw3dy/jrIui5n5Bs
	9jSUa+nOzarUeMg/+skyBm/rRsnf/G/nrxWV52c29gSzABbjm8oXz3+Bm63LuP2y33AhoWL2oRr
	ySoBOBS0hGbY1YNBP36mwak24juyYgms=
X-Received: by 2002:a2e:a98d:0:b0:3ae:7eee:15d2 with SMTP id
 38308e7fff4ca-3ae7fa63ad1mr24050091fa.18.1795332422005; Sat, 21 Nov 2026
 23:27:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com>
In-Reply-To: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 22 Nov 2026 15:26:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v65w3cVgxb_G38UgKEa4ErKLN4qiF05N3nmdJbmPeRRNBg@mail.gmail.com>
X-Gm-Features: Aa3M54rfrvVdNKa1udG-e9AkPOB_QrPlPhXGt3xZXT_wwKFSdTyEz2lu2p5fCqA
Message-ID: <CAGb2v65w3cVgxb_G38UgKEa4ErKLN4qiF05N3nmdJbmPeRRNBg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
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

On Sat, Nov 21, 2026 at 12:43=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> Russell King pointed out in [1] that max_mtu ignores the 11-bit buffer
> size of normal descriptors. dwmac-sun8i always uses them in chain mode,
> so a frame must fit one buffer, but max_mtu is SKB_MAX_HEAD() (3712 on
> arm64). Sashiko asked in [2] for this to go in as a fix.
>
> On an H616 the RX DMA fills 2044 bytes of a buffer and
> ndesc_get_rx_status() drops a frame that spans two. On TX the MAC cuts
> a frame after 2048 bytes (TX_FRM_LEN_CTL is clear). At MTU 2033 no UDP
> datagram gets through in either direction.
>
> Limit the MTU so that a frame with two VLAN tags and the FCS fits 2044
> bytes (MTU 2018). MTU 2019-2026, which worked without VLAN tags, is now
> refused.

So what's the overall plan? Limit it first to make things work, get the
fix backported, and then fix jumbo frame (>2K) handling so it works
for any MTU value?

> Link: https://lore.kernel.org/r/E1vLJcL-0000000ExBL-0GFe@rmk-PC.armlinux.=
org.uk [1]
> Link: https://lore.kernel.org/r/20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf=
17@gmail.com [2]
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Cc: Nicolai Buchwitz <nb@tipi-net.de>
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Tested on an Orange Pi Zero2 (H616) on net/main with and without this
> patch (RX fill measured on v7.3.5). Claude (AI) helped write this patch;
> I reviewed and tested it.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73..1f4fa722529f 100644
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
> @@ -1208,6 +1209,7 @@ static int sun8i_dwmac_probe(struct platform_device=
 *pdev)
>         plat_dat->mac_setup =3D sun8i_dwmac_setup;
>         plat_dat->tx_fifo_size =3D 4096;
>         plat_dat->rx_fifo_size =3D 16384;
> +       plat_dat->maxmtu =3D 2044 - ETH_HLEN - 2 * VLAN_HLEN - ETH_FCS_LE=
N;
>
>         ret =3D sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
>         if (ret)
>
> ---
> base-commit: d5b89d55a322b632e2b465b392a4c1d9d338db9c
> change-id: 20261121-sun8i-emac-mtu-limit-66a936064965
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
>

