Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7B7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 23:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ptAkw1XD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpGUSey5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C2reihoSd8+x5X3GrAOxEQiq3mx4R4XS9zazh7fb3Us=; b=ptAkw1XD7IPn3tUK7kKp5ePjdn
	VQjE4+pZRWyr2xyTZ+0ueFjp/VmpC9klV7ir060tNXN/mXrVIHoNdSIrf7JFqAa4RwF8m0qaOo+k/
	RkYFHfMYtYjg11WJ8zlCr8RQPkHDQT/Fkv7bkTce6Fjb7MOatPnyYw2/vQ20moUySrnme4FZsKE7P
	lU47HQTxvlQvkrZPQxZr6heExqzY8NEisBc3n7YVAs0YCJkCOhuL1jo/AAHDO8d6z50bL5MELw2aV
	+tYX04TRZdTjDUbgvxhaiQf2p9R5DUTRGhzHoJvdLiEfC4v86tpkGHGFcEvcPQFChUwyGHmZC+O/d
	FGXeux2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQC8S-0000000GsoE-0WZl;
	Sun, 08 Nov 2026 23:17:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQC8Q-0000000Gso1-4B2y;
	Sun, 08 Nov 2026 23:17:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A69761184;
	Sun,  8 Nov 2026 23:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3A21F0089F;
	Sun,  8 Nov 2026 23:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794179833;
	bh=C2reihoSd8+x5X3GrAOxEQiq3mx4R4XS9zazh7fb3Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jpGUSey5vvxY92S+HSf4OjpfJZrKayxou0qil8Xw8HI0KUYAGMdJ8qvI5skRIcVqJ
	 V5OeCHHEYJ3Vf7jlLwQ00IKnbUyWU+PCNZ5C14m/P6TfbC4CerkGeqUBMWvt/9CSU3
	 vOzZ1fPI7/x4s7fTfR07RFmFucr1tUU/gKar+9Xx92BCNdmPpYjJV2UMvcEC5enA99
	 Jx1lPLuRKGwGKwbC2/W88g1DCeh6wsi5yzGUV/QN8NRyP61gx6Tuvw15s+PLAYb0jk
	 qoWrt82mORcGdsnMmq+Iuo9quSFeAd3RLRtXGLGwClBr0T9S2hIDA3ZcbAEC6UE+kw
	 AHaXbFVtg0DeA==
Date: Sun, 8 Nov 2026 23:17:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <20261108-resurrect-mumbo-10daa7ac0cf0@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
 <au4p0xYEFkgEU6T4@macbook>
 <20261106-headband-buckwheat-fecbd459ee85@spud>
 <au5RoF6BooP14xhY@macbook>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hSqhUowhvI7bmoOF"
Content-Disposition: inline
In-Reply-To: <au5RoF6BooP14xhY@macbook>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--hSqhUowhvI7bmoOF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 11:27:38PM +0100, Carlo Caione wrote:
> On Fri, Nov 06, 2026 at 20:48:01 +0100, Conor Dooley wrote:
> > On Fri, Nov 06, 2026 at 08:34:37PM +0100, Carlo Caione wrote:
> > > On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:
> > >=20
> > > > > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > > > > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > > > > +
> > > > > +    soc {
> > > > > +        #address-cells =3D <2>;
> > > > > +        #size-cells =3D <2>;
> > > > > +
> > > > > +        clock-controller@0 {
> > > > > +            compatible =3D "amlogic,s7-peripherals-clkc";
> > > > > +            reg =3D <0x0 0x0 0x0 0x49c>;
> > > >=20
> > > > What's with the weird numbers in this example?
> > > >=20
> > > > Examples don't have to be real, but when it looks like this the
> > > > immediate thought is that the modelling of the device might be
> > > > incorrec.t
> > >=20
> > > The numbers are actually real, but the example simply lost their cont=
ext
> > > because I copied the node from the S7 dtsi (not yet submitted), where
> > > the controller sits under the APB bus node (bus@fe000000) and the bus
> > > ranges make the addresses relative to it.
> > >=20
> > > 		apb: bus@fe000000 {
> > > 			compatible =3D "simple-bus";
> > > 			reg =3D <0x0 0xfe000000 0x0 0x480000>;
> > > 			#address-cells =3D <2>;
> > > 			#size-cells =3D <2>;
> > > 			ranges =3D <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> > >=20
> > > 			clkc_periphs: clock-controller@0 {
> > > 				compatible =3D "amlogic,s7-peripherals-clkc";
> > > 				reg =3D <0x0 0x0 0x0 0x49c>;
> > > 				#clock-cells =3D <1>;
> > > 				...
> > >=20
> > > In V2 I'll use an absolute address for the sake of clarity (PLL has t=
he
> > > same issue).
> >=20
> > Before you do that, can you please share with me the s7 dtsi? Cos surely
> > you've got it in some git repo online somewhere.
>=20
> The S7 dtsi is already upstream at [0], the peripheral clock controller
> and PLL will be enabled in that DTSI with a following series after the
> bindings and the drivers in this set are acked, following the diffs that
> will be submitted:

Right. The device does seem to have nodes of odd sizes and start
addresses, so this at least is not making anything worse.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--hSqhUowhvI7bmoOF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavEC8wAKCRB4tDGHoIJi
0kSzAP9D+07DueUyQidEmOTviYikdTVwB4OjYhIW3eDHUkvnNAEAw27P7rZuFiZP
JlFXjpIzLkFe/xvXdJ5/TibIL+soSAc=
=F15I
-----END PGP SIGNATURE-----

--hSqhUowhvI7bmoOF--

