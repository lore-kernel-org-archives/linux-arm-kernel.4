Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF03606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eJoeLjgS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AZfAP+WA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9iTzNvY7Uy2wxh4/yC+c64lgqi3vm9WV/SAUoSR7IP4=; b=eJoeLjgSwd9jRSEoq/qD0p7z3a
	yFnCCJXSBvD/KHUzRPOKBLYUoHOTQURgMTXA155e5pHvqmb+rjX5l5NVM8//227M7Q2HpKrhhCOXt
	28MX/yVuvXpMaCfJuAcKKTOc3gccdvzsco7a1oWL3G/8k2Bbhv/aFmizQDLG+RhtX/4GOjx7eFUlE
	ch7ND6iN/WHttegVT+Bo8/coltFDDJTS14bbyrMQ41wWoe23UdvSwDGKDbY7AVe4mw8/Fa9uSFEus
	DVesQpfQpBjCgdnhaoL/MqnmgwMtsRbC09U3APaoyYRgPv8Bs5m83rZVlNefloPQ7uspYklkVnv4R
	sJwoTHrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnFz-00000004HsW-1usn;
	Tue, 10 Nov 2026 14:55:31 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnFw-00000004Hs3-0r3o;
	Tue, 10 Nov 2026 14:55:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794322518; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P+nid//XTmhX1bkpQjiWlLCC/jZue1QxH2DjzJoB9BLs/o0whE7Jwrhud1S/B9SJagyjI1S6YMVi2DKk7KZm3oWlf7ye8Try18aW7YwogrMmJdSAVO94TGxariIpjZfyeCxV2QoZJO2RYyY7aDRWwUzy65cVBe1sCmmqgycoGsg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794322518; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9iTzNvY7Uy2wxh4/yC+c64lgqi3vm9WV/SAUoSR7IP4=; 
	b=E/o2LlsUDPGK18ieTU/Qs4wYz/6yyR9UY+1C01o6W7mXZtF2lyRSKMPDayCFpFfxYZZ3czi3E+TCg1ayGBT+saMjMfX6rn5QMElQzWJeXTCtpzlW9TUEpTaA3dugxgA/Zfm/ByBkv5KqflvHDxY8KRaPn3kcQQoE4xzI9+I2Av4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=AZfAP+WAKnLO/LgAor/UnG4BaxlcChZXI4bVO+Xq7/TrvsfcnB55tJWiQML2aL9/QJzKCkKr9QlEiwK/tHL3bBf+9FfcydxJPIWwSuuEWtxs0w8T+FptYdziyfM6YluZfr0ScPqN5Yy2+nMoRJLTEQVrOoFkoZpPFOAL3aNnZJQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=9iTzNvY7Uy2wxh4/yC+c64lgqi3vm9WV/SAUoSR7IP4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179432251690026.33458305795125;
	Tue, 10 Nov 2026 06:55:16 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 7AF03180354; Tue, 10 Nov 2026 15:55:09 +0100 (CET)
Date: Tue, 10 Nov 2026 15:55:09 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: aiyengar1990@gmail.com
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: iommu: arm,smmu-v3: allow clocks
Message-ID: <avMv7fQuNJZpE_zr@venus>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <20261110-smmu-v3-pcie-pd-v1-2-628819ca44b9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="apkvvzaxcdcph66e"
Content-Disposition: inline
In-Reply-To: <20261110-smmu-v3-pcie-pd-v1-2-628819ca44b9@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.310.16
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_065528_514502_51F277BE 
X-CRM114-Status: GOOD (  19.46  )
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


--apkvvzaxcdcph66e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] dt-bindings: iommu: arm,smmu-v3: allow clocks
MIME-Version: 1.0

Hi,

On Tue, Nov 10, 2026 at 07:11:49AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> Some SoCs feed the SMMUv3 from a clock that the OS controls. On the
> Rockchip RK3588 the MMU-600 for PCIe runs from ACLK_MMU_PCIE, whose only
> other consumers are the PCIe controllers. When no PCIe controller is
> enabled, the clock framework gates it as unused, and the SMMU can no
> longer be accessed.
>=20
> Allow up to four clocks, so that such a clock can be described and held
> by the SMMU driver.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---

This does not explain why a maximum of four clocks is allowed.

Greetings,

-- Sebastian

>  Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/D=
ocumentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> index c8f22dfdb1db..f8a74730667c 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> @@ -63,6 +63,13 @@ properties:
> =20
>    msi-parent: true
> =20
> +  clocks:
> +    minItems: 1
> +    maxItems: 4
> +    description:
> +      Clocks needed to access the SMMU registers and to keep its transla=
tion
> +      units running, if they are not managed by firmware.
> +
>    power-domains:
>      maxItems: 1
> =20
>=20
> --=20
> 2.55.0
>=20
>=20
>=20

--apkvvzaxcdcph66e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrzMEwACgkQ2O7X88g7
+ppLEw/+MNtpw8yw9i0ZkKzRkK8q/EzZMGPQ599QxbdAR88xtnYi6Htl4uE73QyK
WkyMrX/NIplWZu5I44J68aJC+H+jWvOxTEO6apPIQFOuK0dznO/Y6m0GRtFz7p4s
4od00k+xpLP/76wW0Ib4d9sSXxyeMv9lXq+1Auv3YkA5a7p+hcpzRDejRrg0udag
xPUiy4++1yAAkaYlBZyR71EqgXkRRTM9a2sDqwlQfK3nsnrWuoPxl4S6Bk67cfOT
U7JRIGKBiKTmMjOU5D0ESw5czT+O9R/bVHdeUnDtSrLyAMxfvjBQv9YLarCHkYmh
5keolQEbb8OzeyEKaj/gFhi9C6eqh5d5D538Zs1Q6pCrSs5BnzN+3BP3CFrhk39G
xjbb2XCo3L+zz0zaiE43XkqsLIz2XujWpWt3HrKSiAQuga0vDZ701isJ/wwYbFbX
WlG+e7XtUKDgbux0s07qRP0dW+/i5jdIx+qW6o/KtGAx4QRgoogiEhxQC7GE8ut8
DTKO3GyJg3oGVbdR2IsEDnhkWpgIJlSRh/GbK5SmMUtzQS+veirXv5rd7QvmXXle
yi3i50b1eY17V2SDt1GuITSD7bfqfd5oZOYnWazdDEdiX0nTlBfDxFH82eu/TlzG
p08cMLFJp/9F2TjNoK0NyMzF6Wx22nxxoj54u0RLkMgJlXa6j8E=
=kunh
-----END PGP SIGNATURE-----

--apkvvzaxcdcph66e--

