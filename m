Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF522606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hZ/rCxSE;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCej5rpz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=27RG8D8CerxM4BmQ9ucwQVVSwZlvRge1TEEkPaNQ8Qk=; b=hZ/rCxSE2qItAp
	2TPtC+NKpopBNSayrcHu8vxUMG5M4iv79ziOhXrmp+pCaFtVS1etqiYXP5PzTuG1cF8xa7dAgr3cb
	nD2VRODT6/UrsTH7g8QbDk8lfZcW9Dd/LppvJNAmPfPfugrmfReDrs0B7VtJgI8QBPuRIOzOGnbSA
	sz7P2sPeYr+uUegldiXzNRawbhLgMORQZaiiakULUT88dhMzgkTyp3DHQT6ltqKByocztCQJZRHiG
	5NI2sPp/VgWadV1IHibdtFl9O5kePmGyeNZ/fhibQ4iwyLyKAg59xxgn8A+Zp37KXo7duNLw44K1s
	GyfdyyrH6aE6S/fETrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHCa-0000000HKgu-2S5J;
	Mon, 09 Nov 2026 04:41:52 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHCX-0000000HKfK-2UvJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:41:50 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c4ced671398so51782266b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 20:41:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794199307; cv=none;
        d=google.com; s=arc-20260327;
        b=o2Gh+uYeXG/r9PSlxLtYv2SFxhNGiDM4EIMu2dALQgasJDiHnoF1SkVak+OOvBchXc
         hIJJO4xX1W4Q6N8a+dHn7y2d4ul/1SPQV4n7AQsLWcszXUb+nLRa+30Y9ZUFwcwq7ztZ
         7k1bi6pAeh7sFhsFyyBhpUA3eYOyb1FGitpd27+Lz24LqZcmUt52EE8g2bWzMkFRvyMm
         4itIwqAKM+9VBQ+h8bf9RhzGjElw6IJGTWjuT66V94U1SjPmMvvLuUcxCbuPzkusNiHZ
         V3tUtdVQSMS1ywPLyfvByPO2DUxSMyAmNEOdoIv8+3BObvuEUuWNOX0Kt0t7/OHaZwYl
         mpwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27RG8D8CerxM4BmQ9ucwQVVSwZlvRge1TEEkPaNQ8Qk=;
        fh=CD8W/JnBJ0MkRSBO5BYOODt3dE+GuQucxdJ1/Z+qm/0=;
        b=lWJLx1mRHbrfvpUzPdFE0VoHp20za9SRR0W7s6yRu/8Zv8eDtwPH5cm7l2Qhej6RY5
         jJ3ArLxTX2mAA1G6lu6zdMJehA81mQhgWschiqBGeSiVJqZY3ugRwxF/rWfr2ugRcGpB
         /L0l5MhdcpetMZN4IxvNobtYmw5Q/3zULJ1OGmAHr2IW6HUeLqH1IxoDpaFr4Iqv89Va
         2bh1CA32eNtBT/OIl7AF3NDVcoHZbuNOu22XTmUMgZ1UicXOX3kUpp13J6szNYnePbUm
         XvJzlG44Gez2ncyP7ZaJ9sJjNcaGbXGFZ6dDU4Iikuu7GOuURP/Ot+8k8nbzRM5AJDCp
         DHig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199307; x=1794804107; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27RG8D8CerxM4BmQ9ucwQVVSwZlvRge1TEEkPaNQ8Qk=;
        b=hCej5rpz3Dbzumf6pnUe/BTyCblT6VLBJQPPkHpwCA4TeXfeYcba3DVUmVuz7A8t+d
         WTrTotaFNTvXGI627FLuPUF+2X0DaifvMIFCChr+OFlJuLL5MdajAvdwBRC8KrRJhrLi
         U9J9Ez/nUhEXawYh1aIjayJNnbqYTOzglEeZeY6X/hQt0FtxSmAQWh7ky7uSRjikA7VI
         osE581+NKhDjN7TfvtvxcrAZJn8Gi7dZGGouRf1qUbVavEuoP89L0nUkoK6XfRatumAd
         UUhJZ216ZgG3J/CqUI3ipsJ+4CUcyuIUtOOygO9YBIqgoWYtJtqa0m/GBYw7NRdjel2+
         SMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199307; x=1794804107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27RG8D8CerxM4BmQ9ucwQVVSwZlvRge1TEEkPaNQ8Qk=;
        b=wPGqbz85/oclG+yYPJxFt7ljP8erCL7fr/SOAT4nt1aXfutUq8Gg6pi2L12zzx6U0e
         pqDSOI0numuJK7n1V+E3wOq2jWelVDBxi7pw9T4Eben6rOjYX3v8D7ZCofocGHGWWOoU
         VYQcft4C2nxAADTNQUSKzykAVbUiNVCwOK02PG3X8DhGLeMe5pSUVbAnbqownP2zvSSO
         olIUGs/PcsaHX75qpJWs1hRSE6xO2WCHAfjeoclKvVt5uFglL9DKV12fnChCfmyffeYa
         3DUGm1i1zs/R00Gm3jXgNii7dXXgiz+vi3Izc+Gg9unJY/f1bTUmGSd4Q4gLJgQa0Pyw
         i2Lg==
X-Forwarded-Encrypted: i=1; AL+hErGu2sBy94CAC0rdBG2ZyEGEoKW6xj5Tuo67/m6dEAW9fMeXJBJeFIIm/qsACAwlU1EZxhXu+p76N6MIN0z5deoV@lists.infradead.org
X-Gm-Message-State: APuU4Z+vu3ga+ZKKHm/1pGULsafeDNoMc332DLsTLQkXDzlm4wlWL01Q
	n8HrCgF4ngF6DzKZ6c+YZqRinOe7EZ8o8p05JNRL12apiw6gLwT9RQFDMvFcWHhiw01+kmYBDXu
	Ukm0rpvIl1sr0b9tAsvuTLRcvjPjJdEc=
X-Gm-Gg: AYBFou2EnI9uV1Iy/hBUOW8HcBOLQfEURqjX4CqTqR7p3ZH3rk3iSUJ4xmGyu6gfpcQ
	ko/CRd+LL+ORMi3pEsEvTyGA6Ov2Bh6rJLuctCKoGKYcWfyt7coL5xtQlR2Ja9neIO4e3gTo04l
	uC4Qi5LLFFV0slrXxaQKUsYNNMlGmzgZtl45qyDgeqdBrnOMlshSgFQAJNiEPFGnjNR8zsJxViH
	AoH8vXW2ZygZzs280JDBWT8T1wzSnHojKBUUEhpvoULxB9I4g5RXFX0w1qPPuwTX/3BmN3MxalN
	gXubOvXuJMsdN0cJH57QDd33/u4UnVDuUcrD0bZ/7SEzzH5NhmwQEFYxPkmH0kcrmJ9uYhgYhF9
	dk478AKyLmSgR0WA9mlqKemK9KYKS0tz/M5ltEzUCPXeX3lMz6MHd6feqC/HTNseD6sY=
X-Received: by 2002:a17:907:2d93:b0:c26:19de:9aec with SMTP id
 a640c23a62f3a-c4d6dd8cb24mr224378766b.43.1794199307082; Sun, 08 Nov 2026
 20:41:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261005001143.576737-1-rosenp@gmail.com>
In-Reply-To: <20261005001143.576737-1-rosenp@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:41:10 +0900
X-Gm-Features: AclHuK-aAUizeCRuM8WnAlvp8mvibSB9oiekBPg9ucUpGQvhhZ0l_iKHx8QZ7R4
Message-ID: <CAAQKjZOm5vA+38XVo5D4qV5B9eRT1seOShk-eFk_Jg_EQPdaOg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: gsc: allocate formats as a flexible array member
To: Rosen Penev <rosenp@gmail.com>
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
X-CRM114-CacheID: sfid-20261108_204149_662016_131FB50C 
X-CRM114-Status: GOOD (  21.62  )
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

Hi,

2026=EB=85=84 10=EC=9B=94 5=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 9:11, R=
osen Penev <rosenp@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The formats array is allocated separately with devm_kcalloc() and only
> referenced through the gsc_context. Make it a flexible array member at
> the end of the context and allocate both in one go with struct_size().
>
> Annotate it with __counted_by(num_formats) so the array accesses can be
> bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.
>
> Assisted-by: LLM

The allocation and lifetime changes look reasonable to me, but
Assisted-by: LLM causes checkpatch.pl to report a non-standard
signature and an unrecognized email address. Please describe the AI
assistance in the commit message prose instead.

Thanks,
Inki Dae

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gsc.c
> index d9637ddfcfc4..f1807ef664e1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -99,7 +99,6 @@ struct gsc_context {
>         void            *dma_priv;
>         struct device   *dev;
>         struct exynos_drm_ipp_task      *task;
> -       struct exynos_drm_ipp_formats   *formats;
>         unsigned int                    num_formats;
>
>         void __iomem    *regs;
> @@ -110,6 +109,7 @@ struct gsc_context {
>         int     id;
>         int     irq;
>         bool    rotation;
> +       struct exynos_drm_ipp_formats   formats[] __counted_by(num_format=
s);
>  };
>
>  /**
> @@ -1222,21 +1222,19 @@ static int gsc_probe(struct platform_device *pdev=
)
>         struct gsc_context *ctx;
>         int num_formats, ret, i, j;
>
> -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       num_formats =3D ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_fo=
rmats);
> +       ctx =3D devm_kzalloc(dev, struct_size(ctx, formats, num_formats),=
 GFP_KERNEL);
>         if (!ctx)
>                 return -ENOMEM;
>
> +       ctx->num_formats =3D num_formats;
> +       formats =3D ctx->formats;
> +
>         driver_data =3D device_get_match_data(dev);
>         ctx->dev =3D dev;
>         ctx->num_clocks =3D driver_data->num_clocks;
>         ctx->clk_names =3D driver_data->clk_names;
>
> -       /* construct formats/limits array */
> -       num_formats =3D ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_fo=
rmats);
> -       formats =3D devm_kcalloc(dev, num_formats, sizeof(*formats), GFP_=
KERNEL);
> -       if (!formats)
> -               return -ENOMEM;
> -
>         /* linear formats */
>         for (i =3D 0; i < ARRAY_SIZE(gsc_formats); i++) {
>                 formats[i].fourcc =3D gsc_formats[i];
> @@ -1256,9 +1254,6 @@ static int gsc_probe(struct platform_device *pdev)
>                 formats[j].num_limits =3D driver_data->num_limits;
>         }
>
> -       ctx->formats =3D formats;
> -       ctx->num_formats =3D num_formats;
> -
>         /* clock control */
>         for (i =3D 0; i < ctx->num_clocks; i++) {
>                 ctx->clocks[i] =3D devm_clk_get(dev, ctx->clk_names[i]);
> --
> 2.56.0
>
>

