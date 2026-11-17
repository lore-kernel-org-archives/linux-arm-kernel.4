Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D959606BE58
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a1jksXML;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQROSnmc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ctl1tLaoM/IXjPWaua1GqsUJA8m8aPnpqJlW+uWtku4=; b=a1jksXMLcy/CwB8bDi7Tus1CX9
	G1gfySA5BMYPzO5Sh96TTvy6OWCjMSMCU9u7GzeKW0pdAxDFPGQVuBMztMxCcwhM9AXKL29ET/AJU
	n5/Nt5l0uBIo3p5wXMSU6Q4+nPhJan4LeR7QpJT+DUxiN5PUBJsxK7054S5FkwLaMl6MbmPUnqrLi
	J235PbEq2oDtuzOs1CRxmezTCzPl/L9JscRWxqsTW3VebeqZiqE63CF/X4YIHa3BZKVv4edieYovz
	J+DRMeDI+qBWziyx4Z2VjIcEFpAvLwMZ4RtnAxw07u15Fn6eA4TNTzEtghHs5al3SkOkpeIPD9mxs
	dkegbMSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKGQ-000000069im-0z9z;
	Tue, 17 Nov 2026 14:34:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKGI-000000069gR-1HLR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:34:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A41AE430C8;
	Tue, 17 Nov 2026 14:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440A81F000C6;
	Tue, 17 Nov 2026 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794926057;
	bh=ctl1tLaoM/IXjPWaua1GqsUJA8m8aPnpqJlW+uWtku4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AQROSnmc1Uipda2/MZtI5joUGrUdfqKIRPexALaTDcWEblXm8qQbC4ye291cfcQUO
	 Ypn1BSFBZn7yAEtwDJ4TCXlOht7RvrHt/zoBOsieQ5gQDhtKKzHBAQ8EwKCK+udkSu
	 2S3a0TKkzze3u6BHYZNmDqXiPOQgOXnJ67XFgSX/UWrIOXXw40F9GbSr0YjW7xBE5+
	 3BdZlSULorJ1aB0MAy1bFtQjyu5FIQrgO1hk2NnpIiRhZKCvfCMtD80suVifctJBtg
	 7r5lahPKDD/BopTPEX/QVDSyTuHMoEjSpuYxP2qS4fP2MSwsbfvZTN7EQPpGhh3GiP
	 mLJOyhcGfEACQ==
Date: Tue, 17 Nov 2026 22:13:58 +0800
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
Message-ID: <avxhJs-51vs2Icje@xhacker>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
 <avvgy_bmRSVApCHA@xhacker>
 <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bd19b55b-00b1-406d-a16b-d04c35efb7d3@lunn.ch>
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

On Tue, Nov 17, 2026 at 02:24:16PM +0100, Andrew Lunn wrote:
> On Tue, Nov 17, 2026 at 01:06:19PM +0800, Jisheng Zhang wrote:
> > On Mon, Nov 16, 2026 at 04:06:25PM +0100, Andrew Lunn wrote:
> > > On Mon, Nov 16, 2026 at 09:54:35PM +0800, Jisheng Zhang wrote:
> > > > Assume we have the following implementation:
> > > >           ----------
> > > >           |mmio reg|
> > > > 	  ----------
> > > >              |
> > > >  --------    |      -------
> > > >  | MAC0 |--MDIO-----| PHY |
> > > >  -------- |     |   -------
> > > >           |     |
> > > >  -------- |     |   -------
> > > >  | MAC1 |--     ----| PHY |
> > > >  --------           -------
> > > > 
> > > > Both MAC0 and MAC1 have MDIO bus masters, and tie together to
> > > > a single set of clock and data lines, which go to some PHYs. While
> > > > there's a mmio reg to control which MAC mdio master can operate
> > > > the single mdio clock and data lines, so only one MAC can operate
> > > > the mdio clock and data lines.
> > > 
> > > How does this differ from pinmux?
> > > 
> > 
> > in my case, the two MAC MDIO bus masters share the same MDC and MDIO
> > pins.
> 
> That does not answer my question. How is this different to pinmux?

Let me explain the HW in details:
The pad have their own pinmux configuation, which selects the MDC/MDIO
fucntion instead of GPIO or another perif function. That pad
configuration stays MDC/MDIO, I.E unchanged.

The register discussed here is a separate selector between the two
MACs' MDIO controllers. With the pads already configured for MDC/MDIO,
it choose whether MAC0 or MAC1 drives the MDC and MDIO.

So the proposed demux controls this internal selector and serializes
selection plus the complete MDIO transaction across both MDIO
controllers.

Would you prefer model the selector as pinctrl states, with an MDIO
demux selecting the appropriate state under a shared lock before each
transaction?

Thanks

