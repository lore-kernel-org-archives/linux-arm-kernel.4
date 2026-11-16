Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3325606A889
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k1K3pYXN;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l+Gnyxh8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3NziRagd3Kp64mhlLwSQv7c8QW0heczxcZxtep8cF2s=; b=k1K3pYXN9BcifNKXLHQxwwp4/Z
	4e/h6aPxSGwn1K3vwJPCuzYMm8DmR/QJc11e1REwvZccHcntQQtIJM/8y81quLfTeptF0BdLfXzI6
	wISu73AkgMpNX5hU2HTyRgeel3DrK3eLYBLp0TyHTtPfmGf6qfnG4LB9bt8t5xiaV++TMgU1rw/iM
	IsRFznVfqlEGI2ooxZIG9T8ytVQwM5Usq6KblsL2sNWMFeujrsFk3teJOBpOK84jJDDsniBJHrpw8
	FSHj7pC0maEUWTTk/A6kqJJUVIQxzh080b9+/+i8QHyyAw3RFj0xgnWAt5qjY9ePBzqwpXC13oZDk
	wJpUQ/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwWb-00000002YnD-44W1;
	Mon, 16 Nov 2026 13:13:34 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwWT-00000002Ykc-0Gq2;
	Mon, 16 Nov 2026 13:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794834805; x=1826370805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pWEth8krOh4n8bcr9ApMvKZWcSt1+DRZOugxxERJq9g=;
  b=l+Gnyxh8ete85Yn9vxTQmXMzx1xtfjs3h4i/tSvTYDTJfZMZDwbDhoYX
   hJNzJhvlitMttawt8q7LgoJMQ4ZYHFsx/XzGchtFb0yhXDlZKh3jVmx39
   hb2lfywP7OmOFfQJ7sRUesgW0WyyesIwRZ/Y8ebryZwov2rXiUspQE/BD
   Df/YUMLClhtJsGxLmggPxbpmXen+IB7qhbr9cbyIDuxhnYPqwgdI9S8a+
   aowQy1YX/bGJ5MLK9tDfqdTnUQtmFm/JxsCpC3RlmZdPCtBfykgdD2LT8
   ndWLMLH1abVx0HrHThOLAvtGO8rPFsppmGlrkNyi+og+rq4Ehegp8btgz
   g==;
X-CSE-ConnectionGUID: 7ezBreZLSJK6GL/nu+Kmdg==
X-CSE-MsgGUID: mP73S9doQ9auOTCi6gKOFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3610902"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3610902"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 05:13:21 -0800
X-CSE-ConnectionGUID: VPEmmfBLSma1gXFsyAJBiQ==
X-CSE-MsgGUID: zYvmf/SsSoCxFPDyxQbmFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="11338445"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 05:13:18 -0800
Date: Mon, 16 Nov 2026 14:13:11 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Faizel K B <faizel.kb@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline on MIPI
Message-ID: <avsA41bM33cwYfW9@mdjait-mobl>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-3-faizel.kb@gmail.com>
 <51b09428-9d10-4f36-a811-a681e479e45e@collabora.com>
 <fxrwhxkzgihpiz52rbeuomtqkzz7izgdfcbux7osamqruc7w7u@qhvh3nkqypro>
 <8c3805ca-0be7-4634-8904-30a9c36d8962@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c3805ca-0be7-4634-8904-30a9c36d8962@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_051325_166471_4291A486 
X-CRM114-Status: GOOD (  31.95  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On Mon, Nov 16, 2026 at 12:51:45PM +0100, Michael Riesch wrote:
> Hi Faizel,
> 
> On 11/12/26 07:20, Faizel K B wrote:
> > Hi Michael,
> > 
> > On Wed, Nov 11, 2026 at 10:46:43AM +0100, Michael Riesch wrote:
> >>
> >> Come to think of it, TRM p. 2111 says for e.g. VICAP_MIPI0_VLW_ID0:
> >> "Virtual line width of even frame for ID0 path(must be aligned to double
> >> word)." which I would interpret as "it must be a multiple of four
> >> bytes". What do you think?
> >>
> > 
> > The VICAP register summary defines it.TRM part 1 (V1.0, page 2081)
> > "DW - Double WORD (64 bits) access". So 8 bytes.
> 
> Ack.
> 
> >>> +static void rkcif_stream_set_bytesperline(struct
> >>> v4l2_pix_format_mplane *pix,
> >>> +                      u32 req_bpl)
> >>> +{
> >>> +    u32 min_bpl = ALIGN(pix->plane_fmt[0].bytesperline, 8);
> >>
> >> Please add support for the bytesperline field in all the plane_fmt
> >> entries here...
> >>
> >>>      width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
> >>> +    req_bpl = pix->plane_fmt[0].bytesperline;
> >>
> >> ... and here.
> >>
> >>>      ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
> >>>      if (ret)
> >>>          return ret;
> >>>
> >>> +    if (stream->interface->type == RKCIF_IF_MIPI)
> >>> +        rkcif_stream_set_bytesperline(pix, req_bpl);
> >>
> >> Why is this restricted to the MIPI interfaces?
> >>
> > 
> > The MIPI formats all have a single plane, and the MIPI path already
> > programs the line width from bytesperline. The DVP path uses the width,
> > and I can't test it. But I agree it should not depend on the interface.
> > 
> > For v2 I would:
> > 
> > - take the requested bytesperline of all planes into account, and use
> >   the largest for all planes, as the DVP has one line width register
> >   for Y and UV
> > - compute the sizeimage of each plane from it
> > - limit it to the line width field (20 bits MIPI, 15 bits DVP)
> > - program RKCIF_DVP_VIR_LINE_WIDTH from bytesperline, with the current
> >   value as the minimum
> > 
> > Does that sound ok?
> 
> That does sound reasonable, yes.
> 
> > A question on the DVP: the PX30 TRM (Part 2, 5.3) says raw data is
> > stored as 16 bits per pixel, even from an 8-bit source. This matches
> > the width * 2 in the driver. But for V4L2_PIX_FMT_S*8 (e.g.
> > V4L2_PIX_FMT_SRGGB8) bytesperline is the width, so the buffer is half
> > the size the hardware writes. Am I missing something?
> 
> I don't have any PX30 board, and actually it is the first time I hear
> about that. Maybe Mehdi can chime in?

Unfortunately I also don't have hw with DVP and the one time I did look
online, it is really not that easy to find.

The PX30 board I used to delevop the rkcif is a custom hw that I don't
have access to anymore.

--
Kind Regards
Mehdi Djait

