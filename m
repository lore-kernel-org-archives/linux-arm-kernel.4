Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FFF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lgBWWTmM;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=jJGqHvQt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ctvd1E18LBT1bm/OVmwtHp7EJOxWtY2oUhWq4p20dK4=; b=lgBWWTmMvqauIp
	cJw4jAZrcHp8oQqY+BYYFzQsVG+nQphPwrSGrNq7xIU1aL7xaPktKAjJHC6tsxJfywNxv4r1j2wND
	OIKPhvDiqulHQwPq8L47/345zZUfiP0zpk3MLWgj0P0Bh4UfQgqOUlFyi75pDecD22uegip4+KO8c
	du3Hp/lMB2GbNLfVKvelycYCBGFoFjQyP784pBQq2qQyTm5lSk1fax4cH0VRdYDvD1+oQlOKY2QO8
	kdbxy6N3+5LhrgoGjC1aUuPNNe1nXi5EaryQGCtULZj/jUlzf44gT3CoXWbC2Yoa81ab1/iw3feXm
	CjIceXoYl8PM+Fywz67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMXY-0000000EkLN-2rCH;
	Fri, 20 Nov 2026 11:12:24 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMXH-0000000EkEL-1DbD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:12:13 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-8b30ff12f84so4815487b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:12:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173125; cv=none;
        d=google.com; s=arc-20260327;
        b=JgHRoO7uma9hJDqRXSedrM5uZNLEnaj3CZh7X7zZHwPO2J70f2k7N21WHy5i6YU1cw
         uXzTzJdsotw8p/MPOkPVtNbZNsmV3p/38ffhQl0fDuCK80f/I7tXyAF/+HsUQNFWlTDC
         AgYuA+N7sNA8MgbWTl6rVQqhG/ZhDkrbu127/L0+8yzb+qMgjrQ4BCuKrks0/AlWiL7m
         Sf4o9woR08K7mamuMGic2eT7NOoD+9D8yonXMGrzVMeGvw9+w+TtNaUkpfTZfJDObv9g
         wnBcQKHFfLw4lSl7dT5O6H8Jhr73GRqXdxRDxHzCKNEGcdsScnNNojw5JOUgAT1Fe1gz
         kjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ctvd1E18LBT1bm/OVmwtHp7EJOxWtY2oUhWq4p20dK4=;
        fh=4UlY7e2L9C/6JFVQ2rhHAU20TNmryTom3OHY4Vkgukc=;
        b=pjnehCVW5sk3Tm78/F2CdpZXQR3u+xaY6ZsXt3asj/4SE41eCXT6ve7Bj7uwnqibe7
         +IpsuvpXi6I2ROQLICrHlnNyq2uskrne6dxMvwcHnP6HcIvEBJeA28d2P/j2fYr5z82i
         rdwzFEXNUa5VoJkroN8VMcxU2UKIdjE5Pi4lbpbb/garL1FRg6SENah5WcYUW+I20TeP
         kDlwNujb4ysVueFPDJGzObpBlkAsblt6WzZJhi/oZpzEkC5QNYs4gqq7VBbywNUhK5Gx
         nEojRdMFp3oPZjulJcjA/8AJma4+qori4qnuccK84iIdUnvO1d56kC1tMbIFeNTeRYde
         SHiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795173125; x=1795777925; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ctvd1E18LBT1bm/OVmwtHp7EJOxWtY2oUhWq4p20dK4=;
        b=jJGqHvQt3+5SVnWKdN1vZ0LA9d/ZTamAYmlm+M7juV3FeXN43Yi0jbwQoM/Qvhgci/
         WiNcGa1NJF9J9Sn4lK/xPBjU6485mhDVfFtTFcaJiL6XsnMuUu+dl2s8eRD19MFiCwxt
         H1ZTriIuv3vu8YWK9IdizZ/296Geqwz4URbc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173125; x=1795777925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ctvd1E18LBT1bm/OVmwtHp7EJOxWtY2oUhWq4p20dK4=;
        b=cHbmc1IgUyZS5J2tHB8VKwoRlQQ8LRvgg8vh5cXA4k/lqjJNLWkpJRP4CJ6hF14lI7
         7WQ7xwdQX/chjmKRzVz/+iRqqoj0MW9UC10kFoUAfZX6LGpzbah/3LjsFRQDo0l1A04V
         Im6GxN8SefQh+ALYTJCohfbGA7+I+eL207QgpemK1IZQeN2rFnbXovhQ7OmQnWnvydR3
         iX0L785cix66nyVsu97ZqO5RKbvrWOeEIQkaGB4jGnJFsAaKBm1LigGUY3NlEImJwwY3
         JGmH8YgmZf92XUrQGu5d4QRJzGfRdrqKlMJXNN8M+gjI2yxDBwL0q83Q8kYo9R0DyH+s
         vMhQ==
X-Forwarded-Encrypted: i=1; AL+hErGZaB5D7W1fjuWEZrRNweIDakkT1a23SHIQTRJ1vFRni8KW1UM4J/bT3aA4ia/M0GhGjkHCQ/wGHG4+7IVtyeEv@lists.infradead.org
X-Gm-Message-State: APuU4Z9TmjMfTwZuCh+Dtb29N9r8KJ9WoZPweBsOkxqBHpAmqaWyHyDe
	Cb+jKUhvaOM5FyqV5BeACg1sktdliW54SxxJY73Ne0eDlHA8lY5/TpNaqoKXYfyWqpAdIfcDFGG
	d+7+OC3HQcOAJYnCe7FxJgX131qP91JJbu2bm4dKrEA==
X-Gm-Gg: AZFdTZcTZc7Cc3Or67dYciHtJKGlcAI+3PEKEU7gjbE0Rh9H1rFrfXociI2n7zpzMuf
	EJUpsOKSe1o2Qp3RlCXEx2hi8FoF1dfIwHEljopi0SMWtu34/xzYQloY760WeMwAl3z5adt452f
	cqKDbrKBKPKUdiuiBFRBV8LAVJUnD89R52KaFmCMz6QMNPR7Si9oP0aQL98XTonlarDHtRViPJX
	gLf8JqwcMgrYBAlJFjau7YVWIyje2skSlf9WNwZawIPOuInzknkuG6n2e/9fp3V/NcDRf/2bnkD
	gIlY4fzuEG11ZAD+6VKoiEMKBTQwu4a08KsvVjVSa4/wvebhdTWUHD7sw5ls0txD4cfO/xmaAcG
	7lpqIj1VyCV2wB62L6rSFEQtDBogUxX+wJM7k59ehzXDWmb1mbNFKPQvrkc1y1zZNVDE=
X-Received: by 2002:a05:690c:e908:b0:8b3:3956:6f7e with SMTP id
 00721157ae682-8b52043cdd0mr12064397b3.12.1795173125445; Fri, 20 Nov 2026
 03:12:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028131823.2649142-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261028131823.2649142-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 20 Nov 2026 12:11:54 +0100
X-Gm-Features: AclHuK-5tDXHRBDyzoy4ZajDKym7P3SzWGspe7yU6ZZCvGx7SKszxQtXGhkPNm8
Message-ID: <CABGWkvrPMDAq2s5msic8y=Ds7uNgqC79BLMzZNFmez7v9DVJMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: ltdc: create blend mode property
To: Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Daniel Stone <daniels@collabora.com>, 
	David Airlie <airlied@gmail.com>, Leandro Ribeiro <leandro.ribeiro@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_031207_372708_BE5D3E85 
X-CRM114-Status: GOOD (  15.00  )
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

Hi Yannick, Raphael, Philippe,

Gentle ping on this patch.

The warning has been there since v7.3 and is still present in v7.4-rc3
and in next-20261119.

Thanks and regards,
Dario

On Wed, Oct 28, 2026 at 2:18=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> After commit 860e748bddcc ("drm: ensure blend mode supported if pixel
> format with alpha exposed") we get warnings at boot:
>
> stm32-display 48010000.display-controller: [drm] [PLANE:37:plane-0] pixel=
 format with alpha exposed but blend mode not setup. Please fix.
>
> The LTDC blends the pixel formats with alpha by straight alpha, the
> only mode implemented in the driver. Create the blend mode property
> with DRM_MODE_BLEND_COVERAGE only.
>
> Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format wi=
th alpha exposed")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
>  drivers/gpu/drm/stm/ltdc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5311e0b3e8dc..3b6e680c1c61 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1642,6 +1642,7 @@ static struct drm_plane *ltdc_plane_create(struct d=
rm_device *ddev,
>         drm_plane_helper_add(plane, &ltdc_plane_helper_funcs);
>
>         drm_plane_create_alpha_property(plane);
> +       drm_plane_create_blend_mode_property(plane, BIT(DRM_MODE_BLEND_CO=
VERAGE));
>
>         drm_dbg_driver(plane->dev, "plane:%d created\n", plane->base.id);
>
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> branch: stm32-ltdc-blend-mode
>
> --
> 2.43.0
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

