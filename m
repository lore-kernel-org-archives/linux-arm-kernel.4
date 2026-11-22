Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D38B606A684
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LkYxwXrn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=30hoMqbC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wOG1V2yDt1QLtUADlJQbWxxkeZPsVgHF+G5UiIC3fWY=; b=LkYxwXrnOZwNx0ALmABUGx30SP
	ywDXyOQ+Dk9DpzdEH5WC0mv6HyqgwU5aNe2d3KguzzhFHfstbmmJ/sHvQXR0z2CL+n2dc13DrLUMd
	DhTEBIJclKCsHttCSyzP4fUbYeel433CY7l4H2CLbHolcGTzGJ6gDFskH/7jghQP5smTV0l1PPi47
	dFH6WG+DpC9D1jY2sglI2DAGPyvQ0pubTjG0ciZ2a9+bRY4lM3lDhlc41Hi2DLlOHZkBrX01iMmOp
	D5bBiOZcelYbltOeISyR64yamlT3HoagMpNjXyy5OruAGSoUBmO2DIXDCfbYa5jIoMr4kFuGc5rpi
	fU3xMNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCVt-00000001Y94-3d9c;
	Sun, 22 Nov 2026 18:42:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCVr-00000001Y8h-1k7Y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wOG1V2yDt1QLtUADlJQbWxxkeZPsVgHF+G5UiIC3fWY=; b=30hoMqbCfyqhmqe4/oLaxa9r3W
	07Y4LO/iMb3CIseP1NMI3/zz0MKpKKsUeK5a152LCdgTy8A4E2oFf3wIzerT5BD1dsaE6mwz70xIz
	HrgzAlBweYo0V0T6pI5Je0g+jkTBJxuopmDCp+Sxp8AWO2spt1s2hZZX71fer0saY+FE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVCVh-000bS1-Em; Sun, 22 Nov 2026 19:41:57 +0100
Date: Sun, 22 Nov 2026 19:41:57 +0100
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
Message-ID: <fb3f6cc0-a4ef-4721-af86-6d993ed2aace@lunn.ch>
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
 <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_104207_456433_C787E429 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> @@ -198,6 +195,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
>  
>  /* Used in RX_CTL1*/
>  #define EMAC_RX_MD              BIT(1)
> +#define EMAC_RX_RUNT_FRM	BIT(2)

This patch highlighted that EMAC_RX_MD is using spaces, not
tabs. Please could you add one more patch to the series fixing it.

      Thanks
	Andrew

