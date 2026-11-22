Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9A4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=30m8Mw12;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JH9WDHCl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xoSM2whVTu4UTAuG8+zo8K3wAspqxaXD2+SDMb67siY=; b=30m8Mw12j5CwTwpuJOTcOveT1C
	wyKyNlPT9dKG8eUM0A4bzakUgJPhXMkn+vZ0szlG6VfaL3unMFL+HSA2kJUQs3k2gDqoJnLoKN0Ga
	dyksYeqTCz1VdavdcjUYYRBnRHOWPxf5JnBNbeuPWyL/DI/cc0qSjCBedldCyPDKB7EGAK9PkT6Hh
	J+P6nVQ2aU6P0CzXUbCp8l1JQ5nqJ+vRhu5j3dDPkwRXoIwFeQjV7Rpocpo3OvlSWJIGV/7QTRIqf
	ehEegAfmDMB2fuPkHKm1Cp7/gJjvkt2AwpZfWYEygKKqzaQehmSZtF8ix71ko+4roDtMur+JiXHyx
	mIp0CcjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAAM-00000001KaF-2Es2;
	Sun, 22 Nov 2026 16:11:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAAE-00000001Ka2-36tS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:11:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E2A64474F
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 16:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F871F000EB
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795363898;
	bh=xoSM2whVTu4UTAuG8+zo8K3wAspqxaXD2+SDMb67siY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=JH9WDHClVRA/IxU5zEexpMb2XH49dPAuMlX9lJY8uHpfCegHOFlL3giX2EREfjerm
	 4l2AQhnyw6BeR/WD4QD7jdFRQnqL5+KyEKSf+FnJQL/XvaFzhZD09mgPYgKDMSQzw/
	 blnCNoKW774w1/sJtwnZMnqTnrjkRZNWQwj/dCHtUea5qlrdlnhZiCzD27NufowaN/
	 lW9RKrb/dqoPYdAxfvlLvmh8NSDzJO1xmSrL+15S5HsnmxNQrSznl6UPxXbQDv9Pay
	 i4jFawyolqPKAr4tiQmAKFXH/c7BRrKBp5YXonJFv2HStk+GWz2vJoeTez9gs11Ikk
	 LWmGcD5CEPaoA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adfed9a887so22423961fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 08:11:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHsiQACMlXJlahC6YxDZ2Pe8WHGFdCwlf8WEDVbDB/XainyKeAl30az9Fes4a1nGFVTouk3ruLGDS2ivBZ3Klk1@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZXQDWEvWZnmAnbARsEthkrvHBfYHssavh83yaKUhVuYl9tBJc
	p4cBsHILf8LXaU5/1X9EtMNbUyePKF+OUR7HxrcrkKzhpdN/lKFd89xAVP40sWkBAYG4RjCWfg7
	MtyXAN4SsZ3u2FBwk804aCXiaX8T873I=
X-Received: by 2002:a2e:8a94:0:b0:3a7:81c4:190b with SMTP id
 38308e7fff4ca-3ae7fa718bcmr22757351fa.25.1795363896396; Sun, 22 Nov 2026
 08:11:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com> <20261122144926.284857-3-maxime.chevallier@bootlin.com>
In-Reply-To: <20261122144926.284857-3-maxime.chevallier@bootlin.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 00:11:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66SzmeGNrBmTe-6NNoro-9u-ocuQS6DxE9fo4_-kfA81Q@mail.gmail.com>
X-Gm-Features: Aa3M54oHe6Y4v1aZei8vOvG0Mo7qT8EwWXl6UKG3x5zoZCEZ2BwDWFr9sA35sjE
Message-ID: <CAGb2v66SzmeGNrBmTe-6NNoro-9u-ocuQS6DxE9fo4_-kfA81Q@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: stmmac: dwmac-sun8i: emit pause frames
 when the RX FIFO fills
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Nicolai Buchwitz <nb@tipi-net.de>, 
	thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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

On Sun, Nov 22, 2026 at 10:49=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> The TX flow control mechanism needs multiple things setup to actually
> work:
>
>  - The TX_FLOW_CTL_EN bit needs to be set in the TC_FLOW_CTL register,

typo, as Nicolai mentioned

>    this is already done
>
>  - The RX fifo thresholds needs to be set, to indicate when the MAC needs
>    to start sending pause frames based on the RX fifo occupancy, and
>    when it should stop.
>
> Let's configure the threshold the following way:
>
>  - Send pause frames when there's less than 2K left in the RX fifo
>  - Stop sending them when there's more than 4K left in the RX fifo.
>
> This was tested in Allwinner H2+ using the ethtool -t "flow control"
> selftest. On that SoC, the RX fifo is 16K.

The latest chips (A133, A523) only have 8K for the RX FIFO. I think
that still works.

> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c   | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index c63f4d87de50..75c743dfe348 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2017 Corentin Labbe <clabbe.montjoie@gmail.com>
>   */
>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -202,6 +203,11 @@ static const struct emac_variant emac_variant_h616_e=
mac1 =3D {
>  #define EMAC_RX_TH_64          (0x1 << 4)
>  #define EMAC_RX_TH_96          (0x2 << 4)
>  #define EMAC_RX_TH_128         (0x3 << 4)
> +#define EMAC_RX_FLOW_CTL_TH_ACT        GENMASK(21, 20)
> +#define EMAC_RX_FLOW_CTL_TH_DEACT      GENMASK(23, 22)
> +#define EMAC_RX_FLOW_CTL_TH_2K 0x1
> +#define EMAC_RX_FLOW_CTL_TH_4K 0x3
> +#define EMAC_RX_FIFO_FLOW_CTL  BIT(24)
>  #define EMAC_RX_DMA_EN  BIT(30)
>  #define EMAC_RX_DMA_START       BIT(31)
>
> @@ -766,6 +772,17 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_=
info *hw,
>                 v &=3D ~EMAC_RX_FLOW_CTL_EN;
>         writel(v, ioaddr + EMAC_RX_CTL0);
>
> +       v =3D readl(ioaddr + EMAC_RX_CTL1);
> +       v &=3D ~(EMAC_RX_FIFO_FLOW_CTL | EMAC_RX_FLOW_CTL_TH_ACT |
> +              EMAC_RX_FLOW_CTL_TH_DEACT);
> +       if (fc & FLOW_TX)
> +               v |=3D EMAC_RX_FIFO_FLOW_CTL |
> +                    FIELD_PREP(EMAC_RX_FLOW_CTL_TH_ACT,
> +                               EMAC_RX_FLOW_CTL_TH_2K) |
> +                    FIELD_PREP(EMAC_RX_FLOW_CTL_TH_DEACT,
> +                               EMAC_RX_FLOW_CTL_TH_4K);
> +       writel(v, ioaddr + EMAC_RX_CTL1);
> +
>         v =3D readl(ioaddr + EMAC_TX_FLOW_CTL);
>         if (fc & FLOW_TX)
>                 v |=3D EMAC_TX_FLOW_CTL_EN;
> --
> 2.56.1
>
>

