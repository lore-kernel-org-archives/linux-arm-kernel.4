Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B055C606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ysurQMOt;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jiekmIRP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6VZrzcsQi8k3zpdbfofVMybmQDhK3GqBlZKfamS3780=; b=ysurQMOtxlcp9UpdkMAMUslfg/
	ZDxJoWud/79GsUtkccMxHYoSe2PWSvog99FOJVtiBa1M5QtASOR1WiCUaTMbht+KU2AnshVgjf2Ev
	g06MuLdbFkmnBODYm5pBRU65S3HH43A9cK2sJa5EzPU+GhFOp4Y17MOO9ZsoYONOL8TmGllNEr8xX
	QY2iWoEcFgQkJWZpyHAaAAtQXbiT5gkx3fs5/y41FEqQ0xaRNpXRJsFR/irfmg1mIkhiulzjEN4qZ
	W35Fi7ZrtzLovWwy5tqwR14rek3Xy77/Frez3oeXyIVCg3gJbNDetn45fsjW0WYcwf9Ir9TRNArhz
	LoG5j6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuHZ-00000007LdL-1IfX;
	Tue, 24 Nov 2026 17:26:17 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuHU-00000007Lbw-4965
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795541173; x=1827077173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SzT0csSgnqvDnoV3RleMeqvxldVFfB4PdCbmLd/qpxc=;
  b=jiekmIRPvdaD0DuN7/76CVDFb3UBCqyn47WV+bTHiN8o/ceUGe/r0H8l
   GyX5l1c39sZ/zr4OY7+RqmmanVSlSiWEBVDZW0bEGZ9bxzzeoSUvMbcW3
   xzpm/ML0s8SZDijLilERgCJLe+Elf6GmopP6XFymNtKeFqtsgoU9kyaTg
   uFZF8obo4S+liWFG2guPxu0HCtoL47/rIqJEWS7a8HUUeW1O4IHUdE8hj
   uMqp62/UY3Wd7C/QW47sSlhPsK/phSCBcQyjkmsqWvUYjRMthwsuFBez9
   Lq62aKQTEw+zMLfNmXoo10ALc87nttbi2lc3t5K0Rx5NIxtAgP1Fyyq+1
   Q==;
X-CSE-ConnectionGUID: rORCta+WRzSw9XmNxcFDTg==
X-CSE-MsgGUID: iUjbtVfMTgq4Vj7aze3PSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4289533"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4289533"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:24:11 -0800
X-CSE-ConnectionGUID: UfVXggqrSuWpspkfSqBQIw==
X-CSE-MsgGUID: rIT4lxKyQdyAT/3W9GUPrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12034050"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:24:07 -0800
Date: Tue, 24 Nov 2026 19:24:05 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Nagavarapu, Dileep Kumar" <dnagavar@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v5 12/16] iio: adc: xilinx-xadc: Refine Zynq read/write
 error handling on timeout/interrupt
Message-ID: <awXINQWDns96Ngwi@ashevche-desk.local>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
 <20261110050201.1850399-13-dileepkumar.nagavarapu@amd.com>
 <avNEpH6KGJkeI7dX@ashevche-desk.local>
 <c3a7df9c-e337-47ac-9a6d-6bb81177affa@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3a7df9c-e337-47ac-9a6d-6bb81177affa@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_092614_912400_269890F8 
X-CRM114-Status: GOOD (  18.29  )
X-Spam-Score: -4.4 (----)
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

On Tue, Nov 24, 2026 at 10:24:59PM +0530, Nagavarapu, Dileep Kumar wrote:
> On 11/10/2026 9:51 PM, Andy Shevchenko wrote:
> > On Tue, Nov 10, 2026 at 10:31:57AM +0530, Dileep Kumar Nagavarapu wrote:

...

> > >        ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
> > > -     if (ret == 0)
> > > -             ret = -EIO;
> > > -     else
> > > -             ret = 0;
> > > 
> > >        xadc_read_reg(xadc, XADC_ZYNQ_REG_DFIFO, &tmp);
> > > 
> > > -     return ret;
> > > +     if (ret == 0)
> > > +             return -ETIMEDOUT;
> > > +
> > > +     if (ret < 0)
> > > +             return ret;
> > 
> > First check for generic errors, then for exclusive conditions ( == 0).
> > 
> > > +     return 0;

...

> > >        ret = wait_for_completion_interruptible_timeout(&xadc->completion, HZ);
> > >        if (ret == 0)
> > > -             ret = -EIO;
> > > +             return -ETIMEDOUT;
> > > +
> > >        if (ret < 0)
> > >                return ret;
> > 
> > Ditto.
> 
> This patch does not fix any behavioural issue; it only changes the
> error codes.

Yes, it changes potential behaviour of the callers (which probably none) but my
comment is tighten to the code that is being changed.

> Sashiko suggested adding a Fixes tag. Is it OK to ignore this comment, or do
> you have any other suggestions?

If comment is okay to ignore it would mean the comment has no value. I don't
think so. Otherwise, please justify that.

-- 
With Best Regards,
Andy Shevchenko



