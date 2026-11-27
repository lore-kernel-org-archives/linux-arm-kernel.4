Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AXyYGJkK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=h8MVR+KU;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FML+yUn7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pwVHUGMid9ou+CBB/ce0NpTHGfZTB2UzJfD/sAb6ZPY=; b=AXyYGJkKEootXcJwZMxdxSM6ig
	njIZaS8I0jDVoJ5W1pSVk6riNGl0vFDLc1iaWBRqFZWzwtmTwfg/p0Fo1Q9+I8dZnRDd4cVUF7HyQ
	lS2P1HXyFwmn3jVS5+0tORTfHivGGvQxl56D3MPVCGkWSZzNfYfsUJq38EPBs7jwI8oEi8bbJToHv
	JDYd30pEnBPDzAKVZXrLjiJavVE/TA+ZFOAD1hAp1hoxElyfxkLOQg9hi/MXmctnKSCQqr9vk/vPf
	BrLjbiK3kSKzkRsmHsH/Xd4FPJrNIGGVaUv3R4j5v4VHmVAKDkdKsaB4NM5QCIslUHeMvnWXRfkVg
	xHD3AnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0vR-0000000HSqY-1zhR;
	Fri, 27 Nov 2026 18:44:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0ui-0000000HSTD-08hY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 18:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pwVHUGMid9ou+CBB/ce0NpTHGfZTB2UzJfD/sAb6ZPY=; b=h8MVR+KUBGVwJtbNRqQU/aaqGY
	30PDxJ+ugV23Hb/T1r5IbqcDu3OBbtDhfEf3MVUIKAUseaUMkdPSvFwNOMf1HwO5NcQgrTSAG5De5
	2DQ6NbRBfm7S26ga18VIqnadBptHIWy1HVeqv5XjNGtcIQSz+rf2nZ+uM6H02JTR9IbnlN6IGPFaB
	jdgTVK0J6y63TKZ+wrwJjWoRPc7aMXhv5U+HU05BMW975QT9mQ+thfrSJMbnm/G15h1EnuQBCDZ5k
	fWM/TytE81d7ZtThPM0UDEa5jnIl1CtnVGYK9O5impUSFwvbkWnn1fsxb7oBWlA15yFvAVPNPAReZ
	/knebRNg==;
Received: from mgamail.intel.com ([192.198.163.13])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0ud-000000083sZ-3zGQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795804992; x=1827340992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JdcchG4oY2oqppCohhkP//FgydJQJkHqV1x6LPU2b10=;
  b=FML+yUn7yMcuQkrEsNm9xFyIoc6JOhG+ndijCuNM+/rNULsFFy+ttqxW
   q7dXgKaxoXMddXLIUUlz/fzJFLdhWsYlkcb65XIvfcS3+UoBX93lee8HM
   zTmsN1UHCLAXQBUrE+z6W+QBDVq2U1ihohhsQwR3X+7H/yWDe7/PfbTlG
   W9v6yLpeszuTWhwSSuTj+DA7wPTyIxuLRJJpqs5AvCXwYdn6OcJ53pbNC
   /SI5ZdytiDjisb1F1SRQl0mz4W5dAcw6D8o6NrGcqVieBK3Vt2QjwUo8F
   mr2MutYe/lXLoKrqfDpQq1LSeUXvJyl3Vb3tU3HClYfANRqKY7s6sVT1J
   g==;
X-CSE-ConnectionGUID: a0E+sUGNT9eFpeWzqLmShw==
X-CSE-MsgGUID: EjjyfT5dRDOWa2M0JITESQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4686361"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4686361"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:43:09 -0800
X-CSE-ConnectionGUID: xd1xCNBzTS+w+tP2XHprqA==
X-CSE-MsgGUID: dSCQqBX9RemNNvIyTdDyKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12738462"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:43:06 -0800
Date: Fri, 27 Nov 2026 20:43:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Walle <mwalle@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Lee Jones <lee@kernel.org>, Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFT PATCH v2 06/14] gpio: regmap: add helpers to add a
 regmap-irq chip
Message-ID: <awnPN6vGwnAcRgjt@ashevche-desk.local>
References: <20261127145232.814492-1-mwalle@kernel.org>
 <20261127145232.814492-7-mwalle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127145232.814492-7-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_184312_134016_3B94FFA0 
X-CRM114-Status: GOOD (  16.66  )
X-Spam-Score: -2.3 (--)
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

On Fri, Nov 27, 2026 at 03:52:23PM +0100, Michael Walle wrote:
> The most common use-case is to use regmap-irq together with gpio-regmap.
> To make life easier for that and to avoid code duplication, add helpers
> to create and attach a regmap-irq domain. These helpers are intended to
> be called by the new .create_irq_domain() callback.
> 
> gpio_regmap_add_irq_chip() locks the GPIO line while its interrupt is
> requested. This assumes that the hwirq numbers match the GPIO offsets.
> If a driver doesn't follow that, there is one without the locking called
> gpio_regmap_add_irq_chip_nolock().

Hmm... Can't we simply have a boolean flag instead in GPIO regmap configuration
and just distinguish it inside the common helper?

...

> +/**
> + * gpio_regmap_add_irq_chip_nolock() - Add a regmap-irq chip without line locking
> + * @gpio: gpio_regmap device
> + * @irq: the parent interrupt
> + * @irq_flags: the IRQF_ flags to use for @irq
> + * @chip: the regmap-irq chip description
> + *
> + * Same as gpio_regmap_add_irq_chip() but doesn't lock the GPIO lines.
> + * Can be used if the hwirq numbers of the regmap-irq chip don't match
> + * the GPIO offsets.
> + *
> + * Return: irq_domain or an ERR_PTR() error value.

Okay, this might justify returning error pointer, but irq_domain_create_*()
shadows that with NULL, which questions the usefulness of it (the error code).
I'm fine with either approach but still tend towards using
irq_domain_create_*() helpers instead their open coded variants.

On the other hand there is no much win, especially if you replace

	info = {};

	info.XXX = ...;

	... = irq_domain_instantiate(&info);

with direct assignment as it's done inside irq_domain_create_*(),

> + */

-- 
With Best Regards,
Andy Shevchenko



