Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28A0606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XHm5oV6Z;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=SD/4ffKk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/PG22HUnpipGjaN800i0S6Qg/5eh4aaNl1rldurwMEw=; b=XHm5oV6ZRnMCxS
	EeaB87cXgdxXNtf/r5UDIDDXUW6nY5UeNO0nz/BnNDpDhrbURwKjbpAWC6icuiNb3xtTAhYVBfQbp
	Q0RqhhzNo/fxgq7QHAfrp9EGvojDLCnNBpj0VWkNAvhWMtqUpD2/8WmyYVsKn1ooqO/SqRJih4vpd
	BL47A+dFIOBrz52dM4MPpVuAENraojtua5SsZVpcG3aHQ2Q+qPG7Q6Y1Kf1eHfn5l795/F2ZwTyU7
	yaVEcmORqCqVgyiozEXDT7zXcaSIEABZBJSzQUwESbYSr/Mx3zCW/0qIrqIZkK7W/C5c4QkGpCNQd
	84pYInhg+RiqUmAgqShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcHH-00000008QiB-3Tna;
	Wed, 18 Nov 2026 09:48:31 +0000
Received: from mail-m12868.netease.com ([103.209.128.68])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcHF-00000008Qh3-0k1Z;
	Wed, 18 Nov 2026 09:48:31 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5520d7b24;
	Wed, 18 Nov 2026 17:48:24 +0800 (GMT+08:00)
Message-ID: <abc2d0e2-521c-4ae8-8a8b-e41c8f2bc482@rock-chips.com>
Date: Wed, 18 Nov 2026 17:48:23 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] drm/rockchip: vop2: Fix the HDMI sync polarity bit
 order on RK3588
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
References: <20261113-vop2-fixes-v3-0-08ae37e83b5c@gmail.com>
 <20261113-vop2-fixes-v3-4-08ae37e83b5c@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261113-vop2-fixes-v3-4-08ae37e83b5c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1ee0eb96103a8kunmdffd083c34ef57
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUNJVkhDSk5CTU1KSE0dHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SD/4ffKkoOL31/82SahftnhWFXNBC2jzLaHRzM6GbsP7Hbz3SM51Nc/ri1edybUEcvBM1vA6QZGVF2GKQEQxxlf/94JzVNKPVwCz54XpfMjMuHYMB7p5dV1v6A1h3RsDGFwHhPp1FIvUv9mwhNUdb1w6+7TO8NXhAb4sKHf6wsY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=/PG22HUnpipGjaN800i0S6Qg/5eh4aaNl1rldurwMEw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_014829_815051_3CB89806 
X-CRM114-Status: GOOD (  16.24  )
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

On 11/14/2026 12:39 AM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> In GRF_VO1_CON0 the HDMI vsync polarity bit comes before the hsync one
> (bits 5 and 6 for HDMI0, 7 and 8 for HDMI1), but rk3588_get_hdmi_pol()
> puts hsync first. Modes with mixed sync polarities go out with both
> syncs inverted: the HDMI controller sees 1920x1080@144 +HSync -VSync
> as -HSync +VSync in VIDEO_INTERFACE_STATUS0.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 3e654cb99ddf..6d08988d7007 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1683,13 +1683,13 @@ static u32 rk3588_get_mipi_port_mux(int vp_id)
>   		return 0;
>   }
>   
> -/* The sync polarity bits in GRF_VO1_CON0 are set for a negative sync */
> +/* GRF_VO1_CON0: vsync bit below the hsync bit, each set for a negative sync */
>   static u32 rk3588_get_hdmi_pol(u32 polflags)
>   {
>   	u32 val;
>   
> -	val = (polflags & BIT(HSYNC_POSITIVE)) ? 0 : BIT(HSYNC_POSITIVE);
> -	val |= (polflags & BIT(VSYNC_POSITIVE)) ? 0 : BIT(VSYNC_POSITIVE);
> +	val = (polflags & BIT(VSYNC_POSITIVE)) ? 0 : BIT(0);
> +	val |= (polflags & BIT(HSYNC_POSITIVE)) ? 0 : BIT(1);
>   
>   	return val;
>   }
> 

Oh, this is a good catch. I verified the RK3588 HDMI sync polarity bits 
are arranged differently from other interfaces.

Would it make sense to add two macros for these bits under 
RK3588_GRF_VO1_CON0 in rockchip_drm_vop2.h:

#define RK3588_HDMI_VSYNC_INVERT	BIT(0)
#define RK3588_HDMI_HSYNC_INVERT	BIT(1)

rather than using raw BIT(0) and BIT(1)?

Best regards,
Damon


