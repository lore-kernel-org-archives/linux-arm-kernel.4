Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5276D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 23:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tMbORFay;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YRreNREZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SwCLDaTF/SZHcXaLHvk//w6qsnUfE/A450nw0/y6Vmg=; b=tMbORFayietnXNhBrFqKFyBE3n
	Rpwpp7x7AeZxjRcIeerv9oTmP0XfJq7JaFnv1N4zgB3ETdC8UKo6IkyEzhdozCTHE6iUbRQQIKtH0
	NdSi9yOG74gtMDYfPonZEFntVy1yThLaYOANgwsaNxyjktFxvlIeO+gFWe9JsvBPoAaScONrufexd
	IPD4NXGzbkeBBFlZPd1YrFM22G8ZmYS0VDevXodpXzRO2NDYpOPab7p6uOH7fLB10IsyBf4ymT+2/
	Cey1IFqBrYPabDwS5q/REsdW4B4vDrsl7sWCHrl4rTztRA4ZQLUm8uhOEChPaFAOdj1nRbXLj/Sw7
	XdFdLNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRHXo-000000086xF-4327;
	Wed, 11 Nov 2026 23:15:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRHXn-000000086wt-19zx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 23:15:56 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EEB122B;
	Thu, 12 Nov 2026 00:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794438809;
	bh=aGlUHD0gujoJhXfnK8skBxle8rV39ixzq+kLCVy3sgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRreNREZ6iYcL1wj2CZzh0OVHAnqJaAJj760Zo3rcUn8hMU5mKP1gznFZMtYw+lPQ
	 qPBRdAeFJV4k+qIGrrcidLhGuvPyHInhjCWAwj7OdPri/Q+ZXzr6Tm+VX+ld17dJkM
	 7wH1odF1AHoeA9X08f473Z3B5S2dro1xeg/JM2YM=
Date: Thu, 12 Nov 2026 01:15:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"open list:XILINX VIDEO IP CORES" <linux-media@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
	vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 1/1] media: xilinx: Use dmaengine_get_copy_align()
 accessor
Message-ID: <20261111231551.GB449775@killaraus.ideasonboard.com>
References: <20261111171325.3424645-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111171325.3424645-1-Frank.Li@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_151555_575556_19854181 
X-CRM114-Status: GOOD (  17.00  )
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

On Wed, Nov 11, 2026 at 12:13:24PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace direct access to dma->dma->device->copy_align with the
> dmaengine_get_copy_align() accessor function.
> 
> Prepare move struct dma_device to private.

I didn't see a rationale in the commit that introduced
dmaengine_get_copy_align(), and I then saw it here. Without knowing much
about the greater plan of making dma_device private, this patch looks
OK.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tomi, will you handle this with any other ongoing work on
media/platform/xilinx/, or should it get merged separately ?

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/xilinx/xilinx-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index ece2116639fc0..e01bb40bc39c7 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -710,7 +710,7 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
>  		goto error;
>  	}
>  
> -	dma->align = 1 << dma->dma->device->copy_align;
> +	dma->align = 1 << dmaengine_get_copy_align(dma->dma);
>  
>  	ret = video_register_device(&dma->video, VFL_TYPE_VIDEO, -1);
>  	if (ret < 0) {

-- 
Regards,

Laurent Pinchart

