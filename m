Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E51606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ymhyGe4x;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bW1WtPPL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uOYZ3YUnApgAE+Wv9P1FnmCQYiPIee7XKpJASXihcf4=; b=ymhyGe4xNCe9H9YqdLNZVnR50C
	xOyg7jSlMsVy9ZQ/QKtasUv4KkL0GNDX1GmTvURplyGgcT32EMk8CtadpNhm5p3f/r3+SgTRQv4eJ
	BWUYhjmWlUaBjqu/s0gfK5Pe3EsqodOqUcRRYySgcoZKq6kgTeZpqotm9mCZZSqZCsiwUr8Nujw09
	a254z3B1/IwsMzsj04nblOc7m5AfuRzsUhgG8tB6TYm9mmQuvTeEOaac5gl3pbpn+TzeYgh/gsG0s
	xsAPLOS4JR2fJuEeJsq2VGLB3zHOiZ69L2/9lX6ag9p+sUEK1yc0CLiMeB/exXP/ZiBBidUIBCcdk
	tl9lHQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTR51-00000007AhI-0tMp;
	Tue, 17 Nov 2026 21:51:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTR4x-00000007Agw-45vt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794952261;
	bh=uOYZ3YUnApgAE+Wv9P1FnmCQYiPIee7XKpJASXihcf4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bW1WtPPLvbXoAYI3Ztps0gKSqqfIfW3pUSLErv0E8g8kaRAGtFdC9xepCppn68AFz
	 GTUTZXSICFEdDvY7Bxs++Ns1CjPqcjqYeFAJhg6Fdz6/L5Q8jlozmokrAVCaO4ix1k
	 4vGv74cipL6KA07OmJidjxGkTh1sPmCoCKj+XIHUITFn/onmTVshGAVXXaKH8Iourv
	 WIvRnzN9pa6GiCDqjV9JsWlGICiS0j1b3dVY5ls/LLFOxkTEg4h6Cr5VKaW8Ozmdku
	 mVW6NYKdNU04yzdFfAUwm2b/+hlo2yTIEmBQf5oJPSQZ5NLos3XygCViplSvrkhEXX
	 wwxP8dWnfZpRg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD5D717E02F2;
	Tue, 17 Nov 2026 22:50:59 +0100 (CET)
Message-ID: <632f258f80a3b20d6edda600772e95a5c7735735.camel@collabora.com>
Subject: Re: [PATCH 11/14] media: verisilicon: Add common encoder parm and
 frameintervals ioctls
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
Date: Tue, 17 Nov 2026 16:50:58 -0500
In-Reply-To: <20260522101653.2565125-12-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-12-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-31nN73e0jiIWmYgoHCNh"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_135104_421420_9A2C5610 
X-CRM114-Status: UNSURE (   9.12  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-31nN73e0jiIWmYgoHCNh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> This introduces the required encoder ioctls for configuring the
> frame rate (via the parm timeperframe field) and enumerating available
> frame rates (via enum_frameintervals) for the encoder.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Perhaps add a word or two about what it is used for (rate control right?).

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-31nN73e0jiIWmYgoHCNh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzMQgAKCRDZQZRRKWBy
9DylAQDgvmfKrtRkUANNPHiNDtUyH56zB5LxGC+9R+k4oMPkYQD+N5a2pBuwNnUX
LTCWo+50B8YJ+2lyaFgk6ENf7j4GEgM=
=X2W/
-----END PGP SIGNATURE-----

--=-31nN73e0jiIWmYgoHCNh--

