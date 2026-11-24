Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1299D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Ml7xBGn;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DTExwPAV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nNxFk53XQyez1lUlJ2CrGyJaS71dey2820xfRwu34aw=; b=2Ml7xBGnwiVMyLFtHq8V0F+1Jf
	DFLMKfmzFqZkAoA3BGVvijxwNXNbk4D4eQ+ddhEkYdslSoKzsaL36wIfhJyz7mXjIHmsjxj+HLRME
	iKDCau0b+VxZ8UrXGwXWRWvoYfgfD6WX4Q1LAMLKWLpWLiOs4s3iElNUz/RchyUkwH9vLw0Ic4Cds
	TIeEFTErGGh1N4WibIXfcouq16RkyvZQH8nahm64yQEjgFTG9ekXLiqsetuhQPDqYmDEcT+pOzg3z
	USO2RNITDrkQa+/q3iARks1JVegVTVGrw9SSUyNiQMJueLJwd3sUelcTPM87YDhrNWPDA1b0Qyy6x
	vxX/4nXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoaE-00000006KXR-1VZW;
	Tue, 24 Nov 2026 11:21:10 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoZw-00000006KPj-0XP1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795519253; x=1827055253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=03Q6v7uaraHRYSZmyQflbI/DTg3ospB40MWwlur2lms=;
  b=DTExwPAV+ld827QZTMAzTlX8ogLpYfWLw1DkeUvC0DbTWEmRVqnyoFmC
   kRVgmFdkkgebxfIYnd1F7BsH3dMOfyRWzje3xJu/mwYXoe5YVAtUDkcvL
   ZlNJvj88yYZwclrhP1quLpRXrv6Dht4bPUt14Twdt3vkcZQkNCSaeizB7
   6X6aHw9z5s92juzL7Mr0fGTn9irfXrSjXXaINGx82qiTHC3pG0DxwUV/S
   OFjbor6lSGfNb8+KZjTG9V11lDfZd2rlCDbcjU+/REk19HPr1JVdWOFWP
   uXMtK8W+UAxPau7oZZgjE12LAa0giIBqQWmk92h1Bq/kPMqQK8LTjzF2R
   A==;
X-CSE-ConnectionGUID: h9SrwHegS86iRYc1G5eWeA==
X-CSE-MsgGUID: qfJ7yl5FTg2/pDHd7aWbVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4264533"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4264533"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 03:20:51 -0800
X-CSE-ConnectionGUID: 97NAeX2/R9KMk/C4ZiMX/Q==
X-CSE-MsgGUID: LdKfzg7dQFuqZ0sTExnHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11872329"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 03:20:48 -0800
Date: Tue, 24 Nov 2026 13:20:46 +0200
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
Message-ID: <awVzDqxuwsOjoFCi@ashevche-desk.local>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
 <20261110050201.1850399-15-dileepkumar.nagavarapu@amd.com>
 <avNGcpcemoeE3J7O@ashevche-desk.local>
 <42949fe9-b336-40e7-8a8e-43f6d24da9bc@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42949fe9-b336-40e7-8a8e-43f6d24da9bc@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_032052_203463_DB349626 
X-CRM114-Status: GOOD (  19.90  )
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

On Tue, Nov 24, 2026 at 04:33:59PM +0530, Nagavarapu, Dileep Kumar wrote:
> On 11/10/2026 9:59 PM, Andy Shevchenko wrote:
> > On Tue, Nov 10, 2026 at 10:31:59AM +0530, Dileep Kumar Nagavarapu wrote:

...

> > > ---
> > >   drivers/iio/adc/Kconfig                       |   8 +-
> > >   drivers/iio/adc/Makefile                      |   5 +-
> > >   drivers/iio/adc/xilinx-xadc-core.c            | 690 +--------------
> > >   drivers/iio/adc/xilinx-xadc-events.c          |   1 +
> > >   ...inx-xadc-core.c => xilinx-xadc-platform.c} | 818 +-----------------
> > >   drivers/iio/adc/xilinx-xadc.h                 |  27 +
> > >   6 files changed, 72 insertions(+), 1477 deletions(-)
> > 
> > This is weird statistics... I think it's a bug in Git. What it did, it copies
> > -core.c twice and uses statistics on each file after that without duplicating
> > the *original* amount of lines.
> 
> I generated the patches using the following command: "git format-patch \
>    -M \
>    -C10% \
>    --histogram \
>    --base=origin/togreg \
>    --cover-letter \

>    --subject-prefix="PATCH v5" \

Hint: You can use -v5 instead of the above long parameter.

>    origin/togreg..HEAD"
> 
> If I remove the 10% similarity threshold from the command,

10% is way too low threshold!

> xilinx-xadc-platform.c is no longer detected as a copy of the original
> xilinx-xadc-core.c, which is not the expected output.
> Is there a better command or approach that would allow Git to recognize
> xilinx-xadc-platform.c as being split from the original file while also
> producing meaningful diff statistics?

But it's not a full copy. Have you tried to apply the patch from the mailing
list and see if `git am` correctly recognises the split?


-- 
With Best Regards,
Andy Shevchenko



