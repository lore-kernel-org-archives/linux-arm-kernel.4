Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2072C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 01:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pDPMQoqb;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=XfVFItQf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0Gp1eyUb1TRq0HLGTC1lCi4kXREArXMUBnkCXCJmk+g=; b=pDPMQoqbLlLce9
	KktjWTHVJnq/AsB8qUFGKLV680Lwaj/pv0N9z3oe3A4rJhss58cP1SzFftUCPWl8lcjhxSWE0/4yk
	uBRXekjSYgyKrmspJyEnvFRwMDxyl5oa8OFCM5dOIIJcHpSN2zv2sqdotKGSaYki4U/cYmEzvPAzn
	KsDMHl/xTpaej6309Gt8kUF3FqMdTKkzaCpNQtaIQQqopzQt/ILAyFfM8eo/yACmaiPyJ3r/VJuq3
	mIQpwhko5vtzQsIU3ZiiPB95xbFp0B9017uzFXI0M9fvMbP1vvVcJOjg9XXMRNi2wKTh1OgcNwDoT
	/VKwU8bgaljI67ce0kAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIcC-000000023in-1oLu;
	Mon, 23 Nov 2026 01:13:04 +0000
Received: from mail-m81165.netease.com ([47.88.81.165])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIc8-000000023hq-1hVI;
	Mon, 23 Nov 2026 01:13:03 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5594437e6;
	Mon, 23 Nov 2026 09:12:44 +0800 (GMT+08:00)
Message-ID: <04e31b87-e766-4fb8-a361-0e92b1ab12ae@rock-chips.com>
Date: Mon, 23 Nov 2026 09:12:42 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/rockchip: dsi: enable RK3506 PHY data lanes in GRF
To: ZhuXiangyu <1194781887@qq.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_C4C715C962613597F98212938F8940633306@qq.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <tencent_C4C715C962613597F98212938F8940633306@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa205f6674d03a7kunme2eb5a24b4b784
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQkNCVh9OSUMZQkJCGBgfHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=XfVFItQf3zmtTWT5dWXxy2+IBA8SoihxLBFhsNLWJcR0kd+7H5NxCN2UyNu0YbRlNkuiCF9rw4bezgW1BndNvr62M/1nDpAcngQmjKtky4966raCiSNBJY9/C7Wgv5JxF8h18TGc6sW32EFQM/dv5qqsrGHFw04XfoWBG7cS2Is=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=0Gp1eyUb1TRq0HLGTC1lCi4kXREArXMUBnkCXCJmk+g=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_171301_291914_9AAE4505 
X-CRM114-Status: GOOD (  16.28  )
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

On 11/22/2026 1:10 AM, ZhuXiangyu wrote:
> rk3506_chip_data currently only clears the turnaround, force-rx, and
> force-tx-stop fields in RK3506_SYS_GRF_SOC_CON6. As a result, the DSI
> PHY data lanes remain disabled unless the bootloader happens to enable
> them.
> 
> Set RK3506_DSI_PHY_ENABLE_LANE0 and RK3506_DSI_PHY_ENABLE_LANE1 in
> lanecfg1 so the data lanes are reliably enabled by the driver.
> 
> Tested on an RK3506B board: the panel receives the low-power init
> sequence and the framebuffer console displays properly.
> 
> Fixes: cabeacc7eadc ("drm/rockchip: dsi: Add support for rk3506")
> Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
> ---
> Changes in v2:
> - Split out from the combined drm/phy patch into a standalone drm
>   subsystem patch per Heiko's review.
> - Limit recipients to drm and Rockchip maintainers/lists.
> - Fix Signed-off-by author name formatting.
> 
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 30d6f83c..116cc140 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -199,6 +199,8 @@
>  
>  #define RK3506_SYS_GRF_SOC_CON6		0x0018
>  #define RK3506_DSI_FORCETXSTOPMODE	(0xf << 4)
> +#define RK3506_DSI_PHY_ENABLE_LANE1	BIT(9)
> +#define RK3506_DSI_PHY_ENABLE_LANE0	BIT(8)
>  #define RK3506_DSI_TURNDISABLE		BIT(2)
>  #define RK3506_DSI_FORCERXMODE		BIT(0)
>  
> @@ -1727,7 +1729,9 @@ static const struct rockchip_dw_dsi_chip_data rk3506_chip_data[] = {
>  		.lanecfg1_grf_reg = RK3506_SYS_GRF_SOC_CON6,
>  		.lanecfg1 = (FIELD_PREP_WM16_CONST(RK3506_DSI_TURNDISABLE, 0) |
>  			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCERXMODE, 0) |
> -			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0)),
> +			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0) |
> +			     FIELD_PREP_WM16_CONST(RK3506_DSI_PHY_ENABLE_LANE0, 1) |
> +			     FIELD_PREP_WM16_CONST(RK3506_DSI_PHY_ENABLE_LANE1, 1)),
>  		.max_data_lanes = 2,
>  		.max_bit_rate_per_lane = 1500000000UL,
>  		.dphy_get_timing = dw_mipi_dsi_phy_px30_get_timing,

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi


