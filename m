Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D8E606A884
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kmdZNsNF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bgzVQwsr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=kw8Rxbyb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mX5XJiOggtCU2h3cbhrU4EW9IR9MqjeUg5nelCtC63g=; b=kmdZNsNF0qdW4rCUg9O+WN7gIM
	8uF0LO7a8kzHkDHyAO7LHw8dVCo57kPoBaifRuomX66Rxb22rDalAnEJ7Q2+P5KaDqfJYB4AKn86J
	vvuGkZPC5kCErEdJKRqlnakXI/DUeA0JmCmoZm1igpCxEDgOq46CHWxzjCBhU8cgAhoWhTRQNfKrZ
	w6JJ9MsGvk7hemQeIDDn9juqo/iSMmOLznfAFj7u+DIN37aosOsh7k7OY9hrc9FRqx8b7hNUhHNJj
	26jyutIPCppYrGFzrgQcCH3OsBFhY7veSvbniiIOXwQH6lDsNOZPPwDpsdFfJJVtjhRnaZHKHpTiz
	cBveL62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXpb-0000000AdNa-13KW;
	Thu, 12 Nov 2026 16:39:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXof-0000000Acll-0tCv;
	Thu, 12 Nov 2026 16:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mX5XJiOggtCU2h3cbhrU4EW9IR9MqjeUg5nelCtC63g=; b=bgzVQwsrqaoizlJxFUkYGJU1Hw
	T0PmeoeueZPDmwsSMIvrh2aNp7ibgrSleFiQLEdY9K1RV0v8/FzSLHgrbS5cwr++1F7E8tUDGRiyu
	XuYuqgkstNdhpwhdTDX1BzNVNjKd9KdTjVJixD72VbBoBirYhRl1YjBvpwOG/SHMhWBo0OjiAE+pC
	Y0ysltvl6zEeEowMf8GpcJ35qp16RcNOgbuN3kB4rAHwu5/jqscInBcqNQagYgHjOITwK2BWiKP4R
	KRhilnhOX/xFDtzZ7B/UUSBRBaovTm4sTu13aAJQCvn+3Y/5uOqiuhv1pr/ut79tUC3lwHLonaM0o
	ukExgkTA==;
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXoZ-0000000AYw9-1cU9;
	Thu, 12 Nov 2026 16:38:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794501488; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aSu/hFLbuCH20PxHrtQGMjLUcLKDgWItFuL1RiCjtSRoel8xKiFBwg+BOoAddlsDEG5Rc0wlOCMihwvzoqtbuMsd46s5FHRwXKc38/saXVQn/tEsWkvaVPTevkVxhHicHh1fe1vmIwzWNUEXBeSsaOFg0+mCqg0HlOJQgeMtfgE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794501488; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mX5XJiOggtCU2h3cbhrU4EW9IR9MqjeUg5nelCtC63g=; 
	b=GIlOxFCKPlQayYMyEGzFg+GRISBCqbD54tDLuAz33adJXwXOVMbvamPgm8svNJZlJkE6W4JFbeAY5y8hU4bycqoqOsmF3bCc8omd7mpq3pGI6sy0HQAc6WwUsvIVhlG1l9ar1t+zw9ljsqNJcivTdcWWdDbWAxaZAzI92d7XhfM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=kw8RxbybnuvWjvJvdKn+53IYxRjna1/UrcEoJ7O2oEPIMTfrjj54FEdK7lHqGaMh6HsVPS0pTiDW5wllRlKhQZelxh6A4A2u/LJt8eL5tSmr4IlG6vJh5Ch3y/E1lI/rfZFXGx9Uj3zWRbBzNaOTn+JUWhiL/0pGXboLMqEORAY=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=mX5XJiOggtCU2h3cbhrU4EW9IR9MqjeUg5nelCtC63g=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794501486774956.4551935908814;
	Thu, 12 Nov 2026 08:38:06 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id CBC96180570; Thu, 12 Nov 2026 17:38:01 +0100 (CET)
Date: Thu, 12 Nov 2026 17:38:01 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: aiyengar1990@gmail.com
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Shawn Lin <shawn.lin@rock-chips.com>, Simon Xue <xxm@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: iommu: arm,smmu-v3: Allow a clock
 and a reset
Message-ID: <avXqeBBO_osbgdgU@venus>
References: <20261112-smmu-v3-pcie-pd-v2-0-3a77bbb6b2c4@gmail.com>
 <20261112-smmu-v3-pcie-pd-v2-1-3a77bbb6b2c4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="axwnauw6ygxsatcc"
Content-Disposition: inline
In-Reply-To: <20261112-smmu-v3-pcie-pd-v2-1-3a77bbb6b2c4@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.497.36
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163819_439535_9ADC2E44 
X-CRM114-Status: GOOD (  23.54  )
X-Spam-Score: -0.2 (/)
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


--axwnauw6ygxsatcc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] dt-bindings: iommu: arm,smmu-v3: Allow a clock
 and a reset
MIME-Version: 1.0

Hi,

On Thu, Nov 12, 2026 at 08:20:22AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> Some SoCs feed the SMMUv3 from a clock that the OS controls. On the
> Rockchip RK3588 the MMU-600 for PCIe runs from ACLK_MMU_PCIE, whose only
> other consumers are the PCIe controllers. When no PCIe controller is
> enabled, the clock framework gates it as unused, and the SMMU can no
> longer be accessed. The same SMMU also has a reset line in the CRU,
> SRST_A_MMU_PCIE.
>=20
> Allow a single clock and a single reset, so that both can be described.
> The architecture defines no clock or reset inputs; the MMU-600 TRM lists
> one clock and one reset signal, and the one integration that needs this
> has one of each. An implementation with more clocks or resets can add
> them with names and a specific compatible.

You can trim that down quite a bit. Don't take over AI text 1:1.

>=20
> Link: https://support.arm.com/documentation/100310/0202/Signal-descriptio=
ns/Clock-and-reset-signals
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/D=
ocumentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> index 3c044e4f03d4..29b81b4fb650 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> @@ -63,6 +63,17 @@ properties:
> =20
>    msi-parent: true
> =20
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Clock of the SMMU's register and memory interfaces, on SoCs where =
the
> +      OS has to keep it running.
> +
> +  resets:
> +    maxItems: 1
> +    description:
> +      Reset of the SMMU, on SoCs where it is controlled by the OS.

The ', on SoCs where it is controlled by the OS.' is completley
useless for both. You need to review your AI output and not take
it over without doing any thinking yourself.

Greetings,

-- Sebastian

>    nvidia,cmdqv:
>      description: |
>        A phandle to its pairing CMDQV extension for an implementation on =
NVIDIA
>=20

--axwnauw6ygxsatcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr162kACgkQ2O7X88g7
+pp8TA/6AvacCvvFrtEJ9uEds7WG2pqKKql3tDgbixgwWbdt4jb9Uno84nloIhoH
j3vlNNjCs1I7sfA9KxDhGSbqZM1Q3EPis3hoktky7vefI8Gk/g6hzxilqwOmKrKK
GJRIRdKDCb5osCgwrqpENYPD8XweBOFu6DKigsdQG/Y+14WfJM2q9DF5mqhwleZL
KTU2j7l0uIeDzrXVhCCQR10zMOJBo1iRL6JZmkvGEv2ph4CsdB3NjV0eG01CVK86
TRnfdKSvT3+L6IPOu7XlCoHQ4BP7wtWOB4Dpb13SxjNXGBSWu0QV6XbZp5lulmdU
d2mNUCrU7P42tdgIVSwGVBwYYyymCvqEnukqAEucWjrvGFD8eSZM2wSANBlbnijS
A5qcPBVfoTjTIUVZg2/bK7yf6mU1oY6kLSZ3w5vIlJ2pNFemTYAv1ZWfs2QPOGqw
6Cro+Q2DTCuU8eSqOVEmzP4BibPeDdNz3M91VvdzW5AD1WXHz4ZWrpueYE4ZtvZi
BOKFfh5QakYt1YXvQU1iw1Nzg8CMyoaLPiZS4vaZg9eK5Z972fm1QAwoMs9jsbNH
hkL/pRIO+517K3U8QHdFJtJevY0ta1vna0itB7GH8IsR0ntE6E6vpRaUA74VsRr4
hD977z7kgv3TjVM1pGp0P4VybhXtvwcU7M4hJXMTRuEsOzwbx6A=
=Wdr0
-----END PGP SIGNATURE-----

--axwnauw6ygxsatcc--

