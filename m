Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4D2606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MxQ027Sl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EroTTqpz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=; b=MxQ027SlPRrsbv
	6iLfik4/fheehhdspr7jARknVv9lECNaTmfHx0xdV2AFLMmOmho6SjAbq6wWONop3/11K2Gm8oz2E
	ColXbIZEJHmy0Lvg3/bkni1atL4xN5p4MMvmMNB6ULIdGnOBf/S3H3y/Ibh+xLTHnU/t/6LiPgZA2
	uQpJa7n3j/52Lf2SQf81Lr2kaSZA3kZjFIylRMuOFLNFqzugqopjllWOshTk57vG8xb0Ttd8r1oIV
	KeG85CRa8acWSs86Z1MwfR2IR9iH6+hVeTqKv8lAk4BeFvCeyum3U08y+HTMgIRyOKMKwjcxVpq5P
	7U+Rzf+G99/Vj7tlUOqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJnv-0000000EJJX-2ZnV;
	Fri, 20 Nov 2026 08:17:07 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJne-0000000EJHJ-3QkK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 08:16:53 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so210600137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:16:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162609; cv=none;
        d=google.com; s=arc-20260327;
        b=JCEYVb8A0wUVJVpILbgoSoYZvjKUpz1jKz7BMdnrnJgM6Yzach179eDYvmErO8huqY
         6oGtMmH2dEYZlVKEozbqQbULQ2O01AXlub0YxAeuN2SD63jtc+FoKhQ47ZSCo3bd6LYC
         hbv0/2a0m2qsSt0NNTYyk7O+BKn32bxk4s6YiZukMIhoJ6uuDFFqs7tbmIkfpp2Vv7zE
         lJPrKk1bDAdedjSo12Rj5jMm1bRcGec21vm6iSiMxJ4/zK2yb8hyTLoAo3e2njjIUpXa
         aYY/32o0V/OTgZ94h10iiFx10fs6BqOih2yu/fioRjj4WpjmxgdrhwmzgJyLsqGQNJUm
         6veA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        fh=4H00e4+iRlO9OTRsDPj/s6vXEj8XLp5D2KXH6tTotGg=;
        b=YjNn9RYffR5iLTkR3mYyUMc4H+ana90ej6lVfYwJ+fhCdzk2iSMop7LpoHVd0xfy33
         doW37d1an+ppdGKiegFqiMHLJe4nJkrRmXVPzuPCtJMHfiW2w2vlNtNKqwfFWLTqdOJg
         8P1LF2wkwgmYuTGWjXy0iCNktPWv7ZABMGvAgp2D7UN2EcWVed51yBuG5kvqa722wtSd
         8spfvJitJLVS7eWZfe4fX1tNTQ+r3jwtvaLAzjv7boyfcZoULsHwr7Kp+ah7RzUHGcrB
         uEXGTAfUPnfoNkqm6n5HlmslNvyVZFAy3F5G3D1IxOd1Rz3R6ykJua4R37djBBJBueff
         Cg1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162609; x=1795767409; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        b=EroTTqpzpvHPQC8uIQlIsfnA2uAsGMt+LlI9os7KC3gCJCAaB+hvlhF3JKq9+jkY+G
         ECPYnNW7N0CHKjr05U7mAcJSMQLwbfx9GxxClC1S1r+JNcbSme0NO0qM2qjoRDxHKmuF
         eba9fPb+lltYX2vWwAYdBZvaRd64xRuMya534J0o2SIkbHxC1wXNLd8pt1tTzLcNh+18
         1wBxLBoL6ol/Gk3QT0bhjYopWC67F0Q35tytaa2tzAqWUMPWAu9uA98BXkibvoTgs/rC
         KwBpEZO0WVBgQfbpqwT1JDvt1xCumvHBGj6gtq24ej55sf/enrmKPvBpHhRG+RfDLtyN
         870Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162609; x=1795767409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        b=dAHEmYIPs7Xnaa2ATYQSqzXrqMBxTX/vhJbU800HQj68veQnGV64o4/8YqglF/74G1
         EoC81CsKK+7KxCJ1tuG6An6cQ+GPFM0tpqe39EEjHl7blzeViGVsGbBIvVS20QQKUVwN
         sTI28+jreYqnFiFcvx1RNWOcYIJGsRE2Z/ModPOO2TG4xuxbfShKaH/ssmFrIDPnLzs+
         ErYH0hfbv9L3mFJIrECfFXNUpHcq+ZLfZ9VBnKXRe2L9qJKj+louAcdhsb6HPT18IucT
         cumvQrASW7ee78Ch4teVU70FVpyQ+sRJ7VndY64FnfE6/TGfqg2rxtWzi99KsXR1GUo+
         hWfw==
X-Forwarded-Encrypted: i=1; AL+hErFypPPL9KLSdC+PNqbGvaixWmgSJbabxff0rz1v6UFD5v7QlyIpXmWQSaoJ3QbrrCU9+Oz0xGnlP1zgsxC7h99S@lists.infradead.org
X-Gm-Message-State: APuU4Z/AU+R/tKkyK/m8WaeslT2UwkpI5yUeEU9CDkp6ioSbJ7h7vXiS
	9GCbWCbzFawzj/L+OmRe5rLKtRa5ydf03+P/mzrVs3CAk0x2ufDcMdFRpd6dT0cK2u7FZ3gxx04
	Uv8DWD0w1Ntf2VSI8FT6yghU9JX73eWA=
X-Gm-Gg: AZFdTZfO2lbPZZVMtaX1CiZ9T55aJ8XZRzidLuJJom9IlrzzN/kiPTpsY+sjRGMJB3w
	M+AB92zCLjyVYoxXxLLJUr6K+uDwJbJR4Nta/zS3aX1qrmPSxL2mKGIM7DiV84cZk2uuOmT64Pl
	PK8Scwo3xrN5fKH4/QaE6SysH1GVyZgLDYse5+M2BmsV8BrLzVjHSL2YyIrYo0lC0QW4wMYnHem
	729kWqSN02mDDupu/0MrxNCh3pmVh4lwDBPPXEdaveYm1i+ZoTfEn55uNe0ftCdiQVwa13d0Qlv
	jGIgn619A0q2+RqLDlf/MLhB8oUHX/eW/IMr2xviF+G1zx2iO2umCVfJVIeuKecPbLxNmWBvdbO
	ppzFEiqq1cI2lTGhv2MwV9vbibsZyYP3RsI7R4UmZoa7JfD8TAVaAZRfXMN+Tbsk/GfIbdCFryO
	Ict9oIi36YWQslRliwK9j1z3R1Lcwv7UydMZtso8ptFcarzApaTUCVnaqHmzkm//riqF30DGh9U
	4w6wAg4kPLrgvPDqDj6xhCV/8x4Dg==
X-Received: by 2002:a05:6102:5cc8:b0:7c5:4da3:aefb with SMTP id
 ada2fe7eead31-7d7396b4513mr725084137.34.1795162609310; Fri, 20 Nov 2026
 00:16:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
 <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com> <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
In-Reply-To: <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 01:16:38 -0700
X-Gm-Features: Aa3M54opK0HsAqJ5IKoxodsp8AVX0yGJFnC-piFBxQLeC7dh0z1JF0IENGFsfTk
Message-ID: <CADvTj4pkgZj77566ni_ifFJODRC0XvvOddiOij4kGRxoseBqfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2 clock
To: wens@kernel.org
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_001651_970535_07737C27 
X-CRM114-Status: GOOD (  22.31  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 10:02=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Thu, Oct 22, 2026 at 8:09=E2=80=AFAM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > UARTs use APB2 as their baud clock. Expose its existing clock ID so dev=
ice
>
> And how did you discover this? How did you differentiate this from it jus=
t
> using a combined clock from the UART bus gate, which is also driven from
> APB2?

I got APB2 from section 9.2.3.5.2 of the H616 manual, which says
=E2=80=9CSCLK is usually APB2.=E2=80=9D I took that to mean the UART needed=
 a separate
reference to APB2 in DT.

> I'm not adding this simply because you want / need a baud clk that you
> can set the rate on. That's the wrong way to go about this. You should
> just add CLK_SET_RATE_PARENT to the bus gates. And making the bus clocks
> variable is a whole different discussion.

I tried your suggestion on H616. With CLK_SET_RATE_PARENT on the UART
bus gates, I can change the baud rate using just the existing gate
clock. So I don't think we need to export CLK_APB2 for the UARTs.

>
>
> ChenYu
>
> > trees can describe it separately from the per-port bus gate. Keep the
> > existing clock numbering.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-b=
indings/clock/sun50i-h616-ccu.h
> > index 6889405f9fec..e3318772c92d 100644
> > --- a/include/dt-bindings/clock/sun50i-h616-ccu.h
> > +++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
> > @@ -11,6 +11,7 @@
> >  #define CLK_CPUX               21
> >
> >  #define CLK_APB1               26
> > +#define CLK_APB2               27
> >
> >  #define CLK_DE                 29
> >  #define CLK_BUS_DE             30
> >
> > --
> > 2.53.0
> >
> >

