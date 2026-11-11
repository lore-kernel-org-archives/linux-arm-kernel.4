Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85EC606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 23:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Si4mlwXQ;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Ydtw7KnN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gVIeqTEhmx2fXY3RkoSwuO1fdXlfwtDek+Btr2BpwUw=; b=Si4mlwXQyRx28H4GQRVgp7zfVn
	4q9bPE1A1WMJ34xRdl8npmUfgpKxxerUVVRoDHrd6syZhvH8Vm595IM+B/537Ah98E0bzmtbMsybT
	OXTy5jgFGL2SceF+7Ok1PCaHGauC6taLsGIgYSBiZ8Zck1NL5cR38WymTjDxBSjZEsv5oynRsDF7u
	tq+xBksD1PGLyJFdmMDIoMjca7r4cTuoWrfg64wUxD6qfnmjabvFj26veby1uacZmj/7xAYIuHK0p
	7gcMy/IB4MP2dw5K76HONDzfYYQyYhAKlUSrqjhu7Esh7FohYFi38wVr/AmzD43wPDm6Urlsq0zri
	a9NfckDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRHYj-0000000876q-0roz;
	Wed, 11 Nov 2026 23:16:53 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRHYd-0000000875k-2CYp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 23:16:48 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44DF422B;
	Thu, 12 Nov 2026 00:14:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794438862;
	bh=z0dg7bwU2AAoMLZ79Myh4uGTQaMh+gcfY67SeB0Tlv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ydtw7KnN0JpDWFAoRtrJahH5aWkusxuCN0PY/k/3ePCt0lPSp7vPcpbdfpNo022R2
	 fv9gBmDZ83xYbRPNXsDlKt7B01xDdhFW+TnYG9z7BN8PHLWQJucSwDJCn/d1mmqMeE
	 k13Wvp9epVQNLdNwT9hMEzVDcBkto18wJciq3i3A=
Date: Thu, 12 Nov 2026 01:16:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	"open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] drm: xlnx: zynqmp_disp: use
 dmaengine_get_copy_align() accessor
Message-ID: <20261111231644.GC449775@killaraus.ideasonboard.com>
References: <20261111200739.3823753-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111200739.3823753-1-Frank.Li@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_151647_709524_C6754BFC 
X-CRM114-Status: GOOD (  16.12  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 03:07:37PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use the dmaengine_get_copy_align() helper instead of directly accessing
> the copy_align field from the DMA device structure.
> 
> No functional change and prepare to move struct dma_device to private.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tomi, I assume you'll push this to drm-misc. Please let me know if
that's not correct.

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index e998f22686748..0753236b9546a 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1433,7 +1433,7 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
>  		struct zynqmp_disp_layer *layer;
>  
>  		layer = &disp->layers[ZYNQMP_DPSUB_LAYER_VID];
> -		dpsub->dma_align = 1 << layer->dmas[0].chan->device->copy_align;
> +		dpsub->dma_align = 1 << dmaengine_get_copy_align(layer->dmas[0].chan);
>  	}
>  
>  	dpsub->disp = disp;

-- 
Regards,

Laurent Pinchart

