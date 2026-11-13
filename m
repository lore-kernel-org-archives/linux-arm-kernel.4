Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7CB606F707
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hq2pDdyA;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AejoD/JD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vBhwvnJwnGkD1bnGzWjsQ07Q3jEMP9wwPRehR7yowkU=; b=Hq2pDdyA4RxvpRmoPklDNBSdXG
	7j0VJvFCxJkF9XWGsH1uPZGH0L+7Qc/EdhHXH+Vz6OR0ui5QpoBDcVINYyrGHHyQPbYUtBe+coJQS
	ZfopJZj+9tAAN2OLbFr5be+KGXQunhQ5IYXMYXoCQqt4sJcfuTRT6LfL0aqtuwyp25RIqgWTAlxKl
	y+oCO0pDxhQjwjYhHniZWrRU+YmvHVIQXODKXjA94OgXObi17WVkbUj4w/izdpAoZBpWU4wRSXjLe
	NJhUDMcM4Rh+bJtjISZr2bxDiN7A298QWMAvSzMEq9byMyr6stJV75j8Pvf+eOyZsd2zTwOd7XHbQ
	5F3iX4uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRv5L-0000000DkFN-0Smd;
	Fri, 13 Nov 2026 17:29:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRv5I-0000000DkEi-33jH;
	Fri, 13 Nov 2026 17:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794590946;
	bh=vBhwvnJwnGkD1bnGzWjsQ07Q3jEMP9wwPRehR7yowkU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AejoD/JDjkToIWQiFRpmdMjB5o5Ebnp4DTGINsotDpycE2//JGqe68DRdgkmUOFvT
	 HaEx1jaGfhcD4LWL7zJDHE40LqDKXD5nusxhqINjW9b1KWPzLf/U+m7yC38cnIcNjp
	 L+IDGtMOKf0Yb1mY3g8SCzdbTliiRMz/B4binh4sWmYBp2oHFiNcXkmqq/dcPgPjtz
	 3+S91Mq8JKXEqYTCiaOnULObQ/dLWTHZdrHKI64Qv4zhar8O9FyNczcE4k82NlKtop
	 yLC5Fggr21g1QSNN/46q7Au6xg+DZevA5WYuBhcpSUd54h9hy2Z5zMVuSnA3nvKig/
	 ker449JmvX29g==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75E9717E0818;
	Fri, 13 Nov 2026 18:29:03 +0100 (CET)
Message-ID: <7691572c6787c3808296094fb97212979c3fb3b9.camel@collabora.com>
Subject: Re: [PATCH v3 02/12] media: verisilicon: Check the match data in
 hantro_probe()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring	 <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Nicolas Frattaroli
	 <frattaroli.nicolas@gmail.com>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>,  Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Hans Verkuil <hverkuil@kernel.org>, Jernej
 Skrabec	 <jernej.skrabec@gmail.com>, "Joerg Roedel (AMD)"
 <joro@8bytes.org>, Will Deacon	 <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, iommu@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sergei
 Khomenkov <shomenkow@gmail.com>, Tharit Tangkijwanichakul
 <tharitt97@gmail.com>, Sascha Hauer	 <s.hauer@pengutronix.de>
Date: Fri, 13 Nov 2026 12:29:01 -0500
In-Reply-To: <20261113-hantro-robust-v3-2-82383c722ad2@gmail.com>
References: <20261113-hantro-robust-v3-0-82383c722ad2@gmail.com>
	 <20261113-hantro-robust-v3-2-82383c722ad2@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-Pk9ID3Lh5PcmffxfFbdz"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_092908_969481_601EA2DE 
X-CRM114-Status: UNSURE (   8.91  )
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

--=-Pk9ID3Lh5PcmffxfFbdz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 13 novembre 2026 =C3=A0 16:40 +0000, Arun Iyengar via B4 Relay =
a =C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> A device bound through driver_override may have no OF match, and
> hantro_probe() then dereferences a NULL match. Use
> device_get_match_data() and fail with -ENODEV without match data.
>=20
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-Pk9ID3Lh5PcmffxfFbdz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavdI3QAKCRDZQZRRKWBy
9L/GAQDFEJMjaukjIL6hsPbVKhY3JdjK2trma5iMW2z5o4dWmQEA0jyOVzJ7q5zj
M7YvozDsuHiLH1Y/S548p4WbG4GM4QQ=
=YkKR
-----END PGP SIGNATURE-----

--=-Pk9ID3Lh5PcmffxfFbdz--

