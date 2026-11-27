Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A440606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wmDHgRHq;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nvYQ9Pjf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bm0qgyTwGAnzbvTI065ip0cEVkfj4VNUXrWOH1TrcSc=; b=wmDHgRHq7IMZ+3
	NPEpPhXhP566GZW6pO9p2A72Dx2vPA1XAkbD8OUGfuyKRl1PzGNQ0VQiWyciE96ofGD/3us7s4kgg
	b6hlx8AUe4Q+J9diu/n+LrqkMxv/o26MnTM0ssD0c54gT0mNPc272oX8WyO1vTabWW+ksCWF/wtdq
	OYhTrF9bqyzK02O4/PB+gAXA7EdeYXqtnK4MPV9B8iafoU96kRHDBjd2UGe5UNajYkqthjljcDL5e
	J0hyTA+5G65Ia/eb4qdK95smA/G55Hbk0fD+1BYv2Ne9PDPkCblQHJrowPUqBS3TiEDLwqo+9AOfW
	ph3KfloZZlorAoRkYGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWunq-0000000G1OQ-0uL9;
	Fri, 27 Nov 2026 12:11:46 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWunn-0000000G1Na-3blK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:11:45 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so3317292a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795781503; x=1796386303; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bm0qgyTwGAnzbvTI065ip0cEVkfj4VNUXrWOH1TrcSc=;
        b=nvYQ9PjfsGRhb2jRw0eqW6yxIw/yUcB/cz1nEhhBlITI/dQ2cK5FGfI0ZBIXuhLTuk
         7BODp6VxhGgjFmDyGYei5s0GY7Mrt8j4rXG6KihQc5fS3rcMd6y3fEHNBRkXTDgZbbgW
         X4T5Md3BHJnq2qhkXTOt45kLwZaWGiaKkgMFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781503; x=1796386303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bm0qgyTwGAnzbvTI065ip0cEVkfj4VNUXrWOH1TrcSc=;
        b=v70+U1CZQeT2nzu1huXZ62GWyXLwTPPCgGlaLUiciuijsLD+Q9o+eDKH1QlBb2jXl6
         opUsVd++y/p1GMTeJJMk384SrjJEZhQQRjd+rdGX38LDAcL8pnqvB71OqduSRlRhV0Ek
         IVK6cRPM5gHlTMebs06kp2l60B8qeyu9HYTVGbrBfhXGqvIkJQ5YRhTaA9CGO+upRv/o
         wnMdBP71/byrAyH7FfpLcSb6ZKm3tsFhenAJ7mQrAdsPymapAbqR5eyDrMBfkUxhebIf
         HN2QSaYBlffx9HW+zowOZH1l/lmZf8Ajf5ldkOnno/ubTNJ0SOg1nN63PrGcL+8OTqOn
         LqaA==
X-Forwarded-Encrypted: i=1; AL+hErELhCUlChHCSaWmeJ7UQISoIYz/H8qewOzgzuroSEhiWI0fTK1y/GPlBMLzZ7fOdoljowFw5ceRKrNTb6kAlRth@lists.infradead.org
X-Gm-Message-State: APuU4Z/lK90Xjbku1mqSIDmgoGo5jWLZl5hX4t56f1o9ASN2iRoZ6Ryq
	pCi27V8UMVLGRfeYRSXqlyVQgvpBmdwX0gTacMrTvT5SyuZSozZsLfw0odvdzLEliQFMRhP0WMz
	oBHU6/g==
X-Gm-Gg: AZFdTZd8JPgetZzzCXvH32HgHsl8CgN4Vs6BAn88v/ltllENWZ3d7YciGivNv0qnfh/
	yS7l4n1/D/Uv9FElG6EOOV2w/IEpS6NpPteEJFNqeSmODjtyyAi095c6vEewHqXT0IstBpvWNOS
	8AmKAissSTQmFdbjfZ9jQ+OBzlwsy6bOFH1lVx/xK4ekjHP9EBKjghXtsRxM1HEAhYnajkJdzbm
	uW/tKfaaMVBGkXO85asB6RjQWvnE+uC+X+OLQKyUwmY75p2zL+5u1OENT2+brHD82URLJRFnlFn
	QrFBR0JWC/bWaNbr5oAT1idgLvPExLrotICYAK4JSWkumotfJ+JoXKASALdUJwu7iuQMTtPFWW4
	NvA3VQRsQIu7i5TbS0CJkwN001vn+tv8XnULAM3P8ReT9vC5NzmZIEdrs3F7zi5n3jRnpev4HEb
	1hpdDKx7r1cW90dP36u1IQn+/GmdIfrPhbNjHtRtVcREVBA+VpFIPyXFC36KnWDfkP78U6dehMK
	KHOJplWWpmbqA/RPLHElY5RPxS+0dEjQ4cBSvCsqYu01dIMwnQteezo2wAnLLs8UaRDrWfYegLA
	wd97nWuYiU7gzVOhCltoDkshu1ebHqvwtMTg3IrNzuAxoCdTFzwuyIdW3Hz2faCd5xPDvKO5lxL
	xdFNPLsoQUDat
X-Received: by 2002:a17:90b:5350:b0:3b4:2eb:d9cf with SMTP id 98e67ed59e1d1-3b41c9086d7mr20733056a91.19.1795781502519;
        Fri, 27 Nov 2026 04:11:42 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b0f482bdsm22221157a91.14.2026.11.27.04.11.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:11:41 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38692f62b22so10799852eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:11:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHY/amIN1PzCyATJ8BwWEzfe4BNQV1GQ9cuaf9Xy/fDgo/Q+u1wJFvW5ENbcNPwRDoyHHojm22BHG+QQzGURI6u@lists.infradead.org
X-Received: by 2002:a05:7300:d0af:b0:386:a3fe:4503 with SMTP id
 5a478bee46e88-386a3fe46b5mr17622667eec.41.1795781500168; Fri, 27 Nov 2026
 04:11:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-40-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-40-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 20:11:02 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhVwaXYehnkOhZtp1HVMPbgf3hHyq0nzUa0xBZKZtSc2w@mail.gmail.com>
X-Gm-Features: Aa3M54oBRoREnUteIhw_cWqJHnKQjoLmcsIuuFawJHqYqFGvJvM1giC0E8ZPK6Q
Message-ID: <CAC=S1nhVwaXYehnkOhZtp1HVMPbgf3hHyq0nzUa0xBZKZtSc2w@mail.gmail.com>
Subject: Re: [PATCH v2 39/46] drm/mediatek: Introduce MediaTek Asynchronous
 DirectLink Controller
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
X-CRM114-CacheID: sfid-20261127_041143_960840_F7B0B2B4 
X-CRM114-Status: GOOD (  33.34  )
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
> Add support for the MediaTek Display Controller's Asynchronous
> Direct Link Controller.
>
> This is responsible for managing internal I/O connections between
> multiple display controllers in a leader to follower(s) topology,
> adding the ability to enable data exchange between multimedia
> related controllers and the display controller(s), and between
> multiple display controllers, effectively changing the hardware
> capabilities of multiple display output paths.
>
> For example, this could be used to support multiple outputs with
> lower resolution and/or color depth, or to support less outputs
> but with high resolution and/or color depth, up to 8k60 in some
> MediaTek SoCs like MT8196.
>
> Moreover please note that, on new generation SoCs, (MT8196, MT8894,
> MT6991, MT6993, etc), the Asynchronous DirectLink (DL_ASYNC) sub
> component is required to be set up in order to achieve any display
> output at all as, differently from slightly older ones (MT8195)
> where a display controller reset resulted in default valid outputs
> being set, the new ones have a "muted" configuration by default.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile             |   1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  42 +-
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  33 +-
>  .../gpu/drm/mediatek/mtk_disp_directlink.c    | 434 ++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  12 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 160 ++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h        |   4 +
>  8 files changed, 661 insertions(+), 26 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_directlink.c
>
[snip]
> +       of_port =3D of_graph_get_port_by_id(node, of_port_id);

`of_port` is never released with `of_node_put()` on any return path.

> +       if (!of_port)
> +               return -ENOENT;
> +
> +       for_each_of_graph_port_endpoint(of_port, ep)
> +               num_links++;
> +
> +       clks =3D devm_kcalloc(dev, num_links, sizeof(*clks), GFP_KERNEL);
> +       if (!clks)
> +               return -ENOMEM;
> +
> +       link_ids =3D devm_kcalloc(dev, num_links, sizeof(*link_ids), GFP_=
KERNEL);
> +       if (!link_ids)
> +               return -ENOMEM;
> +
> +       i =3D 0;
> +       for_each_of_graph_port_endpoint(of_port, ep) {
> +               struct of_endpoint endpoint;
> +               u32 hw_port_id;
> +               int ret;
> +
> +               ret =3D of_graph_parse_endpoint(ep, &endpoint);
> +               if (ret)
> +                       continue;
> +
> +               ret =3D of_property_read_u32(ep, "mediatek,port-id", &hw_=
port_id);
> +               link_ids[i] =3D ret ? endpoint.id : hw_port_id;
> +               clks[i] =3D devm_get_clk_from_child(dev, ep, NULL);

`clks[]` and `link_ids[]` are populated sequentially
(`0..num_links-1`), while mtk_direct_link_config() /
mtk_direct_link_clk_enable() etc. index them by `comp->inst_id`. If
endpoint `reg` values are sparse or don't start at 0, this reads out
of bounds or hits the wrong entry.

Maybe calculate `max_ep_id`, size the arrays by `max_ep_id + 1`, and
index by `endpoint.id` (with bounds checking), or look up the entry by
`endpoint.id`.

> +               if (IS_ERR(clks[i])) {

Early return inside `for_each_of_graph_port_endpoint()` leaks `ep`
(missing `of_node_put(ep)`).

> +                       return dev_err_probe(dev, PTR_ERR(clks[i]),
> +                                            "Could not get clock\n");
> +               }
> +               i++;
> +       }
> +       dl_port->clks =3D clks;
> +       dl_port->link_ids =3D link_ids;
> +       dl_port->num_links =3D num_links;
> +
> +       return 0;
> +}
> +
> +static int mtk_direct_link_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *main_node =3D dev->of_node;
> +       struct mtk_direct_link *dl_async;
> +       int in_mtx_id, out_mtx_id;
> +       unsigned int num_ports;
> +       int i, ret;
> +
> +       dl_async =3D devm_kzalloc(dev, sizeof(*dl_async), GFP_KERNEL);
> +       if (!dl_async)
> +               return -ENOMEM;
> +
> +       dl_async->data =3D device_get_match_data(dev);
> +
> +       dl_async->regs =3D of_iomap(dev->of_node, 0);

of_iomap() returns NULL on failure rather than an ERR_PTR, and leaks
the mapping on unbind. Use devm_platform_ioremap_resource(pdev, 0).

> +       if (IS_ERR(dl_async->regs))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dl_async->regs),
> +                                    "Could not get regs\n");
> +
> +       num_ports =3D of_graph_get_port_count(main_node);
> +       if (num_ports =3D=3D 0)
> +               return dev_err_probe(dev, -ENOENT, "No Input/Output ports=
 found.\n");
> +
> +       /*
> +        * Get the Trigger ID for DL_IN_0 and for DL_OUT_0, as all of the=
 other
> +        * HW ports have linearly increasing IDs.
> +        */
> +       in_mtx_id =3D mtk_ddp_comp_get_mutex_trigger(main_node, MTK_DISP_=
DL_IN);
> +       out_mtx_id =3D mtk_ddp_comp_get_mutex_trigger(main_node, MTK_DISP=
_DL_OUT);
> +       switch (num_ports) {
> +       default:
> +               /* fallthrough */
> +       case 2:
> +               if (in_mtx_id && out_mtx_id) {
> +                       ret =3D 0;
> +                       break;
> +               }
> +
> +               ret =3D in_mtx_id < 0 ? in_mtx_id : out_mtx_id;
> +               break;
> +       case 1:
> +               if (in_mtx_id || out_mtx_id) {

mtk_ddp_comp_get_mutex_trigger() returns negative error codes, while
ID 0 is valid. Check with `>=3D 0` explicitly.

> +                       if (in_mtx_id < 0)
> +                               in_mtx_id =3D 0;
> +                       if (out_mtx_id < 0)
> +                               out_mtx_id =3D 0;
> +
> +                       ret =3D 0;
> +                       break;
> +               }
> +
> +               ret =3D in_mtx_id < 0 ? in_mtx_id : out_mtx_id;
> +               break;
> +       }
> +
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Could not get %s port 0 t=
rigger ID\n",
> +                                    in_mtx_id < 0 ? "input" : "output");
> +
> +       if (in_mtx_id > U8_MAX || out_mtx_id > U8_MAX)
> +               return dev_err_probe(dev, -EINVAL, "Implausible trigger I=
D found\n");
> +
> +       /* IDs are now validated and safe to assign */
> +       dl_async->dl_port[MTK_DISP_DL_IN].p0_mtx_trig_id =3D in_mtx_id;
> +       dl_async->dl_port[MTK_DISP_DL_OUT].p0_mtx_trig_id =3D out_mtx_id;
> +
> +       i =3D 0;
> +       for_each_of_graph_port(main_node, port_node) {
> +               u32 port_id;
> +
> +               of_property_read_u32(port_node, "reg", &port_id);
> +               if (port_id > 1)
> +                       continue;
> +
> +               ret =3D mtk_direct_link_port_probe(dev, &dl_async->dl_por=
t[i], port_id);
> +               if (ret)

Pass `&dl_async->dl_port[port_id]` instead of `i`.

mtk_direct_link_get_port() indexes `dl_port[]` by MTK_DISP_DL_IN (0)
and MTK_DISP_DL_OUT (1), so on an output-only node (port@1), using `i`
(0) populates `dl_port[0]` and leaves `dl_port[MTK_DISP_DL_OUT]`
uninitialized.

Also, `port_id` is uninitialized if reg is missing, and early return
inside `for_each_of_graph_port()` leaks `port_node`.

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 75b3fd56d6af..4f39df23c51e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -804,10 +822,27 @@ static int mtk_drm_of_get_first_input(struct device=
 *dev, struct device_node *no
>         if (ret)
>                 return -ENOENT;
>
> -       inst_id =3D mtk_ddp_comp_get_id(ep_dev_node, comp_type);
> +       inst_id =3D mtk_ddp_comp_get_id(ep_dev_node, ep_in, comp_type);
>         if (inst_id < 0)
>                 return inst_id;
>
> +       if (comp_type =3D=3D MTK_DISP_DIRECT_LINK) {
> +               struct device_node *remote_port =3D of_graph_get_remote_p=
ort(ep_in);
> +
> +               /* If there's a remote port this input is active, otherwi=
se it's unused */
> +               if (!remote_port)
> +                       return -ENOENT;
> +               of_node_put(remote_port);
> +
> +               /* All even ports describe inputs, all odd ports describe=
 outputs */
> +               comp_type =3D (crtc_endpoint + 1) % 2 ?
> +                           MTK_DISP_DIRECT_LINK_IN : MTK_DISP_DIRECT_LIN=
K_OUT;

`ep_in` and `ep_dev_node` were already put earlier in this function
(patch 37/46).

Also, `ep_in` is fetched from hardcoded `port@0` and `crtc_endpoint`
is the CRTC index (`0 =3D MAIN`, `1 =3D EXT`, ...), so `(crtc_endpoint +
1) % 2` misclassifies `CRTC_EXT` (`endpoint@1`) as
`MTK_DISP_DIRECT_LINK_OUT`; this is always `MTK_DISP_DIRECT_LINK_IN`.

> +
> +               dev_dbg(dev, "Found First DirectLink %s with port %pOF an=
d ID %u\n",
> +                       comp_type =3D=3D MTK_DISP_DIRECT_LINK_OUT ? "OUT"=
 : "IN",
> +                       ep_in, crtc_endpoint);
> +       }
> +
>         /* All ok! Pass the Component ID to the caller. */
>         comp_def->type =3D comp_type;
>         comp_def->inst_id =3D inst_id;
> @@ -848,7 +883,7 @@ static int mtk_drm_of_get_ddp_ep_cid(struct device *d=
ev, struct device_node *nod
>                                      struct mtk_drm_comp_definition *comp=
_def,
>                                      bool controller_arch_v2)
>  {
> -       struct device_node *ep_dev_node, *ep_out;
> +       struct device_node *ep_dev_node, *ep_out, *remote_ep;
>         enum mtk_ddp_comp_type comp_type;
>         int ret;
>
> @@ -856,10 +891,16 @@ static int mtk_drm_of_get_ddp_ep_cid(struct device =
*dev, struct device_node *nod
>         if (!ep_out)
>                 return -EINVAL;
>
> -       ep_dev_node =3D of_graph_get_remote_port_parent(ep_out);
> +       remote_ep =3D of_graph_get_remote_endpoint(ep_out);
>         of_node_put(ep_out);
> -       if (!ep_dev_node)
> +       if (!remote_ep)
> +               return -ENOENT;
> +
> +       ep_dev_node =3D of_graph_get_port_parent(remote_ep);
> +       if (!ep_dev_node) {
> +               of_node_put(remote_ep);
>                 return -EINVAL;
> +       };
>
>         /*
>          * Pass the next node pointer regardless of failures in the later=
 code
> @@ -877,17 +918,20 @@ static int mtk_drm_of_get_ddp_ep_cid(struct device =
*dev, struct device_node *nod
>                         dev_dbg(dev, "Found connection to external mmsys =
%pOF\n",
>                                 rmt_ctrlr_node);
>
> -                       of_node_put(ep_dev_node);
>                         of_node_put(rmt_ctrlr_node);
> +                       of_node_put(remote_ep);
>                         return -EREMOTE;
>                 }
>         }
>
> -       if (!of_device_is_available(ep_dev_node))
> +       if (!of_device_is_available(ep_dev_node)) {
> +               of_node_put(remote_ep);
>                 return -ENODEV;
> +       }
>
>         ret =3D mtk_drm_of_get_ddp_comp_type(ep_dev_node, &comp_type);
>         if (ret) {
> +               of_node_put(remote_ep);
>                 if (mtk_ovl_adaptor_is_comp_present(ep_dev_node)) {
>                         comp_def->type =3D MTK_DISP_OVL_ADAPTOR;
>                         comp_def->inst_id =3D 0;
> @@ -897,10 +941,26 @@ static int mtk_drm_of_get_ddp_ep_cid(struct device =
*dev, struct device_node *nod
>                 return ret;
>         }
>
> -       ret =3D mtk_ddp_comp_get_id(ep_dev_node, comp_type);
> +       ret =3D mtk_ddp_comp_get_id(ep_dev_node, remote_ep, comp_type);
> +       of_node_put(remote_ep);
>         if (ret < 0)
>                 return ret;
>
> +       if (comp_type =3D=3D MTK_DISP_DIRECT_LINK) {
> +               struct device_node *remote_port =3D of_graph_get_remote_p=
ort(ep_out);
> +               u32 port_id;
> +
> +               of_property_read_u32(remote_port, "reg", &port_id);
> +               of_node_put(remote_port);
> +
> +               /* All even ports describe inputs, all odd ports describe=
 outputs */
> +               comp_type =3D (port_id + 1) % 2 ? MTK_DISP_DIRECT_LINK_IN=
 : MTK_DISP_DIRECT_LINK_OUT;
> +
> +               dev_dbg(dev, "Found DirectLink %s with port %pOF and ID %=
u\n",
> +                       comp_type =3D=3D MTK_DISP_DIRECT_LINK_OUT ? "OUT"=
 : "IN",
> +                       remote_port, port_id);
> +       }

`ep_out` was already put above, `remote_port` is logged after
`of_node_put()`, and `port_id` is uninitialized if `remote_port` is
NULL or lacks "reg".

> +
>         /* All ok! Pass the Component ID to the caller. */
>         comp_def->type =3D comp_type;
>         comp_def->inst_id =3D ret;
> @@ -1200,8 +1278,13 @@ static int mtk_drm_probe(struct platform_device *p=
dev)
>
>         hash_init(private->hlist.ddp_list);
>
> +       if (of_graph_is_present(phandle))
> +               node =3D phandle;
> +       else
> +               node =3D of_find_node_by_name(phandle, "direct-link");

of_find_node_by_name() calls of_node_put(phandle) on borrowed
`dev->parent->of_node`, walks the whole DT past phandle, and leaks the
returned node.
Use of_get_child_by_name(phandle, "direct-link") and put it when done.

> @@ -1273,12 +1363,45 @@ static int mtk_drm_probe(struct platform_device *=
pdev)
>                                                    node);
>                 }
>
> -               ret =3D mtk_ddp_comp_init(dev, node, &private->hlist,
> -                                       private->data->mmsys_id,
> -                                       comp_type, comp_inst_id);
> -               if (ret) {
> -                       of_node_put(node);
> -                       goto err_node;
> +               if (comp_type =3D=3D MTK_DISP_DIRECT_LINK) {
> +                       for_each_of_graph_port(node, port) {
> +                               u32 port_id;
> +
> +                               of_property_read_u32(port, "reg", &port_i=
d);
> +                               if (port_id > 1)
> +                                       continue;
> +
> +                               /* Even ports are inputs, odd ports are o=
utputs */
> +                               if (port_id % 2)
> +                                       comp_type =3D MTK_DISP_DIRECT_LIN=
K_OUT;

`comp_type` is modified in place without being reset for even ports.
If port@1 appears before port@0 in DT (not preferred, but possible),
`comp_type` becomes `MTK_DISP_DIRECT_LINK_OUT` on the first iteration
and stays `OUT` for port@0 on the next iteration (also carried into
patch 40/46).

Compute the type per port instead, e.g. port_type =3D (port_id % 2) ?
MTK_DISP_DIRECT_LINK_OUT : MTK_DISP_DIRECT_LINK_IN;

> +
> +                               for_each_of_graph_port_endpoint(port, ep)=
 {
> +                                       struct of_endpoint of_ep;
> +
> +                                       ret =3D of_graph_parse_endpoint(e=
p, &of_ep);
> +                                       if (ret)
> +                                               break;
> +
> +                                       ret =3D mtk_ddp_comp_init(dev, no=
de, &private->hlist,
> +                                                               private->=
data->mmsys_id,
> +                                                               comp_type=
, of_ep.id);
> +                                       if (ret)
> +                                               break;
> +                               }
> +
> +                               if (ret) {
> +                                       of_node_put(node);
> +                                       goto err_node;
> +                               }

Similarly, breaking out of `for_each_of_graph_port_endpoint()` leaks
`ep`, and jumping out of `for_each_of_graph_port()` via `goto
err_node` leaks `port` (missing `of_node_put()`, also carried into
patch 40/46).

Regards,
Fei

