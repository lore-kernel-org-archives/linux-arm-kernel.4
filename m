Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=buxaqA4k;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TyYS+yqV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rRhwkGhKQgbihZnk9UaFtjSRGBOLT4pE9MFkULhOFVc=; b=buxaqA4kKs7S8G
	zjiBjomoChxTUfPBogC6FYSAPVhlqwh9ddmBciJPtOnw4Y6l+vTfsKd6oUAEf7n2MAAvWi5OyYBmQ
	xE4kkgcyXECtI97u3MfB3VUwkqbA0+M2aeJvLzvxUUM2+8221kMQETvS0VYbyQVVrf/qknqKdSuXk
	4v6BxomSp213GTYgCW6my9+Pkf7wV1qfJUnO+uH8uA0jWmEZA3G06xBYvyJEbAKTrkEvq5u2+iaXL
	2NqYwhg269c2gxF/MUdn7QWvgyxygOC9d64G1q6J1/DT2Bb5qpzT4p38pPjhKC7eA8nRI++HsIQWG
	8rl00AH9jt/ThekzQ8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcwW-0000000E1MK-0gLy;
	Thu, 26 Nov 2026 17:07:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcwS-0000000E1Lx-1VSm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:07:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77BB51BA8;
	Thu, 26 Nov 2026 09:07:24 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 166A53F632;
	Thu, 26 Nov 2026 09:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795712847; bh=ZfWATzofisBKF6MdkDGT7S22fCOay+KfrgQucX7BJ6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TyYS+yqVO9d2fZk7uIdOqUc1Ec+Z/aLAPLBb7p8GL+mcNliJIr4bHuvSb67roqjVz
	 MSUnjfYRpwWQ4ab/+JLNoQqHmXcFVr+WQ+X5Q+GQp1JD3w0SjZXkwvkyzua4mskzXD
	 IHmYkzLt6UDdsdHNfW+e69UEyrFzC+kLic2oj3To=
From: Leonardo Bras <leo.bras@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	rkeilty@meta.com,
	atish.patra@linux.dev,
	dgreid@meta.com
Subject: Re: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
Date: Thu, 26 Nov 2026 17:07:21 +0000
Message-ID: <awhnFrt1GmrTlQZ9@LeoBrasDK>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <awhfXrdkHkY-riN3@gremlin>
References: <20261124152842.2634495-1-usama.arif@linux.dev> <awcXhk885lqDRAHy@LeoBrasDK> <06a69a4f-59bb-49b8-9ed0-f4cfe0ecad37@linux.dev> <awcoCklLOKeuXPhh@LeoBrasDK> <e7bdcfa9-bbd8-4649-8318-2f6dc236db15@linux.dev> <4jxdf2pkuu2f7dftvf6ltpv27jctfuvvrfcrbfxudsgnp3hdfk@taur55wftexq> <awhODYKXnsBi_s_B@LeoBrasDK> <klnyvfxwhpw73wo55y5aq3qliglnf7xkfkmfj6cgzje7z3n2fq@aqjxshyjnldu> <awhWYdZVkESY9eJs@LeoBrasDK> <awhfXrdkHkY-riN3@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_090728_787264_70DECE18 
X-CRM114-Status: GOOD (  61.11  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 04:45:35PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Thu, Nov 26, 2026 at 03:55:13PM +0000, Leonardo Bras wrote:
> > On Thu, Nov 26, 2026 at 03:34:19PM +0000, Wei-Lin Chang wrote:
> > > On Thu, Nov 26, 2026 at 03:19:41PM +0000, Leonardo Bras wrote:
> > > > On Thu, Nov 26, 2026 at 08:06:41AM +0000, Wei-Lin Chang wrote:
> > > > > On Wed, Nov 25, 2026 at 09:42:33PM +0000, Usama Arif wrote:
> > > > > >
> > > > > >
> > > > > > On 25/11/2026 10:25, Leonardo Bras wrote:
> > > > > > > On Wed, Nov 25, 2026 at 05:55:29PM +0000, Usama Arif wrote:
> > > > > > >>
> > > > > > >>
> > > > > > >> On 25/11/2026 09:14, Leonardo Bras wrote:
> > > > > > >>> On Tue, Nov 24, 2026 at 07:28:42AM -0800, Usama Arif wrote:
> > > > > > >>>> When a stage-2 fault may need new page tables, KVM first tops up the
> > > > > > >>>> vCPU's page cache: if it holds fewer pages than the fault might need, it
> > > > > > >>>> is refilled to KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE, which arm64 sets to
> > > > > > >>>> 40. Unused pages stay in the cache until the vCPU is destroyed.
> > > > > > >>>>
> > > > > > >>>> With 64 KiB pages, that is 2.5 MiB per vCPU, and most of it is never
> > > > > > >>>> used. Stage-2 has at most three levels and the root is preallocated, so
> > > > > > >>>> a fault needs at most two new table pages (kvm_mmu_cache_min_pages()).
> > > > > > >>>> As every last-level table covers 512 MiB, an 8 GiB guest needs just 17
> > > > > > >>>> table pages to map all of its memory, while its four vCPU caches get
> > > > > > >>>> filled with 160.
> > > > > > >>>>
> > > > > > >>>> On a production host with 64 KiB pages running 101 VMs with four vCPUs
> > > > > > >>>> each, the caches were still 86% full. The memory used:
> > > > > > >>>>
> > > > > > >>>>                         before      after
> > > > > > >>>>   per-vCPU capacity     2.5 MB     512 KB
> > > > > > >>>>   all 404 vCPUs         869 MB     <= 202 MB
> > > > > > >>>>
> > > > > > >>>> Let's lower the capacity to 8 with 64 KiB pages, In the production
> > > > > > >>>> usecase above, it frees at least 667 MB. That still covers the two-page
> > > > > > >>>> minimum and leaves room for several table allocations per refill. 4 KB
> > > > > > >>>> and 16 KB pages keep 40.
> > > > > > >>>>
> > > > > > >>>> The temporary cache in kvm_phys_addr_ioremap() uses the same capacity,
> > > > > > >>>> but it is topped up before every page it maps, so 8 is sufficient there
> > > > > > >>>> as well. The pKVM hypervisor memcache and the eager split cache don't
> > > > > > >>>> use this capacity.
> > > > > > >>>>
> > > > > > >>>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > > > > > >>>> ---
> > > > > > >>>>  arch/arm64/include/asm/kvm_types.h | 5 +++++
> > > > > > >>>>  1 file changed, 5 insertions(+)
> > > > > > >>>>
> > > > > > >>>> diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
> > > > > > >>>> index 9a126b9e2d7c99..28568da9ea4a7b 100644
> > > > > > >>>> --- a/arch/arm64/include/asm/kvm_types.h
> > > > > > >>>> +++ b/arch/arm64/include/asm/kvm_types.h
> > > > > > >>>> @@ -2,7 +2,12 @@
> > > > > > >>>>  #ifndef _ASM_ARM64_KVM_TYPES_H
> > > > > > >>>>  #define _ASM_ARM64_KVM_TYPES_H
> > > > > > >>>>
> > > > > > >>>> +/* Must cover kvm_mmu_cache_min_pages(), at most 2 with 64 KiB pages. */
> > > > > > >>>> +#ifdef CONFIG_ARM64_64K_PAGES
> > > > > > >>>> +#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 8
> > > > > > >>>> +#else
> > > > > > >>>>  #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
> > > > > > >>>> +#endif
> > > > > > >>>>
> > > > > > >>>>  #endif /* _ASM_ARM64_KVM_TYPES_H */
> > > > > > >>>>
> > > > > > >>>> --
> > > > > > >>>> 2.53.1-Meta
> > > > > > >>>>
> > > > > > >>>
> > > > > > >>> Hi Usama,
> > > > > > >>>
> > > > > > >>
> > > > > > >> Hello Leonardo,
> > > > > > >>
> > > > > > >>> Have you tried to reproduce this issue in v7.4-rc1 or newer?
> > > > > > >>
> > > > > > >> Yes. The patch is against kvmarm/next (v7.4-rc3), which includes
> > > > > > >> Lorenzo's pre-fault series, and I A/B tested it there.
> > > > > > >>
> > > > > > >> On unpatched v7.4-rc3 with 64 KiB pages, a VM whose 16 vCPUs each fault
> > > > > > >> in one page needs a single stage-2 table page, yet the vCPU caches hold
> > > > > > >> 640 pages (40 MiB). With the patch they hold 127 pages.
> > > > > > >>
> > > > > > >>>
> > > > > > >>> IIUC Lorenzo Stoakes introduced a change that would cause the memcache to
> > > > > > >>> skip topup if the cache contains a minimum of ~4 pages, so it can possibly
> > > > > > >>> improve that issue.
> > > > > > >>
> > > > > > >> I don't think that part is new. __kvm_mmu_topup_memory_cache() has
> > > > > > >> returned early when mc->nobjs >= min since commit 6926f95accee ("KVM:
> > > > > > >> Move x86's MMU memory cache helpers to common KVM code"). Lorenzo's
> > > > > > >> commit d27acc152c62 ("KVM: arm64: Size the stage-2 memcache from the
> > > > > > >> fault MMU") takes min from s2fd->mmu instead of vcpu->arch.hw_mmu. For a
> > > > > > >> guest abort that is the same MMU, so nothing changes here.
> > > > > > >>
> > > > > > >> With 64 KiB pages, min is kvm_mmu_cache_min_pages(), which is at most 2.
> > > > > > >>
> > > > > > >>>
> > > > > > >>> Although I can see that when it's below that minimum it fills the whole
> > > > > > >>> capacity (40) of the cache.
> > > > > > >>>
> > > > > > >>
> > > > > > >> Right, and that is the problem. Skipping the top-up avoids refilling
> > > > > > >> the cache, but nothing ever drains it. A vCPU's first fault fills its
> > > > > > >> cache to 40. Each last-level table covers 512 MiB, so a guest needs very
> > > > > > >> few table pages, and most vCPUs never drop below min. The remaining
> > > > > > >> pages stay allocated until the vCPU is destroyed, which is why the
> > > > > > >> production caches were still 86% full.
> > > > > > >>
> > > > > > >> The patch keeps the early return and only lowers how far a refill goes.
> > > > > > >
> > > > > > > Right,
> > > > > > >
> > > > > > > I took a look in the cache workings, and it does not seem to receive freed
> > > > > > > pages back in. It gets filled by topup and used by map, so IIUC it is used
> > > > > > > only to avoid failing an allocation during the mapping walk.
> > > > > > >
> > > > > > > Maybe it could be the case to simplify this cache to have the capacity
> > > > > > > about the same as the minimum (since it always topup before mapping) and
> > > > > > > avoid the waste altogether.
> > > > >
> > > > > Well the more you reserve the less frequent you'd need to actually allocate at
> > > > > topup, which saves time, so there's this trade-off to consider.
> > > > >
> > > > > Thanks,
> > > > > Wei-Lin Chang
> > > > >
> > > >
> > > > Hi Wei-Lin,
> > > >
> > > > IIUC, every time we topup, we call a mmu_memory_cache_alloc_obj() for every
> > > > one of the objects in the array. So as it is today it runs it 40 times, and
> > >
> > > Not necessarily, I meant with 40,
> > >
> > > if (mc->nobjs >= min)
> > > 	return 0;
> > >
> > > happens way more often.
> >
> > That's what I meant with 'waits until it runs down'. Basically we have
> >
> > if (mc->nobjs >= min)
> > 	return 0;
> >
> > while (mc->nobjs < mc->capacity) {
> > 	obj = mmu_memory_cache_alloc_obj(mc, gfp);
> > 	...
> >
> > So, first use it allocates mc->capacity entries, and every further topup
> > will return early unless it goes below min, when it populates again. The
> > only reason for a larger cache being more performant would be to use
> > that cache locality, which could indeed have a large impact, if we use this
> > cache a lot.
> 
> I think there's confusion because of this being called a cache, this is more
> pre-allocation than anything it seems. As per the comment above struct
> kvm_mmu_memory_cache in include/linux/kvm_types.h:
> 
>  * Memory caches are used to preallocate memory ahead of various MMU flows,
>  * e.g. page fault handlers.  Gracefully handling allocation failures deep in
>  * MMU flows is problematic, as is triggering reclaim, I/O, etc... while
>  * holding MMU locks.  Note, these caches act more like prefetch buffers than
>  * classical caches, i.e. objects are not returned to the cache on being freed.
> 
> The question is would going from 40 to 3 slow things down?
> 
> At 40 you do 40 __get_free_page() calls on topup for the _first_ fault that hits
> it, which adds latency to a random s2 fault (not great).
> 
> (If the fault doesn't in fact use a page table, this is only done once until a
> page table is next needed).
> 
> And then as 37 page tables are mapped, those ones don't get allocations at 38
> you go again...
> 
> With 3 in the cache you allocate up to 3 for each fault.
> 
> So in both cases you allocate the same amount of pages but in the 40 case it's
> all bunched up on one s2 fault with a jump in latency, in the 3 case it's spread
> out.
> 
> I'd say 3 is therefore the better choice.
> 
> Also, as mentioned elsewhere, you end up leaking pages once the S2 page tables
> are setup until the vCPU is destroyed, as nothing clears down the cache
> AFAICT. With 40 that's way more than with 3.
> 
> --
> Cheers, Lorenzo

Hi Lorenzo,

When I mention cache locality above, I mean the cpu cache. Running the same 
routine 40 times in a row can be faster since all instructions are already 
cached, and most of the data acessed by it could be local as well.

If you run it more often, it could be that something else used the 
cachelines and the cpu has to fetch them again from lower level caches or 
memory.

That being said, that's the only reason batch allocating 40 would be faster 
than 4 in the long run. For capacity=4, the number of 
mmu_memory_cache_alloc_obj() calls can be even smaller than capacity=40, 
since we don't leave unused pages in the kvm_mmu_memory_cache.


Thanks!
Leo

