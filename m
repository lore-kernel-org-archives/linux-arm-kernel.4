Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5B960A2631
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BMFFXOWH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=WIJl/qw7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JsseaZWlHALkJDroqnvRsrsIA8/F+g3l2qrb9axVxOs=; b=BMFFXOWHqwJU3xQ/d3p9KWWcrw
	5nKiEj5a+pXxoa6rWfkEoM0jHygfxysf2dLN/D+YjLtNTWpGDw43zQghD+QAT2qhj3LIx56Y8W1gO
	n2fOx/rtjjIUAMmpS7agDyr0Bsn0cvbSf5YD+sPEen6xVAVaWkZdSHLBHhr860zj742T145SXF7A4
	wyFMa2WcfTbVFZQFRp4PVUpLYAGzKuQ5TAhkE9Zm9UVTYiBEhMma8jfYm+S15V6ug1D57gDvWmAeu
	g+zf3AupH7BbOsOrm/SxN23c/nF5OQ45j6C/uTtWDqfhnuiFdvOCwFP+2AHMb9oyxFhx4E+NSorBA
	5qZSwcYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUdJ-00000009zGv-196k;
	Thu, 12 Nov 2026 13:14:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUdA-00000009z8C-3Pg8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JsseaZWlHALkJDroqnvRsrsIA8/F+g3l2qrb9axVxOs=; b=WIJl/qw7H0BAcm1v01iuIz8K0n
	/zMRv/4PU6hmW6MyyaRlRwjgpLKzdkb+rhiJrtiGtdp5c0BlWUd8nxgs3pMCg9asI6XeZ8oVc5gRr
	/A8XijRY6spjDYf2F9uh2CuhqOe8LqdJeU7ovZBP65Q0Jo/pXQSCGpH3Y2H0fEHpU0Ww=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xRUcp-00G1SL-1Y; Thu, 12 Nov 2026 14:13:59 +0100
Date: Thu, 12 Nov 2026 14:13:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Fix use-after-free in the
 MDIO mux error path
Message-ID: <e526541c-f91a-484b-a677-4c55e4a96a7b@lunn.ch>
References: <20261112-sun8i-emac-mux-uaf-v1-1-308ae7e6fcf2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-sun8i-emac-mux-uaf-v1-1-308ae7e6fcf2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_051420_927503_D29959BD 
X-CRM114-Status: GOOD (  12.85  )
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

On Thu, Nov 12, 2026 at 05:28:05AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> mdio_mux_init() registers the child MDIO buses one after the other.
> Scanning the internal bus makes mdio_mux_syscon_switch_fn() select the
> internal PHY and power it, which sets gmac->internal_phy_powered. If
> mdio_mux_init() then fails without switching away from the internal
> bus, for example because registering the external bus returns
> -EPROBE_DEFER before any access to it, or because an allocation for it
> fails, sun8i_dwmac_probe() jumps to dwmac_mux with the PHY still
> powered.
> 
> That error path releases gmac->rst_ephy and gmac->ephy_clk and only
> then calls stmmac_pltfr_remove(), which ends in sun8i_dwmac_exit().
> Since the PHY is still marked as powered, sun8i_dwmac_exit() calls
> sun8i_dwmac_unpower_internal_phy(), which passes the clock and the
> reset control that were just freed to clk_disable_unprepare() and
> reset_control_assert().
> 
> Unpower the internal PHY before releasing its clock and reset control,
> as sun8i_dwmac_remove() does. The later call from sun8i_dwmac_exit()
> then does nothing because internal_phy_powered is already cleared.
> 
> Fixes: 529254216773 ("net: stmmac: dwmac-sun8i: Balance internal PHY resource references")
> Cc: stable@vger.kernel.org

Does this bother anybody? Seems more like this should be for net-next.


    Andrew

---
pw-bot: cr

