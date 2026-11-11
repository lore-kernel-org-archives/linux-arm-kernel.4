Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9F1606B768
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jcw5mE8Q;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TvSQUbhN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r88vezn/zIBt4uU/LbYZSvwiy9RpMWU9N5UW0qDOzGI=; b=Jcw5mE8QuFZ6KECIclBxwF6dPF
	4+l8o89iKBgRy+UVNk9hCfrkQ+FZeoaNklLHvkBNljlj9zJ3gl8B/NEsaotGI+tBPprhCF8ITrDDb
	z+hH2vCt+hjnuOmlhkEa9Q8irc9N9zRNP6+Ecyz25bNoEMZ3kV7nPPKO9NJH8L68pPa3vGTjldL4t
	J/BqqhvVwW6JXSqes8bVHkIrdBlv/UB6oFgcxZvQgVLEL+056JcHIX1u1pkP+NJog/IO5tjx27k0Z
	li0izZqjFUI2eD3KzmaPSUB2ruZV3qThPmbwHQUvagHtuQml28m2r8N8T3hGb+EnxWoqlOtHpk0tq
	sZRE6Pzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH3D-0000000816w-3Kbo;
	Wed, 11 Nov 2026 22:44:19 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH39-0000000810y-3Vrg;
	Wed, 11 Nov 2026 22:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794437048; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oE/D62gU21CYuAA6thLge+3tC8tzqVNRHD0rnDg2DHKoK5ciD0gQu2q51dhvVJfEHXE7PEsCapeZGbddM5Xp+NxqxXQ4pEDwBa/BKCkIp/BgzMAkwrsDTxYanjQnvBXTnf49XdyNc1QZ/xYsQCY9YMDFI1obEYnpjTANtBdG1Gg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794437048; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r88vezn/zIBt4uU/LbYZSvwiy9RpMWU9N5UW0qDOzGI=; 
	b=DAWMundu/4XamJL2Hg8G7HTMhvixY9zjH3SbEo7tpO8oLPbhTNXKs1k1sh4oYDiVgHrljVS6HkdPvMTZV+Qh6kmoTjDM5cyFMnvmjT9WJyf80Bw/w+mMsWMR3Li715OgTuS9qEqJtdXff7PwZxoJcZaUIwsiNCmy5tdWUw0w998=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=TvSQUbhN7THmVvFM7UQFg4p8WafvAU93wPQAdlXaN1sNavBsqlNUarL2+XuQ6RGPcBl83XiW5o5OjUWw3xegadecmqxCmwJ563QeBKNRkUxWcG1SdiWSBPVzBpnIPWNO62IsY3qHYQ7klB5jgTsng7IPOLAiruR65kUzHe6b23A=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=r88vezn/zIBt4uU/LbYZSvwiy9RpMWU9N5UW0qDOzGI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794437047434579.4818392138392;
	Wed, 11 Nov 2026 14:44:07 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 4BC3A180758; Wed, 11 Nov 2026 23:44:03 +0100 (CET)
Date: Wed, 11 Nov 2026 23:44:03 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: ricardo@pardini.net
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on ROCK 5 family
Message-ID: <avTuNC0STGUciyiI@venus>
References: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
 <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-2-91f1efefba0b@pardini.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ipmlxrtzmokewoal"
Content-Disposition: inline
In-Reply-To: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-2-91f1efefba0b@pardini.net>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.427.16
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_144415_974580_FC6C9B1C 
X-CRM114-Status: GOOD (  16.73  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--ipmlxrtzmokewoal
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/6] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on ROCK 5 family
MIME-Version: 1.0

Hi,

On Mon, Nov 09, 2026 at 01:32:17PM +0100, Ricardo Pardini via B4 Relay wrot=
e:
> From: Ricardo Pardini <ricardo@pardini.net>
>=20
> The Radxa ROCK 5B, 5B+ and 5T carry an on-board Realtek RTL8125 NIC
> behind pcie2x1l2; the ROCK 5T has a second one behind pcie2x1l1.
>=20
> Describe the PCI function nodes and attach ethernet0 (and, on the
> ROCK 5T, ethernet1) aliases, so that U-Boot's fdt_fixup_ethernet() can
> fill in their MAC addresses from its ethaddr/eth1addr environment.
>=20
> The shared NIC goes in rk3588-rock-5b-5bp-5t.dtsi, the ROCK 5T's second
> NIC in rk3588-rock-5t.dts.
>=20
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---

root@rock5b+ ~# lspci -nv -d 10ec:8125
0004:41:00.0 0200: 10ec:8125 (rev 05)
	Subsystem: 10ec:0123
	Device tree node: /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/eth=
ernet@0,0
	...

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com> # Rock 5B+

Greetings,

-- Sebastian


>  .../arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 15 ++++++++++++=
+++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts        | 18 ++++++++++++=
++++++
>  2 files changed, 33 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/ar=
ch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> index b8d90936fc20..e8a3eb33e402 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> @@ -10,6 +10,7 @@
> =20
>  / {
>  	aliases {
> +		ethernet0 =3D &rtl_eth0;
>  		mmc0 =3D &sdhci;
>  		mmc1 =3D &sdmmc;
>  		mmc2 =3D &sdio;
> @@ -488,6 +489,20 @@ &pcie2x1l2 {
>  	reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
>  	vpcie3v3-supply =3D <&vcc3v3_pcie2x1l2>;
>  	status =3D "okay";
> +
> +	pcie@0,0 {
> +		reg =3D <0x400000 0 0 0 0>;
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		ranges;
> +		device_type =3D "pci";
> +		bus-range =3D <0x41 0x4f>;
> +
> +		rtl_eth0: ethernet@0,0 {
> +			compatible =3D "pci10ec,8125";
> +			reg =3D <0x410000 0 0 0 0>;
> +		};
> +	};
>  };
> =20
>  &pcie30phy {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm64=
/boot/dts/rockchip/rk3588-rock-5t.dts
> index 425036146b6d..b1a3e4b2165f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
> @@ -8,6 +8,10 @@ / {
>  	model =3D "Radxa ROCK 5T";
>  	compatible =3D "radxa,rock-5t", "rockchip,rk3588";
> =20
> +	aliases {
> +		ethernet1 =3D &rtl_eth1;
> +	};
> +
>  	analog-sound {
>  		compatible =3D "audio-graph-card";
>  		label =3D "rk3588-es8316";
> @@ -76,6 +80,20 @@ &pcie2x1l1 {
>  	reset-gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
>  	vpcie3v3-supply =3D <&vcc3v3_pcie2x1l1>;
>  	status =3D "okay";
> +
> +	pcie@0,0 {
> +		reg =3D <0x300000 0 0 0 0>;
> +		#address-cells =3D <3>;
> +		#size-cells =3D <2>;
> +		ranges;
> +		device_type =3D "pci";
> +		bus-range =3D <0x31 0x3f>;
> +
> +		rtl_eth1: ethernet@0,0 {
> +			compatible =3D "pci10ec,8125";
> +			reg =3D <0x310000 0 0 0 0>;
> +		};
> +	};
>  };
> =20
>  &pcie30phy {
>=20
> --=20
> 2.47.3
>=20
>=20

--ipmlxrtzmokewoal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr076sACgkQ2O7X88g7
+ppRlA/7BZbFdW26Nysdh5hvnnHFucfXaReOSjRgpRCzlxg0xbcJycroKWkm+oNw
umZsN7MOjOJt8B0po0zgb51sG5hxaOKbtz3jvuMuNALWnw4y/aDcuW0XbU9oLJCf
Kl90Ng/+ETdZu8qagdlfHow5K5Ii9h2UgWJnSVdHlqeZmV6ixM2R+PX07A4WcvV/
vCmPt+Xrq/Y1r8HtvRmNjwyEtzhv8RDF0VVXemXZk/JureDqVQW28/uTEPj3Ghhu
/LMt1j9bD8YppxhtOvw8JfXe9maPFO1KpbIIhgt231EbiR4530IuSNMyc50mX1tG
1cI1Nk318lueHeS2dNOr8wOd7o8wlt58E6emUS8WVYWmI1Cjhgrz4freweqjjxPM
e8zrQMiS12PDmQ6aKW1r9R6GW6weGDqLO2LtHsypbShyPn3whR7QI6cyFnbT38ao
MffKL9EXKiLiOZVyzT10oHbx0LvQ3Wkpj4PlwlZDX6uc+O/tJNsA2pmTSgDWoD7Y
JiqBU2JK4KebPXO2E3GJswDSX5q6SiaUutOBPIIYBdAo6yj7AjfAED/1/29Lgn8O
8fol+9AFY5F5o2sB6BjNT6idVmcomgMw0T8Ts33Nxe3Cm/gMkMQAU4w7Md0v87G1
F8exRIEZvhCJQd88+Ug4Rav9SAsmzjIPd5PY45fl+NW+I2rNCf4=
=jpKD
-----END PGP SIGNATURE-----

--ipmlxrtzmokewoal--

