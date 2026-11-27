Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F252606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xyyo4wS7;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IkX2+0dO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yU2nYKrDNlFNsbHHIkXsJcnjvDyggWyC1jVuTdrtc4g=; b=Xyyo4wS73Y/EKZeVZvowBzriKJ
	HHS+hUetLDKEJpSp426KW2CAGD1CUNHbnIduvet73GnC1rZAj1J5LiD9vhmNu1yoYmFt/F9tKtozv
	+Nrs3LzCk8odv1t/vGp49PUbOKU+0/y15phVvRwIfSGH2/T6Cs2WzQtgE6IXJwsK0vaLCwGdaIDJX
	E40nYvfYFjyIiiHehbFbC4NvtVWiU66lYMvhhnaR3OL3UDbOLCZK93r6BHwktiZX9vUUMn3Bu8d2d
	dmfJRDLFZjYNSvJmhmejIcHKybCPyuThly7OAlba1Yh//z7hj1qjlggVBj/EOxjeA91xo4UI51+/p
	v/AWpXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0j1-0000000HQ87-3N8r;
	Fri, 27 Nov 2026 18:31:11 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0iw-0000000HQ7Q-1Cba
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795804267; x=1827340267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TBFJ66+LtWaiW+TPpfa+OeTpRDo6xWfqGRmmzWRu4C8=;
  b=IkX2+0dOS7CvuE5YHJBsPEt2Eu3iKowvK8Mqk0pQwlu21L1B4T3dYXfp
   jnFQJlxbn9bv9buGAk74n89YyeXAUbTPI3h5Iy3OwX1s3yzb70ExEXZwU
   88iOrwrKdxJUE5JtTNSx7e9s+w6o2us5HDVTH9NUDbLEbvMl3E/+PoMU8
   UT6sF0zswNfEizbDMgggyM0+8/UyN7jZf1YzJWvIGurgL2rQku/pl1WYL
   3ZAnKu1DbEi+pJqDDBZfSc8wcrqY5tzf7Iv7uHSYR7+WAhKfekoWWtiEM
   +Np8QJ/2TXWVM7b6SZqcEep5/QoqWeXWK9GBNZCzxkvPmh2u1X0caXT6C
   Q==;
X-CSE-ConnectionGUID: wd2yVzfQSkamzuogTNS8NA==
X-CSE-MsgGUID: wJQKt90ASDy7aayETNluxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4603983"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4603983"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:31:04 -0800
X-CSE-ConnectionGUID: IGB1DSF6TyORstOwI95YdQ==
X-CSE-MsgGUID: QZTLcboxQsenkF3792mAwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="14211216"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:31:00 -0800
Date: Fri, 27 Nov 2026 20:30:58 +0200
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
Subject: Re: [RFT PATCH v2 04/14] gpio: rtd1625: create the IRQ domain from
 the gpio-regmap callback
Message-ID: <awnMYpXTtH7scMet@ashevche-desk.local>
References: <20261127145232.814492-1-mwalle@kernel.org>
 <20261127145232.814492-5-mwalle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127145232.814492-5-mwalle@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_103106_366642_4533E5CD 
X-CRM114-Status: GOOD (  22.22  )
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

On Fri, Nov 27, 2026 at 03:52:21PM +0100, Michael Walle wrote:
> Use the new .create_irq_domain() to actually create the domain. This
> way, there is no window where a NULL pointer could be dereferenced.
> 
> Switch the irq host_data to the gpio_regmap pointer because it will
> already be needed in the irq domain callbacks. Otherwise the
> .create_irq_domain() callback would have to set the data->gpio_reg
> pointer which looks odd.
> 
> Split the interrupt handling into two steps: first fill in the
> interrupts and in the callback attach the handler.
> 
> Don't use device managed resources anymore. Instead use the new
> .remove_irq_domain() callback. The driver didn't dispose any of the IRQ
> mappings before, although irq_domain_remove() mandates that. Thus add
> that to this callback, too.

...

> +static struct irq_domain *rtd1625_gpio_create_irq_domain(struct gpio_regmap *gpio_reg)
> +{
> +	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio_reg);
> +	struct device *dev = regmap_get_device(data->regmap);
> +	struct irq_domain_info d_info = {};
> +
> +	d_info.fwnode = dev_fwnode(dev);
> +	d_info.size = data->info->num_gpios;
> +	d_info.hwirq_max = data->info->num_gpios;
> +	d_info.ops = &rtd1625_gpio_irq_domain_ops;
> +	d_info.host_data = gpio_reg;
> +
> +	data->domain = irq_domain_instantiate(&d_info);
> +	if (IS_ERR(data->domain))
> +		return data->domain;

This is open coded irq_domain_create_linear(). The only difference is that we
propagate the underneath error code instead of decoding NULL as ENOMEM or
EINVAL or something like that. If this is the case, add a comment explaining
why, otherwise somebody will change that in the future w/o much thinking.

Note, it was open coded since there is no devm_*() helper for that.

> +	for (unsigned int i = 0; i < RTD1625_MAX_IRQS; i++) {
> +		if (data->irqs[i])
> +			irq_set_chained_handler_and_data(data->irqs[i],
> +							 rtd1625_gpio_irq_handle,
> +							 data);
> +	}
> +
> +	return data->domain;
> +}

...

> +static void rtd1625_gpio_remove_irq_domain(struct gpio_regmap *gpio_reg)
> +{
> +	struct rtd1625_gpio *data = gpio_regmap_get_drvdata(gpio_reg);
> +
> +	for (unsigned int i = 0; i < RTD1625_MAX_IRQS; i++) {

> +		if (data->irqs[i])

Do you need this? It seems to me that irq_to_desc() returns NULL
and scoped_irqdesc_get_and_buslock() does nothing. Yes, I know
it's a tricky code.

> +			irq_set_chained_handler_and_data(data->irqs[i], NULL, NULL);
> +	}
> +
> +	for (irq_hw_number_t hwirq = 0; hwirq < data->info->num_gpios; hwirq++)
> +		irq_dispose_mapping(irq_find_mapping(data->domain, hwirq));
> +
> +	irq_domain_remove(data->domain);
> +}

-- 
With Best Regards,
Andy Shevchenko



