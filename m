Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C155606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WB677ArO;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=CdWCAg0W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YAasUpXd4Y3J+GE5AGq6+24CrznL6SHkG3wCr7INF78=; b=WB677ArOEBtuBEAhIkfXEe6KEv
	AA7qtpdCK0woz3Srex904NX2jwV2DsLNH7+ddCbBaHScCIt6N9TJ08JY/lJ8xqbEhgTa0Y9MMpxZe
	KbcVbuX/Do2HiABVQVHkuWPWiSXtLQOXPYHv2QLE2cEYIupYYSBBekd6AgfPbg0zu8SNZbp84LrcH
	9njiwtE5ZuEmS1EK44GRXOcVjSq807Kvd+2Bz0+e6JdL0WrnG+6pyB+P0Kl2YYfNNDQONd1PrR1t/
	PkVZza6VtFGgd2C8LOYjxW+EX2TmHm/bXVOhbz6Q+2+JL1qR36+4hcxjK+/xgLA8u2vyngCkaBCYJ
	Hgerw2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJuJ-00000008RTz-2wjN;
	Thu, 12 Nov 2026 01:47:19 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJuG-00000008RTE-15nd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:47:17 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6B9933D;
	Thu, 12 Nov 2026 02:44:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794447890;
	bh=HgZ7Ha70ZLzMn9/whtW0EoB1N1MqFubj3YjWeQb1A5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CdWCAg0WZiat7Gqs9PDQcTyzmYC4cigUOOnpPb36ovcS8JSdI4VDUDC29gJrYuciu
	 CX0icnP8UIIySF+tMqS8N8cHmbmto7ZEE38BZVWEX2v9PZ7+pwsBq7TYL9V2Ne9WAE
	 XFavYU/5vAZAyKD64tYVLCN6m+qAmnUlTvohrTN8=
Date: Thu, 12 Nov 2026 03:47:12 +0200
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
Subject: Re: [PATCH v4 04/11] media: imx8-isi: Reuse mxc_isi_format_enum() in
 capture format enumeration
Message-ID: <20261112014712.GC449716@killaraus.ideasonboard.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-4-e69f89c7c651@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-isi_imx952-v4-4-e69f89c7c651@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_174716_448087_9A11E92D 
X-CRM114-Status: GOOD (  22.81  )
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

On Tue, Sep 29, 2026 at 04:52:25PM +0800, Guoniu Zhou wrote:
> Simplify mxc_isi_video_enum_fmt() by reusing mxc_isi_format_enum()
> instead of open-coding the same format table traversal.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

This will cause a small performance regression when enumerating formats
without mbus_code being set, but it's not a hot path.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

You'll need to either update the commit message of 03/11 (or possibly
squash it with this patch).

> ---
> Changes in v4:
> - New patch
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 30 +++-------------------
>  1 file changed, 3 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 0d87a1082727..21849af3121b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -1231,34 +1231,10 @@ static int mxc_isi_video_enum_fmt(struct file *file, void *priv,
>  				  struct v4l2_fmtdesc *f)
>  {
>  	const struct mxc_isi_format_info *fmt;
> -	unsigned int index = f->index;
> -	unsigned int i;
> -
> -	if (f->mbus_code) {
> -		/*
> -		 * If a media bus code is specified, only enumerate formats
> -		 * compatible with it.
> -		 */
> -		for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
> -			fmt = &mxc_isi_formats[i];
> -			if (fmt->mbus_code != f->mbus_code)
> -				continue;
> -
> -			if (index == 0)
> -				break;
> -
> -			index--;
> -		}
>  
> -		if (i == ARRAY_SIZE(mxc_isi_formats))
> -			return -EINVAL;
> -	} else {
> -		/* Otherwise, enumerate all formatS. */
> -		if (f->index >= ARRAY_SIZE(mxc_isi_formats))
> -			return -EINVAL;
> -
> -		fmt = &mxc_isi_formats[f->index];
> -	}
> +	fmt = mxc_isi_format_enum(f, MXC_ISI_VIDEO_CAP);
> +	if (!fmt)
> +		return -EINVAL;
>  
>  	f->pixelformat = fmt->fourcc;
>  	f->flags |= V4L2_FMT_FLAG_CSC_COLORSPACE | V4L2_FMT_FLAG_CSC_YCBCR_ENC

-- 
Regards,

Laurent Pinchart

