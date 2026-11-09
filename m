Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91690606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 05:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SLe2am3J;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cettmHDX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WHqXmw0GVc1+mZ62lwJeX+opySq3aWGZVirYtpV1Hks=; b=SLe2am3Juwomaz
	XumS5taZ6wIPrt6ICufZ4l3/5tON9ewQPgfo2hps7jgA1PUq3MYFYRqpUyHEqChzujV55jsat3aSk
	XYcD1NA1vHp9EdpDPbyQZqqivqPXSRq2S4UnQgPWYmI9+1lcLxluClBk/uoCoIspgeuJhFBy2BgAC
	WI6Zx6/OOrPP+gKjGiEpznT4RO4PQ3eGVi9AgInUh2ij7STPCwZbZZM4+bt+L1KxvERHgqiwbjNhq
	Swxsh5p0+dFJbMJUWJ0+i7IqXgrV/sqywtkoJyFV95PDteqVUVyrZE3t7FSQ0qc7x1xzQgw/prTIz
	gfD+WGdqIh0oUDnHCXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHoJ-0000000HOlQ-3zJJ;
	Mon, 09 Nov 2026 05:20:51 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHoH-0000000HOkn-04qw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 05:20:50 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so504578a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 21:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794201647; cv=none;
        d=google.com; s=arc-20260327;
        b=iAOMXrRRln8nbwGtxWQLRnPzFPFzx6GTPUuz6UDRPjHdxVB5B+A6lmA22sMODaSU3Q
         t49pJzsf/T+kuEXgMMuG1sL0Fr29QUQv6vc9wPR26FTOvcjvWEuILICShGCN0RQ4ejiH
         VR/g9bHEk9rCoccvwuq/RBCbO1pJEiLOxDzr9k7FQexo5vdGJm6ILAus3pXUr55xSBh1
         NXSbPXBwTcqKTtnegI/kMPEGvc994NR2+pzW4Ezs8sP1auJGS5Oafv9XRECMmrH/6ZjP
         NSy2hoJiunRcqBZCKhSVLA9+W4Y5Ki3Iz6/Qh/bAhDYPOPbpG9SngA1x0HzyYHga5QSz
         q9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHqXmw0GVc1+mZ62lwJeX+opySq3aWGZVirYtpV1Hks=;
        fh=f+cfdB9fTuck/2dm0zrfRT5H/kvC696QXhLbsuXBYyI=;
        b=capOlQ7yYUW5VsNaQxTrLXrLvzlFQ6YnYGHvcWwZndfG7jH2lVtUghp+Tm3M74oCEs
         pkJUMn9NTNQOu0BK6A5/YcdcYZ5uL1AP3MUBTwyi0NQl5GYv/WAQiUT0ocp/xGTuWHeK
         2ZkbyUwNxX3iygtk+5jMoSEta2OWsGDzYawjItTZJtSdTFf2/AHyNviUy46SVwJrpwij
         vcMOwsWJqOqvB5kF6oBENYhqRrI7qPXVof1FGabBzqnP95WOjxaDZM20bpmT34GHgsWg
         G8Nty0wVfB6FQRPQsY6TToeW5Z8dEaAY5JurhDpi8KVEhH3Wd6K+GJ7HHYHFXVqLN5QP
         97jA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201647; x=1794806447; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHqXmw0GVc1+mZ62lwJeX+opySq3aWGZVirYtpV1Hks=;
        b=cettmHDXjXYeq83jCDNpDpS8mKrEyeghU0BvFvsJ5/dmtMwCR6Z+0MmDio+Jw6mYWt
         UFnBZbyzZSgu7kGySMdT1rojI1+1EYqMEYt+L1ecNwgne68okxUFwSgBQZ0AxlXTwpIg
         b3CloxWCIMDftb4f5of4C3/xafrghK9F0vBVoZgKCOluNnaFhnB0gAce2q0WOmrm5Dvw
         agFGOP7VmCEiL4qs1KIS2BqY5bfKBLSkGEnVnS+332v48D//ENRchNWM9++4saNKwsCX
         RzjaLFOc6a7i1y+Cv4jILi2IKv4V2o73GxcBkhG18qF6rlAqzjBqHkXAo5RAfRQB3pv4
         lWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201647; x=1794806447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHqXmw0GVc1+mZ62lwJeX+opySq3aWGZVirYtpV1Hks=;
        b=frLIlxi+DeivpnbfUk1jr5kDopao1c4VL+m2Zyo4K3vxDVORoEwMzNvrA8is5fl2cA
         hLMVLWVjC2TUTuRCZUXyBRxmmsYKuK7c71uOaKmW9vc8KcmYBxTUnmAuKtaIFGfqdAKo
         YC9NZFoHSV6H3O4STDLQWVsnL/oHV22PNGV4ZGynNMXObJlmspPlQFqsvJ5Uzqif8PZH
         QVDoEBTZxPZ8cz34LKs3x52p2/qtC0LcpzJ8bdBgB+gXfJXelem9zrO6eRSAxrBK/eeP
         QVLwqq3MVPWS2kR8RZEkq7k2il577rnbj66vgW4+w1dqHy4Gq9i95YbAG7P7v2Mo+3yE
         IX5w==
X-Forwarded-Encrypted: i=1; AL+hErGbD3H3K2i3ryDd3gDZ1N6o0l0MGcdKluL7QP+TGmbCmi0PPq5hJ9ib2+7eTHHEYiraC+AvHQ/tfWIT5NoRQ0Ug@lists.infradead.org
X-Gm-Message-State: APuU4Z9qU7kc/D5gf4d5cQqgxd3lRzJYW5GXPQdM6yD3m24SVHIX7QV/
	PjeB/XtlrKpiKTCKyTiQmisE0OABuWZoCiFn4kqjSC904EeYrpXMs/zHQPEMbOnjshDIuPBoptW
	3dhXTaeZlNpQIN630tD5o0vcOKfBzTtw=
X-Gm-Gg: AYBFou0SLiw7QRXoMdscqggQ1hzNR45n9HpNfwVzERCVt5rmMPcSEPye7HBChTppapK
	GwZ4ogwMeNhsGHwdcJJzon5Pcwo+haMboiLQPVx8LpJFjyfB8xMi7wQC71gvtgMk7Syw/FwTfZj
	EaJlQnqcdAPIFJGgWsbhOSX472ekZpaOR7dTb3y1JXyLR9d9XLzCzaCsmWy5bPRTLBC1X8thEYa
	y2MnA58+Z1b38Apvt4oDFg6mZQsplYlqhgfqq+OC9TG5DNfS5j76bq9CPTlfOTw70y2QjjiHFxq
	dyoci6ndkShhfG1/gIZJTCJG5oCZdFvVYWd1yeIdAJ5MJ9zcZg3VB1zWAMYE/ObwX12/6lnwxFC
	WUb6zq80x1MlU1hxD1EZ3gZ1J93gm4qL0LjYFoAg7ukRtNSur/+ScHX7jMu9qTUR/PBBt1PME1d
	eB2G7Cfgww+oQQl3bdrySkHHjVxRcRTnWiPpAb7P2FRQzUcjTE807nofpoC3zo0WMNXqh7jhWtG
	QTXHBeUh7qxWeS1OO1mXJos5lNLDEQ7IIRet7On+MCGLUYyAA==
X-Received: by 2002:a05:6402:2349:b0:6b1:d2ee:392f with SMTP id
 4fb4d7f45d1cf-6b722462c10mr1849087a12.25.1794201646678; Sun, 08 Nov 2026
 21:20:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261005001143.576737-1-rosenp@gmail.com> <CAAQKjZOm5vA+38XVo5D4qV5B9eRT1seOShk-eFk_Jg_EQPdaOg@mail.gmail.com>
In-Reply-To: <CAAQKjZOm5vA+38XVo5D4qV5B9eRT1seOShk-eFk_Jg_EQPdaOg@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 8 Nov 2026 21:20:34 -0800
X-Gm-Features: AclHuK-SIIyleRJSywdY0Z0pO7le2Nv4F_kttBOVsLQnGOrWIxGto2xb9JrsOXE
Message-ID: <CAKxU2N9a6+0DXxtTxNwxWm6yBxmZS+AHpBLzyNBsvfRBasgAWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: gsc: allocate formats as a flexible array member
To: Inki Dae <daeinki@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_212049_111358_9AE1F822 
X-CRM114-Status: GOOD (  25.60  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 8, 2026 at 8:41=E2=80=AFPM Inki Dae <daeinki@gmail.com> wrote:
>
> Hi,
>
> 2026=EB=85=84 10=EC=9B=94 5=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 9:11,=
 Rosen Penev <rosenp@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >
> > The formats array is allocated separately with devm_kcalloc() and only
> > referenced through the gsc_context. Make it a flexible array member at
> > the end of the context and allocate both in one go with struct_size().
> >
> > Annotate it with __counted_by(num_formats) so the array accesses can be
> > bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.
> >
> > Assisted-by: LLM
>
> The allocation and lifetime changes look reasonable to me, but
> Assisted-by: LLM causes checkpatch.pl to report a non-standard
> signature and an unrecognized email address. Please describe the AI
> assistance in the commit message prose instead.
It just wrote the description. No actual code. I'll use
devm_kzalloc_flex in the next one.
>
> Thanks,
> Inki Dae
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_gsc.c | 17 ++++++-----------
> >  1 file changed, 6 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/=
exynos/exynos_drm_gsc.c
> > index d9637ddfcfc4..f1807ef664e1 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> > @@ -99,7 +99,6 @@ struct gsc_context {
> >         void            *dma_priv;
> >         struct device   *dev;
> >         struct exynos_drm_ipp_task      *task;
> > -       struct exynos_drm_ipp_formats   *formats;
> >         unsigned int                    num_formats;
> >
> >         void __iomem    *regs;
> > @@ -110,6 +109,7 @@ struct gsc_context {
> >         int     id;
> >         int     irq;
> >         bool    rotation;
> > +       struct exynos_drm_ipp_formats   formats[] __counted_by(num_form=
ats);
> >  };
> >
> >  /**
> > @@ -1222,21 +1222,19 @@ static int gsc_probe(struct platform_device *pd=
ev)
> >         struct gsc_context *ctx;
> >         int num_formats, ret, i, j;
> >
> > -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +       num_formats =3D ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_=
formats);
> > +       ctx =3D devm_kzalloc(dev, struct_size(ctx, formats, num_formats=
), GFP_KERNEL);
> >         if (!ctx)
> >                 return -ENOMEM;
> >
> > +       ctx->num_formats =3D num_formats;
> > +       formats =3D ctx->formats;
> > +
> >         driver_data =3D device_get_match_data(dev);
> >         ctx->dev =3D dev;
> >         ctx->num_clocks =3D driver_data->num_clocks;
> >         ctx->clk_names =3D driver_data->clk_names;
> >
> > -       /* construct formats/limits array */
> > -       num_formats =3D ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_=
formats);
> > -       formats =3D devm_kcalloc(dev, num_formats, sizeof(*formats), GF=
P_KERNEL);
> > -       if (!formats)
> > -               return -ENOMEM;
> > -
> >         /* linear formats */
> >         for (i =3D 0; i < ARRAY_SIZE(gsc_formats); i++) {
> >                 formats[i].fourcc =3D gsc_formats[i];
> > @@ -1256,9 +1254,6 @@ static int gsc_probe(struct platform_device *pdev=
)
> >                 formats[j].num_limits =3D driver_data->num_limits;
> >         }
> >
> > -       ctx->formats =3D formats;
> > -       ctx->num_formats =3D num_formats;
> > -
> >         /* clock control */
> >         for (i =3D 0; i < ctx->num_clocks; i++) {
> >                 ctx->clocks[i] =3D devm_clk_get(dev, ctx->clk_names[i])=
;
> > --
> > 2.56.0
> >
> >

