Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D2D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qITEJ0v0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=f/DRJ1Jl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FcrHbezu7ZWjOBBzfj/zQMKcAeBb+uf9T04gRQhuzOk=; b=qITEJ0v0YZ7J27T4/1bJYoJXic
	iP790cLAw4U0bbNMCpf2AboVcIPDVOv3g5YTEjADAu1MsQni9P1wF3yVaR7jDvmh4uCgQ8LSU+yy8
	iL5hBMjNh3SfLei1jFodXuAfGd0iKjzYsa1kvLKy6LGp4VcPPfuEK9m1k0VtS0+u1ScWapR01osU4
	Qp9px78aX/9PrZdDqYBtR+crJ0S6IFtKz9B4Seymz1dRO+HQ8DguMI93gpnhFUW5SR+9swPj9dlBP
	3Q9nqF4xDIhVt8iX/x6Siq1/vRdIngYthnx/NH+X4Z+pPP9lc7VNjDfGRwTnFH0Hb7LvYA37ppjHB
	Apb7Slyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMZZ-00000006Uoc-1Hmg;
	Tue, 17 Nov 2026 17:02:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMZW-00000006UoF-1CZu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FcrHbezu7ZWjOBBzfj/zQMKcAeBb+uf9T04gRQhuzOk=; b=f/DRJ1JlxkjQKKgiumVsBQLZiM
	eDTDyC59fnlSke8btoyFTBTwVRFcx+9cVDiI9CG/Pz2v9BYmdwQ+QQbltpSrGKAtu9khXAdMhvLaa
	XUlhedOVcJCmg6GCDC8DLRu+rRMS0WFHhTYyecmdffAiAPgJi315dQDd8J2q8Y3rVGrk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTMZJ-00HDCG-CW; Tue, 17 Nov 2026 18:02:05 +0100
Date: Tue, 17 Nov 2026 18:02:05 +0100
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
Message-ID: <ae24af14-8168-44f0-a150-f18057cc3c95@lunn.ch>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
 <avvgy_bmRSVApCHA@xhacker>
 <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
 <avxhJs-51vs2Icje@xhacker>
 <6eb16cd9-27bd-4934-9621-b8928dce6902@lunn.ch>
 <avx43Nv-DJCX5_Rr@xhacker>
 <4d4dc86c-c947-40e2-bdaf-ed00a39f3771@lunn.ch>
 <avx-RO_K5h12HWx2@xhacker>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avx-RO_K5h12HWx2@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_090218_606817_38B0C364 
X-CRM114-Status: GOOD (  15.58  )
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

On Wed, Nov 18, 2026 at 12:18:12AM +0800, Jisheng Zhang wrote:
> On Tue, Nov 17, 2026 at 05:20:39PM +0100, Andrew Lunn wrote:
> > > > Each transaction?
> > > > 
> > > > Are you proposing to use both MDIO bus master? Why? To the outside
> > > > world, it is one MDIO bus, so you only need one active MDIO bus
> > > 
> > > Yep, both MDIO bus masters. I wanted to let each MAC uses its own
> > > MDIO rather than disturbe another MAC for dual MACs case.
> > 
> > How does this actually work? Each bus master sees each PHY. So one
> 
> This could work since the demux serializes two masters' access + only
> point to one phy phandle in one mac's DT node.

And it all blows up when you don't use DT, or the MDIO node is missing
and of_mdiobus_register() falls back to mdiobus_register() which scans
all the devices on the bus.

> Yep, I will switch to one MDIO bus solution by coping with the selector
> in the sl2610 stmmac glue driver.

Good.

	  Andrew

