Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D87A606A680
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sgoK1D/w;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G4zMBjnz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2BAeP825lkaxoabnMfIBpo2jQjykn0ii0H1E+c/o1R8=; b=sgoK1D/wWER+h6
	YXfXHQu4GUY61DshWa2S78U94cvIUkxG02Eazpj/gyAnyXfuQv25kRUn13/cHEH8+x2jRdlxBYEPe
	yFxKmcronJ59QIGcZyyek0flzFhxOkP2Il/pFjNdIaDoRMLhz3duF1N4+7J49F9zcFlT7mF0W9ooF
	h25HN46ileyqI7JONq6qh4nrtPxMTryU5zA8yF+ub3b4KWDUPVJwiGS4ilwY5KfRA0CeyHsBlSA7B
	HcGFZ6PxoTUPQWFBBS57Fz+gMnUpGYftajR0w9WqdiEOubuXggDUxd+2iJ1qIXHtSTNrmyN4ILR3W
	C8u0VmvzzGl40/8Czbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUN6-0000000CKm1-06BR;
	Thu, 26 Nov 2026 07:58:24 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUN3-0000000CKlg-1tPq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:58:22 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-5ee3e658c72so3795651e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 23:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795679900; x=1796284700; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2BAeP825lkaxoabnMfIBpo2jQjykn0ii0H1E+c/o1R8=;
        b=G4zMBjnzBQVR2CgQ6I/4AP6p7+I9DWEzeNdgSP07liGxQLnc3dejn5EbwQGwsNVzO0
         MTtmjDEccLJMK/fZjogx7o/qv0XlshBlbc+nofJDO5uMZf/RyQ/nBI+/SZZ3pXsk05fy
         H2Qifmcc/TL1mrNQuS6zt5nSsSNROJEDlsI/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679900; x=1796284700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BAeP825lkaxoabnMfIBpo2jQjykn0ii0H1E+c/o1R8=;
        b=GBXltEnDaeGKikPQSWalXQW1wvbBCHaeOLb1X08HbCz43y40hkm8NmeWFoLA0f7FUb
         Gc9QtxPTXn9jsvbLDFohZk9vpJmjBIUVzX+2rtbKSEyDc23m2Vdh9gL0ToELbaNwdASm
         Vw7gKFgJIA70r9FDAL82LQ+x/e0h3cekse/q8nV4TmAPYer9dlVCyBSUgnKQP4UVnpwI
         XI5MIi3dEIveogQGa/28t2Jl43wMghHCxMpL3WpkwQLq4PMXr/W/9EiFRMy0X4HK7u5i
         g8I1Gf4ZhB6IIHgk74kUt0VNvidFMZJzktB2snkcYDaryutT7tDflaY7uwU7/021iWY7
         vDpg==
X-Forwarded-Encrypted: i=1; AL+hErHsO24K17KdRY8OK1hoKKjm5u1ZikH9Ii1JiFLJ5eB+0ZKzcopJVkzpLEFWjSxlBVx+qWFrs+JZDrPPleqAoXDz@lists.infradead.org
X-Gm-Message-State: APuU4Z+JEsKw2Uu+T19xNxzQdrxjNdbe7RJ250gdmV9vzKbX3irI0BEL
	LmqmD5V6/ocWXtR6+iCG+aEMw8gNsvwMZk9M4gJcC0eIsaYC8MSUYIk9RSAOQrFs1npV3D+YnTs
	l6EQgcQ==
X-Gm-Gg: AZFdTZcpWIzjLSllZztekWVut9uFMaPE2rjMZFlcfEYTK+dOEMVq+2b5Dmfl5Ow4K3q
	MpcD8AEmoZ0bKuKK3xtSNG6BDqnjjg1kOX8+IGLQ4IzYb3OGe9TROL3DFIWgVodAaKkVm3HRwje
	Wze5B/kouAtzIsWboLyVBtMbQArGRtv+ey4x6YJIpx+qKdIbCRryWiJs0fzn5ImTfYEzuPZCKk0
	Ryv4JuNn65aAcsJ9hsYWaQjnVZu64u0HnsfxyiG5xFWc35bHhpRDgnhoUY+lGhLO4H6aVFZL/o5
	9cRbSjLzJidVmg8jry5rOww3Grm6RlR00fejBQVIyVvDgZeseq4r5BnjNaGAsKlvgY9lmIlGASW
	kVkQxijh0Itn9Nvon8Tg1Zz+3D00Wzr1VXQvLBX7+wzks2v2+OKlKFNJoWIBMpBP192k7XAlWoD
	6uiFW1nAP6PLlq35T0RkiDgVWSBVLHTwtqXOWId58akMXuNQgpC/oqmQ/E0WTIvyf/zs76MQJpf
	/D/tqvQQ9+l18lJWtEJHUujQin0/acWINfkHTAdyb1AxCCABLCWaiKxdY3PJjpmoG5hsXSFMaUx
	YNPtZbNPXTEg+HDbcg9g485OpZoiNqL26y3oXC07MJsU5TX/3Fz2WV8MIh+LAUj8NZEKGNx6o92
	aOKTjMbuMqJFY+Q==
X-Received: by 2002:a05:6122:288b:b0:5ec:d5e1:ee47 with SMTP id 71dfb90a1353d-5ee8aec1ab3mr13705675e0c.5.1795679894712;
        Wed, 25 Nov 2026 23:58:14 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b555137sm19849979e0c.3.2026.11.25.23.58.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:58:14 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ee3e658c72so3795614e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 23:58:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEFuUjk5wA7RoDgqgnMZcXXIHLG0b+sPUK/TDiRXS1k3tsJRkFngdD6as60GPYu0IocFoJTzeHNqIsPlbUery/v@lists.infradead.org
X-Received: by 2002:a05:693c:87d8:b0:386:b896:319c with SMTP id
 5a478bee46e88-386b8963d3amr10022337eec.35.1795679552269; Wed, 25 Nov 2026
 23:52:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-18-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 15:51:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngJz=WR=dynO0O4FiAW3rqADNCvEGa9cPn1b-Dfkxi6LQ@mail.gmail.com>
X-Gm-Features: Aa3M54pxRAeFEOdKGCuQ1O6Bt_XOraD0DZxugIMunZCy7TNnnfXexdvBZJe7MKU
Message-ID: <CAC=S1ngJz=WR=dynO0O4FiAW3rqADNCvEGa9cPn1b-Dfkxi6LQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/46] drm/mediatek: Add support for hardware
 multi-stage layers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_235821_559011_5717B014 
X-CRM114-Status: GOOD (  30.23  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Jul 14, 2026 at 7:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding support for newer, more complex, display
> controllers like the ones found in the MediaTek Kompanio Ultra and
> Genio Pro 5100 (MT8196/MT8894), add support for multi-stage layers
> as in newer hardware, there is a special strategy using multiple
> hardware components of one (or multiple) display controller(s) to
> form one single layer.
>
> Multi-stage layers are one more step towards extra flexibility of
> the Display Subsystem, making it possible to change capabilities
> of Display Controller Pipelines depending on the final application
> of a board: for example, one board may choose to use fewer layers
> per pipeline to achieve more pipelines (more concurrent outputs),
> or more layers to achieve less, but more capable (as in offloading
> and in achievable bandwidth) concurrent outputs.
>
> This currently adds boilerplate to support this hardware, but does
> not yet implement the IP-specific support for MT8196/8894, which
> will be done after all preparation is done.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c           | 304 ++++++++++++------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  15 +-
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  12 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  12 +-
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |   2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   9 +-
>  drivers/gpu/drm/mediatek/mtk_disp_wdma.c      |   2 +-
>  7 files changed, 246 insertions(+), 110 deletions(-)
>
[snip]
> @@ -992,15 +974,15 @@ static int mtk_crtc_init_comp_planes(struct drm_dev=
ice *drm_dev,
>                                      struct mtk_crtc *mtk_crtc,
>                                      int comp_idx, int pipe)
>  {
> -       int num_planes =3D mtk_crtc_num_comp_planes(mtk_crtc, comp_idx);
>         struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[comp_idx];
> +       unsigned int num_planes =3D mtk_ddp_comp_layer_nr(comp, comp_idx)=
;
>         int i, ret;
>
>         for (i =3D 0; i < num_planes; i++) {
> -               ret =3D mtk_plane_init(drm_dev,
> -                               &mtk_crtc->planes[mtk_crtc->layer_nr],
> -                               BIT(pipe),
> -                               mtk_crtc_plane_type(mtk_crtc->layer_nr, n=
um_planes),
> +               struct mtk_crtc_hw_layer *hwlayer =3D &mtk_crtc->hwlayers=
[mtk_crtc->hwlayer_nr];
> +
> +               ret =3D mtk_plane_init(drm_dev, &hwlayer->plane, BIT(pipe=
),
> +                               mtk_crtc_plane_type(mtk_crtc->hwlayer_nr,=
 num_planes),

I hope it's not too late for new comments...

IIUC, mtk_crtc->hwlayer_nr is the CRTC-wide plane index, while
num_planes is only the plane count of the current component.
When a CRTC spans multiple 1-plane components (such as four EXDMA
blocks on MT8196), hwlayer_nr is 1..3 but num_planes - 1 is 0, so no
cursor plane is created.
You might need to forward the CRTC total num_comp_planes to
mtk_crtc_plane_type() instead.

>                                 mtk_ddp_comp_supported_rotations(comp),
>                                 mtk_ddp_comp_get_blend_modes(comp),
>                                 mtk_ddp_comp_get_formats(comp),
[snip]
> +static int mtk_crtc_init_layer_stages(struct mtk_crtc *mtk_crtc)
> +{
> +       unsigned int prev_master_layer_component =3D UINT_MAX;
> +       unsigned int master_layer_component =3D 0;
> +       unsigned int comp_idx;
> +
> +       for (comp_idx =3D 0; comp_idx < mtk_crtc->ddp_comp_nr; comp_idx++=
) {
> +               struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[comp_idx=
];
> +               struct mtk_crtc_hw_layer *hwlayer =3D NULL;
[snip]
> +               if (master_layer_component !=3D prev_master_layer_compone=
nt) {
> +                       hwlayer =3D mtk_crtc_find_hwlayer_with_comp(mtk_c=
rtc, master_layer_component);
> +                       if (!hwlayer) {
> +                               drm_err(mtk_crtc->base.dev,
> +                                       "Could not find layer master for =
%d!\n",
> +                                       master_layer_component);
> +                               continue;
> +                       }
> +                       prev_master_layer_component =3D master_layer_comp=
onent;
> +               }
> +
> +               /* Add the newly found layer stage to the correct layer m=
aster */
> +               hwlayer->layer_stages[hwlayer->layer_stages_nr] =3D comp_=
idx;
> +               hwlayer->layer_stages_nr++;

hwlayer is declared as NULL inside the loop. On a second stage
component for the same master layer, the lookup above is skipped, so
dereferencing hwlayer leads to crashes. Declare hwlayer outside the
loop.

>         }
>         return 0;
>  }
> @@ -1039,6 +1112,7 @@ int mtk_crtc_create(struct drm_device *drm_dev,
>         struct mtk_ddp_comp *dma_comp;
>         struct mtk_crtc *mtk_crtc;
>         unsigned int num_comp_planes =3D 0;
> +       unsigned int max_comp_stages =3D 0;
>         int ret;
>         int i, j;
>         bool has_ctm =3D false;
> @@ -1121,20 +1195,54 @@ int mtk_crtc_create(struct drm_device *drm_dev,
>                                                 &mtk_crtc->base);
>         }
>
> -       for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++)
> -               num_comp_planes +=3D mtk_crtc_num_comp_planes(mtk_crtc, i=
);
> +       for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +               struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[i];
> +
> +               num_comp_planes +=3D mtk_ddp_comp_layer_nr(comp, 0);

Passing 0 instead of i here skips the `pipeline_index > 0` check in
mtk_rdma_layer_nr() and over-counts num_comp_planes (also carried into
patch 38/46).
Pass i (j in patch 38/46) as the pipeline index.

> +               max_comp_stages =3D MAX(mtk_ddp_comp_stage_nr(comp), max_=
comp_stages);
> +       }
[snip]

Regards,
Fei

