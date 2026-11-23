Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3E0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mb8tbw5P;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+HkAfqI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nY4HpnOeJm9f7N0343VcVoNAFZl7ji0e8FhQZkE72C0=; b=Mb8tbw5PVNz7YXlSfurxlhf+n3
	NrgvDruGHwa3Qszd3Vf0Ixyu/sXYEcd9ny3+ZRsb9MuemEjYpsOjQMdlGabVenSB9o4uLR+DV0LuG
	3hfH/utIelQxdj61bhCrf8SyQZvnz93k//Thx2IPMPkXl2qvTLSBGKlNeNZuQO3rncbfQJu3BApEy
	Ldf+3vbqzgfDsBHcy6gvYiqxYTy9xyKGHQrXJgmn6w//uqSslvjyYbdy0G758FFzMNO8s8fNWx4s6
	oOYcZqRPoj13pFbrcsmKagT4qbwNfA5tOGb5zWVK46keTnl9VieikMRpLz73CD6Xtvr2drgnJtlJv
	QePIImVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRh4-000000033QA-2RVe;
	Mon, 23 Nov 2026 10:54:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRh3-000000033Pe-1I6J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:54:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D690C414CC;
	Mon, 23 Nov 2026 10:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1486F1F000C0;
	Mon, 23 Nov 2026 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431280;
	bh=nY4HpnOeJm9f7N0343VcVoNAFZl7ji0e8FhQZkE72C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B+HkAfqILuHNPPN8/Sl4DKazlQO7HO2ZNkxWWMZUr1/I933pYdwWHnYZ1ddjD9poe
	 kxphZOYC3znSesOtg5ths/CryB1n8gOfPlycOJQ11ozp3eb17wIHr7gjUCjZ3GzUpm
	 1guq7mm2+UF6rhgtLycU3L2TyR1oBK+ry9usuO87hAL8i7224GdmE0RIDRv38tLfby
	 XUUxFjYM6lThRtb8zH7xbkj6QOJLgckEO9WGvPAu5zgbTsN77jKZbB7MXKTDFiOlXH
	 V9smxi7ie+ZhzmK0nfA+KkSco7ZXhvBBShI5Dw7wIMWLX2LaeZjup3Ncr0+CUJ0DNM
	 F4SWSEp3l7B4A==
Date: Mon, 23 Nov 2026 11:54:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
	David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marek Vasut <marex@denx.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/8] drm/mxsfb: Switch to
 drm_mode_config_create_initial_state()
Message-ID: <awQbNQISBuGdJfP-@houat>
References: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
 <20261122153032.2782768-5-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="kjnzkckcgnomfnc3"
Content-Disposition: inline
In-Reply-To: <20261122153032.2782768-5-dario.binacchi@amarulasolutions.com>
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


--kjnzkckcgnomfnc3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 4/8] drm/mxsfb: Switch to
 drm_mode_config_create_initial_state()
MIME-Version: 1.0

On Sun, Nov 22, 2026 at 04:30:04PM +0100, Dario Binacchi wrote:
> The hardware state is read out only when the initial state is created
> with drm_mode_config_create_initial_state().
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

That's 99da25e15ccb in drm-misc-next

Maxime

--kjnzkckcgnomfnc3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCawQbbQAKCRAnX84Zoj2+
dsIGAYDAC2sZr5f+s2srMCKxcdwRZcoVK48DzCukP1fGlntM+89p1ItwoAcudHdj
iMXpmq4BgIB/NpvzxiPRHFHw2OVMyVyWgzN9Tw7rgLoOkxbZoaIlAi6Cyz8BxX8h
EDlPGGTJ/A==
=SNhV
-----END PGP SIGNATURE-----

--kjnzkckcgnomfnc3--

