Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B297606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zJ7RWlrj;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PZi2c991
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MkH4cutE4IChIOyYA5AS0pM5uFXn9KIjzHwhJQeQB1g=; b=zJ7RWlrj19pQNYlIC6GzRjkGbs
	KHrnmw6ET8WXDAa3BZFR3yfP0eGFwanzTtygWcyWliU+SVgl+mmlUMRO6+brhG7JnIOkYqZhJ1TQ0
	2x5NL0wNyDEiOgubFS4LpMql/lQisp2I/Vtsh/8lwzIVQmkbf4qUPFJrSdabjpqTMzfBeFOI77k2T
	+VYKLNuo+Q+9HA1QwYuwaL3/4KbNTvXN4rDtwsFaWFKJ5nWHfglQXW6y8nCRIsHLPWXQjbmuUz3/w
	Jv9OeTNgbuQ7ZFWTYzH0kdvDHtZSZJeXYQXThCjxofJ1CALWdZ6/+SRAHMAE41L0S3XpplNQfqXXC
	Uz7QFXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvOu-0000000GBjG-3lzT;
	Fri, 27 Nov 2026 12:50:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvOr-0000000GBhx-2GaM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:50:03 +0000
Received: from killaraus.ideasonboard.com (KD106184139166.ec-userreverse.dion.ne.jp [106.184.139.166])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6728C51;
	Fri, 27 Nov 2026 13:47:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795783640;
	bh=TayXOaD0uXmQU39zGKKH5UkKxy9hM8l1AXof85x25nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZi2c991ZtpqtpdUjVLrnQvyGk9BFNjRzjBD3W/1qXZyZ6uh5T5RP1qM/CnGlRmsI
	 bSYkuh0wWv2k4vnAOCvVRtiCRcfcUdzNjZ+boxKfRDVsJF1aMino/Z/lZj7MJ8SUVh
	 sY6rzpwzvLWrFQMHXscrw7T+lWqvBdHGpzuxTJ30=
Date: Fri, 27 Nov 2026 21:49:51 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Anthony McGivern <anthony.mcgivern@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	Konstantin Babin <konstantin.babin@arm.com>,
	Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com, dan.scally@ideasonboard.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 02/24] dt-bindings: media: Add bindings for Arm Mali-C720
Message-ID: <20261127124951.GC85756@killaraus.ideasonboard.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
 <179559671799.14607.10622707622371448283.b4-reply@b4>
 <0543d134-04d3-4e51-acd1-4fc39a0e522b@arm.com>
 <4e8ecbe0-35bd-41d0-8546-4d99832e662b@kernel.org>
 <9bb113e7-f88f-4616-b20a-74065cd755cf@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9bb113e7-f88f-4616-b20a-74065cd755cf@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_045001_728599_5B5A9B82 
X-CRM114-Status: GOOD (  23.01  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 12:32:32PM +0000, Anthony McGivern wrote:
> On 26/11/2026 15:12, Krzysztof Kozlowski wrote:
> > On 26/11/2026 15:55, Anthony McGivern wrote:
> >>>> +
> >>>> +  interrupts:
> >>>> +    minItems: 1
> >>>
> >>> Why is this flexible?
> >>
> >> The ISP has two interrupts - Main and fault. Currently the driver only
> > 
> > If only writing bindings covered exactly such example. :/
> > 
> > Hardware has two, so you need here to.
> 
> Ok, understood on the part about driver support being independent here,
> I should clarify what I meant to say. This fault interrupt is only
> required for safety applications, and as such some integrations can
> leave this interrupt physically unconnected.
> 
> That being said, it looks like in such case the device tree entry can
> use 'interrupts-extended' and set the phandle to <0> for those cases.
> So I will remove minItems here and for 'interrupt-names'.
> Apologies for the confusion on my side.

If SoC can integrate the ISP without the fault interrupt being wired to
the interrupt controller, then "minItems: 1" is correct.

> As a side note, there are some extra signals for a system timer clock
> and video output ports that should be added to these bindings also.
> I will address these in V2.
> 
> >> uses the main interrupt, though we may wish to enable the fault
> >> interrupt in the future to detect errors on HW side. I will update
> >> this in V2 to use descriptions for each interrupt.
> >>
> >>>> +    items:
> >>>> +      - description: ISP main interrupt
> >>>> +      - description: ISP fault interrupt
> >>>> +
> >>>> +  interrupt-names:
> >>>> +    minItems: 1
> > 
> > And please drop minItems here as well
> 
> Agreed
> 
> >>>> +    items:
> >>>> +      - const: isp
> >>>> +      - const: fault
> >>>> +

-- 
Regards,

Laurent Pinchart

