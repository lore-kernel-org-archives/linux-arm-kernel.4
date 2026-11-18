Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536F1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hX/ARGjs;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=dRStX11h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5Z5/zjedC8T+CAY4SMgSU23abppwtiRyhcMgN9UWEQ0=; b=hX/ARGjsOadL/d
	0tOXl+duM7MXHu9ipA4MdWXTxL8BP2wtwsbSggsXEU5JisdBBC8VUR/HpLS/htY23nGXji5j1mgf8
	0VcywYAh25sRQpoLF0grYZGw0vlEWH5Zb2qTeW/Jsu6RqJKRMfm76Q26DAQ9GOE7+r/xFP5pGDwAN
	n/IFjdoJMMKKbACBqTPAix+DGPw5k5vZyVmI/ivLLdoFG4ZheRSlUka1n32Z8BnOgNsq/dwHDc8cU
	2L/z2vuk3U29BSvOuUmIul70jSAibWYSdDTF1ZLVAo/JbvRwS3HGm9+xxzYU8clqspx+xXts8rVJY
	Cazz/Vm42cvcnDbm4PJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdWP-00000008gAu-0Xks;
	Wed, 18 Nov 2026 11:08:13 +0000
Received: from mail-m17218.xmail.ntesmail.com ([45.195.17.218])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdWJ-00000008gAD-3XYz;
	Wed, 18 Nov 2026 11:08:11 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5523317e8;
	Wed, 18 Nov 2026 19:08:00 +0800 (GMT+08:00)
Message-ID: <0cd86b2b-004b-4a36-ab8e-fd3b50960413@rock-chips.com>
Date: Wed, 18 Nov 2026 19:07:59 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/rockchip: vop2: Only accept AFBC YTR for 8 bit
 RGB on RK3588
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
 <20261113-vop2-fixes-v3-5-08ae37e83b5c@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261113-vop2-fixes-v3-5-08ae37e83b5c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1ee57974103a8kunm31e77375358449
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEpLVkgYHUMZT0tPSU9KTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=dRStX11hKIKXImeBPSFSnbL4EsfI4ippAvDWiIMjgZwMZsNT/qSSdtmiAfpCFt89dJ4cV435LnMtrQE35l6abkTOSitQjAvB++qhkLwniOfRYGWOa7YzW9QPxuBS9iSdHbj+zvbil7mXmytF+itkskDXYcYyHHEY34tnh6X3yiM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=5Z5/zjedC8T+CAY4SMgSU23abppwtiRyhcMgN9UWEQ0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_030809_369940_2920A699 
X-CRM114-Status: GOOD (  15.55  )
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
> According to the TRM, the AFBC decoder of the RK3588 Cluster windows
> supports the lossless colour transform (YTR) only for the 8 bit RGB
> formats. An RGB565 buffer with YTR gives a black picture and
> POST_BUF_EMPTY, while the same buffer without YTR displays fine.
> 
> Don't accept YTR for any other format on RK3588.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index e8ef83d6924b..de3da292b05a 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -404,6 +404,11 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
>   	if (vop2_convert_afbc_format(format) == VOP2_AFBC_FMT_INVALID)
>   		return false;
>   
> +	if (vop2->version == VOP_VERSION_RK3588 && (modifier & AFBC_FORMAT_MOD_YTR) &&
> +	    vop2_convert_afbc_format(format) != VOP2_AFBC_FMT_ARGB8888 &&
> +	    vop2_convert_afbc_format(format) != VOP2_AFBC_FMT_RGB888)
> +		return false;
> +
>   	/* Different windows have different format/modifier support */
>   	for (i = 0; i < plane->modifier_count; i++) {
>   		if (plane->modifiers[i] == modifier)
> 

Yes, RK3588 only supports VOP2_AFBC_FMT_ARGB8888/VOP2_AFBC_FMT_RGB888 
with AFBC_FORMAT_MOD_YTR.

Shall we move this new check a bit earlier, right after the RK3588 10bpc 
formats check? Also add a comment and a drm_dbg_kms trace for it.

Best regards,
Damon


