Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDC1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bzXqklU5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHGMiJFB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ltJjjHY7wQ9E8rybzcEZKs7FUdTfp7SjBbsj6Z63JWs=; b=bzXqklU5gzSLfB
	k8h4/SEMz175Z9MqNHGOlqwmcLys10Yy3vrSuCJhwdJWnhIIjqK3wNHdEe6m+H8Y4PhNvcNT1SMhh
	Yo2PrXkNH4CXCh5UL9bTxIuTlFRik46tMDZ8EZaz4PtKCGCGbAvhHTHxeJ+hzKyd6tjtGwNzUke3F
	JRJ9LpoeLjUu7Yia51YIAd5teWVu/xIw0W1YzMcJ0m+6X4P0Ok6wtz7Rj0wn34yN7xMDTqmqM2eSx
	djYE2CMI6P6xd2yeg23g62mTe+PH6QOLc4jSbATf0qw8ICei4M4wUNGNx/kmGkhApsMCbjgOkzPD5
	dvg2qD4C8Gxn5hxcUQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDp7-00000001h0o-1KMA;
	Sun, 22 Nov 2026 20:06:05 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDp4-00000001h0O-0kl6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 20:06:03 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-99e145569c6so482345241.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 12:06:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377960; cv=none;
        d=google.com; s=arc-20260327;
        b=OlVFwSl2n0xGCXvQLb3bZ9/ltNglFPlbm4wFCqUubCZz5adFDM4epx0qXoet5u7PFT
         VtUMS7kiMRGgQ9LlD3PEOy7cBBUBKZPtTISsH2BdR0M2K69PnMOWeyKj9AFLKPFYlufv
         w9QGVLzTWrPgSPdDMe2VDIAl91OKt7yCkTI+E0r7LCTVlUJ0Edykh4G/GouI3UzAY7Jt
         LFrxHe3z8Fn0iUea/qZCSvATHJiRa33Zt89XRPuzE8sFuelUQQR7y/48Kro2zQ3FcWaw
         70DjVKTDfjHApNGFpxTFc6REK5vFR/yyvUAQAiLPIjy4aDyfvyCY/ks7H/I7y1qqUMoD
         757Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ltJjjHY7wQ9E8rybzcEZKs7FUdTfp7SjBbsj6Z63JWs=;
        fh=a67400wnDCUOD2fGmEqkmXidroeCFelFHigqnYvS4yI=;
        b=eHVflI6TOs6x8IyyXlXzDwX5WGeRWaQIv+OEZoaLHbGEDoBbfLSzFHfIwfbG06wgW7
         Vz0idZxxhXotDypH7jFg6BqWvSZLru05eyX1A0FoXDfRwtbGlXtpPcfGqOPeuDI3kOR3
         UliB5gdPHZE4GmfQnVcbHpbXmXKBLp51/yOWfvDpmCTNNoUBAP/lKH2MUWuKbqLMmATT
         mMemc03dkNdRDWV2hcTSY4GVaE4nmyGqfuV/CJD4EvuwTfZUJHYAADTXtHGdHtK16yLJ
         6k0ppqcfzKWs4ZxXevd6KM7+4CTvxutoeN0euY4APHKNuz/XiVdeZSU3M+IKM/WfjNit
         AiNQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795377960; x=1795982760; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ltJjjHY7wQ9E8rybzcEZKs7FUdTfp7SjBbsj6Z63JWs=;
        b=AHGMiJFB/WK8WFacLKoDM0dXPfHnuUuXIaoYzRosdgby9tLAhhCIP5EnmDnsricDZZ
         haghfwBhyNtmSvFBuFO921AHbYs4LtOPcYQaHx0GH6x/ECtVUqQDnE7mC3w/Y9ZZXKo6
         xSzaxwZW31KRKcDLKTxC+DHV0BualQ414S81ayjd2+bi4P3zzrwh0OA6mZlwHaxZIjZn
         vNnr/5gKDv1LfyzQYRhixkQ0KT5rzEbLA0sElQLspyVBcYyCcDrXSC2zNJHTgp05aub3
         bHKWJDA53jlpI4Xqhatx0AToBBNquAd8VwxQWhcPd2QynQ4dmZZZJ5e4Q0FTLTyW5bdu
         DEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377960; x=1795982760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltJjjHY7wQ9E8rybzcEZKs7FUdTfp7SjBbsj6Z63JWs=;
        b=xEL1ghANHkoft4fZOcAL5hofvrweWI3/lB/u/xXD66G7V7mLNwgV/SLno1lZX8zZWu
         EHILHJN8DlS3D9IZjfUx8ZSqlI3e68u5fbKXItddQkITMHSCHCs6M48eskkh9zHHnjQ4
         LESmIuYLHB1YdFC5VcvEsGxprXN1XCRswXxjONzE281Be1YRWnJ5wU3zjzoALUFCCbeQ
         a2mNUilwv8dlX088WQILV0AcRriN5SeuawaiOT1sc1cNqyNJnrrfm820nHoBcXNgTXPx
         3YpJfkuSX19YIdt4V2r9hxDeLSX/dDChjWJiskgjBptWZcCvWdnSQC84+H4UHVDPIEoK
         8scg==
X-Forwarded-Encrypted: i=1; AL+hErEFSlSXalDUQsUvxg8XaFTFSECUJJwo+KzZ/bCZmBN8wCp/bBIvf00tYxjHhE5kt5i0eLSzThyvT+8DDFhztrnP@lists.infradead.org
X-Gm-Message-State: APuU4Z+ko8DRfi7qnPRb2UcOFrR6lIfQKTHpYo62aTAq7iXsHCIjECpv
	ZYVGie3K3cy/R7Bcfni8aUy4YQvurQwrufYEw4DfB7ODPACbM1y2+9IjPks5hICOF8n8Q6sO7bX
	jF3SszQeizoJp0NPudmFTqVS5EbEiHak=
X-Gm-Gg: AZFdTZf9UPIUReRKiNnHoRfzdXMlNouJWAGiGtZnZ0lTDlvnFSBhnp4zMongZ3gFHiE
	qWop16dHp801R/Z20NCMbnsESbCyMVK4+F9k/qI3LBT7Npya5srWtzPir25Nistrf5iYZCWZI3I
	AXxWYDryJl/RcAlIjvpulmkeiVctANNu/eHZG9px6qoyhSWqzgiV2coLwGP46bGkfT5RKRHLDHy
	i/51wwe9/tuOLOS+H5dQV6DNosqTbfhTiLkEQXcuvip7L1QF+QmiV5KEAvBX7cxFUvbhD+aF9m8
	3JHTWw1MHQcLSBdEI9/D0okZ4Lk2HobYAlU8PKxRM0gmqrlJU7/7HYEseVOkcpOQQ0OzfgQ7lpU
	VcBfgtofykvbEjWaGBQggxWbqXIKBeOG9eru6A9IH/WzL10OHxbDcU6TFXGRsudPnlsKy0wnW+3
	0DcZc0zLX0nMAvBAMuyWmLSbGs4RlyRGglab7oJAltYIqaGmjBFcfLbPaBJTsWtrzrBogBYqkrc
	e2TW5V13JJGDFuOinl6nILumrQ36g==
X-Received: by 2002:a05:6102:6e88:b0:7cc:2152:4f72 with SMTP id
 ada2fe7eead31-7d72b361a7fmr3205448137.1.1795377960563; Sun, 22 Nov 2026
 12:06:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
 <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com> <ba116748-1650-4816-97a6-69eeecd4b2cb@lunn.ch>
In-Reply-To: <ba116748-1650-4816-97a6-69eeecd4b2cb@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 13:05:48 -0700
X-Gm-Features: Aa3M54pG1AzgHZF28ZU3Gb7U1D0EKDZkbO9-Ggw6woKfAmVhRg5yTB70PYbUkHk
Message-ID: <CADvTj4pDQhnABu0GnsXN-mNhvdiHkwrrk3yJs5gq9RaMPWZFSg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool rx-all
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Jakub Kicinski <kuba@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_120602_254731_37571DE0 
X-CRM114-Status: GOOD (  16.17  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 11:39=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > +static void sun8i_dwmac_update_rx_ctl1(struct stmmac_priv *priv, u32 c=
lear, u32 set)
> >  {
> > +     struct sunxi_priv_data *gmac =3D priv->plat->bsp_priv;
> >       u32 v;
> >
> > -     v =3D readl(ioaddr + EMAC_RX_CTL1);
> > -     v |=3D EMAC_RX_DMA_START;
> > -     v |=3D EMAC_RX_DMA_EN;
> > -     writel(v, ioaddr + EMAC_RX_CTL1);
> > +     guard(spinlock_irqsave)(&gmac->rx_ctl1_lock);
> > +     v =3D readl(priv->ioaddr + EMAC_RX_CTL1);
> > +     writel((v & ~clear) | set, priv->ioaddr + EMAC_RX_CTL1);
>
> Netdev does not like these magical guard constructs. scoped_guard is
> acceptable, but good old fashioned lock/unlock is preferred.
>
> It is also unclear why this now needs locks, when before it did not.

I added the lock because changing rx-all adds a new writer to RX_CTL1
while the interface is up. The runt-forwarding bit shares that register
with the RX DMA enable bit. If ethtool read the register just before
another CPU stopped RX DMA, writing it back with runt forwarding
enabled could also turn DMA back on.

I went back through the callers to see whether that can actually
happen. RTNL serializes the ethtool change with opening and closing the
interface, resetting it, and reconfiguring RX queues. Neither the sun8i
IRQ handler nor its TX completion path requests a DMA threshold change.
System suspend does stop RX DMA outside RTNL, but userspace is frozen
before the driver reaches that point on the normal sun8i suspend path.

So although the register is shared, I couldn't find a path where the
new writer races an existing one. I think we can drop the lock and
leave the existing DMA callbacks alone.

> This patch is too big, does too many things. Please break it up into
> smaller changes, with good commit messages, which are obviously
> correct.
>
>         Andrew
>

