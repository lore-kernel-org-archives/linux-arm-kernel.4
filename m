Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C78606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RKRvxI03;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oED68b0g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5xeRgjtQ4aBRCLdC1l3UpIvgsBpz7rqdhU/SsbMNbao=; b=RKRvxI03gQKhfgG3UmviSju8Aq
	ZFEXg+3JSM04Thbcheu8UMTOP1hsUR0XyzqiuKu9suurWMtBiKtS0yAcQcnGbucdk1PV2VT16+DMw
	XiByd2RImhPgQpaGksZJwNt0cKpOJvI25X9N8iFRc99EEhWG7thGl0ewMgp0+4bbCb4SKwX4gg2be
	Zho3VyjYGV4rUbsjEQJ6paBgMQcdCGVimCXT2OLmAlj9nRaqUb27MM2VDrN8GA9Z9Ak0EGVLdOCYU
	n1I7pLg/V24AlJ536AvlA60wsvjl2uk4xzNoOYOQv/eF4yDJlCPR6ldM1vhuQWu57cX0enWafGS+Q
	LSp0JhXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFJ4-00000001oSD-0nIO;
	Sun, 22 Nov 2026 21:41:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFJ1-00000001oRw-1v1I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 21:41:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB39644847;
	Sun, 22 Nov 2026 21:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDD51F008B2;
	Sun, 22 Nov 2026 21:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795383662;
	bh=5xeRgjtQ4aBRCLdC1l3UpIvgsBpz7rqdhU/SsbMNbao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oED68b0gYqf4ZoJPJddluGEGEQYM9ixaKIPKBFap6WznGL+ii6fqRqFx3HDsNya2R
	 ShkMBl9+/d77pMRJI7357hvFh3C4Ns4S8NJIBtm1D1aaHL01iyNVO07JAQWO16pm+3
	 g34UvEoJZkqrXmI1u0wvpLUvRHPd0GKFLFWBCa+RLEZWSFK0jBvGTbzX7hEeFgI54y
	 /VdepQxvF+kd3wD+xegGvnJyO76OBXuAP4djsYFcqV3MsTdcTyOd0jNI7CljblX5Up
	 gSnJ3PpymfXihunJfzcJQHAZyywgP5KK3xM/zStkld3zyL27g/mE/TC8uGhDsTyKgW
	 kXt/4C8bVM68g==
Date: Sun, 22 Nov 2026 21:40:57 +0000
From: Lee Jones <lee@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 05/10] iio: adc: stm32-adc: Detach chained IRQ handler
 before removing domain
Message-ID: <20261122214057.GE70182@joneslee-macbookpro.roam.internal>
References: <20261119153151.1397003-1-lee@kernel.org>
 <20261119153151.1397003-6-lee@kernel.org>
 <a449f513-5d7f-4478-a389-9c47dd0ecddd@foss.st.com>
 <20261121225114.41f87da3@jic23-hlaptop>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121225114.41f87da3@jic23-hlaptop>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 21 Nov 2026, Jonathan Cameron wrote:

> On Fri, 20 Nov 2026 18:23:19 +0100
> Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:
> 
> > On 11/19/26 16:30, Lee Jones wrote:
> > > stm32_adc_irq_remove() disposes of the child IRQ mappings and removes
> > > priv->domain before clearing the parent chained IRQ handlers.  Because
> > > the parent hardware interrupt lines remain unmasked while child devices
> > > use dummy_irq_chip, an interrupt arriving during teardown invokes
> > > stm32_adc_irq_handler() after irq_domain_remove() has freed
> > > priv->domain, and irq_set_chained_handler() also leaves handler_data
> > > dangling.
> > > 
> > > Detach the chained handlers and clear handler_data with
> > > irq_set_chained_handler_and_data() before tearing down the mappings and
> > > removing the domain.
> > > 
> > > Fixes: 1add69880240 ("iio: adc: Add support for STM32 ADC core")
> > > Closes: https://sashiko.dev/#/bug/linux-27c38690-bc20-43aa-a3fc-1ddd6f1bb74e
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Lee Jones <lee@kernel.org>
> > > ---  
> > 
> > Hi Lee,
> > 
> > Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> This one seems a little more likely to be hit in practice, but
> it doesn't apply to the fixes tree due to some other recent changes and
> I'm lazy.
> 
> Hence applied to the testing branch of iio.git to line it up for next
> merge cycle. We are getting late enough I should be keeping fixes to critical
> stuff only and I'm going to assume this one isn't.

My preference for all of these sets is for them to be applied for -next
rather than -fixes, if it's all the same to you.

And yes, v2s are no issue (replying to your other comments here).

Bear with.

-- 
Lee Jones

