Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304D9606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZRERuBOZ;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=TlGBMBgn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=; b=ZRERuBOZWWfFKk
	7r3vvFN+9NDDIkyVjxbbQ7jw+RSE2qzLqXViUCWcVMQw1tHCwuow7oHzWVxe5D9bcgxR3vdNoXSh/
	wLmV4EvScsca9CjuABrtxvDsXz0EsiTe/hk7hBNAHRmsYGUCDrvEa0GrXIfrkkSni8vQkGay8j8EP
	bEOHTvnPf5yz88JzO48QIfsylJeiC/TjXJ/PFk0zXysoY+a19eXTrHicSS+s5n5hCwKleLN29sRGI
	6qOJSeZk1rxHs5RIY3+0uoN1WTUHOyM8dSFefC4DqZ+lw8hmuGfdF09niUGt4+1q8gxzFqRIfoDgA
	nd7UGFNzeWRIBLPw8Ovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7L9-00000006elo-4BPJ;
	Wed, 11 Nov 2026 12:22:12 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7L8-00000006eky-03D0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:22:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3344520a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 04:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794399727; cv=none;
        d=google.com; s=arc-20260327;
        b=KOjgTCFRgLx5wGcsEESwT3WxgeO9mWYOQE9gSqmK3NUMpuu4X5g3z4X1xcCTIQQDRd
         Ypco1kuks8JkIL14iC+3bOJknaP7p9y/L6zg36CjhdIcqF1zSxdtYXLrn/Loo1IoWo8t
         LWs1dFiubcRhiv/bsKPBvVm+kM6+MfcuV2ihk3hfOANYxKw69pZwryySpRsv/xEntluV
         WexChwxlEubziCtPpp/BvRH+zcZqQzW8BmzOGb3hAQS37L28NpbK+UhPdU+FJjG7iQD/
         OQCgMNUE4r7Mw88Ik9qcDIZaYSBdkgaOkwSngDJWkPuhapEFeO63+QLlABcm2Gkmm+0T
         730Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        fh=Zoeod5gOk32Y1U6tkTSZQJXgPyKGO3LSOjK3rb+ts2A=;
        b=Tl7FkXVcZ9w1BQF6VfTVa74li1X3j692gjxZmN4ntcf1Pe/V+Ll+UHFKXVk+lml9SU
         +cgwaqA3VbDSW/vn96fO+TOnC6ZeqdaECjEh8JNoljlVpfFBcpRpG7dElFbmT7f3Idl+
         U2moaihrtd70N4mdwYDSvsfI37HYIjP1h9PghJTwuxSEHqFoghtL/PCeJ6wKcDsqzrwx
         GVxXama/4we7uP0S90kQAq79dIGeI9NzOBO+vSyDi63RJmGaPyjKl5b58tvJ9L6RT9rs
         GSvgb6qt6xtwP3e6aXM7PKBngFZGus8nujFVZzpw5hdA1w79HOYsxfXasNHDUUNmwnZf
         vZOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794399727; x=1795004527; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        b=TlGBMBgnlB9C4jJfn71i6rJsHna13kQe8P5qUxutvIebidwIlR5t1utVTgEooddTdh
         S4a6+oyB5CRwmR1UqiHNrcu8gOIv7gXf9JAartfKgc5ZhEtOJCII6LFZoSdLavl7VXDW
         4yGRT6wldCb6Cus2FOUwBwX4IRVVOiS1WA9rSEfCiwN99+4mLH54Hdt2sEmUhZ1Hg9dh
         ODWQX3ktEQdoHrzMvs270i45HeKVgNiOi9x+DNLgadM+aXEKOL3XHFadrdwn6SouvMKS
         ooatL4oo4tsSWNO7IREIBsRiJTBw1iGy43sGnmVWLheVTusDG1lGyLffYUoDj45cv8Pj
         Fmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399727; x=1795004527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        b=r5AyW1JvwoSfNZXER2o0g2ylvek9PO/Ssgpx32oHpinCFqG+yj4VtQEqtBce2dv1S6
         faBxBwGyZlE6ltZ3HDxCm6bnoSc9/RtL5ur77cTy5hqZ1+wfXOBwCmtOFtCkiE+RG6Y+
         p02M0/OHZXKnM+VWiCg3JpVZbkVKHBILqUV8eRhQIGOK+N3rMaO9ygZXq7y+oZ2ZUQYk
         x6sK96d+rdRpBSpOEOqxi0XO/hOVL0HLwgsUJ+IvyRYGeji8ajuKXNPR5q+Ouy5BHttM
         BjoDGu+FANnSMvKRTn73Gvr+sxYoUJjmaP95Ie+z35FcIKMN65F1WK27JCCVBhUz1a2I
         f7uQ==
X-Forwarded-Encrypted: i=1; AL+hErGoMJBlIlb+09uFT3+IIoDuyoKh7IEZXD9VAmEXFx+WRaJ8zZ86YJ3qPEQgreULqEopSybU5LlP8v4bUk+dw9ov@lists.infradead.org
X-Gm-Message-State: APuU4Z/WiIDWg5NmpABCUe/CgiKe9sXx9A5ojf1bxeFU4IC7dX8HPI2r
	1cXbzRmBG9QSTiHuEvbmJkUIinh2RHkJQzVcbWuepyASRQDwyDmhPn7MFtko7BTD8KUomFqP04R
	NFsEqvXnwFDz3JzK4MK00Y37y+WxisumyDg475wytFg==
X-Gm-Gg: AYBFou1CocY9RDYKc51LS1BX8oICbfPY413nOjSg/aoe6w5DZO+JyOZLa2dTgduw9nF
	wC2QNO4Sv48pIKfgXg94kLtrbM2RLXIynyukRKVTlF6zAqrakbwSLJVd/WKdAazHALPfGPyPonQ
	jylqbieFs1HgC6kwXc5D+JPCw9J2Xj9rz2hbp67GKXctGJE+ghs8HJaW8P2H7xmmSqNn0DjyyC0
	bFSvoyosLhW5NjmCQSrolhV9BrvqMhqtiWObMbkigUAlUr9vXblc2/TrxGgIOLQPkD1yAjUH9fd
	i7whLqV6qXgJE7IWECsTnMr8cxQ9gAZ1RKC09MLOpS6fecdw2Mv9Z8T9QcEYuGN9IkdCdwXXuii
	VIYxJCo1qbQfdXe0FK9kU/1hvFYC2xQyXYSEPD/JD43J8mVN0sxIKPIo0bB8JgrfInqmLAD2kMT
	RuBTZoouEC2R1oIpBFS4pnJ3FjD8ZkyqUiGUObBI5GmYVPgkI7sQMR8g==
X-Received: by 2002:a05:6402:2b92:b0:6b6:eefc:ae78 with SMTP id
 4fb4d7f45d1cf-6b777341867mr1845043a12.2.1794399727628; Wed, 11 Nov 2026
 04:22:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109133609.810876-1-robert.marko@sartura.hr> <20261110145414.GA3828324-robh@kernel.org>
In-Reply-To: <20261110145414.GA3828324-robh@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 11 Nov 2026 13:21:56 +0100
X-Gm-Features: AclHuK-NDRpRb_jYg5FQQ5B5fgUCjjm_CP_VsQUIeOlFZDuAlC2eNYg1mYw5Bfg
Message-ID: <CA+HBbNFE7ud3omp1e8A9w=PYMM+JPW-y94MiM68K2sz4HitU7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
To: Rob Herring <robh@kernel.org>
Cc: linux@roeck-us.net, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_042210_096145_331EC4E9 
X-CRM114-Status: GOOD (  23.13  )
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

On Tue, Nov 10, 2026 at 3:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
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
>
> Don't need '|'

Hi Rob,

Got it, will drop in v3.

>
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
>
> Drop. That's already the max in fan-common.yaml. minimum should be added
> there too as 0 would never make sense.

Ok, will add 1 as minimum in fan-common.yaml as a separate commit in v3.

>
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
>
> The dependencies should also go in fan-common.yaml. Perhaps
> cooling-levels without #cooling-cells might make sense sometimes?

I removed cooling-levels requiring #cooling-cells, as it can
technically work without it, its not ideal, but it works.

I am not sure if its feasible for fan-common.yaml though as we already
have schemas for EMC2305, and more importantly
DTS-es for freescale/imx95-tqma9596la-mba95xxca.dts and
rockchip/rk3568-radxa-cm3j-rpi-cm4.dts
that have #cooling-cells without cooling-levels.
EMC2305 driver even calculates cooling states without a levels table.

I would appreciate guidance on how to proceed with this.

Regards,
Robert

>
> Rob



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

