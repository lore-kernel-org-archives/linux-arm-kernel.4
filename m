Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0AC606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 14:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rdDrDHh7;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Gc/ngW12
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LxfGlX3yA/Us3CDMzz+HpVvK1bqzSpTaL9BUfwzylfY=; b=rdDrDHh7VgkCNM
	ohlZnPI/SM16XXJMI5iAPS2UQu1OSwJNSD/JLMfXunGyTbqTywvxVVSX1f6rMFmsF+vpQ/ni1dVlo
	FbuuqJxc2hE462TyTXG+y3XHI5WZaNqiU/eWhqWN4d2JyRsav2xWTIG99KdKYDinL35KsP7Kdy/va
	mf+06N9Vnx2V/3JK/O95lXzeLu0KDpij5yHchw5F3IT+NK+muMhR7FqFNYOVL3GHmz7aUadvDc16D
	BRrJTSVcY4IGuTkG75etkMedVwn1wLQWLmJcAfJfIBYvKx4kTG1Bcj8sL1SN1xxrtacsb08E+oBUb
	ywXBtTa9+Tl2C9HJe6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh7t-00000009Bb6-1lUF;
	Wed, 18 Nov 2026 14:59:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh7r-00000009BaP-24DB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 14:59:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62A901477;
	Wed, 18 Nov 2026 06:59:00 -0800 (PST)
Received: from [10.0.136.98] (M0PRX50XMG.cambridge.arm.com [10.0.136.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CBE73F632;
	Wed, 18 Nov 2026 06:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795013943; bh=v8Zs0Zl1Hmpij2wJiNRNAEeU8j1Gx65Fpf1iqz5KS3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gc/ngW12UV+79e1Q1NEoDMmgu0KtigomIpkWBDoAfGMcGepHfEIKq4YCNghlTJnMk
	 bbofUV5//MaXf2G7IDVMFwl5+XhCjdbOSVrPeLDWMdV8+WmR60eJJoNcg6Tz1/4F9u
	 Z2b4awSxSD7z9FXr9QgOKX73s85FVm8UDuRwyrNg=
Message-ID: <ea064380-ad7b-4f79-ac17-1174555ed10a@arm.com>
Date: Wed, 18 Nov 2026 14:58:59 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host driver
 issues
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261112145814.853424-1-fuad.tabba@linux.dev> <avrzusx1g1ZICo0Q@red-moon>
 <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
 <avsN0E-6_7kU3pTk@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <avsN0E-6_7kU3pTk@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_065907_639103_6A136DCA 
X-CRM114-Status: GOOD (  28.23  )
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

Hi Fuad,

On 16/11/2026 14:06, Lorenzo Pieralisi wrote:
> On Mon, Nov 16, 2026 at 01:28:56PM +0000, Fuad Tabba wrote:
>> Hi Lorenzo,
>>
>> On Mon, 16 Nov 2026 12:14:50 +0000, Lorenzo Pieralisi
>> <lpieralisi@kernel.org> wrote:
>> [...]
>>>> invalidate have the same shape. The question is, can an IRS miss the
>>>> poll, or is a timeout here only ever a dead IRS?
>>>
>>> Thank you for your patches Fuad.

Seconded. Thanks a lot.

I'm more than happy to include "irqchip/gic-v5: Clean a level 2 device 
table before making it valid" in v3!

>>>
>>> The latter, though freeing memory on timeout wasn't a good idea given
>>> that there is no way to cancel the respective, pending, mapping.
>>
>> Thanks, that answers it. If you'd like a patch that doesn't free the
>> memory on a timeout, let me know and I'll send one.
> 
> Thanks. Again, if that timeout expires I think we have more serious
> problems than the IST mapping but I do agree that freeing memory
> is not the answer; not urgent - please send a patch given that
> you spotted it, can obviously do it too.

I've got some patches addressing the ITT and IST mapping issues in the 
host driver, which I can include in v3 if you haven't already started 
working on these. I'll make sure to include the appropriate Reported-by 
tags, of course!

I'll post a fix for the VMT separately as it doesn't belong in this series.

> 
>>
>> [...]
>>>> Notes:
>>>>      Setting L1 on every invalidation turns each registration and
>>>>      teardown into a range invalidate, both rare paths, and keeps the
>>>>      function simple. Setting it only when registration allocates the
>>>>      level 2 table would miss a registration that fails after the
>>>>      allocation, which leaves the level 1 DTE valid.
>>>
>>> I can't follow. I agree that we have to invalidate the L1 DTE on
>>> L2 allocation but that's a one-off, I don't understand what issues
>>> you are pointing out in the Notes above, if you can point out please
>>> the code paths it refers to that'd help.
>>
>> gicv5_its_device_register() can fail after
>> gicv5_its_devtab_get_dte_ref() has made the L1 DTE valid, and before
>> the gicv5_its_device_cache_inv() at the end. That happens if the
>> EventID bits check fails, or the ITT allocation does. The L1 DTE is
>> then already valid for the next device registered under it, so that
>> registration doesn't allocate a level 2 table.
>>
>> The patch Notes were about setting ITS_INV_DEVICER.L1 in that
>> gicv5_its_device_cache_inv() call only when the registration allocated
>> the table. In that case the failed registration never reaches that
>> call and the next one reaches it with L1 clear, so this L1 DTE is
>> never invalidated. Invalidating in gicv5_its_alloc_l2_devtab(), right
>> after the L1 DTE write, is the one-off you describe. I'll rework the
>> patch to do that instead.
> 
> Yes, I think that's what we should do - invalidating in
> gicv5_its_alloc_l2_devtab() once for all and leave everything else as-is
> matches architecture guidelines.

Agreed. I've got a reworked fix for this too, which I can include in v3.

> 
> Thanks again.
> 
> Lorenzo

Thanks,
Sascha

