Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49941606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 21:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yA/zz2rD;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bUeatrqE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2B5oJvmSQj/uLvDSVbb038rz/I+fF454frE8nhawMRc=; b=yA/zz2rD4MfHMzuSMNOHlrsIGr
	+Imq1VlbhIa5RHwFYGKvsS8KP1dtMzVUiE0XvDvRZ46MwvPSdvvmCv64/AXsGD6PawZVJEdH40kst
	/L0ZTqFARnZIEnJyV4jKNY2uNMR13TIlGkGskOwdtHUNq8LPFXkiUGTFYN2rFmoWOIxhokc5acL0z
	bpZkgsCAYm575K7xHRDA88PKpLqxNKIzjyzJGREIdjcx9nIOiDKyBEKPSaL7e4utybtD6SA6kLSAH
	HvtDw/0mwAYrHj8URlihzlkyhjrDZAPg1biveUhcj103CFiZ41zqpGjyqeu/kV86KCKu1+Z3qN2d2
	amfFZA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9wk-0000000DVRJ-2s7c;
	Thu, 19 Nov 2026 21:45:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9wg-0000000DVQp-45DL;
	Thu, 19 Nov 2026 21:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795124728;
	bh=qWrn0xVdylPSfFkj1g2JFpd2zWe+c98phSaOjNlvRvg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bUeatrqEEzqiXVtOvzacLan37HwzC6db6JqRsmwDkTUkVSRoZT8UQsF4Pbg1hD7v3
	 xCi6tfisi0UkR4k/JzY5G7CdJ0uFfl4TNAtBa1hbmyBarDoq1+e5qxTd1m/34sdKqb
	 Qbm1cP5H9JVUp4GClTINNoLNKZD0c8W7e4fgqUBNxn+PaaXCbY1xU2XEf8qVJGGZN/
	 /IvE/PVq100GkIuRkN2RHTuqEdkJpnTn1BdpVc32KJ4NOb+pRKOykjS9t4ctddwskb
	 pBS8m+67VA+3/beOw+qxIy+tonf6jZnPi07bU3Gt59RTDG/C03covc9n2USyECJP+h
	 172Y0qY5UzqNA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1571C17E0480;
	Thu, 19 Nov 2026 22:45:26 +0100 (CET)
Message-ID: <3611eee93f6d48bbe7de642abd238c7da147eaa2.camel@collabora.com>
Subject: Re: [PATCH v6] media: verisilicon: Create AV1 helper library
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Date: Thu, 19 Nov 2026 16:45:25 -0500
In-Reply-To: <ac588bfc-94f3-4ad7-9808-92ea0db1d017@collabora.com>
References: <20260910092021.139970-1-benjamin.gaignard@collabora.com>
	 <ac588bfc-94f3-4ad7-9808-92ea0db1d017@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-Dg5vUNNPaPxbWQnJXS5h"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_134531_197539_64CA0100 
X-CRM114-Status: GOOD (  10.99  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-Dg5vUNNPaPxbWQnJXS5h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 16 novembre 2026 =C3=A0 14:33 +0100, Benjamin Gaignard a =C3=A9cri=
t=C2=A0:
> Le 10/09/2026 =C3=A0 11:20, Benjamin Gaignard a =C3=A9crit=C2=A0:
> > Regroup all none hardware related AV1 functions into a helper library.
> > The goal is to avoid code duplication for future AV1 codecs.
> >=20
> > Tested on rock 5b board Fluster score remains the same 204/241.
> >=20
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> Gentle ping on this patch.

Nice ping, but it does not apply. I've manually applied it, but will leave =
to
you to retest.

https://gitlab.freedesktop.org/linux-media/users/ndufresne/-/commit/c98580a=
49562a26d2cfc11fc0eb88e6e75f329d8

While doing so I notice few hidden changes:

rockchip_vpu981_av1_dec_luma_size -> hantro_av1_luma_size:

-=09return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
+=09return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.height;


Change is really good, and it allows for padding, but totally undocumented,=
 and
would be better placed in its own commit. And then couple of bound check, w=
hich:


int hantro_av1_get_frame_index(struct hantro_ctx *ctx, int ref):
+=09if (ref < 0 || ref >=3D V4L2_AV1_REFS_PER_FRAME)
+=09=09return AV1_INVALID_IDX;

void hantro_av1_set_prob(struct hantro_ctx *ctx):
 =09} else {
+=09=09if (frame->primary_ref_frame < 0 ||
+=09=09    frame->primary_ref_frame >=3D V4L2_AV1_REFS_PER_FRAME)
+=09=09=09return;


These should clearly be prepend patches with Fixes tag for backport, and no=
t
hidden in the rework. Looking for your v7.

Nicolas

--=-Dg5vUNNPaPxbWQnJXS5h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9t9QAKCRDZQZRRKWBy
9CM/AQCgYjUXpp9ak9su9niYjM75+PBdrqkoOLdBR1tzshrL7gEAvsCwrMGVV+Ln
l/ilaftJcZE6qkNjcFU3b6foC2Y9Ags=
=wAiv
-----END PGP SIGNATURE-----

--=-Dg5vUNNPaPxbWQnJXS5h--

