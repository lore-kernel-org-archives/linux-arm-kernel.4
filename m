Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B228B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 18:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wmr20osJ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Je0Mdsbd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bj4+x/3jTGrE6j1eYnQVndDt9++uqEPd6Eo9k84G1+E=; b=wmr20osJisg8nW
	CNVhvvy1ndtmt4WyFYYovTkxL1nmpXg2dl/wmp6CmKU5Toq4pAyGf76eFR+cB5vtQH27M8OQ+bhvZ
	ARcOYmrhioK5ankI77Esi7il/GxPMwYU3lKdKXwkqbW2XWXRUGWQsXo1DdKHtcsQQae1zA5EYXDiI
	/NJOOZZWZBoL1KWIMDtbLTka7j3qp779IeZZM35yJhBHXlLaTkw5Sla9BCt6dhQc7rU7/3LyyBBGO
	TjqptC2Zzoa2T5DIUKA1OQ2dDkRnQawdYXXtrPIAY6oefhn23bkwxX/x8MpfT2Hvnj0VZkkBsEXqx
	QjqKjRw/ULF11HgwabKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeAK-0000000EAZf-279p;
	Thu, 26 Nov 2026 18:25:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeAH-0000000EAZI-44RN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:25:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02AE01BA8;
	Thu, 26 Nov 2026 10:25:46 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DBAA3F86F;
	Thu, 26 Nov 2026 10:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795717548; bh=GiKtgn7DHjTTfDcaqNTXOJ1psaIV4TjTMvo1j3H+/kE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Je0MdsbddLRqNK+v70Psh6QmVf7hLVpdfR/7S7YuKRuEjUgTTjRvNxAiO9QTkmxBl
	 QtaLIBapNJSbrbom6CZqQWJjiRVGo4VWvta1+OpfwdgyY4FZp1NPo5iVlQxMFg4oik
	 oXv6qU1/2Ry9AJ7RZvDySQNFTpYRlPlOlPfGDfLY=
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
Date: Thu, 26 Nov 2026 18:25:43 +0000
Message-ID: <awh5pmXCbNoFP5Ez@LeoBrasDK>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <awhH1Dpu0uIwP6ea@gremlin>
References: <20261124152842.2634495-1-usama.arif@linux.dev> <awcXhk885lqDRAHy@LeoBrasDK> <06a69a4f-59bb-49b8-9ed0-f4cfe0ecad37@linux.dev> <awcoCklLOKeuXPhh@LeoBrasDK> <e7bdcfa9-bbd8-4649-8318-2f6dc236db15@linux.dev> <4jxdf2pkuu2f7dftvf6ltpv27jctfuvvrfcrbfxudsgnp3hdfk@taur55wftexq> <awhH1Dpu0uIwP6ea@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_102550_105286_F2D86E1D 
X-CRM114-Status: GOOD (  70.05  )
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

On Thu, Nov 26, 2026 at 04:30:24PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Thu, Nov 26, 2026 at 08:06:41AM +0000, Wei-Lin Chang wrote:
> > On Wed, Nov 25, 2026 at 09:42:33PM +0000, Usama Arif wrote:
> > > On 25/11/2026 10:25, Leonardo Bras wrote:
> > > > On Wed, Nov 25, 2026 at 05:55:29PM +0000, Usama Arif wrote:
> > > >> Right, and that is the problem. Skipping the top-up avoids refilling
> > > >> the cache, but nothing ever drains it. A vCPU's first fault fills its
> > > >> cache to 40. Each last-level table covers 512 MiB, so a guest needs very
> > > >> few table pages, and most vCPUs never drop below min. The remaining
> > > >> pages stay allocated until the vCPU is destroyed, which is why the
> > > >> production caches were still 86% full.
> > > >>
> > > >> The patch keeps the early return and only lowers how far a refill goes.
> > > >
> > > > Right,
> > > >
> > > > I took a look in the cache workings, and it does not seem to receive freed
> > > > pages back in. It gets filled by topup and used by map, so IIUC it is used
> > > > only to avoid failing an allocation during the mapping walk.
> > > >
> > > > Maybe it could be the case to simplify this cache to have the capacity
> > > > about the same as the minimum (since it always topup before mapping) and
> > > > avoid the waste altogether.
> 
> Yeah, I really feel this 40 number (derived from x86 as double some other magic
> number :) is bogus here and a historic artifact.
> 
> I think this is all a great chance to simplify here :) we can address Usama's
> concerns at the same time as making all this actually make sense.

Yeah, agree!

> 
> >
> > Well the more you reserve the less frequent you'd need to actually allocate at
> > topup, which saves time, so there's this trade-off to consider.
> 
> Hmm, but the topup is allocating anyway either way no matter the reserve right?
> 
> kvm_mmu_memory_cache_alloc() grabs from mc->objects and decrements mc->nobjs for
> every allocation (N objects in total), and __kvm_mmu_topup_memory_cache() tops
> up N objects back up to the reserve, wherever that should be.
> 
> So the only question really is what can the maximum N be? And right now this is
> guesstimated at by a magic number.
> 
> Also, if it turns out it does:
> 
> [ topup X pages ] [ use X pages ] [ topup X pages ]
> 
> And you have X + Y pages in the cache, that actually means you have uselessly
> allocated Y pages sat around doing nothing that are leaked until the vCPU is
> destroyed AFAICT.
> 
> I think though as per Leo, we should avoid using a magic number.
> 
> And as per Marc, we should calculate what this number should be sensibly.
> 
> So something like what Leo suggested is the right way to go!
> 

:)

> > > >
> > > > Maymbe having something like this should be enough?
> > > >
> > > > #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE (KVM_PGTABLE_LAST_LEVEL - KVM_PGTABLE_FIRST_LEVEL)
> > > >
> 
> I think this is definitely the right approach!
> 
> > >
> > > That sounds good to me. I tested and it works (and releases even more memory :))
> > >
> > > I had to move #defines around to make it work, the current patch sits
> > > like below. If this seems acceptable, I can send it as v2 for review.
> > >
> > >
> > > >From 9b044379f470625adb031a0ee7529e054d9ec219 Mon Sep 17 00:00:00 2001
> > > From: Usama Arif <usama.arif@linux.dev>
> > > Date: Wed, 25 Nov 2026 12:55:15 -0800
> > > Subject: [PATCH] KVM: arm64: Shrink the stage-2 memcache to the page-table
> > >  depth
> > >
> > > When a stage-2 fault may need new page tables, KVM first tops up the
> > > vCPU's memcache: if it holds fewer pages than the fault might need, it
> > > is refilled to KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE, which arm64 sets to
> > > 40. Pages never return to the cache, and unused ones stay there until
> > > the vCPU is destroyed.
> > >
> > > The cache only has to cover a single map: every fault that can allocate
> > > tables tops it up first, and a map allocates at most one table per
> > > level below the preallocated root (kvm_mmu_cache_min_pages()). That is
> > > at most three pages with 4 KiB and 16 KiB pages, and two with 64 KiB
> > > pages.
> 
> Yes this seems correct.
> 
> > >
> > > With 64 KiB pages, the 40-page cache is 2.5 MiB per vCPU. As every
> > > last-level table covers 512 MiB, an 8 GiB guest needs just 17 table
> > > pages to map all of its memory, while its four vCPU caches get filled
> > > with 160. On a production host with 64 KiB pages running 101 VMs with
> > > four vCPUs each, the caches were still 86% full. The memory used:
> > >
> > >                         before      after
> > >   per-vCPU capacity     2.5 MiB     256 KiB
> > >   all 404 vCPUs         869 MiB     <= 101 MiB
> > >
> > > Let's size the cache to KVM_PGTABLE_LAST_LEVEL - KVM_PGTABLE_FIRST_LEVEL,
> > > which is 4 pages and covers the deepest walk with one page to spare. On
> 
> Hmm why would you need 1 page to spare?

I think this means for the case that the PGD is already allocated, or that 
64k pages need an extra level in any case.

Can you please confirm which, Usama?

> 
> > > the host above, it frees at least 768 MiB. Refills get more frequent,
> > > but no more than four pages per vCPU ever sit unused. With 4 KiB pages,
> > > the cache shrinks from 160 KiB to 16 KiB per vCPU.
> > >
> > > Move the two level definitions to asm/kvm_types.h, so that the generic
> > > top-up code in kvm_main.c can see them. kvm_pgtable.h still gets them
> > > through linux/kvm_types.h.
> > >
> > > The temporary cache in kvm_phys_addr_ioremap() uses the same capacity,
> > > but it is topped up before every page it maps. The pKVM hypervisor
> > > memcache and the eager split cache don't use this capacity.
> > >
> > > Suggested-by: Leonardo Bras <leo.bras@arm.com>
> > > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > > ---
> > >  arch/arm64/include/asm/kvm_pgtable.h | 3 ---
> > >  arch/arm64/include/asm/kvm_types.h   | 7 ++++++-
> > >  2 files changed, 6 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > > index eda440354a55ec..691e2eb63939f5 100644
> > > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > > @@ -19,9 +19,6 @@
> > >
> > >  struct kvm_s2_mmu;
> > >
> > > -#define KVM_PGTABLE_FIRST_LEVEL		-1
> > > -#define KVM_PGTABLE_LAST_LEVEL		3
> > > -
> > >  /*
> > >   * The largest supported block sizes for KVM (no 52-bit PA support):
> > >   *  - 4K (level 1):	1GB
> > > diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
> > > index 9a126b9e2d7c99..5b61285d317e28 100644
> > > --- a/arch/arm64/include/asm/kvm_types.h
> > > +++ b/arch/arm64/include/asm/kvm_types.h
> > > @@ -2,7 +2,12 @@
> > >  #ifndef _ASM_ARM64_KVM_TYPES_H
> > >  #define _ASM_ARM64_KVM_TYPES_H
> > >
> > > -#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
> > > +#define KVM_PGTABLE_FIRST_LEVEL		-1
> > > +#define KVM_PGTABLE_LAST_LEVEL		3
> > > +
> 
> The -1 isn't needed here at all right? So why not just import
> KVM_PGTABLE_LAST_LEVEL and do:
> 
> #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE       KVM_PGTABLE_LAST_LEVEL
> 
> ?

Well, it kind of is :)
The lowest level we have in a PGTABLE is level -1. (See RKSBQV)

It could now be mathematically correct, but it could break in the future if 
we got a level-2, for instance. We could have (LAST - FIRST - 1), if that 
one page makes any diference.


> 
> > > +/* One page per level below the root covers kvm_mmu_cache_min_pages(). */
> > > +#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE	\
> > > +	(KVM_PGTABLE_LAST_LEVEL - KVM_PGTABLE_FIRST_LEVEL)
> > >
> > >  #endif /* _ASM_ARM64_KVM_TYPES_H */
> > >
> > > --
> > > 2.53.1-Meta
> > >
> > >
> > >
> > > > Thanks!
> > > > Leo
> > >
> >
> 
> I also think actually there's an existing problem with the top-up right now in
> user_mem_abort() that needs addressing too, actually, that this change exposes
> and will cause bugs if done as above.
> 
> So right now top-up is conditional there:
> 
> 	if (!perm_fault || memslot_is_logging(s2fd->memslot) ||
> 	    is_protected_kvm_enabled()) {
> 		ret = topup_mmu_memcache(s2fd->mmu, memcache);
> 		if (ret)
> 			return ret;
> 	}
> 
> Inverted is 'permission fault && !dirty-logging && !pKVM'. So the question is
> whether a permission fault not needing a new page table is correct.
> 

IIUC you have the page, but it has a different permission that caused the 
fault. Since you won't need a new page, it does not need to topup at this 
point.

Thanks!
Leo


> So working through, the actual decision about a page table allocation is done
> in:
> 
> user_mem_abort()
>   -> kvm_s2_fault_map()
>     -> kvm_pgtable_stage2_map()
>       -> ... -> stage2_map_walk_leaf()
>         -> stage2_map_walker_try_leaf()
> 	  -> stage2_leaf_mapping_allowed()
> 	    -> kvm_block_mapping_supported() [ if false, allocate a page table ]
> 
> static bool kvm_block_mapping_supported(const struct kvm_pgtable_visit_ctx *ctx, u64 phys)
> {
> 	u64 granule = kvm_granule_size(ctx->level);
> 
> 	...
> 
> 	if (granule > (ctx->end - ctx->addr))
> 		return false;
> 
> 	...
> }
> 
> But page table size can vary in NV between host and guest (guest must be >=
> host) and it gets clamped to the smaller of the two in kvm_s2_resolve_vma_size():
> 
> static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
> 				     struct kvm_s2_fault_vma_info *s2vi,
> 				     struct vm_area_struct *vma)
> {
> 	...
> 	if (s2fd->nested) {
> 		...
> 		/*
> 		 * If we're about to create a shadow stage 2 entry, then we
> 		 * can only create a block mapping if the guest stage 2 page
> 		 * table uses at least as big a mapping.
> 		 */
> 		max_map_size = min(kvm_s2_trans_size(s2fd->nested), max_map_size);
> 		...
> 	}
> }
> 
> This sets s2vi->vma_pagesize based on this value:
> 
> static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
> 				     struct kvm_s2_fault_vma_info *s2vi)
> {
> 	...
> 	s2vi->vma_pagesize = BIT(kvm_s2_resolve_vma_size(s2fd, s2vi, vma));
> 	...
> }
> 
> And the fault map uses this in the mapping size, which defines ctx->addr, end
> above in kvm_block_mapping_supported():
> 
> static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
> 			    const struct kvm_s2_fault_vma_info *s2vi,
> 			    enum kvm_pgtable_prot prot,
> 			    void *memcache,
> 			    struct kvm_s2_fault_result *result)
> {
> 	...
> 	mapping_size = s2vi->vma_pagesize;
> 	...
> 			ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), mapping_size,
> 							 __pfn_to_phys(pfn), prot,
> 							 memcache, flags);
> 	...
> }
> 
> So basically, if the host has smaller page table size than the guest, you need
> an extra page table level.
> 
> So simple solution is to add nested to the check:
> 
>         if (!perm_fault || memslot_is_logging(s2fd->memslot) ||
>             is_protected_kvm_enabled() || s2fd->nested) {
>                 ret = topup_mmu_memcache(s2fd->mmu, memcache);
>                 if (ret)
>                         return ret;
>         }
> 
> But honestly I wonder at this point if it's truly worth doing all these checks?
> Maybe safer to just topup unconditionally.
> 
> It'll only top up once before the cache is full anyway, so it's low cost. And
> would make more consistent with other fault paths too.
> 
> --
> Cheers, Lorenzo

