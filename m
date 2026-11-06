Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C5D606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4MkpeH97;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ho15CKcB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sm4OrPi0zAjxyxaN26uT9wuIudWQNgaYQxVZ5vD4Joc=; b=4MkpeH97zhriHKZ0Xq6YvcXHj2
	PVgz3LMV0BrQDbN0PoT8IaO76DyGf1dGxQT9TcyWwCrqTE45DrxX2LYmnoe8ap67BxKb7y7RqLVD/
	0oPT3B1SleufW3uleDq23rFjnmRFroq9H+hjP6I4DQYggfV4FYHC3Hams9fLC12/ycN/M0jmHMJBn
	V2kdISrNhgr5gM2qRFyUnZIFPHZ+BYn6jGm0/PqNzN10kE7Iv73dVvWo4WkKa6k30PoBase/8ABh2
	zUY821g29fJ7qy+0RYDCPCy6F0VvSkMvf4RFbF+g84wrEzPlt9yZlATjJgyFxU+iJssQyNxqtPPVg
	L+4wNf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNqz-0000000DFFK-15Q6;
	Fri, 06 Nov 2026 17:35:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNqx-0000000DFEn-2Zca;
	Fri, 06 Nov 2026 17:35:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EE3F40DAB;
	Fri,  6 Nov 2026 17:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019931F0089F;
	Fri,  6 Nov 2026 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793986551;
	bh=sm4OrPi0zAjxyxaN26uT9wuIudWQNgaYQxVZ5vD4Joc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ho15CKcB7O4FZs2HAbtefpKLJ/LqAH8zzCA74y7TPaatxXg0QE8bv/qA3KELSY6EW
	 4NkpZqnp9/XvJAmRE/fUfWtPhr+EPvI/E64BEgo5puMhL6O7BI0T4cMbleCI1EleiI
	 basOdYQyENe27qbK+jycvzN1+7mfXgCnYuTl2U/ljl9Hrq8U5CYWYnnsfIYH9el36+
	 73C2bo8RjaoT5VFRXhEVgUX7H0dHGQwwFN9DPs84gv+6b4RVRFn4pGuq0gclGif5VB
	 Na6rXacF7nQFpSh+Z+V+pF9eZDOOVyv6pvtHMjfWv35XmERXu73oaB5a+r8FrQgvuW
	 +szG84Z/vn31w==
Date: Fri, 6 Nov 2026 17:35:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/7] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
Message-ID: <20261106-armed-spoils-909d7d4f7d21@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O0FeJVII/ayv5UPE"
Content-Disposition: inline
In-Reply-To: <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
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

--O0FeJVII/ayv5UPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 09:30:27AM +0100, Carlo Caione wrote:
> The S7 PLL controller supplies clock sources for the peripheral clock
> tree and receives its reference clocks through firmware-controlled
> oscillator gates.
>=20
> Add the binding and clock identifiers needed to describe this
> controller and its connections.
>=20
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

This looks okay, but I don't want to sign off on it before seeing an
answer the my quesiton on the other binding.

Thanks,
Conor.

> ---
>  .../bindings/clock/amlogic,s7-pll-clkc.yaml        | 73 ++++++++++++++++=
++++++
>  include/dt-bindings/clock/amlogic,s7-pll-clkc.h    | 42 +++++++++++++
>  2 files changed, 115 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.=
yaml b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
> new file mode 100644
> index 000000000000..e2b5ba5524a7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2026 BayLibre, SAS.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,s7-pll-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic S7 Series PLL Clock Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Carlo Caione <ccaione@baylibre.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,s7-pll-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: input fixed pll
> +      - description: input gp0 pll
> +      - description: input hifi pll
> +      - description: input hifi1 pll
> +      - description: input hdmi pll
> +
> +  clock-names:
> +    items:
> +      - const: fix
> +      - const: gp0
> +      - const: hifi
> +      - const: hifi1
> +      - const: hdmi
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        clock-controller@8000 {
> +            compatible =3D "amlogic,s7-pll-clkc";
> +            reg =3D <0x0 0x8000 0x0 0x1e8>;
> +            #clock-cells =3D <1>;
> +            clocks =3D <&scmi_clk CLKID_TOP_PLL_OSC>,
> +                     <&scmi_clk CLKID_TOP_PLL_OSC>,
> +                     <&scmi_clk CLKID_TOP_PLL_OSC>,
> +                     <&scmi_clk CLKID_TOP_PLL_OSC>,
> +                     <&scmi_clk CLKID_HDMI_PLL_OSC>;
> +            clock-names =3D "fix",
> +                          "gp0",
> +                          "hifi",
> +                          "hifi1",
> +                          "hdmi";
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/amlogic,s7-pll-clkc.h b/include/dt=
-bindings/clock/amlogic,s7-pll-clkc.h
> new file mode 100644
> index 000000000000..4014314a3eb0
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2026 BayLibre, SAS.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
> +#define _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
> +
> +#define CLKID_FIXED_PLL_VCO			0
> +#define CLKID_FIXED_PLL				1
> +#define CLKID_FCLK_DIV2_DIV			2
> +#define CLKID_FCLK_DIV2				3
> +#define CLKID_FCLK_DIV3_DIV			4
> +#define CLKID_FCLK_DIV3				5
> +#define CLKID_FCLK_DIV4_DIV			6
> +#define CLKID_FCLK_DIV4				7
> +#define CLKID_FCLK_DIV5_DIV			8
> +#define CLKID_FCLK_DIV5				9
> +#define CLKID_FCLK_DIV7_DIV			10
> +#define CLKID_FCLK_DIV7				11
> +#define CLKID_FCLK_DIV2P5_DIV			12
> +#define CLKID_FCLK_DIV2P5			13
> +#define CLKID_GP0_PLL_DIV0P5			14
> +#define CLKID_GP0_PLL_VCO			15
> +#define CLKID_GP0_PLL				16
> +#define CLKID_HIFI_PLL_DIV0P5			17
> +#define CLKID_HIFI_PLL_VCO			18
> +#define CLKID_HIFI_PLL				19
> +#define CLKID_HIFI1_PLL_DIV0P5			20
> +#define CLKID_HIFI1_PLL_VCO			21
> +#define CLKID_HIFI1_PLL				22
> +#define CLKID_HDMI_PLL_DIV0P5			23
> +#define CLKID_HDMI_PLL_VCO			24
> +#define CLKID_HDMI_PLL_OD0			25
> +#define CLKID_HDMI_PLL_OD1			26
> +#define CLKID_HDMI_PLL				27
> +#define CLKID_HDMI_PLL_PIX_DIV5			28
> +#define CLKID_HDMI_PLL_PIX_DIV6P25		29
> +#define CLKID_HDMI_PLL_PIX_DIV7P5		30
> +#define CLKID_HDMI_PLL_PIX			31
> +
> +#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H */
>=20
> --=20
> 2.56.0
>=20

--O0FeJVII/ayv5UPE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4P8QAKCRB4tDGHoIJi
0k29AQCTJ294Vyu8WoKtwTE8vCVIj2e8Prhj+z474CV/zh6qUgD/QuGi2AwUeJZM
rEmZ2XkOgYe+EHZj67+lAYXHcliGTgQ=
=Aa3O
-----END PGP SIGNATURE-----

--O0FeJVII/ayv5UPE--

