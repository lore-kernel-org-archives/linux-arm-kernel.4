Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295D4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qbSOTjp+;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vw+/4wI1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GinYeuNS3zfPdQXqlusCQKkgNkcFSglZQRXMNJzrcEw=; b=qbSOTjp+ez6gnA
	Foy6VEfnKpvnGbDZoUu1qkWX4boSmZepO6CbRMCzawjoJdX6vKgdGnr4ztsMu79v4rnKFopNYlkkZ
	6jZCId3IEXHBqqVKIV1J/G9j/M7F0ag7sDwwki8RnxRymJgyDh5KjHdcQmofVrunfON8Qa9x4W1FO
	yNEjojNhD4Dc0uT+c4R8MU4Y/QhzeNAh6/DKRP3z7xgfUNBy2EzhC/1KC1TfeZpCT8h+07JwJkOUF
	xYXZLc8UF+SFXQndVVbFhmybjw/gKGQt3dOOf4LGDkPvyon5TjYV7DdOotuqdZ917+XXy8qFpQYow
	MS03MdbyMwHys9eSYkdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyJt-0000000GwBh-3iYw;
	Fri, 27 Nov 2026 15:57:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyJc-0000000Gw20-3nYX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:56:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 891841A183B;
	Fri, 27 Nov 2026 15:56:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5587F6049C;
	Fri, 27 Nov 2026 15:56:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2F2A11E90CB9;
	Fri, 27 Nov 2026 16:56:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795795004; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GinYeuNS3zfPdQXqlusCQKkgNkcFSglZQRXMNJzrcEw=;
	b=vw+/4wI1eNKzgBTkcg+mP0sLawsTJWyL33ypf6d3M7itaBDh+KtfxdJLyA2dMsahd5+noR
	yT8uVa2XmLT+IB/N38ogtHxa10ag25dpmqTPGJokWuac7ci8Q4CjPBomCgL9OjQkxUV5cp
	ZUDItJABgC2hzlHAJ5gtQr5sMli0R2Mkph5DgUk+Z5BY8+sz9vcIfsYppNVVOboojGugHT
	sV3JNYlJc/I+1LlPAg0xZ8YBM8xE4uavD/B9LzMxxPSbo0zAPzUJ8Bvcx/jL867ol14m1b
	qvNa6qAo1SmPcbFbIdKCPEfX7z9AJEdhmia/469paM7fjVO29XvFcPwDl+DZ4Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Udaya Kiran Challa <challauday369@gmail.com>, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lee@kernel.org
Cc: skhan@linuxfoundation.org, me@brighamcampbell.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Udaya Kiran Challa
 <challauday369@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, kernel
 test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: kirkwood: Rename netxbig LED child
 nodes to led-*
In-Reply-To: <20261027172052.129283-1-challauday369@gmail.com>
References: <20261027172052.129283-1-challauday369@gmail.com>
Date: Fri, 27 Nov 2026 16:56:41 +0100
Message-ID: <871p861d52.fsf@BLaptop.bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_075649_111417_87878ADB 
X-CRM114-Status: GOOD (  12.38  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Udaya Kiran Challa <challauday369@gmail.com> writes:

> Rename the LED child nodes in kirkwood-netxbig.dtsi and
> kirkwood-net5big.dts from descriptive names (e.g. blue-power, red-sata0)
> to generic led-* names to match the new YAML binding schema.
>
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Fixes: 59cf91cf87ab ("dt-bindings: leds: lacie,netxbig-leds: Convert to D=
T schema")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610270710.aWUm0pbv-lkp@i=
ntel.com/
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
>  arch/arm/boot/dts/marvell/kirkwood-net5big.dts  | 14 +++++++-------
>  arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi | 14 +++++++-------
>  2 files changed, 14 insertions(+), 14 deletions(-)


Applied on mvebu/dt

Thanks,

Gregory

>
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts b/arch/arm/bo=
ot/dts/marvell/kirkwood-net5big.dts
> index 2497ad26b5b6..49deeb40f4e2 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
> +++ b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
> @@ -85,8 +85,8 @@ g762_clk: g762-oscillator {
>  		};
>  	};
>=20=20
> -	netxbig-leds {
> -		blue-sata2 {
> +	leds {
> +		led-0 {
>  			label =3D "netxbig:blue:sata2";
>  			mode-addr =3D <5>;
>  			mode-val =3D <NETXBIG_LED_OFF 0
> @@ -96,7 +96,7 @@ NETXBIG_LED_SATA 1
>  			bright-addr =3D <2>;
>  			max-brightness =3D <7>;
>  		};
> -		red-sata2 {
> +		led-1 {
>  			label =3D "netxbig:red:sata2";
>  			mode-addr =3D <5>;
>  			mode-val =3D <NETXBIG_LED_OFF 0
> @@ -105,7 +105,7 @@ NETXBIG_LED_ON 2
>  			bright-addr =3D <2>;
>  			max-brightness =3D <7>;
>  		};
> -		blue-sata3 {
> +		led-2 {
>  			label =3D "netxbig:blue:sata3";
>  			mode-addr =3D <6>;
>  			mode-val =3D <NETXBIG_LED_OFF 0
> @@ -115,7 +115,7 @@ NETXBIG_LED_SATA 1
>  			bright-addr =3D <2>;
>  			max-brightness =3D <7>;
>  		};
> -		red-sata3 {
> +		led-3 {
>  			label =3D "netxbig:red:sata3";
>  			mode-addr =3D <6>;
>  			mode-val =3D <NETXBIG_LED_OFF 0
> @@ -124,7 +124,7 @@ NETXBIG_LED_ON 2
>  			bright-addr =3D <2>;
>  			max-brightness =3D <7>;
>  		};
> -		blue-sata4 {
> +		led-4 {
>  			label =3D "netxbig:blue:sata4";
>  			mode-addr =3D <7>;
>  			mode-val =3D <NETXBIG_LED_OFF 0
> @@ -134,7 +134,7 @@ NETXBIG_LED_SATA 1
>  			bright-addr =3D <2>;
>  			max-brightness =3D <7>;
>  		};
> -		red-sata4 {
> +		led-5 {
>  			label =3D "netxbig:red:sata4";
>  			mode-addr =3D <7>;
>  			mode-val =3D <NETXBIG_LED_OFF 0
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi b/arch/arm/b=
oot/dts/marvell/kirkwood-netxbig.dtsi
> index d4edf2727388..23e8e8b4597d 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
> +++ b/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
> @@ -115,7 +115,7 @@ &gpio1 13 GPIO_ACTIVE_HIGH
>  		enable-gpio =3D <&gpio0 29 GPIO_ACTIVE_HIGH>;
>  	};
>=20=20
> -	netxbig-leds {
> +	leds {
>  		compatible =3D "lacie,netxbig-leds";
>=20=20
>  		gpio-ext =3D <&netxbig_gpio_ext>;
> @@ -123,7 +123,7 @@ netxbig-leds {
>  		timers =3D <NETXBIG_LED_TIMER1 500 500
>  			  NETXBIG_LED_TIMER2 500 1000>;
>=20=20
> -		blue-power {
> +		led-0 {
>  			label =3D "netxbig:blue:power";
>  			mode-addr =3D <0>;
>  			mode-val =3D <NETXBIG_LED_OFF 0
> @@ -133,7 +133,7 @@ NETXBIG_LED_TIMER1 3
>  			bright-addr =3D <1>;
>  			max-brightness =3D <7>;
>  		};
> -		red-power {
> +		led-1 {
>  			label =3D "netxbig:red:power";
>  			mode-addr =3D <0>;
>  			mode-val =3D <NETXBIG_LED_OFF 0
> @@ -142,7 +142,7 @@ NETXBIG_LED_ON 2
>  			bright-addr =3D <1>;
>  			max-brightness =3D <7>;
>  		};
> -		blue-sata0 {
> +		led-2 {
>  			label =3D "netxbig:blue:sata0";
>  			mode-addr =3D <3>;
>  			mode-val =3D <NETXBIG_LED_OFF 0
> @@ -152,7 +152,7 @@ NETXBIG_LED_SATA 1
>  			bright-addr =3D <2>;
>  			max-brightness =3D <7>;
>  		};
> -		red-sata0 {
> +		led-3 {
>  			label =3D "netxbig:red:sata0";
>  			mode-addr =3D <3>;
>  			mode-val =3D <NETXBIG_LED_OFF 0
> @@ -161,7 +161,7 @@ NETXBIG_LED_ON 2
>  			bright-addr =3D <2>;
>  			max-brightness =3D <7>;
>  		};
> -		blue-sata1 {
> +		led-4 {
>  			label =3D "netxbig:blue:sata1";
>  			mode-addr =3D <4>;
>  			mode-val =3D <NETXBIG_LED_OFF 0
> @@ -171,7 +171,7 @@ NETXBIG_LED_SATA 1
>  			bright-addr =3D <2>;
>  			max-brightness =3D <7>;
>  		};
> -		red-sata1 {
> +		led-5 {
>  			label =3D "netxbig:red:sata1";
>  			mode-addr =3D <4>;
>  			mode-val =3D <NETXBIG_LED_OFF 0
> --=20
> 2.34.1
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

