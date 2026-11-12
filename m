Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B14606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nx7Q0RMj;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qyp+1ySN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RydkAwhCHaAKlfAub9w35tVkjVw3id/z9+LZoN9cN3s=; b=nx7Q0RMjeBV7dpoik6UamHnMok
	3KPyA8DHcz35CLw+sEMVJSPzMinH/V1KtCYDeouayQAtqiKHKJXy5sWy8ewnxK2/LMG+fuiRnK7bX
	0pRQVti4ToCKSYCY09IljdGwZcoNFH86Z1ZM1c88LQZpTWSGln5zG1I5ovYfeDbsqhBkqOnR6XCIn
	Mi77xm44Jr4nEGm1ZacnQn63PUiKlZpOF1FrSB5SY12Bttu7THJ5pwFxx/CcGbYIdX5t72FJGI0Vo
	SVNbK3iKHCCVsdeoveXr0nxpV6/C9TRrmoXQfp91uLBbYUSdA8q4c4JkfzBL8xPv5A9DHQpCC+j6F
	jdBhY67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJq9-00000008QuK-3gVp;
	Thu, 12 Nov 2026 01:43:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJq8-00000008QsN-0IJR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:43:01 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCD5E33D;
	Thu, 12 Nov 2026 02:40:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794447635;
	bh=mbqc4reuJ5uBUi3+eZMvhNNKUYHa01GKz4Io2SYawNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyp+1ySNielkdl0+WhADvwJC2XanDvORnzB3mO35LsdWGnWfo8J/2OEdTcOqSBYcu
	 D/WsJgfwElxahNpwMU1hHy25tzzEwM7EOgi1eKF0VoE7u0Bv65N+C+DBwaYKq0s1fj
	 1QcAyKfs/dcLEttWGWavP7I52moXsHbWCpoMn8Aw=
Date: Thu, 12 Nov 2026 03:42:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 03/11] media: imx8-isi: Support mbus_code filtering in
 format enumeration
Message-ID: <20261112014257.GB449716@killaraus.ideasonboard.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-3-e69f89c7c651@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-isi_imx952-v4-3-e69f89c7c651@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_174300_281027_AC760B40 
X-CRM114-Status: GOOD (  22.70  )
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

On Tue, Sep 29, 2026 at 04:52:24PM +0800, Guoniu Zhou wrote:
> Extend mxc_isi_format_enum() to accept a v4l2_fmtdesc pointer instead
> of a plain index, so it can filter formats by mbus_code when set. This
> is used by the capture path to enumerate only formats compatible with
> the connected subdev output.

It's not in this patch, mxc_isi_format_enum() is used for M2M only. It
will only be used in the capture path in patch 04/11.

> 
> For the M2M device, the V4L2 framework clears mbus_code to 0 for
> devices without V4L2_CAP_IO_MC (v4l2-ioctl.c), so this change has no
> effect on M2M format enumeration.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v4:
> - New patch
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h  | 2 +-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c   | 2 +-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 6 +++++-
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 58b47335afc7..a30633a7e2e9 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -322,7 +322,7 @@ mxc_isi_bus_format_by_index(unsigned int index, unsigned int pad);
>  const struct mxc_isi_format_info *
>  mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type);
>  const struct mxc_isi_format_info *
> -mxc_isi_format_enum(unsigned int index, enum mxc_isi_video_type type);
> +mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type);
>  const struct mxc_isi_format_info *
>  mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix,
>  		   enum mxc_isi_video_type type);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index b729eecad0fe..1178947bb548 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -492,7 +492,7 @@ static int mxc_isi_m2m_enum_fmt_vid(struct file *file, void *fh,
>  		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
>  	const struct mxc_isi_format_info *info;
>  
> -	info = mxc_isi_format_enum(f->index, type);
> +	info = mxc_isi_format_enum(f, type);
>  	if (!info)
>  		return -EINVAL;
>  
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index f45c2aae59ce..0d87a1082727 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -482,13 +482,17 @@ mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
>  }
>  
>  const struct mxc_isi_format_info *
> -mxc_isi_format_enum(unsigned int index, enum mxc_isi_video_type type)
> +mxc_isi_format_enum(const struct v4l2_fmtdesc *f, enum mxc_isi_video_type type)
>  {
> +	unsigned int index = f->index;
>  	unsigned int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
>  		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
>  
> +		if (f->mbus_code && fmt->mbus_code != f->mbus_code)
> +			continue;
> +
>  		if (!(fmt->type & type))
>  			continue;
>  

-- 
Regards,

Laurent Pinchart

