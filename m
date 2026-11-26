Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5727D606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ib2+lCdL;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FxsvQ4fF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Go0TMbxFIn6Uh64J5GWsZj276nuCgaJAlCWObxr0QGU=; b=Ib2+lCdLijFbMRbC1KKdJ9U2vd
	INbjotzZIbjaifDmSp671ofptfBzuyMpu3fQu2FEt9XwMBtkcQ5Kp+lwl0J/iuDQnYx+RiCGyxSkT
	YpZfWWsJ1oyL9f9Q4ggqixS3vHIMGACw8q487eNq1NzKoVnNkpDTr+/+8hNgqSlBkdJbPnUFzV1b8
	k7in/bGm42BcKZ/dOP9Nx+FAGK3Td559LQKMybz25j/Q9T2D2vWjkog4oAWHgKJX4NOoi1t48Ycmm
	FIUixvTzTVzEV7tVFkDscN+d7vj6iu4sGEUE/1CcM1yJiTEQ065hjmHnj/555qwjFJP/iWzHkAnIS
	Ip9/jveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaTm-0000000DYJg-2hqk;
	Thu, 26 Nov 2026 14:29:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaTj-0000000DYHc-2F1N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:29:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb606491faso37586405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 06:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703378; x=1796308178; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Go0TMbxFIn6Uh64J5GWsZj276nuCgaJAlCWObxr0QGU=;
        b=FxsvQ4fFXj1I3yD+UNHLg3w7WLck+QZ4/msjhnXEXrLcIIf1MeqHj9KVgxEdMKt8fz
         5u7yeuL3VebqQnvZ3KyL7Awvv8PFztsyum2P71KPp6YUDVqO/modFI9aznMPNaj6IxCM
         ANFQXTvTICQRWdnNtDLq/UfG4pvfQ6PcaZKER48USPZAaBtfIzJaXVUCQQPOtkjLhRCm
         NvyUb4LEGOqDsIPpTxm6WzZmZhMNwusHfs2gc2oBtD/Y+kgxLhYiSYDSD2177qt8BexO
         Sk8gqcumcUaqTpaPtnOOtDVxSwl/1VzazrBJxcBy28dKvoqT6EzUdaJFQR7UXGBXOS2M
         2DmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703378; x=1796308178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Go0TMbxFIn6Uh64J5GWsZj276nuCgaJAlCWObxr0QGU=;
        b=1MKqHwp2IDmvbWDLE8WvNbO+scCJrBivwBbt4sujqbvFJzZk2aS/HRoUMQH+bHmluG
         lSI6Uih+EXrGqks5P0iDTDuNIlGIz90EKMPZGqC/FglUylLFLn49mF48G1ZVNCnBAkLW
         A/u4u92HxtCmVHmUVdfYwycYJWfUXVKP3pIU4u00it54esgeqmnLAB437buFjWcABadY
         QAwfd0H47xtMnXe3uNCS0o7ipikfkPPsD6x6Ekuapz4xZtsoehDdjqQD4ZnCbLvI8Q+J
         vL61EVuXcSY4EDFXI8hXuLYqn82D3Wr30Gq7KGK6ej6zY8a8APKo58v4vSYe/XES1ieF
         401A==
X-Forwarded-Encrypted: i=1; AL+hErHFH9kimoTQMsWPiloRHj6SwaRw9eGWC0v578W0bJeeDUpT5zq1DFtM77KnMgdRuS1qnbMtcPRzc41xKPIssotL@lists.infradead.org
X-Gm-Message-State: APuU4Z8o85x4bo4i2s/HluEBh9gpxAUObZHN7RrhVT/CW00by4m+Unsm
	GV6HtJxb/shMpoG6XM2DMY1PDzhF8yHMliPozcoJ73fZMMJHawA1hjRAvCievMzwE94=
X-Gm-Gg: AZFdTZf7MIkuof/9ThackdA1w07RWoXafkUIKfF2GauZBr2yudExIrUFkfvpCLi8960
	gdxZFAdyyck+CniZzl6tBeBx4DApNUyPLd7vkiiGNUZD0Is0cnFXhyhrY1jxqmDewC6/ZUKBNDA
	g6M4x0m8Xrxg3idmyX4/8Ee3e/AD5121TS8ftt/yD/Sl0UpIoV1JtBl2tL5DL0rD1XCT/hbtPdU
	pgMRkz27VlxVtdoSGdLy2vNajKUKxwecRY5UmepH0aHU7pxzhQ73hfiDZuU1O3zsvw53ypxUzw7
	mSKTaumDzlXJAHILbdx97boxYB8S/y++qVQkKo9sZFmnGeB0xFqshVTtxPJw/HwVE91kRECgLOe
	Wd19funVxcgLy6wNuruoaxTE10ShATIpcgAAf730xwqnXUWlmZ7gK8QR/DLJMexPqZEPPR3Jr3S
	PX895Viwr40SbotJUO7LpV3usCD2BWT9J6InqMyp+9OhwruIl3X2asYzR7kQZ3nj0a5ijHy0qcP
	uGVtZKUQwU8Ax9Pl6yBDeNUt/zEvAL8wxqEKse/6KKvDDSwNlvyYYjWXIohf/5M/ZrTPVCoCt65
	g/VkUkLUoq0w6fHt5nPqEoCjAl+9
X-Received: by 2002:a05:600c:a085:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4bb8881e6c6mr419119205e9.21.1795703377520;
        Thu, 26 Nov 2026 06:29:37 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm365232415e9.4.2026.11.26.06.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:37 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:33:37 +0100
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
Subject: Re: [PATCH v3 03/28] dmaengine: bcm2835: Add NO_WAIT_RESP,
 DMA_WIDE_SOURCE and DMA_WIDE_DEST flag
Message-ID: <awhDQbBKe0vLWbdr@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-4-andrea.porta@suse.com>
 <awXlR5RAVl8XMVxA@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXlR5RAVl8XMVxA@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_062939_599841_07820E1F 
X-CRM114-Status: GOOD (  26.01  )
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

On 14:28 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:41PM +0100, Andrea della Porta wrote:
> > From: Phil Elwell <phil@raspberrypi.com>
> >
> > Use bit 27 of the dreq value (the second cell of the DT DMA descriptor)
> > to request that the WAIT_RESP bit is not set.
> >
> > Use (reserved) bits 24 and 25 of the dreq value
> > (the second cell of the DT DMA descriptor) to request
> > that wide source reads or wide dest writes are required
> >
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 25 +++++++++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 690f5ba1c439..118ba2f71dc8 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -145,6 +145,21 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> >  #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
> >
> > +/* A fake bit to request that the driver doesn't set the WAIT_RESP bit. */
> > +#define BCM2835_DMA_NO_WAIT_RESP BIT(27)
> > +#define WAIT_RESP(x) (((x) & BCM2835_DMA_NO_WAIT_RESP) ? \
> > +		      0 : BCM2835_DMA_WAIT_RESP)
> > +
> 
> why need recorder these information at in hardware control block if it
> is reserved by hardware?

These bits are never written to the control block: they live in the upper bits of
the DREQ cell of the DT specifier and the driver translates them into the S_WIDTH/
D_WIDTH/WAIT_RESP bits of TI. *_PER_MAP() masks the DREQ to 5 bits, so nothing leaks
into the hardware.
v4 will move the definitions to a dt-bindings header and adds a comment to make
this clear.

Regards,
Andrea

> 
> Frank
> 
> > +/* A fake bit to request that the driver requires wide reads */
> > +#define BCM2835_DMA_WIDE_SOURCE BIT(24)
> > +#define WIDE_SOURCE(x) (((x) & BCM2835_DMA_WIDE_SOURCE) ? \
> > +		      BCM2835_DMA_S_WIDTH : 0)
> > +
> > +/* A fake bit to request that the driver requires wide writes */
> > +#define BCM2835_DMA_WIDE_DEST BIT(25)
> > +#define WIDE_DEST(x) (((x) & BCM2835_DMA_WIDE_DEST) ? \
> > +		      BCM2835_DMA_D_WIDTH : 0)
> > +
> >  /* debug register bits */
> >  #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
> >  #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
> > @@ -605,8 +620,9 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
> >  {
> >  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >  	struct bcm2835_desc *d;
> > -	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
> > -	u32 extra = BCM2835_DMA_INT_EN | BCM2835_DMA_WAIT_RESP;
> > +	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
> > +		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> > +	u32 extra = BCM2835_DMA_INT_EN;
> >  	size_t max_len = bcm2835_dma_max_frame_length(c);
> >  	size_t frames;
> >
> > @@ -636,7 +652,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
> >  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >  	struct bcm2835_desc *d;
> >  	dma_addr_t src = 0, dst = 0;
> > -	u32 info = BCM2835_DMA_WAIT_RESP;
> > +	u32 info = WAIT_RESP(c->dreq) |
> > +		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> >  	u32 extra = BCM2835_DMA_INT_EN;
> >  	size_t frames;
> >
> > @@ -688,7 +705,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
> >  	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
> >  	struct bcm2835_desc *d;
> >  	dma_addr_t src, dst;
> > -	u32 info = BCM2835_DMA_WAIT_RESP;
> > +	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
> >  	u32 extra = 0;
> >  	size_t max_len = bcm2835_dma_max_frame_length(c);
> >  	size_t frames;
> > --
> > 2.51.0
> >

