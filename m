Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5197F606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 06:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NYh1DB7O;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=QFyz1YFj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w4m4cPQwQJpXhlcoWu8T5iKxhXJjXTacGdEiUdqBdko=; b=NYh1DB7Oe+KJnC
	rckcQ68pvul6uKHsNzkIXp04JAnKfM60y+GE2cj3Yoj9Og4KjAC1mj2VT+LncJqXEfqWh+b/m1O5f
	403oYvrxes8rt0poGgObbaRUcKSBJjjKe/WTcznqTWO9/tPSHGvVvirdFiptXhPX9iAnquju34wGo
	N4ZActH9zvP0/S97CS+AYg5pNK7jc/Qh5oYqypPtf+/+jF5qF8bipyzNrDyX7iTgrxN5N3DreIqcH
	CwN0+iRtqOJKeN8lF6bTE6l4XydPmW9rCXUYyab7yLFp5kVq1dabsuXRYEPyB7lBGbDS4CA0Zg8/e
	Zg3vf3ZhpGKTKNwpeuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ3b-00000007swE-1M7i;
	Wed, 18 Nov 2026 06:22:11 +0000
Received: from mail-m128100.netease.com ([103.209.128.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ3X-00000007sr2-1Nfq;
	Wed, 18 Nov 2026 06:22:09 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55181e2c8;
	Wed, 18 Nov 2026 14:21:54 +0800 (GMT+08:00)
Message-ID: <fbad426d-29fe-4e0b-b983-b020e06c781c@rock-chips.com>
Date: Wed, 18 Nov 2026 14:21:53 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] drm/rockchip: vop2: Take the UV plane address from
 the second GEM object
To: aiyengar1990@gmail.com, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan
 <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Piotr Zalewski <pZ010001011111@proton.me>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261113-vop2-fixes-v3-0-08ae37e83b5c@gmail.com>
 <20261113-vop2-fixes-v3-1-08ae37e83b5c@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261113-vop2-fixes-v3-1-08ae37e83b5c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1ed51ab4503a8kunm213d4f1332ef37
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHkxKVk5KQ01MTxpKTE1DGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=QFyz1YFjrSR7kBLZdin9kyuyLMQ5jZIfL1d2ADHhPEMcnSjYmspNWAvRFnHNbP2Ep5fIsa83dPoz2W4Ewyjgo7Hje5VxYa553VISDGHcshaR22CIHAHoc2l9N56Jd4q2srj1f/fui5Ccz59X70Q54YYjlgLZx3b50MeDsoZcy5U=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=w4m4cPQwQJpXhlcoWu8T5iKxhXJjXTacGdEiUdqBdko=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_222207_931511_9C7F9071 
X-CRM114-Status: GOOD (  14.49  )
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

On 11/14/2026 12:39 AM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> vop2_plane_atomic_update() takes the chroma plane address from
> fb->obj[0]. The planes of a framebuffer can be in different GEM objects
> (ADDFB2 with two handles, e.g. NV12M from a V4L2 decoder), and the
> window then fetches the chroma plane from the luma buffer.
> 
> Use fb->obj[1] for formats with more than one plane.
> 
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-206550@kernel.org/
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 76d151b8bc52..e8ef83d6924b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1369,7 +1369,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
>   		if ((pstate->rotation & DRM_MODE_REFLECT_Y) && !afbc_en)
>   			offset += fb->pitches[1] * ((pstate->src_h >> 16) - 2) / vsub;
>   
> -		rk_obj = to_rockchip_obj(fb->obj[0]);
> +		if (fb->format->num_planes > 1)
> +			rk_obj = to_rockchip_obj(fb->obj[1]);
>   		uv_mst = rk_obj->dma_addr + offset + fb->offsets[1];
>   	}
>   
> 

Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


