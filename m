Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25486606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T9gEocUJ;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z92sl3Sy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i/lQFYYSgifKwpBl4Z4gLxmp/LsgZ8d5yEoRR702v7k=; b=T9gEocUJseUvSp
	GWovkgPfafZAfpz23qZE3Td8dKRfwB4lAb2Aa/QblQ76hDiycD8DwBhg2U7bcjKcIuRU6qgoz/H1k
	pNe7HViI36y9N05UkPL0ix0VaITglAuCZkfCAa0B9pLvdvR1yTucjysFQ4HKXLORxsGROKTkkAHQv
	xoNZq/tbWsyDKQyskNDsBSWAiaufWGhLPVTEwj4c+ybnlRgF7OSWhDKpOZ9qLSDGVCfbcAMg35m6B
	GGCVlhFEWC2UhmGrCme7JVek3ZFfVxSt9p0omiewdqOZXkiGgAXgFotdBwScPloMqr3Mj0DASN3iP
	aTXNdZ82PGQFsIyK3DQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXJ9-0000000ConC-3rlZ;
	Thu, 26 Nov 2026 11:06:31 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXJ6-0000000ComX-3kn6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:06:31 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so5548225a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 03:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795691188; x=1796295988; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i/lQFYYSgifKwpBl4Z4gLxmp/LsgZ8d5yEoRR702v7k=;
        b=Z92sl3SyOT4kk/yUvKEBSsQddxe3XG94YatCZCagMc4od/jnNZTpsBe1huVtkO5tCe
         P/nxh89u9skSlEGuVxI7YSAZ7QWM/HhJIi9kjs9dQj5sh5GLhsudD54EGx6fxlhLAnry
         31x0zCyCwji9eTKwh+GiSdHiYHOj1gMZ5ofPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691188; x=1796295988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/lQFYYSgifKwpBl4Z4gLxmp/LsgZ8d5yEoRR702v7k=;
        b=ZgIkO71ghJ6+mjNekmnmrSlMG1g3qt89YQUc7JmVHrwtzlj2H9crLJ4FOckhO1jRkC
         dsNuPyVLw4tXf52EwBlOAv+o9GNplHqv3aGtY/rHntJ1AsFLYWctqNGXga5vLf4WxfWX
         zFsoh1a1+xLWpoIkTQIUFZ0ULIM1KTjv80tOQJD1H6Mt4GNlbU05pOXkvp8kZgNF9wBq
         r46O8fsYcTUT/6F5RwdHmTAAeJ0XEMcbOncijKaFJ+7PSN8YtZXMwCZzRCatdIRJeP8k
         hl0cyr+uUFq3RujGyZHNACFJVvCGWsA7WpteY3arKbSgoAQU4pJCuDDJR0FoZlQ3fX6x
         cAqA==
X-Forwarded-Encrypted: i=1; AL+hErHNe1I05r590dqPi4F7q1f6R1iI26uTEyt3Lfv8FlXtJ36D+ZJtnv7wd5du5ZQ9fovOUxF7lQuo0bpQs9DxAeF3@lists.infradead.org
X-Gm-Message-State: APuU4Z+zmW5rXWSM0lCx+cyUpy1ciwOFmxFVhSqGDedfa30Qg3pFJntJ
	bk7wB2rC/CzADBQjYGxcmCAcD13KCszkr4zv1Qk5sQFUDiLDhdIUS16zR7bZ/jCnN2bj40HjQWq
	aLqDkvg==
X-Gm-Gg: AZFdTZf9vtHdtykArd2fdLkE9IsR3WFNknxOKnt6a5xR3cJs6OmkOugO9F3+po0uF9g
	l3sNiv3/cryS4Xa5ciDWm8/xJGBtkIrGA4KuActrAuu12RiLbyS52/oQ5zxIaW0AsN/JrgonEK1
	Lg9lmQKT9CeuFdr7hS+DNmBU58AX4l10mxaIZXUy1apg/uEcp+itIA1Tep35K/E8wueS+9M0LpF
	oLrFoLXXVZuBIr0vf8EeBl7zbKsstmzOehbUFjzwtV1/ndQ09Ly74FB10NLdHbL11KRFNnl4ocO
	DBRzME8PQDeKbY3HhuFYyDFe7TtWJ7++XU8FLz2lYLoYNRsCdbvI3dafltEMuPgc4eqE2FyC7PF
	ZFlh6oX8XSMpKTDnUoe5iDAMEhCpYS3YVxVi3BYUvytK//cf3q5zmOXBG1ptk5DxAAbuX6nYL2l
	ipgMRjH66GTZdSqRkyeJXPD6Lz6DyMMe6NLDO/sQ6bvO87RVZJFInayIFaVk/9/XeEI8MWwy5Us
	eQ/bTc/rEOfQmCWeFNRlzG3QHk///9okLHZ4WvZhYKMtb1/oUXnwpn2Hj06gKmxSrmEHNj+KEHi
	IRAqiXW6755Z+nAz20d/Uauo0mi2CJCg3fZ3X0I4dbzxx7MVsmEro/Akzi84bMv7ZS8=
X-Received: by 2002:a17:90b:442c:b0:3b4:12a9:2e9 with SMTP id 98e67ed59e1d1-3b41c7d17e4mr21053162a91.6.1795691187896;
        Thu, 26 Nov 2026 03:06:27 -0800 (PST)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b0f482bdsm16611885a91.14.2026.11.26.03.06.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:06:27 -0800 (PST)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so2593036eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 03:06:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGTrrwlV4Xk7RaYufv+4lv4htaF4QhDsXiML1cwlFE2AsincqiKHyuPkNi8cuKPj9rW6jIMwULFk2WqiAs3CGfC@lists.infradead.org
X-Received: by 2002:a05:7301:240a:b0:386:cd71:b714 with SMTP id
 5a478bee46e88-386cd71ce89mr5908411eec.35.1795691185712; Thu, 26 Nov 2026
 03:06:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-37-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-37-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 19:05:47 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngQC33xKiYRYT1qq1jqJj+7yveiwu1CQrouv8Ud+dPtfQ@mail.gmail.com>
X-Gm-Features: Aa3M54q46fTI_3jhRSfuxLJf-vqFgr66vNyr9HYUTk_fEMF24HCMszULS2t_YS0
Message-ID: <CAC=S1ngQC33xKiYRYT1qq1jqJj+7yveiwu1CQrouv8Ud+dPtfQ@mail.gmail.com>
Subject: Re: [PATCH v2 36/46] drm/mediatek: mtk_crtc: Dynamically find
 suitable CRTC DMA device
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
X-CRM114-CacheID: sfid-20261126_030628_964255_37F168C5 
X-CRM114-Status: GOOD (  27.47  )
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

On Tue, Jul 14, 2026 at 7:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Now that the vblank and config components are being dynamically
> selected, the only hardcoded strategy that is left is selecting
> a DMA device for a CRTC that is being created.
>
> In order to support pipelines including an embedded multimedia
> controller (like MDP3) chained with the display controller and
> pipelines chaining multiple display controllers together, stop
> assuming that the first component in the pipeline is suited to
> do DMA operations and implement support to dynamically find not
> only a suitable DMA device, but also the best one.
>
> This finds the first device that provides DMA and the first one
> that is also behind an IOMMU.
>
> The criteria for selecting the best device is to prefer a DMA
> device behind an IOMMU; if not found, the first DMA capable
> one is selected instead.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 68 ++++++++++++++++++++++++-----
>  1 file changed, 56 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 3cb2d1a28987..16c9ff2cfe32 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -1132,6 +1132,60 @@ struct device *mtk_crtc_dma_dev_get(struct drm_crt=
c *crtc)
>         return mtk_crtc->dma_dev;
>  }
>
> +static int mtk_crtc_find_suitable_dma_dev(struct mtk_drm_private *priv,
> +                                         struct mtk_crtc *mtk_crtc,
> +                                         const struct mtk_drm_path_defin=
ition *path)
> +{
> +       struct mtk_ddp_comp *dma_comp =3D NULL, *dma_comp_mmu =3D NULL;
> +       int i;
> +
> +       for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++) {
> +               const struct mtk_drm_comp_definition *cdef =3D path[i].co=
mp;

`path` points to a single `mtk_drm_path_definition`, did you mean
`&path->comp[i]`? Or use `mtk_crtc->ddp_comp[i]` directly here since
patch 38/46 switches to it anyway.

> +               struct mtk_ddp_comp *comp;
> +
> +               comp =3D mtk_ddp_comp_find_by_id(&priv->hlist,
> +                                              cdef->type, cdef->inst_id)=
;
> +               if (!comp)
> +                       continue;
> +
> +               /*
> +                * Check if this is a legacy OVL_ADAPTOR component and, i=
f so, this
> +                * has to forcefully be the DMA device for this CRTC: ass=
ign it to
> +                * dma_comp_mmu to force that.
> +                */
> +               if (comp->type =3D=3D MTK_DISP_OVL_ADAPTOR) {
> +                       dma_comp_mmu =3D comp;
> +                       break;
> +               }
> +
> +               if (!comp->dev || !comp->dev->of_node)
> +                       continue;
> +
> +               /* Find the first device provides DMA... */
> +               if (!dma_comp) {
> +                       if (of_property_present(comp->dev->of_node, "#dma=
-cells"))
> +                               dma_comp =3D comp;
> +               }
> +
> +               /* ...and check if that device is also behind an IOMMU */
> +               if (!of_property_present(comp->dev->of_node, "iommus"))
> +                       continue;

Checking `#dma-cells` (a dmaengine provider property) and unscoped
`iommus` can be fragile: if the leading plane reader has no `iommus`,
this loop keeps scanning and can pick a downstream non-plane block
that has `iommus`.
Maybe filter by `mtk_ddp_comp_layer_nr(comp, i)` to skip non-plane
components instead:

if (!mtk_ddp_comp_layer_nr(comp, i))
    continue;
if (!dma_comp)
    dma_comp =3D comp;
if (of_property_present(comp->dev->of_node, "iommus")) {
    dma_comp_mmu =3D comp;
    break;
}

Regards,
Fei

