Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CDC606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lAA8z9NQ;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ElCTLXIy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EI+/gOi3YcwXHjbf8KM4BWSUOlp+RtEEWptAHvG91Jc=; b=lAA8z9NQSVQUGv
	vv0s+W6/81L65cU8/8npSEKSlOW10F9MpAcg3zZif49YalkEhRN6fa9P3qdIy2hRmBkUaJhHXJIBP
	3eFdztMhJISkME/uu2bkD42cMBV8D+sN/4d24mHsTFQAyU76hoSZ5Pu3sbPWAfH0thPe2UiG1K3a7
	S7MKtknzOpYn1izlovRnZzmsQrduLuS+a0GpaDqfonp8WLYAZn8YesSjDew88OZa8Xr6qLFKhOrbn
	gaAyMieUXEYISkHH8CaRT+RvlUVa/CvWfssLFCsQOQisu4HF1lDvvgYQWjVmqNWN/WYa0Dw8exORB
	vbqdzpVZIC/Mm848oolw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXxR-0000000Afas-1vt0;
	Thu, 12 Nov 2026 16:47:29 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXxB-0000000AfUR-3eeb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794502034; x=1826038034;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gb+ertXw9oZUZYFRwrzAW9mTO6w0J+Qo9JE40Aj9z54=;
  b=ElCTLXIy45zUq+VhKCDGgpscrwvd8iaA+bsUeKr3P3ZSbhIlfP4aq3V/
   OJC6rqAPWSuh4vzNgilsHCpGkIQy/u79NyB64PIra0S/ftYpMIBovzb6N
   MNkePz7xnxZsenFjU1CwRMSwLHVyWv3q9MKniK+hQ8EpPO9had8BGvk4O
   GvbSK2UMsi/HISEYC769PAeA+arTatX84ms3fzCFs65TFOvYcinGYKZ1R
   Zv39s5Uw8l6QTdsznlGbw9AwhSOJLmvkHtjw6Iwd4TPaW1D1piwaPutp9
   qhZ7Z5VDZ9q5i3cq7RK5h7a1Qk6nLc/NM+7DLhd1W9cAG2b+6umYlziIo
   g==;
X-CSE-ConnectionGUID: f7J2bePlSYKANojcg+zxuA==
X-CSE-MsgGUID: hHVBIYEzSjSHBvb8uJkNAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3176596"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3176596"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:47:06 -0800
X-CSE-ConnectionGUID: lzK5vqr6QuuygsvCO9xHyw==
X-CSE-MsgGUID: fvngpodqSqOyq1wRmPy0EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8699912"
Received: from dawidgla-mobl.ger.corp.intel.com (HELO [10.246.19.71]) ([10.246.19.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:47:03 -0800
Message-ID: <d246fbef-d923-475c-8e1f-bbeca20847e7@linux.intel.com>
Date: Thu, 12 Nov 2026 17:47:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] ARM: dts: aspeed: Add Intel AVCRP BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 maciej.lawniczak@intel.com, Andrew Lunn <andrew@lunn.ch>
References: <cover.1794242015.git.dawid.glazik@linux.intel.com>
 <ee6958ba4b93cde4719fbac89c4027964c2236bc.1794242015.git.dawid.glazik@linux.intel.com>
 <fff90721f7892c0285f4fed7fed460c7c1e183cb.camel@codeconstruct.com.au>
 <599f1b31-f175-47df-b074-1915688eb390@linux.intel.com>
 <a92395610d27fc0f97af3b27b150de61583c2197.camel@codeconstruct.com.au>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <a92395610d27fc0f97af3b27b150de61583c2197.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_084721_082140_F3FA284D 
X-CRM114-Status: GOOD (  23.53  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 2:49 AM, Andrew Jeffery wrote:
> On Tue, 2026-11-10 at 17:42 +0100, Dawid Glazik wrote:
>> On 11/10/2026 6:53 AM, Andrew Jeffery wrote:
>>> On Mon, 2026-11-09 at 18:41 +0100, Dawid Glazik wrote:
>>>> AVCRP is an Intel x86 server platform equipped with an ASPEED
>>>> AST2600 BMC. The BMC is used for out-of-band management, platform
>>>> monitoring, and system control.
>>>
>>> It's probably my fault to some degree for not providing a better
>>> explanation of what I was after on v4, and for merging changes from
>>> others in the past that were pretty lax on the description, but what I
>>> was hoping for was something more like e.g:
>>>
>>> - f28674fab34f ("ARM: dts: aspeed: Add NVIDIA MSX4 HPM"), or
>>> - bc83b7353d2b ("ARM: dts: aspeed: Add Facebook Anacapa platform")
>>>
>>> Are there more details you can provide? If there are, I'm fine if you
>>> reply here with them, and if there are no further concerns I can update
>>> the commit message while applying the patches.
>>>
>>> This also applies to the JNCRP patch that follows.
>>>
>>> Andrew
>>
>> Hi Andrew,
>>
>> Thanks, that helps. I also found one more issue in v5 (uart-routing
>> issue), so I'll send a v6 with the fuller descriptions below
>> instead of having you edit them. Please hold off applying v5.
>>
>> AVCRP is an Intel x86 server platform. The BMC is an ASPEED
>> AST2600-based RunBMC module on the platform's DC-SCM. It supports the
>> platform's out-of-band management and exposes board management I/O such
>> as the system UARTs, status LEDs and control buttons, while integrating
>> with the host's telemetry and management infrastructure.
> 
> Can you talk more about the division of duties around RunBMC vs DC-SCM?
> Can you describe how components of each spec are used in the design?
> 
> What's the motivation for designing this module vs using another? Are
> there any specific target platforms intended for it? If there are, then
> some further details about those would be nice. If not, no problem.

AVCRP is an Intel x86 server platform based on Granite Rapids
processors. Its BMC is an AST2600-based RunBMC module on the
platform's DC-SCM. The DC-SCM provides the board management features,
such as USB, system UART over USB, status LEDs and the power and ID
buttons. RunBMC was chosen to enable a broader BMC ecosystem and
implementation flexibility.

The BMC provides the platform's out-of-band management. It exposes the
system UARTs, USB, network, KCS, MCTP over I3C and LPC POST code
snooping, and it handles the status and ID LEDs, the power and reset
controls and the host fault signals.

> 
>>
>> JNCRP is an Intel x86 server platform managed by an ASPEED AST2600 BMC.
>> The BMC is the platform management controller for the host system and
>> supports platform power and reset control, while participating in
>> out-of-band monitoring and reporting for host faults during bring-up and
>> normal operation.
> 
> You don't mention RunBMC/DC-SCM here, so I assume the BMC is integrated
> into the platform? Can you describe the purpose of the platform itself
> (beyond the purpose of the BMC, which tends to be the same for most
> platforms)?

No, JNCRP also uses a DC-SCM.

JNCRP is an Intel x86 server platform with Intel Xeon host processors.
Its BMC is an AST2600-based platform management controller on the
platform's DC-SCM, providing out-of-band management of the host
through KCS, network and MCTP over I3C.

The BMC controls platform power and reset, and monitors CPU and memory
thermal and fault signals as well as host processor module (HPM)
presence, FRU and fault signals. It also captures POST codes.

I'll fold these into the commit messages in v6, together with the
uart-routing fix, so there's no need to edit them when applying.

Regards,
Dawid

