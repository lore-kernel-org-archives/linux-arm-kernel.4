Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC48606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tBEXUoBA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=gDpkEvFJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xb1y+ovOhvBI3PPY14V/QFdhBDvdbmq7VXJJdsVP7cU=; b=tBEXUoBA+9+K3/of+cTUgdn5dw
	NZg3CUwx8FX1GFJvYjq80T8CsYD3Ddhx/KqwwSjdhtLhy4AJZgYE07bjD8gvcmM7ltZLRI/y4EqOv
	mcCutzos1CuzepTX0b8/gM+5RpQJCERO1wUSE42gbe6b1QBGuyElgking0C0KduCm60pJOnzwCjn/
	+Cm/sPKUJe40BoDHP4IK28lfcBolBButJ6fMboXkwDeov2O4bj4kTsL0ggIQ5oOCQl4FH6JqZ5adO
	ugN1ijB70yj16+Mp5wlkK4s+mJ6A8vm175blexmJRczVIiYZIq/ngOSNEWpFTXV0tD7A/ty5XAyho
	cIlBELZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnKx-00000004Imh-0p0u;
	Tue, 10 Nov 2026 15:00:39 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnKv-00000004Im4-24RM;
	Tue, 10 Nov 2026 15:00:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794322829; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Eb0p/omXtaq1k5nxNfO+ujP/HRbgPhXxnjYl+jPdYc33Yc4CrkysC7ePkukgW8NK5IKc5RY+vhGMiAznLn97L7pksj0kVP0VZ1zSIMSmmfMe1WNC4FF183uIUlrKrPSETt5Z75rc6eSv7KOMulct6Wto+FSqVTG4EzDTjhT+YMM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794322829; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xb1y+ovOhvBI3PPY14V/QFdhBDvdbmq7VXJJdsVP7cU=; 
	b=G9ld2mFn+L16/WrbrJefoNJzbBywfBEPAo+iqStgHa6C6TF5jHufoDYvw2tnQhDwUgHu4Zl7LC2qACeUO5z0i0bWjSMDNeEZG7n6jsKYHlAgvNB7ThslS4sN+7ErElweraMVKzr0KRYQGd5GilNe5cFtg3BEkanr62mXWRAWPpM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=gDpkEvFJvIQrrlLE8Kbk9F2ORW97VzC+pAoFvwtWAdavuP8rXp7dDxdBG0pvOYEzPRLWJag0ME6Wb/fcmYkLCkagSxHhVF32qTeT1los1whzDp4eLXfbMyslEUXbKBlIA+InyXnlx12Js13nHIYPDnzuc94GNosGA4yZb2G+fVc=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Xb1y+ovOhvBI3PPY14V/QFdhBDvdbmq7VXJJdsVP7cU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794322827521487.8316939248318;
	Tue, 10 Nov 2026 07:00:27 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id D82A2180354; Tue, 10 Nov 2026 16:00:17 +0100 (CET)
Date: Tue, 10 Nov 2026 16:00:17 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: aiyengar1990@gmail.com
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: add the PCIe power domain to
 the RK3588 PCIe SMMU
Message-ID: <avMwk16cTHMQIwmC@venus>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <20261110-smmu-v3-pcie-pd-v1-4-628819ca44b9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yvnwakyswhfsguxx"
Content-Disposition: inline
In-Reply-To: <20261110-smmu-v3-pcie-pd-v1-4-628819ca44b9@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.310.16
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_070037_784422_045D5080 
X-CRM114-Status: GOOD (  22.63  )
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


--yvnwakyswhfsguxx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: add the PCIe power domain to
 the RK3588 PCIe SMMU
MIME-Version: 1.0

Hi,

On Tue, Nov 10, 2026 at 07:11:51AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The MMU-600 for the PCIe controllers (mmu600_pcie) is enabled for every
> RK3588 board, but its node does not describe that it lives in
> RK3588_PD_PCIE. It only works today because TF-A leaves the domain on at
> boot and, on most boards, an enabled PCIe controller holds it on later.
>=20
> On a board that disables all PCIe controllers using that domain (the
> Orange Pi 5 with its M.2 slot in SATA mode is one), genpd powers
> PD_PCIE off as unused after boot while arm-smmu-v3 is still bound. Then
> at reboot arm_smmu_device_shutdown() writes CR0 and polls CR0ACK on the
> unpowered block, which stalls the bus: the kernel never reaches
> "reboot: Restarting system" and the board only comes back once the
> watchdog fires.
>=20
> Describe the power domain, so genpd keeps it on for as long as the SMMU
> is bound.
>=20
> Fixes: da92d3dfc871 ("arm64: dts: rockchip: enable the mmu600_pcie IOMMU =
on the rk3588 SoC")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index aa69fd3793fd..bcd342c025c9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -560,6 +560,7 @@ mmu600_pcie: iommu@fc900000 {
>  			     <GIC_SPI 367 IRQ_TYPE_EDGE_RISING 0>;
>  		interrupt-names =3D "eventq", "gerror", "priq", "cmdq-sync";
>  		#iommu-cells =3D <1>;
> +		power-domains =3D <&power RK3588_PD_PCIE>;

The TRM says the power domain of MMU600_PCIE is PD_PHP, not PD_PCIE.
See Table 7-1 RK3588 Voltage Domain and Power Domain Summary around
page 1096 (depending on specific TRM version).

Note, that PD_PCIE is a child of PD_PHP, so it makes sense that
PD_PCIE also works.

Greetings,

-- Sebastian

>  	};
> =20
>  	mmu600_php: iommu@fcb00000 {
>=20
> --=20
> 2.55.0
>=20
>=20
>=20

--yvnwakyswhfsguxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrzMYEACgkQ2O7X88g7
+prfPw/9H7V6CFJtfI0s9f5zQ1tXpHmng97aGYhRQAxloE/LcvZHpFI8zHFOAL+3
/BQfGKhYVHxw0VEO4VSVrIbaLWag1mtFtYfjINdR5/uT6937ctWfyskTfMuKf/35
O3nOwz8Uihhq3ZbA+AFJ+DLbUiRs7+Ka7rn4IxvDE/YEZrVPFJIRmU/iJ5NZTiDs
u8AVATgGiVEmYXFkrqUr3siaEB5QiITUOkv8F4y5i9xYcrqnRr+9LrwjXVsjVpn+
cySgWnAySJ13eX55L4XktWLXiqd26EaK7dRTcWsNm6mACod8BP1sGtDJkS310fFv
Utzx30B9Qh7ThWXF2HwdmeqSGfzWFc54k8IHtmx7PcpKkxmOFXG5+e7gOw1IMCE0
Ro9SQxIwJ44twPtPyuQyA/nzqvui8ZmzFhZ9TmuKjyuR1tOLmg1546WVLJroN3+B
ceLNYAhT94Xopbf4C1WAA8WWOSEuhU7ILyyDB+LqVQEG8YtaP6d9wFq0vRDxKbXj
WITuytLrKkMWWjwXtq2qWko1HLDCHv1SV/1lmw7Vxye2Gx8mLIjnrRXgRVfhcmZA
TC7g/FJ3/oEvKSbf9OrE5LglaqBWGgwbzN+e/g7UCoQnfHKOwHB9phFeOj7nUTvW
/zzCKbC+DQ+HjRbMKlP9bEw/GgJebMSK+fDAM7d68zim0FCJ5Jo=
=Q6ux
-----END PGP SIGNATURE-----

--yvnwakyswhfsguxx--

