Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC898606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i85oREzK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OaaSf1PR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XOOROMKIPXr3CQSNIxjA9uq5C/f3wnb7r92RzJgi0oU=; b=i85oREzKVJnjiX1Mj/5bfPSJHc
	8Y/+qlkYD6Q1hPI7UZVcFf89ZYs1/RgQ6AxTloF//21giCubvdiBnDjacKfqw4B9KuEcQp6RyuXvz
	V+p+9k59oRfXGu9w/DL4GFCWHKlQ9v0PGJzCfVQyZgPX7fb0SL5aFl/P1RPsTK/6R+125vEU1Ixas
	U77PwpUk7dfjW1QbPGVofWJiMGYjl5LjXH4WD/qFN9+ZjfPthSV8HGUm4Q3/4vGvB8g6yHfxRJ8Fc
	GCChBS33/UpMbWofdTRadg0Gop79Q/DlqVl2ewslhrZsoQpOoj8yoUNrMBOB70mXIScZpdiSFoiJ2
	ouxWN/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTM9r-00000006QxP-3MfP;
	Tue, 17 Nov 2026 16:35:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTM9o-00000006Qwp-2OCL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:35:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so643755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933342; x=1795538142; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XOOROMKIPXr3CQSNIxjA9uq5C/f3wnb7r92RzJgi0oU=;
        b=OaaSf1PRgEfo6Pm9EFGSgFXHGBvqL32mxLgK+rZXfmyq/HAfP0/miJxXAaXRrbsAzi
         eilcdQN/7VHfE6YZHOSPVLteDdq8/bR4eFknEmAvXmkFE6YPEWrMkKrlAu0cYZl2jLB3
         HdHt6MQp4p1W6htyjHHdKfPVwpT+Ocb8oALleH0J//bSDt8Gd57nLpx02T+8NTaxDZyb
         5+wydIV692d0PeAdVI/BR0r5lWd3rqa4xPKHBTFxsXkaLMzO62yH3Kt3497RKGXz1AeU
         Ae3Dx0tSti3I2t6t7WgAiVcyq7XXTjiqIraxuVIFOYhqA0MJyzvlDCOALKe3S+rKdNnE
         ViCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933342; x=1795538142;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOOROMKIPXr3CQSNIxjA9uq5C/f3wnb7r92RzJgi0oU=;
        b=Row0FE0FtvBkteOftc+chvMk6F2nRrgsisccJZw3XhTun6OAnwPI8cqwYjwa0HFmOr
         N1yl47VSq+8v+J8sF7QHoQupWmKOEVpvVotvkaB8AgmjxpFZ9AKm4dyZV/tRu964l+QW
         2Beao7N3GJR9dvPilHKPPeN8GQaO5r45TwMPdm/xAEohphpvs7WVL8STez+5z1oK+iJ3
         iesqY8PU83kc/BdCcT+9X3cYcQnA7Dsc7Z8GVCYTqHkqTxsELvnjWcH/G203PTdNSJg5
         G5XHz39j8Be9SPQjiaKvBA+twTE6e+hVy7txVq2NNtvGYzJRe3/XJWsYtJJ9zMsI0kzt
         MooA==
X-Forwarded-Encrypted: i=1; AL+hErGyxCwmJy6NhnP6LgXqRR+teZNhKoGogkv33nl5r/V/h7A6598EyrFuw178IsiDvBpPGWkk9Rcy7uzS00ntoUn9@lists.infradead.org
X-Gm-Message-State: APuU4Z+Nt/3YG4XQUnGBXPWGqqq9IOAP5SKucG9yDF0ygdjpb1QMGnXz
	3a7dqoB7WlBGxMpe8RPg3x0v/2DopLXj5TOtSqOo4EXS/Q0es2G0uxk0
X-Gm-Gg: AYBFou1GuQ3omTSOrX1m8D8eJ2rX0T5esmi4eaLZuuTexzuxJKyNDpjyoi8lVHeGtw0
	lH3H2ek2pp3X2PqSphYYdZqITiCEsEW1uSv50wyQ5AyTFylxGEV4mMB246+FZQvKOySk3fASuN0
	HVDYafTEyFdmTObG8ezRTDiY81zPJcH1xJrsEi6ZAgBkjR0p+Y7zKh2LYsl63Ex2TPHNJL33Xzo
	lZBkg7Cx0mRdeA56R8QhOLd3bx2OQ3nx49l36j/LiYcH8taR5EPR2NN4mLOc+FBp9GvhsdcTJFC
	X1I6nbn3QRZ8LnFPKyBmkMhNmlrS/Lz6gfmWVh0XuWLQs3sb5Y8h0eVYFpLWHbShZhXwl2WX3W9
	BOhGp3OGIhrJJ+v2+fTyhLROWPVb/znIDd4vpoQ3wqdXEQs2XtQntFJtHBIuKw7MrNF6X41g46/
	rKyEIXUt9655ZRUSPawxYS9QDFkP72hpA8PGkEZxs55DCVuU7U+eWHYqYp9AhXChTXDRwJBFiL7
	+193B8SeQ/eAlmvtw6eSsmyNiTnhcssoT+hoSmVQmBuRC9v7FHcK9ecOyZxDboEtJP/94DeOuAt
	0ivLFWSIOpfjWh0ZW2EKACdltOignvJff/Jj7r51yJPBz0LpEFPcTiFul+QtT4E6NZK45U83EDX
	OHehDXv5exd5pSHVIbTbRsIDk7PO0BmFc0drulcK18Mfw3DBy70Fm11SN8zHiQ/3UUZalLF95N5
	kGcp+NFy3JPndmI0ud950OUiw6NWbiCaeEVqWmRm9TvpurK5zuxghwy+tu4yVilkBs5fxdevldd
	EgvsMxfs8lGDJlJR1e52iM+mMMPXY+aP9CLu3wCak5hqYd++2CPJf2E78w=
X-Received: by 2002:a05:600c:620a:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb69912526mr176343095e9.22.1794933342249;
        Tue, 17 Nov 2026 08:35:42 -0800 (PST)
Received: from jernej-laptop.localnet (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm28919970f8f.12.2026.11.17.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:35:41 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yang Siyuan <hsyysy@163.com>
Subject: Re: [PATCH RESEND] drm/sun4i: report coverage pixel blending for
 alpha-capable planes
Date: Tue, 17 Nov 2026 17:35:40 +0100
Message-ID: <VyjYt3XHQ3e42-zx5UUDfg@gmail.com>
In-Reply-To: <20261117091932.12063-1-hsyysy@163.com>
References: <20261117091932.12063-1-hsyysy@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_083544_764252_DF933C6F 
X-CRM114-Status: GOOD (  21.39  )
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

Dne torek, 17. november 2026 ob 10:19:32 Srednjeevropski standardni =C4=8Da=
s je Yang Siyuan napisal(a):
> Linux 7.3 added validate_blend_mode_for_alpha_formats(), which warns once
> per plane that exposes a pixel format with an alpha channel but has no
> blend mode property:
>=20
>   sun4i-drm display-engine: [drm] [PLANE:35:plane-0] pixel format with
>   alpha exposed but blend mode not setup. Please fix.
>=20
> The mixer blends a layer using its own alpha channel: ALPHA_MODE is set
> to PIXEL when plane alpha is opaque and to COMBINED otherwise, while
> BLEND_PREMULTIPLY keeps its reset value. That is straight alpha, i.e. the
> DRM "coverage" blending equation.
>=20
> Advertise exactly DRM_MODE_BLEND_COVERAGE on every layer that can expose
> an alpha format (UI always, VI on DE3 and later). This matches the
> existing register programming, keeps userspace behaviour unchanged and
> satisfies the new validation. Premultiplied blending would require
> driving BLEND_PREMULTIPLY and is left as a follow-up.

The subject says drm/sun4i, but the DE1 backend planes (sun4i_layer.c)
also expose ARGB8888/ARGB4444/ARGB1555 without a blend mode property, so
A10/A20/A31/A33 still trigger the warning. Either handle them in a separate
patch or say in the commit message that this one only covers the DE2+
mixer.

>=20
> Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format wi=
th alpha exposed")

This is incorrect. That patch only added general check. Drop the tag.

> Signed-off-by: Yang Siyuan <hsyysy@163.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 13 +++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 14 ++++++++++++++
>  2 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 7d894e1eb..ef059ac47 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -283,6 +283,19 @@ struct sun8i_layer *sun8i_ui_layer_init_one(struct d=
rm_device *drm,
>  		return ERR_PTR(ret);
>  	}
> =20
> +	/*
> +	 * The mixer blends the layer using its own alpha channel with the
> +	 * pixels not premultiplied (BLEND_PREMULTIPLY keeps its reset value),
> +	 * which is the DRM "coverage" equation. Report it so that the blend
> +	 * mode validation in drm_mode_config_validate() is satisfied.
> +	 */

Above comment doesn't add much value.

> +	ret =3D drm_plane_create_blend_mode_property(&layer->plane,
> +						   BIT(DRM_MODE_BLEND_COVERAGE));
> +	if (ret) {
> +		dev_err(drm->dev, "Couldn't add blend mode property\n");
> +		return ERR_PTR(ret);
> +	}
> +
>  	ret =3D drm_plane_create_zpos_property(&layer->plane, index,
>  					     0, plane_cnt - 1);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 92dd5a97f..b6771576b 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -470,6 +470,20 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct d=
rm_device *drm,
>  		}
>  	}
> =20
> +	/*
> +	 * Only DE3 and later expose pixel formats with an alpha channel, and
> +	 * the mixer blends them with straight alpha (coverage), same as the UI
> +	 * layer.
> +	 */

And neither this.

Best regards,
Jernej

> +	if (layer->cfg->de_type >=3D SUN8I_MIXER_DE3) {
> +		ret =3D drm_plane_create_blend_mode_property(&layer->plane,
> +							   BIT(DRM_MODE_BLEND_COVERAGE));
> +		if (ret) {
> +			dev_err(drm->dev, "Couldn't add blend mode property\n");
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
>  	ret =3D drm_plane_create_zpos_property(&layer->plane, index,
>  					     0, plane_cnt - 1);
>  	if (ret) {
> base-commit: 091b06388b117fefdcb63336ac09956a4914b961
>=20





