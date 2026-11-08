Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD140606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qijGHFsN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J5lmvdLo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aGN87J+fR9ut5Wd+2z7+FR6O85gZ4NXRmC3f+7Jm8Vo=; b=qijGHFsNCiv0odT8yldXU8Ai4Y
	ES52NdYna4/h2MxKci0R6FNfzBnMaOr1KXU/tUgkzTpSMauFyFkP1EhPv7XX76GGYX1xKUBPv3R9/
	D25YTudPvKb5TzZNAZESoDc8ydrEmjv8+6FJtgyRU1vDKUkePjIdShnD8MSs4cZrip7jpZua2BupD
	oOiEHYApbPoGG8pXEABKfos3mBkUHKq6Expwhhj0jApsVMxkcC+rI5grlroAhrOb4lY1xc77bg8Nn
	XGDgsMENriQHOggDl+qh1Mq7gpV15yV/S3o3M8DD/TywGcexehRujGE2fv8qiuogmPkKO+jU6afv9
	7Hi26FVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyV2-0000000Frgo-00hZ;
	Sun, 08 Nov 2026 08:43:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyV0-0000000Frgf-1973
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 08:43:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 4F59660D45;
	Sun,  8 Nov 2026 08:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 573541F008A1;
	Sun,  8 Nov 2026 08:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794127417;
	bh=aGN87J+fR9ut5Wd+2z7+FR6O85gZ4NXRmC3f+7Jm8Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J5lmvdLofW+igzDbnj79eHM7FWRKXZPP7h2YGY4j6A0nVGlnEEvIoKs6+jUSpYOE7
	 uAZ3wdzOvPSyA65If4hPCyEQrjnOhaB/bmH2SXuG0rPkB+mZutvRm9p+bisx7nSyPq
	 /cH4sZhK0q2mweLfSvJ90gplPxELAI1QAAdA9BgE7FRHSBr3wTm1Y4LclrXC9zGnM6
	 JxXmqNwHjHzhlaGy7W6SIxTbXexrvC1hYF5EJZ7dxFkk/trMP5DDAhTnIuU9H02fjl
	 vvgyP80ncYhlIO7f8JYTyZGNei07mvRmUx/nrqJCLlAyCGE5szEqJfmGuWhcR+Y7Fs
	 MWoMIad2HGDoA==
Date: Sun, 8 Nov 2026 09:43:33 +0100
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
Subject: Re: [PATCH v3 5/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8142
 compatible
Message-ID: <avA1rkMvbmTiJDPC@monoceros>
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
 <20261106-apple-m5-initial-devicetrees-v3-5-cee55de54b2f@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b3fg2hf65dsjedqn"
Content-Disposition: inline
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-5-cee55de54b2f@cyberchaos.dev>
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


--b3fg2hf65dsjedqn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 5/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8142
 compatible
MIME-Version: 1.0

On Fri, Nov 06, 2026 at 10:24:54PM +0100, Yureka Lilian wrote:
> The PWM controller on the Apple silicon t8142 (M5) SoC is compatible
> with t8103. Add "apple,t8142-fpwm" as SoC specific compatible under
> "apple,s5l-fpwm".
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Fine for me to let this go through apple-soc.

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

(I already wrote this in reply to v2 on the same day v3 was sent. So
just forwarding the tag for v3.)

Best regards
Uwe

--b3fg2hf65dsjedqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrwNjIACgkQj4D7WH0S
/k4g3AgAidRfhY4rKgEUhlf2mTx8vkNnUzoHqzB4dpQ+eTv6dAZ8nwRMnCl/9Rjk
5U87j+aDvbDDT/u1hMpORGXfuDyHH2MWkSp+cjAHupUipA3gwhJdJVq3EC+UfXQ6
TGrH7CSYlD1Kdyyjvg33m07H2QSgS1PjBHN2MqWHIMwfRdOQtl3NUYheaAK6mhfP
E6bDg2PVKXLZ2Gb+ONSmFcZnNY7XMpRVLoCJU+QOwBFV5o32XqXK6jCLS8rG3Jbu
LeYpsRLdPlZ87JVSQDlwsh/NEYrvmBRFaSgN1Lknzp8mI6O/FXJg5nz+Ivl5D20Q
0ymfj4uU8+HsKvwrRb8uEE/Yq6Pk1g==
=HKpk
-----END PGP SIGNATURE-----

--b3fg2hf65dsjedqn--

