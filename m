Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44C606A885
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fy3EGqAT;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=XCxIoPh8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HTjhDd2lXcV+orcHsdFkVuqzLNm1A7BVo1MLFFqIkMc=; b=Fy3EGqATAgaf85
	5ircJh+JgxFykWzuWzMqDbePwJ9sPWzX6lw+tkhh6ChT4JtnFq9bgdcJ3jz0dbB3P9UOpIFUGf/pC
	RrZ8SWiS9EGH0pvpGmhrgHv4NjunR/QDGi1ZiD0r8BgTtmptS6qcUyf+8XRZDkAd66I1mQxqXgLil
	OVslonz54e4ppmdlQy85FqLWfGv0KyUCJ3d4uyJoOQ0R+Cm05wzs8Y+fPksHi7qzr1LjLcEOM84Mc
	awaTsfbDNKpCU6u4iVNDI9uE6Zc9f8CE9ukiSSa5NFK1V615eI1hK0c7SaCqgI63iZPr5skSgJ1wy
	skt9WRDWdLB9/DUQb6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMs6-00000006Wbo-3UPq;
	Tue, 17 Nov 2026 17:21:30 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMrw-00000006WW3-3Svq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:21:25 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-67db763cec7so2769313d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936079; cv=none;
        d=google.com; s=arc-20260327;
        b=fH4EfW5vc/9o/i4CqhQUaxoFEVneDFw5lbtg0afS7lTBU629j43G95IJrTnBLcvxTz
         RGSDNFd3JoLJyDuhn2hlcFO/ABxWanf5Fs1cTAAJ2OPQFoWVN+KStcKEo3uuTeJTuxlF
         i1mj/UI/i870FrVms71Z0SLhjt2s5dzl7nOblFbGUDAETflUo36a6OJ6OF/xs5KBTlC5
         AyU34+KxedqpUpAPZ7E9UnM+FwPPcHImCM0rOGqIwUJfynYH3tmp4wyEleqz3TFXdQma
         9chvTjbo2Av3vwyDDXNkjmxwUfNhGbFEkOg6NzIo62TwpYeMMVdLNo7z+JSIEmFHw4p8
         ZAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HTjhDd2lXcV+orcHsdFkVuqzLNm1A7BVo1MLFFqIkMc=;
        fh=mfTe6SsX6eSNpxjZEi7nY48iEJ4W7NhWlmnF51zwcPs=;
        b=hAmVMZSvOs6LF+0+uhkQKHj+EoYeVflZJz8Gc6qq+gp/9kaqd6r+4UnFK0s7T/9f7K
         +FoYVRztC+JYexwdGbaCLdLXSSvyosOuDgon4Z2PB4GK7DQhUm3N5DE2Mz6kD+D8Dqsv
         B6/YwPCOxIBBi3GVHXAoMQ1qLMa9RoYnsSB72A55jg7GiWB7b/Dmfnd+Q+QH29HiPkKh
         YhVYsOM1cF3SnW4xXLU4FOcgqrS2q1+TRCsdKp8PBMmdpH+/3A9FBjuQfExPQ1aOa++b
         jntJyqn9mIXV3qf9RylnA+U0fSD7y/oPQMyEQHiglFYHma2mPCw9bnB/vGDJ6plXsgtA
         eZ7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794936079; x=1795540879; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HTjhDd2lXcV+orcHsdFkVuqzLNm1A7BVo1MLFFqIkMc=;
        b=XCxIoPh8pULXp7/PvIGkqfbh8QHIxHrA0K9l5Py8s1ZDBEUcFwCzGgElbw7c9ZcrIp
         5RfYGkb4cNBOfgoV9A+RFOCcGuVnIBreaYXhph9qhleDHM9J5fDBZYE0iuVui7fmxSS+
         Qvif61U6erVNZzj8+tp3eHcL9cS0nm+nf4Ncw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936079; x=1795540879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTjhDd2lXcV+orcHsdFkVuqzLNm1A7BVo1MLFFqIkMc=;
        b=IWgnryjxL+Id6gqIVL2T6XXbTFsiGvwQNb2oRrq0p9w46Rb36YNpKHPsKda0oYM9mg
         yN2JT4RruXTWIedEOIsROkBRrh/ZSwLk/Fp3R5iSYDf+REtXT6sbpNY9yLk4G7l+4djT
         KDSGwCGkThYEg0vXg0QF6oCRXz+aNU+vLC0DTLH5J4x/B5hRRybc+inrQ5tfzKrTOTI2
         eGyQ778ooO8jh7OUcGtsmjzmqBvDzjUvj2TEKg5C4DD5rFIUsIp1ylXXZBQoGMWpp4ye
         lPNSanbt/WNiZHr/DohLPlf+UQblsw8v9e22gwkpBo3zqT0719kf2QlWDUAc4XpglJl4
         +wZg==
X-Forwarded-Encrypted: i=1; AL+hErGfxrznw6tSJpBRFUGyd/3af9Dodcs4wMp1ExvvkhV+1XpECS7QY0fzqrMw6vtSS/CWqBwUALoLrS3B9f0DPVh+@lists.infradead.org
X-Gm-Message-State: APuU4Z/sEEZwhSqlUsW9LBWOH4So0Be7KZYqN+pPVPMIbgS5w3x8+Q5l
	3x7oOeXPi+/MBAnlUhx37i01N3Ow14ej/H/iJJNo+zR1WNLNiwTYZkt1U9zsvLftfz+j8lV1mjk
	bdhI//7U9ZeLKwi/bHS/IcJuhjHbyMdsMyh+hDDdSLw==
X-Gm-Gg: AZFdTZewCSj2bWVPhH7F2F6iobHw1NhuH9YXRiRhQJPw7er8KjY3mGgdqCNiqXrisfY
	am89L9nq0GFEZOY4qQUu1+yQIH8Fp7puulVejwRqzobLs7UlWCVz1weVs8vYDHr04XITogC0vhj
	E3Cbx09R912BVYkJXetvv+czFVPvTSVw7AHu1hkOnOtmI2N79sOQOqeQoRcOq58W5r5EJCeixIQ
	YQtYfOEW2qaSPO/BuJDfe8FkEs4I1Ero62Y0HXstEhYXYVBCG5njyFQtvep0F1dvdVTk0tIq57m
	/ZXN+i8eLUWfo5z8Yft1FWZTVXdjypYSgSKEGt3y5g0DHbPgBPlH573C6cZBCNZwEd/fnDEHI1+
	cWwnEmS2Kd9ZqiWy4AWKn/hZE1ktJgWJsikXdVqJLEV7lZ2pumDh4MchwTsftJLDpjA==
X-Received: by 2002:a53:a201:0:b0:675:b778:a423 with SMTP id
 956f58d0204a3-67dd400fd64mr68936d50.142.1794936078854; Tue, 17 Nov 2026
 09:21:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com> <c936336b-04b1-4860-9eba-4d1ab002adff@foss.st.com>
In-Reply-To: <c936336b-04b1-4860-9eba-4d1ab002adff@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 17 Nov 2026 18:21:08 +0100
X-Gm-Features: AclHuK9vIKNWUheSbkNa70jfkA0aQPHHOtq4zZIwHrtQ0QLNLTppD-5SEjbbfas
Message-ID: <CABGWkvrnq7Z-nO2LoJw1M833Mqbabn6M_r+okrJ4R-eQ-sR_SQ@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] arm64: dts: st: enable eMMC on stm32mp257f-ev1
To: Christophe KERELLO <christophe.kerello@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_092120_903109_5862727C 
X-CRM114-Status: GOOD (  20.19  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Christophe,

On Tue, Nov 17, 2026 at 5:58=E2=80=AFPM Christophe KERELLO
<christophe.kerello@foss.st.com> wrote:
>
> Hello Dario,
>
> On 11/15/26 17:34, Dario Binacchi wrote:
> > Enable the eMMC connected to SDMMC2 with an 8-bit bus on the
> > STM32MP257F-EV1. VDDIO2 is tied to the 1.8 V rail on this board, so
> > the DDR52 and HS200 modes are enabled. Tested in HS200 mode at 100 MHz.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/bo=
ot/dts/st/stm32mp257f-ev1.dts
> > index 782b4bb843ee..9c38c4fe0c1f 100644
> > --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> > +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> > @@ -431,6 +431,23 @@ &sdmmc1 {
> >       status =3D "okay";
> >   };
> >
> > +&sdmmc2 {
> > +     pinctrl-names =3D "default", "opendrain", "sleep";
> > +     pinctrl-0 =3D <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
> > +     pinctrl-1 =3D <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
> > +     pinctrl-2 =3D <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
> > +     non-removable;
> > +     no-sd;
> > +     no-sdio;
> > +     st,neg-edge;
> > +     bus-width =3D <8>;
> > +     mmc-ddr-1_8v;
> > +     mmc-hs200-1_8v;
> > +     vmmc-supply =3D <&scmi_vdd_emmc>;
> > +     vqmmc-supply =3D <&scmi_vddio2>;
> > +     status =3D "okay";
> > +};
>
> This source code appears to come from ST's downstream Linux tree. When
> upstreaming from that tree,
> please preserve ST author and Signed-off-by tags.

I started from nodes already in mainline:

  c5ce8d7bcc78 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM")
  94911ce62b45 ("arm64: dts: st: enable eMMC on stm32mp257f-dk")

and only adapted the pin groups and supplies to the EV1. The first
one is mine, as are the SDMMC2 controller node and the pin groups
this patch relies on:

  513410ae43bc ("arm64: dts: st: add SDMMC2 support on stm32mp25")
  17d813da1689 ("arm64: dts: st: add sdmmc2 pins for stm32mp25")

Given the hardware, I don't think there is much room for it to look differe=
nt.

Thanks and regards,
Dario

> https://github.com/STMicroelectronics/linux/commit/d00ddc95c630ebf948ebe9=
c22fcbca145d771afc
>
> Regards,
> Christophe Kerello.
>
> > +
> >   &spi3 {
> >       pinctrl-names =3D "default", "sleep";
> >       pinctrl-0 =3D <&spi3_pins_a>;
> > ---
> > base-commit: 23c62304dde29abe92013d85910d03a77dada35d
> > branch: stm32mp257f-ev1-emmc-aliases
> >
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

