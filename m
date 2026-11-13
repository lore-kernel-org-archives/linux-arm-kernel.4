Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174E0606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 01:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p7e5qTHf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=xF/ukmbf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SeGWYFi/n0Lblm9iaCke+B2p70tFL4hdkNwQxuOUa3U=; b=p7e5qTHfNsrx5Vfi+5YgkbJhYl
	RkdaeS6kB9v1X39jr3TZMc/n+a1ZPd9Ge0EZgiCwal5R1ouU6MdXo8wOmCe8ec1YJ4Xj9Y+F/VFME
	W4xeFrtvLNvXhPB3Z2oJuyH/w3mQTr1Uo06eFhGkd/rgq6m0S8GiXypcNoCHHp96qnqXQByAGnbGn
	9OazCTocDOlLj2sbSTj0l7de7gLThnXBGfl1Np+fIYdl6qWLloOPyCsrieKeQ4Md+fKOsUpoAKSpK
	hP19VNigPNu+h9WADT0KMsBOol+zj+xs2OLA6b2VhO47etVaeujR/JlfUzKrsMpuLZhurtVGmuzd/
	NSIzmPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRflb-0000000BPVG-2ZBp;
	Fri, 13 Nov 2026 01:07:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRflY-0000000BPUG-2dul
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 01:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SeGWYFi/n0Lblm9iaCke+B2p70tFL4hdkNwQxuOUa3U=; b=xF/ukmbfd3uVVeWQFwYi1kzqzO
	exrzeAT/DJipxxiBU8mABEJQCso/XVuVIsm/aUwekV3vJfkhJY+KreQxXz7FjCC6DNrIZ7QhgADP+
	4XOkfe1cavOY6fWNJkMnoTQgrN2XTVZaeA6hi+3PHqp3LeVCs4lURqL3eNfcsBKfksGM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xRflR-00G9Eq-3H; Fri, 13 Nov 2026 02:07:37 +0100
Date: Fri, 13 Nov 2026 02:07:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	stefandoesinger@gmail.com, krzk@kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 16/24] net: phy: Add Sanechips ZX5201 PHY support
Message-ID: <95e7fc97-2bd1-4b68-a9ef-246302ed9ec7@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-17-ghahramani.navid@gmail.com>
 <788c9b01-473e-4c45-b6f0-b2ba054da8e9@lunn.ch>
 <20261113003655.3665572-1-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113003655.3665572-1-ghahramani.navid@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_170744_670500_5502CF91 
X-CRM114-Status: GOOD (  13.85  )
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

> > We need to understand this, because if it is an RGMII PHY, we need to
> > address the RGMII delays, which that page says it can controller.
> 
> That part I still have to find out. My driver has always told phylib
> gmii and the WAN port runs at 1 Gbs, but I have not worked out yet
> what the link between the SoC and the ZX5201 really is.

https://www.sanechips.com.cn/en/Products/WiredEn/fixedNetworkTerminalEn/1558027080778723330.html

This says it is RGMII.

> SerDes was just the name I gave the registers at the second address,
> and there is no public documentation for them. I will find out what
> the interface is, and how the delays are set if it is RGMII, before
> I send the networking patches again.

So picking SERDES is probably causing some of this confusion. SERDES
implies there is a PCS, and the PCS is doing signalling for SGMII or
1000BaseX. With RGMII, none of that exists. The registers might be
controlling clocks, or regulators etc.

https://www.sanechips.com.cn/en/ProductEn/WiredEn/ethernetConnectivityEn/index.html

Also says RGMII.

     Andrew

