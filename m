Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70715606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lGlRXRJE;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=joXyrqcd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aPAOj8/sEiImf5Q5w0lmK7mWVF1uN6/NWzG/i3miSOs=; b=lGlRXRJExqN6Dx
	r5D80k+MxDcKu3TYDIHblfhnZjUh6R7jIYcsxfWhCIO3I8N6BnRkz0Qq14LgeMaInpupJTbZXxwGJ
	MHmkB+n9QRTzU5NwGJn54J+aaSi3iSbHqsiNaljE2rWBI1jbwwOvyCcJvDBBZVe39ZK5AEI3tZ9T7
	+9WuFA65h0/B+jgQ7glhOq1VVjBtKy/Mu4UYbA/a8KGnBKauLDQ2JDfzUNVlGUpT5inlwMwr0FXaN
	TS0r6ECVXXrOPOjLxVX0qJd6m5RdHWnkiaCj2VuyfUoF5Nfq5Y7yVmKQNOt4giSeCrWsATMa/+FMP
	l++NLpi4ur+LPgxHi35g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWNK-0000000Chrg-3RGd;
	Thu, 26 Nov 2026 10:06:47 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWNH-0000000Chr2-2sJ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 10:06:44 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-71ac9e15640so4313954eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 02:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795687602; x=1796292402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aPAOj8/sEiImf5Q5w0lmK7mWVF1uN6/NWzG/i3miSOs=;
        b=joXyrqcdJG6xP61FoqogdEzUWaH5L1TMjFTZza67KNsB1/QNEVajwu6U4KCXUNwqOz
         YVlDbm88aLvLNqyrSRKmjYiDUD1rqgriKDm86F68eFVeykxnkgYpCHbCZsHcdAz/eaJT
         CBwJ73ZQakKCNwy2NoDySa+XGjXqxD5C2vTx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687602; x=1796292402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPAOj8/sEiImf5Q5w0lmK7mWVF1uN6/NWzG/i3miSOs=;
        b=0NwgtOhumBBNYjCfIbkB60zwXV/OIesMlAHoTK+7X5hPq9fpHlwP5YSHITSfg+rMkx
         ERGumZa+k9dWKBPH7/G59ys0rsHBkrhYXnb52lZxWthlOUumk1swm/FnfluibNkXZG05
         gkda55CuKLuTdVAdl0qDOXLkweGgksGa+WJTWDSeBEsPFVes16wkY9jZX4DVcKksfamj
         DDi5hPD4FU0OxWTw7GfcURWsZIy98alPTH+6FL03vY3R1fTGXrzl2eVmyMux8EXn40Me
         ALg4dhlFJoNYw6jpRE+MWzqbqWzJdKeXc+s5Gu8WuY9by/RSAeFaomE0zs2ulwEg+W0u
         5LpA==
X-Forwarded-Encrypted: i=1; AL+hErGrLoVFgHcB8CmiQjXTA+Z6NTO/s4ZtdyS++A0p2P8KQF3eMdPHPTm+9rub5M9hlEYLqoGXfsruTrNjyJnl1KFZ@lists.infradead.org
X-Gm-Message-State: APuU4Z9jS30vWutqQjlQik7KI3XM420Idbvr0d52cCI5qyWHEt2OyODd
	qWObjFimQAuvNhkphnVya37+mf+85870o9EqsILpWbb33XYO2gKBGoe35ZnR3gMLzukLT6Q9Pac
	LQzmrkg==
X-Gm-Gg: AZFdTZc5ru1lJmJeXA+4vWDnncg/W7tGutRlmDxHCs4Qoqfg3iD6NtCsbLJ3aALD6nv
	Y5i5yyGwvEyXOLuKXPe/fUcGxQ+vBsRGNs6D/dEVkFEFYz7NkLNWgYI+O3eSxtx0gfFimp38gh/
	FE1zLgX/NZiM6Mn/jEsuO6GCboB/RNCbco8vB0p2d75OhlafU18TW+U7R9CQ3bCdrmowk6Rhumu
	+xr8q9VCtrl00z6DV2nyK00OWfkHR5DeN2lh1pp1dz7yUH+j2Ducfm4BvPmc1gjk8Qo88od6LgE
	SUS10SqTWjbpBQAhASptcumygEtNb58ZD9KmaAE6nRGqsJaRHWNxejT/eRSb1O3f8Vz4Q9enftV
	PA+J4wDxQYkEX9wLWZXS63P70w1ZtT3cLOojWwybceH7e+kOj/W9yFPLBxlXbX/dxF++YVvH+dr
	DwOCwqoUI70xT6Z5HIgzniQUcM+HMIpnWhieT7R56f6stYxsstp+kkCmY0aSbvzH/QHTnOwJj6n
	fb1Dco4dOnPYHClM//XIyZHj3dVFb0FGpHvz8yDjqRt4anKpy0LM+mYwKAycufoVE+rT6Yghnhh
	deubm6CmkAlkf3vrj/RAa30rpbziXWra+5xrIni6gcke+wjaNIXy/RVPf23rdku+
X-Received: by 2002:a05:6809:707:20b0:57e:581f:f2df with SMTP id 5614622812f47-57e581ff321mr4389555b6e.3.1795687602543;
        Thu, 26 Nov 2026 02:06:42 -0800 (PST)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60497300sm19550963fac.11.2026.11.26.02.06.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:06:42 -0800 (PST)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71ac9e15640so4313949eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 02:06:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFL2NV0hA47XOGDeHJR7QnKM4f56kt6FTEIZDyPGkgpAhRZlvlOF8GH/kNdaTXGIC4AoR0s9ftlcLgzmS1kYAxq@lists.infradead.org
X-Received: by 2002:a05:7300:e9cf:10b0:386:e571:4bb4 with SMTP id
 5a478bee46e88-386e5715040mr399450eec.13.1795687269562; Thu, 26 Nov 2026
 02:01:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-36-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 18:00:31 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj8rJ0WJp7DcO68zyejSvzFhhB5Q_q+_jKY2itMAJ64eA@mail.gmail.com>
X-Gm-Features: Aa3M54r8mZgCPYkjyk_HhGWN4kbWoWQVSbV0f4Pj7KzdyzjM_U47c8LDiim4nPQ
Message-ID: <CAC=S1nj8rJ0WJp7DcO68zyejSvzFhhB5Q_q+_jKY2itMAJ64eA@mail.gmail.com>
Subject: Re: [PATCH v2 35/46] drm/mediatek: Add support for Display Output
 Processor component
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
X-CRM114-CacheID: sfid-20261126_020643_751438_0A1687A4 
X-CRM114-Status: GOOD (  15.34  )
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
> Add support for the Display Output Processor hardware component,
> found in the MediaTek Kompanio Ultra MT8196, Genio Pro 5100 MT8894,
> Dimensity 9400 MT6991 and others.
>
> This hardware handles the post-stage of pixel processing in the
> layer overlaying process and is also capable of performing gamma
> correction, ensuring that the per-pixel values are within the
> expected gamma range.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile           |   1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c     |  14 ++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++
>  drivers/gpu/drm/mediatek/mtk_disp_outproc.c | 247 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   3 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h      |   1 +
>  7 files changed, 281 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.c
>
[snip]
> +       priv->irq =3D platform_get_irq_optional(pdev, 0);
> +       if (priv->irq > 0) {
> +               ret =3D devm_request_irq(dev, priv->irq, mtk_outproc_irq_=
handler,
> +                                      IRQF_NO_AUTOEN, dev_name(dev), pri=
v);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "Failed to request=
 irq\n");
> +       }

platform_get_irq_optional() can return error codes that need to be
handled; otherwise, mtk_outproc_bind()/unbind() will pass the negative
values to enable_irq()/disable_irq():

ret =3D platform_get_irq_optional(pdev, 0);
if (ret < 0 && ret !=3D -ENXIO)
    return dev_err_probe(dev, ret, "Failed to get irq\n");
if (ret > 0) {
    priv->irq =3D ret;
    ret =3D devm_request_irq(dev, priv->irq, ...);
    ...
}

Regards,
Fei

