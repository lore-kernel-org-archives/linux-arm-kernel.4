Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE79606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vpi100s+;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nj6bSp1X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J/cXEYX01AONgmSurv+omWY8dTLGH3bj9ApNRUcbnpI=; b=Vpi100s+/QebGR+J9dKegZH93J
	5q293pdCOER+gwHW8D7MRCwWY/6TQ+lsqmC4YQSZbTJPkfgz+DquakZAWyEDnt7APN2Vp0hpqrIuG
	k1wCaKATsKydlS13L85G4/Auz28i+Ppx6Lt9fWAtTm7FQEasGHVCv/WtKP4FZ5CWUUQOq5+cV5/us
	+274d7/VF7/zncHVfOLzmb0sEbMLTHpAOAVzZbkoU5noigaBeX2H9xeRObV+7LiTMDvPXxAJ+k/mq
	2sy/Gh9hz98MuHsWk9wMPsgnTQIbnTEU/kyfF+q/HwCsDP2uO43xSUmbBz/Enoq9q5s/Smqzeo78n
	FlFUzt6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQsi-00000002sWD-1iIW;
	Mon, 23 Nov 2026 10:02:40 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQsf-00000002sVj-3zJz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795428157; x=1826964157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZPqdy+dRE3PgCFAspbnDDU9RURqyA1USLeDDe/7BAh4=;
  b=nj6bSp1Xy+caoziS38G9b+FCVsEek9thgrUm/5xMs+zMm84oWhiK5s/G
   XnnumUbuqCK2ChH3bZ143tf37RBIABk2/QTArW6YfJS2D+3FUNlzGjbZ8
   nDgN7STbNLmldyqx1K3F/z2d1mPNrxzJ2i04aDQP5gyF1LyjWgwbNT79c
   C3DzqFNnbjJfDpB7fL8yP5e/vT4jfjtKcpsvi9mTEPRvQ7oBybPstrskJ
   nIjRyus66Ia6hOpMH/55KlfMsGp1ziNxnNlAfS9OUxSvBII1kiegaP0hu
   jaeOPriyZT2FEvgy41Zyroj2l9tnskFF55nE+niG8aPEHk2bfjgKXhhMY
   g==;
X-CSE-ConnectionGUID: V5wSW+z8Q3+RyQ0uFlbk+w==
X-CSE-MsgGUID: ZjWQs3YTTgmibxRm4dVuDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4280629"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4280629"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:02:36 -0800
X-CSE-ConnectionGUID: qOmC6S3jRZeE5XGOmuygyQ==
X-CSE-MsgGUID: gsenE3cgReeVze5YzA1Umw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11410041"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:02:32 -0800
Date: Mon, 23 Nov 2026 12:02:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com, amin.gattout@gmail.com,
	antoniu.miclaus@analog.com, gregkh@linuxfoundation.org,
	mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/8] iio: adc: at91_adc: convert to
 device_property_*() APIs
Message-ID: <awQPNvotVh7cODYR@ashevche-desk.local>
References: <20261123070101.53868-1-abdelnasserhussein11@gmail.com>
 <20261123070101.53868-5-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123070101.53868-5-abdelnasserhussein11@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_020238_062654_3D98B578 
X-CRM114-Status: GOOD (  20.71  )
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

On Mon, Nov 23, 2026 at 09:00:57AM +0200, Abdelnasser Hussein wrote:
> Use the firmware-agnostic device_property_*() helpers instead of the
> OF-specific property readers, so the driver does not depend on a device
> node being available in probe.
> 
> Update at91_adc_probe_dt_ts() to take a struct device and read its
> properties through device_property_read_u32() as well.  Since the helper
> no longer uses DT-specific APIs, rename it from at91_adc_probe_dt_ts() to
> at91_adc_probe_ts().  This removes the need for a struct device_node
> pointer in at91_adc_probe(); as a result, at91_adc_probe_ts() now logs
> against dev (&pdev->dev) instead of &idev->dev.
> 
> Drop the " in the DT" suffix from the missing property messages to match
> the firmware-agnostic property APIs.
> 
> With no OF APIs or struct device_node left in the file, drop the
> <linux/of.h> include and add <linux/mod_devicetable.h> for struct
> of_device_id.

...

>  static int at91_adc_probe(struct platform_device *pdev)
>  {
>  	unsigned int prsc, mstrclk, ticks, adc_clk, adc_clk_khz, shtim;
> -	struct device_node *node = pdev->dev.of_node;

	struct device *dev = &pdev->dev;
	const char *propname;

>  	int ret;
>  	struct iio_dev *idev;
>  	struct at91_adc_state *st;

...

> -	st->use_external = of_property_read_bool(node, "atmel,adc-use-external-triggers");
> +	st->use_external = device_property_read_bool(&pdev->dev,
> +						     "atmel,adc-use-external-triggers");

	propname = "atmel,adc-use-external-triggers";
	st->use_external = device_property_read_bool(dev, propname);

> -	if (of_property_read_u32(node, "atmel,adc-channels-used", &prop))
> +	if (device_property_read_u32(&pdev->dev, "atmel,adc-channels-used", &prop))
>  		return dev_err_probe(&idev->dev, -EINVAL,
> -				     "Missing adc-channels-used property in the DT.\n");
> +				     "Missing adc-channels-used property.\n");

	propname = "atmel,adc-channels-used";
	if (device_property_read_u32(dev, propname, &prop))
		return dev_err_probe(&idev->dev, -EINVAL, "Missing %s property.\n", propname);

BUT... this needs to be fixed first to unshadow error code

	propname = "atmel,adc-channels-used";
	ret = device_property_read_u32(dev, propname, &prop);
	if (ret)
		return dev_err_probe(&idev->dev, ret, "Missing %s property.\n", propname);

AND... what the heck is idev->dev now? Please, fix that before even this patch,
use same device pointer in the call and in the message. In the end it should be

	propname = "atmel,adc-channels-used";
	ret = device_property_read_u32(dev, propname, &prop);
	if (ret)
		return dev_err_probe(dev, ret, "Missing %s property.\n", propname);

>  	st->channels_mask = prop;

All the same for other properties.

...

>  	st->res = st->caps->high_res_bits;
>  	if (st->caps->low_res_bits &&
> -	    !of_property_read_string(node, "atmel,adc-use-res", &s)

> +	    !device_property_read_string(&pdev->dev, "atmel,adc-use-res", &s)
>  	    && !strcmp(s, "lowres"))

This is device_property_match_string() I believe.

>  		st->res = st->caps->low_res_bits;

-- 
With Best Regards,
Andy Shevchenko



