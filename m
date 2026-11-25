Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03181606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mIe6tetk;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QfD+DQTm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yxLNMcBe3vV28hJjFBumAOLh5rRTwo44KNq9HoVYs/8=; b=mIe6tetkVe7Mxf
	vt1gcoXeDSZsZdagWmLPQ0XQMTqgebctRt3NH08ZdWEqt3pHOBPoR2H9QoqCgZ59iMfby7CBHISTF
	t+3YVh0YbmRhYK99lKJPvlZWw8jLPK+FnB3NgbcTieQ3hOGlegJ8d5AgAuecWC+WZ9DgQG8DVgmWl
	4qfRu2WeDMDldVxBkbpKrjUmQ9LArdJIT5BsXBA+5TyZFAJwp+KGMTBbmRKu2MgeBNGtU7byrJs6B
	WYAAwQc7lMFWHe5Jiy1OAJoN49Xn6HuBXt7j1Z1dWOBxfiIHJ877gfUEj8zqVztiOojcRMBPYblHK
	fL5nbWphZjyO/6cyEdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDYD-0000000A5Hh-1CXe;
	Wed, 25 Nov 2026 14:00:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDYA-0000000A5HF-2Iet
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:00:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D5C71762;
	Wed, 25 Nov 2026 06:00:38 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08CA03F86F;
	Wed, 25 Nov 2026 06:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615241; bh=sQswOH8nnBcq6IUi9XPTJ5poHVCkOKm02pa3De59Umo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QfD+DQTmVMu+9++Zu8shOBSTyVOse0QwNCCMfKtuOINaICJYtdjQiKXHNH05UArvl
	 eXKK+ciTNqJWNP2KHDZij5A1GvB7wX47fMUBnFsjnQV2IX0GlIVh5QD1yGw8ldk1N5
	 pY08N+cPLnl6q5qznXW81o1rCmHBC7NPxwYlgVls=
Message-ID: <a85c50c2-b313-4bb1-8338-95bd9fb9d4a5@arm.com>
Date: Wed, 25 Nov 2026 14:00:38 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] irqchip/gic-v5: Retain the L2 IST when mapping
 times out
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
 <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_060042_640514_5AABCCBD 
X-CRM114-Status: GOOD (  14.47  )
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

Hi Fuad,

On 19/11/2026 12:00, Fuad Tabba wrote:
> Hi Sascha,
> 
> On Wed, 18 Nov 2026 17:35:33 +0000, Sascha Bischoff
> <sascha.bischoff@arm.com> wrote:
> [...]
>> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> [...]
>> @@ -217,6 +217,10 @@ int gicv5_irs_iste_alloc(const u32 lpi)
>>           if (FIELD_GET(GICV5_ISTL1E_VALID, le64_to_cpu(l1ist[index])))
>>                   return 0;
>>
>> +        /* A previous map timed out; do not overwrite its pending L1 entry. */
>> +        if (READ_ONCE(l1ist[index]))
>> +                return -EBUSY;
> 
> Sashiko's review [1] didn't go on the list, in case you missed it.
> Sashiko found that l1ist[index] is read twice, and that on a
> non-coherent IRS a map completing after the timeout leaves a stale
> copy of the L1 entry in the cache for later allocations. Invalidating
> the entry before it's first read would fix the latter. Invalidating it
> on the timeout path wouldn't, since a later read can refill the line
> before the map completes.

FWIW, I had missed this. Thanks for calling it out.

> 
> With those fixed:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad
> 
> [1] https://sashiko.dev/#/patchset/20261118-host_gicv5_fixes-v3-0-13c1859e8aa3%40arm.com

Thanks,
Sascha

