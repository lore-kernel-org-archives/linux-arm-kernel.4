Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639A3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sgd1n/Pk;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QGS+dOl0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SrVpOL/vsmOkgEFx/8WAFupqNXkkubNUnl9sC+8oIJ0=; b=sgd1n/Pk63Fs2QXBQzHRFbsDpE
	vTQM9FrvmlSenGYdJp69L719esf6KnVPDrUOyzARnm5daH0Q7rxIq86juxoAoAVn2OWX64jmUCz5X
	2saYr5TA1ebPJWW1LldNB7Fy+6BbsrTaTKAnG3+QYeVr3aDwhv9zkgD5id7a9G7ov8Yzwrpkmk/n/
	uBg18cjTeMy+f8a4JYt8llpC/62jeWvaqJYqUJO2WTNTjnnmAB/nAt86EnTGpgqcp5RxSO+SmHs63
	ytasklbAE7lr6XZh+9dPoc4UrAUOzJ/1xskWHFTE1NaBuis9cmIWmjmkiYIz9HuAoOUABq3hRW5F4
	EJnnXdgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaav-0000000DaIk-0UZZ;
	Thu, 26 Nov 2026 14:37:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaaW-0000000Da9q-1wD7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:36:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-49412eb1474so4627143f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 06:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703798; x=1796308598; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SrVpOL/vsmOkgEFx/8WAFupqNXkkubNUnl9sC+8oIJ0=;
        b=QGS+dOl0EkabybTgvyqj5ra7IoUgvmrfB9+kCHF07VojvLNM7W2N41C+vqJRZWAc4a
         bcOaeo5sCTAdaBvbP9GK9sVTJT4wys+i4/Ls+WKI/wZIfRTL4myC6IXcIxlfESrD68+O
         dUWEyL4UcbWM3ylqr78tys8pcZBpBgQRFLTv8+gqhZub1HhEU7CjMDh8eytmJ9GFGhH3
         6YXHkWt7X+4lLHeohVVj230PMqJxtcEZ7101QyzNV6yq9KCqQX+YauOS+3pmfDtEtfGm
         7FKnMyvlENgELLWE5Y6+t6yp72bYweQQn2+/PbQVpaX2pJbgMH9t+xYDs3SUT2gbt103
         Y15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703798; x=1796308598;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrVpOL/vsmOkgEFx/8WAFupqNXkkubNUnl9sC+8oIJ0=;
        b=i6q1iXDJtjOKvxXvmrk04MyMAbgGXlrTud06ozptWb2Uz92xbyeAGP4j1RyaOGIGAw
         MHULP6AYxXWuxTvq6RaE+3HP8xW6Cetq8seBWd4/ote7kUKsXt98mAyqoRqszaQwlAtm
         0tq5raQJ0eoGrcfF+negC8iDb8aAnzuv8JfbHgnFdLx19+5QM6U12urATaRzpDMdvbaA
         hR8gM99Agu0wwZSFEW+v8JmV8kvvotxM8CtOlj/ZZ3lzF/WG/V+0LwwCyXKrYMToycli
         Zu7FovFc5jIg5z8F8tCuk9NgXm7J+4Xy+m1xM6pwcbqBXaOL6gPfeDsrVbJEeSf1/xmC
         0t3g==
X-Forwarded-Encrypted: i=1; AL+hErFzfZn7WDTBG4vLX2b6u1HPqknR2XCZkOV2xqsID0HAE4KU+c6rmMKUTkYpqyqOYb8EgB5AvpHTOUaO0UIH724o@lists.infradead.org
X-Gm-Message-State: APuU4Z+7aflZjellivMTmFxMpnWvUxE/e2USBR71cFmheCFWv3hq/hv0
	xpEp7L4s7UKgyhzfneDz49WNm+s/ovJotYPCHxilU/EmxDs1faNZNz9sk0GGirHEx4g=
X-Gm-Gg: AZFdTZeInjlr+OzT3OZpdHPIipZJbxhzmggKNSID7OF92OMrobpnillf+2YmANJuKUX
	df05EsGylNyECHc/H7wqGwGnLIliFZJlZYbgyBe3sukDvGU9WcCRcEA8rnGnh056O6VQQlSoTyx
	l4pOoF6ouRwsXF/RRUI/OspF6FcYCkPUf2HbSAx0H/TGN9vHqDDPmC1cdG9fy9YQryVUD1Aw3WQ
	JUtZxIcv32Qn/svX0EvTXwtSXgPU8PZFUAwCYWk4vx1wA6cnORjc6w05siZf2ij7QEZFYwm8JtE
	zX8hiaAF/cMgExdq6U2HXMqab2Wkkq94OjakLe3zWA9XNhuCxfltuKJC/u8DBb7Ah2nkteCpaR8
	2JsDbkyWpBWI0wdC6mf8aWP7Xgi8B04Z3kz8rR2vyRkGET6xyoBUlAPiwu/YKNenGF9fKcI4RZB
	s9gfYac2Q4PjrKR5XaCVPLOeAuDjZ4worZRirHtBd+tqB4LCFRzURDWMU479t8GmVR0RrUr+jMe
	7QZQ06I64224txt+0n6pL3fCcsoCmyQaoOVKhW0Yc2nNHKz52spBZzNRB9/F2WhvsxQKbeQd/+6
	EuGoMOSx8xGwkBzYVdLpEdYysVdS
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr445502155e9.13.1795703798534;
        Thu, 26 Nov 2026 06:36:38 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm340799515e9.0.2026.11.26.06.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:36:38 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:40:37 +0100
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/28] dmaengine: bcm2835: Fixes for dma_abort
Message-ID: <awhE5UEnOtrXWX5l@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-6-andrea.porta@suse.com>
 <awXmrhJ4HToyCxOD@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXmrhJ4HToyCxOD@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_063643_473975_85590B26 
X-CRM114-Status: GOOD (  34.98  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

On 14:34 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:43PM +0100, Andrea della Porta wrote:
> > From: Dom Cobley <popcornmix@gmail.com>
> >
> > There is a problem with the current abort scheme
> > when dma is blocked on a DREQ which prevents halting.
> >
> > This is triggered by SPI driver which aborts dma
> > in this state and so leads to a halt timeout.
> >
> > We attempt to abort the channel, which will work
> > if there is no blocked DREQ.
> 
> use imperative mood descript the problem
> 
> >
> > It it times out, we can assume there is no AXI
> > transfer in progress and reset anyway.
> >
> > The length of the timeout is observed at ~20us.
> 
> wrap at 75 char
> 
> >
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 32 +++++++++++++++++++++++---------
> >  1 file changed, 23 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 063e1b2aabe3..51e3a40dbaec 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -419,7 +419,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
> >  static void bcm2835_dma_abort(struct bcm2835_chan *c)
> >  {
> >  	void __iomem *chan_base = c->chan_base;
> > -	long timeout = 10000;
> > +	long timeout = 100;
> >
> >  	/*
> >  	 * A zero control block address means the channel is idle.
> > @@ -428,19 +428,33 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
> >  	if (!readl(chan_base + BCM2835_DMA_ADDR))
> >  		return;
> >
> > -	/* Write 0 to the active bit - Pause the DMA */
> > -	writel(0, chan_base + BCM2835_DMA_CS);
> > +	/* We need to clear the next DMA block pending */
> > +	writel(0, chan_base + BCM2835_DMA_NEXTCB);
> > +
> > +	/* Abort the DMA, which needs to be enabled to complete */
> > +	writel(readl(chan_base + BCM2835_DMA_CS) | BCM2835_DMA_ABORT | BCM2835_DMA_ACTIVE,
> > +	       chan_base + BCM2835_DMA_CS);
> >
> > -	/* Wait for any current AXI transfer to complete */
> > -	while ((readl(chan_base + BCM2835_DMA_CS) &
> > -		BCM2835_DMA_WAITING_FOR_WRITES) && --timeout)
> > +	/* wait for DMA to be aborted */
> > +	while ((readl(chan_base + BCM2835_DMA_CS) & BCM2835_DMA_ABORT) && --timeout)
> >  		cpu_relax();
> 
> use read_poll_timeout()
> 
> Frank
> >
> > -	/* Peripheral might be stuck and fail to signal AXI write responses */
> > -	if (!timeout)
> > +	/* Write 0 to the active bit - Pause the DMA */
> > +	writel(readl(chan_base + BCM2835_DMA_CS) & ~BCM2835_DMA_ACTIVE,
> > +	       chan_base + BCM2835_DMA_CS);
> > +
> > +	/*
> > +	 * Peripheral might be stuck and fail to complete
> > +	 * This is expected when dreqs are enabled but not asserted
> > +	 * so only report error in non dreq case
> > +	 */
> > +	if (!timeout && !(readl(chan_base + BCM2835_DMA_TI) &
> > +	   (BCM2835_DMA_S_DREQ | BCM2835_DMA_D_DREQ)))
> >  		dev_err(c->vc.chan.device->dev,
> > -			"failed to complete outstanding writes\n");
> > +			"failed to complete pause on dma %d (CS:%08x)\n", c->ch,
> > +			readl(chan_base + BCM2835_DMA_CS));
> >
> > +	/* Set CS back to default state and reset the DMA */
> >  	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
> >  }
> >

I'll drop this patch in v4. As sashiko pointed out, it brings back the
NEXTCONBK/ABORT sequence that commit 9e528c799d17 ("dmaengine: bcm2835:
Fix abort of transactions") replaced after finding experimentally that
it does not abort the control block.
It is also not needed for the 40-bit channels, which have their own abort
sequence.

Regards,
Andrea

> > --
> > 2.51.0
> >

