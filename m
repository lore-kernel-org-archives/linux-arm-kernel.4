Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5916606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3byQHVuy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CecBg1Cd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lAezh5mnef6rba6MZBj2wsMthABud2NmCB2DtTrRKdg=; b=3byQHVuypeCjyxWwteVJtbImEK
	WfzeIo5WxA8JPgBv8cOxH9OczHPTRc2GwDLq7ZaQV8B7zJ5WeMarnGBtWssDbdPDYOoJbifeHU5Xo
	1zhl6PWI/FfYeVKaXh5ucN9mykb1ftpZQSgmFoiLO49W8GA+cNA0ccfUHQuD2DUb6Sd8sTUGyGunV
	15+TyUzlAT6s7Q++nmYfOfa7AeIL/SZbTsNWorxz1cEkOxRIe3hc7zGMW4TbcIXFXOgtqhSbLLolT
	a1Byn//sT6A+6XF+3IwyQfj/ylj8d1IHeD1nVCwIrzoJAbE8qn0Mf+Kgk2f/wEIb83FUM72ef64G/
	CYUIRj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS25N-0000000Ey8b-1vgF;
	Sat, 14 Nov 2026 00:57:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS25M-0000000Ey8P-00Yb;
	Sat, 14 Nov 2026 00:57:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73D0340054;
	Sat, 14 Nov 2026 00:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2594A1F000C5;
	Sat, 14 Nov 2026 00:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794617859;
	bh=lAezh5mnef6rba6MZBj2wsMthABud2NmCB2DtTrRKdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CecBg1Cd3qXQJrxLnt8ysgW7jGiA+dkeJPFgatdCew6s7dyDUQCyH+0RikWU7S8Sh
	 FCSBgxQFrfBs0kakUg7kX5knQbwJeLa/EW7xk3iAM1TYGE/USmsxfAHqGlpHD09zZ+
	 p4RLXv/iGtD/hoQWo4VbWwhhXO4yOJVdvaPbhU7YZrX4oxCzAR1hb5ZmCkMPlBy02U
	 50i38kc8VihebyiOg4mp3SbbpVaUE9A7J3fOUvN7Qmx+/aPdRk1CA/dYx+VBaPMusq
	 +j4x5DMCaAJbjz0ek/Q47G1i6hJRNsHxuGV/XZmmflBAmbEJjb2W8QjeeySkimgVTL
	 TULQ/npSW3SVw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id C595032AEA60; Sat, 14 Nov 2026 00:57:36 +0000 (GMT)
Date: Sat, 14 Nov 2026 00:57:36 +0000
From: Mark Brown <broonie@kernel.org>
To: William Zhang <william.zhang@broadcom.com>
Cc: linux-spi@vger.kernel.org, shao.mingyin@zte.com.cn,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	pjw@kernel.org, samuel.holland@sifive.com, kursad.oney@broadcom.com,
	jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
	anand.gore@broadcom.com, florian.fainelli@broadcom.com,
	rafal@milecki.pl, linux-arm-kernel@lists.infradead.org,
	sven@kernel.org, j@jannau.net, neal@gompa.dev,
	asahi@lists.linux.dev, ryan.wanner@microchip.com,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: Re: [PATCH v2 0/5] spi: fix division by zero with a zero transfer
 speed
Message-ID: <7730027d-d89c-4b7b-b8d8-07bb19e95061@sirena.org.uk>
References: <20261110233450305Smji446Uhvoxa7r8SHEgl@zte.com.cn>
 <179460764342.448985.18219249061160291658.b4-ty@b4>
 <CAHi4H7GnDJPcJ2_DD8GGuFjN8mZsGPVWRCYzfCwywQeh26-=Fw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xoZP66/tINM/gAZZ"
Content-Disposition: inline
In-Reply-To: <CAHi4H7GnDJPcJ2_DD8GGuFjN8mZsGPVWRCYzfCwywQeh26-=Fw@mail.gmail.com>
X-Cookie: Earth is a beta site.
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


--xoZP66/tINM/gAZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2026 at 04:39:38PM -0800, William Zhang wrote:

> There are still open disucssion in [PATCH v2 3/5].   If we want to add
> a clamp in the controller driver,  patch 2 and 3 require extra fix as
> discussed in that thread.

Ah, I'd missed that subthread sorry.  It does seem like something that
can be dealt with incrementally, none of this should be triggering
unless the system is already pretty confused.  We could do something
like have the driver round the rate up to whatever it's minimum is?
We could also have a min_speed_hz in the core which would help, I
could've sworn we had something already but I'm not immediately finding
it.

--xoZP66/tINM/gAZZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaveyAAAKCRAv73Ows9A4
ifbFAP0SON2H7y/CJFWdK8kc1nz9gkXWut/M+KwIZnLTiO2HNQEAkMkTi5Jgnxqv
d68HY96IysarOApAVEJVLdzNrRQwzgs=
=9eWL
-----END PGP SIGNATURE-----

--xoZP66/tINM/gAZZ--

