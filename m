Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397F6606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fO7c2cdn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=aMZJcmnV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nIm3ALQw2CLFEdC+FIJT+UWO+XWiCkX3Jl5z6pz25Lw=; b=fO7c2cdnl+2thjEVCeYEK7HO9A
	53aDxjXaO2Fc2a1GQFsmCrYjKMumbGkQkzlS/P6MZeLO3Juz+pnZ3oY+c13fh+ogx9fzBU6cJWGd7
	nB1MQCTgkN3Ncv3bjEMzE0otIY+V1VAdbf/nB1NKiqgRx9975srwsdiP9ovNiLN6BJlIgZmcQd/Wc
	FDNfpzhiYoCJG9S7Ha/UbWOt8KxsZ/V3jmEx59QFZzVmHqjDtQLGoWdv1uBsOUzFqc/iqH+k74wFj
	RdigAWYzTFdDnxcUa7sZMykc1RwQJExGxYG6cagx/avC+BoUKIe4pUlo6oIJfMgUrNhxnAItMZtoU
	1ph7eTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnCk-00000004HGc-0xhx;
	Tue, 10 Nov 2026 14:52:10 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnCi-00000004HGF-19Kp;
	Tue, 10 Nov 2026 14:52:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794322317; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IES5w9/rUmQUIOSvczKB958G9ik3/KHQOdqZIpBImeiL6/DiyiXey9VoKv7eSSR//k6c8Fw0ubhAX3eutKWdaQm+KuBtR00hvQuaDMCFAvgg+s4IAxKfAFIX20MW+yKqOBKVdgvqkTmOVaw2rB8WPPnH01qLjyN/0xQuh4lonLA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794322317; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nIm3ALQw2CLFEdC+FIJT+UWO+XWiCkX3Jl5z6pz25Lw=; 
	b=G9yyZtFQYlZJTLFV0v3bg3BtMw3vkmi3+Poehl2oVa7CSuYF8dGEw/a8aUIy0/4IKr1R0wdNDNCGA2GijuVP/LJrrBnmfKrXPim37YeqeG7MDroFOJ4CvPGazX4JZmOhi+8JsK59WZKRhcQVkDWdzuUedf6LuuFtz/a2OEFdBU8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=aMZJcmnVNEHIWb8uXyKM728ieo5RiRGM1+v6GUx2I12YzHcAOTMRGrUmWeIx092Qx2aaQKx4J0j3zaJJSCDbDa6Jm8SynPbnlTZonYnMYZL0QwpSQIbBqCbpHcIsUMGRAhvQdoQ8pNLIlLckmZBw1gyZRVnn/HDBlOkYnVM97Gs=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=nIm3ALQw2CLFEdC+FIJT+UWO+XWiCkX3Jl5z6pz25Lw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794322316098419.50846392536164;
	Tue, 10 Nov 2026 06:51:56 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id F1A01180354; Tue, 10 Nov 2026 15:51:46 +0100 (CET)
Date: Tue, 10 Nov 2026 15:51:46 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: aiyengar1990@gmail.com
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: iommu: arm,smmu-v3: allow a power domain
Message-ID: <avMvRiHSp_7d8oD3@venus>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <20261110-smmu-v3-pcie-pd-v1-1-628819ca44b9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tfqghsv2wlsgx7bh"
Content-Disposition: inline
In-Reply-To: <20261110-smmu-v3-pcie-pd-v1-1-628819ca44b9@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.310.16
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_065208_363725_4DA2BB39 
X-CRM114-Status: GOOD (  18.83  )
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


--tfqghsv2wlsgx7bh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/5] dt-bindings: iommu: arm,smmu-v3: allow a power domain
MIME-Version: 1.0

Hi,

On Tue, Nov 10, 2026 at 07:11:48AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> An SMMUv3 instance can sit in a switchable power domain of the SoC, for
> example the MMU-600 in front of the PCIe controllers on the Rockchip
> RK3588, which is part of the PCIe power domain. If the domain is not
> described, nothing keeps it powered while the SMMU is bound, and any
> register access after it has been turned off as unused stalls the
> interconnect.
>=20
> Allow a single power-domains entry, as arm,smmu.yaml already does for
> the earlier SMMU architectures.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/D=
ocumentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> index 3c044e4f03d4..c8f22dfdb1db 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> @@ -63,6 +63,9 @@ properties:
> =20
>    msi-parent: true
> =20
> +  power-domains:
> +    maxItems: 1
> +
>    nvidia,cmdqv:
>      description: |
>        A phandle to its pairing CMDQV extension for an implementation on =
NVIDIA
>=20
> --=20
> 2.55.0
>=20
>=20
>=20

--tfqghsv2wlsgx7bh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrzL34ACgkQ2O7X88g7
+pqJrw/+Ltixuq2mwS/7jblulvQQALfQna4bWRC1zreexGhF+leoXqP9JEMhCnkp
Vr3wOBovLKA//DQokcLKXgDGqVS21CBMdTAEp2Gc+G0N0VHZzdSP7i3QCkr9qNZI
vPm9hifWU277QF5SgT/YCR94Jt8m46KSkFNiaeq2dTUBi+/TpYO1y1UxvNnlBm8H
ySl3PLGGBj909ezmEy12KLVHxYAPM3SKAbE6dr7Uyo3B2yuMp5uY1TPdYbJpNi4+
s/qBdbgxBqPVWVhRspqwjcJKpc2jnv1aLQjZsHCulAxY6iOnGscDwHgCnerj7xw2
XJOJ+cmGi2CvqRYloutaEx3DFDW0ANLaOvxLBe43c8jwuDP72eeM+Bl4JnNxQOZX
uVu6498a/JQxBCXyo0IW/vEUQ/VhCo6bG7CaLHIWmuX/gVH0DNCuz43JFInaZaCz
lHffjGUeQNGigfx+zlTTu1Ng0rqBA6qKnva8gOUE2AvFkWD3lYh7MWuZWy4Foz6i
g2FEtxt2CfNYpzm6/XE5Sp5ayNqO0l3N2Y+m2W413Ae8Pe5dmtZmNekDmJOLKzYq
PWNKmQ16cANFsiA0Zq8fL7p4EArT1cC7o37lWeKdJJdodL+edfTFWmee0YmmrTOA
lsBVO1mkefW/Kf+L2CL8+DoN0EUu7+qa7rVBLxOlkPB+b3A8UsU=
=xEf6
-----END PGP SIGNATURE-----

--tfqghsv2wlsgx7bh--

