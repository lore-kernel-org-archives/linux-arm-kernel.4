Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF55606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZB6y0FdK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZnrWJPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=34hlWE/5yV74VGOsqUBaRozbIZwUYpRMajO1DTLdlcA=; b=ZB6y0FdK80p5H7
	FfLqOkQbiWeNMOkdtNS/yVHWQ8LyWQSzaeAdowqVLyo4tGZumyUAaUv3173CpRY2S6urwg1nqSMy9
	ttQq/zvwwUsprFQuQQaEvSwyKu8GasPDokQ7RbthTzNdCM3ZfnI+y/Ny416t3Mqx7mh8LEohlqoT6
	xueKMRIuVvG0VsgoYmmqB6U4IYMEC4Xfw4+vUtLiFLDEhA/eDixPHLIgLHbOJ3rODfxJcDYfsp0Qh
	5Giq68vbb5EAEqtpu5gFj1+LsvfL4HMWxfg70Tf91D9KNoHHl0Pu9q6SX9GUw/tskeyQLEvVzku5G
	S8fns1EmXuGn0BxA+akg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKVr-00000008Vkr-1qVK;
	Thu, 12 Nov 2026 02:26:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKVq-00000008Vkl-416P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:26:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63FAE45EF3;
	Thu, 12 Nov 2026 02:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BD71F00A05;
	Thu, 12 Nov 2026 02:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794450366;
	bh=34hlWE/5yV74VGOsqUBaRozbIZwUYpRMajO1DTLdlcA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FZnrWJPsE8nEortlRKkelOr+l+Tr8gz6+//JFpBUv0UbrnunMQVdj2MBgWR0El0nV
	 qeH32cdvm/GubXrdZ1OkWxhIndBGNZjIO+idDzdCg4md2a6q8RLKj34Job3KZAupmj
	 TzZeo0k+J3lnwhHM6HuOHFOei6uoFry0xDuM4og2JZjTgq++gDygxDG7wqQQBEtf6X
	 utVTPM9z7NTJTbbigy+GWJjZapvXGG7uEqlP7wBuH2IL4Wc739oBUYJ3OO7FvJmJ2+
	 utgq1RH0uCwd9TL1DkTdQ44zCBoZBKwJOg6u4bwMWUKwWrHvHZyUreCwbhuAx2b2Kg
	 4gGwX46QONJ+w==
Date: Thu, 12 Nov 2026 02:25:58 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: adc: at91_adc: move to devm_* to fix NULL
 pointer deref
Message-ID: <20261112022558.03a6bbd9@jic23-hlaptop>
In-Reply-To: <20261111101345.185122-1-abdelnasserhussein11@gmail.com>
References: <20261111101345.185122-1-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 11 Nov 2026 12:13:45 +0200
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

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
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Fixes: 0e589d5fb317 ("ARM: AT91: IIO: Add AT91 ADC driver.")
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>

Hi. The overall result here looks good, but generally for a large
change like this we try to reduce the noise by making refactors like
the introduction of struct device *dev = &pdev->dev as precusor
simple patches (only touching lines not otherwise touched by the main patch).


> ---
> v3:
>  - Addressed review comments from Andy Shevchenko:
>    - Removed the redundant dev_err() after devm_input_allocate_device().
>    - Declared a local 'struct device *dev = &pdev->dev' and used it in
>      at91_adc_probe().
>    - Declared the loop iterator inside the for-loop.
> 
> v2:
>  - Dropped the simple NULL check approach.
>  - Refactored the driver to use devm_* API as suggested by Jonathan Cameron.
>  - Removed manual cleanup functions and error paths entirely.
>  - Inlined remaining trigger initialization into probe().
> 
>  drivers/iio/adc/at91_adc.c | 185 +++++++++++--------------------------
>  1 file changed, 52 insertions(+), 133 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
> index 0ac74ad92fca..5293229f3dfa 100644
> --- a/drivers/iio/adc/at91_adc.c
> +++ b/drivers/iio/adc/at91_adc.c
> @@ -608,85 +608,32 @@ static const struct iio_trigger_ops at91_adc_trigger_ops = {
>  static struct iio_trigger *at91_adc_allocate_trigger(struct iio_dev *idev,
>  						     const struct at91_adc_trigger *trigger)
>  {
> +	struct device *dev = idev->dev.parent;

Pass the struct device in.  We shouldn't be relying on that parent relationship
as that's an internal implementation detail.  The caller has the right dev
to hand so easy to pass in.

>  	struct iio_trigger *trig;
>  	int ret;
>  
> -	trig = iio_trigger_alloc(idev->dev.parent, "%s-dev%d-%s", idev->name,
> -				 iio_device_id(idev), trigger->name);
> -	if (trig == NULL)
> +	trig = devm_iio_trigger_alloc(dev, "%s-dev%d-%s", idev->name,
> +				      iio_device_id(idev), trigger->name);
> +	if (!trig)
>  		return NULL;
>  
>  	iio_trigger_set_drvdata(trig, idev);
>  	trig->ops = &at91_adc_trigger_ops;
>  
> -	ret = iio_trigger_register(trig);
> -	if (ret) {
> -		iio_trigger_free(trig);
> +	ret = devm_iio_trigger_register(dev, trig);
Hmm. This function is badly named as does things I'd consider not in
scope for an _allocate.

There isn't a lot here so what does it look like if we just squash
this code to the caller? Maybe we do need a helper as indent is getting
too large, but it doesn't look like it would be that bad.

> +	if (ret)
>  		return NULL;
> -	}
>  
>  	return trig;
>  }
>  
> -static int at91_adc_trigger_init(struct iio_dev *idev)
> -{
> -	struct at91_adc_state *st = iio_priv(idev);
> -	int i, ret;
> -
> -	st->trig = devm_kcalloc(&idev->dev,
> -				st->caps->trigger_number, sizeof(*st->trig),
> -				GFP_KERNEL);
> -
> -	if (st->trig == NULL) {
> -		ret = -ENOMEM;
> -		goto error_ret;
> -	}
> -
> -	for (i = 0; i < st->caps->trigger_number; i++) {
> -		if (st->caps->triggers[i].is_external && !(st->use_external))
> -			continue;
> -
> -		st->trig[i] = at91_adc_allocate_trigger(idev,
> -							st->caps->triggers + i);
> -		if (st->trig[i] == NULL) {
> -			dev_err(&idev->dev,
> -				"Could not allocate trigger %d\n", i);
> -			ret = -ENOMEM;
> -			goto error_trigger;
> -		}
> -	}
> -
> -	return 0;
> -
> -error_trigger:
> -	for (i--; i >= 0; i--) {
> -		iio_trigger_unregister(st->trig[i]);
> -		iio_trigger_free(st->trig[i]);
> -	}
> -error_ret:
> -	return ret;
> -}
> -
> -static void at91_adc_trigger_remove(struct iio_dev *idev)
> -{
> -	struct at91_adc_state *st = iio_priv(idev);
> -	int i;
> -
> -	for (i = 0; i < st->caps->trigger_number; i++) {
> -		iio_trigger_unregister(st->trig[i]);
> -		iio_trigger_free(st->trig[i]);
> -	}
> -}
> -
>  static int at91_adc_buffer_init(struct iio_dev *idev)
>  {
> -	return iio_triggered_buffer_setup(idev, &iio_pollfunc_store_time,
> -		&at91_adc_trigger_handler, NULL);
> -}
> +	struct device *dev = idev->dev.parent;
As above, we shouldn't rely on that.

This helper seems rather pointless. Maybe just drop it and put the
code inline.

>  
> -static void at91_adc_buffer_remove(struct iio_dev *idev)
> -{
> -	iio_triggered_buffer_cleanup(idev);
> +	return devm_iio_triggered_buffer_setup(dev, idev,
> +					       &iio_pollfunc_store_time,
> +					       &at91_adc_trigger_handler, NULL);
>  }
>  
>  static int at91_adc_read_raw(struct iio_dev *idev,
> @@ -924,13 +871,10 @@ static int at91_ts_register(struct iio_dev *idev,
>  {
>  	struct at91_adc_state *st = iio_priv(idev);
>  	struct input_dev *input;
> -	int ret;
>  
> -	input = input_allocate_device();
> -	if (!input) {
> -		dev_err(&idev->dev, "Failed to allocate TS device!\n");
> +	input = devm_input_allocate_device(&pdev->dev);
> +	if (!input)
>  		return -ENOMEM;
> -	}
>  
>  	input->name = DRIVER_NAME;
>  	input->id.bustype = BUS_HOST;
> @@ -951,8 +895,7 @@ static int at91_ts_register(struct iio_dev *idev,
>  		if (st->touchscreen_type != ATMEL_ADC_TOUCHSCREEN_4WIRE) {
>  			dev_err(&pdev->dev,
>  				"This touchscreen controller only support 4 wires\n");
> -			ret = -EINVAL;
> -			goto err;
> +			return -EINVAL;
			return dev_err_probe(&pdev->dev, -EINVAL,
					     "This touch...

>  		}
>  
>  		input_set_abs_params(input, ABS_X, 0, (1 << MAX_RLPOS_BITS) - 1,
> @@ -964,39 +907,27 @@ static int at91_ts_register(struct iio_dev *idev,
>  	st->ts_input = input;
>  	input_set_drvdata(input, st);
>  
> -	ret = input_register_device(input);
> -	if (ret)
> -		goto err;
> -
> -	return ret;
> -
> -err:
> -	input_free_device(input);
> -	return ret;
> -}
> -
> -static void at91_ts_unregister(struct at91_adc_state *st)
> -{
> -	input_unregister_device(st->ts_input);
> +	return input_register_device(input);
>  }
>  
>  static int at91_adc_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	unsigned int prsc, mstrclk, ticks, adc_clk, adc_clk_khz, shtim;
> -	struct device_node *node = pdev->dev.of_node;
> +	struct device_node *node = dev->of_node;
>  	int ret;
>  	struct iio_dev *idev;
>  	struct at91_adc_state *st;
>  	u32 reg, prop;
>  	const char *s;
>  
> -	idev = devm_iio_device_alloc(&pdev->dev, sizeof(struct at91_adc_state));
> +	idev = devm_iio_device_alloc(dev, sizeof(struct at91_adc_state));

Whilst here make that sizeof(*st)

>  	if (!idev)
>  		return -ENOMEM;
>  
>  	st = iio_priv(idev);
>  
> -	st->caps = of_device_get_match_data(&pdev->dev);
> +	st->caps = of_device_get_match_data(dev);
>  
>  	st->use_external = of_property_read_bool(node, "atmel,adc-use-external-triggers");
>  
> @@ -1041,7 +972,7 @@ static int at91_adc_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, idev);
>  
> -	idev->name = dev_name(&pdev->dev);
> +	idev->name = dev_name(dev);
>  	idev->modes = INDIO_DIRECT_MODE;
>  	idev->info = &at91_adc_info;
>  
> @@ -1060,25 +991,25 @@ static int at91_adc_probe(struct platform_device *pdev)
>  	at91_adc_writel(st, AT91_ADC_IDR, 0xFFFFFFFF);
>  
>  	if (st->caps->has_tsmr)
> -		ret = devm_request_irq(&pdev->dev, st->irq,
> +		ret = devm_request_irq(dev, st->irq,

So there are several things in this patch that can be broken out.
One is to introduce struct device *dev and convert only those cases
that aren't touched in the more general refactors. That would reduce
the noise in the main patch that follow by separating out changes like
this one.

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
>  
> -	st->clk = devm_clk_get_enabled(&pdev->dev, "adc_clk");
> +	st->clk = devm_clk_get_enabled(dev, "adc_clk");
>  	if (IS_ERR(st->clk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(st->clk),
> +		return dev_err_probe(dev, PTR_ERR(st->clk),
>  				     "Could not prepare or enable the clock.\n");
>  
> -	st->adc_clk = devm_clk_get_enabled(&pdev->dev, "adc_op_clk");
> +	st->adc_clk = devm_clk_get_enabled(dev, "adc_op_clk");
>  	if (IS_ERR(st->adc_clk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(st->adc_clk),
> +		return dev_err_probe(dev, PTR_ERR(st->adc_clk),
>  				     "Could not prepare or enable the ADC clock.\n");
>  
>  	/*
> @@ -1090,13 +1021,13 @@ static int at91_adc_probe(struct platform_device *pdev)
>  	adc_clk = clk_get_rate(st->adc_clk);
>  	adc_clk_khz = adc_clk / 1000;
>  
> -	dev_dbg(&pdev->dev, "Master clock is set as: %d Hz, adc_clk should set as: %d Hz\n",
> +	dev_dbg(dev, "Master clock is set as: %d Hz, adc_clk should set as: %d Hz\n",
>  		mstrclk, adc_clk);
>  
>  	prsc = (mstrclk / (2 * adc_clk)) - 1;
>  
>  	if (!st->startup_time)
> -		return dev_err_probe(&pdev->dev, -EINVAL,
> +		return dev_err_probe(dev, -EINVAL,
>  				     "No startup time available.\n");
>  	ticks = (*st->caps->calc_startup_ticks)(st->startup_time, adc_clk_khz);
>  
> @@ -1123,7 +1054,7 @@ static int at91_adc_probe(struct platform_device *pdev)
>  	/* Setup the ADC channels available on the board */
>  	ret = at91_adc_channel_init(idev);
>  	if (ret < 0)
> -		return dev_err_probe(&pdev->dev, ret,
> +		return dev_err_probe(dev, ret,
>  				     "Couldn't initialize the channels.\n");
>  
>  	init_waitqueue_head(&st->wq_data_avail);
> @@ -1137,14 +1068,26 @@ static int at91_adc_probe(struct platform_device *pdev)
>  	if (!st->touchscreen_type) {
>  		ret = at91_adc_buffer_init(idev);
>  		if (ret < 0)
> -			return dev_err_probe(&pdev->dev, ret,
> +			return dev_err_probe(dev, ret,
>  					     "Couldn't initialize the buffer.\n");

Can combine that onto one line.

>  
> -		ret = at91_adc_trigger_init(idev);
> -		if (ret < 0) {
> -			dev_err(&pdev->dev, "Couldn't setup the triggers.\n");
> -			at91_adc_buffer_remove(idev);
> -			return ret;
> +		st->trig = devm_kcalloc(dev,
> +					st->caps->trigger_number, sizeof(*st->trig),
> +					GFP_KERNEL);
> +		if (!st->trig)
> +			return -ENOMEM;
> +
> +		for (int i = 0; i < st->caps->trigger_number; i++) {
> +			if (st->caps->triggers[i].is_external && !(st->use_external))
> +				continue;
> +
> +			st->trig[i] = at91_adc_allocate_trigger(idev,
> +								st->caps->triggers + i);
I'm fine with slightly longer lines where it helps readability.  This sort of split
ends up looking silly so go long!

However as above I'm wondering if you should just pull the code in that
function down here and drop the helper.

> +			if (!st->trig[i]) {
> +				dev_err(&idev->dev,
> +					"Could not allocate trigger %d\n", i);
> +				return -ENOMEM;

I thought I saw Andy mentioning this in v2, but maybe not.
Generally we don't print errors on -ENOMEM as any path where that occurs
tends to have a lot of error prints already.  So drop this print.


> +			}
>  		}
>  	} else {
>  		ret = at91_ts_register(idev, pdev);
> @@ -1154,36 +1097,13 @@ static int at91_adc_probe(struct platform_device *pdev)
>  		at91_ts_hw_init(idev, adc_clk_khz);
>  	}
>  
> -	ret = iio_device_register(idev);
> +	ret = devm_iio_device_register(dev, idev);
>  	if (ret < 0) {
> -		dev_err(&pdev->dev, "Couldn't register the device.\n");
> -		goto error_iio_device_register;
> +		dev_err(dev, "Couldn't register the device.\n");
> +		return ret;

Given you are touching the lines anyway, 

		return dev_err_probe(dev, ret, "Couldn't register the device.\n");

>  	}
>  
>  	return 0;


