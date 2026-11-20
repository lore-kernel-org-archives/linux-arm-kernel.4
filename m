Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B16606A69F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V3zLFZA/;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=l8dCeRqd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LmcAi6HEybEAMZVvo4K38uL60nPeQBtPpV5MltW1eac=; b=V3zLFZA/2YFa8qkj1VS10LChRc
	VRKGJ/yQM5L1T3soDE6mQDZBXRHtgGTRUX2d09OblahW89nKsGVhrhEOS8+jQgmqtYwbcfZpa7ixn
	62LIfg1EfERibETmxswbH9Sy1872Cf/6VMPtXP3Ky5DaISHN2Nb3A99OOSh74GrsHwYGzhHHW8BwT
	luGukkXRGTB0D/jhHWrekG2LdEHZkDrGXoStYJknR3w2t5p0LywSbyBK60kpxGbsRjMsnkScIrQWn
	zKodKMMzSUyWTQsg2O5dsSqxC3s2tGUjtHqCq47vLgE/OXvnUg6UR266H+qwRsmVwV4TnuoNogoB0
	FWHybRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUW2H-0000000GIPS-0IDM;
	Fri, 20 Nov 2026 21:20:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUW2B-0000000GIOy-1cLV;
	Fri, 20 Nov 2026 21:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795209636;
	bh=LmcAi6HEybEAMZVvo4K38uL60nPeQBtPpV5MltW1eac=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=l8dCeRqdGGvDvQZ6PoqXdbpOJ2+fHWxxCuy7aAJ3wsV3nStEcpuZBlfrRlpSY2N3w
	 kp75T389Dl2TmMOXvOIh4ISZYhHDjk5iD7ViLnd0A34sXeoqUknsWdR7cYp7Oc+hIn
	 pBe56/3B9KMjtV7WZx3gkQ0tnfAIlsQIg8dUkR9qr0tGjKddwrHudAPm3qgJmFkWNs
	 n5tIOgBsi8D+TFQnBOPA7qZnQdAHAmRv3EjMfN23Pd5g6xxPn6CTdEtE1PgUr7wC3l
	 1R1F6KUaGcIqH1MwDscd7s0zLu3GFyUp5s5BFYVJOe5NWVmO3NJiSvIVUqremtdRJa
	 kkOjH8KNmIsHg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A965017E0060;
	Fri, 20 Nov 2026 22:20:33 +0100 (CET)
Message-ID: <bc777a9772d1dd841d1928421a7881fb57f9d70a.camel@collabora.com>
Subject: Re: [PATCH v5 3/5] media: rkvdec: vdpu381: Program the read caches
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Daniel Golle <daniel@makrotopia.org>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, Michael Riesch	
 <michael.riesch@collabora.com>, David Heidelberg <david@ixit.cz>, Christian
 Hewitt <christianshewitt@gmail.com>, Marc Zyngier <maz@kernel.org>,
 linux-media@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>,  Diederik de Haas <diederik@cknow-tech.com>, Dang Huynh
 <dang.huynh@mainlining.org>, Piotr Oniszczuk	 <piotr.oniszczuk@gmail.com>
Date: Fri, 20 Nov 2026 16:20:31 -0500
In-Reply-To: <57258f1199fdbf24ac57081c6f3df219464e870a.1795191822.git.daniel@makrotopia.org>
References: <cover.1795191822.git.daniel@makrotopia.org>
	 <57258f1199fdbf24ac57081c6f3df219464e870a.1795191822.git.daniel@makrotopia.org>
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
	protocol="application/pgp-signature"; boundary="=-xMvWOScR5XSmqSVox+1m"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_132040_894085_7C86F62D 
X-CRM114-Status: GOOD (  12.11  )
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

--=-xMvWOScR5XSmqSVox+1m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 17:41 +0000, Daniel Golle a =C3=A9crit=
=C2=A0:
> The VDPU381 and VDPU346 have three read caches, configured through the
> "cache" register block. The driver leaves them in their reset state,
> and on the RK3568 some streams then decode with wrong output.
>=20
> Configure and clear the caches before each H.264 and HEVC run, the way
> the vendor kernel driver does. The "cache" block, which the binding
> requires, is now mapped at probe for every variant with named register
> blocks; the VDPU383 does not use it.
>=20
> On the RK3568 this fixes the HEVC conformance vectors RAP_B_Bossen_2,
> WPP_D_ericsson_MAIN_2, WPP_D_ericsson_MAIN10_2 and
> WPP_E_ericsson_MAIN_2 and the H.264 vectors CAPM3_Sony_D, MR8_BT_B,
> MR9_BT_B and NRF_MW_E.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-xMvWOScR5XSmqSVox+1m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawC5nwAKCRDZQZRRKWBy
9P8TAQDpyeSu1gXllnkYGeMqRKPvJ8onxEJ+yv2Jv5OBpiybIQEA1uZT2/boTgHm
weAd02uKsuvt1n9zB+lAaVOMSc3SMgQ=
=K9qN
-----END PGP SIGNATURE-----

--=-xMvWOScR5XSmqSVox+1m--

