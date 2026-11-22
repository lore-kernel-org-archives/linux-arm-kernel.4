Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D84606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aRIgLadg;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Mfz+dcBl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X/ImYYDd3EVaDS4zZsiu8vi3y7LYamjb/4uJ0SjgBko=; b=aRIgLadgTPMLFJ
	7H41XmV7BwaDWJUEZ2LJOLz3LfAzqMyD4GUeSSLeR7Spu+DK8aPglyUOvpBBfFFIkWY+cKbB+G7EK
	YCnOoD1e8ZgoZHSVHQRcZ8eHYFtZ5NhHm5h3xVYcB1p7HUA5De0WU4wyKZiWL//VK+IWVnPqQn94Y
	cfGP0VJLSgmzUzEB6dgYcNZixteqsQG9/IzX3faJT0AgEVLrmW3fe2rsSptTaOFkYkfTG7hty7AZ4
	xwYww8+hm+tY+Q6YIquSPrN0PhqZtKiyuLq71SQUnPxo1JLvycRADR+Lb/TBXPFQ9GGKgegSqjmCH
	cJ1TG5OEfHNz22SEj7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3YS-00000000t5D-0cWI;
	Sun, 22 Nov 2026 09:08:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3YP-00000000t4W-3VzZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:08:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E14B81575;
	Sun, 22 Nov 2026 01:08:05 -0800 (PST)
Received: from [10.57.93.187] (unknown [10.57.93.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C5B73F632;
	Sun, 22 Nov 2026 01:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795338488; bh=jJiazFe28urFO1ZFl6f+3emwAhlj1WRmNGj87b1Acfc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mfz+dcBlgqLMjD5pjtIV6ikIyQIWy7mUwbWozOE9ZTw3/6Xpc3EBDuV7NrOFpRdxM
	 SzMqY0r5s9atCGMv0e+IiEv+ylc4HFyjn4ttVu5lrKG+8QojRnsnK+bYxfBIUx8S1s
	 WrhayFwuKHMkVVXO+6xTcDRXI8GYTdhmQ1aWxnLM=
Message-ID: <7f466d97-64f4-4b63-ad78-fef11bbbb919@arm.com>
Date: Sun, 22 Nov 2026 09:08:05 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] arm64: cpufeature: Track BBML3 exclusions with
 erratum options
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Linu Cherian <linu.cherian@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-6-ryan.roberts@arm.com> <av3neu-9VTv8RgeY@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <av3neu-9VTv8RgeY@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_010809_936176_F4F709D1 
X-CRM114-Status: GOOD (  19.27  )
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

On 18/11/2026 17:59, Catalin Marinas wrote:
> On Fri, Nov 13, 2026 at 02:50:19PM +0000, Ryan Roberts wrote:
>> Several CPUs implementing the BBML3 no-abort semantics advertise only
>> BBML2, but cannot safely use those semantics because of hardware errata.
>> Omitting their MIDRs from the allow list hides the reason for the
>> exclusion and makes the relevant workarounds difficult to track.
>>
>> Add a default-enabled Kconfig option for each of the following errata,
>> and include the affected CPUs in the BBML3 allow list only when the
>> corresponding workaround is disabled:
>>
>>   3043240  Cortex-X925
>>   3043263  Cortex-X4
>>   3053180  Neoverse-V3 and Neoverse-V3AE
>>   3683289  C1-Ultra and C1-Premium
>>   3696239  Cortex-X3
>>   3696242  Neoverse-V2
>>   3696244  Cortex-A710 and Cortex-X2
>>   3696250  Neoverse-N2
>>   3696285  Neoverse-V1
>>   4196850  C2-Ultra
> 
> I'm not sure what the benefit of this is. These CPUs are not listed in
> the BBML3 capable list anyway, so the patch adds them but gated by a
> Kconfig option, default y. Is it only an elaborate way to tell people
> why we couldn't enable BBML3 support for them? Maybe the documentation
> part is sufficient.
> 

I'm just trying to make it very clear why certain CPUs are not in the list. With
the exception of A510, in general, Arm-designed CPUs that advertise BBML2 are
also BBML3 compliant and should therefore be in this list. But some of the CPUs
have BBML2 errata which prevent them from being in the list.

The information is all very scattered internally, and I've personally had to do
the exercise 3 times now, of figuring out which CPUs are excluded from the list
because they haven't been added yet vs which are excluded because of an erratum.

Perhaps it would be simpler just to create a file in Documentation/arch/arm64 to
track this and add a comment next to the midr list referring to it? I don't mind
how we do it, but I do think it's valuable to capture the info somehow. I did it
the way I've done it because it looked like the standard way of documenting
workarounds.

Thanks,
Ryan


