Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD78606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OcgCmofG;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=mMXpdOlM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=paD3giawAZujBoqv5ue/Jl1Wh+BLkhbSiFjUwhhSpUw=; b=OcgCmofGChla21wW/SikVJHLPL
	vVBzukcbLBu9bUsIlbcIdZrKJjOWxc4E/jaDwdf9tyYk4e+VF4sl9ReI7OR80Bze+cYlNJziiC0pX
	A8SRV4bLeqsPF0h44I0lmgRIKg828Ne3vn6o3gticBHwmDL7HWxVH4I2GueaEqeI1Er+VODnngh/j
	b7lrTast9+PpNQRyGmLqneXjF5yrY1V58LdQZLvSjRAy/+1wjDbZgNXvxQME00mTvLimKSQBURqDv
	+rP1/dzEZLQhmon4fNxja1V0klpeI1ilcLzqyjgfdI0R1fDSMpnHHW0xRJDMB9SQlNltWVtsGwZYJ
	1XDBnIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXYS-0000000AZb2-0VGG;
	Thu, 12 Nov 2026 16:21:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXYJ-0000000AZaN-0Ivs;
	Thu, 12 Nov 2026 16:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794500488;
	bh=Ao2ebABVG7bIWgifXwZ2GE6bCC2jlMMyNANj8xegV0g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mMXpdOlMeOui3VQvSpNSxi6Y8USsb1d7lkdvAS936fBLcQ7WDcJHU2oixmSN0sDKw
	 uvuj8P5m5AmQ+Pq7xLiDql/0bTZ9kskSnBlIa1oDzQcJCrEFKv6gmLKjxybRfEh8IN
	 BtceEvLuWt0GztCfcu1DgA7i+AL1Fs7AJwzV1uRr7FvhurjCNKdxw+BUsvBagUd/KP
	 iayK2JI8IIOK0RNOZ9OnZ4A7DlRdWPl1GUH33JmL2iGukCOZxPbh+7t0KGZSa3a7qJ
	 3uMb8p1VCVmAX3RAP/m3iNyR5Qnq8JR5xPyW4o0uUvV9cd1LDdobjWN7I2rPAtJ0D1
	 lXSpY93fPC8BA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA1BF17E0564;
	Thu, 12 Nov 2026 17:21:26 +0100 (CET)
Message-ID: <41affe4b832c2625a2bdcbdc26f221dcb17f475d.camel@collabora.com>
Subject: Re: [PATCH v12 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: zhentao.guo@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl	 <martin.blumenstingl@googlemail.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Date: Thu, 12 Nov 2026 11:21:24 -0500
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
	 <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
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
	protocol="application/pgp-signature"; boundary="=-leqE8XX8WzE8OR9XUYh7"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_082132_900663_34311978 
X-CRM114-Status: GOOD (  13.63  )
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

--=-leqE8XX8WzE8OR9XUYh7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 22 octobre 2026 =C3=A0 13:26 +0800, Zhentao Guo via B4 Relay a =C3=
=A9crit=C2=A0:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
>=20
> Add SM_LOAD_VIDEO_FW to the secure monitor command enum
> to allow decoder drivers to load firmware through the meson_sm
> interface.
>=20
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>

Any feedback from firmware/meson maintainers already ? Wouldn't this be bet=
ter
as its own patchset and documented as dependency ? Both ways work, but
understand that I cannot take your patches until these are in Linus tree (w=
on't
build). This comments applies to patch 1/2, please coordinate and let us kn=
ow
what is the plan.

Nicolas

> ---
>  include/linux/firmware/meson/meson_sm.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firm=
ware/meson/meson_sm.h
> index 3ebc2bd9a976..3b90b49d0552 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -15,6 +15,7 @@ enum {
>  =09SM_THERMAL_CALIB_READ,
>  =09SM_A1_PWRC_SET,
>  =09SM_A1_PWRC_GET,
> +=09SM_LOAD_VIDEO_FW,
>  };
> =20
>  struct meson_sm_firmware;

--=-leqE8XX8WzE8OR9XUYh7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavXnhQAKCRDZQZRRKWBy
9BwSAQDf3YOlhQDwjAbF/BDv7D+x2Ha2oYxmTkfeKr8mVfUl5AEAihCoYfjm9qiJ
KlkdjP3Jv2cYRwg7V0yeMnfijjyDCw4=
=eTMH
-----END PGP SIGNATURE-----

--=-leqE8XX8WzE8OR9XUYh7--

