Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63766606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eY9fBvm+;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=PfClU7bE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5+CTeAPHlaIrzOxsi+n6+brzSDzv5QqqwUg52jb6nl0=; b=eY9fBvm+llTgtn23f5LqmtaLWf
	kSmQKhZGsZ5iZzBU7gYP+ylvauSJHtRzS4I7ZTnVkcsirUPdo8ExVrTxGJoh06i0PZUlAxO0LB90n
	wdYE4tUZmdFTT02txq/2KzdeabXCxxZ+cch2ut9xOWjrCUofeCxPK2HT9EOIl6ootoxtV8lLQD8/o
	sq3uMB9J3/ku9hElv1duib0Pa+I0l2+eLBQ8GK8BxBEhPTkt6AxbjWOytOca0XiUzMs0iTk1kRF7y
	mB2dqsAHJV9BCDjOR+LM9h4Ab2RXPXhhZ3rXWyLTb/+gljaMQRz3CeEUUZiWwcyStoZhJDL60tIoh
	mJatp/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuGQ-00000007LOZ-3GiD;
	Tue, 24 Nov 2026 17:25:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuGN-00000007LMg-3lGn;
	Tue, 24 Nov 2026 17:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795541101;
	bh=m07kO0w39ZGOpJ7N1oAJdrXNCV6zROzJBkUq6TvKKEw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PfClU7bENUiH3dPsxzpNT3P8oZ2zd+jYU51lg9/WdVuT8DtjQBOps63DLdwp+Td5B
	 iYMvqXfK8xAQ9Qk2QPJI4x3FiOvlU0AxJq7hb/ky2j3WjaBrgvcAZvXHTBweUZ/qRR
	 awgL3hY1rC4+/rjvTDGq4ndmJhCTKB4dNe537+Ln766hBvdiNrzEaiagzSOwZmYTYn
	 kBeJFHuDVooR5zo+8V2J0SvqEVawXSg4CetbSYuH+EvUyGm7614o0VCKBfyN8w6np5
	 8qLaEmdfDYZL62LVmBNnd+wSJfxjEKoDbK3tE+qzmLH0Sb0qKEo3ZCHsyk05liAg/4
	 jjYzS0peNNuVA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 433CC17E00E8;
	Tue, 24 Nov 2026 18:24:59 +0100 (CET)
Message-ID: <17ff7540be764241e6083ba2b6876f7a90787333.camel@collabora.com>
Subject: Re: [PATCH v3 3/3] media: verisilicon: leave room for the JPEG
 header and one stream burst
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: shomenkow@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Chen-Yu Tsai <wenst@chromium.org>, Hugues
 Fruchet <hugues.fruchet@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Tue, 24 Nov 2026 12:24:57 -0500
In-Reply-To: <20261124-hantro-buflimit-v3-3-780903970ca0@gmail.com>
References: <20261124-hantro-buflimit-v3-0-780903970ca0@gmail.com>
	 <20261124-hantro-buflimit-v3-3-780903970ca0@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-9hyBsZW3zMk+VaUuUSDf"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_092504_115436_DC5A4926 
X-CRM114-Status: GOOD (  24.08  )
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

--=-9hyBsZW3zMk+VaUuUSDf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 novembre 2026 =C3=A0 16:40 +0300, Sergei Khomenkov via B4 Relay=
 a =C3=A9crit=C2=A0:
> From: Sergei Khomenkov <shomenkow@gmail.com>
>=20
> hantro_try_fmt() keeps any non-zero CAPTURE sizeimage of the JPEG
> encoder, however small. The CPU writes the 624-byte header into the
> plane, and on the RK3026 the H1 then writes at least one 64-byte burst
> even with a stream limit of 0, so a smaller plane is written past its
> end. A plane smaller than the header also makes the WARN_ON() in
> hantro_h1_jpeg_enc_set_buffers() fire on every job.
>=20
> Add a minimum plane size to struct hantro_fmt, set it to header_size +
> 64 in the JPEG encoder formats of the Rockchip and STM32MP25 variants,
> and raise a smaller coded sizeimage to it in hantro_try_fmt().
>=20
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5

Drop if v4 needed.

> Signed-off-by: Sergei Khomenkov <shomenkow@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Found with an LLM coding assistant while porting mainline Linux to a
> Rockchip RK3026 board; the assistant also drafted this change. Tested
> on that board: a sizeimage of 1 or 600 now reads back 688, and frames
> that do not fit a 688-byte plane stop exactly at its end. Not tested on
> other SoCs.
> ---
>  drivers/media/platform/verisilicon/hantro.h           | 2 ++
>  drivers/media/platform/verisilicon/hantro_v4l2.c      | 3 +++
>  drivers/media/platform/verisilicon/rockchip_vpu_hw.c  | 1 +
>  drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c | 1 +
>  4 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index 0353de154a1e..f51beae79f1f 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -286,6 +286,7 @@ struct hantro_ctx {
>   * @codec_mode:=09Codec mode related to this format. See
>   *=09=09enum hantro_codec_mode.
>   * @header_size: Optional header size. Currently used by JPEG encoder.
> + * @min_size:=09Optional minimum sizeimage, for bitstream formats.
>   * @max_depth:=09Maximum depth, for bitstream formats
>   * @enc_fmt:=09Format identifier for encoder registers.
>   * @frmsize:=09Supported range of frame sizes (only for bitstream format=
s).
> @@ -297,6 +298,7 @@ struct hantro_fmt {
>  =09u32 fourcc;
>  =09enum hantro_codec_mode codec_mode;
>  =09int header_size;
> +=09u32 min_size;
>  =09int max_depth;
>  =09enum hantro_enc_fmt enc_fmt;
>  =09struct v4l2_frmsize_stepwise frmsize;
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index 83af9fa1ce94..b3dbc0629d25 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -394,6 +394,9 @@ static int hantro_try_fmt(const struct hantro_ctx *ct=
x,
>  =09=09 */
>  =09=09pix_mp->plane_fmt[0].sizeimage =3D fmt->header_size +
>  =09=09=09pix_mp->width * pix_mp->height * fmt->max_depth;
> +=09} else {
> +=09=09pix_mp->plane_fmt[0].sizeimage =3D
> +=09=09=09max(pix_mp->plane_fmt[0].sizeimage, fmt->min_size);
>  =09}
> =20
>  =09return 0;
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drive=
rs/media/platform/verisilicon/rockchip_vpu_hw.c
> index d201b058e5e8..ab5abe2c78ad 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -50,6 +50,7 @@ static const struct hantro_fmt rockchip_vpu_enc_fmts[] =
=3D {
>  =09=09.codec_mode =3D HANTRO_MODE_JPEG_ENC,
>  =09=09.max_depth =3D 2,
>  =09=09.header_size =3D JPEG_HEADER_SIZE,
> +=09=09.min_size =3D JPEG_HEADER_SIZE + 64,=09/* header + one burst */
>  =09=09.frmsize =3D {
>  =09=09=09.min_width =3D 96,
>  =09=09=09.max_width =3D 8192,
> diff --git a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c b/driv=
ers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> index 833821120b20..3f337554e936 100644
> --- a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> @@ -83,6 +83,7 @@ static const struct hantro_fmt stm32mp25_venc_fmts[] =
=3D {
>  =09=09.codec_mode =3D HANTRO_MODE_JPEG_ENC,
>  =09=09.max_depth =3D 2,
>  =09=09.header_size =3D JPEG_HEADER_SIZE,
> +=09=09.min_size =3D JPEG_HEADER_SIZE + 64,=09/* header + one burst */
>  =09=09.frmsize =3D {
>  =09=09=09.min_width =3D 96,
>  =09=09=09.max_width =3D FMT_4K_WIDTH,

--=-9hyBsZW3zMk+VaUuUSDf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawXIaQAKCRDZQZRRKWBy
9BOUAQDB13SGsNUp9oo0GULFzOq8ooFbMD+D1z8pwpgBhY3I/gD7BBun+nzgWLRF
kcm+xZkcOJAH6AFAmIgpuo+y1l8swgM=
=tHV6
-----END PGP SIGNATURE-----

--=-9hyBsZW3zMk+VaUuUSDf--

