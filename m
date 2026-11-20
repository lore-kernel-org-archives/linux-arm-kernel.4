Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E60260A261A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q+goc8OS;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=M2IAcv3I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G7/+dGXKwxvm7pBwkPBiroDwyoNH1aExmeBxownU6dw=; b=q+goc8OSzKIgTk6fMlJLeu1g2B
	/MI/QjsWfoIwsbipGblkiPSBoFdrOxBKlAoKPqvRKrs0HG9gDwYHGtwUXnhDBL17a4OHVBpnOvNC/
	Z2rf1NwflIP+nuCOTw/kaGHCz9/0mke/b0foXU3FR38YKmif+dXr83O08JcKexhNDmuvGvUTR7J0Z
	dhfh9RWPXYVyNrI1d3snZwTLE9jvTZLgrayalctuu7+W3v6psJr2fCRPavHJWjEUcPCarEZu/bZsO
	XolKidw3Y5z20Et07QTS3fdhYWo6nJL84WwxWRGSUYkOBbkNT7bNGLJbdE9eyq6gh4PrUfbRx9Luq
	wJBhqEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKB7-0000000EMGq-3hLj;
	Fri, 20 Nov 2026 08:41:05 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKAn-0000000EMCn-2nw1;
	Fri, 20 Nov 2026 08:41:03 +0000
Received: from pengutronix.de (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: mkl@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 51464200EDB;
	Fri, 20 Nov 2026 09:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795164043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G7/+dGXKwxvm7pBwkPBiroDwyoNH1aExmeBxownU6dw=;
	b=M2IAcv3IpuDfrtikPy85aXva05WT/WH2l4cmpvqo773VNtLObicj2+no9WFrOOqRFTu9Hu
	ne/uqyFj0oYO7GH3wgpz7ekNcWa6p5aZR1s27/CxhYrOTITEcNnIFV5PEEY96xPaVTfzEo
	n/XkHJqw86s6wO3M7MVtaMDaQAOwOlu/W+F5NqXG29WR/2+eWNFlBzUBSrJzYXptMpLOIY
	H9FVeASwGsGWfOXJtSM89ZSePf+9BRKGvA59So4sCHXR+z/Rf6LfYHfRXofRGEWnh+LcA7
	/0G2Y52rXpGi7lpMxNDLhgXGzMcPzqJXkUV9uv1oZH0S1XyZODiRLRKaUJTE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795164043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G7/+dGXKwxvm7pBwkPBiroDwyoNH1aExmeBxownU6dw=;
	b=BbAeXrs/KuMdUGU1d4FDIY08+wqouL0AbfAPie3JfzGkD9lpRY6epTg98KYpbce3N4dzRf
	+BV3Lk32Mu/JDEZsu2Tqo0C+4d0Tu1EqHyK34ml8Sx04N29Hy6ej/CtB+7ydUDyZI9t1po
	RfqTG7GgfMLXTbljqTtZqvcSITM0DENXZV79zPYh4ommnXro0CRKFNN8U266XmhPKidYzH
	y0DhyWm6dD55a/OQvQwDQzw+2+LGZ4nkQAastY6Pm3f7cJOr70EMWAAyfpPSrRTKFO97dt
	9bfjVVu4ErU8WN2TRDZ21UjjspBh89T2np3BpckTtZnypeqz4oMVArw3oJusHQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795164043; a=rsa-sha256;
	cv=none;
	b=K6jKO5GhZrnSpLLluIb2ZGgb1vR5o050DKauUlziUFm7+q+HsL84pOstb564awBMmx8q9J
	4s329jeeTGlifXizLE5MaTcdjOhg2GuqdJ5INm0EJbXzML3JSuDtOf3Kwrc5Bo5lH281eL
	TW7tfr3ITkxeMBj6KIKOzwOdGDJiY4r7A+PTbANlaM+yYnl8b7zXS3M/I0FFl+kgVDy562
	iFPXJQVacKOnkIIb8RtHzkzYddM/NFGSqqSjf7d06nuSZ80Hptu5eRM+J7D1bwTS0XQv/e
	WGcqmxy52bnlX25Rokh2UQesEGD9bOY2yx7GAzZ+lKTK0nz6ZYX9GKBpUfukVQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=mkl@pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Date: Fri, 20 Nov 2026 09:40:43 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: zelong dong <zelong.dong@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Vincent Mailhol <mailhol@kernel.org>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-can@vger.kernel.org
Subject: Re: [PATCH 0/3] can: amlogic: add support for Amlogic A9 CAN-FD
 controller
Message-ID: <20261120-axiomatic-foamy-bull-1684b6-mkl@pengutronix.de>
References: <20261120080820.3340646-1-zelong.dong@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ykqib6zwogi4cpur"
Content-Disposition: inline
In-Reply-To: <20261120080820.3340646-1-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004051_888178_D828EE53 
X-CRM114-Status: GOOD (  11.65  )
X-Spam-Score: -2.1 (--)
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


--ykqib6zwogi4cpur
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] can: amlogic: add support for Amlogic A9 CAN-FD
 controller
MIME-Version: 1.0

On 20.11.2026 16:08:17, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
>
> This series adds support for the CAN-FD controller found on the
> Amlogic A9 SoC family.
>
> The controller supports classic CAN and CAN-FD. The
> driver uses the generic RX offload infrastructure with hardware
> timestamps, reports bus errors through the CAN berr counter, and
> implements suspend/resume support.

Please base your driver on current net-next/main.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ykqib6zwogi4cpur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCawAHiAAKCRDMOmT6rpmt
0hXwAP4zJqk4wGxBgVH4cMhr3pYMTQuYMY2xDeJZLBZfXu1yAAD9GPkpGaY5WQTS
IB5FYNdxEh/e3sY5WcLMgvSFudZ62gE=
=yGhO
-----END PGP SIGNATURE-----

--ykqib6zwogi4cpur--

