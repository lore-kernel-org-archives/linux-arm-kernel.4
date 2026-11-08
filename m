Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740DE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 08:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cyAqGhX8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cdhHIcBU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hYQT1iQSwsWlveP/FynCeMcR1777Wf6i9C77SMccBzs=; b=cyAqGhX8AeP7tPAZsK3c2jBLDT
	9Pv/iZgRMEmsQBugoNGxU6O3engfw0hYq51xFkrhOexeNZ0/F8cUkvRO9kbk1zFA32Jjr7bzgNARK
	zlZaFQ7dAiqgVhayTvOoTkLiojXuZyr3l6BS85Ul5nRzJQ+jd4L07RV51i/5WvZ0gRPPbspWxQy0R
	iZs6B9yi9XsFfyjpauASEVtuGJHvAdKu6oEYyMrNDc3/IUx5C23/nwMxhjB7Juc2QClJ7H0QGP2Yo
	qcuOEitlCiygZrJGawrWVvg5bWPSsxBahZqoiZUW6Jvok8u6kMDuiEgfehjj07Di0MQnmgnuY/YKc
	VKBOu9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyZJ-0000000FruN-25X5;
	Sun, 08 Nov 2026 08:48:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyZI-0000000FruF-0kkW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 08:48:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 8A1386146B;
	Sun,  8 Nov 2026 08:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 954681F0089F;
	Sun,  8 Nov 2026 08:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794127683;
	bh=hYQT1iQSwsWlveP/FynCeMcR1777Wf6i9C77SMccBzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cdhHIcBUGL1DwEzHNq9EeqVORPfy/7Lwlnhw2LDIqiQUv8o3U8IyJtPXB0+duiRwy
	 xSucdJ2mmZKm0uHL9ddexlHHiUSqzcJXww/f0q3UD5n92prMlCooafMZY34x3gWk/a
	 sTXFr/6pFSgJv7TLwMJXKzfh8jvGq+cESUX6bIMHlpGbhcsDmQmRSe9vDQXHXcCkPh
	 5Cg26OuGBG5vlsOpNqPbqHS2758xD5bRXxG7HnOX4qwQdzEWsfqYi/9BQFN/v9gwbQ
	 8at/mRxwdOZkbBLVwYpJCYBjpIZT5dpBwTY2YTpDzuO2zLPO6513gDlIsEI/Vm4KHW
	 nPGYipMLqIu0g==
Date: Sun, 8 Nov 2026 09:48:00 +0100
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
Message-ID: <avA2hReZKJL8KFUB@monoceros>
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
 <20261106-apple-m5-initial-devicetrees-v3-5-cee55de54b2f@cyberchaos.dev>
 <avA1rkMvbmTiJDPC@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4zgarb7k2vkd62n2"
Content-Disposition: inline
In-Reply-To: <avA1rkMvbmTiJDPC@monoceros>
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


--4zgarb7k2vkd62n2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 5/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8142
 compatible
MIME-Version: 1.0

Hello,

On Sun, Nov 08, 2026 at 09:43:37AM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Nov 06, 2026 at 10:24:54PM +0100, Yureka Lilian wrote:
> > The PWM controller on the Apple silicon t8142 (M5) SoC is compatible
> > with t8103. Add "apple,t8142-fpwm" as SoC specific compatible under
> > "apple,s5l-fpwm".
> >=20
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>=20
> Fine for me to let this go through apple-soc.
>=20
> Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
>=20
> (I already wrote this in reply to v2 on the same day v3 was sent. So
> just forwarding the tag for v3.)

Oh, however I already acked the (implicit) v1 on Oct 27[1], please make
sure to pick up tags when sending out a new revision (or mention why you
didn't) to save maintainer time.

Thanks
Uwe

[1] https://lore.kernel.org/all/auBgZhx0qcbAgHnF@monoceros/

--4zgarb7k2vkd62n2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrwNz0ACgkQj4D7WH0S
/k5bbAf/VUi/eOyCBOz+RaTap74L+qL1XDuN4e956ywIcsS1NBkWSQaBWwNlV6H+
pjPo6dozWYBNJXR2FW4AutssKdTHbXaYzs1gNQ1yuLb+n41RWcuTlAmRmtLShWZs
Y9I/+os8WcXECFf5TGTVYX7UJUXlKazj9cFnpz0d8rqbszXWFo7vW5NUxmi4b+Cl
5nXgFGTJ+FZN+FzlfT96Dk9TaGSGCb4BjayHMZakKeC2VdWTi/EgtB9pMDOJ91k7
yOmmyv+p0ESkl0XEoTncCa3V78XpYZGz6IYS74flWYs9epw9l5qEvU8fEEFbKUIo
yaZSkXCtDUT1o93z4tLmyPXWu4H6Rw==
=LzhV
-----END PGP SIGNATURE-----

--4zgarb7k2vkd62n2--

