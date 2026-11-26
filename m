Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F043606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mWwl3wcq;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lbNr946o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YJ7q/+GsupT2Rad40vkEUvwwqt01kPVk/F4EqfpxWnw=; b=mWwl3wcqbcQiIh
	mcTXv+kKgFMlpxHQYKfwqu2XhlxUreH8i9WqR0x3I1Hv/m55ZFljHeD5AaSyF+Eegnpo5XeCwys1W
	rs9fWezKRJsCWso0queL6Sv1u5eIeE+kuQi8BauyuJsbz10xzwBeKzck7OwUxuozcaJUU5M5xVQqJ
	sHf4ViBOZikhm0Er3TPpYXDUy3RagI3OSYEMXhvzy2slzstqCZgff7EpMi+lVwgjk8IrzTt44XVy9
	WF5t7VR2MB2aANSgftt2TgghIfRtw9Row5uG2CQ3o97HDwaOhOurwsM2GCE5wpXiYdbpBGgxa1rOZ
	1wNW6GQacHgjey6RCyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVcT-0000000CVoY-1GHW;
	Thu, 26 Nov 2026 09:18:21 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVcP-0000000CVnt-021x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:18:18 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso3923662a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 01:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795684696; x=1796289496; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJ7q/+GsupT2Rad40vkEUvwwqt01kPVk/F4EqfpxWnw=;
        b=lbNr946o1wChS9iD7ZFg46V7eP4DYz10cua5/jV/B8Y3Owztud4VgQ4zFAqg74JRXN
         CxaX/GxQQHTXH83rGjV7+Dd+OSRgCX+N/Zd1WOP/YTeGhDE84+XpLJ6tRK0p7Ux0DuZj
         SW0RQssInNy7Z8ufwhdkXYY2Bt7Uqw3AJUr6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684696; x=1796289496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJ7q/+GsupT2Rad40vkEUvwwqt01kPVk/F4EqfpxWnw=;
        b=IcUc1G7dMJmACARraz9mveBaksWJJh1bRgBsc4qzZ1oM2SLSPGkZ36quErWWE8ST21
         Q52ZfcHY0Qi2TsslEEVPv5oFnMPD4ucRyG8tm9Nf7bjZclfjCA/czbGLp5dMFIETQNsQ
         aa3epEq95JYUW39Si/1nN7dU6aHAO1lG426IQr/D3twFv7JP0sz/6wcoBsLraq/6oMms
         rJ9A4nPreQxP7uWSyO59YR3PKKJF2q8/pBIjH3DCgcn7cK6PJLPytZrRIuxuvcXz5bUA
         anz46jQh6gJO+7Ak9i1ffLBPOm6sBCcrAELvJCy3ACA5//3+7HfZxt0/o2WabVcWg027
         lTEA==
X-Forwarded-Encrypted: i=1; AL+hErFUTHi/JJN6SK8E8Aea6kwCiuJJW/8XFHWMo8vt7+fLevC02RSBwd09uus1kA0LWVSkKk/29Y/EZjIQUF13xPjI@lists.infradead.org
X-Gm-Message-State: APuU4Z+Is7PGLNt9w5fC8o98xUVPK1TOBJGV5b4nqZY9mPzpLSHJJCRD
	hGbwSkf+fA8+ZO1Fk//XJWdEI0ah41Fykjkl/iKUtyQtbx7b5BxkcPtMTA4tf8EZbpqlSUTYBFG
	dspg=
X-Gm-Gg: AZFdTZfUoD8xSDVzjfuHZpHBN2EQyW+kO6eQMA9LflpwX/vdOkr6/rZE5AscCW/C3so
	4CDFLki18bQis2wt8IonPpHjhkgs0Ylf66km4XzQgGHjk0sQSGYubBFAhq044b5QpwdDzDfdMjO
	OnUEKVDunXGXHVR6731inLcOnkuOWg5sVkopIXCQWSWFIQv2cF/aYlFSgL+nvbAfM1uiDdTMvSE
	Mb6319UASuP6N5BraH9dmop7Ok6z9HIXmUumhyzG3QpYYeu3GuZbpTZtZOh4nGfrnd8dIlGxNMA
	cP8W5+9COPPRPFTFXhswJ6J/VIuDDX8cSugBXEVLfZarpztu6cABcsBe4avEo/Vam7ZbiRU3xdm
	nlSb2ZyS2r047l7hcA5dNaQdIeAfOWydOCeepgIl9iO6B6Lzg+goWOmpPn2PZLfN0rfizu6cuhU
	tu3juK9FMNL5oMQ4Zj89bVTK3VdqVXjDEA39Gx9hk9Kw/zyaM3VePkp6/pW/K+2pDVL++pkb29i
	dPFw0VBamso3hKBtxYabZ5O20/vV3ZWsyJTN6XPE6YQ5n09uRq7Ot64NPs6YQMvQSuMxIj1HZIz
	ElPDjox2A7TDo/s7sRbS86FpsBvaSxaBWYDfSL3eryO+1FYfOSG9wDMRmVwy8bp44xc=
X-Received: by 2002:a17:90b:388c:b0:3b4:1c0c:6863 with SMTP id 98e67ed59e1d1-3b41c557600mr20117041a91.0.1795684696292;
        Thu, 26 Nov 2026 01:18:16 -0800 (PST)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com. [74.125.82.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0818c1sm10455047a12.30.2026.11.26.01.18.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:18:16 -0800 (PST)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so2092184eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 01:18:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErElaXkkDWv5kKJgiA+s1IKUpDkA8C7jr632fiSWlU8va0tDlSZGRCsjByDPsFgVEnfcM65sw96yXIPhBlchuP7P@lists.infradead.org
X-Received: by 2002:a05:693c:8859:b0:386:b826:3f9 with SMTP id
 5a478bee46e88-386b82605b9mr10045446eec.7.1795684694765; Thu, 26 Nov 2026
 01:18:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-23-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-23-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 17:17:37 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhLFoHcCCPT8KzfeGR=_FE_-WXXjttWL8N9j5RyXdbdTw@mail.gmail.com>
X-Gm-Features: Aa3M54qPRICfCIh7RUjjGiJ_0TC4b-0YY-WXywPDgZZ0L82ERU6OYtXByrL3V2k
Message-ID: <CAC=S1nhLFoHcCCPT8KzfeGR=_FE_-WXXjttWL8N9j5RyXdbdTw@mail.gmail.com>
Subject: Re: [PATCH v2 22/46] soc: mediatek: mtk-mmsys: Migrate to new
 Multimedia DDP HW indexing
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
X-CRM114-CacheID: sfid-20261126_011817_110173_501BB1F4 
X-CRM114-Status: GOOD (  22.52  )
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
> The mediatek-drm driver is ready to switch to the new Multimedia
> Subsystem Display Controller HW indexing.
>
> Perform the switch by:
>  - Adding new "from_comp_inst" and "to_comp_inst" members in the
>    Multimedia Subsystem HW Routes structure (mtk_mmsys_routes);
>  - Changing the MMSYS_ROUTE() macro to use those, which performs
>    the migration of all SoCs in one go (as all of them use this
>    macro to declare their route entries);
>  - Adding new mtk_mmsys_hw_connect() and mtk_mmsys_hw_disconnect()
>    functions, making use of the new HW Component Type-Instance
>    indexing.
>
> Unfortunately, this change needs to go along with the related one
> in the mediatek-drm driver, otherwise functionality of the Display
> Controller will regress.
>
> The only way to make this possible in two steps is to duplicate
> all of the routes structure arrays for all of the SoCs, which
> would result in a total of around ~1200 lines changed twice, and
> that ignores the big increase in size for this driver during the
> migration process so, in order to avoid useless bloat, I opted
> for an inter-dependency between the two changes: mediatek-drm
> and mtk-mmsys.
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c       | 99 ++++++++++++++++++++------
>  drivers/soc/mediatek/mtk-mmsys.h       | 15 ++--
>  include/linux/soc/mediatek/mtk-mmsys.h | 16 ++---
>  3 files changed, 90 insertions(+), 40 deletions(-)
>
[snip]
> +void mtk_mmsys_hw_connect(struct device *dev,
> +                         enum mtk_ddp_comp_type src_type, u8 src_hw_inst=
_id,
> +                         enum mtk_ddp_comp_type dst_type, u8 dst_hw_inst=
_id)
>  {
>         struct mtk_mmsys *mmsys =3D dev_get_drvdata(dev);
>         const struct mtk_mmsys_routes *routes =3D mmsys->data->routes;
> -       int i;
>
> -       for (i =3D 0; i < mmsys->data->num_routes; i++)
> -               if (cur =3D=3D routes[i].from_comp && next =3D=3D routes[=
i].to_comp)
> -                       mtk_mmsys_update_bits(mmsys, routes[i].addr, rout=
es[i].mask,
> -                                             routes[i].val, NULL);
> +       for (int i =3D 0; i < mmsys->data->num_routes; i++) {
> +               if (src_type !=3D routes[i].from_comp_type ||
> +                   src_hw_inst_id !=3D routes[i].from_comp_inst ||
> +                   dst_type !=3D routes[i].to_comp_type ||
> +                   dst_hw_inst_id !=3D routes[i].to_comp_inst)
> +                       continue;
>
> -       if (mmsys->data->vsync_len)
> -               mtk_mmsys_update_bits(mmsys, MT8188_VDO1_MIXER_VSYNC_LEN,=
 GENMASK(31, 0),
> -                                     mmsys->data->vsync_len, NULL);

The refactor drops this vsync_len register write block, leaving MT8188
VDOSYS1 unconfigured.
Is this intentional? Otherwise please mention it in the commit message.

Regards,
Fei

> +               mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].ma=
sk, routes[i].val, NULL);
> +               dev_dbg(dev, "Connected %u-%u to %u-%u\n",
> +                       src_type, src_hw_inst_id, dst_type, dst_hw_inst_i=
d);
> +       }

