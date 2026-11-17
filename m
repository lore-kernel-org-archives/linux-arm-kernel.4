Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8FB606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bjwEZm9F;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4mSmiZL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zo7HDSI3Q+SlzaOYF7jYPSp+q4JGpMuWyCyvC0h9xhE=; b=bjwEZm9FukzsSRWLf9BwX5a4S+
	BB9/eanQJmLJ5ijbbXxNVdSAoor++90jDj0G10fChkfjJY6k0r1fWpwPWDNxHRKWKgn4T8vxwrN8l
	yiGWzZE8oXdXaA5rxEJ9Sh42j602ap4LBC+y5fmHfL1/ZHWYVxvVq9KYuqJEoj2+TMv0kTxpoFQX+
	Ohkvw3HS1/5ANKYJNbAEnnsSQZIDtNgMFNXgj8MzJ0WEe1yhrRGatEBSQKysbL7Iwy/R/qSH5Qvkz
	npkf5htv7pkEvtGaQJpO/z09k+aHOfVbDpbOmLxWBCSsd9AHkl5wudbjARTHSew4fFTob6PAraQ4o
	TBdZXrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLqC-00000006OZZ-0LQb;
	Tue, 17 Nov 2026 16:15:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLqB-00000006OZR-16Kc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:15:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A047961222;
	Tue, 17 Nov 2026 16:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124F21F000C6;
	Tue, 17 Nov 2026 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794932126;
	bh=Zo7HDSI3Q+SlzaOYF7jYPSp+q4JGpMuWyCyvC0h9xhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G4mSmiZLVcOjNEBeCs+lz5x2YwtcGlK6TJK5oN/4tktNqoiKNti4QvDxiwhXF9ZHr
	 46JQ5u8vZM1Cp2WpanWo4O/o3JKBfgaNPO35w8KCyZmSCwXmGkZbbrhJmmJ/YpOZi7
	 ZgOo5WrDSLrXgopDCxIRaBzdJV0D38hVApWhCWKEleVUpXenD1rhTd7Bof9SEIKeNZ
	 /IsegJHOkD6tdtNBQ6jun3EIAJs9sr1q+AzQKtb7r6lXbezyOONoZxBG80J5XZAi+B
	 CWAwdy8MW+IYiEL5lNcL37P3AcFnWShp8NN4I5bgIrvTcNZK2YQ/RkuoyeHul/bfEy
	 tu7fbPo0SKAyQ==
Date: Tue, 17 Nov 2026 23:55:08 +0800
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
Message-ID: <avx43Nv-DJCX5_Rr@xhacker>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
 <avvgy_bmRSVApCHA@xhacker>
 <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
 <avxhJs-51vs2Icje@xhacker>
 <6eb16cd9-27bd-4934-9621-b8928dce6902@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6eb16cd9-27bd-4934-9621-b8928dce6902@lunn.ch>
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

On Tue, Nov 17, 2026 at 03:59:30PM +0100, Andrew Lunn wrote:
> On Tue, Nov 17, 2026 at 10:13:58PM +0800, Jisheng Zhang wrote:
> > On Tue, Nov 17, 2026 at 02:24:16PM +0100, Andrew Lunn wrote:
> > > On Tue, Nov 17, 2026 at 01:06:19PM +0800, Jisheng Zhang wrote:
> > > > On Mon, Nov 16, 2026 at 04:06:25PM +0100, Andrew Lunn wrote:
> > > > > On Mon, Nov 16, 2026 at 09:54:35PM +0800, Jisheng Zhang wrote:
> > > > > > Assume we have the following implementation:
> > > > > >           ----------
> > > > > >           |mmio reg|
> > > > > > 	  ----------
> > > > > >              |
> > > > > >  --------    |      -------
> > > > > >  | MAC0 |--MDIO-----| PHY |
> > > > > >  -------- |     |   -------
> > > > > >           |     |
> > > > > >  -------- |     |   -------
> > > > > >  | MAC1 |--     ----| PHY |
> > > > > >  --------           -------
> > > > > > 
> > > > > > Both MAC0 and MAC1 have MDIO bus masters, and tie together to
> > > > > > a single set of clock and data lines, which go to some PHYs. While
> > > > > > there's a mmio reg to control which MAC mdio master can operate
> > > > > > the single mdio clock and data lines, so only one MAC can operate
> > > > > > the mdio clock and data lines.
> > > > > 
> > > > > How does this differ from pinmux?
> > > > > 
> > > > 
> > > > in my case, the two MAC MDIO bus masters share the same MDC and MDIO
> > > > pins.
> > > 
> > > That does not answer my question. How is this different to pinmux?
> > 
> > Let me explain the HW in details:
> > The pad have their own pinmux configuation, which selects the MDC/MDIO
> > fucntion instead of GPIO or another perif function. That pad
> > configuration stays MDC/MDIO, I.E unchanged.
> > 
> > The register discussed here is a separate selector between the two
> > MACs' MDIO controllers. With the pads already configured for MDC/MDIO,
> > it choose whether MAC0 or MAC1 drives the MDC and MDIO.
> > 
> > So the proposed demux controls this internal selector and serializes
> > selection plus the complete MDIO transaction across both MDIO
> > controllers.
> > 
> > Would you prefer model the selector as pinctrl states, with an MDIO
> > demux selecting the appropriate state under a shared lock before each
> > transaction?
> 
> Each transaction?
> 
> Are you proposing to use both MDIO bus master? Why? To the outside
> world, it is one MDIO bus, so you only need one active MDIO bus

Yep, both MDIO bus masters. I wanted to let each MAC uses its own
MDIO rather than disturbe another MAC for dual MACs case.
But now it looks like a over-designed solution.

> master. All the PHYs are then on that one bus.
> 
> I would let the DT pinctrl node connect one MDIO bus master to the
> outside world, and that is all you need.

What about coping with the selector in sl2610 stmmac glue layer? I.E
use the presence of the mdio child node to identify the provider.

For dual MACs case:

&ethernet0 {
	phy-phandle = <&phy0>;
};

&ethernet1 {
	phy-phandle = <&phy1>;

	mdio {
		...
		phy0: ethernet-phy@1 {
			reg = <1>;
			...
		};

		phy1: ethernet-phy@2 {
			reg = <2>;
			...
		};
	};
};

For single MAC case, it should be as simple as coding the selector
to let itself act as the provider.

This way looks simpler than modeling it as pinctrl. what do you think?

