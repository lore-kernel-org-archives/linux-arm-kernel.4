Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22240606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BEC4Sjcc;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ntYxdNfw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zL9FW6qmJVERb9uBjlstt4dUn5W525DT8FCMzg4JX1I=; b=BEC4SjccMrzS2xt3HXag9ILTxl
	MssAjjtipcye/A+U67PJTpwyiFdhoLEe9csvHxX7wBav8PYE5TrYaulIyW3yhB3/tAxRGEpWxmm3p
	FrYIpelqbtsXgpX+up1p1kwLGwU4H8ra1/0EMbslxV3mIA9jTLlRi6xM10N7HyQXqPkvN//NcFm6U
	parerNUjqCw2RfX8NxEbeEnvsd2K6sBDzZ/Vo75Q7HA6/bvI3umydY5JbqweNu83t3vx7ly6iCnne
	DTLMUjrY2WBcRNCgYYE2tZH2J5MXT5IsPFVPBd2Cx8B9ItUfJrFHifSb4f8cE3kTWYFWGuMVvfTXe
	/jmgcmVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcUd-000000054rA-1nJt;
	Mon, 23 Nov 2026 22:26:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcUa-000000054pt-1Sra;
	Mon, 23 Nov 2026 22:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795472786;
	bh=jafCJiO5kEDoT7LeCzSexDLui/CmGZgBcYWpbAal89Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ntYxdNfwbYMnR4G45krGiMK/xALKPCbBjGzrhhLZGJQYQdwmRIX5bijv4Rj14dK7C
	 YoIU6u0/EddOz3/sPdJScestRmDdf7TqRSAspK9AodsFySnvLSrxw0AQjQ67/sHDhZ
	 +oC3+nJZlvNNbwEx7VZ3xLY7EUBEv6uvDz7H74nM2NP4NdK1o4bXh6Gz25gIHf0PXd
	 onMmipYGNV55v3SSLWC2IgIQoPJElx9DzDTmGBpAqe8DRMojWjUdrrXwFUhCqRjPcO
	 skrk3XF/3Mcke4Qw3KUSoOqJDSBxCqUPpw2lWsqCic43iwh2yRWnmIK7X6lavKcMmb
	 VAhExsYZuVxOw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 424EA17E05F2;
	Mon, 23 Nov 2026 23:26:24 +0100 (CET)
Message-ID: <adfcc7bb137c294d01395dff64bfb915d2f34a5e.camel@collabora.com>
Subject: Re: [PATCH v2 2/3] media: verisilicon: reject MPEG-1 controls
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Hans Verkuil <hverkuil@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Philipp Zabel	 <p.zabel@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski	 <paulk@sys-base.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland	 <samuel@sholland.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Christian Stefan
 =?ISO-8859-1?Q?K=F6v=E9r-Draxl?=	 <ckoever@outlook.de>
Date: Mon, 23 Nov 2026 17:26:23 -0500
In-Reply-To: <20261121-b4-cedrus-mpeg1-v2-2-95e4decf03fa@gmail.com>
References: <20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com>
	 <20261121-b4-cedrus-mpeg1-v2-2-95e4decf03fa@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fZd9Y1jimBb0WSf6xeuw"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_142633_060592_955B5A64 
X-CRM114-Status: GOOD (  15.14  )
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

--=-fZd9Y1jimBb0WSf6xeuw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 21 novembre 2026 =C3=A0 10:10 +0000, Arun Iyengar via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The driver decodes everything in MPEG-2 mode. Reject
> V4L2_MPEG2_SEQ_FLAG_MPEG1, the full pel flags and D-pictures, which it
> would otherwise decode as MPEG-2. Compile tested only.

That change flags the the API is not backward compatible. Please fix.

Nicolas

>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 26e5d5547466..c910a69e8e3c 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -264,6 +264,16 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>  =09=09if (sps->bit_depth_luma_minus8 !=3D 0 && sps->bit_depth_luma_minus=
8 !=3D 2)
>  =09=09=09/* Only 8-bit and 10-bit are supported */
>  =09=09=09return -EINVAL;
> +=09} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_MPEG2_SEQUENCE) {
> +=09=09if (ctrl->p_new.p_mpeg2_sequence->flags & V4L2_MPEG2_SEQ_FLAG_MPEG=
1)
> +=09=09=09return -EINVAL;
> +=09} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_MPEG2_PICTURE) {
> +=09=09const struct v4l2_ctrl_mpeg2_picture *pic =3D ctrl->p_new.p_mpeg2_=
picture;
> +
> +=09=09if (pic->picture_coding_type =3D=3D V4L2_MPEG2_PIC_CODING_TYPE_D |=
|
> +=09=09    pic->flags & (V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD |
> +=09=09=09=09  V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD))
> +=09=09=09return -EINVAL;
>  =09} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_VP9_FRAME) {
>  =09=09const struct v4l2_ctrl_vp9_frame *dec_params =3D ctrl->p_new.p_vp9=
_frame;
> =20
> @@ -435,11 +445,13 @@ static const struct hantro_ctrl controls[] =3D {
>  =09=09.codec =3D HANTRO_MPEG2_DECODER,
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_MPEG2_SEQUENCE,
> +=09=09=09.ops =3D &hantro_ctrl_ops,
>  =09=09},
>  =09}, {
>  =09=09.codec =3D HANTRO_MPEG2_DECODER,
>  =09=09.cfg =3D {
>  =09=09=09.id =3D V4L2_CID_STATELESS_MPEG2_PICTURE,
> +=09=09=09.ops =3D &hantro_ctrl_ops,
>  =09=09},
>  =09}, {
>  =09=09.codec =3D HANTRO_MPEG2_DECODER,

--=-fZd9Y1jimBb0WSf6xeuw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawS9jwAKCRDZQZRRKWBy
9FgnAQD8bTw31XYUe1vtqtfkbGoUUqyeBO03yvS9WjlSeEZEqAEAwb/xlN87u1WT
eKzhSo5iACnSctSO6DI1zERR4hborwY=
=+31i
-----END PGP SIGNATURE-----

--=-fZd9Y1jimBb0WSf6xeuw--

