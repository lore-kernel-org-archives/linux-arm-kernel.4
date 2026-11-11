Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F59606A8B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ShIW1BVT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hla1Zo5f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yMBHhxbvHmek25iNNzt/fSW9M/YAXtODnCUwnhn31Yw=; b=ShIW1BVTYJsET0460SmGfP2v/c
	98IzXWwhezXsd0fueMqio0dQHmImivXRmLBkcTLSNTN3NFnXJwoaaTnIKOuQdWBYa/Gr74FzN1Sl5
	Ez/CT3vfY5FTHq7wjNQ3f3iNa5wEPSxN8jyWYexV/Op9JVG7M6gZsSBEdQEo2++E9Ig+DWQ+UIlDu
	EkqHXYaPp0cOsCaZ9OuO5W+7yKzZ1v6si8Y8gPfyVkGT3BOJ33YcT6kBXIHFS9CricrT+Mndgej6U
	f+GtFFbRKj/j5ShiANKXTbg1018TbAPtn8JKOtwOR9WbdvL3qBcvyegQQGiSShPaC1tOJnd4OzURP
	KCYcMdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCmu-00000007NTk-1iug;
	Wed, 11 Nov 2026 18:11:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCmt-00000007NTb-1skD;
	Wed, 11 Nov 2026 18:11:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F095840E56;
	Wed, 11 Nov 2026 18:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EC31F00AC8;
	Wed, 11 Nov 2026 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794420670;
	bh=yMBHhxbvHmek25iNNzt/fSW9M/YAXtODnCUwnhn31Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hla1Zo5f8KHVEC2e6ZsF8gZqra+uYUowhu6Eu/gSJ2vXpqE2Q5bYCTJlwBBJf2lgQ
	 ETuuVgjzc+C5tDTcVWvAe9w+N7G51+gwaMCUw7Q67qohNsMZPf3XKr2razL2HxcHM1
	 gA5futdg0YSFb26D3qbD2OwYa3pIiyoA2Qehw1nBYQMidrEWNGMemoeHcHBmXAM+3r
	 7zWnpX7OJbKzCJt5nM1GHKncWIio18r9H+X/PwyDG04GF5hFjpgo1dT3GxZE5YGTt8
	 D5iKF+QJ0SHIuLPdLAVztasxRVvnvvmv5lpv8GAfnlKRLdxlkFms5nnmXdXcELFvf5
	 CXZpFymY8TLMw==
Date: Wed, 11 Nov 2026 18:11:05 +0000
From: Conor Dooley <conor@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Rajeev.kumar@airoha.com,
	upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mt7621: add Airoha AN7589
Message-ID: <20261111-federal-pleat-191852ed2822@spud>
References: <20261111093941.691801-1-john@phrozen.org>
 <20261111093941.691801-2-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PMGK6tzsdZTya8NZ"
Content-Disposition: inline
In-Reply-To: <20261111093941.691801-2-john@phrozen.org>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--PMGK6tzsdZTya8NZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 10:39:40AM +0100, John Crispin wrote:
> The Airoha AN7589 carries the MT7621 I2C controller with a second
> control register holding a wider clock divider. Give it a compatible of
> its own so the driver can tell the variants apart.

I assume a fallback is not suitable here because setting this wider
divider is a requirement?

>=20
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  .../devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml      | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> index 118ec00fc190..28659bdd72f5 100644
> --- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> @@ -9,12 +9,18 @@ maintainers:
> =20
>  title: Mediatek MT7621/MT7628 I2C master controller
> =20
> +description:
> +  The same controller is used on Airoha SoCs. The AN7589 variant adds a
> +  second control register with a wider clock divider.
> +
>  allOf:
>    - $ref: /schemas/i2c/i2c-controller.yaml#
> =20
>  properties:
>    compatible:
> -    const: mediatek,mt7621-i2c
> +    enum:
> +      - airoha,an7589-i2c
> +      - mediatek,mt7621-i2c
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.34.1
>=20

--PMGK6tzsdZTya8NZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavSvuQAKCRB4tDGHoIJi
0iz2APoC+/pL38Hhk9ni7vQnB5Jy70F+PVBfryx7CexSJbVGKQEA33Dx/8Km+2K1
X4AQByWlXEYYC/jmyQC/C8Qz3rjeRgw=
=Pjb8
-----END PGP SIGNATURE-----

--PMGK6tzsdZTya8NZ--

