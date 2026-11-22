Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCC5606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nuVV55KR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUohEqQH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r0teGaLFiZbnip2X0hbOa3BQ614Td9G1LXhr62qV31A=; b=nuVV55KRdwiJMYkx789RWAc2F1
	DxGGFrx5RVqhM8BDFGKhB8mVA2SHFFtU8y6lL1f7Q7Aoa1alBMj8dJuWKcbwEhhpTh4XgA2omJ9U1
	jpoghSCImjK6aQXo2R8/emUbuWZ88WyLcM1njxPQLRqKkyb5kqB/k+3s4faWCUU0UxTiXEy7Htbdb
	KpuTQHXTblgpCKUoO9iYZoYytdSERc0J8jqoYUlaYaSWyocggEu5OS3IPtcFekCO8BiLcXTfAE7fb
	L4eKc4lGJq0YpVAMWbdICr7VytdPRISQuikTPjOG3+C/TKSrnc0ZRnkJeB+BFTj15hv8A4NIf6E1C
	3jYLLwRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVArc-00000001OaL-2WUg;
	Sun, 22 Nov 2026 16:56:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAra-00000001OaB-2rK5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:56:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 447E061120
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 16:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7161F000D8
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 16:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795366584;
	bh=r0teGaLFiZbnip2X0hbOa3BQ614Td9G1LXhr62qV31A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ZUohEqQHZSFC/64bYg2uf7z2xhayzkxTB6MF49gU9OZp9iFnDYg1QyEMGRWipn8S1
	 ILAD+xbGhrU1Z1zu5k0r6tkQ/RRTPnHNM/dwaPDWOmIdFQNiaufWQNilIuWRcckpXD
	 oHSb2N8vDrUfwRoaZ9PsArpHQRz+ikKjZutJuOICcDDZgPaKkDx6B/LXT0T9+DoGy7
	 TsqaGUhwFRZTL/wW/OHFyw161X8LxQND8HTzN/z8fRZsuvsHpLPipywWd6OhLoZyzJ
	 8cLTLfos1iCfsPLTKXnK9nnJTeWy2QGb+mrO5hNOpC8fempSfe+i3i7xc28/TR/ZnE
	 VLBxx+TE4zAtA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab4354db11so24258681fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 08:56:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFwIlyxMn7MVNv+WvQHJ2+6OoK8k/Q12SMWc5sNpj3DkEhNCNNU+bXolAkESHkpcsqCAAn72uOTVpg0gd5riEac@lists.infradead.org
X-Gm-Message-State: APuU4Z/LlyEo1lgIbgE3ldPIB2GV65W0HPKH2tOEcZ3TOgtKM8jurQKi
	FAv1m03pWWmORpOptzYpIIeYjO1rh/echYOT5t8G1dOSbDXN1KQWZ9SPfj8pCJxfd/STrPz4iOW
	yGJ4/krNpvsB4QcSJaAsXfJtqLjz/Jdk=
X-Received: by 2002:a2e:b8c3:0:b0:3ae:6f2b:6caa with SMTP id
 38308e7fff4ca-3ae7f9f6483mr26598401fa.11.1795366582998; Sun, 22 Nov 2026
 08:56:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
 <20261122-sun8i-emac-mtu-limit-v2-1-c4081e5b83cf@gmail.com> <d3af70f9334370a1d32511504aa14725@tipi-net.de>
In-Reply-To: <d3af70f9334370a1d32511504aa14725@tipi-net.de>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 00:56:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v65RZAVX6FNV_y+TO+frP9RBCURZbW=B3Ws2_4f8f+1acQ@mail.gmail.com>
X-Gm-Features: Aa3M54oulFi-3Qjl1WQec184X79yaVwtpOneI4puTLfYjiDU5sNNxxTSKipqNJ0
Message-ID: <CAGb2v65RZAVX6FNV_y+TO+frP9RBCURZbW=B3Ws2_4f8f+1acQ@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net: stmmac: Limit the MTU of normal
 descriptors to one buffer
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: aiyengar1990@gmail.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 12:27=E2=80=AFAM Nicolai Buchwitz <nb@tipi-net.de> =
wrote:
>
> On 22.11.2026 10:13, Arun Iyengar via B4 Relay wrote:
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > Russell King noted in [1] that max_mtu for normal descriptors,
> > SKB_MAX_HEAD() (3712 on arm64), does not match the hardware. Their
> > buffer sizes are 11 bits, and stmmac neither splits TX frames nor joins
> > RX descriptors for them, so a frame must fit one 2047-byte buffer.
>
> AFAIU TX does split (jumbo_frm() in chain_mode.c).

Yes. But it also assumes each buffer is 2KB or 8KB, which this series
already says is not correct. (I do wonder why the size field is not
size - 1.)

And also, if I'm reading this correctly, the jumbo frame conditional
is only ever true if enhanced descriptors are available:


    /* To program the descriptors according to the size of the frame */
    if (enh_desc)
            is_jumbo =3D stmmac_is_jumbo_frm(priv, skb->len, enh_desc);

    csum_insertion =3D skb->ip_summed =3D=3D CHECKSUM_PARTIAL;

    if (unlikely(is_jumbo)) {
            entry =3D stmmac_jumbo_frm(priv, tx_q, skb, csum_insertion);
            if (unlikely(entry < 0) && (entry !=3D -EINVAL))


I might have pointed this out in a reply to Arun's other patch, but here
it is again. This seems to have been broke since 2014 by

    29896a674c8e stmmac: fix chained mode

> This makes RX the real limit as ndesc_get_rx_status() drops a frame that
> spans more than one descriptor. Please say that instead, it should also
> answer Chen-Yu's question about hardware vs driver?

It's great that we have interest in getting this working again, and tools
to help us get there.


FWIW the the new "GMAC200" cores in the latest Allwinner SoCs, and the GMAC
in Rockchip SoCs would also benefit. As far as I can tell they don't suppor=
t
enhanced descriptors, based on DMA cap values reported in debugfs.


ChenYu

> >
> > Limit max_mtu so that a frame with two VLAN tags and the FCS fits.
> >
> > Link:
> > https://lore.kernel.org/r/E1vLJcL-0000000ExBL-0GFe@rmk-PC.armlinux.org.=
uk
> > [1]
> > Fixes: 48febf7e6476 ("stmmac: allow mtu bigger than 1500 in case of
> > normal desc (V4)")
> > Cc: Russell King <rmk+kernel@armlinux.org.uk>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
>
> > [...]
>
> Thanks,
> Nicolai
>

