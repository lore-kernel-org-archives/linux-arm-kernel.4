Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60563606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r2f4ymnI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GhVnSYXR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VmgZV3Ha8SXRM5atMh4jHdaSdi8ER/Gp97TobHog/vw=; b=r2f4ymnIpyYFre
	+LvDJTWUKTziAbYyRQHEX6c0w+FS23QKqUm4IHJXrX9Gi+DofMJ7NjWa8Z3UsXM4/cRmRy4A71+JR
	tuyd85W3gLCV/SN6FO+sFq0qGJI9mCj4dynUwDVOnGRlXYxFJ/0V1uTjSwl0z5TeYa8cgvguBmn2v
	m1rb4pkDKck9AWEIdgjdYnij3aYvtICJqRMrIG1V9dCqI7nzWTssS3cotkuIAuhveL4FHFKUmwI7l
	THG46VBRb8TD+GBx4nlHSeZONZvrHi4Onm/oRFWJf3L4MX6wk18HmsMmvs2YtgFPySQRjUnxwIX1j
	z8mcRSZSN+ZigiqCCm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGgF-0000000HHtI-2N1o;
	Mon, 09 Nov 2026 04:08:27 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGgC-0000000HHsx-3oBW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:08:26 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b65d69f5c2so620454a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 20:08:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794197302; cv=none;
        d=google.com; s=arc-20260327;
        b=pB/1OXJ3plvmy3Jd6muU11eh04ExRzGCk6bYXVgb3RpWdY1duUEF9MAc5UA9A8AnqN
         /oKSM8/GqPLPb10j0+067VrbzoSYr0Gmjux5HsgMSGqjss7OadX6xHrhXeN4MzHB5T8r
         TPKBQySFM8CJZxzPJ85H8VLXxAaNDA0wJdih3L3HDD6YMiVDvcPlT7UvuXKldei50qlx
         bE7sf4gl3X76regk61g/PGhamS7c6LBeSLVYMLMl/bhbU2NpkTkpFXGJYCt6u8keNd6d
         8wKAPbt4qMEgH+TQfyrOpQdarjuQSx54pYEy1l0zoXxTSn5wI0EPhcMbWb+xoNixN2b2
         us+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VmgZV3Ha8SXRM5atMh4jHdaSdi8ER/Gp97TobHog/vw=;
        fh=d0GCToK+KdFTVp/VS0czqNqyBut7HXETN4qdyj7kPwc=;
        b=jwpcIxYqSJZytagcsqH+ocwH6NTEWJrSlWkEQZvhP++3ZFK/Qningw3wIS64T23/jA
         G5i1i9enNYm4vsNXYeWmNRfv1C02vwNxtITwMK8kqAbWIGd3FHqvc4oV0ekhE2Zm6cc7
         i+wOr7XbxRcqWFeI6QH1g0D7hA/PNjWoonjSlKyVyCVoyN+gWUfOfCPDulM2D+oIpClx
         PKySYhc6QOUb15SnOIDU5WNwjssCuDM3/kvmYlnZhyENCI0AB799tJHoPGrSOqXovVHZ
         Sz/hvPfIs8TtGlaWy7t5Dj7emEbHzHAxQfb+Iy5snc3AtW3JHIJ2Vjxu/XAZeZQ06K4C
         ruSA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197302; x=1794802102; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VmgZV3Ha8SXRM5atMh4jHdaSdi8ER/Gp97TobHog/vw=;
        b=GhVnSYXRYpLH0S0WyDNnFFrUcetbZpgkJKkJT/ZWqV8rGL89dNVb1d1EMdg6kdDt4I
         xRNn7DwTKWOvcbNU2D4apJ8qM7oKSgEwF9U48hC3Sp+3LfAR9oXcUkNmqVyQbMssSpEX
         g/m8Qa3R05ExQ8+N7K2Gw79GyoHFa/Cycw2xVorCqeMzrN6tFrfJksgwhjApX98qE7Dl
         o7xDYqzxfo0klQ2vfVnvHSBjl4i7Hai8W7JrSH9SpZH01W2wGjE71KCr1BKYmff197mB
         ny4KKmuDp73vUHpwkv7A4bw58oiBfkrPXVu/m+Xeiwkq/m8110WG/jx83l7hZGVpM2SQ
         Fiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197302; x=1794802102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmgZV3Ha8SXRM5atMh4jHdaSdi8ER/Gp97TobHog/vw=;
        b=G6Glx6LG/jc6Q4sefB61madcoPOs6ZJNJvIXn71Zr4RnMJbHZNPQGNOj8e+42rnbwe
         sYCUPVsqLNoP3ex9FUibsIJsLiH6mrIIOT7Ylxrs8PohMlSLRsGqqNRYFxGnXhwYProp
         6XS5hsAVUNrMLhUJJpFi8HB39Mx83ubrayezu2n4WLep29TQPVtn8qoGL1yV4rNhujG9
         9jAxqXckkIALjLTEcFbQM6AEGQ0v+NAKjhgqdm2j8bGP417hgwOW7EGuwnyppHUA5eVT
         s4Rnlf4+4EHSj1DLeoZjhxbqAeRmqmLnvDQ95jOSUUETV1yrjDa0D6rMXPLAtNvDLhcP
         6lCQ==
X-Forwarded-Encrypted: i=1; AL+hErEuSY7vK8bPkdEMY8pfDa3aNPDGgt47SKNs4V7548X2AWNfRFh3qpFRERmg3iLnafaNhFmJxaXLriohM3ml043U@lists.infradead.org
X-Gm-Message-State: APuU4Z8E6d0aDgQdvWNVzMTbM/zqYhGtkew9LDMvYETrZf+pV4HEhBHP
	rmsuKdkbZfgtqWekg4iJUN/GR5XTaAWDerfru2GX7bFRPEdjGTZDgGLc3hhze/AyVU7iixanR8f
	Sm+UVmxvRvz74aRJdaA0oC8XF1xmPRM4=
X-Gm-Gg: AYBFou0hPuYb/d74FUalhri413Pk7xk85YjFXQperRnr+o3PLACnbwrdquNotXdz6FR
	ur5GE36bXgBwVJo/CVblibzXBzrDISx7eaGCP1vI1m9gdndUCe3/Rtzjl0G2gCQ51t7Rm/7BIrW
	AT0u+RgrssZS44kEeXbIlbXmurwfXzHBvVQx+sn969yIBkgPqF9amOWe0MDEjNRZw8sXIHH7ktq
	clMzdrB0G8GftyWosoSJnHit69yUk2b+7REVJ+Lw344qxU8KUZpWM17bg96yImxBLYmg6lWAUBc
	dHGEySxWY7rFJnLy8gkqY97RrSq2ACa9XAMo0H99t+0gv1UmD3pl3RUIDZKQybDGmXvbKWLvONk
	p6T0HfTQdM+bHY2jD2xaC+qLdsfNavQV8TC0vzQEd9QO/X0LoxOpI6Dr0dNvyMzwDb7Q=
X-Received: by 2002:a05:6402:274d:b0:6b5:76be:62e0 with SMTP id
 4fb4d7f45d1cf-6b722480872mr1993578a12.35.1794197302011; Sun, 08 Nov 2026
 20:08:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260803135249.2898083-1-wenst@chromium.org>
In-Reply-To: <20260803135249.2898083-1-wenst@chromium.org>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:07:45 +0900
X-Gm-Features: AclHuK_ZmjCHtFzSMtsaBOPEyrbrKGy7XikpiPUkajiV_K7VOdZCVHHguZRFD24
Message-ID: <CAAQKjZP+W0_gByaDAv8DrtxFgSDdtw4AMd-=tA_Pr8gL30z1iA@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: Set supported modifiers during plane init
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_200825_005921_A0AA9A56 
X-CRM114-Status: GOOD (  31.37  )
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

Sorry for late review,

2026=EB=85=84 8=EC=9B=94 3=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 11:22, C=
hen-Yu Tsai <wenst@chromium.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The exynos driver currently checks the modifier in a helper called by
> the plane atomic check helper callback. This check only concerns whether
> the selected plane supports the tiled format or not. This is tied to
> the plane's hardware capability.
>
> Turns out the tiled support was added around the same time modifiers
> were being plumbed through DRM planes. The latter provided a way to
> describe per-plane modifier support.
>
> Add a field to the hardware plane capability struct to allow adding
> an optional list of supported modifiers. This is passed to
> drm_universal_plane_init(). This also allows the core to generate
> and pass to userspace a list of supported modifiers for each plane.
>
> EXYNOS_DRM_PLANE_CAP_TILE and the existing helper are removed, as the
> check is now down by the DRM atomic check.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 30 +----------------------
>  drivers/gpu/drm/exynos/exynos_mixer.c     |  8 +++++-
>  3 files changed, 9 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.h
> index b126cd129944..ab0edb826261 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -92,7 +92,6 @@ struct exynos_drm_plane {
>  #define EXYNOS_DRM_PLANE_CAP_DOUBLE    (1 << 0)
>  #define EXYNOS_DRM_PLANE_CAP_SCALE     (1 << 1)
>  #define EXYNOS_DRM_PLANE_CAP_ZPOS      (1 << 2)
> -#define EXYNOS_DRM_PLANE_CAP_TILE      (1 << 3)
>  #define EXYNOS_DRM_PLANE_CAP_PIX_BLEND (1 << 4)
>  #define EXYNOS_DRM_PLANE_CAP_WIN_BLEND (1 << 5)
>
> @@ -112,6 +111,7 @@ struct exynos_drm_plane_config {
>         const uint32_t *pixel_formats;
>         unsigned int num_pixel_formats;
>         unsigned int capabilities;
> +       const uint64_t *modifiers;
>  };
>
>  /*
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/=
exynos/exynos_drm_plane.c
> index 5c04ef87e400..31f5f0941154 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -174,30 +174,6 @@ static struct drm_plane_funcs exynos_plane_funcs =3D=
 {
>         .atomic_destroy_state =3D exynos_drm_plane_destroy_state,
>  };
>
> -static int
> -exynos_drm_plane_check_format(const struct exynos_drm_plane_config *conf=
ig,
> -                             struct exynos_drm_plane_state *state)
> -{
> -       struct drm_framebuffer *fb =3D state->base.fb;
> -       struct drm_device *dev =3D fb->dev;
> -
> -       switch (fb->modifier) {
> -       case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
> -               if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))
> -                       return -ENOTSUPP;
> -               break;
> -
> -       case DRM_FORMAT_MOD_LINEAR:
> -               break;
> -
> -       default:
> -               DRM_DEV_ERROR(dev->dev, "unsupported pixel format modifie=
r");
> -               return -ENOTSUPP;
> -       }
> -
> -       return 0;
> -}
> -
>  static int
>  exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config=
,
>                             struct exynos_drm_plane_state *state)
> @@ -245,10 +221,6 @@ static int exynos_plane_atomic_check(struct drm_plan=
e *plane,
>         /* translate state into exynos_state */
>         exynos_plane_mode_set(exynos_state);
>
> -       ret =3D exynos_drm_plane_check_format(exynos_plane->config, exyno=
s_state);
> -       if (ret)
> -               return ret;
> -
>         ret =3D exynos_drm_plane_check_size(exynos_plane->config, exynos_=
state);
>         return ret;
>  }
> @@ -312,7 +284,7 @@ int exynos_plane_init(struct drm_device *dev,
>                                        &exynos_plane_funcs,
>                                        config->pixel_formats,
>                                        config->num_pixel_formats,
> -                                      NULL, config->type, NULL);
> +                                      config->modifiers, config->type, N=
ULL);
>         if (err) {
>                 DRM_DEV_ERROR(dev->dev, "failed to initialize plane\n");
>                 return err;
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exyn=
os/exynos_mixer.c
> index 69dea5049309..d74e605a452b 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -93,6 +93,12 @@ static const uint32_t vp_formats[] =3D {
>         DRM_FORMAT_NV21,
>  };
>
> +static const uint64_t vp_modifiers[] =3D {
> +       DRM_FORMAT_MOD_LINEAR,
> +       DRM_FORMAT_MOD_SAMSUNG_64_32_TILE,
> +       DRM_FORMAT_MOD_INVALID
> +};
> +
>  struct mixer_context {
>         struct platform_device *pdev;
>         struct device           *dev;
> @@ -148,8 +154,8 @@ static const struct exynos_drm_plane_config plane_con=
figs[MIXER_WIN_NR] =3D {
>                 .num_pixel_formats =3D ARRAY_SIZE(vp_formats),
>                 .capabilities =3D EXYNOS_DRM_PLANE_CAP_SCALE |
>                                 EXYNOS_DRM_PLANE_CAP_ZPOS |
> -                               EXYNOS_DRM_PLANE_CAP_TILE |
>                                 EXYNOS_DRM_PLANE_CAP_WIN_BLEND,
> +               .modifiers =3D vp_modifiers,

The VP plane advertises the tiled modifier for both NV12 and NV21, but
framebuffer_check() accepts it only for NV12[1]. Could you add a
format_mod_supported callback to restrict that combination? For
example, the callback could check that the modifier is present in
plane->modifiers, then reject DRM_FORMAT_MOD_SAMSUNG_64_32_TILE when
the format is not NV12:
static bool exynos_plane_format_mod_supported(struct drm_plane *plane,
                                              u32 format, u64 modifier)
{
        unsigned int i;

        for (i =3D 0; i < plane->modifier_count; i++)
        if (plane->modifiers[i] =3D=3D modifier)
                break;

        if (i =3D=3D plane->modifier_count)
                return false;

       return modifier !=3D DRM_FORMAT_MOD_SAMSUNG_64_32_TILE ||
                 format =3D=3D DRM_FORMAT_NV12;
}

This can be assigned to exynos_plane_funcs.format_mod_supported.
Checking the modifier list matters here because DRM delegates that
validation to the callback when one is present.

Thanks,
Inki Dae


[1] in drm_framebuffers.c
static int framebuffer_check(struct drm_device *dev,
    const struct drm_format_info *info,
    const struct drm_mode_fb_cmd2 *r)
{
...
        /* modifier specific checks: */
        switch (r->modifier[i]) {
        case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
               /* NOTE: the pitch restriction may be lifted later if it tur=
ns
                * out that no hw has this restriction:
                */
                if (r->pixel_format !=3D DRM_FORMAT_NV12 ||
                         width % 128 || height % 32 ||
                          r->pitches[i] % 128) {
                       drm_dbg_kms(dev, "bad modifier data for plane %d\n",=
 i);
                       return -EINVAL;
        }
...

>         },
>  };
>
> --
> 2.55.0.571.g244d577d93-goog
>
>

