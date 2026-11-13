Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC673606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vMOom5jM;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cux/RLhd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2yRMouvHM4a05izOhD8UAJhMpR/Nv3hy0kmuRjqTsS0=; b=vMOom5jMmjL13c
	YMhEK7GcJIi7czO3+jTA/6W5wipTLqV4jJ+X2dQqVqCg7UJJLePD7ltrwjxNnUYZg/GdoWQW7+S5u
	BJtnAx6zAYlvLkGiVaPHtiI/sjeoNToDjGYCGEHtqv8WxnpuGWFAYhkEHhVb9cUev6Tyh2fV9wTMt
	BruSFouvjoctpwX9xVDig4zNPCBY72lqy80I6yR6necyw5oLuI9IPsFZfeBxocAGx5Y7jgffR7UwJ
	X74f9h39cb0Ku95Zci5y0vHhkZxewFpVNpl8uoc5MjH/c2/BB0oNC7cUavOvsDH3iUROntD1FXkGM
	0JclYkvQDpDeCezDarNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRgdD-0000000BTM9-0sVb;
	Fri, 13 Nov 2026 02:03:11 +0000
Received: from mail-m158181.netease.com ([47.251.158.181])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRgdA-0000000BTLO-0jqd;
	Fri, 13 Nov 2026 02:03:10 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5484f6ba6;
	Fri, 13 Nov 2026 10:03:03 +0800 (GMT+08:00)
Message-ID: <a5b52d95-7fa2-4148-aa02-cfee6f195e1a@rock-chips.com>
Date: Fri, 13 Nov 2026 10:03:01 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] drm/rockchip: vop2: Fix the HDMI sync polarity on
 RK3588
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
 <20261112-vop2-fixes-v2-3-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-3-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1d2a4e0a503a8kunm80fbc02f473c1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTEgZVktPSUtOHktJHUkeHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cux/RLhdEL9vzjCYZTxGA7XZvFMhySw1imRGjuTXATiePVhVQlIg6iqCsMd2ya3Ce40+JGvTvb6GcwHJprfLAmmcqepp/gpQu3glqJRd9eOvuUXOFZKrNE0NuHSnPUYPB//LAmjkdaURy8uevm+sR9XEbyAYolryMwDneUGHmjY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=2yRMouvHM4a05izOhD8UAJhMpR/Nv3hy0kmuRjqTsS0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_180308_785733_29B9AE5E 
X-CRM114-Status: GOOD (  16.20  )
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
> rk3588_set_intf_mux() passes the POLFLAG bits of the mode to
> rk3588_get_hdmi_pol(), which decodes them as DRM mode flags: the
> VSYNC_POSITIVE bit is taken for DRM_MODE_FLAG_NHSYNC and POLFLAG_DCLK_INV
> for DRM_MODE_FLAG_NVSYNC. As a result GRF_VO1_CON0 marks the HSYNC of
> every +HSync/+VSync mode (e.g. all 1080p, 2160p CTA modes) as negative
> and both syncs of -HSync/-VSync modes (e.g. 720x480, 640x480) as
> positive.

The commit msg confuses me. POLFLAG_DCLK_INV has no relation to 
DRM_MODE_FLAG_NVSYNC.

For the RK3588, the polarity relationship is:

DRM_MODE_FLAG_NHSYNC -> Set HDMI hsync polarity bit
DRM_MODE_FLAG_NVSYNC -> Set HDMI vsync polarity bit
DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE -> No valid HDMI dclk polarity bit

> 
> The bits in GRF_VO1_CON0 are set for a negative sync; that is how the
> vendor kernel programs them (vop2_get_hdmi_pol(), called with the mode
> flags, sets them for DRM_MODE_FLAG_NHSYNC/NVSYNC on RK3588). Decode the
> POLFLAG bits accordingly.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 659fd0a3ab63..7c48b440cb29 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1687,12 +1687,16 @@ static u32 rk3588_get_mipi_port_mux(int vp_id)
>   		return 0;
>   }
>   
> -static u32 rk3588_get_hdmi_pol(u32 flags)
> +/*
> + * The HDMI sync polarity bits in GRF_VO1_CON0 are set for an active low
> + * (negative) sync.
> + */
> +static u32 rk3588_get_hdmi_pol(u32 polflags)
>   {
>   	u32 val;
>   
> -	val = (flags & DRM_MODE_FLAG_NHSYNC) ? BIT(HSYNC_POSITIVE) : 0;
> -	val |= (flags & DRM_MODE_FLAG_NVSYNC) ? BIT(VSYNC_POSITIVE) : 0;
> +	val = (polflags & BIT(HSYNC_POSITIVE)) ? 0 : BIT(HSYNC_POSITIVE);
> +	val |= (polflags & BIT(VSYNC_POSITIVE)) ? 0 : BIT(VSYNC_POSITIVE);
>   
>   	return val;
>   }
> 

With the commit msg modification:

Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


