Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E083606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pJvRsWx3;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PSUhd3ik
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nK9CXykOQdpoKKSKUEUW4Y0a7OU0zuqfF4zOk5eKRjM=; b=pJvRsWx36VztZh
	Ra73rBcRntwkmLjuPz+Eg81L6w+/bASr6RaY/Zgh/XIOLsNHjNiyWCe0sKpyODRWoFbKGUEs/MDiA
	oJ5KZPTuaQP8VNz6x4Jm/6U8RwLpGEscd2KwVdaIDhbQodt/kcHT2PdeQPkWmOwKMB3LS/7zK+1dW
	KE3PG8ZmBIf7U6cpRej8k6mY12KFQnTL4V5gJ5mHWY4Ji/p6Rq8ZyVmkzByi1hDVcY8LoPFnmZPjj
	pC00OW7KSNHJMVGscazppOJVZH7Oq31S7bEVBjyWOHy5+X6ojzUvUHqRtpLMXEs9EYYEdJArR0h5A
	nAyij9yB+l2YBjBQQKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRS2N-00000009Wm8-3TR9;
	Thu, 12 Nov 2026 10:28:12 +0000
Received: from mail-m1602365315.xmail.ntesmail.com ([160.236.53.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRS2I-00000009WlH-2JwF;
	Thu, 12 Nov 2026 10:28:09 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5472ffebd;
	Thu, 12 Nov 2026 18:28:01 +0800 (GMT+08:00)
Message-ID: <17a08dd7-819c-4598-94cd-f8ed208646d8@rock-chips.com>
Date: Thu, 12 Nov 2026 18:28:00 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] drm/rockchip: vop2: Take the UV plane address from
 the second GEM object
To: aiyengar1990@gmail.com
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Piotr Zalewski <pZ010001011111@proton.me>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261112-vop2-fixes-v2-0-8218c1cf8ac8@gmail.com>
 <20261112-vop2-fixes-v2-1-8218c1cf8ac8@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261112-vop2-fixes-v2-1-8218c1cf8ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1cf4cd70803a7kunm7a1f598398933d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0hJVkkdSRhMTRkaTE0fGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PSUhd3ik9cmURLl7TV8DlHTNFhsrQMTPF6B4XoguWBNzygr61uUmH1Q27gyZ4iPwMbmPmxZjuL3C/YdW4X5IK1ccRVgjkFvVQ9LsVJmoz9MCwzuMe8tPVLKQpA1K3w002rLAg1tSZrAkjpQ6J5cUW2xX2RLN6aGN/eMe447vr6Q=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nK9CXykOQdpoKKSKUEUW4Y0a7OU0zuqfF4zOk5eKRjM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_022807_454122_5DCFF5F5 
X-CRM114-Status: GOOD (  17.69  )
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
> vop2_plane_atomic_update() computes the address of the chroma plane of a
> multi-planar YUV framebuffer from fb->obj[0], the object of the luma
> plane, plus the offset of the chroma plane. A framebuffer may have its
> planes in different GEM objects though (DRM_IOCTL_MODE_ADDFB2 with two
> handles, as with an NV12M buffer from a V4L2 decoder imported as two
> DMA-BUFs). The window then fetches the chroma plane from the luma buffer,
> at an offset meant for another buffer, which shows a wrong picture or
> reads past the end of the luma buffer.
> 
> Use fb->obj[1] for the chroma plane. Single plane YUV formats like
> DRM_FORMAT_YUV420_8BIT have no second object and keep using fb->obj[0].
> This is also what the vendor kernel does.
> 
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-206550@kernel.org/
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 76d151b8bc52..ea8d837d661f 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1369,7 +1369,9 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
>  		if ((pstate->rotation & DRM_MODE_REFLECT_Y) && !afbc_en)
>  			offset += fb->pitches[1] * ((pstate->src_h >> 16) - 2) / vsub;
>  
> -		rk_obj = to_rockchip_obj(fb->obj[0]);
> +		/* Single plane formats like YUV420_8BIT have no second object */

Drop this comment.


> +		if (fb->format->num_planes > 1)
> +			rk_obj = to_rockchip_obj(fb->obj[1]);
>  		uv_mst = rk_obj->dma_addr + offset + fb->offsets[1];
>  	}
>  
> 

-- 
Best, 
Chaoyi


