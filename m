Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4138606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rdpTIXH3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bCoxE7K8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ElaHpO/cl7bIhBpcIggkO3WyV+HKCbctoj21X/hVL3w=; b=rdpTIXH3g/1gKDMFnlDJsyRJMd
	vNbvWDdUwaaKl4wWhSxbuQl8DA92IsO05UFsuiC+6XA6Xlxt7DL9OGuCuohkhnQ8T+L5BaLyUDM4S
	o8zf/nMOmqjprTHW2SAmL8Tnkk4yzchhAGZ8zl4G6uk76JEJn0nR2CbhoU4BdcYgjZ3YibsGH9YOj
	c540DpPVVnWfO9ZEVNYlAaeqHe80USjewZhtGOHAJq7YSSw5bezFKQhwGrxZPGgyFB9awOWsi9Qra
	tyt+F7m+d1C13eGmL5Sg5v5t1h6Ufpv78gCVeHDvvkBdCj2fpWYu9/PlJnlJqSr7hVuN3UfJ9QZne
	aW+tZm1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsu0-0000000DJiV-2hQw;
	Fri, 13 Nov 2026 15:09:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsty-0000000DJhh-3sAx;
	Fri, 13 Nov 2026 15:09:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96BDF4087F;
	Fri, 13 Nov 2026 15:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18081F000C4;
	Fri, 13 Nov 2026 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794582558;
	bh=ElaHpO/cl7bIhBpcIggkO3WyV+HKCbctoj21X/hVL3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bCoxE7K8MTaoQxI7TJYL3QOgNegL48sGHSbCDvlHU6QC+LHc8Ap9HG6v17knvmDvF
	 0WQ4TdIS/GeUQHZZdZKOe4Z5hkfvYKGEA7hPrElyjOLy6cypsilVdxKGzLTwVxJ7Nm
	 V/THv7RQhk8ruf0nvU0V+TJKdgwbnCffsGEjITZq2sznjKY9fcvBiVfMwbXmeK3/VO
	 oypA7NkD6G3w2QDC3fEhWAUR8n3yGLCusgP4kgF40j12AyKmNHvLgOxaI7Wm9aGt8B
	 vhX0sluiK4JXpZ4BQKZcEGECH8ff/SaJQwUIXxOq29GXuliBCi4MXtK7ElPHbHkwaU
	 n/AAh8eot3+mw==
Date: Fri, 13 Nov 2026 15:09:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Valerio Setti <vsetti@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is
 held
Message-ID: <956be74b-e417-49ef-8c2b-4cfa2785de1c@sirena.org.uk>
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
 <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aUv4vAN6sKoMDkAM"
Content-Disposition: inline
In-Reply-To: <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
X-Cookie: Flee at once, all is discovered.
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


--aUv4vAN6sKoMDkAM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:54:29PM +0100, Manuel Ebner wrote:
> Hi Valerio,
>=20
> I have read your patch and have a question.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--aUv4vAN6sKoMDkAM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3KBgACgkQJNaLcl1U
h9B39wf9EvUqesa7tYghVXB4F8vgGeLnqIn57bm2KD+9XYi4jGGVSW8c4ebimqhM
dp+bmECZYP/LAUEt398gktd5wGC+fWNPmHZ6rxyZJyCNr2+MuvjZ58rM1U7IJ9cA
k9qSPDzy6EV/4aNWqvFfmesBxQUqej68UhfKVr4w7/HmawPuUvlfA/z4qi9jCkZ4
5bTzkEzmBBVbJ2DFi1DcS0b22KkOgqHa1wSBaGCLmFVDhhgrEZCNFqSY3eJZprZG
7UPInXpfm7vM4MkdovYrnlXaTlZ/8jOgmw9F9z8jNCrcJFg+Beebv32ZmJuwUbY8
/PxUg36kalzUVnwXEVSMIPpbpx11+A==
=BzTS
-----END PGP SIGNATURE-----

--aUv4vAN6sKoMDkAM--

