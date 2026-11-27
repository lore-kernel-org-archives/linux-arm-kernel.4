Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6D1606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vYhO4Gf/;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=X2W2BFsE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6wJPtmDOKQWl0gKDtiuKlNF32reQWcBhdrSBFhz15UA=; b=vYhO4Gf/6cFRND
	Bju5zYYptAjCUxZT7HfirD6WP4SeJgTjj/1MmxJBhSuPQk9Gskv3sbVDRTDqdz8vrl1fjtb2DtmVG
	4kw+DYVBCPh5uZEt7kQtCFTBCLx9MCjofHItC82RzrIlnq5giJqyBJSEqAK5B+4Bv6rW4O3LBb8T4
	eZ5hFWKckvIxhFZnyF/JIMoVRHw+35INcuKMzxe+rg/hJLGdo6Ns7l/bCXmn4x+u13u9CCOTo3jxV
	qXdywo0iuxU43d0G92orwuULMMQ217wmx+f1smVEafvekdJmW7ZyiqLiJ6sRgt0mCNRS83BUOSL1W
	6AtnKv5gwb+gGcusg/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv2C-0000000G7gO-2YI1;
	Fri, 27 Nov 2026 12:26:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv24-0000000G7dk-3NeM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:26:35 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2f05b465cd1so2639155ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795782388; x=1796387188; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6wJPtmDOKQWl0gKDtiuKlNF32reQWcBhdrSBFhz15UA=;
        b=X2W2BFsEN1JNypxSjbH18Mskakg4fIkhTgUsp2gYw8KRP9rw4UfMbr1UogRWpsQRj2
         55v1dzIOpHDkAcW7Xq2MP55E0LJ9Roc8XbAqnX2Bd8qSYwlMyCaXgyBty8mCXtzJh2RP
         OVExcWQ73NfuppsAFHl0ea3jAY7CJiVS3u5ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782388; x=1796387188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wJPtmDOKQWl0gKDtiuKlNF32reQWcBhdrSBFhz15UA=;
        b=Rbi1jE3GpeWdVIYKJDWzA/POY/+xW/I0mf/FbNv8xBpg0v/EVAQagZLrWarL74wHeH
         husPqyiZw33j9lgW/sdk0TUpUoOvUvvidz3mNgMBwoscIVw07vQLOli8uALHlJKI6x78
         JrGUiXCMPLSMXqMdWWsdjZ/htgBLpCfi7waWGsUbyTcFeZ7zk9yS1VzdDwyOgzLIOFLC
         Y8getAoFZjHox9nvDt5sdCmZ761L1GMDuOINWJGVISimxmFkA8RwgH6CPNcxh/DDroBl
         XvjV/ek6kuLt01hiVXct7M5a5C6OLBGI3T+hZ0Lw9BFsghNKE/EvoFQKr3UVwNVW8sGG
         pc2Q==
X-Forwarded-Encrypted: i=1; AL+hErGcMFy4HHPkjNe8OQ5pvZJV9QxHFg11utPl69/KTJog3NIkR5gxIhnYk/WmUygIFWNzDNGYxfdL6PkY6B8hgZUG@lists.infradead.org
X-Gm-Message-State: APuU4Z8yV4Ojav0SLfD2sAB9Xh1Krg4l4BeVFwbK83Nafmc8+iJyGZFo
	FNvU4QQDQTlDeO/adumceAivW6OGJ0QNvTmYIljiWWvxdgFvKmRc/qtKDlXt27DAeGuqjZ2cOmS
	pa9c=
X-Gm-Gg: AZFdTZc6GpHF9aE4Bb4rkHLTnL/Gfuk9/igEiBaqui6cyCPtQhjy9FRrHzKGEs8CY6Y
	VBGmy8nP1yAw5sBUVR6XAJBX9SXRcBALrUpL2x9axC36P2Vx0KVOXn9me1PWIIoILWDXfsfs3Yd
	RwZeXkZP7p4Q25vXN7aDYFgeucm52OHSbUls5JuPcOspSu5/F3vfJNZlI0eAppiezHoCMaElYZI
	PTGAMn3J3X+7lXkQIk4voBU2ZKNZNc6GuDauAp7dBwHTZU4T9xwgu64TuThba9t9yTtx6PTtS+o
	4MGiLM+UMF/v7CANG88Z3IsiOB/3kjOjGzt0kkz8Y95HLSShnaDUJgohU3t613wOBthxkNUbnF7
	HfyPeBMihgEBJ1NCU4lG+OaHyCs1R7u9+Qhi2n+n0+i8jemWUdGVlPo0nuZ/mflNpZn3j/NYWSp
	E7JK55uJRfoG1D+aluv47/EqYLslleDiytEIwFa5vr2gt61FhbXCu1Tqrtzc6cENQCeYgAbA+P5
	KVS/9KlnofP4kjZ0Q9Y8IDRzZzJDQ2qvNp0oB8dYDOcqnLUJL/XCB+9ME4HIQItM+2h55RaiwBC
	JSGQKkziKiZlY3yxvxJVQWaTR6ZE3xHjAzE9IV4/QW5RnUs7kSw/MXtCJW94YxHXbxtkiXRj19m
	FxXR9C/Lk7DiR
X-Received: by 2002:a17:902:cf0b:b0:2df:3b0c:a6a5 with SMTP id d9443c01a7336-2f03ef594cdmr219603045ad.9.1795782387725;
        Fri, 27 Nov 2026 04:26:27 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm19434605ad.55.2026.11.27.04.26.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:26:27 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-385c497bf94so7862134eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:26:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGiqD/UasGGMsqDL4K9EfNfk+/T+c/vAYJHE2o7isqmuJ5miWzqI+XI7NcQWIGMRTpLIbVUDqq0QkeOGywA71X7@lists.infradead.org
X-Received: by 2002:a05:7301:4d0c:b0:376:a6d7:8f6f with SMTP id
 5a478bee46e88-3856ec3ec8bmr25649718eec.17.1795782385135; Fri, 27 Nov 2026
 04:26:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-47-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-47-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 20:25:42 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh8TnQeGfW+At1vCs3ie=7EYiG2R9xSTyfZ1A4mW0+CGQ@mail.gmail.com>
X-Gm-Features: Aa3M54p-uqcPZ0BTjnlZ-C4P_vANwYAAc7cv53pfujMjetYD2ahEumQx7Kd9jG4
Message-ID: <CAC=S1nh8TnQeGfW+At1vCs3ie=7EYiG2R9xSTyfZ1A4mW0+CGQ@mail.gmail.com>
Subject: Re: [PATCH v2 46/46] drm/mediatek: mtk_drm_drv: Fail init only if all
 paths are invalid
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
X-CRM114-CacheID: sfid-20261127_042632_556664_E5F39FA6 
X-CRM114-Status: GOOD (  26.49  )
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
> Up until now, if not all display controller paths were valid, the
> driver would fail probing and refuse to bind components: while
> that was a good idea before, now that mediatek-drm gained much
> more flexibility, it is finally possible to gracefully handle
> this situation and register only the valid paths while leaving
> the invalid ones unregistered, without any crash.
>
> Count how many output paths are found, and then count how many
> have failed probing: if there is at least one valid path, avoid
> erroring out, so that at least some outputs will just work.
>
> Of course, any path failing is not a clean situation and must be
> resolved: in this case, function mtk_crtc_create() still prints
> error messages so, even though some output works, that will not
> go unnoticed, as a quick check in kmsg will show the errors that
> made a certain path not to register.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 82d844b6abf7..7c9cb50909c8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -394,6 +394,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         struct mtk_drm_private *priv_n;
>         struct device *dma_dev =3D NULL;
>         struct drm_crtc *crtc;
> +       int num_failed =3D 0;
> +       int num_paths =3D 0;
>         int ret, i, j;
>
>         if (drm_firmware_drivers_only())
> @@ -460,15 +462,29 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                         if (!priv_n->data->output_paths[i].len)
>                                 continue;
>
> +                       num_paths++;
> +
> +                       dev_vdbg(drm->dev,
> +                                "[CTRL%d-CRTC%d] Path Len:%d, Controller=
 Order:%u\n",
> +                                j, i, priv_n->data->output_paths[i].len,
> +                                priv_n->data->output_paths[i].order);
> +
>                         ret =3D mtk_crtc_create(drm, i, j,
>                                               priv_n->data->conn_routes,
>                                               priv_n->data->num_conn_rout=
es);
> +                       if (ret =3D=3D 0)
> +                               break;

Since patch 38/46, mtk_crtc_create() already combines all controllers
(`order 0..N`) for `output_paths[i]` into one CRTC, so only the leader
(`order =3D=3D 0`) should call it.

Relying on `if (ret =3D=3D 0) break;` instead of filtering `order =3D=3D 0`=
 has
a few issues:
- If a follower (`order > 0`) appears before the leader in
  `all_drm_private[]`, `mtk_crtc_create()` gets the follower's `j` as
  `priv_data_index` (setting `mmsys_dev`, CMDQ, and `conn_routes` from
  the follower) and breaks before reaching the leader.
- If `mtk_crtc_create()` fails, the loop retries it on every remaining
  follower for the same CRTC.
- Patches 38/46..45/46 don't have this `break;` yet and register
  duplicate CRTCs for each follower.

Skip `priv_n->data->output_paths[i].order > 0` in the loop (starting
in patch 38/46) instead of breaking on `ret =3D=3D 0`.

Regards,
Fei

>
> -                       if (ret)
> -                               goto err_component_unbind;
> +                       num_failed++;
>                 }
>         }
>
> +       if (num_failed =3D=3D num_paths) {
> +               dev_err(drm->dev, "No valid Display Controller path! Goin=
g out.\n");
> +               ret =3D -ENODEV;
> +               goto err_component_unbind;
> +       }
> +
>         /* IGT will check if the cursor size is configured */
>         drm->mode_config.cursor_width =3D 512;
>         drm->mode_config.cursor_height =3D 512;
> --
> 2.54.0
>
>

