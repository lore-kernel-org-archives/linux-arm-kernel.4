Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD4606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 01:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UdLP4W0u;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jY1GzaeP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=svpEi0HS4YJE5nsDpTP/KMKZMCJ2JXKCnWaboHf80CY=; b=UdLP4W0uE9fBPS
	gBrljIlwEa9+EAvjDTnJLf7ZINrsq+LdNgP6lyHl7PbSMLktKjuz4mxQdNQtkkaFSFIE7JXq3o+/V
	4VMMkShwseoXMAtEbEnfk0lR8Xmzlxe+9d/luvDPsFy4Xrm1r4NesSGgk7/ZQRGTlKTrGeunHY8UB
	DO6Ft9PyIq7PYT5pYWhe1b2uQbus4fPx0MzFIxJtDlqCNFQMxbqazlU5vPBoEEtrVtZqciWdAXs8K
	8VgoDAN/Gn1zeaZ5HRwg9ZjXlTxa05qeILa1PlxWG1al9xoJZtmpmjNF8Q6G54dD1RJiqEyr6Qib4
	cKnRhUFup33Wvfts0LHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOkX-0000000GxG3-0WXR;
	Sun, 15 Nov 2026 01:09:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOkV-0000000GxFw-2xtN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 01:09:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26DEE43650;
	Sun, 15 Nov 2026 01:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F1A1F000C4;
	Sun, 15 Nov 2026 01:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794704979;
	bh=svpEi0HS4YJE5nsDpTP/KMKZMCJ2JXKCnWaboHf80CY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jY1GzaePZizjRqOefyBJ4GMGCqY+2fpjShHHPX0sIyevABUK30EnshdqUzrfapr8q
	 wVTaJkwOmPy64OpeuZ3Rh/RZxfJ4D2ONn4I9ZV/bZH21r8ke9wkYNiMOSjga8LDS8X
	 sq3T/3kNQ4RblY/Z2d3Pav7Krc9kKg3SqihdeqeF545UJkFsOjwDT78MpAj6Y0iJn1
	 MKdaXbN8dEOp/b0CsnD1N8IajZRafzBLIQDLq27CVGa38HTHAM8MNYrbx8VF8AakTd
	 zboUasZ78TtdUgQ9CldzfwtFPRGG+F60gm0YMCR81gp35WFlAFfK2ENr3NVgHe/nce
	 ulQqa95ahGgNg==
Date: Sun, 15 Nov 2026 01:09:31 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Giorgi Tchankvetadze
 <giorgitchankvetadze1997@gmail.com>, Michal Piekos
 <michal.piekos@mmpsystems.pl>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland
 <samuel@sholland.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, Markus Elfring <Markus.Elfring@web.de>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Felix
 Gu <ustc.gu@gmail.com>
Subject: Re: [PATCH] iio: adc: sun20i-gpadc: Use
 devm_reset_control_get_exclusive_deasserted() in sun20i_gpadc_probe()
Message-ID: <20261115010931.6c3fc69f@jic23-hlaptop>
In-Reply-To: <lGotwwBTRaeZcOCAphaQBQ@gmail.com>
References: <368d548f-2b86-4da5-857a-6ee9473a8d0e@web.de>
	<lGotwwBTRaeZcOCAphaQBQ@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 14 Nov 2026 18:19:12 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

> Dne sobota, 14. november 2026 ob 18:08:10 Srednjeevropski standardni =C4=
=8Das je Markus Elfring napisal(a):
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sat, 14 Nov 2026 17:55:16 +0100
> >=20
> > Use devm_reset_control_get_exclusive_deasserted() to replace the
> > explicit reset acquisition, deassertion, and cleanup action registered
> > with devm_add_action_or_reset().
> > Simplify reset handling and remove the custom reset assertion callback
> > while preserving reset assertion during cleanup.
> >=20
> > The source code was transformed by using the Coccinelle software.
> >=20
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net> =20
>=20
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
Like for like swap as far as I can tell, so applied to the testing
branch of iio.git

Thanks,

Jonathan

> Best regards,
> Jernej
>=20
> > ---
> >  drivers/iio/adc/sun20i-gpadc-iio.c | 20 +++-----------------
> >  1 file changed, 3 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20=
i-gpadc-iio.c
> > index baa7661db13b..070d061572c6 100644
> > --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> > +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
> > @@ -157,13 +157,6 @@ static const struct iio_info sun20i_gpadc_iio_info=
 =3D {
> >  	.fwnode_xlate =3D sun20i_gpadc_fwnode_xlate,
> >  };
> > =20
> > -static void sun20i_gpadc_reset_assert(void *data)
> > -{
> > -	struct reset_control *rst =3D data;
> > -
> > -	reset_control_assert(rst);
> > -}
> > -
> >  static const struct iio_chan_spec sun20i_gpadc_chan_template =3D {
> >  	.type =3D IIO_VOLTAGE,
> >  	.indexed =3D 1,
> > @@ -225,17 +218,10 @@ static int sun20i_gpadc_probe(struct platform_dev=
ice *pdev)
> >  	if (ret =3D=3D 0)
> >  		return dev_err_probe(dev, -ENODEV, "needs at least one clocks\n");
> > =20
> > -	rst =3D devm_reset_control_get_exclusive(dev, NULL);
> > +	rst =3D devm_reset_control_get_exclusive_deasserted(dev, NULL);
> >  	if (IS_ERR(rst))
> > -		return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control=
\n");
> > -
> > -	ret =3D reset_control_deassert(rst);
> > -	if (ret)
> > -		return dev_err_probe(dev, ret, "failed to deassert reset\n");
> > -
> > -	ret =3D devm_add_action_or_reset(dev, sun20i_gpadc_reset_assert, rst);
> > -	if (ret)
> > -		return ret;
> > +		return dev_err_probe(dev, PTR_ERR(rst),
> > +				     "failed to get and deassert reset\n");
> > =20
> >  	irq =3D platform_get_irq(pdev, 0);
> >  	if (irq < 0)
> >  =20
>=20
>=20
>=20
>=20


