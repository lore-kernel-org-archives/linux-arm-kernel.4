Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C036606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S5Ntc61+;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Le5cC+P8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n9s+Iv6o4T44HnlSLGtNszPAgrcaF+/YdTYKaUuhfQU=; b=S5Ntc61+XlsUPDFnBbPy9J112E
	QD9F6ZrZhsCzhR+BxzBLunARYwePsaYDj0YrHx71YesCp7aoCo4WCbzyFwN5Po7lC+ERtmlhLDowh
	UYG8HVgUxOGGR09oQxruyX/Bqkeoto4DsAUCyF2MmyuwvZCRbwbwHFah24RwRftJEBG+5aLnQbKsr
	84LlVdT/UibSpmQ6Nha0YJ6zbK3DPRTGtp3tka9sXYqOyYCl+H1wq/gzWc7XUcH6jaDHSLmilEVCK
	uwW57SLZMsdoOzaPivlNMpqOhjfPAw80n1SDiYPl8/qE0j0SnInKGPrahsMUaLNrynsqo6eyr6xnA
	4c6WK3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMJN-00000006Sz9-1G8H;
	Tue, 17 Nov 2026 16:45:37 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMJL-00000006Syd-2Knf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794933936; x=1826469936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N+d66yr6C0e8MRXHvNBLsN+m8f+qKcd72SfnRt9GtX0=;
  b=Le5cC+P8jMubLDGyFfSVF2mnYYoiiEKnf7S+62AcCANQIhhjU0FwfGGn
   fqm9F5JnZynz/A/YDr8rl4k4N9Iaf3TUFj25VMIiaOTpAv3GE7U0fVgv0
   ZisZk0iYKGftay+ibXgto/32s83DJcdlD6/2HpRYWzwBncwKTGFgdopVT
   VMbCyYbhllkMHsH5HQOd46ncSDgjiWF+g6lqvqvakXLiXRJrQmPbuzVWv
   nYghRv0rQMOc+JKdm2KnOlx2UNQikVyZ3YVe6DNHKXUKh37o/IrU7fWOZ
   1FUpU6lbuiVswVp3+86F7jOPMFi62wzeg9hJ2Wnrr2TsjpFaDevoqb0Aj
   A==;
X-CSE-ConnectionGUID: 6cUSHgNnQv+pvs9XDLHORA==
X-CSE-MsgGUID: 0K9p7RKRSLaiQEAxLiOWuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3755261"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3755261"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 08:45:35 -0800
X-CSE-ConnectionGUID: BiGz+kCjTaG1Jkk1oxiCfg==
X-CSE-MsgGUID: 3rejU2SxSEGqQl4sVSDFOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10412452"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 08:45:31 -0800
Date: Tue, 17 Nov 2026 18:45:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com, amin.gattout@gmail.com,
	antoniu.miclaus@analog.com, gregkh@linuxfoundation.org,
	mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] iio: adc: at91_adc: fix NULL pointer dereference
 on trigger remove
Message-ID: <avyEqQEL3A_YNcgg@ashevche-desk.local>
References: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
 <20261117140510.391907-2-abdelnasserhussein11@gmail.com>
 <avyEb9La1tqS90Cp@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avyEb9La1tqS90Cp@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_084535_661057_38FB6348 
X-CRM114-Status: GOOD (  12.57  )
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

On Tue, Nov 17, 2026 at 06:44:37PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 17, 2026 at 04:05:08PM +0200, Abdelnasser Hussein wrote:

...

> >  	for (i = 0; i < st->caps->trigger_number; i++) {
> > +		if (!st->trig[i])
> > +			continue;
> >  		iio_trigger_unregister(st->trig[i]);
> >  		iio_trigger_free(st->trig[i]);
> >  	}
> 
> Yes, but no. Please, rather fix the above mentioned IIO trigger APIs to be
> NULL-aware.

Actually the iio_trigger_free() is already NULL-aware, so make it only for
iio_trigger_unregister().


-- 
With Best Regards,
Andy Shevchenko



