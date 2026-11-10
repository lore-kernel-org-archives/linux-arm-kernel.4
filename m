Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8649B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ytQhPGz6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbEQZYms
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m+Mg2pmSN+BG2xokzdSJfneMVVdXbskQcyg2u8EG8MU=; b=ytQhPGz6shtXQMIBjs8opNEqim
	9/bcU7Ne4VMaE8MzDTNUPqDT2KkpENQpyTRFnuSsaVli76BMIxPH16iHdQikDG7P7qgHiXxeG+O5y
	YAXwg9A1lX7olFUTz6m441cWv16HPuF0wu9b1SHNSdtwUZ4nuBmIQMoKohQNu+cr7lhWvR4nmjMXz
	7ECIZy383pLz2QgSVgtrimAaJEMrCz+odzgCavpn3gMPw6fuKK7yzWs+mMQw45ywBU5xoQppv9s9e
	DS/zEBxMaAFjCncM5VVpPw9A7ZlhNIHr8O6fv4kfkvIWNaWZElmLZFU5pWRdfA0BryY8YJVEtLsm8
	dJY47W+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQr6c-00000004ret-2Sy4;
	Tue, 10 Nov 2026 19:02:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQr6b-00000004rem-1yY2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 19:02:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6A8C4018E;
	Tue, 10 Nov 2026 19:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB301F008A1;
	Tue, 10 Nov 2026 19:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794337324;
	bh=m+Mg2pmSN+BG2xokzdSJfneMVVdXbskQcyg2u8EG8MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EbEQZYmsiV+CwZPSKhwsGVnIZd75BetlSFkt7NHcBffbaKVP2/TkY23QXNN3Clolo
	 abc7ybU7CMsSYFnt8xNr9d/UySv4qAwypcO5LtrrusJib1wz+egSYqq8ueaQC57FtJ
	 tAkGDIja4G1AbC+nbwUByLb3kNBi7UEYCzlW3YgGlyU30PYMQmyyMkdBGdWFjjXPoz
	 OthuZlSPkoC3SbxAT7LruVAzF6G/HxJqlGb+UgiBOUZQEeDR/f/QO7d7ChWlxioCUe
	 /obJwbUHcL01lXtXbJiKnNjaGW3MKtcedGJOrQEStsAidjoUSKyKHskaN6eNyUt4L6
	 4JSF6bjDCosdg==
Date: Tue, 10 Nov 2026 19:01:59 +0000
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] ASoC: atmel-i2s: fix clock error handling
Message-ID: <a236085e-5ccb-40f4-ac59-75e0249267bf@sirena.org.uk>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jx4O88Jzwpr7VcWr"
Content-Disposition: inline
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
X-Cookie: You can't take damsel here now.
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


--jx4O88Jzwpr7VcWr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 11:38:51AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> Hi all,
>=20
> This series fixes clock error handling in the Atmel I2S driver by
> propagating errors, using optional clock APIs, and simplifying probe
> error reporting.

This doesn't apply against current code, please check and resend.

--jx4O88Jzwpr7VcWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzaiYACgkQJNaLcl1U
h9Djlgf/V/gElCZDZ2VSQGSm5CRyeWp1zE0bW51v2sBWGhM3Oxkt2yTcCnIENuWj
L+TEeDNt2hiwRTsd1U3OOluIqWJXy9HTdqVDfvn5mLlKDl33vrEbFwrx3O3Oet36
p2oEONoOjq+GD0Cu46z1rZeMXQZn0F5wJg/YxDgQGO88pxsR7R1AxcFj5GSILNGu
mqR6t9sBzEdVOpqPhoFoy8Xo0VFrILtZJdjUU1JItMpaxa8RQilIyXvP2/CU8Fd2
v80iKAI4CUY/1z0a1ASZNCQMCCOVbLPwop7Ys+zDQlxZOByMCR816d/hNG8RGx6d
D1ISdJata6AvCyRqC20n6d1v/o5joQ==
=4SwU
-----END PGP SIGNATURE-----

--jx4O88Jzwpr7VcWr--

