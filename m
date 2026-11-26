Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71299606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lmAU93xe;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GrQ4EnA5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wu1agTFEkGcx3K6CnCdIJjGrSzPmSSzxOxrr1RuQESY=; b=lmAU93xeaeIaVehK9HDaWgXegS
	oKmaislQFRi3pJeHl/T2eVQ1Uu9FGgj0byZM5ETj9vOac/ByqegIWvoJ6dRTWpQ6yLn7Py0SbHyCR
	9DHy3nriQJiSe7XJpUoKZv44yEM7wXodGZLJLONM0HRmr7pZhr253SCXjPtKFEDWiLJg7kdnTLac/
	jMP/Gi6S4DzR8fq7dbm2gvTY+ovge74gGBqqJpRk2VYdUMSiwPCfin5f6xEV/eQWx0QUOdG+dgOBY
	MwpKTv8atWjA+/jcLlsyzBxQOIox+ENQI9fhY6qyo+LuixFB+xgo0IqMBAY86P9hsqaKQL4zudZhG
	nekcAAnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWajd-0000000DbJp-45wp;
	Thu, 26 Nov 2026 14:46:05 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWajZ-0000000DbIw-3bas
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:46:04 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c5133831027so994302766b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 06:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795704360; x=1796309160; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wu1agTFEkGcx3K6CnCdIJjGrSzPmSSzxOxrr1RuQESY=;
        b=GrQ4EnA5dsiuf9K/oLbVj8YJoUo/D0HxaQNkSsQ2DNXzBPjgBmwG6lJjdCqRAa0fpT
         9/JkqS2VFjKS7DXLk0hr3hGFoifwepDums6OukbEgl0sgHBuiSkML+J5K2p91T+CSAQW
         JBzUa6uvaPdfjUXmclMRn3jyNLNQ9rTI+DmpskyBp2xf0bXCzDxNF1qqISnA220Rd8eJ
         XdrTC8Z3UzjKspDJRZ84ZEUTlHzd8c0gKqkTchDgqxydVeKi/YWRjlUkaln8yJvpssUd
         4V7PAPo0Ipey094Yocro3Y+oSUFk4wnnFtuhZvbhBcGxhUdF8bvwVQlqbZ1iF1E2cBf7
         O5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704360; x=1796309160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wu1agTFEkGcx3K6CnCdIJjGrSzPmSSzxOxrr1RuQESY=;
        b=o/a/Q5pJNm58oV62deIfo4kichXPDJcYc+Bs9Wh2qtxkdSyqT3gv0jFVU+/spCnKC7
         1t5B2H78LwaqH/s8wdY/1vIvR6r7pIfqOBsnwPexFpVbv2C3GIjODekQBIMWO5b0aSt6
         4JFk2rxKkLRRe7Fj3qucuizf15BwXZpDXRh6zMd/Go1WO+6Q4omSDKHciw8zfY4hXWl5
         VU7VVWxmVTSQg6M2cpOd9sLoVfw5Kx1Ntbx7Drj+Pd398Jzz6O7En4ZKb4zaWnLpH5bR
         UkR24AZhYeOMlFzjzdy96IIV1j/saJYc9qP+k7K/oVgRvYxt0wWW2a9ne/hz7k1mpGpG
         uyRw==
X-Forwarded-Encrypted: i=1; AL+hErFx1KJ4cAU0qURN+4nRMulUALUnQQspNZHjBgL5TjcSg4fmAPNTlGYxk/XlfWz/28iPHNLWFgTBtKPt18Ty+0ux@lists.infradead.org
X-Gm-Message-State: APuU4Z+oZxpzwwcu18nX6Zmt8gcO90MxCA3jYHe1j9iBbxwjN+ELnkGT
	IVezBti6D96AuzcckPmpWMhSVQx16iFwyEqKuttbN3sUUWgrYfwz2Zox2TY4ykKcFAU=
X-Gm-Gg: AZFdTZd3DIPHr8UIsMMd3GoFh5bxxkYZg1qlUqjIWQ0qfavTexR7M9VSgOgi7Sgow4L
	ZwT5lAgKkIkCz8qaOm9xdPBgCX9NPEQVS52JdhAmL4g3zfJCV99jYa92ixPNBv5jQkTfbOZLgkD
	A6Tcr1haW8kmjQNd6DfK0cCPU/e1c6Jd/BdFP7LfB0RmbliWNhkzvCghGM2oXvqgpXP9zanB0g7
	z+CFUiOyDe/CtEyo0ooAdoVWKTki2o81L2Y4E6U6CUTRwedc+jaEFwrQjM4l8MW5Sx5RqghCMWl
	3NINDabl2vUjbzJCO8e51uQ0HFLLFkOFCeOniJh3PKX+2WagVWT+v2By8jXCMMkL9Gx2HanMJYe
	UvZU0KOZcTJNqaMi51UC+8Y5jiOLUIHOroVePlzAvqwA9QrfEbFMgPlHCuAIygJbf5Lz53fL+oQ
	Bz69SV8PFkhff3J5kH5WzXROnwuclddnHNppG1ruIV1xYCrYcRpVXNtNkYIGJsV38PoW68QnEH5
	UQVm7nRn9Z3IoBmqe7/068pPNoO44eoZe1rwPzWtbHldMEt3hUGsNHlArcqic7aG6+CuXk6iNt1
	CYgwajV+MQFK9LDH+1+rkI/3Jm6F
X-Received: by 2002:a17:906:4fc4:b0:c51:24a3:208 with SMTP id a640c23a62f3a-c513a5da66bmr1688802166b.9.1795704359748;
        Thu, 26 Nov 2026 06:45:59 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae698ccsm760181766b.26.2026.11.26.06.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:45:59 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:49:59 +0100
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
Subject: Re: [PATCH v3 10/28] dmaengine: bcm2835: make address increment
 platform independent
Message-ID: <awhHF_MII6yCi1T9@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-11-andrea.porta@suse.com>
 <awXpsh-ZbSqbotIm@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXpsh-ZbSqbotIm@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_064603_587357_ABBABA15 
X-CRM114-Status: GOOD (  31.06  )
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

On 14:46 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:48PM +0100, Andrea della Porta wrote:
> > Actually the criteria to increment source & destination address isn't
> > based on platform specific bits. It's just the DMA transfer direction which
> > is translated into the info bits. So introduce two new helper functions
> > and get the rid of these platform specifics.
> >
> > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/dma/bcm2835-dma.c | 28 ++++++++++++++++++++++------
> >  1 file changed, 22 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> > index 77b3e2f58ac5..6180a2737e07 100644
> > --- a/drivers/dma/bcm2835-dma.c
> > +++ b/drivers/dma/bcm2835-dma.c
> > @@ -273,6 +273,24 @@ static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
> >  	return result;
> >  }
> >
> > +static inline bool need_src_incr(enum dma_transfer_direction direction)
> > +{
> > +	return direction != DMA_DEV_TO_MEM;
> > +}
> > +
> > +static inline bool need_dst_incr(enum dma_transfer_direction direction)
> > +{
> > +	switch (direction) {
> > +	case DMA_MEM_TO_MEM:
> > +	case DMA_DEV_TO_MEM:
> > +		return true;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> 
> This is not 100% correct. there are case DMA_DEV_TO_DEV, and some peripheral
> FIFO is a range of MMIO space, not fixed address.
> 

The driver only advertises DMA_MEM_TO_MEM, DMA_MEM_TO_DEV and DMA_DEV_TO_MEM
(see .directions field), and all the peripherals it serves are accessed through
a single FIFO register.
The helpers keep the behaviour of the S_INC/D_INC bits they replace. In v4 I'll
make them explicit about the supported directions and I'll document that DEV_TO_DEV
is not supported.
Supporting FIFO windows would be a separate feature, which no client needs right
now.

Thanks,
Andrea

> Frank
> 
> >  static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
> >  {
> >  	size_t i;
> > @@ -338,10 +356,8 @@ static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
> >   * @cyclic:         it is a cyclic transfer
> >   * @info:           the default info bits to apply per controlblock
> >   * @frames:         number of controlblocks to allocate
> > - * @src:            the src address to assign (if the S_INC bit is set
> > - *                  in @info, then it gets incremented)
> > - * @dst:            the dst address to assign (if the D_INC bit is set
> > - *                  in @info, then it gets incremented)
> > + * @src:            the src address to assign
> > + * @dst:            the dst address to assign
> >   * @buf_len:        the full buffer length (may also be 0)
> >   * @period_len:     the period length when to apply @finalextrainfo
> >   *                  in addition to the last transfer
> > @@ -413,9 +429,9 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
> >  			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
> >
> >  		/* update src and dst and length */
> > -		if (src && (info & BCM2835_DMA_S_INC))
> > +		if (src && need_src_incr(direction))
> >  			src += control_block->length;
> > -		if (dst && (info & BCM2835_DMA_D_INC))
> > +		if (dst && need_dst_incr(direction))
> >  			dst += control_block->length;
> >
> >  		/* Length of total transfer */
> > --
> > 2.51.0
> >

