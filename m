Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84600606A8AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SwYtag9B;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=a3DKxnkR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ghluR7i9/C+zU+eHJHeCwRmCECyLWGQeA4SlOQA11Y0=; b=SwYtag9BAhgLiKoCf+PNWa+Qz3
	zIkBwvSApnVZBnooWRz+AuZqfV0UdrGKM2MbV9waGpyqLejNaGkvT7BrivuknWYJR0SmCC8NZ6+5D
	bRrmIk2KsGLpX0rz2M4ZL9Unz7oB1iEMIsKtqVdarymqpMaQcNJ30GGfDpGIroi88Fru4gRVR+oVt
	DcWBAot7vBF5MwgqZos1Wqg3ZrxCafHQvfhOjNO3ZKCP4+fvRX1FVYD+BuaA08E76Dsdp3D5n8yjU
	lR+yhGtUKwRf11R7waOhweuHiFX5yP291uQzbRJeoAoFkGfmXvZuLnJcaKi9Px/MC6OLxhuZGEQEh
	ePAvXpYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxBE-00000002iuy-0fqN;
	Mon, 16 Nov 2026 13:55:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxB9-00000002ire-1LJ4;
	Mon, 16 Nov 2026 13:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794837325;
	bh=ghluR7i9/C+zU+eHJHeCwRmCECyLWGQeA4SlOQA11Y0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=a3DKxnkR1Q1qj6KV+pK7Us06htu6gNTdaWGefd4zD4iuCbRz1xop20knDeuTKh8Bz
	 /31o5d74BX+bOJxahE4DQ3QxK3SzDWZ6T51RkPWMMufcL20rB4kIvkRO65+xb3zT1X
	 Jsm7BVhzvGVrKI09ra5UpY8pK2I1eUI8+94r6uoZUCW5zqEmm8uD67xUurhn0qxVvx
	 IywvAr7ntsvj4rG006U4uf5ga5ozbt3HueinT+dg9oNtFRgcTn3daxAprpZCqVJ+O5
	 ULgejIxh1cK/iDOgufczfTafzXv5t8TzmA7PYtixaK1S2wktoKSCk+VgCv7hN1eboZ
	 XeRDO/mOl861w==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 403E317E0060;
	Mon, 16 Nov 2026 14:55:23 +0100 (CET)
Message-ID: <4a641af1f6cb3cf632cd5cacd33f1e8cc98f98ed.camel@collabora.com>
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for S4
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Zhentao Guo <zhentao.guo@amlogic.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet	 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski	
 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 08:55:22 -0500
In-Reply-To: <b4ad7333-28f8-43bb-84a6-5b53ab884a06@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
	 <b2999c2fe5193eac3ebb0796f3de44710e993200.camel@collabora.com>
	 <b4ad7333-28f8-43bb-84a6-5b53ab884a06@amlogic.com>
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
	protocol="application/pgp-signature"; boundary="=-RSQOZvFxXRVtAXxCbLtR"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_055527_513208_78065D69 
X-CRM114-Status: GOOD (  12.71  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-RSQOZvFxXRVtAXxCbLtR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zhentao,

Le lundi 16 novembre 2026 =C3=A0 15:48 +0800, Zhentao Guo a =C3=A9crit=C2=
=A0:
> > I don't know them all, but at least this one, and CVMA1_Sony_D do not c=
ontain
> > field coded macroblocks, and should decode fine without the interlaced =
reference
> > list. We've seen a lot of artifically limited decoder like yours output=
 90/135.
>=20
> I checked the CVMA1_Sony_D=C2=A0with my bitstream analyzer, I found, for=
=20
> example, in frame 0, MB 320x192 is coded into field top, MB 640x176 is=
=20
> coded into=C2=A0field bottom, anda few more field-coded macroblocks in fr=
ame=20
> 0 or other frames.
>=20
> That said, the interlaced feature is already done. My latest self-test=
=20
> results with Fluster are:
>=20
> JVT-AVC_V1 Ran 130/135 tests successfully in 101.885 secs (ran with -j3)
>=20
> Do you suggest me to add the interlaced support in the next version?I'd=
=20
> really appreciate your suggestions.

Yes, please. The is no profile to separate that feature, so I think its bes=
t to
just include it now, have H.264 complete and then we can truly focus on the
other codecs in follow-up.

Nicolas

--=-RSQOZvFxXRVtAXxCbLtR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavsLSgAKCRDZQZRRKWBy
9NpVAQDKUmYBU389SJKLAsDu2/9y6RqTXzUAfKwQef9tAxWnOgEAhu33expVz0Cd
3Cl50rQ00mB3q8fG7v9GCSSrssj/gwg=
=YrdE
-----END PGP SIGNATURE-----

--=-RSQOZvFxXRVtAXxCbLtR--

