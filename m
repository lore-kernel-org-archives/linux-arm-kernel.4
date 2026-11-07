Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328AF606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 23:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h/yic6FF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hy8Wind9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k8f1Lml+DnNVCoJKZ2XRF0PGrEc1W5WYomf+X5t1Lfs=; b=h/yic6FF6tKEHe
	h7f2WSc/grgcYI+EimMbclOabrPGGEXAGLCiVMyNmr8tXUQ5gS3Bl62nynTwvaJJqWJMDGaLd+5Kc
	PKxZ71ek/lfJcrWGyvjkFh26a5Khc//zvM3wpd2/JrMEs7IdRSrQp7fuW/eANFUKQBLBWCatgUkS0
	TAt25rpuUfZfSpF/iYyf69vXVOiJpJ9UtPgn6+QGkA5ycLGfoDh9NQu1PraEPdfPBIm+ItaTHoOMM
	GbS5tplHLWAtW0PZ+cLbwoQRKgVXorhLJK8PzEOUSfJTstfx5j6s0jJvQaT3aZzi5mqTn5/s1VpFX
	mMMB4Cni9x1NuBO5dAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPpu5-0000000FVdf-09Ly;
	Sat, 07 Nov 2026 23:32:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPpu3-0000000FVdZ-35nH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 23:32:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7566C43E78;
	Sat,  7 Nov 2026 23:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF2B1F0089F;
	Sat,  7 Nov 2026 23:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794094375;
	bh=k8f1Lml+DnNVCoJKZ2XRF0PGrEc1W5WYomf+X5t1Lfs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Hy8Wind9uYXovSHKjGGJN9mum9JxtEuw2d1Fp1AkS3GD9uhNNMRbKh81VZxL19mdN
	 6Lp8fWLax+Quzq7zXpUxF/acLnvRksiTY623w5vvlOSlWru/X+/YEQCpjHc8PsqDSR
	 1GGoeVFzXt5l3QfP0myyHbgw+p2gYf0vc8J7jZyYZ5SwoDQCJVmv3flmCWuEgxW2SH
	 waqWAaxKjAaBVdOANUTsBM89gcKQdHVkrWuCPo/AUA1Lz7NJ74xbVy7KfUMKIYbwVe
	 TJ5RHnM2OR84hm1NEF85gwya6mjlTxPYUqhXB2S7dDX87VqWaf+XHv13ktO44smYne
	 H+yEh0F1IcsBg==
Date: Sat, 7 Nov 2026 23:32:44 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: Michal Simek <michal.simek@amd.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <amitrkcian2002@gmail.com>
Subject: Re: [PATCH 3/6] iio: adc: versal-sysmon: disable interrupts on
 shutdown
Message-ID: <20261107233244.63c35375@jic23-hlaptop>
In-Reply-To: <20261102122112.1723130-4-amit.kumar-mahapatra@amd.com>
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
	<20261102122112.1723130-4-amit.kumar-mahapatra@amd.com>
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

On Mon, 2 Nov 2026 17:51:09 +0530
Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com> wrote:

> Interrupt teardown is registered with devm_add_action_or_reset(), so
> sysmon_disable_interrupts() runs when the driver is unbound but not when
> the system shuts down: device_shutdown() invokes only the driver's
> .shutdown callback, which this driver does not implement.
> 
> The device is therefore left with its alarm interrupts enabled in
> hardware once Linux has stopped servicing them.
> 
> Add a .shutdown callback performing the same teardown, so the device is
> quiesced before control is handed on. The helper lives in the core
> module, so it is exported for the platform front-end. It skips a
> device described without an interrupt, which never set up interrupt
> handling.
> 
> Disabling the interrupts at shutdown is safe to have and not a must have
> requirement for shutdown.

So what is disadvantage of not doing it?  Otherwise, why have the complexity
of doing so?

J
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  drivers/iio/adc/versal-sysmon-core.c | 19 +++++++++++++++++++
>  drivers/iio/adc/versal-sysmon.c      |  6 ++++++
>  drivers/iio/adc/versal-sysmon.h      |  1 +
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versal-sysmon-core.c
> index 6595d07038c1..d39aaba9a8b6 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c
> @@ -1000,6 +1000,8 @@ int devm_versal_sysmon_core_probe(struct device *dev, struct regmap *regmap)
>  	if (!indio_dev)
>  		return -ENOMEM;
>  
> +	dev_set_drvdata(dev, indio_dev);
> +
>  	sysmon = iio_priv(indio_dev);
>  	sysmon->regmap = regmap;
>  	sysmon->temp_oversampling = 1;
> @@ -1050,6 +1052,23 @@ int devm_versal_sysmon_core_probe(struct device *dev, struct regmap *regmap)
>  }
>  EXPORT_SYMBOL_NS_GPL(devm_versal_sysmon_core_probe, "VERSAL_SYSMON");
>  
> +/**
> + * versal_sysmon_shutdown() - Disable SysMon interrupts on system shutdown
> + * @dev: SysMon device
> + *
> + * Interrupt teardown is a devm action, which runs on driver unbind but not
> + * on system shutdown, so disable the interrupts here as well.
> + */
> +void versal_sysmon_shutdown(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct sysmon *sysmon = iio_priv(indio_dev);
> +
> +	if (sysmon->irq > 0)
> +		sysmon_disable_interrupts(sysmon);
> +}
> +EXPORT_SYMBOL_NS_GPL(versal_sysmon_shutdown, "VERSAL_SYSMON");
> +
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("AMD Versal SysMon Core Driver");
>  MODULE_AUTHOR("Salih Erim <salih.erim@amd.com>");
> diff --git a/drivers/iio/adc/versal-sysmon.c b/drivers/iio/adc/versal-sysmon.c
> index 529d0486c9f9..4d5e3d14cf15 100644
> --- a/drivers/iio/adc/versal-sysmon.c
> +++ b/drivers/iio/adc/versal-sysmon.c
> @@ -71,6 +71,11 @@ static int sysmon_platform_probe(struct platform_device *pdev)
>  	return devm_versal_sysmon_core_probe(dev, regmap);
>  }
>  
> +static void sysmon_platform_shutdown(struct platform_device *pdev)
> +{
> +	versal_sysmon_shutdown(&pdev->dev);
> +}
> +
>  static const struct of_device_id sysmon_of_match_table[] = {
>  	{ .compatible = "xlnx,versal-sysmon" },
>  	{ }
> @@ -79,6 +84,7 @@ MODULE_DEVICE_TABLE(of, sysmon_of_match_table);
>  
>  static struct platform_driver sysmon_platform_driver = {
>  	.probe = sysmon_platform_probe,
> +	.shutdown = sysmon_platform_shutdown,
>  	.driver = {
>  		.name = "versal-sysmon",
>  		.of_match_table = sysmon_of_match_table,
> diff --git a/drivers/iio/adc/versal-sysmon.h b/drivers/iio/adc/versal-sysmon.h
> index a1ac3289719c..a21dacc13471 100644
> --- a/drivers/iio/adc/versal-sysmon.h
> +++ b/drivers/iio/adc/versal-sysmon.h
> @@ -122,5 +122,6 @@ struct sysmon {
>  };
>  
>  int devm_versal_sysmon_core_probe(struct device *dev, struct regmap *regmap);
> +void versal_sysmon_shutdown(struct device *dev);
>  
>  #endif /* _VERSAL_SYSMON_H_ */


