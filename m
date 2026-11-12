Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEC3606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IS8o53ON;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEBUXzPW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L7x9fVXIk3YLtUocHW/Jzi76+9mdCpISM1XeN9QuiyM=; b=IS8o53ONn451SJDLehHnOM23rf
	PL7HWNuZsBCbmHHkbwHsy0lRtQ+1Akr4EK00jET1ztCQuid2lt7qgDAY/tRuYANoM6o2j4yvnm5qv
	NjmoVWs1EyMD/5yqUWMHXdAdzlXqnguC33mC9KF+UP87tNhiWpuOPSxHTp5Wkz1ESgd+WgjOtvDwF
	sLZVjT/7T08ZoMHF/YyJM9EqWXW3Lws8JMv6b+v9d3XscDASdFoueGKl5kgNtAZ0+LNoJeXmSiABE
	2n2dWrYjSvxZx8bHRrY9J4vLNlBTGaDHgzwBQpF0zxaNgQ6dirii0MkSXEttqWAhA/EmqI1/GHmeg
	9gZKW0Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZgl-0000000AsgY-1SLO;
	Thu, 12 Nov 2026 18:38:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZgj-0000000AsgS-2CMo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:38:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 32AC6430A3;
	Thu, 12 Nov 2026 18:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B1E1F000C9;
	Thu, 12 Nov 2026 18:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794508701;
	bh=L7x9fVXIk3YLtUocHW/Jzi76+9mdCpISM1XeN9QuiyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LEBUXzPWAsbf071BULHrEEhI/zwFZI/qjjvxJA4hgrD4BGpODUz6udClZy8WSqDAY
	 WHXI5JIWFzz7RltAvOzuy0YhZwGckicTTpUVYk2KIcL9P1JX1hP6Am+YBf5LvPwuDm
	 MxyTWs1q+85eYL8pLvDQgRdBYD0uJskQvCm0pzTnx9hVm6sUupUnF9t5GfLSQPMHOE
	 9jEqd/MNMtUEbamgYO8Olx4/uIDkiR37I68rjLDz2Mb7U+29XTOCUngF/WCVFgxcA4
	 CdRYJQ7U7T0GosfI7GRu6po5gmyylXm6zZO7Xl0+CziIXhBsqnTC1A0XUHICDidBh1
	 y2bP54tP4rPxg==
Date: Thu, 12 Nov 2026 18:38:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: arm: stm32: Add clock-controller
 sub-node to STM32MP2 SYSCFG
Message-ID: <20261112-worsening-yahoo-323ef21dc921@spud>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v1-2-667829cd290a@foss.st.com>
 <20261110-confidant-bundle-08385b99bd78@spud>
 <c4f08bb7-cea5-4f79-8a11-4045220f3b89@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hlndOg5Yw8RzH+lw"
Content-Disposition: inline
In-Reply-To: <c4f08bb7-cea5-4f79-8a11-4045220f3b89@foss.st.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--hlndOg5Yw8RzH+lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 09:36:59AM +0100, Gabriel FERNANDEZ wrote:
> Hi Conor,
>=20
> Thanks for review
>=20
> On 11/10/26 19:54, Conor Dooley wrote:
> > On Tue, Nov 10, 2026 at 11:42:17AM +0100, Gabriel Fernandez wrote:
> > > The LTDC pixel clock multiplexer of the STM32MP23x and STM32MP25x
> > > SYSCFG is described by a clock-controller sub-node of the SYSCFG node.
> > >=20
> > > Add this sub-node to the SYSCFG binding. It is required on STM32MP23x
> > > and STM32MP25x and not allowed on the other SoCs.
> > >=20
> > > Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> > Why does this need a child node at all, can't the clock controller
> > properties go straight into this syscon node?
> >=20
> > Cheers,
> > Conor.
>=20
> I sent a v2 [1] shortly before your reply, which explains this in the
> commit message, but the question still applies to it, so let me answer
> here.
>=20
> From a hardware point of view, the mux inputs could indeed be described
> in the SYSCFG node. The problem is that this node is a "syscon": when
> the syscon core creates the regmap of the node (syscon_node_to_regmap()
> or syscon_regmap_lookup_by_*()), it takes the first clock of the node as
> the clock of the registers, keeps it prepared and enables/disables it
> around each register access.
>=20
> The SYSCFG has no clock gate in the RCC, so this first clock would be
> the LTDC kernel clock, i.e. the first input of the mux. It would then be
> enabled on every SYSCFG access by all the users of this syscon (PCIe,
> ComboPHY, Ethernet, OMM...).

Why are any of these things getting probed before the clock controller?
I had it in my head that clock initialisation was done super early on,
before smp even begins, so the clock driver would probe and generate the
regmap before this can happen?

>=20
> Registering our own regmap with of_syscon_register_regmap() from the
> SYSCFG driver doesn't solve it either: these users reach the SYSCFG
> through vendor phandles (st,syscon, st,syscfg-amcr) or by compatible,
> which are not tracked by fw_devlink, so one of them can create the
> syscon regmap, with the clock, before the SYSCFG driver probes.
>=20
> Apart from adding a dummy clock in first position, which would describe
> something which doesn't exist in the hardware, I didn't find a way to
> keep these properties in the SYSCFG node. So the mux is described by a
> sub-node with its own clock inputs, like the USB2 PHYs of the SYSCFG
> which are already described as sub-nodes.
>=20
> In v2, the '#clock-cells' property of the SYSCFG node is deprecated, so
> that the sub-node is the only provider of this clock. No driver ever
> registered a clock on the SYSCFG node, so this doesn't change anything
> for existing devicetrees.
>=20
> [1] https://lore.kernel.org/r/20261110-ups_mp25_clk_syscfg-v2-0-624559bb8=
ec7@foss.st.com
>=20
> Best regards,
>=20
> Gabriel
>=20
>=20
> >=20
> > > ---
> > >   Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml | =
6 ++++++
> > >   1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-sys=
con.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> > > index a559f8b03b84..38c844e8f19d 100644
> > > --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> > > @@ -45,6 +45,10 @@ properties:
> > >     "#size-cells":
> > >       const: 1
> > > +  clock-controller:
> > > +    type: object
> > > +    $ref: /schemas/clock/st,stm32mp25-syscfg-clk.yaml#
> > > +
> > >   patternProperties:
> > >     "^phy@2[48]00$":
> > >       type: object
> > > @@ -80,6 +84,7 @@ allOf:
> > >           - "#address-cells"
> > >           - "#clock-cells"
> > >           - "#size-cells"
> > > +        - clock-controller
> > >           - phy@2400
> > >           - phy@2800
> > >       else:
> > > @@ -87,6 +92,7 @@ allOf:
> > >           '#address-cells': false
> > >           '#clock-cells': false
> > >           '#size-cells': false
> > > +        clock-controller: false
> > >           phy@2400: false
> > >           phy@2800: false
> > >=20
> > > --=20
> > > 2.43.0
> > >=20

--hlndOg5Yw8RzH+lw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavYHlwAKCRB4tDGHoIJi
0qQzAP485R+QaU2P6b2L0zrS4zCbRiMyXVxuo3+/WUU3dc7jMgEAkdBGsN+zsL7t
gKc+WZyW1vlVRn7hzQFLhLkjB2PatgQ=
=UEaX
-----END PGP SIGNATURE-----

--hlndOg5Yw8RzH+lw--

