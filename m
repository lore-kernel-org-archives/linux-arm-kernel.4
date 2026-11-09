Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CB9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 05:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HLTFrIyI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9o4E3cZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WIf0dJI3704E56UOzqLD2NIWJwb6NLuXPSl2wIJw8fs=; b=HLTFrIyITqTGDg
	6ViglQRHSzox7POVlRxOFjWzRtZd+MpRgi9L7zrlbZQ4xNuzunFNEx+VPwMBMdNtT6yAsfyN4a9wN
	v9c80w0m1IWT27MVMDmntiamqwQVTLqwOTb6KCYoXLo8hCv85t+/UDh9Fp/xtN4fvZkzqMmZknRhY
	U12LqUEMSvCLtUdobdDwWxtb01uXIIme4jIcyk9JFuodQ9p3ZmW5ha+BryA9Lq7GfjgybMzL4z7wP
	UTQPTEtr3HGbK+SDfHK5ePL0CuXyswx9XV2RFioAd+Brwom4kZlvkjJpr8o180Ttevfb5beYsddr5
	JkcJBMzXDf4lcB6xAmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHqZ-0000000HP0q-2u9z;
	Mon, 09 Nov 2026 05:23:11 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHqW-0000000HOzy-3xft
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 05:23:10 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c4d58c50743so63697766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 21:23:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794201787; cv=none;
        d=google.com; s=arc-20260327;
        b=YxK0HgPuJx7bJP2tJMpJ3TOHqOd14WmtMq3NX38760GeS28k8QoX5bvwOPV42fMrIi
         0igDvJa3Rflsd+MQF3WMmRcGEDVpBO9f4WSdYzA7/T7luiL88DH9tX0u5vVYMb9ZpvH+
         2Y/LWV+479bByBWx1EeCUWTlGT794TlaLH3t6Qx7yFfF9P75Piu66nMrqD7JOXvn+R7K
         /iIsaicahsVzfPzeIS4y9b12h55rY/t3Q2FWYjwpJoodqb/7jeNhiuKB8EluKYDSmWj1
         u3svfZBu8m8qGk3hTzAEWoVhs8pDLsao3uJlV3jJQ2m47JLvfcojw/lH023Gb+9FAjjV
         NKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIf0dJI3704E56UOzqLD2NIWJwb6NLuXPSl2wIJw8fs=;
        fh=EZaadbZRuPMLnoe23t+Q3LWQamrjEjrgbx9Mo4vfA3A=;
        b=RLyI5ow36T8oFphPsr6PU9RYbFG0hTmB9IpT44kEHO7G2Ls8lNa6m89ThwUnBWcYf5
         Xv/U5g2Ca6b8wogp1uArkIYbZjwfqHirN8Cz52Ctyw/VUiDu+poxP6KH9+pFX7e/Ydhm
         31UlAeW6TOMDNsE16EspZT6qZ9dozHcaVHfOxH56RVeZZ3vyJ2ID8jF68GXEH+19zFFD
         n6Y9CcLwV6V6MPQHFewJ2Vk16fK+JRpoUqG7fZ+Jxk4UthXbIwYquIzL8PbcCkafc+KR
         0SZUU/0RU631UIMLSe1c35GuaBOFW8eXzi9ndigskDNAszT8B7oXI9togSC7/CAlf1ZN
         1F/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201787; x=1794806587; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WIf0dJI3704E56UOzqLD2NIWJwb6NLuXPSl2wIJw8fs=;
        b=W9o4E3cZhuVdBHm0ruOBpOdeS09xVkoEuZ0m8qN3JFrl8WUzfjZQhu5FAduqZCfogw
         TUY0tznSojQC0sho5cTiMYK/gsLaImVJiwkRMvMtVb0TyOo/QKaSQMfcWGrf3C+4utIf
         eHs5rq+ZkYQKsU0z/64ZGpp1BvZl0IQob8grI/99IDQo8qR7s8IAbZLGLpQgLBFL0bm7
         /MXpZsJu2LVQ9NN7smWpXZpsXsVvUJwh3ZQQdHv/vFrwvA//HmEhVl/SYyF8yXJnc4oq
         aHd/uxL7UgpYBd7FFKtvIvy5fV2xkdBNYkse5leyiHdwo9kmUaCCe4ek1AnRP/zIhlBK
         1DNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201787; x=1794806587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIf0dJI3704E56UOzqLD2NIWJwb6NLuXPSl2wIJw8fs=;
        b=kG5YnC6S1zXEPgL4jbQURXwHpuiRNt5qEOF/Ia4I6wVNkLixXP9WCYyKjOyP6XfEXD
         FcvnW5TAFq8P8FC5hIw7aAcc+AqEAyBw7otWHRd14YBpeCbNiwhN8HEJCA66NZk2jy/B
         hTGOpeAJN3DVfMlmz+h+w6kRSrxh1oSNAG6GQf7O22++PIgzvaXbzmgO3yQ3qDxTH6Jg
         ohO6X8OTIgk/N+OUfTU5BwZQKTHxPbqnbeHwSVjnf9sNDQSBsWrDK5dDTW49QU4EGpn8
         GOiPk+Hn08kC/503/ED8M4u79ZGZ9RTw5eR5DLSHt85enBwSzTFVD754Hii9ra4pfe+h
         pWPQ==
X-Forwarded-Encrypted: i=1; AL+hErGnKC49hiAu4S7rSZaV+hTFkW8+U4/BDo8R1ZJV8G/Vu/N2u21M2ZNNRD6GIzASekktuTdM0HHHkNlt2ilo0cGZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8XdJaIA6bwQB5A14Yp/y8FhFzYZBseIinGfQyo2nC8iYobc3gZ
	Fu50Dcu9XzYQOiTveOHIjtY+jVcETf+aVL6QvkF53+dtKml5N/c5Vy5tTnRHZ4GcISLDr7rlIoC
	7LXy7UQrRNCm08WIMhtgmKHxmH6dR5Vg=
X-Gm-Gg: AYBFou047WQeXyCzFPJmfSHPy7WwKqbtGq6Hh1VDyt43wsSccfR3eosUgpK+s3F3Dpy
	scq9BaGlt7UjH60bpyMB2x2N5cGmV15cAdClsnue2wADmMYB9CZio9WuxQ68kowxhJPOllsANpJ
	c8lzxlSNtHj/9vQqmytlslGtG+qeO1uYqgftpbVjWiZF5t5he8bkhziDzIVbqddQKemOJPopwB/
	VCpMlWbjolr6K99IjoQghFEjmtmlTc6lGw+HpN756wSZuV5+Xsc/KCVpfNc3tNtZLeGPbZrbEQ2
	e5msheA8b9Ehc0s1zVNzNFaMWGbX4DBvJZiyKCG7srL5U14ltSmyJxA2itMi5u3ikqe6XzKA2if
	msYAhHngEQd/xb1zwdKdbA/mP0MT7NzbwbUjq1ySa5iV9sgxh/Uq03YpP50oaFdove6su
X-Received: by 2002:a17:906:99c4:b0:c40:80eb:c541 with SMTP id
 a640c23a62f3a-c4d6d162393mr200408166b.2.1794201786662; Sun, 08 Nov 2026
 21:23:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
 <20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 14:22:29 +0900
X-Gm-Features: AclHuK81atJWOGvLDgXq9hG63fw54it5ISsaMjIoBGuiYyjTASlvmDvAtFTGEpY
Message-ID: <CAAQKjZNBb4CnhBn-TSD=8zbrOtWbu7fdpJDjOOvfAZQmAhNcYw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/exynos: exynos_dp: change poweron/off to encoder enable/disable
To: tb@a-marquet.fr
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Douglas Anderson <dianders@chromium.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Lukas Timmermann <linux@timmermann.space>, Henrik Grimler <henrik@grimler.se>, 
	Hendrik Noack <hendrik-noack@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_212309_057222_D59AB14A 
X-CRM114-Status: GOOD (  23.20  )
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

2026=EB=85=84 10=EC=9B=94 27=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:09, =
Alexandre Marquet via B4 Relay
<devnull+tb.a-marquet.fr@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> Current functions exynos_dp_poweron()/exynos_dp_poweroff(), that
> supposedly powers on/off the device, actually only enable the encoder
> clock. This cause issues where poweron() calls fail silently in
> analogix_dp_probe(), leading in some cases to a state were the encoder
> is never enabled but the rest of the driver assumes that it is.

Moving the FIMD DP output clock control to the encoder callbacks makes
sense. Analogix runtime resume can occur for AUX access before
encoder->crtc is assigned, so its power_on callback is not a reliable
place to enable the display pipeline clock. The DRM atomic helpers
call encoder enable before enabling the bridge, and encoder disable
after disabling the bridge. That ordering keeps the clock on while the
display link needs it.
The change looks good to me.

Thanks,
Inki Dae

>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 40 +++++++++++++-------------------=
------
>  1 file changed, 13 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index 82c238829921..16b00aacd55b 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -43,39 +43,27 @@ struct exynos_dp_device {
>         struct analogix_dp_plat_data plat_data;
>  };
>
> -static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *pla=
t_data,
> -                               bool enable)
> -{
> -       struct exynos_dp_device *dp =3D to_dp(plat_data);
> -       struct drm_encoder *encoder =3D &dp->encoder;
> -
> -       if (!encoder->crtc)
> -               return -EPERM;
> -
> -       exynos_drm_pipe_clk_enable(to_exynos_crtc(encoder->crtc), enable)=
;
> -
> -       return 0;
> -}
> -
> -static int exynos_dp_poweron(struct analogix_dp_plat_data *plat_data)
> +static void exynos_dp_mode_set(struct drm_encoder *encoder,
> +                              struct drm_display_mode *mode,
> +                              struct drm_display_mode *adjusted_mode)
>  {
> -       return exynos_dp_crtc_clock_enable(plat_data, true);
>  }
>
> -static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
> +static void exynos_dp_crtc_clock_enable(struct drm_encoder *encoder,
> +                                       bool enable)
>  {
> -       return exynos_dp_crtc_clock_enable(plat_data, false);
> +       if (encoder->crtc)
> +               exynos_drm_pipe_clk_enable(to_exynos_crtc(encoder->crtc),=
 enable);
>  }
>
> -static void exynos_dp_mode_set(struct drm_encoder *encoder,
> -                              struct drm_display_mode *mode,
> -                              struct drm_display_mode *adjusted_mode)
> +static void exynos_dp_enable(struct drm_encoder *encoder)
>  {
> +       exynos_dp_crtc_clock_enable(encoder, true);
>  }
>
> -static void exynos_dp_nop(struct drm_encoder *encoder)
> +static void exynos_dp_disable(struct drm_encoder *encoder)
>  {
> -       /* do nothing */
> +       exynos_dp_crtc_clock_enable(encoder, false);
>  }
>
>  static const struct drm_encoder_funcs exynos_dp_encoder_funcs =3D {
> @@ -84,8 +72,8 @@ static const struct drm_encoder_funcs exynos_dp_encoder=
_funcs =3D {
>
>  static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_fu=
ncs =3D {
>         .mode_set =3D exynos_dp_mode_set,
> -       .enable =3D exynos_dp_nop,
> -       .disable =3D exynos_dp_nop,
> +       .enable =3D exynos_dp_enable,
> +       .disable =3D exynos_dp_disable,
>  };
>
>  static int exynos_dp_bind(struct device *dev, struct device *master, voi=
d *data)
> @@ -171,8 +159,6 @@ static int exynos_dp_probe(struct platform_device *pd=
ev)
>
>         /* The remote port can be either a panel or a bridge */
>         dp->plat_data.dev_type =3D EXYNOS_DP;
> -       dp->plat_data.power_on =3D exynos_dp_poweron;
> -       dp->plat_data.power_off =3D exynos_dp_poweroff;
>         dp->plat_data.ops =3D &exynos_dp_ops;
>
>         dp->adp =3D analogix_dp_probe(dev, &dp->plat_data);
>
> --
> 2.43.0
>
>
>

