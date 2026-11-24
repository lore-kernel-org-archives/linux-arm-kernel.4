Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D6606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=smEtin2q;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jTUatixS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QB3iU+E6oyxQS/JyhDVo0yHo/2d1Hsj9txbeC2yWP8g=; b=smEtin2qGMIxyBrEAo/MXhp7G5
	0uXdjAqsG2P4YZnfxvF6aX5pljIj/zKITgHb/8iB8A7YUm1Itz9dPQkkKO7xPzN+w2OUOkWkigONz
	BJCi5jUTZ6FApUyrdu7hWWVbQX1E986TtLzRktWQuCcLw3R4ApKcedyJ9Ti72i6nXyjrHh04rj9HO
	NkZjfRAfETR11dDooZRXo18dsmueq9tprsx8TpTvNBTdOC8JcGPVbnQKjJQJoEByMh6NcPr9nbgXT
	nnGlxAF22m4nTN3I5+Q26tgZvvlwR4qpG14Qj0C1L72WOVMmW08X3CdzDXbpr4wk8pBB8tBG7qdv0
	bKmujYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuEf-00000007Kqf-3Hnl;
	Tue, 24 Nov 2026 17:23:17 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuEb-00000007KoB-0UCl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795540993; x=1827076993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wpVMG93aHYjeK4cRmMuTJVoZTPgP747FjeTd/hCPVTE=;
  b=jTUatixS0b0FKDuIifuAZ7aQdOy8up1OrGgD/qZ9m/eu3SbGWMjLAd43
   ZESq+jl8yeZXaTEIzTHY/EcP8/RxcNxXE/W7mbeldlCHjWa8ClwDP7L8a
   unr8WTkP/fPx4t0z1uZbx35M21k7GXF/Ypq547NfB0takR3zeW5BEUTBk
   0OLUorekV+PvtDcz1e41XGik9w12wmVd/0K8CSMpcEoXUXeTjmdMHmdq8
   NQCLYv03NRHY97og/P4zLKyLrCBOg6NcRr0sj+QqaP64VkafXl91/lCYe
   3rd+8SSjjt0BBmYphka1TbS8mVdfDRxtcLFJcfy/CPVjBY2dGI5o7T5xF
   g==;
X-CSE-ConnectionGUID: yjB4z3alTUK4GCvbyaX6wQ==
X-CSE-MsgGUID: gBBPjyxYQ4momxi+hjKBuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4447381"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4447381"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:05:23 -0800
X-CSE-ConnectionGUID: gVewJTBkQdmaPuvBAvZOCQ==
X-CSE-MsgGUID: FfvISExHSDqpLos8PF/+mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12029816"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:05:19 -0800
Date: Tue, 24 Nov 2026 19:05:17 +0200
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
Subject: Re: [PATCH v5 14/16] iio: adc: xilinx-xadc: Split driver into core
 and platform files
Message-ID: <awXDzR6tSPHh64SZ@ashevche-desk.local>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
 <20261110050201.1850399-15-dileepkumar.nagavarapu@amd.com>
 <avNGcpcemoeE3J7O@ashevche-desk.local>
 <42949fe9-b336-40e7-8a8e-43f6d24da9bc@amd.com>
 <awVzDqxuwsOjoFCi@ashevche-desk.local>
 <f7273b47-0835-4afb-9e45-ddf729f05b8e@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7273b47-0835-4afb-9e45-ddf729f05b8e@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_092313_274066_A7B234EF 
X-CRM114-Status: GOOD (  27.61  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 10:23:29PM +0530, Nagavarapu, Dileep Kumar wrote:
> On 11/24/2026 4:50 PM, Andy Shevchenko wrote:
> > On Tue, Nov 24, 2026 at 04:33:59PM +0530, Nagavarapu, Dileep Kumar wrote:
> > > On 11/10/2026 9:59 PM, Andy Shevchenko wrote:
> > > > On Tue, Nov 10, 2026 at 10:31:59AM +0530, Dileep Kumar Nagavarapu wrote:

...

> > > > > ---
> > > > >    drivers/iio/adc/Kconfig                       |   8 +-
> > > > >    drivers/iio/adc/Makefile                      |   5 +-
> > > > >    drivers/iio/adc/xilinx-xadc-core.c            | 690 +--------------
> > > > >    drivers/iio/adc/xilinx-xadc-events.c          |   1 +
> > > > >    ...inx-xadc-core.c => xilinx-xadc-platform.c} | 818 +-----------------
> > > > >    drivers/iio/adc/xilinx-xadc.h                 |  27 +
> > > > >    6 files changed, 72 insertions(+), 1477 deletions(-)
> > > > 
> > > > This is weird statistics... I think it's a bug in Git. What it did, it copies
> > > > -core.c twice and uses statistics on each file after that without duplicating
> > > > the *original* amount of lines.
> > > 
> > > I generated the patches using the following command: "git format-patch \
> > >     -M \
> > >     -C10% \
> > >     --histogram \
> > >     --base=origin/togreg \
> > >     --cover-letter \
> > 
> > >     --subject-prefix="PATCH v5" \
> > 
> > Hint: You can use -v5 instead of the above long parameter.
> > 
> > >     origin/togreg..HEAD"
> > > 
> 
> > > If I remove the 10% similarity threshold from the command,
> > 
> > 10% is way too low threshold!
> 
> Is it OK to use `-M -C --histogram` (default thresholds) instead?

Yes.

> With it, xilinx-xadc-platform.c is shown as a new file with all lines as
> additions rather than as a copy of xilinx-xadc-core.c. The statistics
> then look like this:
> 
>  drivers/iio/adc/Kconfig                |   8 +-
>  drivers/iio/adc/Makefile               |   5 +-
>  drivers/iio/adc/xilinx-xadc-core.c     | 688 +------------------------
>  drivers/iio/adc/xilinx-xadc-events.c   |   1 +
>  drivers/iio/adc/xilinx-xadc-platform.c | 677 ++++++++++++++++++++++++
>  drivers/iio/adc/xilinx-xadc.h          |  28 +
>  6 files changed, 733 insertions(+), 674 deletions(-)
> 
> Are these statistics OK?

Yes.

> > > xilinx-xadc-platform.c is no longer detected as a copy of the original
> > > xilinx-xadc-core.c, which is not the expected output.
> > > Is there a better command or approach that would allow Git to recognize
> > > xilinx-xadc-platform.c as being split from the original file while also
> > > producing meaningful diff statistics?
> > 
> > But it's not a full copy. Have you tried to apply the patch from the mailing
> > list and see if `git am` correctly recognises the split?
> 
> Yes. I applied the v5 series from the mailing list with `git am`
> and all patches applied without errors

So, then it seems like a Git bug as I pointed earlier, and hence it's fine
to use 10% threshold in _this_ case.

-- 
With Best Regards,
Andy Shevchenko



