Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D65A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qfR2D9Cg;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kbcMVmL3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9zOO5rAdZD5bgN+m83G9k8CmEqp9m+/UuZhzOcs9Gjc=; b=qfR2D9CgvVO41yHjbUB/DVuYgq
	7+5YhQX/s4LzKNYzQFy8HJByeR4nZlPlzNlsbpg/uycUxYMbF0h8a7SgI85tuFcMILQQqDzWgg7ps
	iBCTBIaJBs/rCW5WYo/kWVQw60S6mS1ytBQbVSBQc/Aj8B2ODSmkLr91F7abdqUyDvrhWf1PktQs3
	+CfNziM1UTceCihS63XnhM+K9Z+ZfVC5mfAJQ2WWZS8tV5gaLGhJaokFTHJv+PV07BL6Ec4XDrkeu
	fBBav9kF7lO/FIRA+00ozwy7ZKv1em1t09NEShVLhNN+2+DNzzXcP219fdXfMMy8nlejSUP64jwyF
	x505rNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMOf-00000006TdY-0U5S;
	Tue, 17 Nov 2026 16:51:05 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMOc-00000006TdA-3QKz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794934263; x=1826470263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oo2HLD57CgDs74O09Fghy16vcY7J9AgvHbmS51v8TSw=;
  b=kbcMVmL3dNSPstdty3mQdVQZNRykGRCLNUwCwmOu4FvFDNfUmA8joPYn
   qrhl9wf/mzATDA6V2wRosMTICFdNg9zI6z9KxiBzGXPI7fy/M/u3+B1Gh
   X3EJoZ/7fcKS572MYzs6Vm8zqsAZVpxv+U36YgYaVFQ3X3Wj9wVnUSu4h
   tRDA4tuanvfggx4dA0xhp0M0ebocBpV28R9pjx3/8MIKLfJkUeeNRKrw3
   nodI500wtwZ6MefguOiRnpa07IouamcDl9oRw2ICg5KmgR9Eg9ZHC/4gk
   r5qceKZaujC3YFqaPkT9sm7i2wG73EFi0n41Xz3ZjITpWij0lIL5w2gBC
   Q==;
X-CSE-ConnectionGUID: w2A+zi6RQ/ucIOtJ8ng6MA==
X-CSE-MsgGUID: seZdW+LGRwiLzpAj+HQwrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3755783"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3755783"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 08:51:01 -0800
X-CSE-ConnectionGUID: 6tM/lD3oRAq3KwdQab2P1g==
X-CSE-MsgGUID: 4zP3eVtsQQeWnvSFsHSBjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9790442"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 08:50:56 -0800
Date: Tue, 17 Nov 2026 18:50:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com, amin.gattout@gmail.com,
	antoniu.miclaus@analog.com, gregkh@linuxfoundation.org,
	mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iio: adc: at91_adc: use local struct device
 pointer in probe
Message-ID: <avyF7vllhuE-cJA0@ashevche-desk.local>
References: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
 <20261117140510.391907-3-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117140510.391907-3-abdelnasserhussein11@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_085102_925154_A9209810 
X-CRM114-Status: GOOD (  16.71  )
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

On Tue, Nov 17, 2026 at 04:05:09PM +0200, Abdelnasser Hussein wrote:
> Introduce a local struct device pointer in at91_adc_probe() and use it
> in place of &pdev->dev and &idev->dev throughout the function.As a
> result, messages previously logged against the IIO device are now
> printed using the platform device being probed.
> 
> switch devm_iio_device_alloc() to use sizeof(*st) instead of
> spelling out the full private structure type.

...

> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;

Before doing this, switch to device_property_*() / fwnode_property_*() APIs
first.

...

> -	st->caps = of_device_get_match_data(&pdev->dev);
> +	st->caps = of_device_get_match_data(dev);

In a separate patch (perhaps in the first one in this block, convert this
to use device_get_match_data() and add an error check (for now until we able
the driver_override case to address differently.

>  	st->use_external = of_property_read_bool(node, "atmel,adc-use-external-triggers");
>  
>  	if (of_property_read_u32(node, "atmel,adc-channels-used", &prop))
> -		return dev_err_probe(&idev->dev, -EINVAL,
> +		return dev_err_probe(dev, -EINVAL,
>  				     "Missing adc-channels-used property in the DT.\n");
>  	st->channels_mask = prop;
>  
>  	st->sleep_mode = of_property_read_bool(node, "atmel,adc-sleep-mode");
>  
>  	if (of_property_read_u32(node, "atmel,adc-startup-time", &prop))
> -		return dev_err_probe(&idev->dev, -EINVAL,
> +		return dev_err_probe(dev, -EINVAL,
>  				     "Missing adc-startup-time property in the DT.\n");
>  	st->startup_time = prop;

...

>  	if (st->caps->has_tsmr)
> -		ret = devm_request_irq(&pdev->dev, st->irq,
> +		ret = devm_request_irq(dev, st->irq,
>  				       at91_adc_9x5_interrupt, 0,
> -				       pdev->dev.driver->name, idev);
> +				       dev->driver->name, idev);
>  	else
> -		ret = devm_request_irq(&pdev->dev, st->irq,
> +		ret = devm_request_irq(dev, st->irq,
>  				       at91_adc_rl_interrupt, 0,
> -				       pdev->dev.driver->name, idev);
> +				       dev->driver->name, idev);
>  	if (ret)

> -		return dev_err_probe(&pdev->dev, ret,
> +		return dev_err_probe(dev, ret,
>  				     "Failed to allocate IRQ.\n");

In a separate patch, before this one drop this dup message. It's printed
by the devm_request_irq().

...

>  	adc_clk_khz = adc_clk / 1000;

At some point better to use HZ_PER_KHZ instead of odd 1000.

-- 
With Best Regards,
Andy Shevchenko



