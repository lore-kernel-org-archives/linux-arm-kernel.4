Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251F7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Be7/O1dk;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ET4I9JGJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0zUWahZr0YdCEVMjMfy4fsnGVmWimdEhGip8c1MJYpI=; b=Be7/O1dkqKFh9Z
	mUfS6WQsG5TRZfbjJ51zlaWdWzfro8x/Tdpp8iKpujUCKLb9T1xKqK5QUhLMvRJWC0Ftu2rmnLVxu
	d4GyhmMBtrUFN0TdYbi2D4tSdeQUinjWcSBk5J3FEThcwb7gc77eIvv6kmqjGhpF2vBFGAkyg7oC7
	JjncL5kNISH7YHAS/5psUVmWuOHEcb+ZkPQkmX32kD0l4P1ZHzzQEGK8wGFJ0sVd+FWczCmaLZ/zD
	Yl1K9rMpPC6CkXQf2we+2+cXhEyrRmpGe8+FdoEpI9j/Kv6kcxausp70lcJtLWH3HL1iOnR9nuTnd
	24PUWa2gEDikOzxjjhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDXW-0000000A5CN-49yE;
	Wed, 25 Nov 2026 14:00:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDXT-0000000A5BK-3HSM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:00:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FB841762;
	Wed, 25 Nov 2026 05:59:55 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE6103F86F;
	Wed, 25 Nov 2026 05:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615198; bh=bsLN2zzvymscrQHAuMrvXPUOAQSGsQuczkfJ5hFWo9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ET4I9JGJD337mnXpzb5wfJxyJRF+o3Kb66rSUf3nGDH94OAu4LVIDmMUYQ8Djy9mU
	 43V16/0lZ81btAF6WVLQKSCbwm8Ch3yP+fDWRJzktEaXM4axvXFK0YbQNPFdrfLnji
	 r3QyQ2m03c8JtEB0lSS7/0eLJH+IijFcPUtHr/w8=
Message-ID: <5170b051-769e-4822-bb92-3739530c5f2a@arm.com>
Date: Wed, 25 Nov 2026 13:59:55 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] irqchip/gic-v5: Retain the L2 IST when mapping
 times out
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
 <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
 <awXH-Is5s6eqx8mT@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <awXH-Is5s6eqx8mT@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_060000_061070_37BE04FD 
X-CRM114-Status: GOOD (  20.10  )
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

Hi Lorenzo,

On 24/11/2026 17:23, Lorenzo Pieralisi wrote:
> On Thu, Nov 19, 2026 at 12:00:15PM +0000, Fuad Tabba wrote:
>> Hi Sascha,
>>
>> On Wed, 18 Nov 2026 17:35:33 +0000, Sascha Bischoff
>> <sascha.bischoff@arm.com> wrote:
>> [...]
>>> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
>> [...]
>>> @@ -217,6 +217,10 @@ int gicv5_irs_iste_alloc(const u32 lpi)
>>>           if (FIELD_GET(GICV5_ISTL1E_VALID, le64_to_cpu(l1ist[index])))
>>>                   return 0;
>>>
>>> +        /* A previous map timed out; do not overwrite its pending L1 entry. */
>>> +        if (READ_ONCE(l1ist[index]))
>>> +                return -EBUSY;
>>
>> Sashiko's review [1] didn't go on the list, in case you missed it.
>> Sashiko found that l1ist[index] is read twice, and that on a
>> non-coherent IRS a map completing after the timeout leaves a stale
>> copy of the L1 entry in the cache for later allocations. Invalidating
>> the entry before it's first read would fix the latter. Invalidating it
>> on the timeout path wouldn't, since a later read can refill the line
>> before the map completes.
>>
>> With those fixed:
>> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
>>
>> Cheers,
>> /fuad
>>
>> [1] https://sashiko.dev/#/patchset/20261118-host_gicv5_fixes-v3-0-13c1859e8aa3%40arm.com
> 
> Hi Sascha,
> 
> I am taking some time to revamp the current approach because as a fix
> it is getting complicated and there are corner cases that I don't think
> are fully covered.

Yeah, this is a bit of an awkward one to get right.

> 
> I suggest we drop this patch from this series for now so that it does
> not hold off the other patches that I believe are ready to be merged
> with very minor tweaks.

OK, noted. I've dropped this from the next version, so hopefully the 
rest can be merged in.

> 
> Thanks,
> Lorenzo

Thanks,
Sascha

