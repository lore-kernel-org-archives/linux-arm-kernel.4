Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA69606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VrASV3Kj;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YeYL+y8S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ygKYZry/mgTJ8Ux3xVDDIBzUq7PHZRHgltKgNh3f8Dk=; b=VrASV3Kjy2/YYGKK3gtK/y/eaB
	SuyJIOT39yetyVaULZtFTf8/l4gkIvDzZYAdaIiJ9Jz7fVexQ2fkfbOil0yTuvPnX3jnvlRlZ0I+r
	jhMRyGglXU5uJJnELVtAREbklFatzj2sbqQUx7m+kpSZtlXhQUA+wt7GgnQ1uuYGQBPM0DTBZs0c1
	kHH5ps9lv9Tk/2m2BBdBSoo+sxcX+Wu+aRGX+VgUFJx0y5gFJ52NGiEq/kiUu+jScwTAGImlqwFoY
	LXI/7ZR0XPE/HwjeMvNFtkUEKAfypgx+mGHf9qxDoFa6QRviB6YznccMsK5/Jhvti2ILm3KkHiNVg
	dr6tN3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQrx-000000078vJ-0NuG;
	Tue, 17 Nov 2026 21:37:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQrt-000000078uc-2LqY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794951451;
	bh=ygKYZry/mgTJ8Ux3xVDDIBzUq7PHZRHgltKgNh3f8Dk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YeYL+y8SX0DkRGM6v9vLMmoWcwtW56CzTuoynO304mG8A51GWEs7VMRXqjsJfiT4A
	 RG4cjK66UJ77m2sFCTrHJK6RX11LvOuYSpuU15CbSzXjzYFt7A+wABCLqj8vD+aJce
	 67WftusWpAkqPM56lmKDwmAcVkL01YIfjF4sh/BP7QDyF7HP4Y0VXPuhq5FPEjZqNn
	 DZpCyaRHVZGVlqN5DiDmq9uac6evGRTjETHaU9okAnxY2I+BEFBR/l1/o7a4dfKgM8
	 A3hXbP0sOWGmlje0ErQV8RewM+9YVMXXiPzYPmiSS0zt7HV2YRYLIDbgn38hvDBS0f
	 vLVjBi7O3jY6A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 60A3917E0060;
	Tue, 17 Nov 2026 22:37:29 +0100 (CET)
Message-ID: <a76b1b218499f3291e7002c88543a2a5b6d80b35.camel@collabora.com>
Subject: Re: [PATCH 04/14] media: h264: Add stateless encode core
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
Date: Tue, 17 Nov 2026 16:37:28 -0500
In-Reply-To: <20260522101653.2565125-5-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-5-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-2P2I9QJtqzO7EfgJcWa+"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_133734_989328_3C353CF8 
X-CRM114-Status: GOOD (  16.77  )
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

--=-2P2I9QJtqzO7EfgJcWa+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> The H.264 stateless encode core is the common implementation called by
> drivers to coordinate stateless encoding. It provides all the relevant
> configuration parameters to drivers, through a state mechanism.
>=20
> States are built from controls (some of which are optional) with various
> inter-control checks along the way. A state can be constrained by the
> driver through a dedicated operation callback in order to disable
> unsupported features that may have been requested by userspace.
> The general philosophy is to adapt parameters provided by userspace to
> reach a state that can be handled by the hardware and bail out if no
> such accommodation can be made.
>=20
> Adapted parameters are returned to userspace by updating the controls.
> This is currently not attached to the inbound media request but should
> be when support for it becomes available.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>=20

Nice idea.

> +
> +static void state_debug(struct v4l2_h264_enc *enc)
> +{
> +=09struct v4l2_h264_enc_state *state =3D &enc->state_active;
> +=09struct v4l2_ctrl_h264_sps *sps =3D &state->sps;
> +=09struct v4l2_ctrl_h264_pps *pps =3D &state->pps;
> +=09struct v4l2_ctrl_h264_encode_params *encode =3D &state->encode;
> +
> +=09pr_debug("+ v4l2-h264-enc: state");

Imagine you get two of these concurrently tracing, it will be hard to see w=
hat
is what, consider combining like we do for ref list.

Nicolas

--=-2P2I9QJtqzO7EfgJcWa+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzJGAAKCRDZQZRRKWBy
9PbjAP4ttGXHg2EkS1E5U7RZSbVfuNggh9s1884q2eh4ebMppwD7BUpl0tXn5dOK
UJls3iR5RZGcFTO9/LhVB2lmk8gWEgQ=
=ahIs
-----END PGP SIGNATURE-----

--=-2P2I9QJtqzO7EfgJcWa+--

