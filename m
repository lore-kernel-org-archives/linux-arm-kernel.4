Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866C2606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IWXzgV2g;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lPt5x4V8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HtvTu/64ettxzPxkBEvKYZ34ZkkbT9fHPhc3+fZwto0=; b=IWXzgV2gqfqfxY7u+kZkwuRqxC
	Y/UElJ1iHfXscaR7nJHo1KeztTFk793dOoPmdekVres90621ySh9AjpX1d7+Wgsb1k2GEbjfa01tY
	tX5w6FDEDTmX+vDpctiFp0RwFB5QonwrCNJ2ZvC3YW+wV8TlnY2lvLdnN28MDQ9dl9wT6N2EZtEY4
	d95zHWbm1ntJssLzxcVjbvaFi52u7JKWdgyKMxiLHfugqg0DjqwYFSSpP00siibyK00Buobl12HRh
	/W8i8pRcoEoAj4cmtJMjodSAUFZGhM29LgkMv9GgOxR0wZ9T2xx5L7IKUNySjGxOk0lxseDasWcvW
	GSBjrLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQNa-000000074qd-2kWv;
	Tue, 17 Nov 2026 21:06:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQNX-000000074q7-3ycx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794949568;
	bh=ZbD9FwnOoOQeC1E98ztkUVdqmp6pvxce5xq0Ue6S3KI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lPt5x4V8aOdwRhqhcsDubH/sIdh16mL5AfebH6UXaLc0JLoXVC8nRITRN13oIAWY3
	 7uDhKnSgX2PuuxE3eu13N/Zx+Aiga+bMWqZkOuU79rBaowHCmRlHq7bBK0zAn9agDx
	 QGLrFsQArkBXg0+a+m60QhqsnDzF3K68nJC0/VbgSTe1Fdsz9V4dq2JdaYlqEq6TWn
	 Y9qFBx5/BCgkh0UVlw38/SFJZqG/+TA+8J6f4JL6XpzuGZja9RJfnyxlGX5iO6Qsvs
	 ZUAVE0t6WLoMFxeWICZsswSsBSiCaWLXe3lulXfk8UpUmfLaOV4rsorZ8QbvMPcMt1
	 iXs9Fa99mEUOg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8B0C17E05D6;
	Tue, 17 Nov 2026 22:06:06 +0100 (CET)
Message-ID: <760e33e8de1f139be7dba2270313c80aeb53c1d3.camel@collabora.com>
Subject: Re: [PATCH 01/14] media: h264: Add a more generic reflist builder
 init
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, Michael
 Tretter	 <m.tretter@pengutronix.de>
Date: Tue, 17 Nov 2026 16:06:05 -0500
In-Reply-To: <20260522101653.2565125-2-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-2-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-ZjSFNpEuHw1qtBTWERh5"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_130612_178929_CEC7DBD1 
X-CRM114-Status: GOOD (  19.22  )
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

--=-ZjSFNpEuHw1qtBTWERh5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> This should become part of a larger reflist builder rework.

Maybe a tiny bit more meet would help? What am I reviewing, what is this ne=
w
builder used for?
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/media/v4l2-core/v4l2-h264.c | 69 +++++++++++++++++++++++++++++
>  include/media/v4l2-h264.h           |  7 +++
>  2 files changed, 76 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-cor=
e/v4l2-h264.c
> index c00197d095e7..4e5a177ca2c7 100644
> --- a/drivers/media/v4l2-core/v4l2-h264.c
> +++ b/drivers/media/v4l2-core/v4l2-h264.c
> @@ -105,6 +105,75 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_refl=
ist_builder *b,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_h264_init_reflist_builder);
> =20
> +void
> +v4l2_h264_init_reflist_builder_gen(struct v4l2_h264_reflist_builder *b,
> +=09=09const struct v4l2_ctrl_h264_sps *sps,
> +=09=09const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES],
> +=09=09unsigned int pic_order_count, unsigned int frame_num, unsigned int=
 fields)

Add a doc comment.

> +{
> +=09int cur_frame_num, max_frame_num;
> +=09unsigned int i;
> +
> +=09max_frame_num =3D 1 << (sps->log2_max_frame_num_minus4 + 4);
> +=09cur_frame_num =3D frame_num;
> +
> +=09memset(b, 0, sizeof(*b));
> +=09b->cur_pic_order_count =3D pic_order_count;
> +=09b->cur_pic_fields =3D fields;
> +
> +=09for (i =3D 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
> +=09=09if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> +=09=09=09continue;
> +
> +=09=09if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
> +=09=09=09b->refs[i].longterm =3D true;
> +
> +=09=09/*
> +=09=09 * Handle frame_num wraparound as described in section
> +=09=09 * '8.2.4.1 Decoding process for picture numbers' of the spec.
> +=09=09 * For long term references, frame_num is set to
> +=09=09 * long_term_frame_idx which requires no wrapping.
> +=09=09 */
> +=09=09if (!b->refs[i].longterm && dpb[i].frame_num > cur_frame_num)
> +=09=09=09b->refs[i].frame_num =3D (int)dpb[i].frame_num -
> +=09=09=09=09=09       max_frame_num;
> +=09=09else
> +=09=09=09b->refs[i].frame_num =3D dpb[i].frame_num;
> +
> +=09=09b->refs[i].top_field_order_cnt =3D dpb[i].top_field_order_cnt;
> +=09=09b->refs[i].bottom_field_order_cnt =3D dpb[i].bottom_field_order_cn=
t;
> +
> +=09=09if (b->cur_pic_fields =3D=3D V4L2_H264_FRAME_REF) {
> +=09=09=09u8 fields =3D V4L2_H264_FRAME_REF;
> +
> +=09=09=09b->unordered_reflist[b->num_valid].index =3D i;
> +=09=09=09b->unordered_reflist[b->num_valid].fields =3D fields;
> +=09=09=09b->num_valid++;
> +=09=09=09continue;
> +=09=09}
> +
> +=09=09if (dpb[i].fields & V4L2_H264_TOP_FIELD_REF) {
> +=09=09=09u8 fields =3D V4L2_H264_TOP_FIELD_REF;
> +
> +=09=09=09b->unordered_reflist[b->num_valid].index =3D i;
> +=09=09=09b->unordered_reflist[b->num_valid].fields =3D fields;
> +=09=09=09b->num_valid++;
> +=09=09}
> +
> +=09=09if (dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF) {
> +=09=09=09u8 fields =3D V4L2_H264_BOTTOM_FIELD_REF;
> +
> +=09=09=09b->unordered_reflist[b->num_valid].index =3D i;
> +=09=09=09b->unordered_reflist[b->num_valid].fields =3D fields;
> +=09=09=09b->num_valid++;
> +=09=09}
> +=09}
> +
> +=09for (i =3D b->num_valid; i < ARRAY_SIZE(b->unordered_reflist); i++)
> +=09=09b->unordered_reflist[i].index =3D i;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_h264_init_reflist_builder_gen);
> +
>  static s32 v4l2_h264_get_poc(const struct v4l2_h264_reflist_builder *b,
>  =09=09=09     const struct v4l2_h264_reference *ref)
>  {
> diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
> index 0d9eaa956123..1833c0556963 100644
> --- a/include/media/v4l2-h264.h
> +++ b/include/media/v4l2-h264.h
> @@ -42,6 +42,7 @@ struct v4l2_h264_reflist_builder {
>  =09u8 cur_pic_fields;
> =20
>  =09struct v4l2_h264_reference unordered_reflist[V4L2_H264_REF_LIST_LEN];
> +=09/* FIXME: confusing with valid flag (active is checked). Proper termi=
nology is "used" */

Just drop a patch before that rename it?

>  =09u8 num_valid;

>  };
> =20
> @@ -51,6 +52,12 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflis=
t_builder *b,
>  =09=09const struct v4l2_ctrl_h264_sps *sps,
>  =09=09const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES]);
> =20
> +void
> +v4l2_h264_init_reflist_builder_gen(struct v4l2_h264_reflist_builder *b,
> +=09=09const struct v4l2_ctrl_h264_sps *sps,
> +=09=09const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES],
> +=09=09unsigned int pic_order_count, unsigned int frame_num, unsigned int=
 fields);
> +
>  /**
>   * v4l2_h264_build_b_ref_lists() - Build the B0/B1 reference lists
>   *

--=-ZjSFNpEuHw1qtBTWERh5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzBvQAKCRDZQZRRKWBy
9BtfAQDuX6YWkZlnq7Kl+f+bMXt1CF2vU/q45B92Be31HwQATAEAp6eHgUOWcmtf
VOnv8NvHgu6jahauAoGMYcbg1POycAE=
=uvaF
-----END PGP SIGNATURE-----

--=-ZjSFNpEuHw1qtBTWERh5--

