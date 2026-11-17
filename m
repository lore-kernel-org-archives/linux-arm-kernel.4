Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963EE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PtcxenLS;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gHk8C3ZF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cVJny626PSXTYXD7vVP1KvMetvjh73uNkOjbJXvYqI8=; b=PtcxenLSfT1CxmeyEqJirejAzx
	nfYH7vANuwfb2xhYr6pRKVBw3ujyCRbtdnizb/0dc4FrMW+DJrbpOdG9wiD2T53x3/wfEIeQIJVpA
	I321pHI3lw+4oHOYc/SWb0644ZrsNwWyTtj99tpNCZjhbnvTpg9H9AYXyGloNZxAulKxo9x1lswmX
	v+go31r0qBtmqeMFZexMrpaChNnxqAlEnVPXj3J3O863NNxSoD7FRpsiSyEqaVUUyicxW9uGABziP
	Va1g7UUE2Ov03FsTZeGlE9t//uT3u0SXjNRCvnqOtVwJlGaOh2IBlt6qJ7Ip8u27xrjnEe2GrYps/
	RIRft1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRGC-00000007Bi3-1AWj;
	Tue, 17 Nov 2026 22:02:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRG9-00000007Bhi-3X6m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794952955;
	bh=rbe9bWmMLVa+J0dSsVuk7Oqfry0Nb3c6LzUf0izNtPY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gHk8C3ZFZGup291nOPsGvEuiekJqfUu0OA+z+BbbXpV5y7nQdwDjPxQ0st/JjbOFz
	 su9hsBAAvcXqBDACNNz17Q++iagWrr05wkdlz0DHZweYFXE1pmUeJQedwDauSA1qSR
	 4zhz++F2+NViVNhXaKjdYa5ZXcWO5p1s2xb+8KaOWh9e4SRkn1pWDps1Bp1N7aAvmp
	 6jVeIURtQichWCwEdNZP1g3OfQlAkGI/Y9h8K9pLtv4xW7Qf7T9CMieCvJ03jx4FA1
	 FPMtFe/pQuR+VwlAmr1inrphLuYpabTUZq8Y9dW/kl3dZ3JsHvGEd2FvKgwIvPEIOF
	 GoCh+ftCOK2Tw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 721FA17E02F2;
	Tue, 17 Nov 2026 23:02:33 +0100 (CET)
Message-ID: <77bea5a89914df70f38b7eb0d171ea116c1beb02.camel@collabora.com>
Subject: Re: [PATCH 14/14] arm64: dts: imx8mp: add VC8000E encoder node
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
Date: Tue, 17 Nov 2026 17:02:32 -0500
In-Reply-To: <20260522101653.2565125-15-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-15-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-DrpxW1Rx3aNbkGs+KQT7"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_140238_156284_15A2D47C 
X-CRM114-Status: GOOD (  13.97  )
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

--=-DrpxW1Rx3aNbkGs+KQT7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> From: Marco Felsch <m.felsch@pengutronix.de>
>=20
> Add support for the Versilicon VC8000E multi-codec stateless encoder.
> The IP integrated on the i.MX8MP supports H.264 and H.265 encoding.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index a3de6604e29f..4e63c2b16c1a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2290,6 +2290,17 @@ vpu_g2: video-codec@38310000 {
>  =09=09=09power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
>  =09=09};
> =20
> +=09=09vpu_vc8000e: video-codec@38320000 {
> +=09=09=09compatible =3D "nxp,imx8mp-vpu-vc8000e";

Not in any binding.

Nicolas

> +=09=09=09reg =3D <0x38320000 0x10000>;
> +=09=09=09interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09clocks =3D <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> +=09=09=09assigned-clocks =3D <&clk IMX8MP_CLK_VPU_VC8000E>;
> +=09=09=09assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_800M>;
> +=09=09=09assigned-clock-rates =3D <400000000>;
> +=09=09=09power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_VC8000E>;
> +=09=09};
> +
>  =09=09vpumix_blk_ctrl: blk-ctrl@38330000 {
>  =09=09=09compatible =3D "fsl,imx8mp-vpu-blk-ctrl", "syscon";
>  =09=09=09reg =3D <0x38330000 0x100>;

--=-DrpxW1Rx3aNbkGs+KQT7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzO+AAKCRDZQZRRKWBy
9JhuAQD0AfYjjgquoc8zWyxBBVWmufqqLsFrTzXcJNVEMypxtAD/cLq6GfuURHlt
do1wPhM9bKt6UrNP9Pvk2GYJtRFjEgY=
=L6LT
-----END PGP SIGNATURE-----

--=-DrpxW1Rx3aNbkGs+KQT7--

