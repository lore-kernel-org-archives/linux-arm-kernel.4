Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6DA606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bGcIhPO7;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=LtFOMXuJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M6suHIpsl6GARsXl0aeCf2GhxVBiwsz4QMRfqHBX3QE=; b=bGcIhPO7C8Dapo
	rBHcwEdgWA7K2POMaHS+yZnvUh8emNEy6JmqoANzU5mqTwQpTOpXXY37YdGxdKi6wNVHAchCNWq40
	sKEtsyIIk40T7RRQy8aCd6XUmnkJWpp1yEqspqXLu6i/2QbxFAJDOoMFCbv3XLb7aWHWadYt1504y
	Pp5xLp/2rWbb+QqcCNlF7fdmTMYcVqORTdM0iy+lk0QI59AMtMFq2KyCwr2ZujvG0bmBicWEcp9pA
	Ul29eP8z8rA+6KTF2QgYpDpqGJhLdnf/mRgTyiq/8s1l8ivyA4Ik7LSHG4w3okUJcJU1uzY652CK0
	WV7VCY8PGs9VAZ06DYYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrA1-00000004rxq-0ZTb;
	Tue, 10 Nov 2026 19:05:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQr9x-00000004rxC-45RX;
	Tue, 10 Nov 2026 19:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794337531;
	bh=Uz3BhBVImxItOoQKtHHtypAOcZNmLlMDT+UDThYXTEY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LtFOMXuJ9oY36UZepQyWbJGdaDUbedR9kzEldgu4NqYzeJltQNqahDZUmBHzomn9n
	 n5hT+LMgDCW2Tv5fXbR/Fe535XqydT4G5iywkeZemeqRmSmEFEqOxK+b7lp1HOoOdq
	 uGtUk2HMib6ufK+DtXvJAsdlFMOKxnsGtBKbTx327CXgufpLnhht0PQNtlCnMO5+cd
	 0OoTTVhtM7NarFALOwW2rcn6XT0rpJt8PH6ZYzEajQy8j3CEKt4mOFHFfHz329hgcK
	 v+/8QOD81fb/+iL3IFH75gxRxOTG+LJQMkXV6K3clMEd/J+zNQFUNSq+Roa31tbrC8
	 UpISE9nB+D/LA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 890EB17E0820;
	Tue, 10 Nov 2026 20:05:30 +0100 (CET)
Message-ID: <cd6ff4c0-cd5d-4c42-8f52-5f3893aec015@collabora.com>
Date: Tue, 10 Nov 2026 21:05:30 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/rockchip: dw_hdmi_qp: Set the VOP2 color space
 from the connector
To: =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018143135.5745-1-jan.claussen10@web.de>
 <20261018143135.5745-7-jan.claussen10@web.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20261018143135.5745-7-jan.claussen10@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_110534_209413_33CCA823 
X-CRM114-Status: GOOD (  18.69  )
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

Hi Jan,

On 10/18/26 5:31 PM, Jan Claußen wrote:
> VOP2 converts RGB to YCbCr using the matrix selected by the CRTC
> state's color_space, but the HDMI encoder never sets it, so VOP2
> always converts with BT.709. Once the colorspace property can
> signal BT.2020 colorimetry to the sink, a YCbCr output would be
> encoded with BT.709 and decoded with BT.2020.
> 
> Derive color_space from the connector colorspace before the early
> return, so that a colorspace change alone is applied.
> 
> Signed-off-by: Jan Claußen <jan.claussen10@web.de>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 9c4cf68d79d5..10c5b6d6406e 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -17,6 +17,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/phy/phy-hdmi.h>
>  #include <linux/regmap.h>
> +#include <linux/videodev2.h>
>  #include <linux/workqueue.h>
>  
>  #include <drm/bridge/dw_hdmi_qp.h>
> @@ -187,6 +188,19 @@ static int dw_hdmi_qp_rockchip_get_vop_format(struct drm_encoder *encoder,
>  	return bstate->output_bus_cfg.format;
>  }
>  
> +static u32
> +dw_hdmi_qp_rockchip_color_space(const struct drm_connector_state *conn_state)
> +{
> +	switch (conn_state->colorspace) {
> +	case DRM_MODE_COLORIMETRY_BT2020_RGB:
> +	case DRM_MODE_COLORIMETRY_BT2020_YCC:
> +	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> +		return V4L2_COLORSPACE_BT2020;
> +	default:
> +		return V4L2_COLORSPACE_DEFAULT;
> +	}
> +}

My main concern is introducing V4L2_COLORSPACE_* logic into a DRM bridge driver,
which should rather rely on enum drm_colorspace / DRM_MODE_COLORIMETRY_*.
Translating the DRM colorimetry into V4L2 values only for VOP2 to map them back
to a CSC matrix doesn't seem fully justified.

The root problem is rather on the VOP2 side: the color_space field in struct
rockchip_crtc_state and its V4L2-based handling in the CSC selection look like
leftovers inherited from the vendor kernel, and I think this is a good time to
clean that up instead of building on it.

Cristian

