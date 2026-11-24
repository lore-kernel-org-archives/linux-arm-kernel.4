Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF20606A68C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C3Rx5AOn;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=scvfmLHs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=10XH4ej2oXPoMU/XuFtT77K3dT70WQ+UCraqr7WioX0=; b=C3Rx5AOn09YjKeMc1cosFydHSy
	ZuLyjJ7+QCfX3EN6ZcYHnfGqEP9VXJ4a37Lxh2+UMFEDcUBuJwOZ+PErOpXS2OuKqhCegDGiXI1l5
	tt08ZTUUjM9JzV0A1pw+Ym+fMLmesvuQpSv4RnbWbWzbO7aCtiwiF80U/dc4Xa8Sk4CRsRNYn88PV
	gkSTSXSbkLaajIY212CseZLq+RvwMRb7bm2Mpol2G8Ot1uXtKBex73f0Hpb6iRB7q24VaxrvRuGpv
	MCbCwJnV6B3KilsNk9VV+s8Ne2T3bjYkCgX6XSYMb5tzse0F2rXQlwjc9eDbdhfgCfWa1pn6zV1Y1
	eOPKfFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxOG-00000007kg9-1zhw;
	Tue, 24 Nov 2026 20:45:24 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxOE-00000007kfB-2kdt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:45:23 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-9213922de73so86015326d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795553121; x=1796157921; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=10XH4ej2oXPoMU/XuFtT77K3dT70WQ+UCraqr7WioX0=;
        b=scvfmLHseBjPIwvPrJJDeGjwkCIFmiDbBOUz/CRSPPqJKt7fVjO1HHJ2NDCDvFcHXD
         QLktuGvQBd1JA3H1bCOPi9n5nxDBOIA3unGUtZ7SNJNsETApjoQT/pHzZNcKy+IVKQf4
         DxLLHFElvrB8oqfVjslCGa57QqZ9v0oETYjoWVbZBXupdkphVxx7iTBYCs6OU/Aw5c+o
         OEJiclPaew9j/tRpJC6zYZZo6qmzKY+pc4jJ5hnAofxm+tOmTz96PMsztBhFTYzgd7F8
         /8VrRo5Wj+yx99BnqpobkabNf72RnUOiMSM9ktsmJxQDNCwC2aCzQyYEd16Bu0jKpQiL
         Ijdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553121; x=1796157921;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10XH4ej2oXPoMU/XuFtT77K3dT70WQ+UCraqr7WioX0=;
        b=kmsBkkjK3Gh302AJUsfa3eqDJ+7Tf2HggW2FZlE9TBEqcotzl2QY2b0h/KE+44Ta9G
         Z2t1e/gnHCAyUnFDvrgOW0gMCYYseREDsnf1cnFX1vP0IXy4DbGE4nz+VEg6seWtLrl1
         /5czx4I+Uveot7KP0wWAdCUx2faQEPyDE8HVQlPTcUH1MXDHWx487VTOgfFAwjjni61R
         2xzHL/LyBWikv7ES9nCRD5F7w1NqPJ4M/wS/ZEFAdywHrsf3nenkiI2tiarpyQ4MJDFm
         JRWGXsxsV1vzq75d4cJkuF8JcUKQuk4pGiatJ7BL9//uWx+0ZOWXsBQYukERfmbZxb6s
         Xzag==
X-Forwarded-Encrypted: i=1; AL+hErEoLaEwqBOpbKt6l9clx+rdLdtj9pex8RifAVy+6dv2dRGEfyjG1pkMEbGh3777esKbf+CN/I7t0bwAxOs4LcAZ@lists.infradead.org
X-Gm-Message-State: APuU4Z85qIsCaFelpUHznqHbXMYKfx7d7nem6zRdKWvaHW3J+h4Df2SP
	4HdLEsRUi3bTeMqqrOvCO8BYrLQPR7xqyVqraqJ/o30aK/cF/q8SzB8lFP0QSZrg1YA=
X-Gm-Gg: AZFdTZc/DqbXwktviJclWuw+1ggdGvmnNztKVrPTuEa0PFSG/FQLWNhiGIYaOx9PzMF
	4cggxYWnaqeogKsF5zOePOSzzB4PsABVKHsSHfn95U7ij/oICC3w5vhr3AJVhsvNcXxz1Wzv0SJ
	GqzvV2PNC4EIEpxNerPNjuRjHs/+0yz5AL/oi08bbIQ0GoYZ8ysOgtUObY45o4uhmDctvfBso7O
	vjWsZOeVl7zvY52U2fDAkMro3ho2k1HJYNHLZ6fdmFPlECQENkEQdMDuJ3kO8dZeVIlCd/xzloI
	Cc8qjHVL/r64BTtl79IpUihCAySLK87xu/jOOR62XqDGIsy+ffKUNBfHnhrSId+hLvIpZy8THae
	3y/Tc0QSj2bOWg6F292PhfRENljWPYIap2xuj0+h0S3Klh6dls3DvJfRueE0ahByv0lnVbqI18I
	p1t5pnwSxU71HDWCr00CkTYJAm5rKQUfXryLjGu2lQ3uBL/cpC/zyBAvaUOQYg1/Qb3o68IoTur
	j9ihbDz5YkIZqcaeYaMYrCh9pEP+JipIAMfMvMSJr6nXZMV2Viuk33Pl6ytH28s20+lwu3eO6i5
	yCPHZpIK8phql2CPvs7PPZ6SdE1ZQS4VB3HgpyNZzTCbWqWwMBqU9uU=
X-Received: by 2002:a05:6214:5243:b0:920:fd83:6976 with SMTP id 6a1803df08f44-92134b3f391mr282710326d6.50.1795553121021;
        Tue, 24 Nov 2026 12:45:21 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a08552sm142793896d6.34.2026.11.24.12.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:45:20 -0800 (PST)
Message-ID: <fb95b4f8fa3db34a407177d1efcd100acfd0e918.camel@ndufresne.ca>
Subject: Re: [PATCH v2 02/17] media: rockchip: rga: add comment about pixel
 alignment for YUV formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, Guangshuo Li
 <lgs201920130244@gmail.com>
Date: Tue, 24 Nov 2026 15:45:18 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-2-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-2-23aa2cb74e61@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-lDiiVpW7LbsI8l96Z/jE"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_124522_766053_975726F9 
X-CRM114-Status: GOOD (  17.74  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-lDiiVpW7LbsI8l96Z/jE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Add a comment to clarify the use of fixed step_height values for all YUV
> formats. While the commit introducing the change already explains the
> reasoning, add an explicit comment to improve the visibility of the
> reasoning.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index bd0afd33affe4..efe5541078214 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -414,6 +414,16 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv, struct v4l2_format *f)
>  =09=09.step_height =3D 1,
>  =09};
> =20
> +=09/*
> +=09 * Technically 4:2:2 YUV formats don't need a step_height of 2.
> +=09 * But for the RGA3 this is explicitly documented in  section 5.6.3
> +=09 * of the RK3588 TRM Part 2.
> +=09 * And the RGA2 vendor driver also checks that the height (and width)
> +=09 * is aligned to 2 when a YUV format is used.
> +=09 *
> +=09 * Therefore be safe and always align width and height to 2
> +=09 * when a YUV format is used.
> +=09 */
>  =09if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
>  =09=09frmsize.step_width =3D 2;
>  =09=09frmsize.step_height =3D 2;

--=-lDiiVpW7LbsI8l96Z/jE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX3XgAKCRDZQZRRKWBy
9NOrAQDQ51rGU5HqaJy8yr4bx5UgQdoV3U9t6CfAeYignkSaIgEA0Z9ghLQ8ceGI
03oKRHcli00mhOeK2j41ZGSrl5we1AE=
=ZWqR
-----END PGP SIGNATURE-----

--=-lDiiVpW7LbsI8l96Z/jE--

