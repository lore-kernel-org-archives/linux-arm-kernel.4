Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C68B606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZYVGHlnR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bYPkKVG2;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ty4nHO3Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fFXM4VsY0RTQVbWn8ye8maJPr7lIP431CErzs/ruNGg=; b=ZYVGHlnRLPjtph
	2sUJlLvhiy4Zu1NNdyyeKrOZa+/YIe9kPv7Ut5s2Bi36uO2UL7GDF7PqnNxIo2qoF77hBlOtkKrY6
	swcjYtdq9y7l5E7dLyt+NPkf34eJTU1NNfIVmjNKApWr2caQ6jCjrLaa72NlWMJmT9c/xp3CtNYNZ
	Q75al112B+2P6Wolm/PiVgsfuKwMlzefg/Batcn+aMw2fDzdZaTKNbtw1hODLw+R/7ErJBpDQWjy5
	eAxzpjmVYtPRekL+HAF+RLxqYyKU6uAfCEF2kO6nDYgK9XRmPXrjzHT0edwOmiLNSCwyfDvi/N7g9
	sCr8wqC/xX8GWxU1ddLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDq-0000000AsfM-2S6H;
	Wed, 25 Nov 2026 17:55:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDb-0000000AsIb-3TtI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fFXM4VsY0RTQVbWn8ye8maJPr7lIP431CErzs/ruNGg=; b=bYPkKVG2NmBb+Yv+6y2l+mwrlv
	GU46R030840c4cNL3rLbIPhReXUIDhw1xniuY4A0Ec2ujaN9p2JimjW9FLRPoG1SuqnHlLBhHqBUq
	zzNEvGlnw7qHve8UgzSH5OApeRes/kXD/hSKRw9vMvySgQthXaEGR7x6xty/G+I1by2geNpU3Rmic
	aseIUS1NZYNPR3NZ8y21P+vDpdn77gmlGt6iEhzS8U7ARIcwHQuTWwuAVHYjLXVxEomxuIV1LnfKW
	fydnlUTw7J4T+mQqu8weosljUu3T6s+zlmtCzK4n4ho1U/9edGIn5LZUG0QmpEJECfOlxHpg2HTtp
	O1L+C5sw==;
Received: from out-19.mta1.migadu.com ([95.215.58.19] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDW-00000005cYz-0FVQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:55:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=NN4WGVbOnaTjrSCMn4KsfQluXPMA9ZIKbvqBw1KnXg0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795629335; v=1; x=1796234135;
 b=ty4nHO3YTMkCilwppIsWWTiBpDP/NWZdwrJq6CSGCK3KX66vVYz3q+IlV5X0foqKtuF4upRx
 iXnvVBz9wy4kZJ0UivlMoHnOw2GCSov7iwzhlKPANH0XLIy4OvCMmsnmQmCb+vH/UT5jKgWHHv4
 y8kQtKqybL2hu0B1mIfN53zY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8be7eac4ebc51b04;
	Wed, 25 Nov 2026 17:55:31 +0000
X-Mizu-Trace-ID: 8be7eac4ebc51b04
X-Migadu-Flow: FLOW_OUT
Message-ID: <06a69a4f-59bb-49b8-9ed0-f4cfe0ecad37@linux.dev>
Date: Wed, 25 Nov 2026 17:55:29 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
To: Leonardo Bras <leo.bras@arm.com>, Lorenzo Stoakes <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 mark.rutland@arm.com, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com,
 rkeilty@meta.com, atish.patra@linux.dev, dgreid@meta.com
References: <20261124152842.2634495-1-usama.arif@linux.dev>
 <awcXhk885lqDRAHy@LeoBrasDK>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <awcXhk885lqDRAHy@LeoBrasDK>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_175538_116523_CA75FC19 
X-CRM114-Status: GOOD (  24.46  )
X-Spam-Score: -0.2 (/)
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



On 25/11/2026 09:14, Leonardo Bras wrote:
> On Tue, Nov 24, 2026 at 07:28:42AM -0800, Usama Arif wrote:
>> When a stage-2 fault may need new page tables, KVM first tops up the
>> vCPU's page cache: if it holds fewer pages than the fault might need, it
>> is refilled to KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE, which arm64 sets to
>> 40. Unused pages stay in the cache until the vCPU is destroyed.
>>
>> With 64 KiB pages, that is 2.5 MiB per vCPU, and most of it is never
>> used. Stage-2 has at most three levels and the root is preallocated, so
>> a fault needs at most two new table pages (kvm_mmu_cache_min_pages()).
>> As every last-level table covers 512 MiB, an 8 GiB guest needs just 17
>> table pages to map all of its memory, while its four vCPU caches get
>> filled with 160.
>>
>> On a production host with 64 KiB pages running 101 VMs with four vCPUs
>> each, the caches were still 86% full. The memory used:
>>
>>                         before      after
>>   per-vCPU capacity     2.5 MB     512 KB
>>   all 404 vCPUs         869 MB     <= 202 MB
>>
>> Let's lower the capacity to 8 with 64 KiB pages, In the production
>> usecase above, it frees at least 667 MB. That still covers the two-page
>> minimum and leaves room for several table allocations per refill. 4 KB
>> and 16 KB pages keep 40.
>>
>> The temporary cache in kvm_phys_addr_ioremap() uses the same capacity,
>> but it is topped up before every page it maps, so 8 is sufficient there
>> as well. The pKVM hypervisor memcache and the eager split cache don't
>> use this capacity.
>>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
>> ---
>>  arch/arm64/include/asm/kvm_types.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
>> index 9a126b9e2d7c99..28568da9ea4a7b 100644
>> --- a/arch/arm64/include/asm/kvm_types.h
>> +++ b/arch/arm64/include/asm/kvm_types.h
>> @@ -2,7 +2,12 @@
>>  #ifndef _ASM_ARM64_KVM_TYPES_H
>>  #define _ASM_ARM64_KVM_TYPES_H
>>  
>> +/* Must cover kvm_mmu_cache_min_pages(), at most 2 with 64 KiB pages. */
>> +#ifdef CONFIG_ARM64_64K_PAGES
>> +#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 8
>> +#else
>>  #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
>> +#endif
>>  
>>  #endif /* _ASM_ARM64_KVM_TYPES_H */
>>  
>> -- 
>> 2.53.1-Meta
>>
> 
> Hi Usama,
> 

Hello Leonardo,

> Have you tried to reproduce this issue in v7.4-rc1 or newer?

Yes. The patch is against kvmarm/next (v7.4-rc3), which includes
Lorenzo's pre-fault series, and I A/B tested it there.

On unpatched v7.4-rc3 with 64 KiB pages, a VM whose 16 vCPUs each fault
in one page needs a single stage-2 table page, yet the vCPU caches hold
640 pages (40 MiB). With the patch they hold 127 pages.

> 
> IIUC Lorenzo Stoakes introduced a change that would cause the memcache to 
> skip topup if the cache contains a minimum of ~4 pages, so it can possibly 
> improve that issue.

I don't think that part is new. __kvm_mmu_topup_memory_cache() has
returned early when mc->nobjs >= min since commit 6926f95accee ("KVM:
Move x86's MMU memory cache helpers to common KVM code"). Lorenzo's
commit d27acc152c62 ("KVM: arm64: Size the stage-2 memcache from the
fault MMU") takes min from s2fd->mmu instead of vcpu->arch.hw_mmu. For a
guest abort that is the same MMU, so nothing changes here.

With 64 KiB pages, min is kvm_mmu_cache_min_pages(), which is at most 2.

> 
> Although I can see that when it's below that minimum it fills the whole 
> capacity (40) of the cache.
> 

Right, and that is the problem. Skipping the top-up avoids refilling
the cache, but nothing ever drains it. A vCPU's first fault fills its
cache to 40. Each last-level table covers 512 MiB, so a guest needs very
few table pages, and most vCPUs never drop below min. The remaining
pages stay allocated until the vCPU is destroyed, which is why the
production caches were still 86% full.

The patch keeps the early return and only lowers how far a refill goes.

Thanks,
Usama

> In any case, Lorenzo, could you advise?
> 
> CC:Lorenzo Stoakes (ARM) (ljs@kernel.org) 
> 
> Thanks,
> Leo


