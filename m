Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C8606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 18:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hIKQf2Bc;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NQy5ayoe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZjOww6Av4TYuUIUrHXUPGTFtUR3yqkQIr555NuUOYP4=; b=hIKQf2BciD7QiyTNeFRJyu08NH
	QuDD/mC3gf2af3qzjEqvN4m6mHzqsOP3oVr/2eQqFr+LRxynZMEzj+rxctFga4s4v+tgUI5iH+7D2
	eY5fSK8iAM1GAGO6e5AYD/olLdpa1trWTwkcdwcSj4E89HYVdik1Uf2IoPEbKCB0eF0tGfN5z/A/q
	adGxngohMAfl9fCSou/dCou1D0E/uajfU6RD8e8gBL48ZfKOdaiHRp8mrs3Ii03zuaVJMEzkmfBDV
	P8f2go/rSG7GGE+Dmtwnkoip1HLJpQPbbgzZ2k7/LodswGCKbzO2se1h/0pr6dRFLzgHcUL9OOOSg
	820biACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpQR-0000000026C-1ljj;
	Sat, 21 Nov 2026 18:02:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpQO-0000000025r-3f0w
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 18:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZjOww6Av4TYuUIUrHXUPGTFtUR3yqkQIr555NuUOYP4=; b=NQy5ayoerTWJL/iw2Dp7R0pY/8
	9OYzjOKz3wZJGygM/bkvVNRK6RArDIz2w9i8ryW+/3jGc+ENmmttk+4SA12zROqWAiPKx+ezFx6Xe
	A10j5IRJj8/yXoTScm0agc9zOEk+yptuWcZ8jaCz0lFFE8tHTvpiuizaw3acnuc1d5XY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUpQ6-000TX2-Q4; Sat, 21 Nov 2026 19:02:38 +0100
Date: Sat, 21 Nov 2026 19:02:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
Message-ID: <7dee2bac-9892-42df-b2d3-62d648af3452@lunn.ch>
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_100256_909551_E605649F 
X-CRM114-Status: GOOD (  12.43  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 04:43:41AM +0000, Arun Iyengar via B4 Relay wrote:
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

Is this problem specific to the dwmac-sun8i?

   Andrew

