Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B98606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0GMbyc0O;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lnnlh9in
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CGNf1O2wX9MR4NQSLoWq+A36asloTIZogkdNhe+ZehE=; b=0GMbyc0OIulmbUvAu8SOcGgztj
	ALhqBDhGmkRBJw9zRoBergXulsSsDSOJMFPWiaGcuxBNwt9wDds5FmmIFzCkD1vT32fp0dH5FuGsm
	mthhXk8/QAAiAydISuylmtZJ28Iym2K02Krv7QDKF7wrJ96lffg2LesLvoub6T/9GRR4QwXxkOrNA
	sKA0eyfWyhiYCyAIgCWcwdwkWVr+yxTLCz32vKD0s8zvuyqO5ldRbS4OsZp1Hc2xkacTVWE3Unlty
	NNQFkYfFkWN0RD0df3rcd4GXiHffdILmWGA5GQ3qrW0vmAfjmzYfv1SIOeqVPKAMAGgNi2bV6OHj1
	Ao8J5kfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMyX-00000006Z1Q-2BMS;
	Tue, 17 Nov 2026 17:28:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMyW-00000006Z0s-0fy0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:28:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 593E060CB5;
	Tue, 17 Nov 2026 17:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB051F000C5;
	Tue, 17 Nov 2026 17:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936487;
	bh=CGNf1O2wX9MR4NQSLoWq+A36asloTIZogkdNhe+ZehE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lnnlh9inJ6o/1qosKUEp7PBgwZdkUXA3L5+hn3VKZsEsWYIppauWnJbAquuI8srjb
	 7eroWmMabep0wZPx7ktACoKM594ZaI4W5AeYOPpHBn4vzfkZ3g1fbAiuJUbie+C4Ga
	 ovUa0zMtehCMIFlCU8mMtI+oxFxfEXE0cmqFwRPnkGN7LLL3nt5Szkh5WX8K972KHH
	 vDzIdy7vsHhCB4IU1s5eOiO85WdKCteVdRdub7/eWGae0Ee+VX6wK0tufHECCd7JKE
	 dLFZhcZW5WHVdHiK4ooH2O4IEBMrNHdDA1WASSDX+uhfXct9DRpZ6nogkeApyAipHk
	 +A0hwzPJrJ7zQ==
Date: Tue, 17 Nov 2026 17:28:00 +0000
From: Conor Dooley <conor@kernel.org>
To: yogo.0917.sabu@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Ulf Hansson <ulfh@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-doc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH RFC 1/6] dt-bindings: add SiRF AT550 and Yupiteru
 YPL514si descriptions
Message-ID: <20261117-tableware-geologic-c2bc6f295a4a@spud>
References: <20261117-at550-rfc-v1-v1-0-5879573cb825@gmail.com>
 <20261117-at550-rfc-v1-v1-1-5879573cb825@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uyL+d5MTotBFRQBA"
Content-Disposition: inline
In-Reply-To: <20261117-at550-rfc-v1-v1-1-5879573cb825@gmail.com>
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

--uyL+d5MTotBFRQBA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:06:51PM +0900, yy-Local-LLM via B4 Relay wrote:
> From: yy-Local-LLM <yogo.0917.sabu@gmail.com>
>=20
> Describe the 64-source interrupt controller, counter/match timer,
> resistive touch input and PIO SD host, together with the YPL514si board
> compatible. The counter clock is supplied by boot firmware after its
> configured divider. The initial platform inherits firmware clock and pin
> setup.
>=20
> Signed-off-by: yy-Local-LLM <yogo.0917.sabu@gmail.com>

It's okay to use an LLM, it's not okay to submit something like that
that appears to not have any human in the loop that understands what is
being submitted. Look around the tree, what other recent submissions
look anything like this? None.
pw-bot: changes-requested

Conor.

> ---
>  .../devicetree/bindings/arm/sirf,at550.yaml        | 22 ++++++++++
>  .../bindings/input/touchscreen/sirf,at550-ts.yaml  | 36 +++++++++++++++
>  .../interrupt-controller/sirf,at550-intc.yaml      | 46 ++++++++++++++++=
+++
>  .../devicetree/bindings/mmc/sirf,at550-sdhci.yaml  | 51 ++++++++++++++++=
++++++
>  .../bindings/timer/sirf,at550-timer.yaml           | 47 ++++++++++++++++=
++++
>  .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
>  MAINTAINERS                                        |  9 ++++
>  7 files changed, 213 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sirf,at550.yaml b/Docu=
mentation/devicetree/bindings/arm/sirf,at550.yaml
> new file mode 100644
> index 000000000..f538f7ccc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/sirf,at550.yaml
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/sirf,at550.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiRF AT550 platforms
> +
> +maintainers:
> +  - yy-Local-LLM <yogo.0917.sabu@gmail.com>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    items:
> +      - const: yupiteru,ypl514si
> +      - const: sirf,at550
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/sirf,at5=
50-ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/sirf,at550=
-ts.yaml
> new file mode 100644
> index 000000000..0458db241
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/sirf,at550-ts.y=
aml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/sirf,at550-ts.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiRF AT550 resistive touchscreen
> +
> +maintainers:
> +  - yy-Local-LLM <yogo.0917.sabu@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: sirf,at550-ts
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    touchscreen@80120000 {
> +        compatible =3D "sirf,at550-ts";
> +        reg =3D <0x80120000 0x1000>;
> +        touchscreen-size-x =3D <4096>;
> +        touchscreen-size-y =3D <4096>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sirf,=
at550-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/si=
rf,at550-intc.yaml
> new file mode 100644
> index 000000000..ec68afa80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sirf,at550-i=
ntc.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/sirf,at550-intc.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiRF AT550 interrupt controller
> +
> +maintainers:
> +  - yy-Local-LLM <yogo.0917.sabu@gmail.com>
> +
> +description:
> +  The AT550 controller routes 64 level-sensitive interrupt sources to the
> +  ARM1136 IRQ input. Each source has a fixed active level; the single in=
terrupt
> +  cell is the source number. Firmware FIQ routes are not exposed by this=
 driver.
> +
> +properties:
> +  compatible:
> +    const: sirf,at550-intc
> +  reg:
> +    maxItems: 1
> +  interrupt-controller: true
> +  '#interrupt-cells':
> +    const: 1
> +  '#address-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@90020000 {
> +        compatible =3D "sirf,at550-intc";
> +        reg =3D <0x90020000 0x1000>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <1>;
> +        #address-cells =3D <0>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/mmc/sirf,at550-sdhci.yaml =
b/Documentation/devicetree/bindings/mmc/sirf,at550-sdhci.yaml
> new file mode 100644
> index 000000000..7129aaeec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/sirf,at550-sdhci.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/sirf,at550-sdhci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiRF AT550 SDHCI host controller
> +
> +maintainers:
> +  - yy-Local-LLM <yogo.0917.sabu@gmail.com>
> +
> +description:
> +  AT550 removable SD controller. Initial support uses programmed I/O and
> +  firmware-configured clocks and pin multiplexing. DMA address translati=
on
> +  and 1.8 V operation are not described by this binding.
> +
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: sirf,at550-sdhci
> +  reg:
> +    maxItems: 1
> +  interrupts:
> +    maxItems: 1
> +  bus-width:
> +    enum: [1, 4]
> +  no-1-8-v: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - no-1-8-v
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    mmc@56000000 {
> +        compatible =3D "sirf,at550-sdhci";
> +        reg =3D <0x56000000 0x1000>;
> +        interrupt-parent =3D <&intc>;
> +        interrupts =3D <36>;
> +        bus-width =3D <4>;
> +        max-frequency =3D <25000000>;
> +        no-1-8-v;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/timer/sirf,at550-timer.yam=
l b/Documentation/devicetree/bindings/timer/sirf,at550-timer.yaml
> new file mode 100644
> index 000000000..d1465d438
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/sirf,at550-timer.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/sirf,at550-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiRF AT550 system timer
> +
> +maintainers:
> +  - yy-Local-LLM <yogo.0917.sabu@gmail.com>
> +
> +description:
> +  A free-running counter with six match channels. The Linux driver uses =
the
> +  low 32 counter bits and match channel zero. Firmware configures the di=
vider
> +  before boot and supplies the resulting counter clock. A running watchd=
og
> +  must be disabled by firmware before this block is handed to Linux.
> +
> +properties:
> +  compatible:
> +    const: sirf,at550-timer
> +  reg:
> +    maxItems: 1
> +  interrupts:
> +    maxItems: 1
> +  clocks:
> +    items:
> +      - description: Counter clock after the firmware-configured divider
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@90050000 {
> +        compatible =3D "sirf,at550-timer";
> +        reg =3D <0x90050000 0x1000>;
> +        interrupt-parent =3D <&intc>;
> +        interrupts =3D <0>;
> +        clocks =3D <&counter_clk>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 5471a06f9..a8927fea3 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1985,6 +1985,8 @@ patternProperties:
>      description: Shenzhen Yashi Changhua Intelligent Technology Co., Ltd.
>    "^ysoft,.*":
>      description: Y Soft Corporation a.s.
> +  "^yupiteru,.*":
> +    description: Yupiteru
>    "^yuridenki,.*":
>      description: Yuridenki-Shokai Co. Ltd.
>    "^yuzukihd,.*":
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d73899016..6c3702cd8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25847,6 +25847,15 @@ F:	drivers/gpio/gpio-siox.c
>  F:	drivers/siox/*
>  F:	include/trace/events/siox.h
> =20
> +SIRF AT550 PLATFORM
> +M:	yy-Local-LLM <yogo.0917.sabu@gmail.com>
> +S:	Odd Fixes
> +F:	Documentation/devicetree/bindings/arm/sirf,at550.yaml
> +F:	Documentation/devicetree/bindings/input/touchscreen/sirf,at550-ts.yaml
> +F:	Documentation/devicetree/bindings/interrupt-controller/sirf,at550-int=
c.yaml
> +F:	Documentation/devicetree/bindings/mmc/sirf,at550-sdhci.yaml
> +F:	Documentation/devicetree/bindings/timer/sirf,at550-timer.yaml
> +
>  SIS 190 ETHERNET DRIVER
>  M:	Francois Romieu <romieu@fr.zoreil.com>
>  L:	netdev@vger.kernel.org
>=20
> --=20
> 2.56.0
>=20
>=20

--uyL+d5MTotBFRQBA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavyOoAAKCRB4tDGHoIJi
0nZWAQD2VwX1lmubRbbDr8OPc7uw3FcgQZVFRko0QaMOvllh2QEA6OXdvFQ8xQKf
wwavfkXRS5p/uAyJYH6posMgOG8V8wA=
=f1Ec
-----END PGP SIGNATURE-----

--uyL+d5MTotBFRQBA--

