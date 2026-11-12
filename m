Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797E3606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UxZQQ5Rg;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=shGXhYfO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8vBZUF5hn+hX56ST3pucRyV0dagx5wgip9bLjW8uoRY=; b=UxZQQ5Rgf+huTGu8Zj95Kbyvl+
	6DCxNXwAA02UoFWdDqnDjVZUtQ/QWzLcFac4jwXuMUmpqFBcmv4SGQqlp67+ft3DGB6FX56LRQhXL
	3jDNyBWLokKoQH7d7K0okRC15po0eaeQaGmRFraU9Ign/PRMKyne4InYgmICaPCH1FemzjsIMuiwR
	kIAHANMYvFRZiT/AuJp5917BxhBhugjCiQhjwnhmE2FCE2RnrJH2qbke7uB9rt1UmzeXMRNo9schU
	ZZW0dtTl/l5RwAgbpIOTE4uA7+8GZkYswWJFMxh5zIx9g/0Ir/6XFjo2DQ/pFi/qIEhuneKSbs1Nq
	IvYzKNpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJlB-00000008QIn-0SRQ;
	Thu, 12 Nov 2026 01:37:53 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJl6-00000008QHn-3KjF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:37:51 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAD7F33D;
	Thu, 12 Nov 2026 02:35:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794447322;
	bh=JRkDYlrl3ziGUdvobqOMclP0M0whEvcZbmSFJ8MdrLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shGXhYfO3xMKtpLDBPTgAFQAp/5BFgsCm5liYTAT/MIGmDy2UgX59upIIhiQRQyuy
	 k0xJ6TVQlixcI8HyCsT/wRjeGkyAdm0TqBV17DkuuQJoaTQvSAaEa0Bh828+L9VmhI
	 hbsw5ke+4QDvfdmFJC4sRY3liVntzS25cM7PQ0sM=
Date: Thu, 12 Nov 2026 03:37:44 +0200
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
Subject: Re: [PATCH v4 02/11] media: imx8-isi: Extend output format mask to 7
 bits
Message-ID: <20261112013744.GA449716@killaraus.ideasonboard.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_173749_956008_606D8755 
X-CRM114-Status: GOOD (  17.57  )
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

Hi Zhou,

On Tue, Sep 29, 2026 at 04:52:23PM +0800, Guoniu Zhou wrote:
> The ISI output format field width differs across SoC generations:
> i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
> from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
> extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.
> 
> Extend CHNL_IMG_CTRL_FORMAT_MASK to 7 bits unconditionally since
> bit 30 is unused on older platforms.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v3:
> - Use unconditional 7-bit mask instead of per-platform approach (Laurent)
> - Drop Reviewed-by from Frank Li due to significant change
> 
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index e795f4daf3ff..c704be882705 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -39,7 +39,7 @@
>  /* Channel Image Control Register */
>  #define CHNL_IMG_CTRL						0x0004
>  #define CHNL_IMG_CTRL_FORMAT(n)					((n) << 24)
> -#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(29, 24)
> +#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(30, 24)

I've double-checked that bit 30 is reserved on all SoC versions that use
a 6-bit format.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  #define CHNL_IMG_CTRL_FORMAT_RGBA8888				0x00
>  #define CHNL_IMG_CTRL_FORMAT_ABGR8888				0x01
>  #define CHNL_IMG_CTRL_FORMAT_ARGB8888				0x02

-- 
Regards,

Laurent Pinchart

