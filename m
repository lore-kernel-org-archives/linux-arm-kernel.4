Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320F4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PT5TOcaB;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iVeSfhSQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2a609L2GphDQlVfX0YuvfIMKjC+LWixKm2AkfX7MOhg=; b=PT5TOcaBZIaaWJ
	2Y7QcJn45zeYyAz/+eaRsIICTK/EOHTA5cefV6Ow36EctCghxNZVwIhYnpK0jIptxjVuYsevp0w9w
	cDrIJjWN+c5ZEBdfrGmDx+9iE4jtD8QuNv84eerDbNzBznLDPYbZQc31OrJViUHNbBVnnG/+D2rv6
	bw2dUSgwS5ogsrDIMMbLO9R5QKPFhvgk3FGcdBlZG+rHwamUG6kc6EqIIbdyOY3wS3D47QKfdYlxm
	VrReAGDp8QloVapzDumxQkUfOMqhv80gEdK/jgEiJyWr6fyfXHM2vjlvbIGG806DAA4qto/cedMNx
	lhrmqZpM5p5E0fGpJkAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLzH-00000000IJM-2oxf;
	Mon, 09 Nov 2026 09:48:27 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLzF-00000000IIg-3IHJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:48:26 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso298538a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 01:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794217705; x=1794822505; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2a609L2GphDQlVfX0YuvfIMKjC+LWixKm2AkfX7MOhg=;
        b=iVeSfhSQiDeI9nxCk559mYgOddMHeVvzypnbyHiEKohapxMjYucgCjgI2N/H6eQ1BE
         Ne8w+opTK+6vZkJmxI0/trcakFtk2C6ifYnXhOwQe/oHpYonGAUS8T3CNCrTXM7G/wbe
         r55FMtnbH9RxqxyJKpKkvQoDXDzs5YzdWJC14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217705; x=1794822505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2a609L2GphDQlVfX0YuvfIMKjC+LWixKm2AkfX7MOhg=;
        b=GcBTFhWCollE6go5E/kPjvmlEGecQ/7R+1u2nvkffZexFQ/SoXtbSNZgbQi5VGmC3W
         J4tY+0dwjZE2J4oJhlPnfwPCd7vQAVR784Snz4mFMD32MOkPQyNLYzaFuhhXVpb+MmMn
         FWnMqqULUy0gI55O7q39r27HVGcXogk+tfBCATtIqzd96VlzqYWIabKjWdC5f9KYu2Wu
         jqQJ4O+Ef0j27t9eoQ65woBJoV5f+mcQLK7LNzj7/frLqB6wRXKxxhynAFaHPy7YKTBr
         0ggjB2K5O/qm87TmGFs6LCgWGz9oDUvkrOttUeN5uRuIyyD8weVY8bpwcnp+wyGlt7bN
         CsQA==
X-Forwarded-Encrypted: i=1; AL+hErHf0L0UhpFAzYNllJfVgWeLdSKXekerKrtMWV63A8XUtY17aOp3d3pyuHlam1s2WKo/aZzU+pzxFLC+SRc5zXQw@lists.infradead.org
X-Gm-Message-State: APuU4Z/olCBAIDk5rzZd0fiNKLGeT5xykKAAme28pGU6I5smqoVQpU5V
	AIivzp47+TORnmaVb3DtjMSppcv1Bdw3S1g+Q9Fw+yd0BVETMgQZgd/ybhELeOL+7pj95XhztST
	jFSGjSQ==
X-Gm-Gg: AYBFou2dMhQ5yNkuuDUEXcEzPjaVPNh5EqiLiuw4uTlCwwIENDd9DNkoymRivAK/EAG
	L4JKLjqwVDbqzdxz5eNioUym4wmY+tnbEHKFm/g5OKOne/R9xUZpzO4yJ9/UQJeKBaqADmdzJ/H
	qVjU/TKJQ9Udbf9LoPjT9dTQgBxMwYx47t8Gxcc2ODtZSkk0PDiilC1SRsCNg2MqqC/4pUIRoaU
	JxusMWDqFwtonjahb0A3psHba0qg3RND+1AP2oGOs3JZCUh+TNN1gAPD+VAbeVo6c2Orq07GEZx
	6fvedjPyy+Lhg8+yU77LBpqHL5L4Q+zE1srIB6S18rTkS6KuGhJvFYaDsZQ+4wLOrkUIQezRWPi
	hoqrhyIEJVAVBlmRYE8jaPnCxrkmjWNQhV1PKPMBZCQmLspUX8/8Et5EuwYUDM3QJ+2SGAodpXo
	O/vbN2/gLRrL2pd4afhajPT/sSMJ3GwKlnUX1BYxXGqMfY7Yz6SKQg9ibaClCizarHWi2BiLnzD
	KjFBDM61E/MWwDR1eWUM9p7MIMS52R/99Yn12mF0i8VlHSDm+R8USmwq340C2KuQqgog4MH6ZmH
	HPkulz2+fyI5d/rz+B8/UyTOw5Tgd8VPcjjEJlRc6cYj5QaW5uqJjFYSYAZXdg==
X-Received: by 2002:a17:90b:17c9:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3b12d2a9580mr3323416a91.13.1794217704790;
        Mon, 09 Nov 2026 01:48:24 -0800 (PST)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com. [74.125.82.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b1fa8sm10404318a91.2.2026.11.09.01.48.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:48:23 -0800 (PST)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1028170c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 01:48:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEEoEklkBF45kfkcAQGGx8Tv5tbeXaGUw3d0V1uVc4xIvRIPTh9LcmnjaVj6APAnGq0A6GqmHWpeqHNrsy+r8J5@lists.infradead.org
X-Received: by 2002:a05:7300:ce86:b0:35e:f1a5:9ba6 with SMTP id
 5a478bee46e88-37252b4c091mr6436576eec.5.1794217702332; Mon, 09 Nov 2026
 01:48:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-10-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 9 Nov 2026 17:47:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng1U7XK2SvM+2Tvb7z2nHiDEvLhVP75JHdwzkV7GiaiKA@mail.gmail.com>
X-Gm-Features: AclHuK_kbp2RlyhWxo_Xx4hVQaPPUEY10kfNvYs17nATUWr47nBdslkFDfWhjSg
Message-ID: <CAC=S1ng1U7XK2SvM+2Tvb7z2nHiDEvLhVP75JHdwzkV7GiaiKA@mail.gmail.com>
Subject: Re: [PATCH v2 09/46] drm/mediatek: De-duplicate internal component checks
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
X-CRM114-CacheID: sfid-20261109_014825_827532_4CBE6F54 
X-CRM114-Status: GOOD (  29.11  )
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
> Both mtk_ddp_comp and mtk_drm_drv are performing similar checks
> to distinguish components that have an external driver from ones
> that don't - with the exception of mtk_ddp_comp also checking if
> the component is related to a backlight driver.
>
> Create helper functions in the main component management driver
> mtk_ddp_comp, one to check if the currently checked component is
> internal/simple, and one (static, internal to mtk_ddp_comp only)
> to check if it is a backlight related one.
>
> Since the amount of internal/simple components is lower than the
> amount of ones having a specific driver, and since it is expected
> that most of (if not all) of any new hardware support will need a
> specific driver as well, the helpers are doing an inverted check
> compared to what the code was doing before, as both mtk_ddp_comp
> and mtk_drm_drv were checking for external component explicitly,
> while now they're doing the same, but checking if NOT internal.
>
> Also, while at it, for the OVL_ADAPTOR components case, instead
> of checking for MTK_DISP_OVL_ADAPTOR, call the already provided
> mtk_ovl_adaptor_is_comp_present() function to check for this type
> of component.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 46 ++++++++++++++-----------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 16 ++-------
>  3 files changed, 29 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/me=
diatek/mtk_ddp_comp.c
> index 2ba2123238b3..a9c3e29fb340 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c

[snip]

> @@ -700,26 +720,12 @@ int mtk_ddp_comp_init(struct device *dev, struct de=
vice_node *node,
>         if (ret)
>                 return ret;
>
> -       if (type =3D=3D MTK_DISP_AAL ||
> -           type =3D=3D MTK_DISP_BLS ||
> -           type =3D=3D MTK_DISP_CCORR ||
> -           type =3D=3D MTK_DISP_COLOR ||
> -           type =3D=3D MTK_DISP_DSC ||
> -           type =3D=3D MTK_DISP_GAMMA ||
> -           type =3D=3D MTK_DISP_MERGE ||
> -           type =3D=3D MTK_DISP_OVL ||
> -           type =3D=3D MTK_DISP_OVL_2L ||
> -           type =3D=3D MTK_DISP_PWM ||
> -           type =3D=3D MTK_DISP_RDMA ||
> -           type =3D=3D MTK_DISP_WDMA ||
> -           type =3D=3D MTK_DISP_DPI ||
> -           type =3D=3D MTK_DISP_DP_INTF ||
> -           type =3D=3D MTK_DISP_DSI)
> -               goto end;
> -
> -       ret =3D mtk_ddp_comp_init_internal_comp(dev, comp->dev);
> -       if (ret)
> -               return ret;
> +       /* If there's no external driver for this component, allocate and=
 init now */
> +       if (mtk_ddp_comp_is_internal_comp(type) || mtk_ddp_comp_is_backli=
ght_comp(type)) {

If I understand this correctly, MTK_DISP_BLS and MTK_DISP_PWM are
bound by the standalone pwm-mtk-disp driver. Initializing them as
internal components requests the same exclusive MMIO region and fails
with -EBUSY on whichever driver probes second.

Drop `mtk_ddp_comp_is_backlight_comp()` here so backlight nodes skip
internal init as before.

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index e956e1966b86..18683aee61ff 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -1166,20 +1166,8 @@ static int mtk_drm_probe(struct platform_device *p=
dev)
>                  * blocks have separate component platform drivers and in=
itialize their own
>                  * DDP component structure. The others are initialized he=
re.
>                  */
> -               if (comp_type =3D=3D MTK_DISP_AAL ||
> -                   comp_type =3D=3D MTK_DISP_CCORR ||
> -                   comp_type =3D=3D MTK_DISP_COLOR ||
> -                   comp_type =3D=3D MTK_DISP_DSC ||
> -                   comp_type =3D=3D MTK_DISP_GAMMA ||
> -                   comp_type =3D=3D MTK_DISP_MERGE ||
> -                   comp_type =3D=3D MTK_DISP_OVL ||
> -                   comp_type =3D=3D MTK_DISP_OVL_2L ||
> -                   comp_type =3D=3D MTK_DISP_OVL_ADAPTOR ||
> -                   comp_type =3D=3D MTK_DISP_RDMA ||
> -                   comp_type =3D=3D MTK_DISP_WDMA ||
> -                   comp_type =3D=3D MTK_DISP_DP_INTF ||
> -                   comp_type =3D=3D MTK_DISP_DPI ||
> -                   comp_type =3D=3D MTK_DISP_DSI) {
> +               if (!mtk_ddp_comp_is_internal_comp(comp_type) &&
> +                   !mtk_ovl_adaptor_is_comp_present(node)) {

And here, pwm-mtk-disp isn't a component driver and never registers a
component. Adding a backlight component may prevent the DRM master
from ever binding on SoCs.

Add `!mtk_ddp_comp_is_backlight_comp()` here, and in
`mtk_drm_register_sibling()` in patch 40/46.

Regards,
Fei

