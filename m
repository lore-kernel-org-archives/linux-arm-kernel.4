Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3A1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FTpGpZXV;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AHV5GQjw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HVSdNDHhs3+VVMRBOX5sTBdHdsKEZdANEr9dYpz6y2w=; b=FTpGpZXVEQJR36oGeATEF/gk5B
	miU1QmQQGWRnrtJzNLD+Vu+DAXeXTZpMe8klFDMrUfgnDUbb0xxbbHfk9ecTPc9yXq+DK6sp+YPDJ
	5+ocf4oSNyHAzuEArQXa7DWwjjnK0TAXPUNckz4uWKa/jcUkFv07evQitjQ3d+UYYLVwjJv5koffb
	eLxa02v4Xa6q/it560ALCqCGKAaJcXRskGAI9CbEdWK0ts1Ns7MRFMkVMPNLxG6arcCSJbw4NUJlx
	wgmJbLwFOG41JxaBoBEKmHuD4tlpAYfrIx0XBfXSsfZt4EQ3FG/Ekr+y0HxS6YVEbFtXqGPdrUoQw
	enByS6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0n1-0000000HQf7-2Wm0;
	Fri, 27 Nov 2026 18:35:19 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0mz-0000000HQec-0g6w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795804518; x=1827340518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D9hxSYaLDqREhHtyIiX5w2U7PfdJEL4Rgw0iZrmjrjU=;
  b=AHV5GQjwTlwQNpfs10bRlWIFGww16H9Z3scfqsvPJFqn3KZQ+P7iX9iG
   UlvYFLxG+f25FPoO7UULxQLwhytUVesIuon00hZ1Q6fFlJI+OdDqV6xa0
   FLx6bkieV/je4W07Y0pEwI1EoGnDJb3CckYUL4AufDQDlXQzOUMeiI74s
   Beof0ts3oqvYVeo23aEuHTAaUg9ukNyG2/wN8eSsef/J02LXtiydslWFD
   rn3cp/5YBQRRhIaFqEjrpaDcdH3feXv5/aaB/e11dU1vI4N5J2BUkxpkq
   lvd5mIk9hsG1pgjLiVaANbCHuz7N291iX8piP7XXUeMD6oW+sFbTcx6OZ
   A==;
X-CSE-ConnectionGUID: myVbmPjCQZaZc9NPzqW7Zg==
X-CSE-MsgGUID: XaG7QSQwQbmKGWqH0dqTNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4573151"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4573151"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:35:17 -0800
X-CSE-ConnectionGUID: sxVnqLTsSQGTUu4SoTOkWQ==
X-CSE-MsgGUID: UP6LO7fkQHSpadBncEiqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12233288"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:35:12 -0800
Date: Fri, 27 Nov 2026 20:35:10 +0200
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
Subject: Re: [RFT PATCH v2 05/14] gpio: axiado-sgpio: create the IRQ domain
 from the gpio-regmap callback
Message-ID: <awnNXqahhZuubszR@ashevche-desk.local>
References: <20261127145232.814492-1-mwalle@kernel.org>
 <20261127145232.814492-6-mwalle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127145232.814492-6-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_103517_259888_D5FCF9C0 
X-CRM114-Status: GOOD (  17.57  )
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

On Fri, Nov 27, 2026 at 03:52:22PM +0100, Michael Walle wrote:
> Use the new .create_irq_domain() to actually create the domain. This
> way, there is no window where a NULL pointer could be dereferenced in
> the irq callbacks.
> 
> Switch the irq host_data to the gpio_regmap pointer because it will
> already be needed in the irq domain callbacks. Otherwise, the
> .create_irq_domain() callback would have to set the sgpio->gpio pointer
> which looks odd.
> 
> Don't use device managed resources anymore. Instead use the new
> .remove_irq_domain() callback. The driver didn't dispose any of the IRQ
> mappings before, although irq_domain_remove() mandates that. Thus add
> that to this callback, too.

...

> +static struct irq_domain *axiado_sgpio_create_irq_domain(struct gpio_regmap *gpio)
> +{
> +	struct axiado_sgpio *sgpio = gpio_regmap_get_drvdata(gpio);
> +	struct device *dev = regmap_get_device(sgpio->regmap);
> +	struct platform_device *pdev = to_platform_device(dev);
> +	unsigned int ngpio = sgpio->nsignals * 2;
> +	struct irq_domain_info d_info = { };
> +
> +	d_info.fwnode = dev_fwnode(&pdev->dev);
> +	d_info.size = ngpio;
> +	d_info.hwirq_max = ngpio;
> +	d_info.ops = &axiado_sgpio_domain_ops;
> +	d_info.host_data = gpio;
> +
> +	sgpio->domain = irq_domain_instantiate(&d_info);

Same comment here, because it was no devm_*() helper for linear IRQ mappings.
Not sure if we need to consider error pointer after all in each of the
callbacks. We can just check NULL versus not-NULL inside gpio-regmap core.

> +	return sgpio->domain;
> +}

-- 
With Best Regards,
Andy Shevchenko



