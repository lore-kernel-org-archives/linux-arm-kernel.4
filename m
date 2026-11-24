Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69160606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 03:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rYwxcyye;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pNpVseDq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kXq0Eheb2+1+jb0f/AeprT9shSL2ndw7j6GeQEw3A7I=; b=rYwxcyyeAAcu5nRE4EZ/3qCY/Q
	qbs2XIQ3GjXHePSLJDnw2cF5H+6Js3szYXRWsSnALkMY0KsmWuxN6CbeCdKJqsARwUokxyLXzSqpL
	5DyEjsXTOx7IAqpeAdPbxlhdFGAW5robN1YmUio65z9eX2j+cj1aX2FhOiCZKVkujkDUFmSC7A479
	bU57QF52w/yVumpfwPcno5h5UtagSkg1IudNyq/YyRovXHUvGz96XfE/+wMLWhF1jMC6Gyir4on0r
	XP3N1EN0CikBL3wOHUyMi58SLuriFcFt4nup0hfHHIDjTFfM7WK6KJrEhNZVDuShDMEVVxQeP/wn3
	s0H/jyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgix-00000005PJd-2bZP;
	Tue, 24 Nov 2026 02:57:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgit-00000005PHH-1jKZ;
	Tue, 24 Nov 2026 02:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795489049;
	bh=hBp4fEAeDQr7vaWjTTJLVZ0thKQS+kHTXID++ldMdgE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pNpVseDqBYOSbhT6osS3YB5MY6gvkT82HwEeA8tS2yS2ptqubciruHGOQPPDndxXN
	 p/MR6lTtO8+o0B9EAz2LtLuSnbfVCLQK2qbgCbrwMczmmi57ypTBo32kzeiQrrt00T
	 o4Bi0LHmy/DkqWJ/U1WMuH81nvXDP7lC+B3wPZttFqe6GYFjH4u87lfmc2oIpykGkQ
	 aYwK+m48UOUnQw6upl80KUvEtvbr8tYcieKqf/DgFzSYjcyXkat8yr3jI7URFmHSOD
	 8KiLUTQrrb8BRXp8dDvffhBnuoHkAD4Yo/ZV/ndiLjjm/S26A8YvcO0AzBoo1JPApL
	 6P3Zj95Otumpg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5367E17E00B2;
	Tue, 24 Nov 2026 03:57:27 +0100 (CET)
Message-ID: <03daf8e29ec2b53da4f626715b7bb08273237299.camel@collabora.com>
Subject: Re: [PATCH v2 3/7] media: verisilicon: Keep the encoder coded size
 in sync with OUTPUT
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans
 Verkuil <hverkuil@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sergei
 Khomenkov <shomenkow@gmail.com>
Date: Mon, 23 Nov 2026 21:57:25 -0500
In-Reply-To: <20261112-hantro-jpeg-enc-fixes-v2-3-de03e643c75d@gmail.com>
References: <20261112-hantro-jpeg-enc-fixes-v2-0-de03e643c75d@gmail.com>
	 <20261112-hantro-jpeg-enc-fixes-v2-3-de03e643c75d@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-uyQ3Q8y5bAy85ex1qmu0"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_185736_366394_CED4239A 
X-CRM114-Status: GOOD (  26.27  )
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

--=-uyQ3Q8y5bAy85ex1qmu0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 novembre 2026 =C3=A0 08:31 +0000, Arun Iyengar via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> On the encoder, setting the CAPTURE (coded) format resets the OUTPUT
> (raw) format to the same size, but setting the OUTPUT format never
> updates the CAPTURE format. Following the order mandated by the
> stateful encoder specification (CAPTURE first, then OUTPUT) therefore
> leaves the coded size at whatever it was before, e.g. the 96x32
> default:
>=20
>   v4l2-ctl --set-fmt-video-out=3Dwidth=3D1920,height=3D1080,pixelformat=
=3DNM12 \
>            --set-fmt-video=3Dpixelformat=3DJPEG --stream-out-mmap ...
>=20
> ends up with a 1920x1088 OUTPUT format and a 96x32 CAPTURE format with
> a 96x32 sized buffer. The JPEG encoders treat the difference between
> the two as the crop inside the last macroblock, which is expected to be
> below 16 pixels, and program the hardware with the full OUTPUT frame
> size. On RK3588 this results in IOMMU page faults, a frame processing
> timeout and a wedged encoder.
>=20
> The specification says that the CAPTURE width and height are set by the
> encoder from the OUTPUT format and selection rectangles, and that
> setting the OUTPUT format resets the crop rectangle to the full frame.
> Do that in hantro_set_fmt_out(): derive the coded format from the new
> OUTPUT size, re-applying the CAPTURE constraints, including the minimum
> sizeimage. As the coded format can now change from an OUTPUT S_FMT,
> return -EBUSY if this would require bigger CAPTURE buffers than the
> ones already allocated.
>=20
> With this, the coded size can only differ from the OUTPUT size by the
> crop set through VIDIOC_S_SELECTION, which is restricted to the last
> macroblock.
>=20
> Fixes: 953aaa1492c5 ("media: rockchip/vpu: Prepare things to support deco=
ders")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/media/platform/verisilicon/hantro_v4l2.c | 26 ++++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index c4e36a79eecc..e9d91504fab2 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -542,6 +542,7 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
>  =09=09=09      struct v4l2_pix_format_mplane *pix_mp,
>  =09=09=09      bool need_postproc)
>  {
> +=09struct v4l2_pix_format_mplane coded_fmt;
>  =09struct vb2_queue *vq;
>  =09int ret;
> =20
> @@ -561,16 +562,41 @@ static int hantro_set_fmt_out(struct hantro_ctx *ct=
x,
>  =09=09=09return -EBUSY;
>  =09=09}
>  =09} else {

You could fols the below if(busy) as:
=09} else if (vb2_is_busy(vq)) {
=09=09return -EBUSY;
=09
=09} else {
> +=09=09struct vb2_queue *peer_vq;
> +
>  =09=09/*
>  =09=09 * The encoder doesn't admit a format change if
>  =09=09 * there are OUTPUT buffers allocated.
>  =09=09 */
>  =09=09if (vb2_is_busy(vq))
>  =09=09=09return -EBUSY;
> +
> +=09=09/*
> +=09=09 * Setting the OUTPUT format resets the crop rectangle to
> +=09=09 * the full frame, so the coded size becomes the OUTPUT
> +=09=09 * size. Refuse the change if it would need bigger
> +=09=09 * CAPTURE buffers than the ones already allocated.
> +=09=09 */
> +=09=09coded_fmt =3D ctx->dst_fmt;
> +=09=09coded_fmt.width =3D pix_mp->width;
> +=09=09coded_fmt.height =3D pix_mp->height;
> +=09=09ret =3D hantro_try_fmt(ctx, &coded_fmt,
> +=09=09=09=09     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +=09=09if (ret)
> +=09=09=09return ret;
> +
> +=09=09peer_vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +=09=09=09=09=09  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);

Its explicitly a capture queue, call the variable this way (or dst_vq);

> +=09=09if (vb2_is_busy(peer_vq) &&
> +=09=09    coded_fmt.plane_fmt[0].sizeimage >
> +=09=09    ctx->dst_fmt.plane_fmt[0].sizeimage)
> +=09=09=09return -EBUSY;

Its a reflection I started on previous patch, but on memory constrained dev=
ice,
if application wants to pick a smaller size image and use lower quality, ma=
ybe
it should. Our newly introduce max size does not scale based on the quality=
.

In short, its a bit application fault if the buffers ended up too small. Wh=
at
the driver should focus is to prevent iommu fault, and too short shouldn't =
do
that. Are you sure you are fixing this the right way?

>  =09}
> =20
>  =09ctx->vpu_src_fmt =3D hantro_find_format(ctx, pix_mp->pixelformat);
>  =09ctx->src_fmt =3D *pix_mp;
> +=09if (ctx->is_encoder)
> +=09=09ctx->dst_fmt =3D coded_fmt;
> =20
>  =09/*
>  =09 * Current raw format might have become invalid with newly

--=-uyQ3Q8y5bAy85ex1qmu0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawT9FQAKCRDZQZRRKWBy
9EfkAP9KD+KaGFiGMk8f5D9OivNcABwldsFyIa4c2/citzNJ7gEAietLuEc3rV/j
kkQZ2YINaHVfd3eTXOH9dyatN4CVfAc=
=5zHI
-----END PGP SIGNATURE-----

--=-uyQ3Q8y5bAy85ex1qmu0--

