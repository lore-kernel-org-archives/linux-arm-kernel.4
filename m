Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C848606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RgJzpE12;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YjmZNCUr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ArVfh1wsf+Kth2ceemwq0MhxiQP2TwBL9XnUiqzbYq0=; b=RgJzpE12nq6c1nhL22ipBCOXm7
	gzMuQzNBRKpmCUSWQrRLN3d1lajVef5ezntMo05BloB6vxK+WmCwL2fKPUcs7WoD368UagFoWKfB6
	7Xyd+VwmIfcWuwUMSRSQT9lKD744MTipIVP5mHVjhr323XfKk+joh3LZGN5VteS1nh6wrpKzeLhzC
	we5H3KV3dy4Gs7YrN1p9uNV4e2sGpASNgDf1/o22Yid1DO90Itgahu6LVKDEVNwRLyINVtoZVopgM
	BqVnaiBzX/MD6FTsj9xQzTsI3Ta7Tf6xML6gIXDNznAHXVqVpOXGpvpfEYdS5jj5zQMiZI5nfZDUZ
	3HHbn5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb3H-0000000DfQI-2URI;
	Thu, 26 Nov 2026 15:06:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb37-0000000DfMo-0Bjm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:06:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so70788615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 07:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795705571; x=1796310371; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ArVfh1wsf+Kth2ceemwq0MhxiQP2TwBL9XnUiqzbYq0=;
        b=YjmZNCUr673reFe8Rv5RkHbWRMU3fqFNtGF9T3DfgLTozviYUOtEvpimYrxC1bc5KJ
         ryklx9Eor3RQjfhLOGuQVHtRbHhdTaaQ4nyDNVzZoNAFWfRqbO/xgUQaj9Pv4bFXOZS+
         JBwC52N56GVIBE0INrkEeGfBXAYxM+GfrRV+DkJJtdCd/XgejXq01JigeIFVe83wChoe
         ZCZDc7QJ7HBLCExnrIy/cYpzGz7dh00Jm7XHXM3M2fp8Le0zzQMNP5MPSTLnHGi8YsKM
         eCH1L5l+L7Q4ptjnGVnVGgNiYqxjzA7/vVXPN5C9KASo048Qog6QSiyf0pgk1B3/2ga4
         xBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705571; x=1796310371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArVfh1wsf+Kth2ceemwq0MhxiQP2TwBL9XnUiqzbYq0=;
        b=lMKqwPiD8+u8kV+4bcXb4chqULYthXKs9uF7L75b+MFA8otNmjfv1/MBqllwlo8jeN
         PJdq6V5tNCoVXJi83mJlLBr8QJ+0hONW9lNIMUAJAW78P3V0jFPNJGKjIbkUDIpWMqQe
         WyFT341tSQwbkVHp4gD84sNjGALvNrFMNeR2k//SId8KFj4dDoc+IQ6+BVdAkSJOCEYL
         +tAgpPJGuR3wdmoi+yhnZH/9z2CIr8pI1jdsuma6hYOgslmuSHIe/mafFOrMWBTKonUj
         BtJVxQkozPqZHsU3dnbOtfbGqeC9KL+eAj7ZVLbqA2uXa7QxOqTJ6/TOGkx/FmyB1IhQ
         HPEQ==
X-Forwarded-Encrypted: i=1; AL+hErH21AX6r+O2CzVTgcauUgrySs8FE3be9DBLueUknYXtQEVdPqYaPFU7fgbuu2MnaAweq6VHhop6hz/0UxJazMI9@lists.infradead.org
X-Gm-Message-State: APuU4Z/sN7Jc4a+WxWQx+tzK57+iSmXX7HEJJBcr+TvzhkBFc0Qanpuq
	E5nMEePiHYc59rTsyRMboylO5SFQbNiVO3V/UqlEjgbGhlOljz+vNTARxYFnE39LaC8=
X-Gm-Gg: AZFdTZfoGwP/CzjmvJ9sjYTCXzzjxBW2mGQ+Ed98EgbUHeG/sTGpVG8byGckUW3eRgY
	N+/MZGa6crczlLu//RHipROaEtCmSlgcMNLx2V0UucsZenWUNWpyzeY2mW9EiEhs5wHZ+BNtxl7
	WlwVQMdiGZFwcLarDbWO+b7L5Yj1bccLjYb1zd2MRsizBJPxVdnx94jTQHPPidAWxweWJq/Z7i5
	C37LDohwTYPUONPMbqgI1rEbg6SfbuPnQtnuYLmxU59AQ+ImlmBFzAxigzbYKSwW19qfMJBhWZ4
	4pi5ca/UTvODrMQxVQSmRzBXy8iDvaVPcnTLY7DZLlJyLw14uGyJSOGHwcpbmONbJNN1bJ/KG39
	rPzsZTDG0AYcgoWCdZJx5Y5z/ajzVCbbTtPhY56rafljR196ZJRu16d7VwoCX69pzcTOnevG7Xn
	e9qCxQ3oAyygUE2xfkuTa1RSK9S/wxZXKf1JjAt+ZAeyenKrGmxMzVVZnKql+o8nbJ4z28ga4+z
	2N9F6nzqHGvon4XSPaFy0RiHUUknVcyA5bvViFs6bOLvHw4umasOwkdTNjR4Z8xpKJEo/bLz2Jn
	rcXOEpbFEQcg6sgxzY4sL2O+I3tV
X-Received: by 2002:a05:600c:8287:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb887e064dmr436496855e9.1.1795705571098;
        Thu, 26 Nov 2026 07:06:11 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm415663915e9.4.2026.11.26.07.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:06:10 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 16:10:10 +0100
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
Message-ID: <awhL0itLEAIsK4HR@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-7-andrea.porta@suse.com>
 <e2d27b2e-db69-4fac-b7f3-28961a9e094c@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2d27b2e-db69-4fac-b7f3-28961a9e094c@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070614_104098_234ECBC9 
X-CRM114-Status: GOOD (  27.93  )
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

On 18:49 Mon 23 Nov     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 23.11.26 um 15:56 schrieb Andrea della Porta:
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
> this patch should before the bcm2835-dma patches which modify the dma-cell
> behavior.

Ack.

> > ---
> >   .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
> >   1 file changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > index c9b9a5490826..f619e395cf0d 100644
> > --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > @@ -37,15 +37,30 @@ properties:
> >       maxItems: 16
> >     '#dma-cells':
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
> No strong opinion, but mixing DREQ number with per-channel flags is ugly

I agree it isn't pretty, but it is the encoding the downstream DTBs have been
using for years. Switching to #dma-cells = <2> (or introducing new exotic properties)
would mean supporting both formats in the driver: I'm trying to play nice here in
order to not break compatibility with downstream DTBs, which I think should be wise.
The header I'll add in v4 with the definitions for these flags at least makes the
device trees readable.

> >       const: 1
> > +  dma-channel-mask:
> > +    maxItems: 1
> > +
> I think, the dma-channel-mask stuff should be a separate change.

Ack.

Regards,
Andrea

> 
> Best regards
> >     brcm,dma-channel-mask:
> >       $ref: /schemas/types.yaml#/definitions/uint32
> > +    deprecated: true
> >       description:
> >         Bitmask of available DMA channels in ascending order that are
> >         not reserved by firmware and are available to the
> >         kernel. i.e. first channel corresponds to LSB.
> > +      Use the generic dma-channel-mask property instead.
> >   unevaluatedProperties: false
> > @@ -54,7 +69,12 @@ required:
> >     - reg
> >     - interrupts
> >     - "#dma-cells"
> > -  - brcm,dma-channel-mask
> > +
> > +anyOf:
> > +  - required:
> > +      - dma-channel-mask
> > +  - required:
> > +      - brcm,dma-channel-mask
> >   examples:
> >     - |
> > @@ -96,7 +116,7 @@ examples:
> >                           "dma14",
> >                           "dma-shared-all";
> >           #dma-cells = <1>;
> > -        brcm,dma-channel-mask = <0x7f35>;
> > +        dma-channel-mask = <0x7f35>;
> >       };
> >   ...
> 

