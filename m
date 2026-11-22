Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85369606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 03:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hDrzrtNQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OjjS0lXp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NKy+gTpYb5dVg5urGlblN/UMLSLttA2GEJW42xYuEaE=; b=hDrzrtNQdnpFXv
	1ooUev5xjSdaxT0+DRqhneEtv50jaXrg876yEq572IiDYk0wrwUeekZvu7M+djmSjU6e37nFeNHLi
	TMIUZKtjvNDcUqWClDFf8Yf/bhnV8lzy0LTpOh0PNb7B8HYjt7fXF3UCgR6+7ZBHbAyXRgpNunQRX
	xmslEOIg4k6MFyQBMVwT1Ld1me7GyQ0TxwNjXqhnFSpwK/08OacepZnRUF0CuotCs2mX89OB5pFNJ
	oVZJEs06Hp8UejN7Hd0w6S2Ohw/SmOPbv3FSS1HRPAPq5e6zSzUNee5a40scGH2DLiUp2sZ29lA16
	izeZH3nDgpDPWcbrUgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUxup-00000000hag-3vVJ;
	Sun, 22 Nov 2026 03:06:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUxuo-00000000haY-0Xr2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 03:06:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC4C043FE7;
	Sun, 22 Nov 2026 03:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6EA1F000C0;
	Sun, 22 Nov 2026 03:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795316813;
	bh=NKy+gTpYb5dVg5urGlblN/UMLSLttA2GEJW42xYuEaE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OjjS0lXppcVQbNVDoKmqORgWXRFhw+ZRgFJgtavVDDjrYgo66S+qNzgKH+jdSYq6i
	 6zeVj8qIP5Bh1KqIEB+PO2+enQ3r2DVTREWs9TV9E98pwR6FW2V7qfU96JnPGyXEnd
	 X+jX+YeodeVnUFO4WcN+rRDUwoxTxi5rO0Cgdno34OBzUtidkTrg6i1j6hKmq36VXB
	 6PQkmOVvizdwYLl0v2pG+8Yq9KWYAhpaR3asW9ZaH0zDD2+RPyyBZ6v/iMsqI13DtM
	 nnnTzNdcyqSLi67Hm5pLtqAW4YtpKLGckKJ9goBgvFihYTy0975keXX79K2g/njnI1
	 GUzbXb5TT4E5g==
Date: Sun, 22 Nov 2026 03:06:47 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 chernyakin.victor.j@outlook.com, cwweng@nuvoton.com
Subject: Re: [PATCH v5 3/3] iio: adc: Add Nuvoton MA35D1 EADC driver
Message-ID: <20261122030647.70b41b61@jic23-hlaptop>
In-Reply-To: <20261117082832.1551574-4-cwweng.linux@gmail.com>
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
	<20261117082832.1551574-4-cwweng.linux@gmail.com>
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

On Tue, 17 Nov 2026 16:28:32 +0800
Chi-Wen Weng <cwweng.linux@gmail.com> wrote:

> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> Add an IIO driver for the Enhanced Analog-to-Digital Converter found on
> Nuvoton MA35D1 SoCs.
> 
> Support single-ended and fixed differential inputs, direct conversion,
> and triggered buffered capture. This initial implementation uses sample
> module 0 and therefore supports one active voltage channel per buffered
> scan.
> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
Various comments inline to add to Andy's.

Thanks,

Jonathan

> diff --git a/drivers/iio/adc/ma35d1_eadc.c b/drivers/iio/adc/ma35d1_eadc.c
> new file mode 100644
> index 000000000000..d9a715efcc6b
> --- /dev/null
> +++ b/drivers/iio/adc/ma35d1_eadc.c
...

> +
> +/*
> + * Keep the register map uncached because status and conversion data are
> + * updated by hardware, and some status bits use write-one-to-clear semantics.

That's a reason to set volatile and precious but not general one to say
don't cache anything.

> + */
> +static const struct regmap_config ma35d1_adc_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = MA35D1_EADC_REFADJCTL,
> +	.rd_table = &ma35d1_adc_readable_table,
> +	.wr_table = &ma35d1_adc_writable_table,
> +	.precious_table = &ma35d1_adc_precious_table,
> +};



> +
> +static void ma35d1_adc_trigger_capture(struct iio_poll_func *pf)
> +{
> +	struct iio_dev *indio_dev = pf->indio_dev;
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);
> +	struct {
> +		u16 channel;
> +		aligned_s64 timestamp;
> +	} scan = { };
> +	int ret;
> +
> +	guard(mutex)(&adc->lock);
> +
> +	if (adc->suspended || !adc->scan_chan)
> +		return;
> +
> +	ret = ma35d1_adc_read_conversion(adc, adc->scan_chan,
> +					 &scan.channel);

Check line wraps. That one fits under 80 chars.

> +	if (ret)
> +		return;
> +
> +	iio_push_to_buffers_with_ts(indio_dev, &scan, sizeof(scan), pf->timestamp);
> +}

> +
> +static int ma35d1_adc_parse_channels(struct iio_dev *indio_dev,
> +				     struct device *dev)
> +{
> +	DECLARE_BITMAP(used_single_inputs, MA35D1_EADC_MAX_EXT_CHANNELS) = { };
> +	DECLARE_BITMAP(used_diff_pairs, MA35D1_EADC_NUM_DIFF_PAIRS) = { };
> +	DECLARE_BITMAP(used_regs, MA35D1_EADC_MAX_EXT_CHANNELS) = { };
> +	struct iio_chan_spec *channels;
> +	unsigned int scan_index = 0;
> +	int num_channels;
> +	int ret;
> +
> +	num_channels = device_get_child_node_count(dev);
> +	if (!num_channels)
> +		return dev_err_probe(dev, -ENOENT, "no ADC channels configured\n");
> +
> +	if (num_channels > MA35D1_EADC_MAX_EXT_CHANNELS)
> +		return dev_err_probe(dev, -ENOSPC, "too many ADC channels\n");
> +
> +	channels = devm_kcalloc(dev, size_add(num_channels, 1),
> +				sizeof(*channels), GFP_KERNEL);

You can now use devm_kzalloc_objs()
A patch to apply that across the kernel went in during last week
and the code is there since rc1.

I don't mind either way as there will inevitably be a second round
of conversions next cycle.


> +	if (!channels)
> +		return -ENOMEM;
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		bool has_diff, has_single;
> +		u32 reg;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "missing channel reg property\n");
> +
> +		if (reg >= MA35D1_EADC_MAX_EXT_CHANNELS)
> +			return dev_err_probe(dev, -ENOSPC,
> +					     "invalid ADC channel index %u\n", reg);
> +
> +		if (test_and_set_bit(reg, used_regs))
> +			return dev_err_probe(dev, -EEXIST,
> +					     "duplicate ADC channel index %u\n", reg);
> +
> +		has_single = fwnode_property_present(child, "single-channel");
> +		has_diff = fwnode_property_present(child, "diff-channels");
> +		if (has_single && has_diff)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "channel %u has conflicting input properties\n",
> +					     reg);
> +
> +		if (has_diff)
> +			ret = ma35d1_adc_parse_diff_channel(dev, child,
> +							    &channels[scan_index],
> +							    used_diff_pairs, reg,
> +							    scan_index);
> +		else
> +			ret = ma35d1_adc_parse_single_channel(dev, child,
> +							      &channels[scan_index],
> +							      used_single_inputs,
> +							      has_single, reg,
> +							      scan_index);
> +		if (ret)
> +			return ret;
> +
> +		scan_index++;
> +	}
> +
> +	channels[scan_index] = IIO_CHAN_SOFT_TIMESTAMP(scan_index);
> +	indio_dev->channels = channels;
> +	indio_dev->num_channels = scan_index + 1;
> +
> +	return 0;
> +}
> +
> +static int ma35d1_adc_init_vref(struct ma35d1_adc *adc, struct device *dev)
> +{
> +	int ret;
> +
> +	ret = devm_regulator_get_enable_read_voltage(dev, "vref");
> +	if (ret == -ENODEV) {
> +		adc->vref_mV = MA35D1_EADC_INTERNAL_VREF_mV;
> +	} else if (ret < 0) {
> +		return dev_err_probe(dev, ret, "failed to get VREF supply\n");
> +	} else if (ret > 0) {
> +		adc->external_vref = true;
> +		adc->vref_mV = ret / (MICRO / MILLI);
> +	} else {
> +		return dev_err_probe(dev, -EINVAL, "invalid VREF voltage\n");

This is just 0. The calc for real values above will end up with 0 in vref_mv if
there is less than 1 mV so not sure handling this separately brings much value.
you have to assume vref_mv might be zero anyway.


> +	}
> +
> +	return 0;
> +}

> +
> +static int ma35d1_adc_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);
> +	bool buffer_enabled;
> +	int ret;
> +
> +	/* A failed resume leaves the device and its triggering suspended. */
> +	scoped_guard(mutex, &adc->lock) {
> +		if (adc->suspended)
> +			return 0;
> +	}
> +
> +	/*
> +	 * pollfunc->irq is not initialized until the pollfunc is first
> +	 * attached to a trigger, so only suspend and resume triggering
> +	 * while the buffer is enabled.

True enough but isn't it also guarded by if indio_dev->pollfunc
inside the iio_device_suspend_triggering()?

I think in the case you are avoiding it is a noop anyway.

disable_irq() nests fine so it shouldn't even matter if anyone turned
it on yet.


> +	 */
> +	buffer_enabled = iio_buffer_enabled(indio_dev);
> +	if (buffer_enabled) {
> +		ret = iio_device_suspend_triggering(indio_dev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = ma35d1_adc_suspend_hw(adc);
> +	if (ret && buffer_enabled)
> +		iio_device_resume_triggering(indio_dev);
> +
> +	return ret;
> +}
> +
> +static int ma35d1_adc_resume(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);
> +	int ret;
> +
> +	scoped_guard(mutex, &adc->lock) {
> +		if (!adc->suspended)
> +			return 0;
> +	}
> +
> +	ret = ma35d1_adc_resume_hw(adc);
> +	if (ret)
> +		return ret;
> +
> +	if (!iio_buffer_enabled(indio_dev))
> +		return 0;

As above, I'm missing why we need to protect the call
to resume_triggering.  The pollfunc can't change between
suspend and resume so there is either one there or not
in both cases and the guards inside that call should take care
of the rest.  If I'm missing something we should look to
fix it in those calls!

> +
> +	return iio_device_resume_triggering(indio_dev);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(ma35d1_adc_pm_ops,
> +				ma35d1_adc_suspend, ma35d1_adc_resume);
> +
> +static const struct of_device_id ma35d1_adc_of_match[] = {
> +	{ .compatible = "nuvoton,ma35d1-eadc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ma35d1_adc_of_match);
> +
> +static struct platform_driver ma35d1_adc_driver = {
> +	.probe = ma35d1_adc_probe,
> +	.driver = {
> +		.name = "ma35d1-eadc",
> +		.of_match_table = ma35d1_adc_of_match,
> +		.pm = pm_sleep_ptr(&ma35d1_adc_pm_ops),
> +	},
> +};
> +module_platform_driver(ma35d1_adc_driver);
> +
> +MODULE_AUTHOR("Chi-Wen Weng <cwweng@nuvoton.com>");
> +MODULE_DESCRIPTION("Nuvoton MA35D1 EADC driver");
> +MODULE_LICENSE("GPL");


