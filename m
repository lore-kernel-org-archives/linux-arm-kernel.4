Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C359606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 20:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VQAu9eT2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=bFKN3hQc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iDERK68xOldbgeUiiGYyw/w8twcI1O8oq6PXPbGFfdU=; b=VQAu9eT2VwdT1N/FL07n33Mtfm
	6TF//tVO0OkyJORRv4bYR3ee5vEuBPHsSW4JUKkyUh69zaimikaxQ24qYUJVpwDOJonGKDOmm/WJv
	wKhhba7RDkpSOXMKJj4996FFMOMIHBvvbv346+hgmRQ81mJPBV1osjQWsSNpOf0PpPyKQETz+R6mw
	74EDLcVl7C/445eLoEjWVS3o4v+27kV8ZCFKw6B+0RotRc4s2D/XWwbkJs8FYoD4XfX0Fbrs+/e/K
	AqIBpEhMmpZKe5ujZIb7K+kBO4BBbym10jg9LxmEEge1tu2aMK/wWJdFqh8XcRUNYtDt28ZWcJQuw
	eg7dj50w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEdK-00000001kQA-1cVs;
	Sun, 22 Nov 2026 20:57:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEdH-00000001kPo-47u5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 20:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=iDERK68xOldbgeUiiGYyw/w8twcI1O8oq6PXPbGFfdU=; b=bF
	KN3hQc8rftOmJOB85CjYZtIUwFRh3FHC98U/Jxsa5dG0F7/Q+MlsyaPWa6ziHHenmf2Xrj2E0WgEq
	96ZmT9hIRl02+gh9IlaBgc6fG3CbNLOmyIHE7AhAIxGXG5T7dryZsIVsCAnsCt2JyeJxKxTa7CMy1
	rHTAMPX0T/xRf2M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVEcy-000cTP-42; Sun, 22 Nov 2026 21:57:36 +0100
Date: Sun, 22 Nov 2026 21:57:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool
 rx-all
Message-ID: <97515dd2-72b1-4275-910f-94336f8f18a4@lunn.ch>
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
 <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>
 <ba116748-1650-4816-97a6-69eeecd4b2cb@lunn.ch>
 <CADvTj4pDQhnABu0GnsXN-mNhvdiHkwrrk3yJs5gq9RaMPWZFSg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4pDQhnABu0GnsXN-mNhvdiHkwrrk3yJs5gq9RaMPWZFSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_125756_047277_4F1F4134 
X-CRM114-Status: GOOD (  19.30  )
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

On Sun, Nov 22, 2026 at 01:05:48PM -0700, James Hilliard wrote:
> On Sun, Nov 22, 2026 at 11:39 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +static void sun8i_dwmac_update_rx_ctl1(struct stmmac_priv *priv, u32 clear, u32 set)
> > >  {
> > > +     struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
> > >       u32 v;
> > >
> > > -     v = readl(ioaddr + EMAC_RX_CTL1);
> > > -     v |= EMAC_RX_DMA_START;
> > > -     v |= EMAC_RX_DMA_EN;
> > > -     writel(v, ioaddr + EMAC_RX_CTL1);
> > > +     guard(spinlock_irqsave)(&gmac->rx_ctl1_lock);
> > > +     v = readl(priv->ioaddr + EMAC_RX_CTL1);
> > > +     writel((v & ~clear) | set, priv->ioaddr + EMAC_RX_CTL1);
> >
> > Netdev does not like these magical guard constructs. scoped_guard is
> > acceptable, but good old fashioned lock/unlock is preferred.
> >
> > It is also unclear why this now needs locks, when before it did not.
> 
> I added the lock because changing rx-all adds a new writer to RX_CTL1
> while the interface is up. The runt-forwarding bit shares that register
> with the RX DMA enable bit. If ethtool read the register just before
> another CPU stopped RX DMA, writing it back with runt forwarding
> enabled could also turn DMA back on.
> 
> I went back through the callers to see whether that can actually
> happen. RTNL serializes the ethtool change with opening and closing the
> interface, resetting it, and reconfiguring RX queues. Neither the sun8i
> IRQ handler nor its TX completion path requests a DMA threshold change.
> System suspend does stop RX DMA outside RTNL, but userspace is frozen
> before the driver reaches that point on the normal sun8i suspend path.
> 
> So although the register is shared, I couldn't find a path where the
> new writer races an existing one. I think we can drop the lock and
> leave the existing DMA callbacks alone.

And this is where, small changes, with good commit messages helps
you. In order to write the commit message for a small patch adding a
new lock, you would of done this investigation in order to write the
commit message, answering the question "Why?"

I don't say this just for reviewers benefit. It also helps you get
your code correct.

     Andrew

