Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D19D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YM1/uWRJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kOpbrZVn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OfjJ0WvNmPf3yRVeCkab8QDdbLg01cA0144pAfNS/ko=; b=YM1/uWRJj0Y3VQw2bZhi7Wc4jy
	IphF8y8oEY+lyrqHnR9zUvo+pPNVYkv3ICUfNLgtzDKgBZjqw/fSCohh6tMFuI5CtVmjiaJoMxBtl
	uV9XeYSR0yaXNO4CLaJtyMIxB9++HYv3LLdNwiQSz5BeJbIXpfc9LGry0Ri28J7NlYO++YvEe1FK1
	/XhyEZP8YtVSTm2OsYIivV4MG6Zc2DCYUk86x8MVK5GC6axsZwuO+4EHvxGoLOnxI9UNwjQ/Kdejx
	IWP6R287XFBhaKFxe/WjlsVCkc24d+bHq7P+jb1ev3oDUc++UVMn6p4eMCKQLO/p+aonGvisfW99H
	wMHScZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5ui-0000000126n-2WMx;
	Sun, 22 Nov 2026 11:39:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5uh-0000000126g-2MrA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 11:39:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC73845104
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 11:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B476E1F000D1
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 11:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795347558;
	bh=OfjJ0WvNmPf3yRVeCkab8QDdbLg01cA0144pAfNS/ko=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=kOpbrZVnERYgmaaHoZkURlOzHTL+LmFRPMuRjwwd8z7TPSCj6Lk3JAEbho+16Z0/R
	 apEgAP3EnQ5uxlyI7qAJyaD7CI5muLzZaudrhoiYnUwWOd+c+4H54zZ1ocD0jUedQg
	 jBZ0cStZBZ/mLGr0V8v+gpT9duqIkGufxmUhwvviey5PImNCxB1AE8HsqfVmWAPUFr
	 hrf3oI4Go6+NmSFQkOStXZXLHtl7rdCEDoxstXxHP5PXodvvdaQiSQGK7VlC2eTwvN
	 WTN4tMGmaYk6ghQmHlRPX0UP+KHi8Hj4eJswJez/PSW+9LAMKQUSCUqB5JBW1Q47el
	 lDsbMfWHFEvjA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c08539c827so1519554e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 03:39:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG0vVYcS/vd+lgCjdFT0TD0b2MvyP3FOCTS04VUG6oU4eZXSIw3KgqMGZmFnexqlgYOaSUvBmVQqtZxWT7Cau7r@lists.infradead.org
X-Gm-Message-State: APuU4Z9kBnX8ENzcKrm7hMQZRVwXfnR+JcmecK5DU2CfDdLlEOxfn5vp
	GeG4AuDzh4vkvFk5Rp9cOb0vNkU7DCGKXGYLZmOPtI20EdhDkKi2y3kK0bzsDlplPRPKMwWUPJs
	z7vC2plGVKg1HNeGJrcIwBhu+pwk6Rag=
X-Received: by 2002:a05:6512:61aa:b0:5c1:57cd:5c3d with SMTP id
 2adb3069b0e04-5c1bc806a59mr2586829e87.23.1795347557053; Sun, 22 Nov 2026
 03:39:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com> <20261122-sun8i-emac-mtu-limit-v2-2-c4081e5b83cf@gmail.com>
In-Reply-To: <20261122-sun8i-emac-mtu-limit-v2-2-c4081e5b83cf@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 22 Nov 2026 19:39:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v65_vY86WqvKr1m=g0N1Qr2UhLC1v3OHKPG3x+oURUKp7Q@mail.gmail.com>
X-Gm-Features: Aa3M54rz_NQ7yOvBXle79aW57ZyemtshMgGI-7Gz1C236a3c9B6hMMfTmke5swY
Message-ID: <CAGb2v65_vY86WqvKr1m=g0N1Qr2UhLC1v3OHKPG3x+oURUKp7Q@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: stmmac: dwmac-sun8i: Limit the MTU to 2018
To: aiyengar1990@gmail.com, Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
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

On Sun, Nov 22, 2026 at 5:13=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> The H616 RX DMA fills only 2044 bytes of a buffer, so frames of 2045 to
> 2047 bytes, allowed by the previous patch, are dropped. Limit the MTU
> so that a frame with two VLAN tags and the FCS fits 2044 bytes.

FWIW I think this applies to all DWMAC cores.

So I tried to do some research of my own. Google AI search pointed me to
STM32F4 or STM32F7, and some Altera FPGAs (I used the Intel=C2=AE Arria=C2=
=AE 10 Hard
Processor System Technical Reference Manual"), that had some variant or
version of the DWMAC core, and had proper programming guides.

The STM32F4 reference manuals has this note:

Even when the start address of a receive buffer is not aligned to the
system databus width
the system should allocate a receive buffer of a size aligned to the
system bus width. For
example, if the system allocates a 1024 byte (1 KB) receive buffer
starting from address
0x1000, the software can program the buffer start address in the
receive descriptor to have
a 0x1002 offset. The receive DMA writes the frame to this buffer with
dummy data in the first
two locations (0x1000 and 0x1001). The actual frame is written from
location 0x1002. Thus,
the actual useful space in this buffer is 1022 bytes, even though the
buffer size is
programmed as 1024 bytes, due to the start address offset.

The Intel one had the same note. It looks pretty much the same, but I didn'=
t
compare it word-for-word.

So for normal descriptors the buffer size is bound to (2KB - bus width).
Not tested, but I think there is more evidence supporting a cross-platform
limit.


ChenYu

> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73..ec401cae8187 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1208,6 +1208,7 @@ static int sun8i_dwmac_probe(struct platform_device=
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
> --
> 2.55.0
>
>

