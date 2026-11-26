Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE8C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=21cPd2hC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=LYmfBdNO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lfG40Px3f0wAIOWW8djRVGmO0yACnjIcUJ7Zj45snZo=; b=21cPd2hCZWWIE8lI5fgbModERu
	vioJwBqMMAOmP0QP3PCj4Ewz4e6GMmEdYJldk0NHxLIrAs25vUsa7F3cSgRPl6pKoTNmonI/FBE85
	3H97z3epy21G5iGodsiAU2OiputhR0Jo4tnje+TUh5IThXRmYQo33PwhOEcAzYsHFI+mqJqjpKk1L
	dhUaFk8Gk4WIT3ZrqTSpq5zjgMOWkoUS6ZJiTxr41o22n1aY8MaxdbeWNRzT+9Z4oY3L1jkMz1Kzc
	wGFpFbPD+W6clQcHC6mQhfTiZJQtXXFJcJU3I0RbBJxGZYOA0mm/+AsSfhpHsT/oEwxTMaWK50R70
	X/KBzMSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcLb-0000000DuMD-2ywV;
	Thu, 26 Nov 2026 16:29:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcLY-0000000DuLV-2LkH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lfG40Px3f0wAIOWW8djRVGmO0yACnjIcUJ7Zj45snZo=; b=LYmfBdNOXxbyCXJ1iJyh/XcZyc
	8WuTgb4nu0D2J/ZCXrB1GXrksJILw8hOymhL4Yxm10LN8Gb7Tg3hHNyXwe0Unh8LAiAVBb7RzdX6c
	TCYZ56b/QkcjEIkvOOG0O5oyNXzL524ZyiqYb8mqJAHA2K1bshqYalBBVGDuhDgG+zc8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWcLI-001cI2-6A; Thu, 26 Nov 2026 17:29:04 +0100
Date: Thu, 26 Nov 2026 17:29:04 +0100
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
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Drop received MAC control
 frames
Message-ID: <befa099f-c18d-4eca-be4c-23883b30b111@lunn.ch>
References: <20261126-sun8i-emac-ctl-frames-v1-1-e90ac94bc8c7@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126-sun8i-emac-ctl-frames-v1-1-e90ac94bc8c7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_082920_619350_CD2BB154 
X-CRM114-Status: GOOD (  16.30  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 09:56:52AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> sun8i_dwmac_set_filter() sets CTL_FRM_FILTER to "receive all control
> frames", so every PAUSE frame reaches the stack and is counted in
> rx_dropped. Leave it at 0, "drop", as the Allwinner BSP does; the MAC
> still obeys PAUSE.
> 
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Tested on an Orange Pi Zero2 (H616), net/main, MAC loopback: TX still
> waits 32.6 ms per PAUSE; rx_dropped per 20 PAUSE frames 20 -> 0.
> Claude (AI) helped find the cause and write the patch; I reviewed and
> tested it.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73..f669bf22b7dc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -192,7 +192,6 @@ static const struct emac_variant emac_variant_h616_emac1 = {
>  
>  /* Used in EMAC_RX_FRM_FLT */
>  #define EMAC_FRM_FLT_RXALL              BIT(0)
> -#define EMAC_FRM_FLT_CTL                BIT(13)

Even if it is not used, i would leave this in place. It acts as
documentation of what the bit does.

	Andrew

