Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1590606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qyE+VmIN;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FrA9Wssl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FUV/UoOBr/J6VY5krtiDaidQIeLgBTXxPj1B21P7IyY=; b=qyE+VmINPkf9d62Ao3hwSODvxe
	qm7GS7jx1OcapJUie8Yw3Yq8L5OgmLdBGxsQdgAEgLAH/x6bmwJ/wjoY8rdggzPZFKpUlN/EfIrv5
	htOLs/l6k0IjJP75E5FeFy6OsT/rSis3KnprCmCyoiwTWL4yZuqVI/Nt1SzMf23OxVJRn7xCXMKYS
	QPFk0+Y7Q1ZxuzZTc8yG2rotEPaoORhoTCyUz+QCY4LLlDe9U/c6LhvLee4sdkCOqurnsX9atz1jU
	iJzmr8VU/pwRMa8JkcsswyDrnlLX1fBFcRr/NGE2X1OiHkutGlMnRguO07R0i8GlV90Z1atX2hsIs
	wqCsW/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQfc-00000002oye-1svJ;
	Mon, 23 Nov 2026 09:49:08 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQfY-00000002oxJ-3zAA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795427345; x=1826963345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mKeY8d2xWdIsSGaHzmL0LiD0HoPYA5papgqXVJCBlWI=;
  b=FrA9Wssla9ukfgCDmPjFFjsuMc55eNP1UEdT1Y2Jtjahe7U4UBBWQ66B
   S6/mUG8J/IAjPbVMAsCVrYHdcZ7j7JyN+qj7UiU0EyJBCuVVy2diLhIaT
   QQL2drCToljoDLOIO1W/IhkX7MdsgaDkmx7DOtJrW/81TajCtfYicgbbJ
   F2TQKj1daO6eJt793BJcmyWJisIF02xHxOEDfygKG/EmnrI7Z++2vZ2j5
   z8/Ul1PrgOymOMErU4lQqPWofbTvGIyRfdesv+pigbjyJLtCBJT/v+Z24
   NEScVZY6O/aqeGY95Q/GlpSyKhvTbflVuJ0I7B1QffuwM7+wkdPDVYfe7
   A==;
X-CSE-ConnectionGUID: wQ/ituIzSk+r8LiKUnHxpw==
X-CSE-MsgGUID: eYMgZS7oRhWzEvvJXgl6Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4121841"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4121841"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:49:04 -0800
X-CSE-ConnectionGUID: 7sJ0TC2JQa2OxIi6kqHNlw==
X-CSE-MsgGUID: D7r8MFobSSCJb+ypfE4Rsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="13240187"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:49:02 -0800
Date: Mon, 23 Nov 2026 11:48:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: shyckless@gmail.com
Cc: ludovic.desroches@microchip.com, vkoul@kernel.org, Frank.Li@kernel.org,
	dave.jiang@intel.com, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, allen.lkml@gmail.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dmaengine: idma64: Kill the channel tasklets in
 remove again
Message-ID: <awQMCxhy6BurLowU@ashevche-desk.local>
References: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
 <20261123-dma-chancnt-v2-2-241b1672883e@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-dma-chancnt-v2-2-241b1672883e@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014905_033738_D4057F31 
X-CRM114-Status: GOOD (  13.91  )
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

On Mon, Nov 23, 2026 at 01:17:38AM +0000, Suyuan Wang via B4 Relay wrote:
> 
> idma64_remove() frees the IRQ and then kills the channel tasklets, as
> the comment there says, so that no tasklet scheduled by the interrupt
> runs after removal:
> 
> 	for (i = 0; i < idma64->dma.chancnt; i++) {
> 		...
> 		tasklet_kill(&idma64c->vchan.task);
> 	}
> 
> Since commit e81274cd6b52 ("dmaengine: add support to dynamic
> register/unregister of channels"), dma_async_device_unregister()
> unregisters each channel and decrements dma.chancnt for it, so the
> count is 0 when this loop runs and no tasklet is killed. A tasklet
> scheduled by an interrupt can then run after the devm-allocated idma64
> and its channels have been freed.
> 
> Read the channel count before unregistering the device.
> 
> Found with a static analysis tool and checked by hand.

You have to wait a sensible time before resubmission.
Look at the v1 and act accordingly.

-- 
With Best Regards,
Andy Shevchenko



