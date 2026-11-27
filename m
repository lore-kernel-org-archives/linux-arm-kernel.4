Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bmaODU0D;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QG2Lxgr2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ej0FH4NWIRLSaxrgsRdTXvAFtYwC+QYLBQG6bKf1ckU=; b=bmaODU0DeQhKeP
	Hp/GlGfe7dGbp5BpDbSOs0ZxtNBltWREfzJXsyDrYnsHqXuHQtvx1zarF/R1kUY+K1PJKb/qSBB3R
	jxnfDC+DzKBpQz0beG6gsfQB2GCsmii2kwOfYncWG3shF8MtJfoLJqHXxpRIrj8vPGDqXt/enFMWE
	7Q4RmIBfrZK3jaWt04uv7IkDQFuW4d/Nr3Ra6lpZ6iAm6/PoC3MIJo2wemxgX54Zx3Xkv72eR603y
	a1EJd9RJmCOuy66I5eXk+oEftAjdkXiTXmAy++EQkwU7Whz7g4FWEuxI1YzVQt2Ay5+ccJTeOBkML
	kRBwocSh/9Y6pC8s7Qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv84-0000000G8qv-0Ajw;
	Fri, 27 Nov 2026 12:32:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv81-0000000G8pP-2K7V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:32:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD3351756;
	Fri, 27 Nov 2026 04:32:33 -0800 (PST)
Received: from [10.57.32.178] (unknown [10.57.32.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 084743F86C;
	Fri, 27 Nov 2026 04:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795782756; bh=7bxvcukx/HgGtBxdFzeSnUBArw9JAb7dnNLFLXl2pOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QG2Lxgr2jw/xOKLl706hxPPfXma5Wb9zMWMsA56S+efWBrE2ChR/lOdzi71a2Htvb
	 U6yBDCqpjpGnW0xH1oYqibMASC20A8twiUiqgDksVubdESrjxj3RFZAPMIXr4Not/N
	 IYg9gM9RdxBwTBOHEDntIOEj/kMiNhyHAqn+zmJ8=
Message-ID: <9bb113e7-f88f-4616-b20a-74065cd755cf@arm.com>
Date: Fri, 27 Nov 2026 12:32:32 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] dt-bindings: media: Add bindings for Arm Mali-C720
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <nayden.kanchev@arm.com>,
 Konstantin Babin <konstantin.babin@arm.com>,
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
 <179559671799.14607.10622707622371448283.b4-reply@b4>
 <0543d134-04d3-4e51-acd1-4fc39a0e522b@arm.com>
 <4e8ecbe0-35bd-41d0-8546-4d99832e662b@kernel.org>
Content-Language: en-GB
From: Anthony McGivern <anthony.mcgivern@arm.com>
In-Reply-To: <4e8ecbe0-35bd-41d0-8546-4d99832e662b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_043237_635060_4C637727 
X-CRM114-Status: GOOD (  17.03  )
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



On 26/11/2026 15:12, Krzysztof Kozlowski wrote:
> On 26/11/2026 15:55, Anthony McGivern wrote:
>>>> +
>>>> +  interrupts:
>>>> +    minItems: 1
>>>
>>> Why is this flexible?
>>
>> The ISP has two interrupts - Main and fault. Currently the driver only
> 
> If only writing bindings covered exactly such example. :/
> 
> Hardware has two, so you need here to.

Ok, understood on the part about driver support being independent here,
I should clarify what I meant to say. This fault interrupt is only
required for safety applications, and as such some integrations can
leave this interrupt physically unconnected.

That being said, it looks like in such case the device tree entry can
use 'interrupts-extended' and set the phandle to <0> for those cases.
So I will remove minItems here and for 'interrupt-names'.
Apologies for the confusion on my side.

As a side note, there are some extra signals for a system timer clock
and video output ports that should be added to these bindings also.
I will address these in V2.

> 
>> uses the main interrupt, though we may wish to enable the fault
>> interrupt in the future to detect errors on HW side. I will update
>> this in V2 to use descriptions for each interrupt.
>>
>>>
>>>> +    items:
>>>> +      - description: ISP main interrupt
>>>> +      - description: ISP fault interrupt
>>>> +
>>>> +  interrupt-names:
>>>> +    minItems: 1
> 
> And please drop minItems here as well

Agreed

> 
> 
>>>> +    items:
>>>> +      - const: isp
>>>> +      - const: fault
>>>> +
> 
> 
> 
> Best regards,
> Krzysztof

Thanks,
Anthony

