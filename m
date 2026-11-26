Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09158606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w8RBqcNf;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kucu2KgZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+GwGE8LK7Ybzcfh7RYTEPQClnRJ+sIu6LYYch8s93Oc=; b=w8RBqcNfqQxdyuEZMQZon3KtGc
	Jylu9HqnErzL5VxJKa8BCGATLcoLCGyoznwoy5FU0typYvMNLXP6EP9XHrqZGugMI7UrMeK4YBF6i
	+qFwCvKsnQ7EM2T6cki5E5BmMHCiNTViKjYA3QuWyIWHm4gpaA71I043YpOAdgFxRkRhTy1GNMH4F
	buQvnzYK23VTqdaSQHjbFK7PplWI2ZTJw2TlvOcxTxJrxGWtCzobP7rAZ9l4ve6YADZy6aiIW2ZCP
	PEX1dPdQA9CC621ZrQR79WuupCAplTsrIu/3uNTivDpFRECT5JCnfHj6XkexNnMvQElT1k088eB+u
	ds639Klg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgOZ-0000000EVqO-0P67;
	Thu, 26 Nov 2026 20:48:43 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgOO-0000000EVpI-20Vv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795726112; x=1827262112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qPlel64ucsy/uHv+Mwbl10NHlgNHl28lNvtPDacI9TY=;
  b=kucu2KgZdNIx0+f3gYmSMhXft2dR3iLLG7OltdmmMTK84j/8u8cYbcNk
   7IXUuyMWs08TpewShdflV6KnSuwA64ujZfq7ATKI0Ai3ak3yleTngJh8l
   eT5Ig++egFhK449f2liYSKh8lNt6+b6MnCRrJaqNiFO3iTXXYkSmxCTt5
   BQ5KsUTDgNCWUPRICG2Bwn+j+vjpf4mxA+B3SOUNWRCqx6AWN41gTpi5K
   nrySf+FltBO732EXO4JuOwmpMOpFncCZDLAvSJ1SMfeHhSk/zKaHZb4SC
   q7RdwMTuqhq0MBc2dpRNdpC2UWgZxTMh68KLypNeXJ9KQt2BAVnCYbn6J
   Q==;
X-CSE-ConnectionGUID: ZQLYmcJhSQO5WkAc/MtW+g==
X-CSE-MsgGUID: GTqbcRGjRwW5hE38GCRjUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4529997"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4529997"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 12:48:31 -0800
X-CSE-ConnectionGUID: 0zFVz8HERsOmgEGhf95o9w==
X-CSE-MsgGUID: UFZiKOcXRqabhe5zb1n62w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12479649"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.208])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 12:48:28 -0800
Date: Thu, 26 Nov 2026 22:48:26 +0200
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
Subject: Re: [RFT PATCH 00/13] gpio: regmap: IRQ domain cleanups
Message-ID: <awibGgRHR0zwUCRJ@ashevche-desk.local>
References: <20261126153600.299724-1-mwalle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126153600.299724-1-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_124832_721466_79A04F8B 
X-CRM114-Status: GOOD (  23.89  )
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

On Thu, Nov 26, 2026 at 04:35:11PM +0100, Michael Walle wrote:
> The gpio-regmap provides two different variants to attach an IRQ
> domain to the gpio-regmap instance, either via .irq_domain or via
> .regmap_irq_chip. The former even has a small window where a
> consumer requesting an interrupt leads to a NULL pointer
> dereference. This also came up during sashiko reviews [1].
> 
> It turns out, that it is impossible to create an external IRQ domain
> without a race while the gpio-regmap instance isn't created yet.
> That is because it will already use the gpio-regmap provided
> callbacks. Thus, with this patch series, gpio-regmap will now
> provide a callback for the individual drivers used to create an IRQ
> domain when all necessary fields are filled.
> 
> To move even further and cover the most common use case of having a
> regmap-irq domain, gpio-regmap now provides a helper that can be
> used in the .create_irq_domain() callback.
> 
> We need Long Zhao's patch [2] not only for ACPI but also for the
> regmap-irq handling. If the IRQ domain is removed before the
> gpio_chip, gpiochip_remove() would use the already freed domain to
> free the remaining interrupts.
> 
> All the users of regmap-irq are switched over to this new helper.
> Finally, the last patch, removes the old variants.
> 
> There is one change in behavior: because all regmap-irq domains use
> the gpio_regmap_irq_{reqres,relres}() helpers now, interrupt lines
> are now locked and cannot be switched to output. But that shouldn't
> be an issue anyway.

It's so elegant solution, my full support!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

(I had something more complicated in mind.)

> This was mostly only compile-time tested. So please test. I'll do a
> proper test on the sl28 board tomorrow, but since Long already
> asked, I wanted to have this out for comments and testing.

I'm not sure I can help with testing (all our HW seems do not use this).
Only regression test for other users might be done, but I need to check
if we have platform that has an HW with the driver that uses gpio-regmap.

> [1] https://lore.kernel.org/r/20261123040142.48880-1-joseph@telaak.dev
> [2] https://lore.kernel.org/r/20261118-cv75-gpio-v15-3-e3c563673fe1@ambarella.com

-- 
With Best Regards,
Andy Shevchenko



