Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3AA60A2622
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=11CHHGTo;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PPFZG21/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eE5rfuFrAE7EyUnvlrVRPnNovvwKuchWNSa6LJLS/nE=; b=11CHHGToPdQfFgEV4J1CI9qwy1
	QcYVyxDRUJZXKsY9W+RDRqlmjXnJ/0HoHsqQimqKkYK1GRpA2E6BUSxbgm9hSumvS9yx+mV+UxHBh
	VgSGgOJNIOYum63JbZILZlRwH/dX0roBEU+ZgJqgwXtLUYx0IAzYiEhIMC7xFYJ6LSkE46uZU+yij
	SK9gvv2IWt527yp53IRxH0gaOgwOXE5t+gn+pQQuhrtDMcOUMlrNVnzxtoYVqCY0nJLcgHvKLySZu
	mMC2sx7ivTjRi2FeinB964IG7f34Ly4WoEU4RXWjCp5QtTsf1udTsSf2WbVzTdjal/i/+Z5WunNLC
	f1oE6vrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqzQ-00000004quf-3tQl;
	Tue, 10 Nov 2026 18:54:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqzP-00000004quL-1jVE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 18:54:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84D6044E47;
	Tue, 10 Nov 2026 18:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A45A1F0089F;
	Tue, 10 Nov 2026 18:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336878;
	bh=eE5rfuFrAE7EyUnvlrVRPnNovvwKuchWNSa6LJLS/nE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PPFZG21/eEZ7TiuF/sGhvkL/Sh0x5mWfvE7iOxERQ8fPE0RhXyOymvrqLfDKk1Bzg
	 Jt8fbqbDIHqfU2LocrnKqwHnpIMni2Zzn7PiNQf8sU4IrCMBv0tyMGOV2LgcHblTzG
	 rQqVZpkMQ4rUBuCM01VPpiSNgqoz2PLSN4+9YPnJ3wM4YO+1OW4+Fxy3AvewNowAMv
	 2w5EDNGJM0s6hfSYZ6QFCep8SounMIQvA86IS7hnWTtL1jJ3HSmHOJ6fuFQnSVnwQl
	 SVWEvGoaBA/V/ysgN1N7xV3cTZYiTDeEMd+5QbPDBZYG47VIZlQwcY6Vu9qAoteFUX
	 ih4QehnD971Jw==
Date: Tue, 10 Nov 2026 18:54:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: arm: stm32: Add clock-controller
 sub-node to STM32MP2 SYSCFG
Message-ID: <20261110-confidant-bundle-08385b99bd78@spud>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v1-2-667829cd290a@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HHiI4yu939XMUIIC"
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v1-2-667829cd290a@foss.st.com>
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

--HHiI4yu939XMUIIC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:42:17AM +0100, Gabriel Fernandez wrote:
> The LTDC pixel clock multiplexer of the STM32MP23x and STM32MP25x
> SYSCFG is described by a clock-controller sub-node of the SYSCFG node.
>=20
> Add this sub-node to the SYSCFG binding. It is required on STM32MP23x
> and STM32MP25x and not allowed on the other SoCs.
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Why does this need a child node at all, can't the clock controller
properties go straight into this syscon node?

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml | 6 +++=
+++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index a559f8b03b84..38c844e8f19d 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -45,6 +45,10 @@ properties:
>    "#size-cells":
>      const: 1
> =20
> +  clock-controller:
> +    type: object
> +    $ref: /schemas/clock/st,stm32mp25-syscfg-clk.yaml#
> +
>  patternProperties:
>    "^phy@2[48]00$":
>      type: object
> @@ -80,6 +84,7 @@ allOf:
>          - "#address-cells"
>          - "#clock-cells"
>          - "#size-cells"
> +        - clock-controller
>          - phy@2400
>          - phy@2800
>      else:
> @@ -87,6 +92,7 @@ allOf:
>          '#address-cells': false
>          '#clock-cells': false
>          '#size-cells': false
> +        clock-controller: false
>          phy@2400: false
>          phy@2800: false
> =20
>=20
> --=20
> 2.43.0
>=20

--HHiI4yu939XMUIIC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavNoaQAKCRB4tDGHoIJi
0iZXAP9cnh198rDZ/sUSZ260FfuknKWIsjUf89bqGNDkZUL2sQEA2zKAIIi4Rl1B
iDzxXQOq8c3ujrIfaJuAzDie/dAXkwI=
=KdWK
-----END PGP SIGNATURE-----

--HHiI4yu939XMUIIC--

