Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226BC606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vDb/B2ID;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=evzobpqr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7oHmp7wHslwL/naMa1YIolsN1f7bMAdVcQ9QQq2tu8Y=; b=vDb/B2IDlhpQcqn/PuP+bSme7W
	JzBb9NyRmZxhC1DaGEgHG6UR9shPcLulKeZ5Pzt0Qf1qCpvIyLPIH/MCUx/IjZRJcmseZCjkodbtt
	xB/bGYcpdkV4Gp4bulQMOXvlXTeGzMewywgMUH3EPIGZ4F/fkCsRW/LMdynxr2u29ybE1cy7MimfH
	560pbGX7S8LEihcjKBvZCgA0t1iLfT4NlMheGIIefMzLKD4WOFZY3V7n+Kkxa+ULhSZX9xUmGu6Am
	0raLTSeKEinxbCJS+WwF6Aat4zYzzUOVwupV9VFCgoyFjSmuV90bBgD8m56VOlxp8tpE01k3F9mgS
	b0ZbxGkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRG0X-00000007pY7-0MRs;
	Wed, 11 Nov 2026 21:37:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRG0U-00000007pXb-15Kj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 21:37:28 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E150A219;
	Wed, 11 Nov 2026 22:34:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794432900;
	bh=ECyT+XZ12JddSk+s0WafV7Q4vG3zTupna+gcthaRXoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evzobpqrkmVb6jQGTOIvkbDkW4p2HGL3zLkW7vKT0d/o4bkHP/yBnAi8jWy+Qa964
	 aHN+1D34PJB+zHi3ADbCLfV5tHx79t64T1YL8VmkOFo61eSI9fxwI4Bp3RhOZttX8h
	 eBM82mL8zspd4g2wmYZXahR6U/P6ezlboscIW024=
Date: Wed, 11 Nov 2026 23:37:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, guoniu.zhou@oss.nxp.com,
	Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH] media: imx-mipi-csis: add support for
 MEDIA_BUS_FMT_YUYV8_1X16
Message-ID: <20261111213721.GA449775@killaraus.ideasonboard.com>
References: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
 <179443170878.3989516.10436477074407728108.b4-ty@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179443170878.3989516.10436477074407728108.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_133727_284083_9CB00EA9 
X-CRM114-Status: GOOD (  12.69  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

On Wed, Nov 11, 2026 at 04:15:09PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> On Fri, 09 Oct 2026 18:58:41 +0800, guoniu.zhou@oss.nxp.com wrote:
> > Add MEDIA_BUS_FMT_YUYV8_1X16 to the list of supported bus formats.
> > 
> > The format uses the same CSI-2 YUV422 8-bit data type and 16-bit
> > parallel bus width as MEDIA_BUS_FMT_UYVY8_1X16, but with a different
> > component ordering. Supporting YUYV allows sensors and bridge devices
> > that output YUYV formatted YUV422 data to be used with the i.MX MIPI
> > CSIS driver without requiring format conversion.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] media: imx-mipi-csis: add support for MEDIA_BUS_FMT_YUYV8_1X16
>       commit: 3fccdc8f246af658716b8b64393253b28838f355

I have applied this to my tree already. Please don't handle
imx-mipi-csis yourself.

-- 
Regards,

Laurent Pinchart

