Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC7E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YZ2AMpi1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMChBDIA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jescsUkes2QFQWyyttwwL8Nt/WJGS0QXhdc4/7nVKT8=; b=YZ2AMpi1/3CSOOUNg8GP9hsA9S
	fjsIEXt1SRqsJbL3cHsc0Xb+eDm2fR7cD9Py1c7glFup6ZH7Q843ZWlqa2AcUug+bmT1Th5/oDnZC
	8BGfVRQEYXAGlVpBhofMGdgb1Ngvtxi3s/h8wC5VETiJ8WzQP1Dk4RUkelHsjdAhjC6Yhc5sKCraR
	9rl/7clWrqEcXp2e9hWM/BmYaCjiO8RTeBfILtj9L3J+a2ROxnp9YVxhK6Pqleh0cM3f+If2NjVKJ
	j1ELvdXxL9lhYAehn8AXRc3Sq+IKZVmLfhDiJrIXFgwKl29MKEsP+POuYZKlL5QlXdDY84H3OBaO4
	TuYs9z+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcjE-0000000DyZv-1lL1;
	Thu, 26 Nov 2026 16:53:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcjC-0000000DyZj-1jOk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:53:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EB81453E9;
	Thu, 26 Nov 2026 16:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132101F000C4;
	Thu, 26 Nov 2026 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712026;
	bh=jescsUkes2QFQWyyttwwL8Nt/WJGS0QXhdc4/7nVKT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hMChBDIApf9PLoC6cY0Q1AsnpXNAZ1eRooAx8LLwTcLu1YgO55r6j7UIzJ8GS4sdg
	 GHkWl5xtpNt44LZm9/J+8UTskmxQ37d1XNo3LsKnQMSAUOOcfK+SMTkACTcRXL2MKs
	 l3fQvrz8AwptfS71LsCoqky0zbU5myn2w4xJklzPAcLi3tKMTzsjDLeVwSNgIIxOJE
	 e3ktojUqTIFAT/QaLCHUgixZNciBHh63Ht5sgmzEhoc4r19S9QKi6YWae+Tcrg0Wpc
	 9Zjy5kIYTDpilzTqVBnqm7dv3ZfjIp7WjgCOjZ3SRBwX4UuSjiupZA1DlGUEaXhMAt
	 GSbi+pSdX7Jlg==
Date: Thu, 26 Nov 2026 16:53:38 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Usama Arif <usama.arif@linux.dev>, Leonardo Bras <leo.bras@arm.com>, 
	maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, riel@surriel.com, 
	shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com, atish.patra@linux.dev, 
	dgreid@meta.com
Subject: Re: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
Message-ID: <awhj98o6vqTqXX7D@gremlin>
References: <20261124152842.2634495-1-usama.arif@linux.dev>
 <awcXhk885lqDRAHy@LeoBrasDK>
 <06a69a4f-59bb-49b8-9ed0-f4cfe0ecad37@linux.dev>
 <awcoCklLOKeuXPhh@LeoBrasDK>
 <e7bdcfa9-bbd8-4649-8318-2f6dc236db15@linux.dev>
 <4jxdf2pkuu2f7dftvf6ltpv27jctfuvvrfcrbfxudsgnp3hdfk@taur55wftexq>
 <awhH1Dpu0uIwP6ea@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awhH1Dpu0uIwP6ea@gremlin>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 04:30:24PM +0000, Lorenzo Stoakes (ARM) wrote:
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

Given this is pre-existing, let me send a patch to fix this separately.

--
Cheers, Lorenzo

