Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EF5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 23:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=owFgNMwb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b8hmYRrU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PcBmZo2LxPiZ1DooWOhkTG+L22kCLVLPysQqIhdI0es=; b=owFgNMwbDHy5kZb73BWiAXhYN5
	eIZ0zyIqzlYwnbzd8K4R7AREq+FPDZtizPyJjGac1FfLpNY5rEBbcwSdBfgDe3PubgJzxMZxoWiLT
	kgkk2WRwEAuFDGBC+ysyO8nMQ9n5ntyfxVneS9RpnRPsV1YfjTj0Ix3taQQx61Wobsn1eg3jQf8jH
	oTg8nXrKTIuRHG8zAvVkq2p5Ex4q8iYQcn82dXhqWcgF5uLGXuiQx4Drfqn49Lxeav2tLDI8n5i4R
	IKOgoCNIXqYfgZitXOoE+yr54wlufUYq5gg7WCmXsAkqdJlxqJKdyOyiHU4UELhcfsgY+Vlj4FN+u
	S9Og00UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCCM-0000000GtAc-09y9;
	Sun, 08 Nov 2026 23:21:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCCK-0000000GtA8-04SC;
	Sun, 08 Nov 2026 23:21:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 78DF841363;
	Sun,  8 Nov 2026 23:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E541F0089F;
	Sun,  8 Nov 2026 23:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794180074;
	bh=PcBmZo2LxPiZ1DooWOhkTG+L22kCLVLPysQqIhdI0es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b8hmYRrUruhBbHPv68CfkNWMuyiwryxXsIA8qPlCtdx+38OUpfDk0/Q/MARxhe7yg
	 bkGgWgOn6KBfX4a2Jg0pXBU2nRxP8Y0koeyjqoqyJAnL9Hf8Vkg6v5PxqFHHfYUOmR
	 ybdZR0RmkbbpCXXiNuRLELHigVzqUVG5CqElbE+jvfAXslzC7V44LJD4yuHhb5BMJU
	 Qmi7NwBw6HoBvGgXquS+djEiSYIpNLaQvasRMpHp7VyeYikZTAEWgrQTvxHXagTBxj
	 aXlEGX2dDQ/PVmFMySY59PqURczf2hUF5H4jtaIEuaxK3YEZc6a6dDO7TflfkxzBh9
	 AUnmdXai8JIdw==
Date: Sun, 8 Nov 2026 23:21:08 +0000
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
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <20261108-computer-backed-d98862794d18@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hKoZ7BNqYWgXY8wN"
Content-Disposition: inline
In-Reply-To: <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
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

--hKoZ7BNqYWgXY8wN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
> The S7 firmware exposes clocks through SCMI, including sources needed
> by the other clock controllers.
>=20
> Define their identifiers so devicetree can reference these
> firmware-provided clocks.

Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
vary here between versions of the firmware?
They're also not a "made up" set of indexes, like traditional clocks
are, they're real numbers that come from some document akin to
interrupts that we do not have bindings for and no driver is likely to
reference these definitions either right?

Is something like this not more suitable for being included as a header
in the amlogic dts directory?

>=20
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 ++++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/include/d=
t-bindings/clock/amlogic,s7-scmi-clkc.h
> new file mode 100644
> index 000000000000..10d7caa5d1e2
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2026 BayLibre, SAS.
> + */
> +
> +#ifndef __AMLOGIC_S7_SCMI_CLKC_H
> +#define __AMLOGIC_S7_SCMI_CLKC_H
> +
> +#define CLKID_DDR_PHY_OSC			0
> +#define CLKID_USB1_PLL_OSC			1
> +#define CLKID_TOP_PLL_OSC			2
> +#define CLKID_HDMI_PLL_OSC			3
> +#define CLKID_USB0_PHY_PLL_OSC			4
> +#define CLKID_USB1_PHY_PLL_OSC			5
> +#define CLKID_USB0_PLL_OSC			6
> +#define CLKID_ETH_PLL_OSC			7
> +#define CLKID_ADC_PLL_OSC			8
> +#define CLKID_CPU_CLK				9
> +#define CLKID_DSU_CLK				10
> +#define CLKID_GP1_PLL				11
> +#define CLKID_ACLKM				12
> +#define CLKID_PWM_G				13
> +#define CLKID_PWM_H				14
> +#define CLKID_PWM_I				15
> +#define CLKID_PWM_J				16
> +
> +#endif /* __AMLOGIC_S7_SCMI_CLKC_H */
>=20
> --=20
> 2.56.0
>=20

--hKoZ7BNqYWgXY8wN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavED5AAKCRB4tDGHoIJi
0hDPAP9YclqOSMdTbrycJ3d5X3ODkP1cdB9jLCe8Tunz3gRHwwD+Mrj45Sqm1RAo
fyN12kabh2Nu3j+H2vcVuvNGcpj/TAA=
=Zf8q
-----END PGP SIGNATURE-----

--hKoZ7BNqYWgXY8wN--

