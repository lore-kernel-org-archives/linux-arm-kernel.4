Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8677E606D813
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 20:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ClLB5EFy;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NIr5sIzw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HZho2msgoJMdouDBhI/tZS+qfCR+U++y56XOVqrTM1M=; b=ClLB5EFyesSC6E6WV8ZmgLhAaH
	qJkxqVSRJC9mNVImM/ANr72HuWWjDL48FAcJLQbUGEqBGtswhxrTNKAwyVt0Laryn6g9SElzetjg/
	5YWzelPM0gdQc7RaKAKps9Yi3Chwq23iWYJ3bWfHl/tQg4BLvZd+M9HgSnhkeMV85zMdRY13MFM0h
	FYyX/TdzkG4CAS3mqHopc5dml9XtCziFZA7TMNbRpifWXPKyE5orI2c9ABdr2R00JRxY4lMrZAHme
	51kaF+cov7/L7mHj0ufJmUuH+SLgsq0/Rkf7cjP0H3WGjW0YmRFWEZ3biJ2AVh2Eu+UE3hnw97pXq
	G33sL60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPQr4-0000000DcHx-219Y;
	Fri, 06 Nov 2026 20:48:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPQr2-0000000DcHS-1hTc;
	Fri, 06 Nov 2026 20:48:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77457601C0;
	Fri,  6 Nov 2026 20:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5AE1F0089F;
	Fri,  6 Nov 2026 20:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793998087;
	bh=HZho2msgoJMdouDBhI/tZS+qfCR+U++y56XOVqrTM1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NIr5sIzwS2dfqHfuqwatw7sGo8fIj91w5JB/t+CRq5heewdF7e/Q3g9bqdzswAUC8
	 ET4qWklG9GUx7R3W5HvZhRODQ8BUm1AKEmPInIYd2NShU8i9wYG0S6+QYe98JGhPsa
	 kpqZ1t7cTo/DvoKmvUw17MZIdH1y14qz3UwgEPkqUEF0i6P0QAu3fB5PPvGZS+DQ0L
	 jzwVAZfVrbgC1lkdxKJVUtnJLIteGLFtJBR+wj4AiJy5IHvE80+PLYOw/ls9lUEkxZ
	 o859DxAU+qbao+Wug7AGJHeEHsLUT0CfpjCXJvLxgPWApUV4KH2BDriljqQYdBPUZS
	 j+uT8HHNuTyzA==
Date: Fri, 6 Nov 2026 20:48:01 +0000
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
Message-ID: <20261106-headband-buckwheat-fecbd459ee85@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
 <au4p0xYEFkgEU6T4@macbook>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LmB6H6jGQB3RSrN8"
Content-Disposition: inline
In-Reply-To: <au4p0xYEFkgEU6T4@macbook>
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

--LmB6H6jGQB3RSrN8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 08:34:37PM +0100, Carlo Caione wrote:
> On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:
>=20
> > > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > > +
> > > +    soc {
> > > +        #address-cells =3D <2>;
> > > +        #size-cells =3D <2>;
> > > +
> > > +        clock-controller@0 {
> > > +            compatible =3D "amlogic,s7-peripherals-clkc";
> > > +            reg =3D <0x0 0x0 0x0 0x49c>;
> >=20
> > What's with the weird numbers in this example?
> >=20
> > Examples don't have to be real, but when it looks like this the
> > immediate thought is that the modelling of the device might be
> > incorrec.t
>=20
> The numbers are actually real, but the example simply lost their context
> because I copied the node from the S7 dtsi (not yet submitted), where
> the controller sits under the APB bus node (bus@fe000000) and the bus
> ranges make the addresses relative to it.
>=20
> 		apb: bus@fe000000 {
> 			compatible =3D "simple-bus";
> 			reg =3D <0x0 0xfe000000 0x0 0x480000>;
> 			#address-cells =3D <2>;
> 			#size-cells =3D <2>;
> 			ranges =3D <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>=20
> 			clkc_periphs: clock-controller@0 {
> 				compatible =3D "amlogic,s7-peripherals-clkc";
> 				reg =3D <0x0 0x0 0x0 0x49c>;
> 				#clock-cells =3D <1>;
> 				...
>=20
> In V2 I'll use an absolute address for the sake of clarity (PLL has the
> same issue).

Before you do that, can you please share with me the s7 dtsi? Cos surely
you've got it in some git repo online somewhere.

--LmB6H6jGQB3RSrN8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau49AQAKCRB4tDGHoIJi
0s31AQDovk3BCRNZkzAP0JDIfM+oVR7DeKQ2kE3TEp2hr8RKvAEAi5/KPKD3qcua
lDaZqwmPOKSB/JV+k2gT9cYzHgcbmAQ=
=tBnu
-----END PGP SIGNATURE-----

--LmB6H6jGQB3RSrN8--

