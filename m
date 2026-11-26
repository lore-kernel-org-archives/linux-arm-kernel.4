Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E378606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vIYXyyJR;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cF/BTaEN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OHrC46cIWChCBmJPkyR2Sr/R2tdqnLfv5l1cfknsL0s=; b=vIYXyyJRJqIn7YgPpU+FzOX6MH
	MrrmjkSXIS6U008mhqztVim17Jdfd9IxfYoHAqm6rhdFZXXwTGGNH/nVfScAQbu2UBLKMvjt2iVEw
	JLtnSoijujJ6Rdvr9d3LVwSi8oCMdP3AQfEQeN7CJK2yvO3mm2Th8aP3ZH4kj2QEAoxeUeMTuqnnm
	SMd9EJbYIOY1Eraw2+dWoC6ZkQaFWKbAPHlYBPno9AfOmwbLMmkOjTGV96AMlWJaz8gbCXnAESlQJ
	3w+cf39VQu51qFfTcW1hiICTFiQYLo9RsXKjUgkuQkAzN9+t7GM1AAO2ENv+QnNb6vRRmkf8ADqGY
	tCdfDuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaOw-0000000DXWa-3BD6;
	Thu, 26 Nov 2026 14:24:43 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaOt-0000000DXVo-2HxJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:24:40 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a32576da88so4079086f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 06:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703078; x=1796307878; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHrC46cIWChCBmJPkyR2Sr/R2tdqnLfv5l1cfknsL0s=;
        b=cF/BTaEN09f3PyZpFvWW8TNgrsmTuYIa/uWGD8ID2+gmEXYVtFabcvFfdQTUerMX/L
         Fpa/2UJIHYvbQhOXdVjr+X6tpnpU2c5Kh58E6ylbZdXd2yPb83VqQKf7Nj+cEleK3Sxx
         tTXZ4oLQyVc1qV+gN7DG47yt2S1GOj/syg2Cj5CAYfT3WWPF3VuLIMtyca3rqu41Z7Jz
         zITvpESpv9OmwI8t7tIp6AXy+uhwl7VwvQLcjGVQFVmqeSF2j1eVHIxbiVCP36xZ9Lrh
         uKGlEo01k/NHXONkpuDd3/2j5kbdR93H9dwDUyw/ZzP2i2adPN0Ghq74MeiuTh0lrtkf
         4+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703078; x=1796307878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHrC46cIWChCBmJPkyR2Sr/R2tdqnLfv5l1cfknsL0s=;
        b=E6DP1PFbKtNLOjx+gtRQkLqhqulAyulpjYnDEjSXg90BVjg7k3uCu7lUp9sPoOLJb8
         XJLbabZ+PJ9+nGSiUMjYLfjYmJJp8OFE/c8pYhGkiE/cFDWkL1CAYSloayID30YGxGCG
         zc+RuvbLlXrbY/N2DHM2eum2eyZp121P2S7oyNSGetG13L5WZIrAmSsHFxSS4Q8uWuOJ
         fvB+LLYD2jrRKnEeoZPZ+rHG1kj/pLpb/jXKr1ELBtF6oVMUNl74gCFL+Vqh2uBGVqze
         Vni5m7wMm/AGRr0xwXp5oboy7pZ0p9AmIpTL/eq56aqIiLKbIG2nlgcCg8fdaS85OEoS
         l94g==
X-Forwarded-Encrypted: i=1; AL+hErFP1gmmkJ4w71Fjfwv+5DWdrp5mn/aDcPMYB4XLEDgWR71//DQSrJmywj7ZFyEG4CAWtyoHHL8YOsbsN36QAfhm@lists.infradead.org
X-Gm-Message-State: APuU4Z+z5qIBh2Bnb9LfRiui70ikyybb54n2bu+PourslotXKmFcNyGO
	1qEl5Fkuy6UMHmT16salkNVWQa0DGChJDmgZljohbrPLX7dWA2S9itqQ6C/ov4E1OVM=
X-Gm-Gg: AZFdTZfN8lb9fZVjIv2h0+dSclA6Yopv/RGP5MFg1HmZOKLIPMCo+1PkqgmpmjQn9rB
	iDGkr2PI5Q14oQpXDcWMZHUmDtNimeMGaou8xzrbKHtNbJh92zh2Ran8NgCSnUV3uHZ3O6/rFa2
	V9k47rmI5/nHQdooXuDVf6ZFSwiC5Fw9Chh2NTYDNPbeZJDMIGGCmylxQQMIkqV3HJrt9zZh9Ks
	Kvr+8f/7sNKR45+EGkTcGw4M5fPuqrcPL5S14XGUhNVtU4Sk+C2DJ0XvAAoa6Th0Nkae4sLaCPl
	MjxUf7i8N85skfnDt24PFimhJVZzgb3H9tMXFHogGafCM4ut2pdpTEFUMx4DrC6D1GX95qChJ6H
	Y7bE4QAjGpfOgoCu/n68UTfZQ+Ao2nL1kmGB9xSd7tgwoj1KaJ4S/6etwrMX/N6wZcVudKOpxpG
	TsZvKcP2JB4kP79vWSFGETyLFqREPmfk5IsefHz3WKXd4RobmWO6bmZfmm9CBo7xtJRf1m7KYKY
	PhATJH/M3Rc7GsdnRSLuSGgN+vE/AjiyKmuYj2srsYP8ps9p1C6Y+VAHBTlb5OsfQ1syoeaWQ5S
	yw2jkTHQ5noWW6v2UtMUAzv0vLnsrXFyKvdjm9c4e5NSqsdH0w==
X-Received: by 2002:a05:6000:4008:b0:4b6:8c1:bc3d with SMTP id ffacd0b85a97d-4b608c1bc69mr17794667f8f.57.1795703077525;
        Thu, 26 Nov 2026 06:24:37 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm41189410f8f.41.2026.11.26.06.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:24:37 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:28:36 +0100
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
Subject: Re: [PATCH v3 02/28] dmaengine: bcm2835: Add support for per-channel
 flags
Message-ID: <awhCFGZ8f6f4h5Ku@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-3-andrea.porta@suse.com>
 <awXjgCtgR5wtadnb@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXjgCtgR5wtadnb@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_062439_614371_32ED8AEF 
X-CRM114-Status: GOOD (  28.72  )
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

On 14:20 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:40PM +0100, Andrea della Porta wrote:
> > From: Phil Elwell <phil@raspberrypi.org>
> >
> > Add the ability to interpret the high bits of the dreq specifier as
> > flags to be included in the DMA_CS register. The motivation for this
> > change is the ability to set the DISDEBUG flag for SD card transfers
> > to avoid corruption when using the VPU debugger.
> >
> > Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index b19182c6e3df..690f5ba1c439 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -137,6 +137,10 @@ struct bcm2835_desc {
> >  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> >  #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
> > +				      BCM2835_DMA_PANIC_PRIORITY(15) | \
> > +				      BCM2835_DMA_WAIT_FOR_WRITES | \
> 
> Your commit message said "ability to set the DISDEBUG flag", why need
> other flags here?
>

Right, the commit message was incomplete. Besides DISDEBUG, the flags carry
the AXI priority and panic priority, used by the BCM2712 HDMI audio channels
in patch 28 to keep the FIFO fed, and the wait for outstanding writes.
They have the same layout as the CS register fields, so they only need masking.
I've reworded the commit message in v4.

Thanks,
Andrea
 
> Frank
> 
> > +				      BCM2835_DMA_DIS_DEBUG))
> >  #define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
> >  #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> >  #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
> > @@ -433,7 +437,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
> >  	c->desc = to_bcm2835_dma_desc(&vd->tx);
> >
> >  	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
> > -	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
> > +	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
> > +	       c->chan_base + BCM2835_DMA_CS);
> >  }
> >
> >  static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> > @@ -460,7 +465,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> >  	 * if this IRQ handler is threaded.) If the channel is finished, it
> >  	 * will remain idle despite the ACTIVE flag being set.
> >  	 */
> > -	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
> > +	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
> > +	       BCM2835_DMA_CS_FLAGS(c->dreq),
> >  	       c->chan_base + BCM2835_DMA_CS);
> >
> >  	d = c->desc;
> > --
> > 2.51.0
> >

