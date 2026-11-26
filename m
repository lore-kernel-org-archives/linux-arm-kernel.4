Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C73E60A263C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XbI6gSFB;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TmlDV4Fi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m1EK5Kg1DHSLtMSU2tHQsWHX71zGSAKbIU1tLCzsNOs=; b=XbI6gSFBk3QUfH
	psYIRdRoaGi0CXSmDrMwXrrfLvoWHn+vsFPjurhODb6ClZcIg/FwvP/3TUU+/IoCaX4LQlAakXzk1
	eS898EhMsI97eQfKnCrccp2xNmspkmk6nqXuLvG8P7gUdJLyTuy0LoTqJG0IahmoiNrgnVDMZ2YcK
	yNwI4wevaXfAeNDE1mADrl3bGCTKYsjr+7TtaIoYCmcvH9n37zPHijqGB35Ksb9z0Nb7gBzTDgC37
	balwl+LqqHV/MUvRMD9prQ9MRwQ1Y65yOICT1V5Iag/n3sDXNsPBpGd/uLPgBJ2+bLDZ5kUUaIqpC
	XLpuVMOFID6pOA8WwWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWat6-0000000DdZa-0mrt;
	Thu, 26 Nov 2026 14:55:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWat3-0000000DdXS-1reF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:55:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB1D01BA8;
	Thu, 26 Nov 2026 06:55:42 -0800 (PST)
Received: from [10.33.48.93] (GM14V85S.arm.com [10.33.48.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9091E3F86F;
	Thu, 26 Nov 2026 06:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795704945; bh=SvlCtrr/3AS4+5pYzT1k9dDLoH3VLB5hGYKVGoOtsN0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TmlDV4FiQUtQv962BjjuYR9pnZajoHuThd6FyEr+tHqwPGNjq8WLAciv0R0sVn6Iq
	 7Cbpv0qOqyu4PqDxJrJ129vi9CYr+47Hia/CnX5K+hYcXCp/2fynBHWXiUDcqy9QJw
	 gXWwO7C6piEaX5LzzH7Q8ilOBfWGp0FXmQzpUwBU=
Message-ID: <0543d134-04d3-4e51-acd1-4fc39a0e522b@arm.com>
Date: Thu, 26 Nov 2026 14:55:40 +0000
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
Content-Language: en-GB
From: Anthony McGivern <anthony.mcgivern@arm.com>
In-Reply-To: <179559671799.14607.10622707622371448283.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_065549_573676_6A82AEF2 
X-CRM114-Status: GOOD (  20.88  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, thanks for the review.

On 25/11/2026 08:51, Krzysztof Kozlowski wrote:
> On 2026-11-24 17:07 +0000, Anthony McGivern wrote:
>> From: Anthony McGivern <Anthony.McGivern@arm.com>
>>
>> Add the device tree binding for the Arm Mali-C720 Image Signal
>> Processor.
>>
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 

Yeah my mistake, I will update this in a V2 series.

>> Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
>> ---
>>  .../devicetree/bindings/media/arm,mali-c720.yaml   | 134 +++++++++++++++++++++
>>  1 file changed, 134 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c720.yaml b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3bd261bcefbe371b7b4610afdde8e556b2a2ae22
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
>> @@ -0,0 +1,134 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/arm,mali-c720.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ARM Mali-C720 Image Signal Processor
>> +
>> +maintainers:
>> +  - Anthony McGivern <anthony.mcgivern@arm.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: arm,mali-c720
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 1
> 
> Why is this flexible?

The ISP has two interrupts - Main and fault. Currently the driver only
uses the main interrupt, though we may wish to enable the fault
interrupt in the future to detect errors on HW side. I will update
this in V2 to use descriptions for each interrupt.

> 
>> +    items:
>> +      - description: ISP main interrupt
>> +      - description: ISP fault interrupt
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    items:
>> +      - const: isp
>> +      - const: fault
>> +
>> +  iommus:
>> +    minItems: 1
>> +    maxItems: 3
> 
> Same question. List items with description instead.

The ISP has three AXI masters which may be connected to different
IOMMU ports. Initially I made this flexible since those masters
could be merged onto the same port, but better to be explicit here
and just define all three. In V2 I will remove the flexibility and
add a description for each port.

> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: ISP main processing clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vclk
>> +
>> +  resets:
>> +    items:
>> +      - description: ISP main processing clock domain reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: reset
> 
> Drop names

Will do

> 
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +    description: Reserved memory pool for ISP DMA allocations.
>> +
>> +  power-domains:
>> +    description: Power domain containing the ISP.
> 
> Drop description

Same here

> 
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description: Parallel video input ports.
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input port 0
>> +
>> +        properties:
>> +          reg:
>> +            const: 0
> 
> Drop properties, should not be needed, same in places below.

Ditto

> 
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input port 1
>> +
>> +        properties:
>> +          reg:
>> +            const: 1
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input port 2
>> +
>> +        properties:
>> +          reg:
>> +            const: 2
>> +
>> +      port@3:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input port 3
>> +
>> +        properties:
>> +          reg:
>> +            const: 3
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    mali_c720: isp@400000 {
> 
> Drop unused label

Ditto

> 
> Best regards,
> Krzysztof
> 

Thanks,
Anthony


