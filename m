Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B1606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rdzVHn+c;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=SaKXyigX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/A9iXEzh1KrlGjHq69ztxhpUohMJtnHndx2KFxZGzmk=; b=rdzVHn+cc2iMpH5joSYuZXW/qm
	fx7Qluxi6Vvhoae9iSXI9GR6zQAlii4TRWTiByQQIzr9OspfNi7S1/5XB++n2YGRHog8CHmoB2bqg
	1lbQjPwTAtVabrx4IlGuZpDgwVDgbMqoz6JG268IIS1Gzx748SCSZ2AeHAiTU98jSyS2sZHvMNcLc
	rfuRL3pQRIZCyS2ig7OLkrOCE+3qiii/a4+pt/97qWmJB8cMaOvpsgulRmBB9bmKYsRQocoynYYcW
	jQ5+5Re5hnO1el58M7BiKiZUNkEUKmIz54SQGt1MgWdi2Mi91ovMSHnIjYcdrDWseBi+jXikGrAyW
	2VO0GSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt4b-00000001miF-1pdb;
	Mon, 16 Nov 2026 09:32:25 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt4X-00000001mgN-3uMX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:32:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6EEFA200AD7;
	Mon, 16 Nov 2026 10:32:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794821539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/A9iXEzh1KrlGjHq69ztxhpUohMJtnHndx2KFxZGzmk=;
	b=SaKXyigX4Elz3APu1eMYJ69NX/Jh88BoBbRLNBK0d6D+Lm/38yBwxComQPZjPuFZJRiwM5
	LV0bTuc4uTQVFrF+22PFV9rNmjxi4tOQuxi4a8RvG0nMAYJpKKrCzxNgJgIwCVrZPDyOPI
	hooO8GCqS35hgFaNLxakrU8qT12rFpr61KM2rX4OTc+biyGULFqV73c2OnJjzFoKcjjr3W
	fiGrkwFSwCMp0YQZ/WLR/5BTmPCDgxeO0lkSkxGcCC5XX7o3NcV2gl18MDzX9N+KtcZRsX
	klWUEXEYqFCJ34f7OAmTlvc852dJ8y6YB5RtWCuJf0qYWPQoWPgLU13xWrS7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794821539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/A9iXEzh1KrlGjHq69ztxhpUohMJtnHndx2KFxZGzmk=;
	b=GEtsMd+hgpZn51jpIuDF6/iW4sZOkPvKDit0q42ByG9hzZgl6oD3sh4lWuqDIAfqiXsgCj
	hv25cRbyiNlCBwozkmZHQPVKz7bMpofIhZt8HsKNexrVJbHwRApPfrKf/mbS3gKcfmJqWs
	O4mQatcm8081Z6wdE3EA9xPZ8m+WFXQe0hdG9pM1hQTYnF30gQ4usQyDls2WhoxHYMwsPg
	9vnfe+x4xbJOEEU7RZlR2OJhWjpt1zhVT8vA/q5GMgQ5PNcto5xBFL2XYBOdxeuzTBpuQK
	GVRedmHaaAwxGo4QAYrOV0Mc0K7iGZ4tzoZdbqHmVrUlz8iSkEfhqA+zVo1qTA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794821539; a=rsa-sha256;
	cv=none;
	b=RkG3OsqUV2Y4R2Fv2X0NhUyHHKWMG+auojCSYrqpGH9Q/tr36sx5AOTHDMWw4JG4NDZ8Fk
	XWr+LFZ6ld8ljL9eT9JU2Il5evdIEL1JgwMb6UmM5neRQX/+IJEafTUBCALKGzG8rNQu8+
	1zQYFjNJLoRutwF0NUOC0LVaOJuTJxDDEmaMWBEPKd2Ewb/bc+/mfPdapkPvIN37K/J5bC
	zfGZgkaIwYnRsL89uiRcU9PNgujj0PuVzQvB+eR6ZTQygM++I71yJKBgxr5PpkV84DO0Tl
	5P3Pjx8SJzSw7nLm/makmP5rbAUyqp9iIx8NmxETyJHbkTRUW8bqfH703mlfAw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xSt4U-0001A3-2f;
	Mon, 16 Nov 2026 10:32:19 +0100
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id C670B5ED186;
	Mon, 16 Nov 2026 09:32:18 +0000 (UTC)
Date: Mon, 16 Nov 2026 10:32:18 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, kernel@pengutronix.de, 
	linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH can 2/4] can: flexcan: flexcan_probe(): fix probing for
 m68k/coldfire and reject devices without match data
Message-ID: <20261116-ambitious-exotic-wallaby-4a5d17-mkl@pengutronix.de>
References: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
 <20261114-fix-device_get_match_data-v1-2-2d82025e9646@pengutronix.de>
 <avrHkaYw-De6nv8B@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vrsrmjo33qfyvu5v"
Content-Disposition: inline
In-Reply-To: <avrHkaYw-De6nv8B@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_013222_162456_AC94C3DE 
X-CRM114-Status: GOOD (  18.85  )
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


--vrsrmjo33qfyvu5v
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH can 2/4] can: flexcan: flexcan_probe(): fix probing for
 m68k/coldfire and reject devices without match data
MIME-Version: 1.0

On 16.11.2026 10:14:17, Uwe Kleine-K=C3=B6nig wrote:
> >  	devtype_data =3D device_get_match_data(&pdev->dev);
> > +	if (!devtype_data && platform_get_device_id(pdev))
> > +		devtype_data =3D (struct flexcan_devtype_data *)
> > +			platform_get_device_id(pdev)->driver_data;
> > +	if (!devtype_data)
> > +		return -ENODEV;
>
> My stance is that the ability to bind an "unexpected" device via
> driver_override is something that should be handled in the core, see
> https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a308.1790=
612298.git.u.kleine-koenig@baylibre.com/
> for the latest patch to address this.

Thanks, Biju Das already pointed out that series.

> I'll work on this patch to hopefully get it into v7.5-rc1.

Thanks!

> IMHO it's ok to not fix this in a driver specific way now. (And then
> my patch referenced above in the first Closes:-trailer is IMHO better
> than this patch.)

I'll drop the other patches, that only fix the driver_override case.

regards,
Marc
--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--vrsrmjo33qfyvu5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCavrNoAAKCRDMOmT6rpmt
0oYyAP9oXz4iGiEC2hRmzlmzTiNYzUkuVBT1zX4VmOJb4kIyHwD/TZc5Qi2ArljJ
TWip6DpC+Q4TajYntMhOuBoC0QkBqw0=
=J8hC
-----END PGP SIGNATURE-----

--vrsrmjo33qfyvu5v--

