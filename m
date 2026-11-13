Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2D3606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N5rjjcD7;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YBoZvUPk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rz93IMDAkHoneXiIeX0ZJ9Q/dVSLcFMM1YZN4Bp5kW0=; b=N5rjjcD7ujU0QOmqrfluD3k8vI
	n52y08K/xB/AWqyzZCp1xzzm6unXi/KoXV0gHKLFe7hJYwE4Htu3qvl6JNl2fxMbUykSc3pTeH3/y
	wuhGOCAWAdk9cBmhVolUSekRdvQwg1VD0RP8YwCEdqReyNGtpT/T3FbQcIXgsnsez+ADnoVQGgm1v
	TQ39//lRUcXsZ7j+XxaeXBAH8ykfAzZ/U6MpORpjSGif7IZyeX/HLD9b7wbUhfXymU493TJVMobyy
	LuxmxVuksLhlOhtiLOnd8QqIRGg5U92+OY7l4R9vPs1RBz7jHsk096bUUiZrOPehpuTR5kryAvsF0
	wnK6ZQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRt73-0000000DNto-2C2d;
	Fri, 13 Nov 2026 15:22:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRt6u-0000000DNoT-1Ohj;
	Fri, 13 Nov 2026 15:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794583354;
	bh=rz93IMDAkHoneXiIeX0ZJ9Q/dVSLcFMM1YZN4Bp5kW0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YBoZvUPk40k3teW4EFPC67/Pk8FMm0DK4dgcs+Q6a2DuiZHDVBEXntia0TjKrhhqr
	 HNQf7O+ht8pudGMxNIlqNkL78eMsysTUc1zxAemoAK/lq1fmWV+8pXwn65JYPlSut/
	 28Vvl1pyvOrKQkZijZwmqE0qoEqMux1BmnCndEBTpA25aW0weeTWm7n1RjcJX6l9SD
	 WRqq7VGTypmO+k4oMWd/fDqD+SVH1YQXRBYhKhqqySCggMa+m3tKgZxJK40njnKmVK
	 WFdYmd82paxEln//e2tFEpvRevPqPIX7NEhYgeg8Rs2Dq0vAQ+uRNac0DUsEatsaB/
	 vDINaFvwkeskw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BADC17E0840;
	Fri, 13 Nov 2026 16:22:32 +0100 (CET)
Message-ID: <f8d5854825dccb39741565057d460bb4723db431.camel@collabora.com>
Subject: Re: [PATCH v2 3/6] media: verisilicon: Don't offer VP8 above 1080p
 on the Rockchip VDPU2
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>, Heiko Stuebner	 <heiko@sntech.de>, Boris Brezillon
 <boris.brezillon@collabora.com>, Jonas Karlman <jonas@kwiboo.se>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Jeffy Chen	
 <jeffy.chen@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 13 Nov 2026 10:22:30 -0500
In-Reply-To: <CAEy9hNVSC7TAvdLmN-yWH9NdtKH9jgVnyxFwLJ+J2qPZvOQTEA@mail.gmail.com>
References: <20261112-hantro-codec-fixes-v2-0-f44424df585b@gmail.com>
	 <20261112-hantro-codec-fixes-v2-3-f44424df585b@gmail.com>
	 <f041c5d87698ab3be8283ecc71ead0679327238e.camel@collabora.com>
	 <CAEy9hNVSC7TAvdLmN-yWH9NdtKH9jgVnyxFwLJ+J2qPZvOQTEA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-4yY0KbJj6xKjU43niVpD"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_072244_389089_52D4E149 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

--=-4yY0KbJj6xKjU43niVpD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 13 novembre 2026 =C3=A0 00:00 -0800, Arun Iyengar a =C3=A9crit=
=C2=A0:
> I have no i.MX8M board to check what the VP8 limit is there, so I left
> those tables alone for now. I will take a look at getting a patch for
> this separately.

Ack, separate, later is fine with me.

Nicolas

--=-4yY0KbJj6xKjU43niVpD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavcrNgAKCRDZQZRRKWBy
9GVEAP4zxrBESO8Pzt4btrBZoJ14BJWUThjkW8et96mAQvSCSwEAncpAf7voMdI4
UXfw4UP7YYzkRt17Wyp01B6gYeYhWwI=
=L8JS
-----END PGP SIGNATURE-----

--=-4yY0KbJj6xKjU43niVpD--

