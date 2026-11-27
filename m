Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC56B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b0h1o4wr;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jaZPZOX6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z0HAmZPkkL929InieJ6NG6YqendguBQ6bWYFHNZs/RU=; b=b0h1o4wrNyCYf8
	SRk5fND2H1CfXtqQLtyKwiV8UnGsG/tHYcBs84vN0FeEE3rVDFnPuHc7Sab4FCx34nwUpE/dRVzuL
	QGPi5kMb3A9IWSFCU4GHsq7kJ46PgfZUI8vXqgbjodS8ub4j/eddLA2LsAIehvGzMEETI+2h5NZu8
	jRqCxfyyTcQKFhlMbuRCgdJLwoI0OihZ6nSjZFod2+S0XOjX3mRDxl36qS6B47hBCztfZEHpJvcV5
	DFdjJMM/sZSRsd0hLgjif1k9dlO6gUrFv5UtR+9SGD1VPKsncqihxu9br6LYI/2LUtvKTHBwyyptk
	cQpX1JnwJ+pN1h1FKxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsKM-0000000FRzv-38wK;
	Fri, 27 Nov 2026 09:33:10 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsKK-0000000FRz0-2vEY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:33:09 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cddac941ed1so3541408a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795771988; x=1796376788; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0HAmZPkkL929InieJ6NG6YqendguBQ6bWYFHNZs/RU=;
        b=jaZPZOX6lK/4MbqtppPeBSfWesFj+Yh3XoCB9x/g53OHsWUzya2wM6GwttBgXkkGyF
         CB1gqsNssY5DHeAs8OLeJlwQ7d2tLBBO/54Rlavc3Sdsf45JM3s/+2RRzSR58ndpC5Oz
         WZZ53rwrPc42cQOeDLt8sDnJxTxqseOXxzES0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771988; x=1796376788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0HAmZPkkL929InieJ6NG6YqendguBQ6bWYFHNZs/RU=;
        b=dFB3kHXnzN01E368dFS9llTynF6hFtkeOdNYEKDtFDgz4SiS7kZBofvqYFXLpXF38b
         Sx2Y5JeKQ+OsmKEqK+RzHXa5WeCzk4LsQ4ux+/vc/ELXaySopnyEJksHTwYCz+Wqr4B7
         7MD2vdzG2JsmGNu48nc23ABVA/HBRkN+RpQVqMLuxAQwTRLo5I1jQKuLP9CDF8c3TtOa
         DyE9XIgYieWhn6TqyTFzycvxS5qj4AS1gbehn0qokYCoj46JVGz4+W8N2H9zyWp6jB/g
         WypfvJ1oDGFHviTt8qRPbhR2mC4kKXNG64qXRUyUf6Jr08VmtOTrJPa2MReWrze8iye+
         MfLg==
X-Forwarded-Encrypted: i=1; AL+hErHTy/cn2/WNjqZXNDwTKKaKnvfaHC7+4XI089z+tTTct1ft/1GYzAyumJK24VMGTh3DFRlu/wgXDaRvuBtzR0PG@lists.infradead.org
X-Gm-Message-State: APuU4Z8BY3ocTx8pD9S8yCmZEpz3FfiAgTRpq4Cdw9Yxg3/NXbU7szGT
	3C8zw76DMlgAnS9/HdV826kR2Sthb+iXkgJlQtliKrEMbNfllvS0XK+YA9joylb7NwKvo5WLHkN
	enoj9BA==
X-Gm-Gg: AZFdTZc9nj4i8gAHZfvSISngY2DDZkqw1Z+hz5E5bSHxW+ukuksqLRe3o9qNF74qrP2
	+trRIpJjq82zQZeirzNH1H3kmnyyD/vvTIGPwmzQSkFWx+AkmSP8wfvJV+gxCgHIgIIFOIHUaLh
	BP9CKwp7nH99Ntp8AlQz0SGdiS77FDhKKJk8UgWoSeA+v8FK24Twcq36ffy+Du+ARoiSlF5SUs7
	u37QuluqeOJ9kJ2LtC1rE9k/25zXrkVHqr0C1lORWt/Xmog6FozE/IvFauGmU/nnscjy38rIRz/
	K8iY9NMMuQD6IG8ZU610wFNMmewEQBpjmzuTOOmValqol07TVUbt47UG9tMOaI7qPYQrDqIWxYx
	AiYp7wLfEVLLa63cGtx+4pDxXpBizjL0fBejA5pWfgUOuTIuJ9upZ35k7+MB1XKmu/Tgxg2wNn5
	c+ZJHIJUidYwvFOR+neHEP5XlSzZF8GHQ84Z6APpFExIG76jaWqwE54EXxlUHj0egF6+iEanQTU
	hQDmwv7Re/BkzzpyacUlioymkB5q2oNCOAqMzU4GtKIxxZCuM2yzLbT/52WuIgJOaPn/D3vZDGz
	DSvqqfoAmBKbktcyMDDFCg+bo7Cp1LOUWcdJgMHTYlRr32ektyNwdQj259wmPtu1Bgo=
X-Received: by 2002:a05:6a21:6116:b0:3e2:1418:aae8 with SMTP id adf61e73a8af0-4014dd566d2mr25531235637.72.1795771987738;
        Fri, 27 Nov 2026 01:33:07 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6c9c7dcbsm12792195a12.0.2026.11.27.01.33.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:33:07 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-385c497bf94so7535465eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:33:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErETJekFsCFWGU2sA+PhxLFhMWyfrkRnGPMzbD3zrBuSIeTZyqMrgx6b+kz30fmj4thBnzuUNzeX+cjkkDngOjlV@lists.infradead.org
X-Received: by 2002:a05:693c:414e:10b0:386:a1ae:6762 with SMTP id
 5a478bee46e88-386a1ae6d5fmr20784587eec.36.1795771985456; Fri, 27 Nov 2026
 01:33:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-38-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 17:32:28 +0800
X-Gmail-Original-Message-ID: <CAC=S1niK0HHMLpm+i9YLTeASvhM=qDy6oD2t24pa_32wKNsuqg@mail.gmail.com>
X-Gm-Features: Aa3M54pRArGKHVMgeqwG1e8L5StTOP94fleg1U4pb_vICTi6qu6Nmly90U-l36k
Message-ID: <CAC=S1niK0HHMLpm+i9YLTeASvhM=qDy6oD2t24pa_32wKNsuqg@mail.gmail.com>
Subject: Re: [PATCH v2 37/46] drm/mediatek: Prepare path builder for
 multi-controller architecture
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
X-CRM114-CacheID: sfid-20261127_013308_735707_C7A3CD9A 
X-CRM114-Status: GOOD (  32.61  )
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
> In preparation for adding support for the new display controllers
> featuring multi-controller w/DirectLink architecture, expand the
> path builder to recognize whether a hardware component in display
> controller related output path is getting its input from internal
> or from any external (to itself, but still internal to the SoC)
> display controller component.
>
> When an output path is found, it is also necessary to understand
> the enablement order (in terms of mmsys/mutex other than PM) of
> the controllers, as that cannot be done randomly: for this, the
> initial path builder will start storing an indication to whether
> a component is either in a leader or in a follower controller,
> and then a new function mtk_drm_set_path_orders(), called when
> binding all components, when initializing KMS, takes care of the
> looping through the path and setting up the order between all
> of the follower display controllers.
>
> As of this point, no multi-controller SoCs are introduced yet,
> so this code will not bring any functional change on any of the
> currently supported SoCs / display controllers.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   2 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h   |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 374 ++++++++++++++++++++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_legacy.c |   3 +-
>  5 files changed, 351 insertions(+), 32 deletions(-)
>
[snip]
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index cccdd58b848a..75b3fd56d6af 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -185,17 +185,26 @@ static int mtk_drm_match(struct device *dev, const =
void *data)
>  static bool mtk_drm_get_all_drm_priv(struct device *dev)
>  {
>         struct mtk_drm_private *drm_priv =3D dev_get_drvdata(dev);
> -       struct mtk_drm_private *all_drm_priv[MAX_CRTC];
> +       struct mtk_drm_private **all_drm_priv;
>         struct mtk_drm_private *temp_drm_priv;
>         struct device_node *phandle =3D dev->parent->of_node;
>         const struct of_device_id *of_id;
>         struct device_node *node;
>         struct device *drm_dev;
>         unsigned int cnt =3D 0;
> +       bool all_privs_found;
>         int i, j;
>
> +       dev_vdbg(dev, "Populating private data for all controllers on ID%=
u\n",
> +                drm_priv->data->mmsys_id);
> +
> +       /* Avoid variable length arrays and allocate an array of pointers=
 to privs */
> +       all_drm_priv =3D kmalloc_array(drm_priv->data->mmsys_dev_num,
> +                                    sizeof(struct mtk_drm_private *), GF=
P_KERNEL);
> +       if (!all_drm_priv)
> +               return -ENOMEM;

mtk_drm_get_all_drm_priv() returns bool. Return false here or change
it to return an int instead.

> +static void mtk_drm_set_path_orders(struct mtk_drm_private **all_drm_pri=
vate)
> +{
[snip]
> +                               /*
> +                                * Paths are per-output: set order for th=
e new output
> +                                * by finding the order of the same outpu=
t number of
> +                                * the previous controller and incrementi=
ng it by one
> +                                */
> +                               src_path =3D &src_priv->data->output_path=
s[i];
> +                               src_order =3D src_path->len ? src_path->o=
rder : 0;
> +                               if (cur_path->order <=3D src_order) {
> +                                       cur_path->order =3D src_order + 1=
;
> +
> +                                       /* Order found: check next CRTC n=
ow! */
> +                                       order_found =3D true;
> +                                       break;
> +                               }
> +                       }
> +               } while (!order_found && max_iterations--);

IIUC, this only works for up to a 3-controller chain, which needs at
most 1 update (0, 1, 1 -> 0, 1, 2). When there are 4 or more
controllers in a chain, it needs at least 2 updates (0, 1, 1, 1 -> 0,
1, 2, 3), but the loop stops after the first update (`break` +
`!order_found`), leaving the orders as (0, 1, 2, 1). On the other
hand, when no updates are needed, `!order_found` spins
`max_iterations` times unnecessarily.
We need a loop that stops only when no more updates are needed, i.e.,
drop `break;` and loop `while (order_found && max_iterations--)`.

Regards,
Fei

