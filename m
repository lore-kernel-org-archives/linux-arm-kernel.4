Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEF9606EE90
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IplKpwIo;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JP6yeHxm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XXD9tIfIeyyf1tgZA9qRzZVpi+ZbPumJ8KIZL1TcJBo=; b=IplKpwIo2IIZG66lEb7+9+2uYD
	yHuaQEkQiFFayXmaIx542LgQwl5iTnUsSen9/5co/uIo6McwvQi+vncsfkf3vEJaP/wkJ5gTb38OO
	H1tD38KV9I75j29f2KY5MCGEFW5XBx2bleDMU/PCFRNKpM18IyBgzxcYQo3s1RJuBEFn5Tez5M+pF
	hiNxf+K+SHUOF6M6w77moXJEeBVTHwbl0LSqTbVaZaoffR9a5lTMfKIdsttqT4xRQajgGOz0AoUZz
	uKKqG0S+HjFLFARlIOnUvupq1zjqF2fZPna0XT4giMEc+ZAX2hL94XRDMo8V+Wc1Dg1DlVFz62/1O
	TAFtcU0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOoA-0000000DPjf-2rSM;
	Fri, 06 Nov 2026 18:37:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOo9-0000000DPjP-2gpp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:37:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 1DFEE605F7;
	Fri,  6 Nov 2026 18:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A888B1F00904;
	Fri,  6 Nov 2026 18:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990220;
	bh=XXD9tIfIeyyf1tgZA9qRzZVpi+ZbPumJ8KIZL1TcJBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JP6yeHxmQzRl5hfaLX5+I2lT3SyYTBGhNYkoVJ3v7G8tYwAX5YnJz4/yR2RLzU6p5
	 dyY+S9mRtfq3RtXpFzlRtNxJIQODDnmiIvrqTvMZBUyddA4H+AoMT7HIE9PjZ1n5Gh
	 kpPk7c8qekKzTxRGBdZgcniYKpIiNah6X3+S8+6NvTiFw6wP25AwjWIV1AKKzURFjn
	 PMFAdKiFHETWQEPItd/Xpy41tEJkfjvBp9XuIhI7b+vCTQh3hPXaDh4xcs+1kk53Eu
	 +ATMDnWpC4Qs7IaKVqlay7SJbrE6J18NQXtYwMh5FtAqf2hDbRahmX7p6c2VT5//dD
	 2nZa/uyHZxolQ==
Date: Fri, 6 Nov 2026 19:36:57 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Sasha Finkelstein <k@chaosmail.tech>, 
	Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8142
 compatible
Message-ID: <au4eDk3-bAQ-EjlD@monoceros>
References: <20261104-apple-m5-initial-devicetrees-v2-0-fd727a82d380@cyberchaos.dev>
 <20261104-apple-m5-initial-devicetrees-v2-5-fd727a82d380@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cpcwbv7z5gtj3ayx"
Content-Disposition: inline
In-Reply-To: <20261104-apple-m5-initial-devicetrees-v2-5-fd727a82d380@cyberchaos.dev>
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


--cpcwbv7z5gtj3ayx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8142
 compatible
MIME-Version: 1.0

On Wed, Nov 04, 2026 at 06:24:18PM +0100, Yureka Lilian wrote:
> The PWM controller on the Apple silicon t8142 (M5) SoC is compatible
> with t8103. Add "apple,t8142-fpwm" as SoC specific compatible under
> "apple,s5l-fpwm".
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Fine for me to let this go through apple-soc.

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Best regards
Uwe

--cpcwbv7z5gtj3ayx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruHkcACgkQj4D7WH0S
/k6/Mgf+MNkIvT5Osv2p9FD0hPlNyAR3xgH22Qg5GmwtX8sdRXqeW/pfzrRa0gxC
7KfnB3QUi973Kv/P/KotlgUNMyclAouMDla3PK9/qB154h/I2mAyYaxkMFxA6hiM
BcmpD9nehcFqa11ZbSyK7woPht/jT/p0lGV/zwWtF8e9xauuKUJACSdOC0ZqCQ7s
MEKrMqfFW1X0vkX7u1pIgM1/xOou1cM7QcCa7c5R3iH6Pikl0yNUE4orNB/C5DXm
0zNp2ZaGX9KJY6GdRk0Lmx/01kAcUXUPo3qed3VVwfvZBI24n3tXoq2j1k3LmMQf
OfVVqtR4am7GiKEOUkgkxdfS+ZLHxQ==
=jNQA
-----END PGP SIGNATURE-----

--cpcwbv7z5gtj3ayx--

