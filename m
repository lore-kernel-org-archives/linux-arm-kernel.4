Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9251606A89D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qYkCco22;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fTfEwMbH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6s4531iB0pwwtkJP2bBPZCteIxEY5u4QI+uEjRbvaQM=; b=qYkCco22AEem5gd+Iq8P/AhohR
	2rX5iE5GEjv1L9soeiHne2e3CS3Ri1J3H9JWlv3cir8Y2J3eURM6o9ueeF8XUYXSqjDOn1JH72sBQ
	3/7BDYR05vFgGhu0zW0CzVdSKbLuJef8ZbU7ctUcDXGhfIC/bvBxtyfQ7osC8CvpkT5gvN87jJ8qq
	S0kgofDLX8KXpEG7evgkjaolz6ZtGK3/0HDYQYbX0I0yUNPgxbTFhUjy3WGu92Zqi5ArCi+0tc0SS
	7rnYkLUWhCBB/Dc83h2BMNECSXQmsVyZbpaRdFr35yCOrgAprJCfRDLpaZXiBTNglsNeKvovLDgxF
	s6wslJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVq1-0000000AH25-0kFD;
	Thu, 12 Nov 2026 14:31:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVpw-0000000AH07-1Vyl;
	Thu, 12 Nov 2026 14:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794493893;
	bh=FYjRkCqyGsRzmWdDWrbZF9LJoHsBc2QeonGafSKs3io=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fTfEwMbHp4+4B3IGdyreGHL9lOXdgsebWLpWKAiUE742su8X68AaK/BPdQmsnhTkK
	 DBnXjsxusfs94dmGLvo5Qgdn3k54wbgzeH343gzr4S9msanrDzznWUh2Gy9HIN8XM1
	 la+aOdBXDCBP8pNLmx1xh6hkFOIo8KTriFHEQjOyuzjcvFq1cxGBA3zl19JjQAYQAW
	 OdXv3cHUqRrRseYTJxrY/TmusEA5W4LLtCIwB1U4pIwSXNoc2sukEArT1phd0Iz//N
	 /b+ZSPUqz/wwtrm00eIZuzddIggUTzkvPpXAtTdvSCLal4Dq9aQjzmzIUdcL+8z81o
	 HXMnY56/VdrKg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBC5817E0564;
	Thu, 12 Nov 2026 15:31:31 +0100 (CET)
Message-ID: <f041c5d87698ab3be8283ecc71ead0679327238e.camel@collabora.com>
Subject: Re: [PATCH v2 3/6] media: verisilicon: Don't offer VP8 above 1080p
 on the Rockchip VDPU2
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke	
 <sebastian.fricke@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Boris Brezillon
 <boris.brezillon@collabora.com>, Jonas Karlman	 <jonas@kwiboo.se>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Jeffy Chen	
 <jeffy.chen@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 12 Nov 2026 09:31:30 -0500
In-Reply-To: <20261112-hantro-codec-fixes-v2-3-f44424df585b@gmail.com>
References: <20261112-hantro-codec-fixes-v2-0-f44424df585b@gmail.com>
	 <20261112-hantro-codec-fixes-v2-3-f44424df585b@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-UsVvDKz6sEPhCdtGodXv"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_063136_703126_8864F72D 
X-CRM114-Status: GOOD (  21.67  )
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

--=-UsVvDKz6sEPhCdtGodXv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 12 novembre 2026 =C3=A0 08:54 +0000, Arun Iyengar via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The VDPU2 decoder format tables (RK3328, RK3568, RK3588 VPU121) and the
> RK3399 one let the VP8 OUTPUT format go up to 3840x2160, but their only
> CAPTURE format, NV12, stops at 1920x1088, and the CAPTURE size is
> clamped to it. A 4K VP8 stream is therefore accepted on OUTPUT and then
> decoded into a 1920x1088 buffer: on RK3588 GStreamer v4l2slvp8dec runs
> into "gst_video_frame_map_id: assertion 'info->width <=3D meta->width'
> failed" for every frame of a 3840x2160 stream and none of the frames
> match FFmpeg.

Just to bring to your attention, the IP does support up to 65Kx65k, but the=
n you
can't do referencing (its the WebP mode, key frame only). Hughes Fruchet fr=
om ST
started looking into this but his work was not completed. The general idea
though was to perhaps introduce a V4L2_PIX_FMT_WEBP_VP8 (or VP8_INTRA, nami=
ng is
hard) format to signal this to the decoder, and limit to 1080 the FMT_VP8 (=
what
you are fixing I suppose).

>=20
> Nothing above 1080p can be decoded with these tables, so don't
> advertise it: limit VP8 to the 1920x1088 of the other codecs and of the
> CAPTURE format. Userspace that checks VIDIOC_ENUM_FRAMESIZES, and the
> S_FMT clamping, then know that a 4K VP8 stream needs another decoder.
>=20
> Fixes: 73fb5bfa53e9 ("media: hantro: Support RK3399 VP8 decoding")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drive=
rs/media/platform/verisilicon/rockchip_vpu_hw.c
> index 02673be9878e..2b6242c1fb86 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -274,10 +274,10 @@ static const struct hantro_fmt rockchip_vdpu2_dec_f=
mts[] =3D {
>  =09=09.max_depth =3D 2,
>  =09=09.frmsize =3D {
>  =09=09=09.min_width =3D FMT_MIN_WIDTH,
> -=09=09=09.max_width =3D FMT_UHD_WIDTH,
> +=09=09=09.max_width =3D FMT_FHD_WIDTH,
>  =09=09=09.step_width =3D MB_DIM,
>  =09=09=09.min_height =3D FMT_MIN_HEIGHT,
> -=09=09=09.max_height =3D FMT_UHD_HEIGHT,
> +=09=09=09.max_height =3D FMT_FHD_HEIGHT,
>  =09=09=09.step_height =3D MB_DIM,
>  =09=09},
>  =09},
> @@ -315,10 +315,10 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[=
] =3D {
>  =09=09.max_depth =3D 2,
>  =09=09.frmsize =3D {
>  =09=09=09.min_width =3D FMT_MIN_WIDTH,
> -=09=09=09.max_width =3D FMT_UHD_WIDTH,
> +=09=09=09.max_width =3D FMT_FHD_WIDTH,
>  =09=09=09.step_width =3D MB_DIM,
>  =09=09=09.min_height =3D FMT_MIN_HEIGHT,
> -=09=09=09.max_height =3D FMT_UHD_HEIGHT,
> +=09=09=09.max_height =3D FMT_FHD_HEIGHT,

If you have time, it is also miss-configured on the imx8mm, the combo-core
(G1/H1 combined, like RK modified version). While the imx8mq has 4k h264, I
don't know if the VP8 core actually is capable of 4k, so perhaps both soc n=
eed
fixing.

>  =09=09=09.step_height =3D MB_DIM,
>  =09=09},
>  =09},

--=-UsVvDKz6sEPhCdtGodXv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavXNwgAKCRDZQZRRKWBy
9DkyAP0Q5qttBFa47Zyj/PIBd6D//4pj/GszbWh3XhcsCqWbxgD/XOK6P1s53OLa
N6GX9/CmC99j1N3UZYLbYnUuHv9tlQI=
=VOqM
-----END PGP SIGNATURE-----

--=-UsVvDKz6sEPhCdtGodXv--

