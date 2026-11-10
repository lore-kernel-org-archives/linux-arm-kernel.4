Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F5860A2619
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3jIVa4sY;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AxiDXiAR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=INGqzLdDhKQ8KqZLVYVuAJJweNcsIc9aGsEAGXCLg1g=; b=3jIVa4sYD1nP/xH/3T5FjXF9YQ
	vkpcAmFNarkDUAgSuFQINwhhPPpc0EzbW7FchxGWkQY6R5rNQ4UBFqM+efduwz9Z46rPhix6bCk9J
	yvzrjMQtgC/6V1RX2HfAnGPS5s4Tiq3EZyTxA7+kU7oKXQZJc7+AsNQ4a1cAyKwC54vzVukD1fZe5
	1r89NDYj54Zoz+X0xgq3TdKm8b4iJtQXrzaxGqne/4qysVv7rtbV0rEpqfruk4dnDDllMRz6vZyRX
	YqD8z3UDDoPZ7v/2gaWnpEwDnw8nWtCofBenTeZbYxU69Fy2jfH+D9x784M7a1uU7v1/pUc4hqWcK
	Yzhfuglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQicD-00000003NIx-2ENY;
	Tue, 10 Nov 2026 09:58:09 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQicB-00000003NId-2d6A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794304688; x=1825840688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QzPT9tGZvqRrW4sh2AHvUOUTAy1to+OE31K7C7vVxy8=;
  b=AxiDXiARsmpATPxJntkuphhGFuqjN7E8pCAXs/hQbF9rhaCOHTj0aYHO
   L7L3yMfP0WKDKxfsZBliBS4mn8On9ECI5NIZW3tST6aPxjbnXBXb2gH3e
   i15aJ3oPyEG4nav3kZ77oY7vnoO+OzH0tykWnfHD3uWyCh7DsUDBg9Ahr
   FBfNjkuC80aRZyCw/1Ei5wWQ4LFQSJLTDsIik4FuugZ5pGMIlW0CguitB
   IEr1cyWq1/Bi0vd0NCO155jcKI28dSlgyf8pxZ8PqpclVi6wFjJXMBESF
   3rodqtR9b6QD5SqTGhibclAAJSqsRiydb36asegl2Q1JAsbfP9hwbjfB8
   A==;
X-CSE-ConnectionGUID: p3s2fzNPS2eE4peKtu75NA==
X-CSE-MsgGUID: 3t/FlfBxQVOWUVjCQByYwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2923995"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2923995"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:58:07 -0800
X-CSE-ConnectionGUID: 4F1gYNVgT5G65fwPgWwEFA==
X-CSE-MsgGUID: UKagX4nSQUCGidoeHdE5uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8256232"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:58:04 -0800
Date: Tue, 10 Nov 2026 11:58:01 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: at91_adc: move to devm_* to fix NULL
 pointer deref
Message-ID: <avLqqS_9KcSdVvc2@ashevche-desk.local>
References: <20261110092848.141854-1-abdelnasserhussein11@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110092848.141854-1-abdelnasserhussein11@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015807_726718_F2A38802 
X-CRM114-Status: GOOD (  25.63  )
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

On Tue, Nov 10, 2026 at 11:28:48AM +0200, Abdelnasser Hussein wrote:
> If 'atmel,adc-use-external-triggers' is not set in the device tree,
> at91_adc_trigger_init() leaves the external trigger slots in st->trig
> as NULL. The error paths and remove function unconditionally called
> iio_trigger_unregister() and iio_trigger_free() on them, causing a
> NULL pointer dereference.
> 
> Instead of just checking for NULL, refactor the driver to use the
> device-managed (devm_*) API for registration and allocation. This
> modernizes the code, eliminates the need for manual cleanup functions
> (at91_adc_trigger_remove, at91_adc_buffer_remove, at91_ts_unregister,
> and at91_adc_remove), and inherently fixes the NULL pointer dereference
> since the core handles the cleanup of properly allocated triggers.
> 
> As part of this simplification, the remaining trigger initialization
> logic has been inlined into at91_adc_probe().

...

> static int at91_ts_register(struct iio_dev *idev,

>  {
>  	struct at91_adc_state *st = iio_priv(idev);
>  	struct input_dev *input;
> -	int ret;
>  
> -	input = input_allocate_device();
> +	input = devm_input_allocate_device(&pdev->dev);
>  	if (!input) {
>  		dev_err(&idev->dev, "Failed to allocate TS device!\n");

Side note:
This message needs to be killed, we don't print -ENOMEM errors.

>  		return -ENOMEM;

>  		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE) {
>  			dev_err(&pdev->dev,
>  				"This touchscreen controller only support 4 wires\n");
> -			ret = -EINVAL;
> -			goto err;
> +			return -EINVAL;

Another side note: this should move to dev_err_probe() (along with similar
cases) at some point.

>  		}
>  
>  		input_set_abs_params(input, ABS_X, 0, (1 << MAX_RLPOS_BITS) - 1,

...

>  static int at91_adc_probe(struct platform_device *pdev)
>  {
>  	unsigned int prsc, mstrclk, ticks, adc_clk, adc_clk_khz, shtim;
>  	struct device_node *node = pdev->dev.of_node;
> -	int ret;
> +	int i, ret;

No, don't add it here as it's local to the for-loop.

>  	struct iio_dev *idev;
>  	struct at91_adc_state *st;
>  	u32 reg, prop;

> -		ret = at91_adc_trigger_init(idev);
> -		if (ret < 0) {
> -			dev_err(&pdev->dev, "Couldn't setup the triggers.\n");
> -			at91_adc_buffer_remove(idev);
> -			return ret;

> +		st->trig = devm_kcalloc(&pdev->dev,

Add at the top

	struct device *dev = &pdev->dev;

and use in the code you modified or add.

> +					st->caps->trigger_number, sizeof(*st->trig),
> +					GFP_KERNEL);
> +		if (!st->trig)
> +			return -ENOMEM;

> +		for (i = 0; i < st->caps->trigger_number; i++) {

		for (int i = 0; i < st->caps->trigger_number; i++) {
		// align the type of i based on the type of trigger_number

> +			if (st->caps->triggers[i].is_external && !(st->use_external))
> +				continue;
> +
> +			st->trig[i] = at91_adc_allocate_trigger(idev,
> +								st->caps->triggers + i);
> +			if (!st->trig[i]) {
> +				dev_err(&idev->dev,
> +					"Could not allocate trigger %d\n", i);
> +				return -ENOMEM;
> +			}
>  		}

-- 
With Best Regards,
Andy Shevchenko



