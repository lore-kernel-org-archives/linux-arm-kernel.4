Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E3E606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IAPrKhpC;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HdywP8t7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=auCcba+5d77RO1uYXgMttg2oy3VWOurHghWnl0cLv30=; b=IAPrKhpCPZTkDOwYFb7uM3Rtjn
	04Y0WtYMb700UBRW3eNk1GBWEWtXk/NCehfbL9kFwavJ9Q0ksTW6t9y94wYFSKF1Pfel9vRmaz2LH
	Hpa+N7bvW3Cn2+2Y4MJrsmBUH4igLvFFJWa7ib0gKX0jQg22RlVt/Z+lSw49OqKeBCBQCI3kCe/DD
	m7x495R0K89T0FxKPz0uaTGn6WAAvlsa2zG9UaSf5a/jXK92lTnfhImLA+h8FCvsQCrVLZJsLlrzP
	7uF5uhmJ0T1yVbL7h7p5K0ycjHSBCm+4+yWZOw2HtsydBP8gFKo7bQpjBIdTJ1Rt6LqDW8WZHvnTL
	eaEXV6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWacO-0000000DaWT-2LsI;
	Thu, 26 Nov 2026 14:38:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWacM-0000000DaVm-1pge
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:38:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso38337845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 06:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703912; x=1796308712; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auCcba+5d77RO1uYXgMttg2oy3VWOurHghWnl0cLv30=;
        b=HdywP8t7KNgSGM6JMscKlR1TeXQKKA/QckFr6YD3SKGgqS0a+eOPaRCG9sKjf8BaaH
         W33VhpNAS96S8yogU4j3wtYqhyVXziYiN/bCcCtFYZEgE9LPsRNrlDMHex85jk1GUqc8
         6w/bkjQOhzLtwddtpYJVzE2hwO4WC5k6uCqwAEKUrksL/pS+GyFXDrgBmyjeJrTmJF/r
         bjWTvp9k49riwNQK4Dayn2R+6eOxLOQsP3ogiuY215UXfzvwR0dspnihs3lF4LmPk2Us
         E+t1FdR4daFXHgf6obGnEPVH/HJo3IVnmtcEu+/SjOoXPSxVsgvT/lIlXRgotIN7Zo4n
         v/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703912; x=1796308712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auCcba+5d77RO1uYXgMttg2oy3VWOurHghWnl0cLv30=;
        b=rhC9Efj4xBRMlWLqHIcNsoSohnzR67f1lWKRMbwZni4YkBrxVOExJorXM47kpH0zcL
         HYK1hRX3TehqDuWkMjPgE56EmFJ7Le+HQJ2R1SeTzPbTlTyP2AGDbrynvEhwN7QryoJ2
         9q0nvMdvecLDhPUQPVMhaukiK22GOxpS0vZnwSvNJTii4q10lj0NquOWVU5SaybiZ9tM
         TIMkYnwolbKB3msod2LmCUj4qaP6IrTYVr2Z3uGroNtU5KU/EwA6VVXHbljY/+IduL0X
         XTeQb/3qt9EghjdtdvtEWIUhGDOz+hScPWJzjlQV/a9eCGbTcwjWu/omRj28j7AFKktE
         MuqQ==
X-Forwarded-Encrypted: i=1; AL+hErEzFFT62JBbSnXHTI7XRzn750fPP9cg/zlNYWHR0d9hQnMCDzJmjxWNN5R1VgHPrNrPAxFJ3M8jFRcR0Xjv9n6P@lists.infradead.org
X-Gm-Message-State: APuU4Z98DxqIF70576fCrfq2/HSt6ZrtyGo+NAvyCJ2r+u3RYQR3BRJm
	V8gssyYNFbokrZ1rAmCpnTeTn+g4HnUdHsDV/gyjnn3Mphl5DjFFh92HWRb1onF9858=
X-Gm-Gg: AZFdTZenbLDpIiGosicuRxkei560oEUt5NnaF7yTonAUFNTLlS5E2q4E211RpqMIk7X
	FibTpsPEvOWNpc1hS3iZnp/VE57BPtVReThp1qouhUC9OaamwBvXpU+0pmuDa7RzTHpHQKG5ofC
	67E0x0e3U4J8uhwHQ0tBIuyWxIuB0q4EliOIREYRojlkp6wcIk9ThskU5BR6KmunEtS9kEEMMHW
	+V/Qq3/1jzUq/Dp3r5Z0OUByXvR+ULscyLOOsoQqSiBpeJlYxsy6MqZ82U1NRLwwdGt/w2svm5I
	KfD8T2ScLtvGQhAZOcxhb+HXwMoJUEFZGsIie7PzQrN0M1EN6CMdgMyYjAAkQiF6DdRZbF/YB5W
	4JZEWH/FME7SbiaiW3sNAynSRGcM3+pdkJ0CwUPPDUFovbBP7Rnt/SG06JhL04zslGFOwi1RosK
	6DrKyT8iNVuZuAvwOPMheggYQaVw4yUP3vJACseejhuRR+qN07bh/lPx1ussDGOzO3yzW6+hA0v
	3kj44vRIJj3I9ejx7lDfxKikoiSeyrZTkMBZaVV8CUkI1ZfkPHMJAtC2MMwpLRq0RBCcIreLhrk
	PkS35qe/qkljyJ3HECFrjeMrtuSmkA==
X-Received: by 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr437965725e9.25.1795703912479;
        Thu, 26 Nov 2026 06:38:32 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm615439805e9.5.2026.11.26.06.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:38:32 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:42:32 +0100
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
Subject: Re: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document
 dma-channel-mask and DREQ flags
Message-ID: <awhFWBteSWqZ5keD@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-7-andrea.porta@suse.com>
 <awXnR8jz-Nd4QLJ_@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXnR8jz-Nd4QLJ_@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_063834_527930_F7616D49 
X-CRM114-Status: GOOD (  26.66  )
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

On 14:36 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:44PM +0100, Andrea della Porta wrote:
> > The available channels are currently described by the vendor specific
> > brcm,dma-channel-mask property, while the generic dma-channel-mask
> > property from dma-common.yaml carries exactly the same information.
> > Allow the generic property and mark the vendor one as deprecated,
> > requiring at least one of them, so that device trees can provide both
> > for compatibility with older kernels.
> >
> > The single specifier cell is also not limited to the DREQ number: the
> > driver interprets some of the upper bits as per-channel flags (AXI
> > priorities, wide accesses, burst and write-response handling). Document
> > the meaning of those bits.
> >
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > index c9b9a5490826..f619e395cf0d 100644
> > --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > @@ -37,15 +37,30 @@ properties:
> >      maxItems: 16
> >
> >    '#dma-cells':
> > -    description: The single cell represents the DREQ number.
> > +    description: |
> > +      The single cell contains the DREQ number in bits 0-4, optionally
> > +      combined with the following per-channel flags:
> > +        bits 16-19: AXI priority
> > +        bits 20-23: AXI panic priority
> > +        bit 24: use wide (128-bit) source reads
> > +        bit 25: use wide (128-bit) destination writes
> > +        bit 27: do not wait for AXI write responses
> > +        bit 28: wait for outstanding writes before signalling completion
> > +        bit 29: do not pause the channel when the debug signal is asserted
> > +        bit 30: use multi-beat bursts
> 
> Add header file for such defination.

Ack, in v4, the header will be include/dt-bindings/dma/brcm,bcm2835-dma.h, used
by both the driver and the device trees.

Thanks,
Andrea

> 
> Frank
> 
> >      const: 1
> >
> > +  dma-channel-mask:
> > +    maxItems: 1
> > +
> >    brcm,dma-channel-mask:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > +    deprecated: true
> >      description:
> >        Bitmask of available DMA channels in ascending order that are
> >        not reserved by firmware and are available to the
> >        kernel. i.e. first channel corresponds to LSB.
> > +      Use the generic dma-channel-mask property instead.
> >
> >  unevaluatedProperties: false
> >
> > @@ -54,7 +69,12 @@ required:
> >    - reg
> >    - interrupts
> >    - "#dma-cells"
> > -  - brcm,dma-channel-mask
> > +
> > +anyOf:
> > +  - required:
> > +      - dma-channel-mask
> > +  - required:
> > +      - brcm,dma-channel-mask
> >
> >  examples:
> >    - |
> > @@ -96,7 +116,7 @@ examples:
> >                          "dma14",
> >                          "dma-shared-all";
> >          #dma-cells = <1>;
> > -        brcm,dma-channel-mask = <0x7f35>;
> > +        dma-channel-mask = <0x7f35>;
> >      };
> >
> >  ...
> > --
> > 2.51.0
> >

