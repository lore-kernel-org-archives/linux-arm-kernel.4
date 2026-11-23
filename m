Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D536B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VR+nb7lT;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gp7zuQST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o4c3gw5ayTeVyj4tzoPmy8cMt5RLKRl7oVUcToc0K6g=; b=VR+nb7lTWz1+JCnhk4FSSJIvZP
	ZUbweDAypLLJuH5cDEIzFfqvSzOVyZjWisAI9OowT9upkHL7BpqqE55+UFkeJ2wfftCP84eS+X/9d
	+RSHj9/tG8GVj9xxJLMKNEemNGuXdw3TSZe9VSjnGWzwaw00FvFjCb+FAl9yDEsVsySE7EKrkwZEx
	7KJredajytcFqV5jqi8cTwsH/OI8Y7zHlHmZi0ntDCXnLWV0b7z7/pcDEG9/ARu0GthG5LgClIr4x
	hG/Ku1WFTIMpzE59IYqupaylGk7WT3rrMiTaLTrYKQoJ5mZ/72VWHKte48SHrF4l8v6OFEBQgDFDV
	64Cl/2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQOz-00000002iuv-3AIh;
	Mon, 23 Nov 2026 09:31:57 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQOr-00000002itg-3GNv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795426310; x=1826962310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E2y5GFJ9BPlcQ4pbbpDmSkF+0dOWl7ZmiyJDcKj96mg=;
  b=gp7zuQST+LVKrhz0uR9yTKN9QTptA98uCnlTFdDLv1rzNPoOdOj6j8XR
   hZWOEXIl2SE82Vcpbmno7x2laQoNlOF590kHsGxDE6TFtzKR8DE3cNkCr
   AVAI6ni2PhEyhLxEiYyPKtAwIo8fRl5Q9P+y8fXOUSRAJ+JF46DUgs16c
   CR8rIZDBSl9OP4q2EvRQdfBKWJTR/a6yIC1gA2KsBmhKWdIPqurpzBNUF
   Az0rynYjMtC5jkNhq/o2g3L63FXkUW3n6vfzltsMRQg/4ZXOxB1BLxAy4
   Vh29eiVQ63jh+oEEMgj6EcvguUhxv44gusqVtDoMfgqcdCkV+1jSKOMhh
   A==;
X-CSE-ConnectionGUID: r1PeuGi9QcGdN70oDbsxKg==
X-CSE-MsgGUID: RO86KprvSEOoiTiRqhEiFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4236415"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4236415"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:31:48 -0800
X-CSE-ConnectionGUID: RalA61qXRWWn9SmkXAgNwA==
X-CSE-MsgGUID: O9rcS9HvTJGEA/JvnhVvbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11133388"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:31:44 -0800
Date: Mon, 23 Nov 2026 11:31:41 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>,
	linux-iio@vger.kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com, amin.gattout@gmail.com,
	antoniu.miclaus@analog.com, gregkh@linuxfoundation.org,
	mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] iio: adc: at91_adc: fix NULL pointer dereference
 on trigger remove
Message-ID: <awQH_Rr8b_Eu0Vew@ashevche-desk.local>
References: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
 <20261117140510.391907-2-abdelnasserhussein11@gmail.com>
 <avyEb9La1tqS90Cp@ashevche-desk.local>
 <avyEqQEL3A_YNcgg@ashevche-desk.local>
 <20261122002118.723b23b3@jic23-hlaptop>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122002118.723b23b3@jic23-hlaptop>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013149_854065_E5D8CFC0 
X-CRM114-Status: GOOD (  20.20  )
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

On Sun, Nov 22, 2026 at 12:21:18AM +0000, Jonathan Cameron wrote:
> On Tue, 17 Nov 2026 18:45:29 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Tue, Nov 17, 2026 at 06:44:37PM +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 17, 2026 at 04:05:08PM +0200, Abdelnasser Hussein wrote:  

...

> > > >  	for (i = 0; i < st->caps->trigger_number; i++) {
> > > > +		if (!st->trig[i])
> > > > +			continue;
> > > >  		iio_trigger_unregister(st->trig[i]);
> > > >  		iio_trigger_free(st->trig[i]);
> > > >  	}  
> > > 
> > > Yes, but no. Please, rather fix the above mentioned IIO trigger APIs to be
> > > NULL-aware.  
> > 
> > Actually the iio_trigger_free() is already NULL-aware, so make it only for
> > iio_trigger_unregister().
> 
> I'd rather we didn't.  Any code that is unregistering a trigger
> that it didn't register is probably really very very buggy.
> I'd like them to crash or at least guarantee that sashiko
> flags it.  We could add a warn if it is called on NULL I suppose
> but that is ugly.

Can we add a comment there to avoid making such a change explaining
why we won't iio_trigger_unregister() be NULL-aware?

-- 
With Best Regards,
Andy Shevchenko



