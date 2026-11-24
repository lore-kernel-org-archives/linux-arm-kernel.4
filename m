Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF83606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 14:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f90HW3g4;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=mMQuqSN7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=; b=f90HW3g4I8VMzzSyVJKDmx21QW
	kIW9kbqzbIXMPkr+CFgpGQNDlTdXzLmOxMqtuW4KKoGvCNHFaGmDdnUjPgW/wOamen3pYN2rzZyOg
	1wqoIC4TxJ5YmzjJ/+Grpo+RpJ/kU3xfHSKxSIWhNBtkQ7dLcIOPd2aFFP7XYm4QspywXCw/Wfl+t
	cOH+iV8oAAfJOJ9NM6sPv1BeJK+0HpCIzh6Mzs1TgO3J66csE2gHKvTwj3Z8ICEVPVx+nDaxkb2iT
	iwynNL3n9O9kNQqk0o+Dpn5KvdgByR/mUFwpC7krgWGY1WvT7bz3U92FmaBNAXg5eBUiy76h+aoG4
	G6ZQKNcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrad-00000006lkk-1LXg;
	Tue, 24 Nov 2026 14:33:47 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVraX-00000006lf7-1lMO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 14:33:46 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so2448764a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 06:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530820; cv=none;
        d=google.com; s=arc-20260327;
        b=HcqAig3lF6RpMlIGUTS5mPUuJ/0gj5S6R7J2eMAD+nO65A8tMlSc6xLQTRDjtvNGmV
         6Ej00rrWu3gKk4D9Z8XjWD7FruvuCvXueue2iR0IdqSNeQcfZ1ul8EDPu+hrR7JxnL86
         cnccB0JEDkyK/3HKm7lDuq7dCq+s61tydJiY96y8a+OUfc3b4p47nXROIW/rlHh3iTTb
         jvxfknlzCf15GoEyOT9A5dV0Bx0PR2sEWuACcxeCY0z4E+DRIUN59X1HXmz96cWza40B
         RIPIQ4EpHTSgVQjeaPVCxJe7QSmn43y6XE5ri+vaf496vjMUTIZfC03tlfS8KL1dYxEZ
         0Xjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
        fh=ddDCl1ePM6qkS5Ya/kKsRxdrZF2pZBjefmwmL9arot4=;
        b=iUjyww3+97o3ZccKPz0H67xnUYoer1WWE+JgEZ8aDv9Xgeo9L87nZaymwzA4UcLfNz
         mW04yhn6zEgdDFZlqRwZRqpN8uf/pgFJEJxfFhEMyz9eHnLizzstc7ydiOY9Du3uGId1
         4thskVbTr9jJYqftzLauxqb2Lln3d7nS1evUJVyK9KyD/qoEsLA74/rLLng+bU2YJyQg
         WgUyNdXtW7Bzu3uNa6PUdIO2loB0XkxYnMLy5eybVjxHR9BftGkuf12Dr/GqTunIqykB
         Kg+KXidZlXXGRc4xzqc36H1IFjNhxuZovMzoMs+kR1+uvhGb5MQYOkTBEi7jnVJhd0qz
         JsIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795530820; x=1796135620; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
        b=mMQuqSN70izrpDThpR/xN9G3phfFqgpqbgIBm903iNKu0M7qb0OpzppB8jfI0f+O45
         KmyeijsocxsQkS5LEAyvCAa0zvgo9sd4I5M8wrBpwafcojK2KY102wmnkihOb8QdOIzs
         PFLdYjWXW70NMWvDOxoM/8DBCheSihPs+3SzQ7Ad/UJ2wAOLaJrc1rrQIH0zvEVtzfgB
         Z+lJYSOkbrMv8Zt69vUSnBuBTMNmcwJODBGMMnM8zEmtkmK1XSkV7zhX8ekM/5cdo4CH
         PVIPOMMY6/Gp7zbtqPjbLlAolHLqcZ14+ahwoL5jE+01zhCpw2u8J0ViExYYX9732RA7
         3ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530820; x=1796135620;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
        b=GqlyK8f0W1Chnzsm/9/aDbJm8xTc8+rXBxawA6/C1Iq00WnOnRmeahV+jYlfXfOVp1
         dO2juyUVyxY0ABOa76ldDAUIlUOU2RUeZNsT23PgJau59panCDTJBitycX1D7hlUEGOs
         8qK+1SHe5uYeP/FSOLnd7qmbpchNkndzjZt+am+kOA1bSKgZuAPXp3Ts0ibQkJVv6C1H
         C8QQEX7K0+wQYOb64WqQmw92e9LVN7AtXcc96PWSx/vuyYNeICAknfcmouHhV1twRoAY
         kocPuEGZUZnuv/y2JqpX4WDY+uAqUh+CKM2P+fcby7FB1ZrtKw5GVrNuLrdbnILndWkk
         hWaQ==
X-Forwarded-Encrypted: i=1; AL+hErFuDwp1uMrUcujAJ0ddQBYOEkIeZetFCqmauTQBz6ikQaF2UUq0I5nbzAaSOFRbf8a2b2AtHJr0F/CX3p4vAmu+@lists.infradead.org
X-Gm-Message-State: APuU4Z/pALnT3LInC1ytMTugJuVdJX0hX+b8Rfv+DZvsZUgUzSc0LwVh
	C18SPpNr7ULEV1PywL+5SQm+e513kFFdgIHrCdWZDs+8MnTTskrNOXZR9rPwg2CVkk+qN8TT34f
	4AegX8ATLLzOOh4n5SYgK6bg/oQbSPqFt5FU8FS5ZGQ==
X-Gm-Gg: AZFdTZd0YyAEhDvi8BoP9VGUFhITiUq7wQuDjkS5Kp0TY0hEL0xWC/MOjW7oPpdPHRk
	CNRWEHJI68J/zkMqnJLz19/1pps4I8wBEziGncSMek3L546+ymo2l7+dkJkcecBFB4kyBT97GYO
	cGkRsYrJtOLudpvx9rDtlkRFX1mT8hGMnYSAQ/lwnKPxRGnqw259Cd7hN4RGFlU/KhakfNCwoEZ
	P09XMjOqlQ5jPsFq+k6ZIY31FIrFzBFCPR/DDPVb/5LaSXAXcrarg0gpao5icZ7XSfYvdhP6mEr
	wRY8wPuUjFL56cbW06FObOhQuejWHpXM4KWmK/39lGgPUp+MHO7ZJd0Yl+PzZdonkTlwI0gg9Zo
	QBGXrDrBWFS4nc4HPPtKNtVKatrEyo+fT+g==
X-Received: by 2002:a17:90b:2f8c:b0:3a2:b16d:928b with SMTP id
 98e67ed59e1d1-3b41c95aec8mr12847695a91.46.1795530820492; Tue, 24 Nov 2026
 06:33:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-32-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-32-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 14:33:29 +0000
X-Gm-Features: Aa3M54oxOcYmQorjTkd5D-GkJnjfCGVao0VGN1bH7KpMt9eEOWMLLFoUmIq_rhA
Message-ID: <CAPj87rMW6c0BMELjn70vsc+mkMxegDbSgQC-8BEDGspFyxzW2Q@mail.gmail.com>
Subject: Re: [PATCH v2 31/46] drm/mediatek: Add support for Display Layer
 Blender component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_063344_568091_C198349F 
X-CRM114-Status: GOOD (  11.08  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

On Tue, 14 Jul 2026 at 12:46, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> +#define DISP_REG_OVL_BLD_L0_CLR                        0x20c
> +#  define OVL_BLD_BGCLR_BLACK                  0xff000000
> +#  define OVL_BLD_BGCLR_RED                    0xffff0000

We probably don't need a #define for every ARGB8888 colour tbh. :)

> +void mtk_blender_config(struct mtk_ddp_comp *comp, unsigned int w,
> +                            unsigned int h, unsigned int vrefresh,
> +                            unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_blender *priv = dev_get_drvdata(comp->dev);
> +       u32 val;
> +
> +       /* Set ROI for this Blender */
> +       val = ((h & GENMASK(15, 0)) << 16) | (w & GENMASK(15, 0));
> +       writel(val, priv->regs + DISP_REG_OVL_BLD_ROI_SIZE);
> +
> +       /*
> +        * Set both background color and constant layer color to Opaque Black
> +        * (ARGB) for eventual Alpha Blending to be effective
> +        */
> +       writel(OVL_BLD_BGCLR_BLACK, priv->regs + DISP_REG_OVL_BLD_BGCLR_CLR);
> +       writel(OVL_BLD_BGCLR_BLACK, priv->regs + DISP_REG_OVL_BLD_L0_CLR);

Would you believe that this does not in fact need to be black, as it's
been configurable since 4c684596cde4?

Cheers,
Daniel

