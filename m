Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90005606A880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 01:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WqLIab6t;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ZbKwCsz/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m6W2wocIbscGTTWaMyKjxx5UOMRU4kUE2NYWM7aaS7U=; b=WqLIab6t4aVkkc
	OdYnR+Y4z+qRtwElyvRfkCpGMBsijNpLdbb52/hmLMVDZco3i4/O4gRUAUiWFS5dNZg4TOBPDoVum
	9jXUE85En57yg/oBWxl13U0XqV3G0fftmJpCZk+xZ4xY9cs7B0UaCeTg66UWeL3EW93hRQDTn15PJ
	p2RgsGfd3dqHXU2IV5zFLHeviONoWugxCYDiqMR4YPTKA7x1WWbw6iq7dDAros5zV07VMIUjFJqb7
	9oNfJmGyecpaRsG2/la7Rg30T+XodlgYMy2azKTbvsI7q+xuST4CeRzZcckyFvQ0uYdfLKTb7vZJo
	N1lYKKhhD0MrIxbe7ruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRg57-0000000BR0i-35cz;
	Fri, 13 Nov 2026 01:27:57 +0000
Received: from mail-m81145.netease.com ([47.88.81.145])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRg54-0000000BR0A-1h10;
	Fri, 13 Nov 2026 01:27:56 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5483a91d6;
	Fri, 13 Nov 2026 09:27:49 +0800 (GMT+08:00)
Message-ID: <380996af-b987-4854-8b52-a3a214b19e79@rock-chips.com>
Date: Fri, 13 Nov 2026 09:27:46 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/rockchip: vop2: Don't accept AFBC YTR for
 RGB565 on RK3588
To: aiyengar1990@gmail.com
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Piotr Zalewski <pZ010001011111@proton.me>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-4-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-4-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d284a02303a7kunmdaa9fb1ca15ba
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHR9NVkgfHUkYTB1LQxpLT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZbKwCsz/MFEdDyk8i8rLr6GhWB8rJpbpf0hG8dk//GrS4FwmlcjItkra2Tush2BzJQdOQwRFj0DYCG9CJdSBJzntnGr5vfNpTTC4qMxyIfA7qIfx/GLYwRl3Qu2CqAjQKF2BHVvJC4EItHyeCpW5oNTOvW700I60/HI92V8OWo0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=m6W2wocIbscGTTWaMyKjxx5UOMRU4kUE2NYWM7aaS7U=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_172755_290503_915ED6E7 
X-CRM114-Status: GOOD (  22.38  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Arun,

On 11/12/2026 4:33 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> The Cluster windows of the RK3588 VOP2 advertise every AFBC modifier
> of format_modifiers_afbc for RGB565 and BGR565, including the ones
> with the lossless colour transform (YTR). Scanning out an RGB565
> buffer rendered by the Mali-G610 (panfrost) with
> AFBC(16x16 | SPARSE | YTR) gives a black picture and POST_BUF_EMPTY
> on the video port, on every Cluster window, while the same buffer
> rendered with AFBC(16x16 | SPARSE) displays correctly, as do 32 bpp
> formats with YTR.

That' true. The TRM says RK3588 only support XRGB888/RGB888 AFBC YTR format.

> 
> YTR on RGB565 is also a questionable pairing to start with:
> Documentation/gpu/afbc.rst requires the R, G, B component order when
> YTR is used, with component 0 in the least significant bits, which
> DRM_FORMAT_RGB565 (B in the low bits) doesn't have, and the Arm
> Mali-D71 (komeda) only accepts AFBC for BGR565.
> 
> Stop advertising and accepting YTR for the two 16 bpp RGB formats on
> RK3588, so that userspace picks a modifier the decoder handles. The
> BGR565 case could not be tested (Mesa can't import BGR565 dma-bufs),
> it's rejected as well because the decoder is configured identically
> for both formats, apart from the R/B swap after decoding.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index ea8d837d661f..7c157f5c1734 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -404,6 +404,18 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
>  	if (vop2_convert_afbc_format(format) == VOP2_AFBC_FMT_INVALID)
>  		return false;
>  
> +	/*
> +	 * The AFBC decoder of the RK3588 Cluster windows can't decode 16 bpp
> +	 * RGB that uses the lossless colour transform: the picture stays
> +	 * black and the video port reports POST_BUF_EMPTY, while the same
> +	 * buffers without YTR display fine.
> +	 */

Drop this comment.

> +	if (vop2->version == VOP_VERSION_RK3588 && (modifier & AFBC_FORMAT_MOD_YTR) &&
> +	    (format == DRM_FORMAT_RGB565 || format == DRM_FORMAT_BGR565)) {
> +		drm_dbg_kms(vop2->drm, "No AFBC YTR support for 16 bpp RGB\n");
> +		return false;
> +	}
> +
>  	/* Different windows have different format/modifier support */
>  	for (i = 0; i < plane->modifier_count; i++) {
>  		if (plane->modifiers[i] == modifier)
> 

-- 
Best, 
Chaoyi


