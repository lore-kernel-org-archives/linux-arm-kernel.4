Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1EC606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uw2XLxKq;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HQ7gyRfJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g2Ork4q/Fz0rgLCbWsmRNw5g1k58/a2ERyPtpHF+EsU=; b=uw2XLxKqdlpGVq
	rvSQGwIM8iJWGIo2AXvR3ljOY3zd7jMXfWLJv/cZHjOPMrbhC+ea00OUGtRCrj4A0Co/rV1wpBZGw
	wv/Q1dATDAySZne0a6QmYu5v4jiRD/W1iQpyebWRS8UDEK1RstRbaOZi6Bvs3oqhPM19LRZ73oQiQ
	mXz+NHE6Pxj3gZgtMz31PqS1xtkdnX3/LjaJu9aOAkhBbUApf7ykE1vqBtsBkUF4d8JNmciwM+bei
	KUi+Mj0Y4ILycMNmJpGu+cVDShgSIFRMjJrcFKZFe02PALE6zYSK0kpKKkRpCXGOKLjsZM9mdletL
	Hj9TzdVcDABn7v5Uw91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtX9-0000000FgBm-1s7k;
	Fri, 27 Nov 2026 10:50:27 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtX4-0000000FgA2-3aGU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:50:26 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3b53db3d0a5so125866a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795776622; x=1796381422; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g2Ork4q/Fz0rgLCbWsmRNw5g1k58/a2ERyPtpHF+EsU=;
        b=HQ7gyRfJPeI/0heOcunP+K3iuCapA7KwAcPYdiFM469CsnD6iahC1EkRVazPV3mnUQ
         tpI0b7wh3EN/+YlZojTwAMlqtDopraU3gg+w90PUZn4IfEHDMhQvnoHbJRD7eu3z9H+b
         3uTY911KmKVDCBFpKic11NwcX7kHdz0A6++dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776622; x=1796381422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2Ork4q/Fz0rgLCbWsmRNw5g1k58/a2ERyPtpHF+EsU=;
        b=fhTdr9vHp+UB0L71DixKibmtLcatBK+0hbY5/c9E+LNhIl5QCGDlVOhXKT6rWNmoyN
         Q79pnUj8C+IIjIltDH6ghmaBoXygyYwauRrG7bbnsUHgVvdwaGlIzGcihHi8M7/eu4j8
         Wa0Asd1LIY7UAkwiExwgfijtEwIf2QW8ZaJBNVz7eVZkbWk/TYHH5ixL9TgO3sMRUUp3
         IPszBJmuJuJOyOrabGy5InMFpDme4rx5B52K7qcNB2pGXhgG9OPMwIPhkvM9WrAWCbRs
         qgiw6OshD2WdjEGYRUEOUDOmCnQjMeVusJwDpXqFxNE949B0/s5tspswDdAJGy1zq1ZV
         HCgQ==
X-Forwarded-Encrypted: i=1; AL+hErEuliXAwoE76GD1iNuz1cVCAoCk/YQ2iQqdytYAWvx1EAfNfDAGPoUb/Ln2U0jPNwtiVPed7o1QRkmLtT7qb7px@lists.infradead.org
X-Gm-Message-State: APuU4Z92DiNtZIJH1LyjCURaPLoEnCy5pUfZ6h8EPLo5hzPdKgHUEh+2
	iUNW18P/B2aRGHJXTBu5s7fzSWWbC9x8hA3aLno/KVN5WTjWMGyUbTHmDYysZTZAxfr1F96b0qO
	TaqMfWA==
X-Gm-Gg: AZFdTZcSlFtj7Z9F6AD7sSvDS4Z1oQMe1MoPturuVXaHS+Ikypf8SIeu7ki1zkBrWeY
	b9q5Zz043wcI4brBaOJio1aWO0HOS7Z/EhQtougckCKPGS/lzrYRTszASZ9hKKga7vACDWVu0rC
	bu3dVezxtcjFaCinq7i67rhKIGW0Hg/gCFPa8s9HDORtUggsXY5/pR6AXknIemzZbrvV6J2lNTV
	9Czw0s/+9NKPRnXjcGHYhEcFEVyyUqQLcQs9QoFxHi5X3C/Hl020upKr6EqBN5RFDbQFpjgSiA2
	AqOl7sQqPFtBT1K6v9A8JwvFvdx4vve71mWQFiKjuq1iDaSEhPmaXsmMxpxO88DnnlyJnhAmafI
	8ZlnskPNoxU4gUpmsrOi/RJgtLsS7OdD5w542c9JxHLSEU3lv7KxT823vRprY7fl8EJPIqBgVZw
	GGuVeBqIL3S3Fz3rEOvogYfUm4BLVuVH2ZAAw5CQet4+VWKGfcXlipiyPqAwPa98TJMOEvkONXd
	41CJN5EZmb5TdE4+n57ERQsmYF5TLEzb3mPZHOP/BxVC39dEnIbxgz1cQ8v/3Qzcc/Dnbz9VXnC
	dr1HB4gv7/1MhysvVhJQgji2MCx8mnOLO/1HgMkFqIzNt72guLfqDnl+2cYjhIfuXERpaMLpmmT
	GJmrKjXy7
X-Received: by 2002:a17:90b:2d8a:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3b41c952eefmr23196737a91.41.1795776621961;
        Fri, 27 Nov 2026 02:50:21 -0800 (PST)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com. [74.125.82.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm40138263a91.11.2026.11.27.02.50.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:50:21 -0800 (PST)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so12363024c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:50:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGykDz/MAgC1UFzA/sT4A9pjaPWzKox+4QPD1OQ/V4R6UWEe65sgjBiSC0nEz00LZNqXLmKI3nmfHT306OfOHrZ@lists.infradead.org
X-Received: by 2002:a05:7300:824b:b0:386:9c6a:3e87 with SMTP id
 5a478bee46e88-3869c6a3f0fmr19991102eec.15.1795776620365; Fri, 27 Nov 2026
 02:50:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-39-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-39-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 18:49:41 +0800
X-Gmail-Original-Message-ID: <CAC=S1njuORK1R2QCwjh1Lk1yw15Povito9qr1ZV6QP-Dw=oY9Q@mail.gmail.com>
X-Gm-Features: Aa3M54rQkdVsbW33JjuQjGjC9MCiVwfA-JMszG-a0o7TcRXKKUJN-zbdfm4qHSM
Message-ID: <CAC=S1njuORK1R2QCwjh1Lk1yw15Povito9qr1ZV6QP-Dw=oY9Q@mail.gmail.com>
Subject: Re: [PATCH v2 38/46] drm/mediatek: Enable bring-up of
 multi-controller CRTC paths
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
X-CRM114-CacheID: sfid-20261127_025023_053235_A15CCA78 
X-CRM114-Status: GOOD (  22.77  )
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

On Tue, Jul 14, 2026 at 7:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Introduce support for actaully bringing up a full crtc path that
> features multiple display controllers: this enables acquisition
> and writing to multiple MMSYS and MuteX instances to connect the
> multiple display controllers and enable trigger signals from the
> various hardware sub-components at the same time.
>
> This currently only works for rather rare display pipelines that
> can make use of multi-controller without DirectLink architecture.
>
> This change is also the final preparation to introduce support
> for handling DirectLink Display Controller paths, found in the
> MediaTek Kompanio Ultra MT8196, Genio Pro 5100 MT8894 and also
> in the Dimensity 9400 MT6991, Dimensity 9500 MT6993 SoCs.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c     | 513 ++++++++++++++++++------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c |   6 +-
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   4 +
>  3 files changed, 398 insertions(+), 125 deletions(-)
>
[snip]
> +static int mtk_crtc_init_multi_controller_properties(struct device *dev,
> +                                                    struct mtk_crtc *mtk=
_crtc)
> +{
> +       struct drm_crtc *crtc =3D &mtk_crtc->base;
> +       unsigned long controllers_mask =3D 0;
> +       struct mtk_drm_private *priv;
> +       unsigned int i, j, k, z;
[snip]
> +                       mtk_crtc->controller_idmap[z] =3D mtk_crtc->ddp_c=
omp[j]->controller_id;
> +                       z++;

`z` is uninitialized.

> +       for (i =3D 0; i < mtk_crtc->num_controllers; i++) {
> +               u8 controller_num =3D mtk_crtc->controller_idmap[i];
> +               struct mtk_drm_private *priv =3D mtk_crtc_get_controller_=
priv(mtk_crtc, controller_num);
> +
> +               if (!priv)
> +                       return -ENODEV;
> +
> +               mtk_crtc->mutex[i] =3D mtk_mutex_get(priv->mutex_dev);
> +               if (IS_ERR(mtk_crtc->mutex[i])) {
> +                       ret =3D PTR_ERR(mtk_crtc->mutex[i]);
> +                       dev_err(dev, "Failed to get Controller %u MuteX: =
%d\n", i, ret);
> +                       return ret;

If a later iteration fails, the mutexes claimed in earlier iterations
are leaked. Unwind them with mtk_mutex_put() on error.

> -       ret =3D mtk_crtc_find_suitable_dma_dev(priv, mtk_crtc, output_pat=
h);
> +       ret =3D mtk_crtc_find_suitable_dma_dev(mtk_crtc);
>         if (ret) {
>                 dev_err(dev, "Could not find appropriate DMA device!\n");
>                 return -EINVAL;

This is a legacy direct return. It needs to jump to a cleanup path below.

> @@ -1446,4 +1700,19 @@ int mtk_crtc_create(struct drm_device *drm_dev,
>         }
>
>         return 0;
> +
> +err_free_idmap:
> +       devm_kfree(dev, mtk_crtc->controller_idmap);
> +err_free_layer_stages:
> +       for (i =3D 0; i < num_comp_planes; i++) {
> +               struct mtk_crtc_hw_layer *comp_plane =3D &mtk_crtc->hwlay=
ers[i];
> +
> +               if (comp_plane->layer_stages)
> +                       devm_kfree(dev, comp_plane->layer_stages);
> +       }
> +       devm_kfree(dev, mtk_crtc->hwlayers);
> +err_free_crtc:
> +       devm_kfree(dev, mtk_crtc);

Before these error jumps, mtk_crtc_init_comp_planes() and
mtk_crtc_init_drm_crtc() have already linked `drm_plane` / `drm_crtc`
structs into `.plane_list` / `.crtc_list` under `drm_dev->mode_config`
(via drm_universal_plane_init() / drm_crtc_init_with_planes()), so
freeing `mtk_crtc->hwlayers` and `mtk_crtc` without calling
drm_plane_cleanup() and drm_crtc_cleanup() can cause UAF. Please clean
up the registered planes and CRTC before freeing them.

Regards,
Fei

