Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC569606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CZxSvGJA;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Nz0KwmXF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CwowVZ3rKUKS7aekHm2EGIj95zoVj8ccIVxOo6VaL1E=; b=CZxSvGJAba9xXH
	tCuYsNLulhwaZZ2qc16b0qNUmdX00SDc63Lwu991FS5tX/9pjgpeG5p08AYtHqP6GpiU+2IO3i1Ii
	6ZH6ef7dwV6iDBlxQ8XMIgz4CLqegj3JjGdGGCjo+kZUYexokUyFdTdLi22RYppAkbt5GhT56hp2g
	kF0WWcb1bxoHwotN+RaAHExI2m44K4aBBv68uiGtNJyTxT27QKfn27XWWbz8D6C9uDSk1dzH4ZaQU
	pY7kmKNiyZhnwPaMAPKbRmjxLLQXhAlcrMBzexO7d338Je3dBL3A8nUhyH6xhFqc7ad7qNL5GgJZ8
	YYVivxhtc7D8MDLwsBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWutg-0000000G2gR-4BGR;
	Fri, 27 Nov 2026 12:17:49 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWute-0000000G2ff-0rA1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:17:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so5006073b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795781865; x=1796386665; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CwowVZ3rKUKS7aekHm2EGIj95zoVj8ccIVxOo6VaL1E=;
        b=Nz0KwmXFUtHlLyTXwF2ot2/hFUj7b8Slk39K1y28ArQaPCBV2yovx+4SZ+nl6Y0Avh
         aT34Vi1BF8B/QHaTW9CuwsGUgyGSBo2PKzYP8oeF82uN4ogRY1NLRoQ2DWM9pWBAqqsP
         +CyRTN2m4DY/eIcv73wt2oIpNkYuzfMVeifLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781865; x=1796386665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CwowVZ3rKUKS7aekHm2EGIj95zoVj8ccIVxOo6VaL1E=;
        b=KUusnDKfqQx7P0vOOrTadyqAhxiNQNVuXwfU8g9GDxDBUG1NdpGYHBarVXM0UQRCn3
         EFu6lptk0JRPWJM1i4oxSTHJAeuekxZKb0iUbdO1sZshUeLGfgASpdG/dA7I/7DW6Duz
         m0oZu6+6AlcGA2cBuMpZXdlzqjIXPqApCBmXrJWhYN4ozdBmsqV7vAd7VJLgC0vrMRaT
         9qYuUwYTrQSWjAkoGbI6zSoYq+q++DtarZ70SRffvba3c8EB8gun4AYSEb+CD4tvZTTc
         HpoV7ryo2Shw94rE5IX2ASpyvzuG/b8vlHEUsXJ183+ZpYnGeuE8P2VFxtB+NdM7fz2d
         ScOQ==
X-Forwarded-Encrypted: i=1; AL+hErGLvmpocJP9suwEW0MAMUm/BVme5CXF8MzRfCgbBJoeCjuBkNt1xZEoOCHjakdDHsSKCcKGUGr8iBuGPctvjfRS@lists.infradead.org
X-Gm-Message-State: APuU4Z+xrPnp1VuFYsQrmtMHzCYmDe9E6gusyheFX4EwJ+TJqPYTtC3U
	X1TB9FZ3FqhJOJd5NVJ25JxEXm5m4Zg/t2s8imf2GG3vKCqued1wPcpFXOkDyrvKqj3gHtrQPgu
	R3nPaHw==
X-Gm-Gg: AZFdTZfrT4FaeSivdBjfCKmsJs8M+/Ommi10gYvR86uD2HDiYNSzJ9G8ZzYWrMehN92
	zChCZdJG+BWvMrX0GK2sTnlHEu1wzZ6qMC2/CEWqsBTI5h3dJDAwigSX7fWIEKEL6d4EahefoIh
	I1Qvgcs+X1z244npYifcWs8HV8Is7r/hjSU5YO1O56UVypWLOjWd+jhdGdp6E8Q8x1cY75Ugth5
	ICXwV5JdM5KxHHstdMGIuu+2yTzfoefwioQrjYnfwlX9OhXVM/uDiTd4ImwSONkvffxMiQw7OQJ
	UW/D6gMMFaYjPn0Zd0Nf54Zbr1sgS6AcxnMGNSP2CfM4B7i9zh3DMI7z9Mn8rUfX/nw8BjrrstJ
	jVn3WY7S/QlTCObIPV/SpmdqJL/rhykOk416Mg73jylR0aFIuyg4fg7v0KuaEVT6KxO5WFgWP4p
	O3Z1ArbpJwOaLA4Iy5EuO1qo70YlPTnIsPFCAMS+km7BOdARVOI2PHP6VCIr81mG35k61fkJFDj
	r/oQ4oKBmJHRTPT2GaqJRElP4bGn9lofEkH55T5gaRIbqLcxrC59qfAr22xtRMzZ+VxksMmMI0m
	Snexe3PZAgm3vF+FDZbaKQic2kOyGwbTW3vnpz9nOJDrkO9neF0lR97H+j7JUKi4aPc=
X-Received: by 2002:a05:6a00:3d12:b0:899:465d:c8f4 with SMTP id d2e1a72fcca58-8c87b4ef800mr24260007b3a.14.1795781865182;
        Fri, 27 Nov 2026 04:17:45 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b889sm12577420b3a.42.2026.11.27.04.17.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:17:44 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38644aedba1so12073615eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:17:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErESmLZsF4sjZVuy2xnylWJY77Deg5ri24enaq1va6h9G/IBA/GOijbRy7LdFnesz4baMFbelegMlAnYUfXvJYOT@lists.infradead.org
X-Received: by 2002:a05:693c:83cf:10b0:386:b526:24d1 with SMTP id
 5a478bee46e88-386b52638e1mr15336839eec.9.1795781862885; Fri, 27 Nov 2026
 04:17:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-44-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-44-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 20:17:04 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh0FpfDy8VqHJA=+bBtqZF1K5FYWF25pL1sAi4Q4MSSkg@mail.gmail.com>
X-Gm-Features: Aa3M54pcv7nTzvpglkL8e2ZqGsoE7ZtTuNgXg7WMfrQxU5jsZk3Rpl5MWtMoFKo
Message-ID: <CAC=S1nh0FpfDy8VqHJA=+bBtqZF1K5FYWF25pL1sAi4Q4MSSkg@mail.gmail.com>
Subject: Re: [PATCH v2 43/46] drm/mediatek: Add Two-Dimension Sharpness
 Processor (TDSHP) driver
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
X-CRM114-CacheID: sfid-20261127_041746_241123_7A7CD9F0 
X-CRM114-Status: GOOD (  18.43  )
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
> The MediaTek 2D Sharpness Processor (TDSHP) is responsible for
> performing image sharpness adjustments/enhancements in a display
> pipeline.
>
> Even though this hardware block supports adjusting the luma and
> contour 2D histograms, frequency weighting, luma-chroma gain and
> others, this only introduces a basic configuration which allows
> to bypass TDSHP processing in an effort to forward the data from
> this block to others.
>
> That is necessary because some components cannot be connected
> directly in specific pipelines; for example, in MT8196/MT6991
> pipelines, when Display Resizer (RSZ) and Color Correction (CCORR)
> components are required, it is necessary to pass through TDSHP as
> direct connection between RSZ and CCORR is not possible due to HW
> limitations.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile         |   1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |  10 ++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   8 ++
>  drivers/gpu/drm/mediatek/mtk_disp_tdshp.c | 167 ++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    |   3 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h    |   2 +
>  7 files changed, 192 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_tdshp.c
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_tdshp.c b/drivers/gpu/drm/=
mediatek/mtk_disp_tdshp.c
> new file mode 100644
> index 000000000000..31f57c567137
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_tdshp.c
[snip]
> +void mtk_tdshp_start(struct device *dev)
> +{
> +       struct mtk_disp_tdshp *tdshp =3D dev_get_drvdata(dev);
> +
> +       writel(DISP_TDSHP_CTRL_EN, tdshp->regs + DISP_REG_TDSHP_CTRL);
> +}

mtk_crtc_ddp_hw_init() calls .config right before .start, so this full
register write overwrites and clears DISP_TDSHP_PWR_SCL_EN that
mtk_tdshp_config() just set for 8-bpc pipelines.
Use a read-modify-write for DISP_TDSHP_CTRL_EN instead (or drop the
redundant write here).

Regards,
Fei

