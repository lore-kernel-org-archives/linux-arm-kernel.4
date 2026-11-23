Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54512606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VWBfBFiW;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U/xiDQlY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zzWv4H1+U9iplq31+U5iHclnegDq86PpCpjZyuT2H2U=; b=VWBfBFiWnrk5mYHtnYF0zOJF5A
	n9ZLuYeOQcByoE8wdRfIosPbXKuGZ+owMHajWJjbrAP5SljC8QQIEELdrgQer5miGDCOC30eNcZWK
	frSeNc8AVOodbC/DkA1Wt0NTJXBxYDurGESG4U9nJnsw9FmFJpl8VzcQVQDMOU9rnvkfTZgMqQTCM
	zi8Dq12IRZKjwi0JPSNQrGALiwiSKAOHfuxlJ7vPVJ4L/CBUYf0ClssbCs/4uqTIP3ImUAMcWUHcH
	TRlaTXNpDi5moL1dFWUfIf6idR4KSodNhBDC0Myq6eywJmJT9b+kBT6IawkZJWAkrJRfV9ILSYWgi
	QDVSduKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQeF-00000002obu-06Zn;
	Mon, 23 Nov 2026 09:47:43 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQeC-00000002oZt-144S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795427261; x=1826963261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M3OZ4V+vGK+Zwqy8bv0Zk+Ks9b1GF359E3mPZrg3CSQ=;
  b=U/xiDQlYAGQ/qC6DU4HqFNo10/b1SAuiO7uhdhiS5zOj1lr8VMml3w1p
   i8CHRCA6+hEL3IEV6qCVWeMwXpln1AdHy3jANpSFrpaqrIDze79/b0s/R
   1kgVOYv5LI4Ng7MbupFiFHLyzY3fPpE+MEhjHB7svTpE5ArhzH0nmLpFl
   vimR0SGjXoPVfgbYHSqKJCgEknm7VX/IepCD8QTuK1v3WHBq935vV0yG2
   1FXCWYJ/p9DSBWCgZ4Lm3LIZeeSi0Jn8Ob9bDCdyS0HgEKDUYn0aOGFTb
   bugDYTJy+LG0PEgcPkM6ig5RaXTBKIqV8G9XkYMJll+cyA3XuwNSdYb6K
   w==;
X-CSE-ConnectionGUID: 5HpiMOz0THqq/o6drNZNdA==
X-CSE-MsgGUID: wffbJO+9QiKuEx78ajZEfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4208926"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4208926"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:47:40 -0800
X-CSE-ConnectionGUID: COa1wF7OTpqIvtihc3Z4pw==
X-CSE-MsgGUID: cjozTIkEQjSSWrYP/R0ZmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11562577"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 01:47:37 -0800
Date: Mon, 23 Nov 2026 11:47:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: shyckless@gmail.com
Cc: vkoul@kernel.org, ludovic.desroches@microchip.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank.Li@kernel.org, allen.lkml@gmail.com, dave.jiang@intel.com,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 2/2] dmaengine: idma64: Kill the channel tasklets in
 remove again
Message-ID: <awQLtiL_OfuoMpAj@ashevche-desk.local>
References: <20261123-dma-chancnt-v1-0-f0eea0a4bb63@gmail.com>
 <20261123-dma-chancnt-v1-2-f0eea0a4bb63@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-dma-chancnt-v1-2-f0eea0a4bb63@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014740_302505_F24F7615 
X-CRM114-Status: GOOD (  15.69  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 12:53:07AM +0000, Suyuan Wang via B4 Relay wrote:
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

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +	/* dma_async_device_unregister() decrements dma.chancnt to 0 */
> +	unsigned short nr_chan = idma64->dma.chancnt;

Which makes me think that we need to draw a line between private and
non-private members in the respective DMA data types. With this field
it's probably better to mark it with __private, or add another one
with that annotation and use it internally in DMAengine core.

-- 
With Best Regards,
Andy Shevchenko



