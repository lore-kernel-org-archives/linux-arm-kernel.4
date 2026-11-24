Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1FD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EseWGjlV;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ghR46TcC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=; b=EseWGjlVWWAWbfqLR+ikKZ9rkp
	ar42rNxnWi+p0aXgXCGpX9Yk2IFyKjd9HNUrgFxPUFhk1CIYr7+LD+8h106ZLKHCDzru+KXTJhb9g
	IS1bzbmMtkQ3xpHB/syyTM31Z7iMnWe/VZcUWfSNO4xnEBKl4Gerb4qOdgUqlBegIiwHMlOEStQFB
	RLqzlv6B5zxHYki4bHXizDG13v6vGIMmyIhPl+WG2RugrnpVP0MEO2T5Pa4RRU2jPwAXATOdWzE4Z
	KpFwWdGsDqbrcJ8AJIFUh5dRxBNU+BnZuzzuZRaZXH2CsoBlvzKxu73kEbSEq2QjWzqf1uihxlE5I
	k2KS08Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrXq-00000006knx-1qlL;
	Tue, 24 Nov 2026 14:30:54 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrXe-00000006kmf-2CbU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 14:30:53 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so1772364b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 06:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530641; cv=none;
        d=google.com; s=arc-20260327;
        b=Z64lTH+Y1OMqgb65LjEc6NyAR0FcdExbWpxyiwABItsW4a+2smXdRboLuRvG5oJ+lJ
         VH6fiwtc/I27WGzOMxpw1iO/uxGWliJdSF3hUCvuTn8F02Dzg86kx4A/wEZuz2lPykQP
         LE1gPvrO1FCeLrb/J47rlj02zikcH6hM4QNUPgjFQw6clWQySrOkkopM+Fe7cKZLk+Y8
         Dwc26t+JtQaCCg/80LAf8chtmxp+PV1Yx2jxfKH8RVIcBJNA7mOyzs9SFrA65/RrLyod
         XpxMqlrvxf+3sU6ZknfWz40nU6rbJDzfhGYd4YBW+8S9u8ymNbypVXPqGq81JMyyPhWF
         o07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
        fh=Vyig4QlvyjqT2Mjv4qS9FnLABqsNUVnifvA3fDSsBpM=;
        b=FEniexmVg7TMnVk7s0hZ8bIcHc08WNrN55clbBjhEfy9W4YV9uTw41Ry+Z1QUSd0LE
         AONTpAqX0JmjIP9/ks7uyVtf5QtNJ6BJOloJKFRlxVRrLbrldJf+t8WFWznClY/zGR7A
         Rx0ObORinm/mAenG597GyWu6tMaf885eHBhYHUahAev1WqD8J4ZsPGXTOctGuyF6bY+v
         hp/dhxXjDXcpFZTvnheldZhJ5kM6NMaQdVGaL0nuWcV23jhQ0yfSFDAidxU9fB9j+J1w
         TiLMeDT6I+WyexDM9X2i/6V+s0WzLxnI4DSpy2+NoPNdVjogSc72VhVS+2oldX3YCvm4
         asGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795530641; x=1796135441; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
        b=ghR46TcC8/7HLczdx5CqXQMMXZTbsy/vE//gfXmLkJZrxCupjqwgtrrOHa2xjsNvPr
         JsEJxiFO5ug8otb4gfce0OZfnFUTE9DrExn99ixPk9xLQPNVn38yfIeA83sNpkBQtQ5T
         9NjPO8HBcWyCQRilJCYM4t9MAAs81HKWk3j88z0xnudH5flv1WrC/7p9YmVuiWqhJibx
         d/W4y3Qk52e7k0dH2XA5pDR97hbfa4hBvqeH3GYGlHWHLYYeMjKPEdqkZCs0i+gYwUbV
         4lx1ZFott1mKqxms/JM5gpnntYMVM6Y5L5Zw0zlv83YTdevLBOcq6jsfLoAKlmkGkvlT
         +N4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530641; x=1796135441;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
        b=UhvLgWsZX1MztD5k2/HgYkhS2eiJBaVzvmPeUIPR2KEzMl2lqL9G5r8V5OpvmUXviF
         E/2gsGzP3TCpD7MuCj27mJppEgY0LrQ34wNKr3Jo5pcV2tT9r1mCgK+cM1Ro6EFUYUTH
         Y35tcIaJq5Z/5D+begaOAwEt0G17g4mEAzLkyNs6MgpRV7su5Ccfu22KciZLcjxxrgK4
         ygb+fx77qQdXI0YL5/WbK3QW0yCZy0j/GA/0mCUVLxTCPZP8vX38MI5D7VYKzLvm7nsR
         HMRiUey/s8eeKpKE2iGLnji1XFF9CvYgwM/pbyRkvyTjkcZrtLVE1qEl0cFsMaJxLdkl
         4LGQ==
X-Forwarded-Encrypted: i=1; AL+hErFpPaBbTGmNiuvQv3aDqt5XwBaXaEYM5O+SrBuwp/Z4ug/CcDz/9PN7Oqimr3eZhH/fB745c+iit3G6WPrHf12J@lists.infradead.org
X-Gm-Message-State: APuU4Z+nBj5n3N/pIOr++PDfSHD18GVSdlROBdkoyJeyzwddNZrz8mRa
	uNIEjOBT9Lg4B4uKOdWc63wrbl4Tyeen+lotoAoCcInoy+viPw4NxVnF3oBVngY2Pw13wlmAQMZ
	XuYAZyzMOgPthOxRmYuyGWCyx5NZw88gSW9fGeDSkNA==
X-Gm-Gg: AZFdTZdz7JyhfF9KYdalvc1kkSOAEvqyR1ZWHFiP3soaq3n2Qw1uvO5fIp82ol5a25n
	UmSz1sTMWUTVlOTocgNBzWiuGIZ8kaOkXnvNi0N7inaknuDTc5dnmSIi691dLZy3THP0OX9oQEE
	nEHKA6ops99zSWof0UZ9/P03dvzlALdDsraHVeD35O4+7wRWMDOi6HCifHu2ah3b8ioL0p97XnZ
	HaRAiN8rvKELCwY+lYdZOIPBreOsPXrP7R4cmhLpWVtjPrpLEVjKJe5aiYOLPk/gubZSp3FuoR9
	DZZa6nuobFsjwYCRM15Z59L91CxQhwkI3l0H/IlJr6DRxJbwTShXD40VVwSk0xaOhI42jn+9xC4
	wtbG5J81goQ3yNUM5xWr3jS5zZI6YOVHw0Q==
X-Received: by 2002:a05:6a20:2589:b0:3f9:797f:3869 with SMTP id
 adf61e73a8af0-4014d359938mr14437260637.47.1795530641542; Tue, 24 Nov 2026
 06:30:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-4-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 14:30:29 +0000
X-Gm-Features: Aa3M54oeKn_H5KtwYJP7Cgtm4lKr9C1ncfB30nHv_jvzqMcIUhZDyb3veHGchVg
Message-ID: <CAPj87rOEtG9JqJsEZkatqrWUkerO9Xx93MBUrXXChJwCokE0Vw@mail.gmail.com>
Subject: Re: [PATCH v2 03/46] drm/mediatek: Export OVL Blend function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com, 
	Paul-pl Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_063042_566488_7849A668 
X-CRM114-Status: GOOD (  15.44  )
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

On Tue, 14 Jul 2026 at 12:44, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> +unsigned int mtk_ovl_get_blend_mode(struct mtk_plane_state *state, unsigned int blend_modes)
> +{
> +       unsigned int blend_mode = DRM_MODE_BLEND_COVERAGE;
> +
> +       /*
> +        * For the platforms where OVL_CON_CLRFMT_MAN is defined in the hardware data sheet
> +        * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB888
> +        * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
> +        *
> +        * Check blend_modes in the driver data to see if premultiplied mode is supported.
> +        * If not, use coverage mode instead to set it to the supported color formats.
> +        *
> +        * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
> +        * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
> +        * will get an error return from drm_plane_create_blend_mode_property() and
> +        * state->base.pixel_blend_mode should not be used.
> +        */

This hasn't been true since 9813e158d13d. I know this series predates
that, and this is just existing code, but it's another instance of
'lie to userspace and fix stuff up behind its back' which we should
get rid of ASAP please.

Cheers,
Daniel

