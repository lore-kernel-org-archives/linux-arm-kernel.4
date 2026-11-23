Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C147D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nR4EeKhm;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WKfelPKb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z0C24pzM8Xx4iRU4E+5H2+km50LELSDvrxMawEqxDEs=; b=nR4EeKhmckJv5RYA+mzw+uofEa
	N1SpnjAh/Jdx8cTeClu0cKzQlGr2zJYxo0j55mkoVEpwvoQG/Z0HUK8x9cyatzd3AGuTFt7JF2uCF
	gCbNr9KS27KvIAxZkUdHA73SiGW4WULFOG4hGHtAgi/EKjQmqZCzoglvC3ASy8gaxtJdkkfi2YkIZ
	fc9Jky2oXU+IGpYLegr5G+V4LzRphhORL2yQ412Q8AG8H1bcpKS264g37/l9CtBns0A6lXYYnezOm
	XHrJ0FCFHTODprc2QLmqE9y4c/CHY9Yr/UomA5cLUGbdRQDm7r9IWwYh6XwqgdjCh5tGBTt0/rc5u
	idHVBhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbLe-00000004wRZ-2ve6;
	Mon, 23 Nov 2026 21:13:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbLb-00000004wR5-0nQa;
	Mon, 23 Nov 2026 21:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795468387;
	bh=iu9XpwdJa26Z7o/BScxC2C2qx9clmv3hojJxBRLM6PM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WKfelPKb613ib9VmkQX9i28SLZy0CqEYwko96dYB+PPaK9qoqvUgplmOpfTIRyb2P
	 KbNFgVWSaNYd/oW0l2vFxpCq7+fGzFr3ujbWmuUsaB2GW5EmOWLaJIzKURfYsCDgPx
	 MCY54+c2te/THmmhD++m90sO38KS0xSf1U7oS6q+5zrUkrZzr7e5VQ+nlpk5f1rQhQ
	 7xWBD1TG6+eIoQ5w0FfZTNMGuZw+weGKKOeHIor8oEL8UQSiFrS7q1SvvdJ8muqLfw
	 G55k3OK+KfkHQZHrq79OtJ3CzGZdO/UEYdL+ODFtA7E/a1qsAO/IskdgNbSV4/xX7t
	 ebPJGVO/JMQCw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8054B17E0DB6;
	Mon, 23 Nov 2026 22:13:05 +0100 (CET)
Message-ID: <859f39e1b7c0e9e91504a34c37cccb922ef0ec6b.camel@collabora.com>
Subject: Re: [PATCH v2 2/3] media: verisilicon: program the H1 JPEG stream
 limit in 64-bit words
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: shomenkow@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Ezequiel Garcia
	 <ezequiel@vanguardiasur.com.ar>, Chen-Yu Tsai <wenst@chromium.org>, Hugues
 Fruchet <hugues.fruchet@foss.st.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Mon, 23 Nov 2026 16:13:03 -0500
In-Reply-To: <20261110-hantro-buflimit-v2-2-ff7790def9fc@gmail.com>
References: <20261110-hantro-buflimit-v2-0-ff7790def9fc@gmail.com>
	 <20261110-hantro-buflimit-v2-2-ff7790def9fc@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-/pZ7QRKaT58RrTydTrIs"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_131311_484647_947AEEB5 
X-CRM114-Status: GOOD (  22.05  )
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

--=-/pZ7QRKaT58RrTydTrIs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 10 novembre 2026 =C3=A0 15:41 +0300, Sergei Khomenkov via B4 Relay=
 a =C3=A9crit=C2=A0:
> From: Sergei Khomenkov <shomenkow@gmail.com>
>=20
> H1_REG_STR_BUF_LIMIT counts 64-bit words, but the driver writes the room
> left in the CAPTURE plane in bytes. A stream that does not fit, such as
> a quality 100 frame of noise in a default-sized buffer, is then written
> past the end of the plane, up to eight times its size.
>=20
> Write the limit in 64-bit words, rounded down to whole 64-byte bursts:
> the encoder finishes a burst it has started, so an unrounded limit lets
> it write up to 56 bytes past it.
>=20
> Found with an LLM coding assistant while porting mainline Linux to a
> Rockchip RK3026 board; the assistant also drafted this change. Tested
> on that board: overflowing frames now stop at the programmed limit
> without writing past the plane, and frames that fit are byte for byte
> the same as before. Not tested on other SoCs, including the STM32MP25,
> which shares this code.

Move the paragraph after --, its not need in the commit and add an Assisted=
-by:
tag.

>=20
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sergei Khomenkov <shomenkow@gmail.com>
> ---
>  drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c b/dr=
ivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
> index 86cc1a07026f..665a87e9fe92 100644
> --- a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
> +++ b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
> @@ -55,7 +55,12 @@ static void hantro_h1_jpeg_enc_set_buffers(struct hant=
ro_dev *vpu,
>  =09vepu_write_relaxed(vpu, vb2_dma_contig_plane_dma_addr(dst_buf, 0) +
>  =09=09=09=09ctx->vpu_dst_fmt->header_size,
>  =09=09=09   H1_REG_ADDR_OUTPUT_STREAM);
> -=09vepu_write_relaxed(vpu, size_left, H1_REG_STR_BUF_LIMIT);
> +=09/*
> +=09 * The limit is in 64-bit words. The encoder finishes a 64-byte burst
> +=09 * it has started (measured on the RK3026), so give it whole bursts.
> +=09 */
> +=09vepu_write_relaxed(vpu, round_down(size_left, 64) / 8,
> +=09=09=09   H1_REG_STR_BUF_LIMIT);

Its safe to apply to rockchip_vpu2_hw_mpeg2_dec.c, I'll test it for you.

Nicolas

> =20
>  =09if (pix_fmt->num_planes =3D=3D 1) {
>  =09=09src[0] =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);

--=-/pZ7QRKaT58RrTydTrIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawSsXwAKCRDZQZRRKWBy
9HNIAQC1AkHZ6E5OyxDSWJREMVm1CeMIoPq3mhZfx4yRWXyUQQEA8Mtv0S6aS9JT
HeguwlOq2Yfa54g5tPNoGKDwqB5fCw4=
=eW1k
-----END PGP SIGNATURE-----

--=-/pZ7QRKaT58RrTydTrIs--

