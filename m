Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9346C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iVTW3QSF;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Etw0Vkb0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wQTQ2BlNBlnrIHdGytttWu+xdq4uRYYP4XBnlNM3/o4=; b=iVTW3QSFsFlJ4bfmuCa3I+RJPC
	8u+2P/4A1/HgPily0N+jHKZHewkq8RouD6Iro8d4uGmArfPqn4Mfc9Z5owHjWejZ2fsD6hIIeKutI
	kQj/fKXf+BA24HfC2Ci8/jDdI1DhKLEe1D5TY6SX5+lwAWG95lBGqlHEY3ASdAgyCHmKc8rdhcx4S
	ZJVqLmTxs3NKXZkQ0O1ZVAIdqh7NhYnCtl4SsBgTw7lAjyTg+d1Rel9DbMbig5bCG2FlWik/oynmW
	1hIP0WPhGenKfqr1amYCQTfFXwwZfcnK2WyKQ6O+d+eZqkF6oPKhAjDMUNGFb6dfxdXnlxqsMHxvy
	OA0m8dmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOTX-00000000g0A-2Uya;
	Mon, 09 Nov 2026 12:27:51 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOTR-00000000fx6-1H9g;
	Mon, 09 Nov 2026 12:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794227265; x=1825763265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Y8iBSvePD9F3+qWjIlNEwUQcsn2WT6jELLutndCvW8=;
  b=Etw0Vkb0UeWUIK60nXH03UDeuja/TacbKZgjUSb1gO3IE1BjWy4gaQ4W
   Y8xXctMf2NQza20J4m4YfBhLsB/X8bd2VdBbvIoJJFKazPT4zf2IpDLe3
   x0+WtwrYSHRvUS9Cm733f7UyeaFy+9o0YCQp3q8utSnyyVoQbyZOSVrwq
   wCsW/c0pmFNpLzbhJPtLBbosOznTZv/YnnHdYU7XB0PVHze8NU42+8c33
   An0rKoCjOJZxuaxsJC5SlMUq6y5nE7omIM41FXETZ99kvBj1XPqN/cx3y
   eZP4b7Cvas5acaB09R8p4ndTiIVI0PsoJpH+lEZVD5whFDoB54yGvlVzn
   g==;
X-CSE-ConnectionGUID: T7w8qbD4Q0GMdHcdnG+JIA==
X-CSE-MsgGUID: SbcS2EKDTNONjhi6TcvWDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2824404"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2824404"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:27:44 -0800
X-CSE-ConnectionGUID: UAcwG4PlRhuWVyFQQFvZDg==
X-CSE-MsgGUID: 47AtnCsMQOK1eFz0IkzprA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8188661"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:27:42 -0800
Date: Mon, 9 Nov 2026 13:27:34 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Faizel K B <faizel.kb@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH 1/2] media: rockchip: rkcif: Filter enumerated formats by
 media bus code
Message-ID: <avG782VCMTWTNax0@mdjait-mobl>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-2-faizel.kb@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105232310.385463-2-faizel.kb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_042745_408262_9CC2FE2C 
X-CRM114-Status: GOOD (  19.95  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On Thu, Nov 05, 2026 at 04:23:09PM -0700, Faizel K B wrote:
> VIDIOC_ENUM_FMT ignores the mbus_code field and returns all formats,
> although the video devices set V4L2_CAP_IO_MC. Return only the formats
> that match the requested media bus code.
> 
> Otherwise userspace can pick a pixel format that doesn't match the
> media bus format, and then interprets the captured data in the wrong
> format.
> 
> Signed-off-by: Faizel K B <faizel.kb@gmail.com>
> ---
>  .../media/platform/rockchip/rkcif/rkcif-stream.c  | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..f2a24832a8cf 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -395,13 +395,20 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
>  				     struct v4l2_fmtdesc *f)
>  {
>  	struct rkcif_stream *stream = video_drvdata(file);
> +	unsigned int i, n = 0;
>  
> -	if (f->index >= stream->out_fmts_num)
> -		return -EINVAL;
> +	for (i = 0; i < stream->out_fmts_num; i++) {
> +		if (f->mbus_code &&
> +		    stream->out_fmts[i].mbus_code != f->mbus_code)

what about dvp capture. The dvp_out_fmts[] does not have the mbus_code
set.

> +			continue;

--
Kind Regards
Mehdi Djait

