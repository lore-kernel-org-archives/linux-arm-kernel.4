Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FD2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 23:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sSwQi+GV;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=RpIWK9rt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U1SHI1w/RnQ/LW4m+0Hh+qVKQdWDnUn2TmXmHO+DxG0=; b=sSwQi+GVXjWN0Xva/vow47AyMb
	dGzTAjoaVOLRQyoQK845/350u7W4Q/i/38O8hqEsqxGfM/lFkWtf7pW+ZAGNBPL9y6IojIGVpklFv
	0fvq4MdKyQ+itSpkJIBm2nZwOOlCLos20rm5TDeKCZ3L0WCyOcXkPYa/LIVtlsaS5LMkH41a42Q+X
	lOaVeYqJkkQU8KKEdoM+9Im9DTH1ePSupuK+CQIDFR9cV2Hi9tBlE0FaAaUALiVhHi5dzKH4VTpvQ
	vgBSRVBYT2SNuQwLgM2guZfDJQTvg4H1usLmIvgWNgVyGD+0Sz1RqyMcsyJPi4xPWR34ON5zMWHya
	73tQGdQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYRC-00000001vV5-2WFi;
	Mon, 09 Nov 2026 23:06:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYR9-00000001vUG-1Pt3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 23:06:05 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AE0133D;
	Tue, 10 Nov 2026 00:03:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794265416;
	bh=5tzFgyfxwWQfocd3QLAWDXzBSro0If9o1QGzqiZw60s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RpIWK9rtwJGOC0ctrtUrhBeLe3+/F/uhCIiE/9ea5dwmr51jHsadpm3WCtISeY2I0
	 GHRsGtUsWSkTlaLKEVluCdcq4XOc2t1E22Ua8NQSzAYjRp9kjM9574GprQasw9AV9H
	 U3A+L5SO+r2vAPhM95uVHiLrWghHPtWoRxq/1qqY=
Date: Tue, 10 Nov 2026 01:05:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH] media: imx-mipi-csis: add support for
 MEDIA_BUS_FMT_YUYV8_1X16
Message-ID: <20261109230556.GA77654@killaraus.ideasonboard.com>
References: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
 <20261014215606.GB283442@killaraus.ideasonboard.com>
 <AMBPR04MB3355230D320B45E39F65B74126FA9C2@AMBPR04MB335523.eurprd04.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AMBPR04MB3355230D320B45E39F65B74126FA9C2@AMBPR04MB335523.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_150603_842788_ADA83201 
X-CRM114-Status: GOOD (  28.89  )
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

On Thu, Oct 15, 2026 at 03:31:53AM +0000, G.N. Zhou (OSS) wrote:
> On Thursday, October 15, 2026 5:56 AM, Laurent Pinchart wrote:
> > On Fri, Oct 09, 2026 at 06:58:41PM +0800, guoniu.zhou@oss.nxp.com wrote:
> > > From: Alice Yuan <alice.yuan@nxp.com>
> > >
> > > Add MEDIA_BUS_FMT_YUYV8_1X16 to the list of supported bus formats.
> > >
> > > The format uses the same CSI-2 YUV422 8-bit data type and 16-bit
> > > parallel bus width as MEDIA_BUS_FMT_UYVY8_1X16, but with a different
> > > component ordering. Supporting YUYV allows sensors and bridge devices
> > > that output YUYV formatted YUV422 data to be used with the i.MX MIPI
> > > CSIS driver without requiring format conversion.
> >
> > What sensor(s) do you have in mind ? CSI-2 does not support other component
> > orderings, the YUV4222_8B data type specifies the ordering on the bus as [U1,
> > Y1, V1, Y2], and V4L2 maps that to MEDIA_BUS_FMT_UYVY8_1X16.
> 
> The sensor is the OV5640. Its driver already advertises MEDIA_BUS_FMT_YUYV8_1X16
> for CSI-2 mode in mainline (ov5640.c, ov5640_csi2_formats[]). According to datasheet,
> ov5640 ISP reorders YUV components via register 0x4300 before transmitting over the
> CSI-2 link using the YUV422_8B data type. The CSIS itself is a pass-through — it does not
> interpret or reorder pixel data, it just forwards whatever the sensor sends. Without
> YUYV8_1X16 in the CSIS format table, media link validation fails when using the OV5640
> in YUYV mode.

That makes sense. Overall we may have been better off by not exposing
MEDIA_BUS_FMT_YUYV8_1X16 in the ov5640 driver and relying on the DMA
engine on the host side to handle different YUV formats, but as the
driver exposes it, it makes sense to support it here too. I don't like
that all CSI-2 receiver drivers would need to be patched to support
this, but the number of YUV components ordering isn't as large as for
CFA patterns, so we can live with it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > > Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > > ---
> > >  drivers/media/platform/nxp/imx-mipi-csis.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > index 5f9691d76434..14a00b9fcedf 100644
> > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > @@ -382,6 +382,11 @@ static const struct csis_pix_format
> > mipi_csis_formats[] = {
> > >             .output = MEDIA_BUS_FMT_UYVY8_1X16,
> > >             .data_type = MIPI_CSI2_DT_YUV422_8B,
> > >             .width = 16,
> > > +   }, {
> > > +           .code = MEDIA_BUS_FMT_YUYV8_1X16,
> > > +           .output = MEDIA_BUS_FMT_YUYV8_1X16,
> > > +           .data_type = MIPI_CSI2_DT_YUV422_8B,
> > > +           .width = 16,
> > >     },
> > >     /* RGB formats. */
> > >     {
> > >
> > > ---
> > > base-commit: b38d06ad1e13c32970d58039c154f009b81a3368
> > > change-id: 20261009-csis_sam-c5c10ed12322

-- 
Regards,

Laurent Pinchart

