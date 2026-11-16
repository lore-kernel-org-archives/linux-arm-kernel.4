Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC49606D7A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2z1xffFH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGuOCjnJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/G0OBqYYq6xIWzjTU/6NWOOkjhYFeYVJ9RAPumwh/FM=; b=2z1xffFH80t1JUzFDEQV7o5KBq
	NlNFJhcKED2X3OvJH8FSaFq6KtthB1fFvPn3hYnIIlnC24Pcdu31x8tNSK8y0tH1/5bt1+5v9WXne
	buuJQhwKuAsyLCKA3pmOXNQXobRTV4AhMoxj+bryzS1+nCOqBWeIbpNS0xilzTMQt6KWb76A1TX18
	3gEx7YJ/Qod1RaZ27mrz8uE4L5K2YtaVvxNIZQonRdw7+8HpV8p5oXoVOM7HZTMM/DTwg9DqSAgTB
	SCA+iGHMBhvvQWk5EIcvlqQ4m0aVx6W/4h08bTrzRlR31bEjr8+gY6WFbDqkwwpMCzBsYbsAaj5bb
	x3nmMpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSupS-00000002Agh-3Sn9;
	Mon, 16 Nov 2026 11:24:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSupR-00000002AgY-1Wjx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:24:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id CFDD74244D;
	Mon, 16 Nov 2026 11:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2C7311F000C4;
	Mon, 16 Nov 2026 11:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794828292;
	bh=/G0OBqYYq6xIWzjTU/6NWOOkjhYFeYVJ9RAPumwh/FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VGuOCjnJRgL4l8T0yyJl+XIlzd2n9c4XWgneQU03EGq1tXs5HJFurQ7wV+9mTv0eA
	 sIoZHG8uG7Cis89p0AyQ+tyWD0JmQFW42EyFJN2L3pclB46cRqyDMtO32K5QV+uIZh
	 mdL/sRAdJWya3ZcTa9cPlilrSbGYxEbnkgmnYaKZ44abJMxpDpnyWNT0jzZCl1gY48
	 HE6ALwNmXjCTQHN1rKuP8rZ4M2dy2YIY9yNTlTLwsB39YozcnCyB3wyL6WvCg1WTJr
	 kRUC8idgaWRdWfS9RfoOQurQ/GLS549ATH8vRtQVkLCqdSM25wCH8sjmlkuiUYFJSj
	 Sc0PuCxZaziQg==
Date: Mon, 16 Nov 2026 12:24:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH can 4/4] can: rcar_canfd: rcar_canfd_probe(): reject
 devices without match data
Message-ID: <avrnzDmTgdpK9jQQ@monoceros>
References: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
 <20261114-fix-device_get_match_data-v1-4-2d82025e9646@pengutronix.de>
 <TYYPR01MB660340F5E219C29045BF61F9867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
 <20261116-cream-hornet-from-lemuria-703c6b-mkl@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i5ob7g33zo25fx6g"
Content-Disposition: inline
In-Reply-To: <20261116-cream-hornet-from-lemuria-703c6b-mkl@pengutronix.de>
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


--i5ob7g33zo25fx6g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH can 4/4] can: rcar_canfd: rcar_canfd_probe(): reject
 devices without match data
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 09:54:58AM +0100, Marc Kleine-Budde wrote:
> On 16.11.2026 08:39:36, Biju Das wrote:
> > Hi Marc,
> >
> > > -----Original Message-----
> > > From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>=
 On Behalf Of Marc Kleine-Budde
> > > Sent: 14 November 2026 12:56
> > > Subject: [PATCH can 4/4] can: rcar_canfd: rcar_canfd_probe(): reject =
devices without match data
> > >
> > > A device bound through driver_override need not match an entry in of_=
match_table. In that case
> > > device_get_match_data() returns NULL, but
> > > rcar_canfd_probe() dereferences the result.
> > >
> > > Reject devices without match data before continuing probe.
> > >
> > > Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > > ---
> > >  drivers/net/can/rcar/rcar_canfd.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar=
/rcar_canfd.c
> > > index 000a6433f46d..9d463a9c1766 100644
> > > --- a/drivers/net/can/rcar/rcar_canfd.c
> > > +++ b/drivers/net/can/rcar/rcar_canfd.c
> > > @@ -2113,6 +2113,8 @@ static int rcar_canfd_probe(struct platform_dev=
ice *pdev)
> > >  	int i;
> > >
> > >  	info =3D of_device_get_match_data(dev);
> > > +	if (!info)
> > > +		return -ENODEV;
> >
> >
> > There is a patch on the fly to disable driver_override by default [1].
> > In that case if we plan to use driver_override, probe will return failu=
re.
> > I may be wrong. Please correct me if Iam wrong
> >
> > [1] https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a30=
8.1790612298.git.u.kleine-koenig@baylibre.com/
>=20
> Thanks, I wasn't aware of this series. I tested the driver_override on
> the flexcan driver with latest net/main, fixed it, and applied the fix
> to all affected CAN drivers.
>=20
> Should I drop the driver_override related null pointer checks from this
> series?

IMHO yes.

I just sent out a new revision of the change, find it at
https://lore.kernel.org/all/20261116110853.3418077-2-u.kleine-koenig@baylib=
re.com/
as I failed to add you Cc.

Best regards
Uwe

--i5ob7g33zo25fx6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr65/8ACgkQj4D7WH0S
/k7QDggAiTmuQNmh8+yNOaWxYwM2xqEF7KXcta6Zhrr5tw9dbPFOi1591HFVqoXF
b+PrVbmxgaxpRIc2JJd+193U26DHWtmbSfZuJp16XUGreT3qZif3XIPXQItdHKX9
iEfgiclP6EXqPncKeNY98MlLkT44xrcXxKHOuINAw5pmHD43QZLVMoNul9vvxHzp
NjcRoO6YYv1alrkzDiCNghiXGFcIbB6NRSvcLg3pF8S+js6tyKC7yGPedHI22ul1
0jPhDkdWfYmpFS8Mp6O9JkWZOAq07GnaQrOb9PfuT6R8hrsdL6SWg3Tcrj059/mu
NIUb+nPT//FTZ9tIRjdXrU3JjDhlnA==
=9hPs
-----END PGP SIGNATURE-----

--i5ob7g33zo25fx6g--

