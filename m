Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435A7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MJlGsFEU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vd5Rdsi/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=; b=MJlGsFEU4vm0hE
	HXmq5FiNIdoqSCv/TkaFXCeTWY4dfStUX+UwOXkquvIsysLIdStdXFl2EHKnjMseX83o44OOH0L6v
	VzOGgwhcxmDFl9DkdBRuetZzNIX0oIi9tgvhTVZcugs+U7LqzNd48OwIwSfm28VVCkae83iL3zWLw
	1Wa1chzUcEj8DTRb1Pf+fFWcbwH6vPuqFd/YwP/pJMFyh8tt7GNE644JL9uJm2hNgCIUZOr95tPuG
	tq/4leI5MI/d5RAFyN35fKKUCdtMPXUl1xS6/JBnSaWI0kfLVAH08TL3zraFpblzhweK1XdDaFdxv
	8CY3nuqzolsqft+GjSVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRMyA-00000008ib4-1S5I;
	Thu, 12 Nov 2026 05:03:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRMy7-00000008iab-2k1O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 05:03:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5c154a41f8aso44105e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 21:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794459805; cv=none;
        d=google.com; s=arc-20260327;
        b=eaMeNw0P+P+qcQTmYj22xYH1rS6D2zbritYDPCRR6zvKgfB4f8YOIldGO107U0LUNQ
         mcsJJTQu3vpMQply424RxwD5yeZS+bFswdivBXjs5lWlO5+v6w3rI5wKstGcZGbca+2m
         LnG7LvIb6FO0CLVTtMf86i7/5FrS1L8vlXKokNmAyeVnnHu+/RdUX54joLYg9UdxXL/t
         jl6wPXz3Tq7UBcd/HbpTnhPMwiapS2L4S18SIuFMKHIi2yLDPQj0vuHOLrOiiwjOd3C8
         IRlq5mix1NtFt7d/c3/RDdXglBWzAQZ70/g+j9m1conwYtzUoqNfO+SyfA0Rphe3XNXc
         sA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
        fh=Znsfbpo1ZAPggbVWqI7P9gsRl9ST6MMLVd3UdMcHaYU=;
        b=fh2RmSb4/5tIvqgJvSLzzeQ3C2KWYxWaxNPaXrgQ8DDgUeXrgeHABZfdoeOEXBVbDQ
         /3ZZbhtwbPRZebQbWjCjl8IaVNYU6LTz5ipPgcCSL7Ijz1qW/XP8qSAJ5DrIQmAZIncM
         Fc5C6At/DyRRqPV+Y4+Dc3Gosv+lC7XnLr5BMrEw7ud6wpnt+Ly/H2LeYpihepiscUIH
         CnVyjDmYjC3bluyH3Agt0/Ur+x4AG1bWZ8A9Iy4Jv/P4hH58hUOCwtJiKg5Ybs87Gyxn
         g/sMMl0UqeqWndRphwtxggmgDzlMcgAD/IEsn0Xea0D3PtVmWM0mUkuoSIuqv8o/ZL2Y
         RBWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459805; x=1795064605; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
        b=Vd5Rdsi/6Zkd0zcg15n0j1wwymRuBXO1K1m3pabn59GWYcD8tgZgY/UKn1MyxuF6sv
         eU39Pqffd/TxwoPI2iCeOtIYe7isfHDBZYdGs1HDC/rLeERZzBsAPNex1pNtckk4qotc
         VKLM22cWFvtzgY1Ss6JFi/YQyII8CEwNNBzJTbpvBxFzQmJKqIrENG4lPRs1+UB373aT
         eJettDGnBFfZdLPVdLAIH0+o5FQwAGyT3V/QCKei8+/l/MMtQpfB06Y3oXIThRLs/Kpy
         dhFGDmeD0c6GzT/8u+/Yygun1vCacBjlhpQVbWuDYEpwHW8YK56zX+x45Q0T480xpZ9s
         L8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459805; x=1795064605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
        b=ZRDhwzVklvUAfk2PXQ8Si7pOPI3Aw1+aI3cX4DdWOMfP0a4wprfVWTgJyzSvQlmMQF
         dg2MMXQLG+6unz9pACnloPZAypyVmMuLF7ZcN88D4OarfpZ4i64xF4VkXU4+mL1+A/h6
         WcSirD17Xo15+v82yKDESyu5/hkxUVTBOKGtvbk2Vm2ZI5tnGEvi4Z3nFxdop+kxcodw
         2I2u2cZZ/qwB8XgQd1SwXdEhjyK/l+W6ClzL6DW5eLEiaLAVhb+9TXAJkGIFf1OHY8jC
         nynsA7iGxeJ0d17EHTNAiux/IFuIXAdgDnbWR3R7sLKpALtRuCzJcLFGBA+/hVklPBVJ
         fNkw==
X-Forwarded-Encrypted: i=1; AL+hErGEqLTiiFHfyG4/JTkcO+ZQUpm3AOTvAwVa0ZguQjYFFn0Ssxd4yNdknwu1KHoed3cLAVAlNB5r4jVM1T+Uvpzk@lists.infradead.org
X-Gm-Message-State: APuU4Z+hdq4yinUJ1FrKI7mPRw4IZq8tT9+Mmfbtm6jNfFaTwSXDnsLp
	v7oYgWpWjZMLfO0MM/G9i7MqcOw0uDmlYljszsCusCkG5ECBYTM8DTDolxhL6jUXoNBNZ0EqBrU
	loeB5FW9aBdf+tGe3xgti+8324qeUmEY=
X-Gm-Gg: AYBFou1UxTCSaBFYeKtWoMfeQNidTKZxeOCWUrhwmbng8xiKPuxo1YHFYfd4MJuC3ZA
	ZIzS1lUN0LuvVgiP8ej9xromWyM/6HsSJt+6Cn4qMa6SjdwRm3pBrciNNZLVi8eUt0utCCgiLVC
	kABhIODEtFCFwp7Zdsj/auYE8Kx6Vz5b878Ogf7wYAjy1IqY1sxoukw/YFimeYzcAJiXGV74heN
	aodAzMGT1140eJjfFY9QEq+eQ1ozQh1fe27ZbB4mS5f8ltbwkY5JUWM9jjQyOi+m4go46Ej15EA
	OCyy8wdz17AK9HvcOomG8nBhz0SZyixL7ZffTWouTvetACH8Uucw0r/X359Sw2TaEX1w3KLdi6m
	7Xy4OZqRsmzxwFG1TtoGz9acR8dyOVpcVO6vl77kOz9sZ6DJxRVr2am/Fb77JlLg243k6DnY=
X-Received: by 2002:ac2:5683:0:b0:5c1:4f83:180f with SMTP id
 2adb3069b0e04-5c15d79ea99mr1533353e87.6.1794459804558; Wed, 11 Nov 2026
 21:03:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
 <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com> <ekjxzCRpRcWPwcDw_lDV4g@gmail.com>
In-Reply-To: <ekjxzCRpRcWPwcDw_lDV4g@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Wed, 11 Nov 2026 21:03:13 -0800
X-Gm-Features: AclHuK_1HOFnNDyAInx4WxkF0Jpvdf0PJfEA3HHVUlfWeMJnLB-aUMtv6VNxQng
Message-ID: <CAEy9hNV+tiw6RgjTz2zvCFriLb9Y9-aDhgfZMF9mxzUryGWqYg@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: allwinner: orangepi-zero2: Add i2c aliases
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_210327_717205_8D93EC07 
X-CRM114-Status: GOOD (  21.47  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Understood - please disregard v2, v3 will fix this issue.

On Tue, Nov 10, 2026 at 8:11=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne torek, 10. november 2026 ob 06:37:02 Srednjeevropski standardni =C4=
=8Das je Arun Iyengar via B4 Relay napisal(a):
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > The I2C core numbers adapters after the "i2cN" aliases and hands out
> > dynamic numbers, in probe order, to adapters without one. The Orange Pi
> > Zero2 DT has no i2c aliases, so a TWI controller enabled by an overlay
> > for the header pins gets whatever number is free when it probes: TWI3
> > on header pins 3 and 5 does not show up as /dev/i2c-3, and the number
> > changes with the set of enabled buses. The vendor manual and the
> > vendor BSP name the buses after the controller.
> >
> > Pin the numbering as the vendor BSP does: i2c0 to i2c4 are TWI0 to
> > TWI4, i2c5 is R_TWI. Disabled controllers get no adapter, so nothing
> > changes for buses that stay off.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
>
> NAK.
>
> Extension connector is not covered by board DT. Use overlays
> if you want to use them.
>
> Best regards,
> Jernej
>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 9 +++++=
++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.d=
ts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > index d5d39bac5915..98fc83291dc8 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > @@ -12,6 +12,15 @@
> >  / {
> >       model =3D "OrangePi Zero2";
> >       compatible =3D "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
> > +
> > +     aliases {
> > +             i2c0 =3D &i2c0;
> > +             i2c1 =3D &i2c1;
> > +             i2c2 =3D &i2c2;
> > +             i2c3 =3D &i2c3;
> > +             i2c4 =3D &i2c4;
> > +             i2c5 =3D &r_i2c;
> > +     };
> >  };
> >
> >  &cpu0 {
> >
> >
>
>
>
>

