Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BD8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2F/UNfJz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwJ5nb/u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o/9JOxpI2/7CQXqdlvWs/lcxk0emk3kCWaaIB+hKwgY=; b=2F/UNfJzt9UCBcEcizDNmnu9og
	oe8ETXh7/cVYRCb+iqu4gRWDk7e5GJgYSsu6+K60Wb7B3D7CG0mCcQIijPZwt3s3N7HOHYo1eYYyu
	J9Oox4KYjTtmAR5lpYeXtZs6P7Uj5hxXtM6F/VOhxnt2Se8dFk0IUbaNV+tDwdsD2VsTxbUaTMAxy
	+Ve4ej2nIkPFwDUmbDCNJ7FylC7+M4n98X06WxlrzVzdzvNIuU5/qAAddfqkrW1tKXdXqh1LtS0yy
	VRK+EGJFdap4OqFf6DIooxHjW3oBaa+Ux8/gq1LvnXzDpbBXKUJqbsq98iwHUQWjh0oLcaSo4blEt
	ujyzMlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqhm-00000004oIG-00et;
	Tue, 10 Nov 2026 18:36:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqhj-00000004oHg-2iIY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 18:36:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FC1440E56;
	Tue, 10 Nov 2026 18:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED9E1F008A3;
	Tue, 10 Nov 2026 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794335783;
	bh=o/9JOxpI2/7CQXqdlvWs/lcxk0emk3kCWaaIB+hKwgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RwJ5nb/uG5KNkgG2SOgAhOM5Cvz+Z40dsqL0z7aySCK4t1I8/oq9I3B1RPqCKZOU6
	 cMMPUmvqF94sGROh03MSpfPaDpBnq04YIcBGljeCiD/1rrPB1rh5WlEyh45GVVO4cq
	 usn8DX7xSRI4/RkFgS4WTXBbYr62/dfTdSIxO64s2Z9K8r2/R0TUzy2XdgvPenLXGr
	 eVkBb8ybN/luKqoz0dL9cSAPVmL2xszKLpaqoxvcbpxmdierlQrXrpobm6H66IbOPd
	 LlJBc6HWf8y5hOn/6IzKeL8EIX0+zV7FaJwFY81KP81TL6CsEOa4Ps6C01NiQijS10
	 CiOQF1FVa5P9Q==
Date: Tue, 10 Nov 2026 18:36:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
 controller
Message-ID: <20261110-dingy-unaligned-377ac75bb5bc@spud>
References: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
 <20261110111419.89535-2-fyhsueh4linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qv4BxQDfbEUAvEjd"
Content-Disposition: inline
In-Reply-To: <20261110111419.89535-2-fyhsueh4linux@gmail.com>
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

--Qv4BxQDfbEUAvEjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 07:14:18PM +0800, Feng-Yi Hsueh wrote:
> Document the Nuvoton MA35D1 hardware matrix keypad controller.
>=20
> The controller supports up to eight rows and eight columns
> and generates interrupts for key press and release events.
>=20
> Signed-off-by: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>

Most of what the bot says seems valid to implement,
pw-bot: changes-requested

Thanks,
Conor.

> ---
>  .../bindings/input/nuvoton,ma35d1-keypad.yaml | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d=
1-keypad.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypa=
d.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> new file mode 100644
> index 000000000000..be678d0b38b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Matrix Keypad Controller
> +
> +maintainers:
> +  - Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
> +
> +description: |
> +  The Nuvoton MA35D1 keypad controller scans a matrix of up to eight rows
> +  and eight columns and reports key press and release interrupts.
> +
> +allOf:
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-keypad
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  keypad,num-rows:
> +    minimum: 2
> +    maximum: 8
> +
> +  keypad,num-columns:
> +    minimum: 1
> +    maximum: 8
> +
> +  autorepeat:
> +    type: boolean
> +    description: Enable key autorepeat events.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - keypad,num-rows
> +  - keypad,num-columns
> +  - linux,keymap
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +
> +    keypad@404a0000 {
> +        compatible =3D "nuvoton,ma35d1-keypad";
> +        reg =3D <0x404a0000 0x10000>;
> +        interrupts =3D <79>;
> +        clocks =3D <&clk>;
> +
> +        keypad,num-rows =3D <4>;
> +        keypad,num-columns =3D <1>;
> +        linux,keymap =3D <
> +            MATRIX_KEY(0, 0, KEY_1)
> +            MATRIX_KEY(1, 0, KEY_2)
> +            MATRIX_KEY(2, 0, KEY_3)
> +            MATRIX_KEY(3, 0, KEY_4)
> +        >;
> +    };
> --=20
> 2.43.0
>=20

--Qv4BxQDfbEUAvEjd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavNkIgAKCRB4tDGHoIJi
0hSzAQCKMBN2QbVi/h1KHYGGkzgqlIPuWmK2ry8I+T84uCGD1QD+J47KIlwrgiRj
27vxsEA9CS9u2nAtNbd+piMnxqSdUAg=
=vTqZ
-----END PGP SIGNATURE-----

--Qv4BxQDfbEUAvEjd--

