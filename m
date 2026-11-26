Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68214606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KlIsPL6B;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=d/4I3WbP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZqMqbfj/cETQCXmO3wbil3gEmzGzk18Px5yh8y4lWVg=; b=KlIsPL6BPzZlFjy8P3N2KdSN6B
	o9ABPZblJbTi706bHgTUSyFjlL047TYSYFmB/VnUxmoKPLK/JgdZU0cOK+LNmyYBR85QH6qIGm6uD
	S5H7zCV1xQXP1yuiDVH8NF1cpIn7E7mUofrRcfg19BRVALuHalgOWL2zoQ9VaU3erMdxqog6Mh/xw
	gRp1Sco9Pa4TMo3Awuwn4DT7V4j+KPjvrO+WGyBUsm4GvMoD7loLRE4+MWBIx5f0p6U5Ab6fZROY+
	8fitvMl8vfIXsTodfJyQmq+vfldidDbzNGkpvNsSxI4wGX+CUM8+O09LKRZfEBvHh0NiSHd5sw3lE
	27NRldqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWarI-0000000Dd5E-1oTI;
	Thu, 26 Nov 2026 14:54:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaqZ-0000000DcOK-3ZQg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:53:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso71401545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 06:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795704794; x=1796309594; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZqMqbfj/cETQCXmO3wbil3gEmzGzk18Px5yh8y4lWVg=;
        b=d/4I3WbP3+hAxxr7XzkVZV+9aoZff34uLcMJAXpLkJXurwJAjam2mhSEPjZKgai9w3
         evrFq5J/jVp2fFBrH8RVOmxphKkmevrg3FvbfwXQJP98aL8eUXFd3Kr+O8HTBnEzQPeU
         jlkak63C7MtLMRN9r/nhGk/6FIev6purKB39Vsp3jX+IDrz3gouesudlIK7n8OsgXoS2
         pvyyik7mQv+UB1c6UFXLJPFvnNdvWEj2BXco4vg/aBBmtrUhYUurkNHkM8qNT4+8q7De
         BLvFRDw1MEO2GDhjcqscC5+1DO/tHOEmZ35g7F+quLSm9xOKSzbpYbLmt5XstRA03KDe
         qd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704794; x=1796309594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqMqbfj/cETQCXmO3wbil3gEmzGzk18Px5yh8y4lWVg=;
        b=nX/FHKkCjQy1Xe/w/vibI0rs9nwRA/bjYVIMum3daE0FlTQHvEEr/BAEJi5TAn8VYa
         pko2qqUO/pxRwGg8CBfDVzttLTCnrgD8gvw+8BDaM2bGGVVIPg2fKoexrqqjCaPiqyiL
         sNZr38XuoCcWZ31Ip2CoNUYPQlwGseTUPcVB9MA24fwZ7+DjFYV50NprmMK7spIyCkAc
         OwgzDFzF5ytCjxAl7/zSRFHY4vrcme3Z2IfcFU005Cz+NrNedEwvxZNvY2BT8fxwvf3m
         6ghxM/dgUXjyy4JnYX82SuzS7EDwgdSW2+q25EYhH+7n8PnWdOH88EzCjTrUlusDkl1T
         YR4w==
X-Forwarded-Encrypted: i=1; AL+hErFKDHfjTbSWIs/x9cviKvkNM5oAZbEwzsdLvH9bKsKxSYaWtDMpMIjvrNxw1+HXkyAeGnJk1V/MfM3ac5DVEb6m@lists.infradead.org
X-Gm-Message-State: APuU4Z8xZ2nQ2utXqhBuNbKfGGK/ywLW2udwZFD0zCjqyWHNB30PJ6Xg
	tC0A+1/Ypu6I80itcHOn3gl+L2IC3OrrkqkHtG1EVEMysjTASJywRuRHa9frh/bdxec=
X-Gm-Gg: AZFdTZd2CTPu8YDZtD27tAtMsPKQjhlNzFdlcn1Eg+LWFqry9Dp2Hxk2083xqy/13aW
	nteIAk/fN4pk0LzZs22GAa/23TllX+Y2Qpae/FLJhEpcfY/Qd9blcCdByY+G/k6Uz3J0xaWFQ32
	AJ4LTQ+2SaCPSMltyyEYDtmlnUbQbSuu3z4Vo4lyZEE/WtwZdNRVXOmeOJKs6cskYV2mqGE4lQe
	/KcaAC/ZJ+sUCO/3JzngYutFbWyKwAq5A4QNuhlNPn5ZMcG3qrdgP2hxPn/oXybjrCnJzhGlsOc
	tIOxbi0cIHF/RJUOj3hiZIkF3g1Gmts0qUc1FIlX1fpPjFzFbGPem+/MB5hHm3aBKUKJkJPlnc9
	C3H7qRGqCqpGZnN+Fgq436XdP03hIO4Jgcc0yX9o3TvbDcsslpyD8vKGWHtaXx4LVa/EolYY1R/
	M4qc+x4nr2disCsb3zRiDuYZVneq5SjaS+Z9ppqOeUTsZkPqHnnxDOd7Vj5mPx3MdUL03btV6xs
	0A/NAXf2gFpqzMxNDBe33YDEeEi99Rz/W6xmcIygQFNgC3z5orZU+IdmmoyuVbrsT3SUsWUU9sL
	nUvgdLF3S7QSeSidx9vIryhvr46T
X-Received: by 2002:a05:600c:a11:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4bb888120famr434903565e9.16.1795704793802;
        Thu, 26 Nov 2026 06:53:13 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm636202395e9.2.2026.11.26.06.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:53:13 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:57:13 +0100
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/28] dmaengine: bcm2835: Add support for per-channel
 flags
Message-ID: <awhIyZ2weVtCrKN6@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-3-andrea.porta@suse.com>
 <7258e7d8-c968-4876-bfb4-de89e2fb05e3@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7258e7d8-c968-4876-bfb4-de89e2fb05e3@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_065316_005393_0FB87A46 
X-CRM114-Status: GOOD (  28.39  )
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

Hi Stefan,

On 18:37 Mon 23 Nov     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 23.11.26 um 15:56 schrieb Andrea della Porta:
> > From: Phil Elwell <phil@raspberrypi.org>
> > 
> > Add the ability to interpret the high bits of the dreq specifier as
> > flags to be included in the DMA_CS register. The motivation for this
> > change is the ability to set the DISDEBUG flag for SD card transfers
> > to avoid corruption when using the VPU debugger.
> actually I'm not against this feature, but this seems to pad out this
> series. Is this really necessary for BCM2711 or 40 bit support?

The flags of patches 3-5 have in-tree users in this series: the BCM283x HDMI
audio channel uses wide source reads and no write response wait (patch 27),
and the BCM2712 HDMI audio uses bursts, wide reads and the AXI priority/panic
priority (patch 28), as done by the downstream device trees too.
If you prefer, I can move them to a follow-up series together with the HDMI
audio patches: in this case you'll have to wait for the upcoming new series
in order to have the updated audio nodes in DTBs.

Many thanks,
Andrea

> 
> Best regards
> > 
> > Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >   drivers/dma/bcm2835-dma.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index b19182c6e3df..690f5ba1c439 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -137,6 +137,10 @@ struct bcm2835_desc {
> >   #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
> >   #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
> >   #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> > +#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
> > +				      BCM2835_DMA_PANIC_PRIORITY(15) | \
> > +				      BCM2835_DMA_WAIT_FOR_WRITES | \
> > +				      BCM2835_DMA_DIS_DEBUG))
> >   #define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
> >   #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
> >   #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
> > @@ -433,7 +437,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
> >   	c->desc = to_bcm2835_dma_desc(&vd->tx);
> >   	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
> > -	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
> > +	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
> > +	       c->chan_base + BCM2835_DMA_CS);
> >   }
> >   static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> > @@ -460,7 +465,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
> >   	 * if this IRQ handler is threaded.) If the channel is finished, it
> >   	 * will remain idle despite the ACTIVE flag being set.
> >   	 */
> > -	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
> > +	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
> > +	       BCM2835_DMA_CS_FLAGS(c->dreq),
> >   	       c->chan_base + BCM2835_DMA_CS);
> >   	d = c->desc;
> 

