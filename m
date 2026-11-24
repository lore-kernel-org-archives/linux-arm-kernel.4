Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7410D606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lZ/NVLso;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=niUPdX5p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/MALPDyHKcwgZFxp/XVziOgwlKTT2pL6VjCQjPtdl2A=; b=lZ/NVLsot5GPxD
	iq4HSoHHW8Dn75SEumOIuZtGp4T4lZfQOxWmmDDRR+xFGxIwhemX98wISvtQbvtIEidoD7JCmrhrb
	tNDNqdKXEiwUfXuSnU6N1oEs2pj1KKkvW4E/FQaoMoRVnvBWMsjPNKgmLd2+CG8ZfiLJdZs39bQ30
	XhfZYfvykPMDxnWHyX1DBBUgd0jm3Y2mqfCmRqg1gCM+eYT3cfE6cCK5CvLQm9lLrSGFs2wG006hX
	DpFrlp8pZDmiCVXfDFDxZS3uI9tnGG+LTyFytTrJDAFr6pbMSOFmNPyM/GhjACkkahX8VYBpzhzW5
	G1FnZd7IbJ9tV2JKFE7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnJq-00000006AY5-0mrX;
	Tue, 24 Nov 2026 10:00:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnJo-00000006AXo-0tP7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 10:00:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D77314125E;
	Tue, 24 Nov 2026 10:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C331F000D4;
	Tue, 24 Nov 2026 10:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514406;
	bh=/MALPDyHKcwgZFxp/XVziOgwlKTT2pL6VjCQjPtdl2A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=niUPdX5psNVQ4PCneCpItEYgoYBIBuz9D5sLCdga3f3S21V1pMncmd5LeoHCjw2vo
	 UQy+MTNm2+kHuRbO8gOnZ2njV1CYQaqWYX8+ZcKN6V17rk18pEFdY+Bl0yOPpcQB3F
	 qg1XQ7PyhxsjKKVVUD7zSCf7VgdWbmhhe4zhFyZm2CwXA/2CrhqIg6X4qMnmlberWW
	 CIOLJTgjyOZB0thiSFRuNsDKDGHHAQ+FnbCYxwUraNXaeLUYsLHhk1F9R/aH89567l
	 H1yVuX/uHdc1hxMzqcRnsniZBQne1yAqIJ6dTXjbJrKTodzL4TdZpSnjkwPTt8gch9
	 tB+H5cdhuG9TQ==
Message-ID: <7171e726-60e3-4ee2-8d63-b2decbf74856@kernel.org>
Date: Tue, 24 Nov 2026 11:00:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] dt-bindings: soc: synaptics: add SL2610 system
 controllers
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-6-jszhang@kernel.org>
 <20261123-bold-neat-albatross-e92a2b@quoll> <awQ2ipCw1mEx-wxu@xhacker>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <awQ2ipCw1mEx-wxu@xhacker>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 23/11/2026 13:50, Jisheng Zhang wrote:
> On Mon, Nov 23, 2026 at 11:28:23AM +0100, Krzysztof Kozlowski wrote:
>> On Sun, Nov 15, 2026 at 06:23:44PM +0800, Jisheng Zhang wrote:
>>> Describe the SoC, MCU, AVIO and CPU system control blocks, including their
>>> clock inputs, clock and reset providers, and pin configuration subnodes.
>>> The clock and reset providers share each register block node.
>>>
>>> Add the clock and reset identifiers used by consumers of these blocks.
>>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> ---
>>>  .../soc/synaptics/syna,sl2610-soc-syscon.yaml | 178 ++++++++++++++++++
>>>  MAINTAINERS                                   |   3 +
>>>  include/dt-bindings/clock/syna,sl2610.h       | 131 +++++++++++++
>>>  include/dt-bindings/reset/syna,sl2610-reset.h |  80 ++++++++
>>>  4 files changed, 392 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
>>>  create mode 100644 include/dt-bindings/clock/syna,sl2610.h
>>>  create mode 100644 include/dt-bindings/reset/syna,sl2610-reset.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
>>> new file mode 100644
>>> index 000000000000..cdf947cb3e0f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
>>> @@ -0,0 +1,178 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/soc/synaptics/syna,sl2610-soc-syscon.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Synaptics SL2610 system control registers
>>> +
>>> +maintainers:
>>> +  - Jisheng Zhang <jszhang@kernel.org>
>>> +
>>> +description: |
>>> +  The SL2610 family has separate SoC, MCU, AVIO, and CPU system control
>>> +  register blocks. The SoC and MCU blocks provide clocks, resets, and pin
>>> +  control. The CPU block provides clocks. The AVIO block contains audio PLLs.
>>> +
>>> +  Clock and reset specifiers refer directly to the system control node.
>>> +  Pin group configurations are direct children of the SoC or MCU node.
>>> +  There are no separate clock, reset, or pin controller child nodes.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - syna,sl2610-soc-syscon
>>> +          - syna,sl2610-mcu-syscon
>>> +          - syna,sl2610-avio-syscon
>>> +          - syna,sl2610-cpu-syscon
>>> +      - const: syscon
>>
>> Split the binding file, you combined multiple different devices.
> 
> sure, will do in next version
> 
>>
>> Also, bindings should be placed in respective directories, not soc.
> 
> I try to follow existing examples:
> Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2044-top-syscon.yaml
> Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> and so on.
> 
> Especially, the 2nd and the last one also document the bindings of a mfd
> for clk. It seems upstream accepts both soc and mfd. TBH, I have no
> preference, but these are recent examples, so I follow their style. So if
> you still prefer putting the bindings in mfd directory, kindly comment.

I do not suggest mfd, because there is no such function. Tricky to say,
binding is a mess, but first glance suggested devices here have specific
functions.

Best regards,
Krzysztof

