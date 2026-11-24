Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ED7606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 03:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tt0DqP5k;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=p7oOiQxe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DSQmc5aIPemsJni2zcoOjeC4l0Zh0uN0ZH3xEr2N/tQ=; b=Tt0DqP5kwgIu7GaAQyTnATYanR
	C8rc+5skTmhYwQR52jo4yi2AmAjFLQFlCZMKcU7z13Cy2KiAPzpB6mg+7wewtOzsvoPWivvJaCZA4
	dkcAn+sGt0yX5XVRimgkN8UNZfXdrlWwWsBh7Px6Ac8XL38DnlyJI6QWHp1cNN9GfJCE5KDSXmC90
	yaXGNCEjfXkFrRWlWzVwORLV5+GAltTrR588tKLYPEuf+KJqSY7Q0vs3MJ+XTGQxMicAvCZPoqtiH
	KsAzAmBPOGkQJgWtdVbINtUrAo5BHSib8L4cUIki42EynZtN/javfSwopd4IDbocguQN+KdQz6Xxx
	9ZQENClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhEB-00000005Qyd-3eeZ;
	Tue, 24 Nov 2026 03:29:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhE9-00000005QxS-10e3;
	Tue, 24 Nov 2026 03:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795490989;
	bh=K6CKNHBB/6nIByrcNlVLin6OSGcLyJKfs408k09+GIg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=p7oOiQxe6o5rSYcFmeTStXLatUrF0XkdFUsdgpV4wb3qosWtaYHXPHsRW0vmNcS+f
	 JvBB9GfaGU8odS0VNyG5XTn75ziLGACDZJ+IBE0JhraOn2rQXLz1SHYhNpzAalIRoo
	 AXgIx6oOeG0PJDoMb1cnQ5QFIIDxMpkCv+0SczREwur3fv/PXCVymBLrRWVAqIUEtZ
	 4nrvuh0x9Sj0F5ch44q4yd4yCJvV4G82CSLesKWMXbrAHmtfdSHk5uRVIzBPKjTrNO
	 4PEpDZSLnE7OjRMTOazrBdIyFiGPMGWUUQqeCrZzYivmYs/34CqywIOZMPEfY4cYXQ
	 XYsTcBsqaWVsw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BB8B17E0CD7;
	Tue, 24 Nov 2026 04:29:47 +0100 (CET)
Message-ID: <9c7ee6cfa9f4923756ce6355ec20fa8ac916b9ff.camel@collabora.com>
Subject: Re: [PATCH v7 1/3] media: verisilicon: AV1: Check reference frame
 index
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 22:29:45 -0500
In-Reply-To: <20261120143135.71134-2-benjamin.gaignard@collabora.com>
References: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
	 <20261120143135.71134-2-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-r0oKEOPZfbeMIZrTquJs"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_192953_553322_21D5B555 
X-CRM114-Status: GOOD (  16.33  )
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

--=-r0oKEOPZfbeMIZrTquJs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 15:31 +0100, Benjamin Gaignard a =C3=A9=
crit=C2=A0:
> Make sure that reference frame index is valid before using it.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
> ---
>  .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index 2a145433e6d1..5da59104a966 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -121,7 +121,12 @@ static int rockchip_vpu981_get_frame_index(struct ha=
ntro_ctx *ctx, int ref)
>  =09struct hantro_av1_dec_ctrls *ctrls =3D &av1_dec->ctrls;
>  =09const struct v4l2_ctrl_av1_frame *frame =3D ctrls->frame;
>  =09u64 timestamp;
> -=09int i, idx =3D frame->ref_frame_idx[ref];
> +=09int i, idx;
> +
> +=09if (ref < 0 || ref >=3D V4L2_AV1_REFS_PER_FRAME)
> +=09=09return AV1_INVALID_IDX;
> +
> +=09idx =3D frame->ref_frame_idx[ref];
> =20
>  =09if (idx >=3D V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
>  =09=09return AV1_INVALID_IDX;
> @@ -1262,6 +1267,10 @@ static void rockchip_vpu981_av1_dec_set_prob(struc=
t hantro_ctx *ctx)
>  =09=09rockchip_av1_default_coeff_probs(quantization->base_q_idx,
>  =09=09=09=09=09=09 av1_dec->cdfs);
>  =09} else {
> +=09=09if (frame->primary_ref_frame < 0 ||
> +=09=09    frame->primary_ref_frame >=3D V4L2_AV1_REFS_PER_FRAME)
> +=09=09=09return;

Just returning does not abort dec_run() and will lead to triggering the HW =
with
partially initialized data. Either this should lead to some default cdf to =
be
picked, or we add a return value and check it in dec_run().

May I propose to validate these once once in prepare_run()?

> +
>  =09=09rockchip_av1_get_cdfs(ctx, frame->ref_frame_idx[frame->primary_ref=
_frame]);

Here, the index passed to get_cdfs() is not validated and will lead to out =
of
band indexing inside that function..


>  =09}
>  =09rockchip_av1_store_cdfs(ctx, frame->refresh_frame_flags);

--=-r0oKEOPZfbeMIZrTquJs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawUEqQAKCRDZQZRRKWBy
9BS7AP9tpWvgllrDuIS5S+xmIBzE4BP7i354pNZrwWjzbuk+6gEAvmQgQPNwLXRA
b84TQfLz4hIl4nxameVuX0K8ikoZAQA=
=zmP1
-----END PGP SIGNATURE-----

--=-r0oKEOPZfbeMIZrTquJs--

