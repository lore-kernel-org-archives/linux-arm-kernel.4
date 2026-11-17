Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ADD606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3hwDlI83;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=WnYhWHeu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K0qrakcESvXPxHJXNDKFRvIhNYLPnaxTHMvxLYcW0lc=; b=3hwDlI83DzvgmjrbxPoUCRb1sH
	MPehj2I6ocEOhLYiWE3AeEGwjQY/o0E6V1hX+YyZPi6RFwQoV2BT+uHTpIra6j3AwO97lbHGapWN9
	cjplzktzf7xd+3Q9aOGlMw0Z1/ODBRTR4VxQDKhFBuGvOG/60TVaQl53gdf27bx2C5eAWz4GdIeMu
	tHf2XeDMAH7SgniyE0VKbKyNZU0k3Bs8/LHoWB1tmsTSt6+ZwRcYeqiAnBvLWLpS5Pt10GVE/ks9+
	U6JyvsTg/nr+2t9tMzsPA6dAfilYKgv0LDUm1czi/310uKhJ9vixXQJL685R1DSZuLl0CSSpsh7x5
	tPA0QoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKex-00000006FB2-07Kw;
	Tue, 17 Nov 2026 14:59:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKeu-00000006FAe-1lom
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=K0qrakcESvXPxHJXNDKFRvIhNYLPnaxTHMvxLYcW0lc=; b=WnYhWHeuSBL1t3K6vWoR7xpAyu
	+vAneGcHuU46VIGAPI/+6D6QFxnjQnLddtcegcub7aHwMx1Zk6rud6/nhb7PazjZVGtpH34UT5UXK
	aoZwWQREqgwNwqD6zbRezPsdROBtUzgOQFMPKjJHmdHxTNahczJ6aMHgce4AmrD12xyg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTKeg-00HB4u-5U; Tue, 17 Nov 2026 15:59:30 +0100
Date: Tue, 17 Nov 2026 15:59:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: net: Add MDIO demultiplexer
Message-ID: <6eb16cd9-27bd-4934-9621-b8928dce6902@lunn.ch>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
 <avvgy_bmRSVApCHA@xhacker>
 <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
 <avxhJs-51vs2Icje@xhacker>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avxhJs-51vs2Icje@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_065944_460078_EE27F80F 
X-CRM114-Status: GOOD (  22.15  )
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

On Tue, Nov 17, 2026 at 10:13:58PM +0800, Jisheng Zhang wrote:
> On Tue, Nov 17, 2026 at 02:24:16PM +0100, Andrew Lunn wrote:
> > On Tue, Nov 17, 2026 at 01:06:19PM +0800, Jisheng Zhang wrote:
> > > On Mon, Nov 16, 2026 at 04:06:25PM +0100, Andrew Lunn wrote:
> > > > On Mon, Nov 16, 2026 at 09:54:35PM +0800, Jisheng Zhang wrote:
> > > > > Assume we have the following implementation:
> > > > >           ----------
> > > > >           |mmio reg|
> > > > > 	  ----------
> > > > >              |
> > > > >  --------    |      -------
> > > > >  | MAC0 |--MDIO-----| PHY |
> > > > >  -------- |     |   -------
> > > > >           |     |
> > > > >  -------- |     |   -------
> > > > >  | MAC1 |--     ----| PHY |
> > > > >  --------           -------
> > > > > 
> > > > > Both MAC0 and MAC1 have MDIO bus masters, and tie together to
> > > > > a single set of clock and data lines, which go to some PHYs. While
> > > > > there's a mmio reg to control which MAC mdio master can operate
> > > > > the single mdio clock and data lines, so only one MAC can operate
> > > > > the mdio clock and data lines.
> > > > 
> > > > How does this differ from pinmux?
> > > > 
> > > 
> > > in my case, the two MAC MDIO bus masters share the same MDC and MDIO
> > > pins.
> > 
> > That does not answer my question. How is this different to pinmux?
> 
> Let me explain the HW in details:
> The pad have their own pinmux configuation, which selects the MDC/MDIO
> fucntion instead of GPIO or another perif function. That pad
> configuration stays MDC/MDIO, I.E unchanged.
> 
> The register discussed here is a separate selector between the two
> MACs' MDIO controllers. With the pads already configured for MDC/MDIO,
> it choose whether MAC0 or MAC1 drives the MDC and MDIO.
> 
> So the proposed demux controls this internal selector and serializes
> selection plus the complete MDIO transaction across both MDIO
> controllers.
> 
> Would you prefer model the selector as pinctrl states, with an MDIO
> demux selecting the appropriate state under a shared lock before each
> transaction?

Each transaction?

Are you proposing to use both MDIO bus master? Why? To the outside
world, it is one MDIO bus, so you only need one active MDIO bus
master. All the PHYs are then on that one bus.

I would let the DT pinctrl node connect one MDIO bus master to the
outside world, and that is all you need.

I've no idea if you can stack pinmux drivers. You might want to reach
out to Linus Walleij. But this is basically a pinmux problem, there is
nothing specific to MDIO here.

    Andrew


