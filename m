Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E049E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ogCCko+R;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JUc4fyKs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zinsNkA/MCmk8bh88Wgj8xpqSQkw+nXigBT68XWmIeE=; b=ogCCko+RHlDZNBfl9pPn3NPQQ+
	gEZXXdiZeq8u3c2X4vtegM28M7QR+qCF9zKZJw87rXT8CwprufSW7bvVLo2O+FhKPhF1lKqVDTRp+
	30LRp5zlsTWHIFTwQXRhh7XBV/9wXAA4xX6gvu+npMH74LpjBO+LtZ+B6IZanKkGS2H5Ff0r7ftyY
	ExceoPT7EvB73nI0i+wujWKa1zLsU4CEGXAUXrGLT4UQ6SCmMRClGbh5i7jmmtvdoBmEf4PGRQOMK
	bitX/hqIJLEHykcWpNazNpk4Tr0hyPdfSlRyYmnYxr+Uw5aFXUDuQ0+GsA39TpWZECKBrjS2Ruc2o
	B6CLkXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlJH-0000000Eksi-3OqV;
	Fri, 27 Nov 2026 02:03:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlJD-0000000EkrM-3E88;
	Fri, 27 Nov 2026 02:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795745009;
	bh=vbOHt71Rd2dKgPsjFkZRH/OqXPRhU2dyC/OJCjwDGrE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=JUc4fyKsJ0aDWvW23BXR8hrlSDuUC/tjT9b2H1Tv0SnbBQwYTZvIaXJoOIm0L+YrQ
	 X4j+Tvee+eFcJSVq1P4auoIoarJw7spGV15n98wVwxXsFSLzWZ3kq4AXhhNMhHiA7s
	 CtCNkIUn26slJNmWifJJAz13Ha07ayOtCD+ZNz7ZCMvAJBSPCa9AefROPWHXbvAK63
	 kpYuBHlFtPhFORukZZ2iwSw8VPfUou1xQIKdyDj3zaz2R80C2Q6ez9t+r540XlYXLe
	 I18JoyguZB0yEMfCbsakCHO6R4XRFRV91I2gl0uRFtmkeFUDT9MO0G9QMVU4AQqgp7
	 QXQ6JaJAzmsYQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B74117E01C2;
	Fri, 27 Nov 2026 03:03:27 +0100 (CET)
Message-ID: <f6e35a9c3f8240dba3ae413c52b9627f42a34b27.camel@collabora.com>
Subject: Re: [PATCH v9 2/4] media: verisilicon: Use
 V4L2_AV1_PRIMARY_REF_NONE and V4L2_AV1_REF_FRAME_INVALID
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Date: Thu, 26 Nov 2026 21:03:26 -0500
In-Reply-To: <20261125122825.236422-3-benjamin.gaignard@collabora.com>
References: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
	 <20261125122825.236422-3-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-F4AFt9xHfzt4V+lORLb9"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_180332_692126_EBA62FF2 
X-CRM114-Status: GOOD (  15.18  )
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

--=-F4AFt9xHfzt4V+lORLb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 novembre 2026 =C3=A0 13:28 +0100, Benjamin Gaignard a =C3=A9=
crit=C2=A0:
> Use V4L2_AV1_PRIMARY_REF_NONE and V4L2_AV1_REF_FRAME_INVALID instead
> of local definition.
> Since ref_frame_idx[] values have been checked inside v4l2-ctrl-core.c
> remove the useless duplicate check.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> changes in v9:
> - Split core changes and drivers changes
> - Use V4L2_AV1_REF_FRAME_INVALID
>=20
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index 2a145433e6d1..087a944b3394 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -18,9 +18,7 @@
>  #define AV1_TILE_INFO_SIZE=09(AV1_MAX_TILES * 16)
>  #define AV1DEC_MAX_PIC_BUFFERS=0924
>  #define AV1_REF_SCALE_SHIFT=0914
> -#define AV1_INVALID_IDX=09=09-1
>  #define MAX_FRAME_DISTANCE=0931
> -#define AV1_PRIMARY_REF_NONE=097
>  #define AV1_TILE_SIZE=09=09ALIGN(32 * 128, 4096)
>  /*
>   * These 3 values aren't defined enum v4l2_av1_segment_feature because
> @@ -123,8 +121,8 @@ static int rockchip_vpu981_get_frame_index(struct han=
tro_ctx *ctx, int ref)
>  =09u64 timestamp;
>  =09int i, idx =3D frame->ref_frame_idx[ref];
> =20
> -=09if (idx >=3D V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
> -=09=09return AV1_INVALID_IDX;
> +=09if (idx < 0)
> +=09=09return V4L2_AV1_REF_FRAME_INVALID;
> =20
>  =09timestamp =3D frame->reference_frame_ts[idx];
>  =09for (i =3D 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
> @@ -134,7 +132,7 @@ static int rockchip_vpu981_get_frame_index(struct han=
tro_ctx *ctx, int ref)
>  =09=09=09return i;
>  =09}
> =20
> -=09return AV1_INVALID_IDX;
> +=09return V4L2_AV1_REF_FRAME_INVALID;
>  }
> =20
>  static int rockchip_vpu981_get_order_hint(struct hantro_ctx *ctx, int re=
f)
> @@ -142,7 +140,7 @@ static int rockchip_vpu981_get_order_hint(struct hant=
ro_ctx *ctx, int ref)
>  =09struct hantro_av1_dec_hw_ctx *av1_dec =3D &ctx->av1_dec;
>  =09int idx =3D rockchip_vpu981_get_frame_index(ctx, ref);
> =20
> -=09if (idx !=3D AV1_INVALID_IDX)
> +=09if (idx !=3D V4L2_AV1_REF_FRAME_INVALID)
>  =09=09return av1_dec->frame_refs[idx].order_hint;
> =20
>  =09return 0;
> @@ -179,7 +177,7 @@ static int rockchip_vpu981_av1_dec_frame_ref(struct h=
antro_ctx *ctx,
>  =09=09return i;
>  =09}
> =20
> -=09return AV1_INVALID_IDX;
> +=09return V4L2_AV1_REF_FRAME_INVALID;
>  }
> =20
>  static void rockchip_vpu981_av1_dec_frame_unref(struct hantro_ctx *ctx, =
int idx)
> @@ -1256,7 +1254,7 @@ static void rockchip_vpu981_av1_dec_set_prob(struct=
 hantro_ctx *ctx)
>  =09bool frame_is_intra =3D IS_INTRA(frame->frame_type);
> =20
>  =09if (error_resilient_mode || frame_is_intra ||
> -=09    frame->primary_ref_frame =3D=3D AV1_PRIMARY_REF_NONE) {
> +=09    frame->primary_ref_frame =3D=3D V4L2_AV1_PRIMARY_REF_NONE) {
>  =09=09av1_dec->cdfs =3D &av1_dec->default_cdfs;
>  =09=09av1_dec->cdfs_ndvc =3D &av1_dec->default_cdfs_ndvc;
>  =09=09rockchip_av1_default_coeff_probs(quantization->base_q_idx,

--=-F4AFt9xHfzt4V+lORLb9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawjk7gAKCRDZQZRRKWBy
9HU2AP9Uo6Vsm4QhJ7Kzx8kbnip6CwEzPNy9N2P7ptRISEWP+wEA2FqoTfLf0U9/
do+1ErYb2GPGhnPqwAZVhUhNqvZCoQs=
=DbLk
-----END PGP SIGNATURE-----

--=-F4AFt9xHfzt4V+lORLb9--

