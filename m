Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ACA606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 19:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rjMsmHKh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=hvROlOR1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lCDxPZTEu1aBLcrMc+NyYSEE+fukHLmARoE4t3v2YSU=; b=rjMsmHKhS5xNbFoNejlV+ti25G
	ZfD5WA3bx2GJhC/2DUJ7+6QWeJWyehWh7YOBn9+HDAZs6shUfO/bnJIWPiKMofA/US9ZCtWxbnmJT
	zRTGJnDfCuVR/54JDOkWVOJJapZfWBJviFDVdJiwIxd99eFhpsixlybTO9GZ3EiijrkFsGAE7VqCY
	Fuzm0Xs/Q84lgPRmqGw7UWxeDSrt0w/ZDCGAP1OhSbPQZHXyWOBWXjw8yYwRKflQvCTfR1pjcu+jD
	fEhx21LhFfSgb7fL5cNsG8ISCD8IkEtd81gSviYBbwtjC7d2UgJ86/u/U2ek4I+WJxgsv1QaEFvEe
	S2Qrg9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8a7-0000000GX4n-0lFD;
	Sun, 08 Nov 2026 19:29:35 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8a5-0000000GX41-0gaP;
	Sun, 08 Nov 2026 19:29:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794166162; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V8FGTqUAcI/+f+ZmpjgeoHQv9yS5Gd4q/pSD/sOyZ99hZ4wNBW2y8FI5nqqCo7Y8f6QXFdga58O+nkYF78A+s97QN2PTeVsLsG/HBDke0EWkitmHsn6nQYJVzVGK2FbsB+lBgu4p8kRkAbbz1WZ8f8u71vxfAypGtLnmfRIYZnw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794166162; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lCDxPZTEu1aBLcrMc+NyYSEE+fukHLmARoE4t3v2YSU=; 
	b=jWa89DpvHtLWuGTJcczwDrGgyYga51fkr/pHFnhh+SDRlXPGAQ6mwiLl6MD48+9GDclCN6lu1lkMDrEGgFVWWCrJJggrtzo4IAyVYIn+X1mfkCPqv29cACZTDLqyN9hNBBrGTxmRjY9jnr2hijkX8zJPziFJdXmqbLRR9996+B0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=hvROlOR13AqEOLRkERFPuGYm0ivXmPtRN4WyJmYNo49Suz3E44kyeuaYKoIMFPeUdHmoiM+6qmdGCzA1fKPYNrCCsL+mE49jCnUfEWRn6tj4JMHxpAf6qU/UGs2gc2n0TTCEYrrON+ASiLp39ikdGbqpmC1QNakZl7pgYdyT7/A=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=lCDxPZTEu1aBLcrMc+NyYSEE+fukHLmARoE4t3v2YSU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794166160289388.0259815442704;
	Sun, 8 Nov 2026 11:29:20 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 87D37180269; Sun, 08 Nov 2026 20:29:15 +0100 (CET)
Date: Sun, 8 Nov 2026 20:29:15 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 2/5] arm64: dts: rockchip: Enable NPU on RK3588 EVB1
Message-ID: <avDLdgR6gXOrEmNN@venus>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <20261106-rk3588-evb1-dt-updates-v1-2-bdbe16223589@collabora.com>
 <f5edf258-4b6d-416a-9b27-efa47be8d91a@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ltpqvdvrdd3b7xzx"
Content-Disposition: inline
In-Reply-To: <f5edf258-4b6d-416a-9b27-efa47be8d91a@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.158.93
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_112933_257403_444910C4 
X-CRM114-Status: GOOD (  19.72  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--ltpqvdvrdd3b7xzx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] arm64: dts: rockchip: Enable NPU on RK3588 EVB1
MIME-Version: 1.0

Hi,

On Sun, Nov 08, 2026 at 10:03:05AM +0800, Chaoyi Chen wrote:
> On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
> > Also enable the NPU on the RK3588 EVB1, which is very similar to
> > the QuartzPro64.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
>=20
> I remember there was already a similar patch before?
> Maybe I got something wrong.

TBH I haven't checked before sending this, but did now and there
doesn't seem to be anything:

https://lore.kernel.org/all/?q=3Dfile=3Darch%2Farm64%2Fboot%2Fdts%2Frockchi=
p%2Frk3588-evb1-v10.dts

Greetings,

-- Sebastian

>=20
> Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> >  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 34 ++++++++++++++++=
++++++++
> >  1 file changed, 34 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/ar=
m64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > index 87e624d1e094..6476d9e3be6f 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> > @@ -578,6 +578,10 @@ &pd_gpu {
> >  	domain-supply =3D <&vdd_gpu_s0>;
> >  };
> > =20
> > +&pd_npu {
> > +	domain-supply =3D <&vdd_npu_s0>;
> > +};
> > +
> >  &pd_rkvdec0 {
> >  	domain-supply =3D <&vdd_vdenc_s0>;
> >  };
> > @@ -703,6 +707,36 @@ &pwm2 {
> >  	status =3D "okay";
> >  };
> > =20
> > +&rknn_core_0 {
> > +	npu-supply =3D <&vdd_npu_s0>;
> > +	sram-supply =3D <&vdd_npu_mem_s0>;
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_core_1 {
> > +	npu-supply =3D <&vdd_npu_s0>;
> > +	sram-supply =3D <&vdd_npu_mem_s0>;
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_core_2 {
> > +	npu-supply =3D <&vdd_npu_s0>;
> > +	sram-supply =3D <&vdd_npu_mem_s0>;
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_mmu_0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_mmu_1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&rknn_mmu_2 {
> > +	status =3D "okay";
> > +};
> > +
> >  &saradc {
> >  	vref-supply =3D <&vcc_1v8_s0>;
> >  	status =3D "okay";
> >=20
>=20
> --=20
> Best,=20
> Chaoyi
>=20
>=20

--ltpqvdvrdd3b7xzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrwzYUACgkQ2O7X88g7
+pp04g//fKTIvlVT+DlDCI7Qr2N7lNt+yTY4h8ufwxQQBKfUj1u0tZ29xqVnqf3C
iFACZfowhn3mTHk7TtdLAqMRsWfBcVP+8mJ9qzPhMlhF346DlJXRoWaZ6HBytAj/
7g8iSfjOU/4ZmOLS8Zvp7ynHWQcHz8znZo5kPJ+kjE+iy0cgVzmMNtIH4RotqElZ
D4GN7E64WWgcFDNHaUvJOoh6nvdSSQ7Y9izzkt/BgmpLRyKjZw2evdbZAUcEhHjP
0Jyf5kx4m5Ao4JuyOpP+qut1xMenr9HU2lv4Ghvk7XcBJzmTTWJTpdb0NR0RjyaN
nfLiww+5tXTH0vBq7yrXm4uHtUaEm0BkrWPTPmjx00sXGenFXQot/oNZy6UtsjLa
7w4rg92AFQeZaP5Ucv0Ky2wAAN3DOI4fVZbvLs1DNA9DDrBTy5OEEIPMRC9nXN6d
nVEbdWILwRgOkpneagUH5bxd81Kcanur6Uj4Y12DlQvmty1XV1KZ9yfEMi4VSDYh
f+KqVISO8PzkLtewOnaynu0O00zHN2qlWSCq37r7apJWGKmvYiKz609jpVdF/eGU
CAesKz42tx6MNUUE6EDyY63e/8PUTQa+MIf/0Gb3xUIgTljdviyQhr9XUWRV2j60
Zn6pKaZAMFMtBdUgx5ffPstxyCuuucs4qgQ5t5nnttTQHEcNzFM=
=EWuj
-----END PGP SIGNATURE-----

--ltpqvdvrdd3b7xzx--

