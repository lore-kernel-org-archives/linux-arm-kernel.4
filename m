Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260AA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eCzBBVgP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=koCzKE5X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LoqW5deJGeRyx4LL4mvcaMizyiaP0FzBVvAer8RqNLI=; b=eCzBBVgPoyX2LY
	mIcmJVMi0IupVvcLxYjxh+u8zlgD9abEtydOYRZzu9Md1W9F0dORrVmR/i5WX2Fo/jAz93Pd3jJOW
	0qazFFDor+tEaW1g1pge9BnfL0XMP6E+acXr3T5ounp+wyoIREE7ujZsdMxRLLlUebXTe62dR9n0C
	ZaNw2Z+1jpzqQ+LWvMrHrO1amSLC3p4wumsNZYx+rK7Hs2R9SAnGIDkT+RjA3b60ytAMI7xgrOKZ1
	vBHephCKywLyuSu525jlGIji1oCmiSZvVnBrIm66DjbqoKlh6VFSYJzc0vFky479jnVQhSzPs7C6F
	o9AMXhI84DBCo345Efpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGpB-0000000HILE-33O4;
	Mon, 09 Nov 2026 04:17:41 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGp8-0000000HIKr-1szc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:17:39 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c4d7d591607so63715966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 20:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794197856; cv=none;
        d=google.com; s=arc-20260327;
        b=qUdICdQFrmC2RJGAwav0Rh7VXv4Zq4TmrBarN9fC8JkNtel2+LcmR3cD+uF97eRoo7
         XHAL2yJm/stI7sffZDLnKOnBKKjtAVPPgPiwrYK3ql/dK1ahjhwssdd7Xpw31COlHS5y
         rKKtOsYvjnt6lmHkwo3alNfotsedPtRKiTLnHvEp3EdJIRrOdB/QJMVpBYIHKyFHq+DW
         s7QaxHaK2QDVezu4AfNHf3YRVlCnKiyI+HvHEDHyRHQcVkCqHFkFEOhcpK3MyIFLxFH1
         adKLbCxowT8VkbKuGSbtIZ17WpkLlWtf+8XyZUIXlD4MfEgH/34TH6SOMKz2rrkWOVU8
         9DDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LoqW5deJGeRyx4LL4mvcaMizyiaP0FzBVvAer8RqNLI=;
        fh=ITXE3ykDvtaSVKD5rrxmY6z0eErhjMYaIFL2PFESzeI=;
        b=hqbuqfYpSe599jiVhjc7Db6cPDDShHeWstqLbl/CsI1Fk1bK7nbNSbwOwgP60hI42P
         T5wBGVXJBxPb8+LDSuHYwIRWsTYM+xVWRUVQp6j9CAL2jYWL4Cvn6NLYStxWmmFg15ZG
         GTwdPJLufAn4k4xTGJiE85NvH1B92/sQDCcc56AXztD9KURMqvVlZUPlziPPHk50iaY0
         4XEGD/WNX85I0Z9R0cKoEjAlH8V8ZfLMxHSN7bP5WYCFm1/5ZLWsVqhYxS6ow3xC73Sz
         IZw0qgEDxapAvjXxtGkUwp+VRSI1NBrQ2ToG4zMCHclWskGI5telZ+9D9bN5Y2R1mQl8
         Ptlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197856; x=1794802656; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoqW5deJGeRyx4LL4mvcaMizyiaP0FzBVvAer8RqNLI=;
        b=koCzKE5XBuS6R755It5tigJk9QqVB+IkAIR9kymzA+TaRojrGBjvJvi6PIcf9b4cmK
         R1jAsCEfIKIaFwjZN6PqVjEfXZAQMriva5B/9+wBlzGD5muzb/B1wxJY/g3+vOBbajOx
         aYLjHw92j0daVS8KuCLMXswVtTB0Kdyob6nrM9eqkR0JOp6DRzS2BolAcTNo6YeVQbob
         rEhp9bR4moCbifdTBC7cMPCSX0qwXTux5+rylraQIl0cvq6zTkC8JVvPIaSNEQA3n7BF
         TpiwzuwSQmSpuNB3AeyRjOebA0r8lUMnzoEz3dBOCI4bjW4LeJjc6X0ik739AIzLA2Ex
         f6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197856; x=1794802656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoqW5deJGeRyx4LL4mvcaMizyiaP0FzBVvAer8RqNLI=;
        b=2WV+n9lNG5HoNgOb1ZB6y7yM8nrpJaUOm+zrPxWb3XIbYmphQhYm5NgZ8XsCMY9p9L
         7Np+pIv92k1LoFdmGBbbYADs11wN+4VnIKErHyMk1UwD2MDKg1X2dTdgYam3QUOWAo1t
         xNCdHHq0me6darTUEUZ+ocbXdJiyV+6iRpZ8VnDEdL0nHjrLX7cZ3++bB92SNtRqR26M
         S9QkV5+so9Nng9or4ueYV8DB5Sl0CH0lSO8X41WXoyRHdjOQ9aI1oN7VbhFBGZyl0g6F
         bfEH5bODiR6jf72aSeLkB3yBqjVqExIKjBrmsStL2IPm3K6qVz48i06E1Jv9i2PpZRKE
         czhw==
X-Forwarded-Encrypted: i=1; AL+hErHJCgQzrUHKs5AWR0/kSIsFST8FFvfDXITq5KjTMBH0umeGr48EghAYUN9uqAzqucfGeo19s6WgF5k2XkB3xHuT@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZEg/IJUYl+Sbd4U+AKTInJmp/wQaSVvrvyk6ZHIbTZ5rwBvNQ
	1oWbmGKcUUfV0/oF95NMEMzIazUVJGMkhpZeCIanBasi6hPhFPvAQwcQSBADRvvbc1JaeRFYprb
	u5Fp3NnROT0k4Ov9Aef5kMeFJhTGr/W8=
X-Gm-Gg: AYBFou1fKFFQqgplrkBLO6v/9z9W+HwNw91d8AdLesGDV6JWjZX0fUAVc8fHcPJYW/7
	vjPbAS1uv/L0IgSrJXjuxLvh8wHr+RdhrvvDH5jvMxkQyMZqIMJQyZ8meEyt0vST6R+u6XoCAjk
	DaFH7Df0whGwYYS3y2GvgMSkT3klKxOyexvpxMsNfNR7m47H8jScmRd2RRwyiOXgsQ5npY+pXHg
	9Kx6K6qtPR5ttiyiFWPs5tcE2ag5yfXvAS4dkQhXFupZXljTMrCjFkfy0HQ71fhjM2ri4Hjsfw8
	3KjgDaaGLoeV8NPM7pZR7UrTmlFaMP/6ygJ7GI3FBumg4MYIBtKNkr72QVsZPX/BClS7ck15SO3
	eUsgOcL/dWAi2SbE844RrBPTuwUHoj/rOC8I9ystwabsBWdJr0XsNX3mo/x0+tmlotyU=
X-Received: by 2002:a17:907:6d1f:b0:c31:7495:e5b with SMTP id
 a640c23a62f3a-c4d6d4a3b57mr182492066b.10.1794197856252; Sun, 08 Nov 2026
 20:17:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261003080927.430719-1-yaojiale02@163.com>
In-Reply-To: <20261003080927.430719-1-yaojiale02@163.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:17:00 +0900
X-Gm-Features: AclHuK_-J55s4cWgSUjxGa52TLLl1osPNTJb75kFDeEkQ09-Bw0YuPtbJyTYZXU
Message-ID: <CAAQKjZM991J2BoFkqnsyP35Lv91FYmmdpN93vqRVxRsTV-pu8A@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fimd: handle runtime resume failure for DP clock
To: Jiale Yao <yaojiale02@163.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_201738_515711_E8EB0F2E 
X-CRM114-Status: GOOD (  20.38  )
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

HI,

2026=EB=85=84 10=EC=9B=94 3=EC=9D=BC (=ED=86=A0) =EC=98=A4=ED=9B=84 5:13, J=
iale Yao <yaojiale02@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> fimd_dp_clock_enable() ignores runtime resume failures and still writes
> the DP clock register and updates dp_clk_enabled. This can access an
> unavailable device, record a state that was not applied to hardware,
> and later drop a runtime PM reference that was never acquired.
>
> Return without changing the clock state when runtime resume fails.
>
> Fixes: 5d91394f2361 ("drm/exynos: fimd: Guard display clock control with =
runtime PM calls")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimd.c
> index b6abdc4f2b0a..ea2b961f0cbc 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -1049,12 +1049,18 @@ static void fimd_dp_clock_enable(struct exynos_dr=
m_clk *clk, bool enable)
>         struct fimd_context *ctx =3D container_of(clk, struct fimd_contex=
t,
>                                                 dp_clk);
>         u32 val =3D enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
> +       int ret;
>
>         if (enable =3D=3D ctx->dp_clk_enabled)
>                 return;
>
> -       if (enable)
> -               pm_runtime_resume_and_get(ctx->dev);
> +       if (enable) {
> +               ret =3D pm_runtime_resume_and_get(ctx->dev);
> +               if (ret < 0) {
> +                       dev_warn(ctx->dev, "failed to enable FIMD device:=
 %d\n", ret);
> +                       return;
> +               }
> +       }

The early return on runtime resume failure avoids accessing the FIMD
register while the device is unavailable. It also leaves
dp_clk_enabled unchanged, so a later disable will not drop a PM
reference that was never acquired. The change looks good to me.
Merged.

Thanks,
Inki Dae

>
>         ctx->dp_clk_enabled =3D enable;
>         writel(val, ctx->regs + DP_MIE_CLKCON);
> --
> 2.34.1
>
>

