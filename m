Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E9606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CMflSort;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=FsoK6+iJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gSivPvFJiN/o9sHnCOQ/xSnfVG2VPNxyEl3XoLFpb1g=; b=CMflSorte37N9lu9tkKkLDUOIO
	EL9SzO7bZMuFKfrvzzhIxNNhoP4sPmwbFPu8vVxw8n+Af/nZUra9xuiEkG8u4ljUcbLDCeNdt2hDK
	CuNJHQ54yr9kqvt05nhQwZEpIE0NBlomVs/4RTOp54jsw52n0vE9d1D0sJMvmT62QOwSZ2D/he6U0
	NeS+Ra0FH2SfHi/m6MTnZHqidovg1ECFaQNR4Gmvbm2VAGFFX26xkPVxJaZjoM2OeeH6z3iWo6HMj
	gwLyy0I02cjSaYTeIgMixsgVhrFT2lfIrktazYgnIxtah4ZZJaKtG5UiNLwtIXyyejtKTL8JsnnFO
	6p7V7YKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsbu-00000001hqt-317G;
	Mon, 16 Nov 2026 09:02:46 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsbq-00000001hp7-3RQr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:02:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 8357E200370;
	Mon, 16 Nov 2026 10:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794819756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gSivPvFJiN/o9sHnCOQ/xSnfVG2VPNxyEl3XoLFpb1g=;
	b=FsoK6+iJFwg4mS4xkKhjPs+JANZNPeRCfuU87pVQUYb2foEGASy5BN5IDA8lZEww20+/O5
	LberRih+cg0C8xWWhDRag1b1wf2gAaX8NqTb8EzAPAkvkwQ3UrgzcLlTHIKpmkhI6QaHP8
	4E2ILzm7lR7tfg60ZdIJGPYNqWoNhI0NhGkvFqKfzbNThoVk+xKEin08K6rtlaq2gxeSL9
	4iDeINjkCK/TQjtcsgNYNMyOw/0HHej44CQj04yyMuFj0Yavy2uRfX/LqlD7N036vwJA8a
	UKVCqYslY6eKmd/i2cJzHow1ygHZ9Zyut8PZCovfomEVzxvaP94Vj4i2zq14Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794819756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gSivPvFJiN/o9sHnCOQ/xSnfVG2VPNxyEl3XoLFpb1g=;
	b=ANd7Gi8YqF5qfcD6o679YCWZT2+GGVuY9454qjkbdaIX862cDFaQ0xtXea4aXoPkfl2xzY
	Qu4aj0FvdK0jWtxXo34o321VUxKQA9pes5AJxF51bkMlVQj+36S3ZXYLC6Xbdzg8MCIY9l
	Y+h9PmqxOMwaLFY0Lt/OZ573Rxha9Cy+w4zflG7o70beZJAlBPoFX7f9NqePQxMlOowI1e
	reM9rE5O8CfrADAiVRfV+VYakSG6geJWPkg2UMU8jVuQNqjc5+pm2KKQTNKBGVYi5fVJVf
	1FcQYwIBZv6rgQtJBRCNllxwpTI3iISA8B8PfqfLFTN8upxmjMYOGn8hP86SKQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794819756; a=rsa-sha256;
	cv=none;
	b=Ufuv12KJvt034y4FAmhnuQrKBnJ8N66LXUPdmYv58ubeW3Ym/2hEm8xLDuIZ5zAhlMRP1l
	XCiRKgCa+vspvudn6HR7gpzbAt8uFHlEE+wiHCeZ3mJvdLQ6YxKp+dkHxSz7stk4PoTy7U
	d30M9Tv4OxeFSVxkoPg2GAY8ETqtZi85aMi6iNt5uRf4huLXbizmkeNMATTT8Foc+w86Zs
	tw0g0ZJ/+WiHHz6mqALdo60mmG0I7+daBLYILFpQ13+uniWqp6GhzxJlVAowGypjORyuUY
	dobZ2rgnqcdLFqpSOrdqPJTpTN2dYUrgN1xd5P4OQIdEkg8nqNCOosnpbgcX2Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xSsbj-0000Ii-2t;
	Mon, 16 Nov 2026 10:02:36 +0100
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 2B7025ED070;
	Mon, 16 Nov 2026 08:54:59 +0000 (UTC)
Date: Mon, 16 Nov 2026 09:54:58 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: RE: [PATCH can 4/4] can: rcar_canfd: rcar_canfd_probe(): reject
 devices without match data
Message-ID: <20261116-cream-hornet-from-lemuria-703c6b-mkl@pengutronix.de>
References: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
 <20261114-fix-device_get_match_data-v1-4-2d82025e9646@pengutronix.de>
 <TYYPR01MB660340F5E219C29045BF61F9867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cr5iuyzxl6tekon4"
Content-Disposition: inline
In-Reply-To: <TYYPR01MB660340F5E219C29045BF61F9867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_010243_434205_71906EDD 
X-CRM114-Status: GOOD (  23.36  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--cr5iuyzxl6tekon4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: RE: [PATCH can 4/4] can: rcar_canfd: rcar_canfd_probe(): reject
 devices without match data
MIME-Version: 1.0

On 16.11.2026 08:39:36, Biju Das wrote:
> Hi Marc,
>
> > -----Original Message-----
> > From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> O=
n Behalf Of Marc Kleine-Budde
> > Sent: 14 November 2026 12:56
> > Subject: [PATCH can 4/4] can: rcar_canfd: rcar_canfd_probe(): reject de=
vices without match data
> >
> > A device bound through driver_override need not match an entry in of_ma=
tch_table. In that case
> > device_get_match_data() returns NULL, but
> > rcar_canfd_probe() dereferences the result.
> >
> > Reject devices without match data before continuing probe.
> >
> > Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > ---
> >  drivers/net/can/rcar/rcar_canfd.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/r=
car_canfd.c
> > index 000a6433f46d..9d463a9c1766 100644
> > --- a/drivers/net/can/rcar/rcar_canfd.c
> > +++ b/drivers/net/can/rcar/rcar_canfd.c
> > @@ -2113,6 +2113,8 @@ static int rcar_canfd_probe(struct platform_devic=
e *pdev)
> >  	int i;
> >
> >  	info =3D of_device_get_match_data(dev);
> > +	if (!info)
> > +		return -ENODEV;
>
>
> There is a patch on the fly to disable driver_override by default [1].
> In that case if we plan to use driver_override, probe will return failure.
> I may be wrong. Please correct me if Iam wrong
>
> [1] https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a308.=
1790612298.git.u.kleine-koenig@baylibre.com/

Thanks, I wasn't aware of this series. I tested the driver_override on
the flexcan driver with latest net/main, fixed it, and applied the fix
to all affected CAN drivers.

Should I drop the driver_override related null pointer checks from this
series?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--cr5iuyzxl6tekon4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCavrE4AAKCRDMOmT6rpmt
0qa7AP9N2WlxewGrUbH+Kiiv8Q4GOrtgxpFu7tkpLBsyZsuKcQEAoN9crIRmBX03
Gt9CkTyuqbyZzD3GTXYfNRjIC+54JAE=
=oW/X
-----END PGP SIGNATURE-----

--cr5iuyzxl6tekon4--

