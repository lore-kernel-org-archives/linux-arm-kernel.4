Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8610606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wovhOgEX;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kgxuIDop
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W3eKtzyeFAx9k3SdIScJomTE4HlGQvDUwsp4irgjcmQ=; b=wovhOgEXDGTiXhSU8n/Kx9Ce5h
	8T0DW+nA4L346e3bABWMcJKHjMKhf8kz+d8VcqDhNuyvNteb2B3z5GJh+qaN6KVmiDVDlKBhrln4N
	SX0pFxno93t9RqlKHwfoZZqYfBaFEP74ehvRXjYFIiURNOEX78OUX+fdtvGdUj5u0k/GF+hhlB7F/
	KCTG19vi6EiETLlwYu4t1zRBMRv4yewQqq5mGVTGiWdjIIrX6/nAVXOFe8V+FQRMO9eHLfYirlSxN
	9ul+rd01nK022XcFUWD73Sn3cNHmAcr4vYTjsQ4xqIr5audOpZT4BCYwG3a9erXexRz5eEoOyRoWk
	3ajhvwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzjp-0000000HGdy-1AVj;
	Fri, 27 Nov 2026 17:27:57 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzjm-0000000HGcl-0rCG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795800474; x=1827336474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W6Q61lmnMfckv9+BDm568lRdNWM7pHAMlkSfDSGy6tU=;
  b=kgxuIDopW8UyNv8EjEYKCZbaygvmllUdrV3Z3brmwJHkUSjOANefqbvH
   5/cE4/VKuW7vECQ7Cw8+k/Of47epP06I5Oet2QO1Qy0HwV9rQhWmKXPEE
   ZDMhSH6QFUbtlHLxEdyzFGhcsFsLR6gcyN/LPa5U1q8ZlPrSwus82hqV1
   BW/oCx+yPTgZOLG6Wcx6v4/nx8yRw5awUlS/ZZvh+hRyGckXBnoYyimAF
   msySpiVD2NYiEGKwxkaaArHucZ1tWe9qYrUv193pYTBhFvJi+evbXXNQr
   J/Ouj6rssLzRpNLUmwrwcjIaJUqzeZnyV010X68THTBmih4Zy0x3ATBmp
   Q==;
X-CSE-ConnectionGUID: ntWeQcSvQUata6uLXp5K6A==
X-CSE-MsgGUID: CIkXo3YuRfOtVgneByDibg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4714135"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4714135"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:27:53 -0800
X-CSE-ConnectionGUID: epC9rlWhQqeupkvh//V8aA==
X-CSE-MsgGUID: p0Kq4xR1Tl24ziID7xm57g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="14109299"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:27:50 -0800
Date: Fri, 27 Nov 2026 19:27:47 +0200
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
Subject: Re: [RFT PATCH v2 03/14] gpio: regmap: add callbacks to handle IRQ
 domains
Message-ID: <awm9k-jTlhBWIi2x@ashevche-desk.local>
References: <20261127145232.814492-1-mwalle@kernel.org>
 <20261127145232.814492-4-mwalle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127145232.814492-4-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_092754_331907_7CE7F829 
X-CRM114-Status: GOOD (  19.54  )
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

On Fri, Nov 27, 2026 at 03:52:20PM +0100, Michael Walle wrote:
> At the moment, an IRQ domain is attached via config->irq_domain.
> This means, that it has to be created before the gpio_regmap_register()
> call. The callbacks of the IRQ domain might use the gpio_regmap_*_irq()
> functions. Consumers can already use the domain as soon as it is
> created and this creates a small window where the callbacks dereference
> a NULL pointer.
> 
> To fix this, create a new create_irq_domain() callback, that is called
> after the gpio_chip is added.
> 
> Also add a remove_irq_domain() callback, which is called after the
> gpio_chip is removed and before the gpio_regmap is freed. It is supposed
> to dispose the IRQ mappings and remove the domain.
> 
> Also ordering of the resources matter, so we forbid any device managed
> resource handling. Any resources allocated in the create_irq_domain()
> callback has to be freed manually in the remove_irq_domain() callback.

...

>  	unsigned long *fixed_direction_mask;
>  	unsigned long *fixed_direction_output;

Perhaps a short comment why create_irq_domain is not here?

> +	void (*remove_irq_domain)(struct gpio_regmap *gpio);

...

> +	irq_domain = config->irq_domain;
> +
> +	if (config->create_irq_domain) {
> +		irq_domain = config->create_irq_domain(gpio);

> +		if (IS_ERR(irq_domain)) {
> +			ret = PTR_ERR(irq_domain);
> +			goto err_remove_gpiochip;
> +		}

		ret = PTR_ERR_OR_ZERO(...);
		if (ret)
			goto ...;

> +		gpio->remove_irq_domain = config->remove_irq_domain;
> +	}

-- 
With Best Regards,
Andy Shevchenko



