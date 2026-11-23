Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144EF606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mUTd7TeX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LxTuS4xi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pMYyHbi9eCJzjPEu1qvig5S1oDRcjMPdMcr+B+NapPM=; b=mUTd7TeXMTqbSv+dMibVdjIlVg
	2u0THSxXoqSruwc+XWQkAkEsEOCICbebYABOLqBTIuZ/sZZswJU9nLewWTpbB0jAWj0JITPRVfS2C
	Q5HiC39dZ6hec8a9FEaADDQANRwmJ8tA7T0qZCa42/o69Ua+ICshWvUfruI0YN78ZR9n15lKhJ9og
	oc7KrjSwJ2SsFIZMiXK2+bHG47H2BtBTTWWZCiyOnVAUjwfHs1009AODgN/lxs2jC6DOEk1fWCxGm
	/ZNS9Pw4jc1X6W2vLeZ5Y3e81h+cyv5ZAasdjfRen8qGZfLw/hnoC6PJ/q9iDlD07tafK4/zaoDBJ
	GktXzwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZJQ-00000004bXk-31Vl;
	Mon, 23 Nov 2026 19:02:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZJN-00000004bXO-2RgU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:02:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B4CA60E78;
	Mon, 23 Nov 2026 19:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909141F000D0;
	Mon, 23 Nov 2026 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795460564;
	bh=pMYyHbi9eCJzjPEu1qvig5S1oDRcjMPdMcr+B+NapPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LxTuS4xiqOoIBv8dupRuSkFB/HTVYl0VmdGCAo7J00S/kLyOGbWqCJTgsava+mdn3
	 UB9/F/eHOS/OQe+kJ6ZN4OnR6Idiw7IZtROwXb97YLikpicLIL+2WtcBgLUtxvMLbT
	 9Raza+6Raz/KyUMOsFY7Y7nlE45K/oOo6WOWbosSJeP3KYV/m0fqyNz0/nH31KDto7
	 EhAIIbGfdWjLWZVr0egXO2f0WNJ+prvk491ULznEeOzMVAV9rIpjcBSQA59CsL6KH8
	 NsujtJr/nltw7g5wd/+f8vvJpyg5PcZajX5VLRA6OxlS7CAgaqMWD6Pz5GAJGTwTS5
	 7zpl1Dn5zekeA==
Date: Mon, 23 Nov 2026 19:02:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, imx@lists.linux.dev,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Johan Hovold <johan@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: spi: imx: Use devm_clk_get_enabled() calls in spi_imx_probe()
Message-ID: <1292bc63-f689-4e93-bf90-aa495431cb0d@sirena.org.uk>
References: <895d50a6-3a42-44d2-8625-3b8cba8fbfff@web.de>
 <awR3jGcH97PrYNqc@ashevche-desk.local>
 <797d8f02-2e16-4ca6-bfda-8b6e40742a84@web.de>
 <awSKzgNGzuxl2OXO@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fl4BbqkuRdkA06KY"
Content-Disposition: inline
In-Reply-To: <awSKzgNGzuxl2OXO@ashevche-desk.local>
X-Cookie: Truth is free, but information costs.
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--Fl4BbqkuRdkA06KY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 08:49:50PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 23, 2026 at 07:24:21PM +0100, Markus Elfring wrote:
> > >> * Reuse existing functionality from devm_clk_get_enabled() instead of
> > >>   keeping duplicate source code.
> > >>
> > >> * Delete clk_disable_unprepare() calls on error handling paths.
> > >>
> > >> * Omit the label =E2=80=9Cout_put_per=E2=80=9D.
> > >>
> > >> This issue was detected by using the Coccinelle software.
> > >=20
> > > This now messes up with the PM callbacks at remove stage.
> > > It's not trivial how to make it correct.
> > Is there a need to adjust and extend devres programming interfaces any =
more?
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/driver-api/driver-model/devres.rst?h=3Dv7.4-rc4#n242
>=20
> I guess you did get my point. You can't simply do what you have done in t=
his
> patch, because the devm*() will do something with clock reference countin=
g on
> remove stage _after_ the driver.

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--Fl4BbqkuRdkA06KY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEjc4ACgkQJNaLcl1U
h9CuLgf/cGEyPOu9TiGIzr7JDZkRffvHTkXx4PPFRoaFr84CqMwwlFdeIxO5cxn3
p67Q7PrjWTgoWsLkBHwL02bg+9NWkaqXGh3YxB2PTeY5PwaZtqaSf3D2aWbk2juS
GW6MoeDmhbQMCO6LqEr0LWKNkRDPU1jN55xWco+FNEnMqcixrer3cgGrs3DoW4FT
mpfisWt27N3iAbWmLo7Au+RclhP+G0PIpOxbaZzWu68QcbZr7pt1Qp+kD7R8fF/u
rc4gPU2nqbE4/r/moyo5JJ2q6mPZjGncznlhvLWM0clAOaK0IwUIJgaNF5M72MHd
rIHDa8Pz5cs/ycb9asfj3FgK4w03/g==
=7gtm
-----END PGP SIGNATURE-----

--Fl4BbqkuRdkA06KY--

