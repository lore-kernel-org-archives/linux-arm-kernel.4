Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E31606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 06:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gDqQsZLf;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Di93BNen
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G0zRAkGF+KSljQO9yS6uVarLN8Ga3GC3k9CquE6CytE=; b=gDqQsZLfhFNqOXkytQbvDmXvIK
	LJJkrCH5uodZeWyzMVFyueaJ5oAUbO50S1Io2abjawR+qdnOvGoN6Fm9uPAqROspHDko2HC3LtBnc
	rSo2PW+sn5Kvrqqv6hW5qcnz+efhupmm0LK7IjJXOtMawG3pzMeQej0Zmkm1qjvDtwEvmAb0/ysZ5
	m5zc7gksxz298Fg4j70szdyWEQ30sUhbaUELEQNv5yAmxMM+GOjfUVOfouXBFXM4u2w6AcKwaxJxc
	Tx6RzmUSOgrFSHjIAXhYu4py0RRolofer+lJ1BJVBrdRji3q9lNqLoJj8P7wADsrPefd2CtlpSmXH
	/6NFRIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIDj-0000000EAEj-0JBA;
	Fri, 20 Nov 2026 06:35:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIDa-0000000EADc-4Bec
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 06:35:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CA231596;
	Thu, 19 Nov 2026 22:35:24 -0800 (PST)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A5F23F673;
	Thu, 19 Nov 2026 22:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795156527; bh=9NBvwpZWWadQFsksHSrJpVxb+kXxaiMwW0jNcvt09fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Di93BNenvzv0wKdOUq8XuyZIWeSMqudpmup+ZeGHxESB3mFad4ROccBlHY+KY1RMq
	 YmpSudlqMEGiUgBwc4t4ChCNRiUewCRr+yAnqnYnQ9lahA7yJhyNWy/UyUcdIbcCt2
	 VKbK6kzV42daCTPUI60IKJmjJeTXTuFCc4qYwvKo=
Date: Fri, 20 Nov 2026 06:35:12 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steffen Eiden <seiden@linux.ibm.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: nv: Fix guest stage-2 mapping leak on
 sub-block unmap
Message-ID: <iyfa5sagkdapb4plle575uhbxbmjdcxvbe35nnlxkqzfqnztqd@mmweqvqmil6x>
References: <20261119185105.626343-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119185105.626343-1-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_223531_206451_9F558204 
X-CRM114-Status: GOOD (  36.53  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 06:51:05PM +0000, Colton Lewis wrote:
> When a shadow stage-2 block mapping (for example, 2M at PMD level) is
> partially invalidated by a smaller guest unmap such as a 4K TLBI
> IPAS2E1IS, kvm_pgtable_stage2_unmap() shatters and clears the entire

"shatters" sounds like it breaks the block into page mappings, so maybe
just "clears the entire block.."?

> block descriptor in mmu->pgt. However, kvm_remove_guest_s2_mappings()

nit: I think "the shadow page table" is clearer than "mmu->pgt"

> only removes a struct kvm_guest_s2_mapping node when its entire
> [nested_start, nested.last] span lies within the unmap range. As a
> result, every sub-block invalidation followed by a re-fault leaks a

Doesn't the block tracking node get leaked regardless of whether a
re-fault happens?

> stale block-sized tracking node in mmu->guest_s2_mappings and
> kvm->arch.mmu.guest_s2_mappings until the shadow MMU is destroyed,
> allowing an L1 guest to grow host kernel memory and degrade subsequent
> TLBI IPAS2E1IS walks to O(N) under write_lock(&kvm->mmu_lock).
> 
> Conversely, unconditionally removing any overlapping tracking node on a
> sub-block unmap would be unsafe when a shadow block mapping has been
> split into a child table (such as on a page-granule fault under dirty
> logging or a racing shared walk returning -EAGAIN), because sibling
> sub-page PTEs outside the unmapped range remain live in mmu->pgt and

What are sub-page PTEs? :P

> still rely on the block-sized tracking node for host MMU notifier
> unmaps.
> 
> Since stage2_unmap_walker() unlinks empty child page tables in
> KVM_PGTABLE_WALK_TABLE_POST as soon as their last valid entry is
> cleared, check mmu->pgt via kvm_pgtable_get_leaf() on partial-overlap
> candidates: when no valid entry or split sub-table remains at or below
 
You use "or" here.                ^^

> the recorded mapping granule (!kvm_pte_valid(pte) &&

but this is an AND?                                 ^^
so I don't quite understand.

> kvm_granule_size(level) >= map_size), remove and free the tracking node;
> otherwise retain it to cover surviving split sub-entries.

"sub-entries" doesn't really make sense to me..
Maybe "... to cover other entries within the range"?

For this third paragraph can you improve it by stating how the problem
is fixed upfront? The first two paragraphs describe the problem, then
you started to talk about stage2_unmap_walker all of a sudden (which I'm
not sure how much it helps), and the fix itself is not emphasised. The
combination makes it pretty difficult to get what the patch is doing.

> 
> In addition, suppress exact-match duplicate insertions in
> kvm_record_guest_s2_mapping() when concurrent faults or -EAGAIN retries
> record an identical (nested, canonical) range on the same shadow MMU.

I believe this is better split into its own patch, it's doing another
thing.

> 
> Fixes: 5491980c1a41 ("KVM: arm64: nv: Track guest stage-2 mapping removal")
> Fixes: c2778d14cd2f ("KVM: arm64: nv: Track guest stage-2 mapping creation")

Since there isn't a real bug in the original implementation do we need
these tags?

> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm64/kvm/nested.c | 68 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 61 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 4d83281a7a28b..2b1c85de5b719 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -896,6 +896,30 @@ static unsigned long s2_mapping_to_nested_start(struct kvm_guest_s2_mapping *map
>  	return mapping->nested.start & ~S2_MMU_IDX_MASK;
>  }
>  
> +static bool guest_s2_mapping_exists(struct kvm_s2_mmu *mmu,
> +				    struct kvm_guest_s2_mapping *mapping)
> +{
> +	struct interval_tree_node *node;
> +
> +	for (node = interval_tree_iter_first(&mmu->guest_s2_mappings,
> +					     mapping->nested.start,
> +					     mapping->nested.last);
> +	     node;
> +	     node = interval_tree_iter_next(node, mapping->nested.start,
> +					    mapping->nested.last)) {
> +		struct kvm_guest_s2_mapping *curr;
> +
> +		curr = container_of(node, struct kvm_guest_s2_mapping, nested);
> +		if (curr->nested.start == mapping->nested.start &&
> +		    curr->nested.last == mapping->nested.last &&
> +		    curr->canonical.start == mapping->canonical.start &&
> +		    curr->canonical.last == mapping->canonical.last)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  void kvm_record_guest_s2_mapping(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
>  				 gpa_t nested_ipa, size_t map_size,
>  				 struct kvm_guest_s2_mapping *mapping)
> @@ -915,9 +939,32 @@ void kvm_record_guest_s2_mapping(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
>  
>  	tag_s2_mapping_mmu(mapping, mmu);
>  
> -	guard(spinlock)(&kvm->arch.guest_s2_tracking_lock);
> -	interval_tree_insert(&mapping->nested, &mmu->guest_s2_mappings);
> -	interval_tree_insert(&mapping->canonical, &kvm->arch.mmu.guest_s2_mappings);
> +	scoped_guard(spinlock, &kvm->arch.guest_s2_tracking_lock) {
> +		if (!guest_s2_mapping_exists(mmu, mapping)) {
> +			interval_tree_insert(&mapping->nested,
> +					     &mmu->guest_s2_mappings);
> +			interval_tree_insert(&mapping->canonical,
> +					     &kvm->arch.mmu.guest_s2_mappings);
> +			mapping = NULL;
> +		}
> +	}
> +
> +	kfree(mapping);

In my understanding kfree() can be called while holding locks, so we
don't need the extra level of indentation.

> +}
> +
> +static bool guest_s2_mapping_unmapped(struct kvm_s2_mmu *mmu,
> +				      gpa_t nested_start, size_t map_size)
> +{
> +	kvm_pte_t pte;
> +	s8 level;
> +
> +	if (!mmu->pgt)
> +		return true;
> +
> +	if (kvm_pgtable_get_leaf(mmu->pgt, nested_start, &pte, &level, 0))
> +		return false;
> +
> +	return !kvm_pte_valid(pte) && kvm_granule_size(level) >= map_size;
>  }
>  
>  void kvm_remove_guest_s2_mappings(struct kvm_s2_mmu *mmu, gpa_t nipa,
> @@ -937,17 +984,24 @@ void kvm_remove_guest_s2_mappings(struct kvm_s2_mmu *mmu, gpa_t nipa,
>  	node = interval_tree_iter_first(&mmu->guest_s2_mappings, nipa, nipa_end);
>  	while (node) {
>  		unsigned long nested_start;
> +		size_t map_size;
>  
>  		next = interval_tree_iter_next(node, nipa, nipa_end);
>  		mapping = container_of(node, struct kvm_guest_s2_mapping,
>  				       nested);
>  		/*
> -		 * Tracking must be conservative on removal, only remove
> -		 * mappings that are within the unmap range.
> +		 * A sub-block unmap tears down an unsplit shadow block entry
> +		 * in mmu->pgt, whereas a split block may still have valid

Does "split block" make sense? Either it is a block mapping or a page
mapping.

> +		 * sub-page entries outside [nipa, nipa_end]. Remove the

Same "sub-page entries" wording issue here.

Thanks,
Wei-Lin Chang

> +		 * tracking entry when it lies within the unmap range or no
> +		 * mappings remain across its span in mmu->pgt.
>  		 */
>  		nested_start = s2_mapping_to_nested_start(mapping);
> -		if (nipa <= nested_start && nipa_end >= mapping->nested.last) {
> -			interval_tree_remove(&mapping->nested, &mmu->guest_s2_mappings);
> +		map_size = mapping->nested.last - nested_start + 1;
> +		if ((nipa <= nested_start && nipa_end >= mapping->nested.last) ||
> +		    guest_s2_mapping_unmapped(mmu, nested_start, map_size)) {
> +			interval_tree_remove(&mapping->nested,
> +					     &mmu->guest_s2_mappings);
>  			interval_tree_remove(&mapping->canonical,
>  					     &kvm->arch.mmu.guest_s2_mappings);
>  			kfree(mapping);
> 
> base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
> -- 
> 2.56.1.809.ga0b61035b5-goog
> 

