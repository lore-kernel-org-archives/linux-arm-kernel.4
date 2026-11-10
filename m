Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49622606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1oo4142E;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=kTpQnGaH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=; b=1oo4142Ey2P1il
	7tnjAtzfHKuSYb2Kud51xACaEw9k3IqK92mhCM5DHf3EFjncafusaZjWLVrsTY/+vBH9cOk81v9p/
	89xTJD3BjsoLXc/um43cXYXpNjA40hbstI5dP/yObIoDN8OaGbN88GrZnLtP1TZ8Hyaqy5NfIIdb2
	BcSjPnY6bVPL41889W96OQG+IP7FluA7pWZB07pQX7z3y2GVeiJV011PuhQ519/bDrovHeCZxbear
	6IRXlkaLjlEGa27YBvw11BIfTUKubqYC4mHz69jMW8rt4ypHasxXFN2BBOGXL4F6p+9GESBnb7ST+
	phhbulZ1I+4TXX/wB6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjiW-00000003aIr-0QBx;
	Tue, 10 Nov 2026 11:08:44 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjiS-00000003aIR-3KrW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:08:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so2445864a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308919; cv=none;
        d=google.com; s=arc-20260327;
        b=c9iG97P8FD0ABdKLAkjea6xEe7G6knPb1jmw06oQiBA1g+A2DgQTdfwYGbr/kQZMQl
         8aBv5rqFzZrW8nnrRO/j4LaneTRINU5ZFGMmc2SkG6796U8WJjpZTS1hRrREcRk9G5FX
         p16B3wTdH5IJKFjHfspu0R9Z9DLXqDIBtJuy7jRPP6JfiXlvWo5gs4bQXijKfkbLoSdb
         Cm7UE/IWcqE5YqzoGXxg4ebZr++Iv6AwxGhv+sIW/w4PmlYLFrxEr9EhB9Euh7G+q9lJ
         VYn/Yr2tmk7cOySf0bxdjaoYFOX+ke1sJ05BzUUysXPQE4t5SUF+7ImeQ9GdnAYZVV4p
         iczg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        fh=cZPXtIh33q87c1FMgTgY9grW3RrxnI1DOw5dBLaHTgE=;
        b=lFytPdbf8vnTZWJxfLgtfaYIL2i/+GK47igenYBDiRa/H8w030alDv+fbAq63PvvmH
         tHHOG8Pc8e44pSfYEtp1v90oOiy/wnG3DXDaB6z96myXQj6woh/3ItKG0mXnF7IdTUAi
         ve8E/08Gz0iG1zc6dMEgBE3h/rIyVpHOwcsMb4pCVmDNTv2Vh+YRTLOgV9b60v0EmXP2
         UDMlALzOKHvj3jG+DdWpN7KrU9900LLerY0lhTmiiJEVzpvhCyGm4POZDQi15/TyzhBP
         v28JbkqLA7wt0edHweDp5DwvrDIJ84+FKvTGXrwgDX/F/Ui1iUliLYfX0JdK8RSuOdbk
         Hp+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794308919; x=1794913719; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        b=kTpQnGaHdQCF5TrIMztiSEtYlYktE3usStlFmhW0f24ext+tuEmlp8T7r1A4xTwS9p
         t7afQHvlL72oe9xfghb42yH6Ui5ECVslU54ahhDaAlq6erUV4x1YLrflvaphxH+e6Apy
         +hC4UE1Kqa3wIvN7QhZ1RBCTgwp5cuWH0JDzn/GkWleng7CDQVO6N+q4ZT1sgDWyuGIx
         E9Tdj44VE8bi56EjHhH9bjAcpVBS2dGmPx9ny9Ysxk/5gBCsu1tgGaN+Z3P3igg22smZ
         e/kwIRREnBU6J8FYcNMMtB86FyFn0otgZDFOhFdK0o86cje2TXx4jfrXmfRSNEyb2nom
         mCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308919; x=1794913719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        b=oPPEkmTncjtswwd7WT/m0bA5D+e4I/esIVGftGi84IGEX52x9s+iXwi+O+lQyEvhmm
         uUzsd3YXTWQtIwQq5bzO9SksCWw6jHCgqppgZlqap7qFmV6RdZEiCpkrRghnjJ8zsZsT
         4arB68fhmeNVSUHnixwFJClysnbtiEen4GmJ0T9mllN10ODi2wY43WU24IN7vmRNLJ6j
         1TfWB331q7UZuaCUiqTm9dkyII+1kIr3HUof+JcZQmLB6DVgHd5vhjV+vjMJB/AQSo1X
         LfHwCtGExlMWrXoWNEfH2s0vVxMdQAcZGwStVKjUwkizy5QyXA6a6F603h11qfenKNNf
         CMxQ==
X-Forwarded-Encrypted: i=1; AL+hErFUny0hJDNm0f7mzV/yh8ULFVKwv2NRUbcObCS5GeSBls/lx836WFv3YnosUmSBvCHjcGgZJJHAV2UCtN35UdrD@lists.infradead.org
X-Gm-Message-State: APuU4Z+G5E4wDnR9hlc1wRZst0V9cEr43ZPJtbnhAtWffsiBjwMePZxC
	qpP9Ot06H8DibbjxvurG2uqZG9sG8ZIXs95pnUUbZ38JTF8MlV+EFtNYXsJRGJpZq4I2P6LMjuj
	NdgCTwZYRHmzYha7DnUFc31sry4BR4cm1MDIbNAFaKQ==
X-Gm-Gg: AYBFou2KhjDLyzlwMGzrnp0melm9vO4gihVzWJ2SudFjsS+ppoQL1LUrwyMl7qUI9ol
	8GLSolMfh5PvA+77kzI8WgUa9ezfm6+hjNJPMKBp5EIY0Att194SSbTvh0lPOERLiQZ77g7zbPf
	JkT+3QfUNnbJLVIMaP8Wqns/4yR/74iLNbuTK2CEP5R4Fg0Gn8U1nWB3axpdhM6doInxte2pUUy
	laJ2jzliFfMvDWbPnCnY73hzkblKx3Ci4WATe4h1LyvCYV0DLoTkEOENyjC8C4VJiu7rFlFEJy2
	ZJijqylibaJa5fX5UGKP8WuFJPcv8K/Lwhka0Ej84NNRNYTcnsIW6xlmmnjRA9+GYBQBf3N2Xp0
	92TPikLidIaXVHCxIy8Qf11qujjQp33bQqrowdYxAomViXHUgWfjG5RQrNdKTLrgHODT1YmfH92
	B7PQXjsoAk8ls60snXTQno8lEReeTGsH0Cf75aJlP9lT6Q6Wip6lcv9Q==
X-Received: by 2002:a05:6402:1d54:b0:6b4:59d0:7294 with SMTP id
 4fb4d7f45d1cf-6b7564f6f76mr2116289a12.31.1794308918607; Tue, 10 Nov 2026
 03:08:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109133609.810876-1-robert.marko@sartura.hr> <20261109-mulch-mountain-118fd114a797@spud>
In-Reply-To: <20261109-mulch-mountain-118fd114a797@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 10 Nov 2026 12:08:27 +0100
X-Gm-Features: AclHuK8rAj1SvZu7uW13wrFXg8Ofz7g_PIsRsWgsTldu6tOuG_htfxW5SgQtu6M
Message-ID: <CA+HBbNGUig8q_U075xXc62opOvK7wz0er1c6ROxGnKYKTrwWbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
To: Conor Dooley <conor@kernel.org>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_030840_890613_5E53F698 
X-CRM114-Status: GOOD (  27.53  )
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

On Mon, Nov 9, 2026 at 8:14=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Mon, Nov 09, 2026 at 02:35:05PM +0100, Robert Marko wrote:
> > The LAN969x fan controller has a PWM output and tachometer input in a
> > register block separate from the Sparx5-compatible temperature sensor.
> > Describe it with its own compatible and binding.
> >
> > The optional fan child specifies PWM period and polarity, tachometer
> > pulses per revolution, and thermal cooling levels.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v2:
> > - Describe the fan controller in a separate binding and compatible.
> > - Keep the existing temperature-sensor binding unchanged.
>
> So, I think that this device has been modelled incorrectly from the
> outset. "devcpu_gcb" should probably be a syscon/simplemfd, as least
> going off of what I see in
> https://microchip-ung.github.io/lan969x-automotive_reginfo/reginfo_LAN969=
x-Automotive.html?select=3Ddevcpu_gcb
> and the fact that we see silly offsets in the dts:
>                 reset: reset-controller@e201000c {
>                         reg =3D <0xe201000c 0x4>;
>                 };
>
>                 gpio: pinctrl@e20100d4 {
>                         reg =3D <0xe20100d4 0xd4>,
>                               <0xe2010370 0xa8>;
>                 };
>
>                 mdio0: mdio@e20101a8 {
>                         reg =3D <0xe20101a8 0x24>;
>                 };
>
>                 mdio1: mdio@e20101cc {
>                         reg =3D <0xe20101cc 0x24>;
>                 };
>
>                 sgpio: gpio@e2010230 {
>                         reg =3D <0xe2010230 0x118>;
>                 };
> That ship has sailed I think though, so I'm not going to ask you to
> rework this whole device.
>
> >
> >  .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,l=
an9691-fan.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-=
fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.ya=
ml
> > new file mode 100644
> > index 0000000000000..0b7d38a6d20ae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yam=
l
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip LAN969x Fan Controller
> > +
> > +maintainers:
> > +  - Robert Marko <robert.marko@sartura.hr>
> > +
> > +description: |
> > +  LAN969x fan controller with a PWM output and tachometer input. The f=
an
> > +  child's pwms property references this node to specify the PWM period=
 and
> > +  polarity.
> > +
> > +properties:
> > +  compatible:
> > +    const: microchip,lan9691-fan
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: System reference clock
> > +
> > +  '#pwm-cells':
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - cell 0: PWM period in nanoseconds
> > +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> > +
> > +  fan:
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      cooling-levels:
> > +        description:
> > +          PWM duty-cycle values corresponding to thermal cooling state=
s.
> > +        items:
> > +          maximum: 255
> > +
> > +      pulses-per-revolution:
> > +        minimum: 1
> > +        maximum: 4
> > +        default: 2
> > +
> > +    required:
> > +      - pwms
> > +
> > +    dependencies:
> > +      '#cooling-cells':
> > +        - cooling-levels
> > +      cooling-levels:
> > +        - '#cooling-cells'
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - '#pwm-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/pwm/pwm.h>
> > +
> > +    fanctrl: fan-controller@e2010348 {
> > +        compatible =3D "microchip,lan9691-fan";
> > +        reg =3D <0xe2010348 0xc>;
>
> btw, how do I translate the addresses you have here to those in
> https://microchip-ung.github.io/lan969x-automotive_reginfo/reginfo_LAN969=
x-Automotive.html?select=3Ddevcpu_gcb,fan_ctrl
> ? Or are you looking at a register map in a different form?

Hi Conor,
Microchip has cml-utils, which allows exporting the registers and
masks automatically, its part of the public SDK.

Or you can get the address from the register map you linked, its just
posted as word addresses, so multiply by 4.
So for DEVCPU_GCB:FAN_CTRL
- default offset: 0x38800000
- DEVCPU_GCB target offset: 0x4000
- FAN_CTRL base =3D 0xd2

And you get:
(0x38800000 + 0x4000 + 0xd2) =C3=97 4 =3D 0xe2010348

Or you can just task your LLM agent to do the math since its quite annoying=
.

Regards,
Robert

>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
>
> Cheers,
> Conor.
>
> > +        clocks =3D <&sys_clk>;
> > +        #pwm-cells =3D <2>;
> > +
> > +        fan {
> > +            pwms =3D <&fanctrl 40000 PWM_POLARITY_INVERTED>;
> > +            cooling-levels =3D <0 128 192 255>;
> > +            #cooling-cells =3D <2>;
> > +        };
> > +    };
> > --
> > 2.56.0
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

