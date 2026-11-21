Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC72606A336
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 22:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lmCGwrOB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b+fJSMXm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M7DMWBB94yLZqEaPSWigGMEGI/4GG3JhAn9LfYKnXPE=; b=lmCGwrOBobRy3/
	/0C1H+jxOFugOvy9Po58CyyR/UuQCOpVQCmGaPxt2jzj/dmstYtt/72hra7G5rngMrMEygiF/zrJ4
	+C61XzzlPBSDV4m9nrDI33ScptqLYcr2QOKhKrQgtl3PLJ+j1+5+fwQ1GsZcWPLNfcktx+le7H2eE
	rpxzEt9ZON0RYCq7NrhVmQcYYAiEDsE9xCxYo5Fmy3oF1pCHkT255Iw3NBtlPMYib5phSSZ7cGkBP
	fXXztKybVlN+5q4cQlOEIOsZmbLOmVpiRt2+WgS8ewVkZJbcyLhyFLFe7WiLbNYPZw+1zQ7RNmzI7
	wRf/sSNqFJFt56Yt+2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUtvX-00000000RT0-1tmE;
	Sat, 21 Nov 2026 22:51:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUtvV-00000000RSt-3fgg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 22:51:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DDC9E60E02;
	Sat, 21 Nov 2026 22:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B1E1F000CA;
	Sat, 21 Nov 2026 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795301480;
	bh=M7DMWBB94yLZqEaPSWigGMEGI/4GG3JhAn9LfYKnXPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=b+fJSMXmBh79PHQmv8iixzQ57TVwBz1eAqyUajITE23tX6XJO9bYLoFobVPEu8Bnb
	 dvJBNK89U/PpIHOPCoyYDT1qx+0qdmKaiQB4zqoXMiN/6Hq9CXcJsqPEXLLZyBqIm3
	 TScpqY23WT04z3kejVElUuzqV1pxh5JIbhhbr6X00CSjeNPSvUgfHlNRTFAARt1j+9
	 5AvmrtAHKamEFYySoyLnGgqeh5BuqQIRNjYDMSHgFrUUC51hwYMcfgwQrY+xS2o9pU
	 s5UjYkerquQjbAbkm19TtwugK+kvMtNLPIcQtSVB3kfSv49DVcO7b3wBVWqJhHJPnd
	 4zzX1xABklZ5w==
Date: Sat, 21 Nov 2026 22:51:14 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Lee Jones <lee@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, <linux-iio@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 05/10] iio: adc: stm32-adc: Detach chained IRQ handler
 before removing domain
Message-ID: <20261121225114.41f87da3@jic23-hlaptop>
In-Reply-To: <a449f513-5d7f-4478-a389-9c47dd0ecddd@foss.st.com>
References: <20261119153151.1397003-1-lee@kernel.org>
	<20261119153151.1397003-6-lee@kernel.org>
	<a449f513-5d7f-4478-a389-9c47dd0ecddd@foss.st.com>
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

On Fri, 20 Nov 2026 18:23:19 +0100
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> On 11/19/26 16:30, Lee Jones wrote:
> > stm32_adc_irq_remove() disposes of the child IRQ mappings and removes
> > priv->domain before clearing the parent chained IRQ handlers.  Because
> > the parent hardware interrupt lines remain unmasked while child devices
> > use dummy_irq_chip, an interrupt arriving during teardown invokes
> > stm32_adc_irq_handler() after irq_domain_remove() has freed
> > priv->domain, and irq_set_chained_handler() also leaves handler_data
> > dangling.
> > 
> > Detach the chained handlers and clear handler_data with
> > irq_set_chained_handler_and_data() before tearing down the mappings and
> > removing the domain.
> > 
> > Fixes: 1add69880240 ("iio: adc: Add support for STM32 ADC core")
> > Closes: https://sashiko.dev/#/bug/linux-27c38690-bc20-43aa-a3fc-1ddd6f1bb74e
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lee Jones <lee@kernel.org>
> > ---  
> 
> Hi Lee,
> 
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
This one seems a little more likely to be hit in practice, but
it doesn't apply to the fixes tree due to some other recent changes and
I'm lazy.

Hence applied to the testing branch of iio.git to line it up for next
merge cycle. We are getting late enough I should be keeping fixes to critical
stuff only and I'm going to assume this one isn't.

Jonathan

> Best Regards,
> Thanks,
> Fabrice
> 
> >  drivers/iio/adc/stm32-adc-core.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> > index 4b532db3db62..13b75475046c 100644
> > --- a/drivers/iio/adc/stm32-adc-core.c
> > +++ b/drivers/iio/adc/stm32-adc-core.c
> > @@ -467,12 +467,12 @@ static void stm32_adc_irq_remove(struct platform_device *pdev,
> >  	int hwirq;
> >  	unsigned int i;
> >  
> > +	for (i = 0; i < priv->nb_irqs; i++)
> > +		irq_set_chained_handler_and_data(priv->irq[i], NULL, NULL);
> > +
> >  	for (hwirq = 0; hwirq < priv->nb_adc_max; hwirq++)
> >  		irq_dispose_mapping(irq_find_mapping(priv->domain, hwirq));
> >  	irq_domain_remove(priv->domain);
> > -
> > -	for (i = 0; i < priv->nb_irqs; i++)
> > -		irq_set_chained_handler(priv->irq[i], NULL);
> >  }
> >  
> >  static int stm32_adc_core_switches_supply_en(struct stm32_adc_priv *priv,  
> 
> 


