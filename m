Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2458860A2607
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FxLIEpNF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=YqQKkM6g;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ueg12IHl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t0LqT5w+izgEbYxz6PH+/Po+iDL6T8IFcLOSgldKdU0=; b=FxLIEpNFIeQI4U
	DnzSgmGsCLq1a00l+CkuZwyT9l/c6NlNSCJPudvcHuEFQLc0pJvS45+z8vD3Qxb1Llm5ECtvDz3lc
	+gj3PmA6jJuTgtDp51xIsEcS0io/XOMSd11sdAY2cA80IpyV8zw+nmFXh93x/rNK3DjTretTZDNsB
	PcFPETEyRd0ishx2hq/nmImkYlpcsU4b8GCQ5XVeGTInR7XHPxu3gcav59P3ieFXy3f1Y6h3k7B2D
	D+PS3w+UgbEDWWp8p/ihtld3qkDYubNLD1SUWCRIu95PdcNBlAnCmrO1tBBbYeeDSDdV+s5euEjJb
	a6LhkLQAPW6a3vZyujjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwuT-0000000GRxb-2cQT;
	Fri, 27 Nov 2026 14:26:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwtU-0000000GQ7r-24Hx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=t0LqT5w+izgEbYxz6PH+/Po+iDL6T8IFcLOSgldKdU0=; b=YqQKkM6g6yUBgYZxJAj5qHP9qv
	Tm1pi6VHR0Y9BuFcjkSz4hp33WtBHfBR6V8ZzrJJLgBVIvaKOo6T9wlNnMiNB5V/UXsvbw7lfiDD5
	+p2Xj4oJiOwspJPYHt0hGtOl4+4Ws7AXKZBpFCGJXlimSq/E2gd+KioJ1shqKz5X6u4O91kiqdCMl
	st+md3GPgo7gEbIt2WYNmeUBATxjT79n3AC5OQ9O7b83mOCo9Z7p2VQdlBNqAb/M0i8dr9elFkmik
	ICo8WQvaCDXhBxel60dX4SkQflIj2zN3TO/t3H0bI3XTqKT5DFLv34LdJLY80UHRNDtWx1wQAJS32
	V7ID00CA==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwtO-0000000FYkd-2D7X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:25:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3B1A169E;
	Fri, 27 Nov 2026 06:25:32 -0800 (PST)
Received: from [10.57.32.178] (unknown [10.57.32.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26CA53F86C;
	Fri, 27 Nov 2026 06:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795789535; bh=O8jYR5KANQCIvSrIeG5OfriFdRVmVqQWfvrqkrYXvuo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ueg12IHlHHEZDlpOEoQvXC8ub3PsNq27pV+dWH2iERx1Q/qPVP7uMjlCI1vkzX+yC
	 zoOtmpZ3zDbfQzXoh8lRMp+U244/KhLZMghOR7hOcjSSI0vrWM56/11SlNh4R2wufl
	 fsapQtPd6gtq13Ncc2KWl8TU4QYP0DzGJewEsj4g=
Message-ID: <6f52dbad-f3c6-4f62-862a-bed34c2d5922@arm.com>
Date: Fri, 27 Nov 2026 14:25:31 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] dt-bindings: media: Add bindings for Arm Mali-C720
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <nayden.kanchev@arm.com>,
 Konstantin Babin <konstantin.babin@arm.com>,
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com,
 kieran.bingham@ideasonboard.com, dan.scally@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
 <179559671799.14607.10622707622371448283.b4-reply@b4>
 <0543d134-04d3-4e51-acd1-4fc39a0e522b@arm.com>
 <4e8ecbe0-35bd-41d0-8546-4d99832e662b@kernel.org>
 <9bb113e7-f88f-4616-b20a-74065cd755cf@arm.com>
 <20261127124951.GC85756@killaraus.ideasonboard.com>
Content-Language: en-GB
From: Anthony McGivern <anthony.mcgivern@arm.com>
In-Reply-To: <20261127124951.GC85756@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142538_910749_3A63B1FF 
X-CRM114-Status: GOOD (  16.64  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Laurent,

On 27/11/2026 12:49, Laurent Pinchart wrote:
> On Fri, Nov 27, 2026 at 12:32:32PM +0000, Anthony McGivern wrote:
>> On 26/11/2026 15:12, Krzysztof Kozlowski wrote:
>>> On 26/11/2026 15:55, Anthony McGivern wrote:
>>>>>> +
>>>>>> +  interrupts:
>>>>>> +    minItems: 1
>>>>>
>>>>> Why is this flexible?
>>>>
>>>> The ISP has two interrupts - Main and fault. Currently the driver only
>>>
>>> If only writing bindings covered exactly such example. :/
>>>
>>> Hardware has two, so you need here to.
>>
>> Ok, understood on the part about driver support being independent here,
>> I should clarify what I meant to say. This fault interrupt is only
>> required for safety applications, and as such some integrations can
>> leave this interrupt physically unconnected.
>>
>> That being said, it looks like in such case the device tree entry can
>> use 'interrupts-extended' and set the phandle to <0> for those cases.
>> So I will remove minItems here and for 'interrupt-names'.
>> Apologies for the confusion on my side.
> 
> If SoC can integrate the ISP without the fault interrupt being wired to
> the interrupt controller, then "minItems: 1" is correct.
> 

Makes sense, I will leave it as-is but add a small description so this
is clearer.

>> As a side note, there are some extra signals for a system timer clock
>> and video output ports that should be added to these bindings also.
>> I will address these in V2.
>>
>>>> uses the main interrupt, though we may wish to enable the fault
>>>> interrupt in the future to detect errors on HW side. I will update
>>>> this in V2 to use descriptions for each interrupt.
>>>>
>>>>>> +    items:
>>>>>> +      - description: ISP main interrupt
>>>>>> +      - description: ISP fault interrupt
>>>>>> +
>>>>>> +  interrupt-names:
>>>>>> +    minItems: 1
>>>
>>> And please drop minItems here as well
>>
>> Agreed
>>
>>>>>> +    items:
>>>>>> +      - const: isp
>>>>>> +      - const: fault
>>>>>> +
> 

Thanks,
Anthony

