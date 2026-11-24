Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077F606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zbqsb3Vk;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=PqazgT6i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b5z+6j/Bssp77rhJFcqzShFUFQJWDTKeW2lyL35BdJA=; b=Zbqsb3Vk9dTy0M7Pflj358mLWE
	0W4X+hzs+XajiU9iIieilzdPSgAr0JpD0qh4qcDijblvLc6ovCeFnNZk7lBT3MKQEnRrIQMMzr9vM
	XGZs5Xz6Cqa5Iq08kgK/2LEaaGaXbLY1o3NydSGX3zDlHxi0zhdXIs3qZ7qKlP3QatzkdpKedu7DT
	ISu7S3rGyShdLD3IN6LCv1d+UsAmEJ+G0YqlMjb7nmRNB5/XkSacJe4Jpoke8AFzuKLDrn3ulQDtr
	3Affyt8dyjvKv1GnEVxY+pXa6PXm0AQ7hXt25wkNO5Z8VA9BwAA2w4mInX5QOvy6b1IbJiiVPJTjy
	9KjbvmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtzz-00000007GBt-39Di;
	Tue, 24 Nov 2026 17:08:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtzx-00000007GAH-2U4y;
	Tue, 24 Nov 2026 17:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795540083;
	bh=XVsm2g87K7EiScMpFX+YLK3BjagJwRTYcIiVjtlKvoU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PqazgT6iD61c1zbABIMmIWWGdKVAnMdvNQ7mKFGbQsmcNILBUjAJ1lRNTG0g+NbSd
	 qVd80YvrB9OzKy6KMEdhSDT09jZXj7HoZCga8I+fLpiKUUgNAp7eFRSI2LGf351hVT
	 /ghjLdlH9MA9i0IujvXnwVW5Vz0btMl0QwxyAv0EK7DHbrYgL0ZpjJNih5Cd2E0dqs
	 /lji7+IMznkl18g3Kl5TvF9ftQQxjwjourYR0L5l90vg7pjLCaaqwrQ/F9GNA4m+KI
	 Zh74e8AQOnW0zUNg88roYoDD7VM6+1uTQE/6gJci6g+PmEKf+1zwSifBtjrzb3eSDp
	 qNSS/2uBuCWGA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E112D17E047C;
	Tue, 24 Nov 2026 18:08:01 +0100 (CET)
Message-ID: <deea128399ee10bcd7e789a48763222b961ae0f1.camel@collabora.com>
Subject: Re: [PATCH v8 1/3] media: v4l2-ctrls: validate AV1 reference frame
 index
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Date: Tue, 24 Nov 2026 12:08:00 -0500
In-Reply-To: <20261124131816.115131-2-benjamin.gaignard@collabora.com>
References: <20261124131816.115131-1-benjamin.gaignard@collabora.com>
	 <20261124131816.115131-2-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-7bhjUBWK19mT5W91FGeZ"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_090805_815338_7C2C01DF 
X-CRM114-Status: GOOD (  18.21  )
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

--=-7bhjUBWK19mT5W91FGeZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 novembre 2026 =C3=A0 14:18 +0100, Benjamin Gaignard a =C3=A9cri=
t=C2=A0:
> The stateless AV1 decoders use primary_ref_frame and ref_frame_idx[] to
> to find the matching reference frames.
> V4L2_AV1_PRIMARY_REF_NONE is the value of primary_ref_frame indicating
> that there is no primary reference frame.
> Reject invalid indexes to avoid issues in the drivers while validate othe=
r
> frame parameters.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> changes in v8
> - check reference frame index when validating the frame before
>   calling the driver.
>=20
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  3 +--
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++++
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  3 files changed, 22 insertions(+), 2 deletions(-)

Split core from driver changes.

>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index 2a145433e6d1..bbfca34688eb 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -20,7 +20,6 @@
>  #define AV1_REF_SCALE_SHIFT=0914
>  #define AV1_INVALID_IDX=09=09-1
>  #define MAX_FRAME_DISTANCE=0931
> -#define AV1_PRIMARY_REF_NONE=097
>  #define AV1_TILE_SIZE=09=09ALIGN(32 * 128, 4096)
>  /*
>   * These 3 values aren't defined enum v4l2_av1_segment_feature because
> @@ -1256,7 +1255,7 @@ static void rockchip_vpu981_av1_dec_set_prob(struct=
 hantro_ctx *ctx)
>  =09bool frame_is_intra =3D IS_INTRA(frame->frame_type);
> =20
>  =09if (error_resilient_mode || frame_is_intra ||
> -=09    frame->primary_ref_frame =3D=3D AV1_PRIMARY_REF_NONE) {
> +=09    frame->primary_ref_frame =3D=3D V4L2_AV1_PRIMARY_REF_NONE) {
>  =09=09av1_dec->cdfs =3D &av1_dec->default_cdfs;
>  =09=09av1_dec->cdfs_ndvc =3D &av1_dec->default_cdfs_ndvc;
>  =09=09rockchip_av1_default_coeff_probs(quantization->base_q_idx,
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 6e751a043a21..f4c2a04fb721 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -817,10 +817,30 @@ static int validate_av1_tile_info(struct v4l2_av1_t=
ile_info *t)
>  =09return 0;
>  }
> =20
> +static int validate_av1_reference_index(struct v4l2_ctrl_av1_frame *f)
> +{
> +=09int idx;
> +
> +=09if (f->primary_ref_frame > V4L2_AV1_PRIMARY_REF_NONE)
> +=09=09return -EINVAL;
> +
> +=09if (f->primary_ref_frame =3D=3D V4L2_AV1_PRIMARY_REF_NONE)
> +=09=09return 0;
> +
> +=09idx =3D f->ref_frame_idx[f->primary_ref_frame];
> +=09if (idx < 0 || idx >=3D V4L2_AV1_TOTAL_REFS_PER_FRAME)
> +=09=09return -EINVAL;
> +
> +=09return 0;
> +}
> +
>  static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
>  {
>  =09int ret =3D 0;
> =20
> +=09ret =3D validate_av1_reference_index(f);
> +=09if (ret)
> +=09=09return ret;
>  =09ret =3D validate_av1_tile_info(&f->tile_info);
>  =09if (ret)
>  =09=09return ret;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index d17e41d51d2e..82023fbffd6a 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -2940,6 +2940,7 @@ struct v4l2_ctrl_vp9_compressed_hdr {
>  #define V4L2_AV1_MAX_TILE_COLS=09=0964
>  #define V4L2_AV1_MAX_TILE_ROWS=09=0964
>  #define V4L2_AV1_MAX_TILE_COUNT=09=09512
> +#define V4L2_AV1_PRIMARY_REF_NONE=097
> =20
>  #define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE=09=09  0x00000001
>  #define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK=09  0x00000002

--=-7bhjUBWK19mT5W91FGeZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawXEcAAKCRDZQZRRKWBy
9Ci7AQCh7xzeUtcWsraOr3AfuynLmcy7NS4EHZq9py+FhRQcXAEAtY05sOxD+TCy
Tr02JjL2CDLvPbRoTN9ins5yelgbgwY=
=sCxR
-----END PGP SIGNATURE-----

--=-7bhjUBWK19mT5W91FGeZ--

