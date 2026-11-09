Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0200606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n200QuNa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q8J8Ol6A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+KZfMQTyVl02e8ANbgPdMXZ52kWV3/1B9wyIuCkTXxg=; b=n200QuNaiklUIb
	ud8ibTLj6UGzuCVkB5dA8ebLJsPt72Lr+JKuyqC8kIA1EJqb/zrBz1R38qSW7TGBpifJeaNpL2OJ/
	FEux9vf0VXdPU8bMhUw2BanEHjN3XTBmRqKqpdYaad5N89y1MTCUu3nWrPRrJ5+yGGMnUV8nGZJxy
	D/iWUH/NqO0n3de53IWRT/yAibaytFj7Cxp/cDjipB99ENTrak0JkNawy4+7YcJF8fipZJ8GW3SYu
	ye43MIriwHQF68rfEQiZ59OGne6Zqdk7mD5LtNnmSG/lGeRsCyatDWjlAwhDnzqg38xspldTWEplm
	TLGhw7QGQAZmTf1yNQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQH53-0000000HJgw-1J8d;
	Mon, 09 Nov 2026 04:34:05 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQH50-0000000HJfA-2Ejh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:34:03 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c4ceaee6770so57898066b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 20:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794198840; cv=none;
        d=google.com; s=arc-20260327;
        b=Tghqk4oGhycks3HbVdfAW1Q6reJqy10osfJwWsQ8qdDcWE4yz7SmnbXR2ztkDOwC74
         uYVG/4g1JwLBc9iiZLJ9dYuhmpaNwebAvvv3VOkcv7qFjf+pToZ4f3vdzuPw0hQpzvVo
         P77dVLmF8w+tHMeOtZhFeHampREPkLb9g2Js3g3DiAVq5RyLxQFTUTuiBsEFsW/GmTuf
         d7MHOaByY1wrvxYyVbTBe+QV0l6BPv0drqhEDcp2q4VqL1aAWf6kUWeyYIA2IpS0p+LK
         7TLSoyu34u2Wz1BvjkA8nv1IpuhSus9goRdNsC3Y9nRQG9sRM8SGcuAEtru6vDEGh39P
         VE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KZfMQTyVl02e8ANbgPdMXZ52kWV3/1B9wyIuCkTXxg=;
        fh=AxR79RSfUB7JMHS8tZlnntVGWZLeBaTiJTDNxvvLSfU=;
        b=XskPx2/MnzDY0MkEWN1rmmlgDtbzLT5i4LxfnOk6OltwapTiwCR9+00LOFjE4xe/Wa
         PXDJLEXqbmyofsjgaBvaiPlluj/KjWcARHB47+s+AdvD1QTFZoMfTpDby5MV6Tg/ixcP
         TL/qzNGyBd8Xi8zF4cpe/9dzNRf7IJUNbMNb5j025HPzUpXMqi5M51aI7jywYbr9pluV
         p/IGi19wuv3Ja8erbUsa352DkkhjddR/R0F4vlwrBgmjPu2ZsaSOA4uEYSDS/b5lz1Aw
         AL6tHGr3vYId9KPFpmzmHnDp0YUNnNDcWkCIeWoIRxET+Vy4ddmLEAe8PybHbwEHEqRK
         ma3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794198840; x=1794803640; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KZfMQTyVl02e8ANbgPdMXZ52kWV3/1B9wyIuCkTXxg=;
        b=Q8J8Ol6AbPynRREcNO2dmnNLZUW0Lq/PsaSU53wWTO/mgdcu2FRJDyr9pd7SyCaV5Z
         cmrO0ByEvVQepuLu2YVZIE1Kim0RlAwYknxqLFdsla7FByGGB1PnII73Q0GR0xTpV9D3
         oScyfib110gfVq2gwtG6QNvN5mB5vknboqz3gjaY49Tj0gFYv86YY337ieZwpnkS/Tr5
         DwpMbMxzm6hFDgCns1uOLvZ6OPKhN6/LEvTOHfR4+MS6rC17DiP/iPNYiLZyB5oPBuxf
         4xgimdNC6bvyCQhboxZKutgl9arfe86gjqN9gnOc5vUkGso/93lMGBFmUfvn1RPZ/jEL
         zKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794198840; x=1794803640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KZfMQTyVl02e8ANbgPdMXZ52kWV3/1B9wyIuCkTXxg=;
        b=Z7D7MNex9m+pDSVCbPW1kcyGW4j1WvNvr/7ju22+3BM/WK9iS3Nz05MIoroyIH2MCX
         m1IJ5muqeaxrpjJMhJSUXgCuu51fW1/NzdQPfnlIvW2KyqYE6PgKzGRSq+kihvcAnQv5
         4XyeDi862WVF4uNDUu8zvRAxvKrVVtPDa9CGtXLMccCRC/4E1MzBgct86IbmwiHTnkIp
         /xkAYqd8x+MqJpEhSFbQqtL2eU2YfbVH3hOmH0qIOfFzpD2b1TtH/QcV544WsgKg6Jmu
         oul//QWGhPSQnku85RrLtXhSMdR3VQaAuhiAgmtqKbza78MbNxwBFdHLauJt/poOMRd+
         v83w==
X-Forwarded-Encrypted: i=1; AL+hErHtYznZKQY/ilJ14rFx40/SNKbAx23uf0hB0cyDGu4jXVVstqkf3jgjmH3aXRg4+R31wVhqk4YFz9IaInHc64Je@lists.infradead.org
X-Gm-Message-State: APuU4Z9djHQlcymuWT98mc2xxnqZcnQX8JmjpVj79czsjOpinDQuwI1l
	l8WGLiS7jvjzMLgPHj4p5G76wXwxP7mmvebQXgIToe2EXQPXYPHB2Dpr7SlgrmAC9Jnqi+gckWo
	PeVT1XvD+wLpl15TB8JAoULwH5uYUoOs=
X-Gm-Gg: AYBFou0FWuN9YWr2g7czIvm5u/E3HKmUtENBG9Motw3K51m6/B4cDvUAxy7Qi0EBRpX
	qkRM3vcFR5B9bHfxRPMnhyD40pnbnlmXf8gy057SkMMNdlozyNI4PQ31hVm/gucFwVZDGjhKccC
	hIWVGRlAjoS5fwsXjig+NpOM6xiih5Xt254H9ZlZhG0kqp8q34B4vIry9BxJUTET4d/T7i6F1Il
	UGhHnuDrJ73xmky3aN+GtJDUM6O77BFm3vYngqO+/0Wj1fmt6hNWAO4V3jKqfdJ/5dyw9eyj8Sh
	Yz+X1JPEoaXaCzPJlyYuMIcLgpomlTMwa0AglhXlQjravR1D5lGfwC48bSOXKCP/bbG9x40NCPA
	jdNMY36gmKeheC8PvXGnQhMwUP01mEduHkLAjDUR8unjtMA2kPysxP0Lgv6MDOwoO5Djja+hO0s
	7P647q1DXn7yiV
X-Received: by 2002:a17:907:72c2:b0:c2e:4292:d268 with SMTP id
 a640c23a62f3a-c4d6daf7c64mr226694166b.16.1794198840452; Sun, 08 Nov 2026
 20:34:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261005001118.576198-1-rosenp@gmail.com>
In-Reply-To: <20261005001118.576198-1-rosenp@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:33:24 +0900
X-Gm-Features: AclHuK8JGFlUXZkSE5CgvPvR5Q5pqnVQnyO-MTmGLdNc0lY8Yjx1OxeFaWmjmHc
Message-ID: <CAAQKjZObmQm1X28cbpjd+dEVx93wfBwKNaaaxpU08o8JeFaZfA@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fimc: allocate formats as a flexible array member
To: Rosen Penev <rosenp@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_203402_626515_2C920370 
X-CRM114-Status: GOOD (  20.97  )
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

Hi,

2026=EB=85=84 10=EC=9B=94 5=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 9:11, R=
osen Penev <rosenp@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> The formats array is allocated separately with devm_kcalloc() and only
> referenced through the fimc_context. Make it a flexible array member at
> the end of the context and allocate both in one go with struct_size().
>
> Annotate it with __counted_by(num_formats) so the array accesses can be
> bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

The allocation size, initialization order, and format array lifetime
look correct to me.
checkpatch.pl reports an error for Assisted-by: LLM like below. Please
describe the AI assistance in the commit message instead of using this
trailer.

WARNING: Non-standard signature: Assisted-by:
#57:
Assisted-by: LLM

ERROR: Unrecognized email address: 'LLM'
#57:
Assisted-by: LLM


Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimc.c
> index 09e33a26caaf..079d24d0671c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -99,7 +99,6 @@ struct fimc_context {
>         void            *dma_priv;
>         struct device   *dev;
>         struct exynos_drm_ipp_task      *task;
> -       struct exynos_drm_ipp_formats   *formats;
>         unsigned int                    num_formats;
>
>         void __iomem    *regs;
> @@ -108,6 +107,7 @@ struct fimc_context {
>         struct fimc_scaler      sc;
>         int     id;
>         int     irq;
> +       struct exynos_drm_ipp_formats   formats[] __counted_by(num_format=
s);
>  };
>
>  static u32 fimc_read(struct fimc_context *ctx, u32 reg)
> @@ -1273,20 +1273,16 @@ static int fimc_probe(struct platform_device *pde=
v)
>         if (exynos_drm_check_fimc_device(dev) !=3D 0)
>                 return -ENODEV;
>
> -       ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       num_formats =3D ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_=
formats);
> +       ctx =3D devm_kzalloc(dev, struct_size(ctx, formats, num_formats),=
 GFP_KERNEL);
>         if (!ctx)
>                 return -ENOMEM;
>
> +       ctx->num_formats =3D num_formats;
> +       formats =3D ctx->formats;
>         ctx->dev =3D dev;
>         ctx->id =3D of_alias_get_id(dev->of_node, "fimc");
>
> -       /* construct formats/limits array */
> -       num_formats =3D ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_=
formats);
> -       formats =3D devm_kcalloc(dev, num_formats, sizeof(*formats),
> -                              GFP_KERNEL);
> -       if (!formats)
> -               return -ENOMEM;
> -
>         /* linear formats */
>         if (ctx->id < 3) {
>                 limits =3D fimc_4210_limits_v1;
> @@ -1320,9 +1316,6 @@ static int fimc_probe(struct platform_device *pdev)
>                 formats[j].num_limits =3D num_limits;
>         }
>
> -       ctx->formats =3D formats;
> -       ctx->num_formats =3D num_formats;
> -
>         /* resource memory */
>         ctx->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(ctx->regs))
> --
> 2.56.0
>
>

