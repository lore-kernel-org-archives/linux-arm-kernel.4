Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B72606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P6f18p7b;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBrCNIVa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fjeXOElCViRQmgZvgDDdONv2Uyhg+At7B3MV4y/CS3E=; b=P6f18p7bttmDTtKtCYTno9eMH0
	xQMkBNkemsLna2DBg1ZiZQS+I4K4UF9MRrfInzW5klcxCO2YGfW0/f+K5hEmVol9XNxMs9qNJDlso
	Z/rIev0rNHi9oaYVc5Dqt1+FeTejjv02BVYQ2eZlYpuJhGAVerndRpzdOB6UvHSM6yBuBosaCWURC
	15l/uEoMhbe2I8oJyld4Gajx935xyICKr2mk0bzrVGTcBK1xIlzB5kHBEg/bvmmlHeTZtrQQ+AA4B
	qmBKHNZ+TVV9qkERmhZG1zD4VyTZiz7cORl7BlQepR6jolxGpY/tqHF5uQnkYFv8qQP9Rx+UOAEJJ
	7sO1uKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFvS-0000000Aa0t-12sT;
	Wed, 25 Nov 2026 16:32:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFvN-0000000AZzY-1RWO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:32:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so64694995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 08:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795624367; x=1796229167; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fjeXOElCViRQmgZvgDDdONv2Uyhg+At7B3MV4y/CS3E=;
        b=ZBrCNIVaBhApCSUIsT7gHqIAvqiqMlaEVM9+/J+unc9GfypBZZF+eFkc27FPc5x2pz
         dHMOcsOEC1ACTDYpKQk3tENYhkyqGe1xc8JhAMVtciTS1eSED2c0+1K8JBZH06iEBfW7
         m07T3kABvbMpxFpsdPeeKGMcYMagRE/Z7lYp1NXVeoV55w5iYmSmi1smo/Xy3VijYBdl
         v1kJadDdKISNcWYP1fA0gohS9blqsfGj5NUHegpo9o8ChDdWVH7sdOHoq9Va5y1zNWT5
         dPcLd11zywIVtWyjRPgSvcc3CQGFpasOunsYIvRjkjqVIy9Hvf96hPwQoCqd7gCre0bJ
         VH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624367; x=1796229167;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjeXOElCViRQmgZvgDDdONv2Uyhg+At7B3MV4y/CS3E=;
        b=WQ/I9pTymPxIxZT1a1kN5Hv0/qrHbSDPmnV6gPK00EelNeGQLWpX/TIGBFUg3KbYWm
         xVxZeyt2LoIOWjaQcqmqsM1NSIS0Okmvd636S41Wp9/UsbVBvWk8CuHHXfNHzfRwpy7i
         1ojResV+lV9hI0L56Z7Bs3a7ZLIa+CIXApvSkXYrCE9E6OZPKwAvK62BX6CV+aEmNuCq
         BIspW9Xi1p2k6BXq1vHQAF3A441gynUwLv+ykiqUWUmp1085/0pIehyCblQBdwTOkkTs
         wSV3Im2eA1GUFptrNqBAHgssi8nDCE748spbUS9F5uMpz7b49RLZmvYTx+Nnq4VMvYI6
         0tzg==
X-Forwarded-Encrypted: i=1; AL+hErGQoVILo180TRYdYZ9c+F6Bcb5VFhgaKiKRfsJyHwhpnOrJuY9Z8G9L6jDnV4eGrdOq7NIVyqXjOlXwF89sozp9@lists.infradead.org
X-Gm-Message-State: APuU4Z95tMFpSrKFUO/N2VLpM/5sadiMn566LvO9by1BgVUMJD9aHfmr
	3RpWb2eoUdSMU0a+pzhCsimIlT0Z+g+AA96JTi4Ib9adqih1iBk//1d/
X-Gm-Gg: AZFdTZdSVJ37V58TlHFoHNi1UzC1RK3KHKd5YGnbKChuOKNJpXSwtRb+I9wkVd/7wbg
	R5OjfcLmVCEm/CWSBBxm1ysF40qnv4LrMG3Xul0DrIy4BsAK/zX4jFmit0kq4UoutePha8v0jpH
	F/CjS0h8BuuyZUChAq4IS/0Euap9j7BnxChuVq/IRQeb3Nfk0PfEfPXlUYzTyySXojeRSOQFB9f
	+895du0z6oMiOoHT0gByxGGzif/jHcrAm3MHWLSnIq2kqVETXJrM1ihyimoFBc7sUTNzB1Buy7t
	PMvqDMLs5Jsa/D+H5CjBR+mNy06rJ/sM+nf5HptkeQ78wBg7p/cc9iNEfA7kkMxE0NPw2wsM2rx
	PZaxEII4wdqDL3Jv+yx4Miq3s7QwTq8/FzhjRspuee/pIemBpZp48qm7WZJGZXvqUjzuiC7awRL
	w5BrluynI3Z+4wc/fEi1C+VnvH6vDFAK6pMPeatKv2/TtpMDQopD1r9hX1hvPvKuCrAnPwg4tsr
	Wp6Ug2BYBPrlr6hryuZE62Wwucy+z/1CgbuoyMnvdJkwLPStaDGfOFlMUnywfQXNHGuEjnLqyIL
	+mIJaW8If4EPBVKW9vmhcPW/0WjPb1bC1j9ZIMqAaN+CqF1Fac0tech815rAmTfLIN62DkF4z8X
	PWFAdeQTxvrnRYoG1/WGGplA60bytP91C4MMVQB5PTc5hK/5SrtXWS/q5u+Jl6NezkKHWjg/U82
	Xfgq3q1zX5YvqOu1a/K87ScrFlzVJJ+HspO1BiaYXaFCfzTVwZiXB1waGZsU6sqwjpX1Io+IVYH
	yzLL2HGd3lOragTQfpmEky6MoxyHfzJgQIewnpVXCxlOlu4pStBBULOQsx5wncz4s2fido6XPvJ
	iAwjfgUW
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr381679255e9.19.1795624366963;
        Wed, 25 Nov 2026 08:32:46 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm560493135e9.8.2026.11.25.08.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:32:46 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liu Ying <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH RFT v3 3/5] drm/sun4i: layers: Fix VI buffer address for clipped
 offsets
Date: Wed, 25 Nov 2026 17:32:45 +0100
Message-ID: <sBipOLw6T_aZ1e-H2zFl3g@gmail.com>
In-Reply-To: <20261124074041.115251-4-wenst@chromium.org>
References: <20261124074041.115251-1-wenst@chromium.org>
 <20261124074041.115251-4-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_083249_821158_85D44976 
X-CRM114-Status: GOOD (  27.24  )
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

Dne torek, 24. november 2026 ob 08:39:31 Srednjeevropski standardni =C4=8Da=
s je Chen-Yu Tsai napisal(a):
> Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
> get display memory") dropped the code to calculate the framebuffer's DMA
> address in favor of drm_fb_dma_get_gem_addr().
>=20
> This turned out to be wrong in a couple ways. The hardware is programmed
> with clipped dimensions, so it needs the buffer address to start at the
> clipped boundary. Moving to the helper negated the clipping. Also, when
> clipping on the left, the buffer address needs to start at the first
> pixel in the sub-sampling group even for the luma plane. The hardware
> handles the interpolation internally.
>=20
> Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
> buffer address starting at the clipped boundary. Calculate the intra-group
> offset and adjust the luma plane buffer address so that it points to the
> start of the sub-sampling group.
>=20
> Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to=
 get display memory")
> Cc: <stable@vger.kernel.org> # v7.1+, needs drm_fb_dma_get_gem_clipped_ad=
dr()
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> This is an alternative to Jernej's original revert:
> https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785=
772659.git.jernej.skrabec@gmail.com/
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index f9c7f28f9fa2..67cce1b0e70f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -130,7 +130,7 @@ static void sun8i_ui_layer_update_buffer(struct sun8i=
_layer *layer,
>  	ch_base =3D sun8i_channel_base(layer);
> =20
>  	/* Get the start of the displayed memory */
> -	dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, 0);
> +	dma_addr =3D drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
> =20
>  	/* Set the line width */
>  	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 4d3fc03f9877..b6796416d550 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -205,7 +205,21 @@ static void sun8i_vi_layer_update_buffer(struct sun8=
i_layer *layer,
> =20
>  	for (i =3D 0; i < format->num_planes; i++) {
>  		/* Get the start of the displayed memory */
> -		dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
> +		dma_addr =3D drm_fb_dma_get_gem_clipped_addr(fb, state, i);
> +
> +		/*
> +		 * The mixer can handle odd offsets into sub-sampled YUV
> +		 * planes, but needs the address of the first pixel in each
> +		 * sub-sampled block. Adjust the luma buffer address backwards.
> +		 */
> +		if (i =3D=3D 0) {
> +			u32 x_diff, y_diff;
> +
> +			x_diff =3D (state->src.x1 >> 16) & (format->hsub - 1);
> +			y_diff =3D (state->src.y1 >> 16) & (format->vsub - 1);
> +			dma_addr -=3D y_diff * fb->pitches[i];
> +			dma_addr -=3D x_diff * format->cpp[i];
> +		}


This could be done differently.

Before for loop (done only once):
src_x =3D (state->src.x1 >> 16) & ~(format->hsub - 1);
src_y =3D (state->src.y1 >> 16) & ~(format->vsub - 1);

Inside for loop:
gem =3D drm_fb_dma_get_gem_obj(fb, i);
dma_addr =3D gem->dma_addr + drm_framebuffer_get_block_offset(fb, i, src_x,=
 src_y);

But it works in any case, so:
Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> =20
>  		/* Set the line width */
>  		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
>=20





