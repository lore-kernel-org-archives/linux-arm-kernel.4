Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D18D606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a2riMxLD;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TggokG2O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=51kGECU7mnaWff1zdYP1hH1erxWAFEkfyrjZFzcM8y8=; b=a2riMxLDhpDR/1kmjHbH6Tabvk
	r106p6oBEMR2V8WjEPwIlhSwTH8WDHDFNsFTxWEUgWmPXGI4FMVbVy8aRPMq0a5Hz1uouBkjSSU3X
	FsFmMoNoThFn0Bue6NrHEWVwo6r2A4ksV2kYhkyNmIuY7QIYjxSAFXvp4vIzdPSlnf3D6nYldXX2H
	g3tocOjbWqde+muFP8/y3F9UTQgW2/czviGCABEh7ls2XJz1+izWcVVup3E+NaiokzQp1wyBESObg
	gJhMx0+qfFA7FqGqoxGGQtvPWMUAIkXf2c5hOLacSuqdWUWoTMIDhym8e9SVJY4kFLqNuGNYBqeRW
	zMIBD9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX15X-0000000HUOz-2T5G;
	Fri, 27 Nov 2026 18:54:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX15S-0000000HUNz-2bMj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:54:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so5972979f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 10:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795805660; x=1796410460; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=51kGECU7mnaWff1zdYP1hH1erxWAFEkfyrjZFzcM8y8=;
        b=TggokG2Os+2R5AAU2yCgmbvSC1dPXtMb6WCJmwopFqkbnA8lBW12nK4kIeBdaw/lZN
         /mshmRe90qDkSsyfFA7JyoayFN0kAi1Fj5x+8F1XExXuJwXNjyruCqvjBOikasuBjrVG
         QxNTzeT5UYOS1khXQ3//5nh3BA7jVc7va5PO/dsGIIo0m41mpVcBi5BSNvJlrm2P0RJX
         JZ3hQzfynfw/lAdevqycilEAk8totRRlaK00TZXQeTzgaa30EM+kWYwVtQsf1FLR5Sh4
         mlqGrJf/Gc/IKUs5TflweZw0U0A5kv4h1u6qo4+daYcqCHy+pXsRTqsMEfueQHenOFvZ
         4qMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805660; x=1796410460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51kGECU7mnaWff1zdYP1hH1erxWAFEkfyrjZFzcM8y8=;
        b=mjpxJIsg09vv4cuV0lz0ArWzr2os5NN133OSBhA2US7+N/mMwKTiXl0yx0h24jLvcF
         zWg4kUSxlb8iJYsoz9RJ+Lz50Mzmv5Mw7x6dDNS23COxn6YO88P/8c0NuQ6zoDC6Rp6O
         J8z8LPb8wCBzvRRP3JiJ1QLASmXcUaZerMfgHR9laMCICXZbeug3zmO4pZbPE4TWDoXD
         RWoh1dLf+ejffTcmQ9yla8gM1dSHiCt/90LbBVZDxCOq760QQDs2ecsVaQtrrE5M2mlc
         irJJTH1ED2rWItRtMEKSP0N1Xm4yDY0ddtqinDJPQOFsziEqK+6PEMh3Omp9SrwlTygc
         gIyQ==
X-Forwarded-Encrypted: i=1; AL+hErHjFkHIOFvCZNScLN24oGlQ8UlalcNUQoUNKj1uWoaYwwWeK2MSAz0Dw/mHIstUEfacA5CKb9/E48o6pXlUgUUf@lists.infradead.org
X-Gm-Message-State: APuU4Z/7T2nXEZcetOKaFqQlXcEyr8X2wqVV9MKBMsB/bTIVjDAU81tc
	rfJaMSTKLoSHXQTex4Te3buWSXSnnqEoNpx1EoYj36YkpTmLWYG/uaNyjdVI3l7YXwM=
X-Gm-Gg: AZFdTZdiYTQL53DHM+7WIM8itQipKxcmDEG8No23bXP7F1XqTNYbXjws2pXkfouRFad
	5FW462xPAZz5FbVDfbDeoSX45YYMN3LmHtmP5nb3OjHkVDQ8nE04aURhmcQZDJ8drZsSCbcI1To
	LQizXrimbjtVTGFhdwu0cVjpNRSGuobep9dqdL2koSfekGvdUmaETDCIIo1V+u9k5r96GtwhQRx
	+lbgo7wqWdfEei5f8kHnubiQLo3+fJJxvWNn7WcxnIOAfXmifzZI8kpV0OORfJzA0DJ93Dlymqn
	5fxmCsgUb3s8ZL+QwuMJG+TwZx/tsxUV5DuavK4hOnsT59nQla0boOBUTfl61Ry9yZWsFqEuRtx
	qb+Cnx/MZiyv9Zrngq8tbgtXUZiLdMgnMcdJZCkXC1GtY5VRVt5vM+ATQIwQZmLObDvpSvjvyv4
	nFuJ/ziRO9mUbiwTm9XOQrUKC68M28RxBhqo/JuGKAr3UPGUANOg5Jqag7aSZkX2NI5DRKW+plv
	KKuFKW5qCtHR6ddMeir9otfh1dLGw83Kcr3GMcIDcTXEJoHpYFm8pYbRl9RlguZOZAmhDGzRWKQ
	VXeitoDFkstqmd03KshZ/jfRlO+L
X-Received: by 2002:a05:600c:3484:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb88812f16mr523283925e9.24.1795805659913;
        Fri, 27 Nov 2026 10:54:19 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bbab390cf5sm234366765e9.7.2026.11.27.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:54:19 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 27 Nov 2026 19:58:19 +0100
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
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
Subject: Re: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document
 dma-channel-mask and DREQ flags
Message-ID: <awnSy5BOabcnj73I@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-7-andrea.porta@suse.com>
 <e2d27b2e-db69-4fac-b7f3-28961a9e094c@gmx.net>
 <awhL0itLEAIsK4HR@apocalypse>
 <ba983cd0-68d7-4184-ab75-d79f2666520c@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba983cd0-68d7-4184-ab75-d79f2666520c@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_105422_712401_428AC53A 
X-CRM114-Status: GOOD (  32.12  )
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

On 19:23 Fri 27 Nov     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 26.11.26 um 16:10 schrieb Andrea della Porta:
> > Hi Stefan,
> > 
> > On 18:49 Mon 23 Nov     , Stefan Wahren wrote:
> > > Hi Andrea,
> > > 
> > > Am 23.11.26 um 15:56 schrieb Andrea della Porta:
> > > > The available channels are currently described by the vendor specific
> > > > brcm,dma-channel-mask property, while the generic dma-channel-mask
> > > > property from dma-common.yaml carries exactly the same information.
> > > > Allow the generic property and mark the vendor one as deprecated,
> > > > requiring at least one of them, so that device trees can provide both
> > > > for compatibility with older kernels.
> > > > 
> > > > The single specifier cell is also not limited to the DREQ number: the
> > > > driver interprets some of the upper bits as per-channel flags (AXI
> > > > priorities, wide accesses, burst and write-response handling). Document
> > > > the meaning of those bits.
> > > > 
> > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > this patch should before the bcm2835-dma patches which modify the dma-cell
> > > behavior.
> > Ack.
> > 
> > > > ---
> > > >    .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
> > > >    1 file changed, 23 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > > > index c9b9a5490826..f619e395cf0d 100644
> > > > --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > > > +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > > > @@ -37,15 +37,30 @@ properties:
> > > >        maxItems: 16
> > > >      '#dma-cells':
> > > > -    description: The single cell represents the DREQ number.
> > > > +    description: |
> > > > +      The single cell contains the DREQ number in bits 0-4, optionally
> > > > +      combined with the following per-channel flags:
> > > > +        bits 16-19: AXI priority
> > > > +        bits 20-23: AXI panic priority
> > > > +        bit 24: use wide (128-bit) source reads
> > > > +        bit 25: use wide (128-bit) destination writes
> > > > +        bit 27: do not wait for AXI write responses
> > > > +        bit 28: wait for outstanding writes before signalling completion
> > > > +        bit 29: do not pause the channel when the debug signal is asserted
> > > > +        bit 30: use multi-beat bursts
> > > No strong opinion, but mixing DREQ number with per-channel flags is ugly
> > I agree it isn't pretty, but it is the encoding the downstream DTBs have been
> > using for years. Switching to #dma-cells = <2> (or introducing new exotic properties)
> > would mean supporting both formats in the driver: I'm trying to play nice here in
> > order to not break compatibility with downstream DTBs, which I think should be wise.
> > The header I'll add in v4 with the definitions for these flags at least makes the
> > device trees readable.
> as I said I don't have strong opinion about this.
> 
> Imho adding these configuration bits to the DREQ number was a downstream
> hack. Furthermore providing some kind of compatibility with downstream was
> never intended and cannot be guaranteed.

Fine then, let's move those flags to teh second dma cell.

Thanks,
Andrea

> 
> Best regards
> > 
> > > >        const: 1
> > > > +  dma-channel-mask:
> > > > +    maxItems: 1
> > > > +
> > > I think, the dma-channel-mask stuff should be a separate change.
> > Ack.
> > 
> > Regards,
> > Andrea
> > 
> > > Best regards
> > > >      brcm,dma-channel-mask:
> > > >        $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    deprecated: true
> > > >        description:
> > > >          Bitmask of available DMA channels in ascending order that are
> > > >          not reserved by firmware and are available to the
> > > >          kernel. i.e. first channel corresponds to LSB.
> > > > +      Use the generic dma-channel-mask property instead.
> > > >    unevaluatedProperties: false
> > > > @@ -54,7 +69,12 @@ required:
> > > >      - reg
> > > >      - interrupts
> > > >      - "#dma-cells"
> > > > -  - brcm,dma-channel-mask
> > > > +
> > > > +anyOf:
> > > > +  - required:
> > > > +      - dma-channel-mask
> > > > +  - required:
> > > > +      - brcm,dma-channel-mask
> > > >    examples:
> > > >      - |
> > > > @@ -96,7 +116,7 @@ examples:
> > > >                            "dma14",
> > > >                            "dma-shared-all";
> > > >            #dma-cells = <1>;
> > > > -        brcm,dma-channel-mask = <0x7f35>;
> > > > +        dma-channel-mask = <0x7f35>;
> > > >        };
> > > >    ...
> 

