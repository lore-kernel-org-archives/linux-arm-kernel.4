Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4B5606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G8iNArH2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CzXGWm54
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=46X1A36lRITxJaTPLlxxVzXDY079oCIGjNdvfhIAUtU=; b=G8iNArH2kq5VVyt3U6C1zAAYX9
	0UQtOI1j0pZRPenpUJywTr1VniiQeMZmQJ3Y/f4GZria4aVErF3h73jNMH1AWIj6q5sPxUPRKwBJH
	89flF+UP1O2jUVjPIN+7usEFtliuSZGJhUrm7NI6jS81I6ZaA3tQvEt1EHEJacB0wddhs1iscuFOj
	HsIpI4cPN7QODrxu8dCprCSyzee2PimIzB9Egcwk5+gwArD5gjGRrlXMNNUhZ4eihgsG2UhO3gXEr
	NaQHgdZV+duXjjPjmZ0vea0AvMu7d6irdoQBOT1KjUqv47y/0gQt78PTFUIs4uahXyLLAznjJK5BV
	b01YvMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMCb-00000006ReV-3bUQ;
	Tue, 17 Nov 2026 16:38:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMCa-00000006Re0-43C2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:38:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 48F2140AA2;
	Tue, 17 Nov 2026 16:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3221F000CA;
	Tue, 17 Nov 2026 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794933516;
	bh=46X1A36lRITxJaTPLlxxVzXDY079oCIGjNdvfhIAUtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CzXGWm54quJek4+WeGA5ThtKKio+wFJfPAJxfJsnaZdl5MOI9Vg0TJSV3hRZXUdPX
	 sUcKZIOD0i2a9/5fWnivG9SLP5tKVLhvlQjgyz+u80wAPNx68KFoQQzMlPOYm9loQd
	 sdezHyNDyWbiE8jkrTjtnTxitoye9PZaiwX5dizfOYhbBkhvgAIAi8/lrd2aqHlMQC
	 +05ngZU3roLo4v6otfUoN+5I4PEeVFGs9QV8omgnYOwK0FwCUU1Zxpdm20Eu0lStOc
	 oOVNCSE4CsrxNQCptGKN2U+he3l+cUPjZ5ZEPDzWXC0FXdDda4PoLhyx937L5Q+yfe
	 Z6LwPS4U3BkHw==
Date: Wed, 18 Nov 2026 00:18:12 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <avx-RO_K5h12HWx2@xhacker>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
 <avvgy_bmRSVApCHA@xhacker>
 <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
 <avxhJs-51vs2Icje@xhacker>
 <6eb16cd9-27bd-4934-9621-b8928dce6902@lunn.ch>
 <avx43Nv-DJCX5_Rr@xhacker>
 <4d4dc86c-c947-40e2-bdaf-ed00a39f3771@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4d4dc86c-c947-40e2-bdaf-ed00a39f3771@lunn.ch>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 05:20:39PM +0100, Andrew Lunn wrote:
> > > Each transaction?
> > > 
> > > Are you proposing to use both MDIO bus master? Why? To the outside
> > > world, it is one MDIO bus, so you only need one active MDIO bus
> > 
> > Yep, both MDIO bus masters. I wanted to let each MAC uses its own
> > MDIO rather than disturbe another MAC for dual MACs case.
> 
> How does this actually work? Each bus master sees each PHY. So one

This could work since the demux serializes two masters' access + only
point to one phy phandle in one mac's DT node.

> hardware device is represented twice in Linux. Bad things are then
> going to happen.
> 
> As i said, the outside world has one bus. So you need one MDIO bus

Yep, I will switch to one MDIO bus solution by coping with the selector
in the sl2610 stmmac glue driver. A sample dts for dual MACs case has
been shown in last email.

