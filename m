Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172CA606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 03:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DpU0KbyG;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=FmQsKe3T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hsA+0+anSnhiXg4sK9xBWSI9juDNDjs8+QiRi3lljks=; b=DpU0KbyGFuR94M
	Jj56RAZ2bikmbRLO7Iw4zLq9Skby304vum8UuG1ppluD7AhvmeFEku8xSr5de1srdHddL0lmitANd
	SqRuTvW0bKK7uDdDPy4K/uapnmoiLO65GyvJzKR4U1U6GAJmPf7PZpXOqo5jVQHZ2Mk4kaDh6sLGc
	2tk4cSKftsnEpN8JYW6AP0MzegmqaRDvpTDu+34dYzbOrlobbWWde9A102J7yeUBJm6SzSE2x6PxW
	xgZQ0XIbIJZVK/HWs+lZRgJBMALMI6nXJLpAsG6GuvrliEBKuAJ1+/7HNLvj+1GfEXTYTQCg3F2ey
	Z74fEoNr4hnxIai9AkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRiNy-0000000Bc51-3lU4;
	Fri, 13 Nov 2026 03:55:34 +0000
Received: from mail-m81204.xmail.ntesmail.com ([156.224.81.204])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRiNv-0000000Bc4B-34HC;
	Fri, 13 Nov 2026 03:55:33 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 548920358;
	Fri, 13 Nov 2026 11:55:25 +0800 (GMT+08:00)
Message-ID: <956a66b3-095b-45a7-826c-a0090bfe3cbb@rock-chips.com>
Date: Fri, 13 Nov 2026 11:55:24 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] drm/rockchip: vop2: Keep the other LUT_PORT_SEL
 fields on gamma LUT updates
To: aiyengar1990@gmail.com, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan
 <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-8-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-8-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d30bc19e03a8kunmbad58f1d5ceec
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkNPVktMThlJS0gfSklIGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FmQsKe3TLHHJ/eXUlwz2NqtJQMY2ZUa/knMnFvh4LnMw7d1Z7PiWMKUXXtVJj1A3dV4xhvsWYzAGkwIhHgLddIWrw6saWgW7mUOvmJg3JzevpZ25aHz0yLoVcO/gZVaRrH2wRqEz24j87YY34O4Q7HD0/P9m4eiSX0FhzJRz0JI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=hsA+0+anSnhiXg4sK9xBWSI9juDNDjs8+QiRi3lljks=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_195532_095235_EE636924 
X-CRM114-Status: GOOD (  13.62  )
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

On 11/12/2026 4:33 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> On RK3588 the gamma LUT of a video port is written through a window that
> GAMMA_AHB_WRITE_SEL in SYS_CTRL_LUT_PORT_SEL selects. The register also
> holds the dclk source selection of video ports 0 and 2 and the enable of
> the video port 0/1 merge for modes wider than 4096 pixels, which writing
> the whole register clears.
> 
> Only update the write select field.
> 
> Fixes: 4f537776340d ("rockchip/drm: vop2: add support for gamma LUT")
> Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index c59e270739b6..259e30ebb9cb 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2015,8 +2015,9 @@ static void vop2_crtc_atomic_set_gamma_seamless(struct vop2 *vop2,
>   						struct vop2_video_port *vp,
>   						struct drm_crtc *crtc)
>   {
> -	vop2_writel(vop2, RK3568_LUT_PORT_SEL,
> -		    FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
> +	regmap_update_bits(vop2->map, RK3568_LUT_PORT_SEL,
> +			   RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL,
> +			   FIELD_PREP(RK3588_LUT_PORT_SEL__GAMMA_AHB_WRITE_SEL, vp->id));
>   	vop2_vp_dsp_lut_enable(vp);
>   	vop2_crtc_write_gamma_lut(vop2, crtc);
>   	vop2_vp_dsp_lut_update_enable(vp);
> 

Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


