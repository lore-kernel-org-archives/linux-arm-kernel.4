Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD58606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pkZRvDQ2;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bN5x7BYj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JqX1UC6kwIb0brNhPGfSFAacJXmA2iM0S4sE9CFXj80=; b=pkZRvDQ2jogu6T
	3tLB7qWLaV7gh/cjbpP17+i9ACcnMC/G2mJQheon/LH/FZDG2uO7TUAo58qgq6cyiKgYIotjMymBN
	Bj2NvXhsqh+M0scit/kXalpCbQ8GYcUkcJ+LH2a0i+KuHm/e1OS7y8jOxrDhOHwxnVWuZLAW4JdBH
	ldaHjbnL1XX6tEipRLaIJWXpFfoDzO7mhaNLVGB4tWbQMg36oRQQVa7zpSvHorp/jdiwSjDqs+9G5
	s6IA0mUDA6Cm7jsvuSZmjCqJx/3Yx5upcuMVXhfsG2vfBqJzC3ssJT/k649/Fbd0kpg2XqqFeMH82
	ZvhZphEqDXhtsBHJe08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxn4-0000000GkpI-40JS;
	Fri, 27 Nov 2026 15:23:10 +0000
Received: from out-246.mta0.migadu.com ([2001:41d0:1004:224b::f6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxmc-0000000GkZd-3nhs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:22:44 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=jaHAG3arDq1i/w2Er13DYrLBHLaFInp5P2f0Du89gkg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795792960; v=1; x=1796397760;
 b=bN5x7BYj2oK08SzQHjqVYp64DRBjpUUZfEUYY9fjLfbpfsmSQZkZm7POVtIieOppUpkYTW4z
 8PfEY+pgs4FA2VtgugiGGxteSv++SQqbywZa2dYsYg/Q4MK8g3FsMLI3CW6RTIJja2+4y95gZ1v
 CK7NZzmvL+TNPthyBueRtRGE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 07c1014b8ba360ff;
	Fri, 27 Nov 2026 15:22:40 +0000
X-Mizu-Trace-ID: 07c1014b8ba360ff
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Jintack Lim <jintack.lim@linaro.org>,
	Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Top up the mmu memcache on user fault for NV
Date: Fri, 27 Nov 2026 07:22:36 -0800
Message-ID: <20261127152237.108363-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261126-fix-nv-cache-topup-v1-1-a22c936872fe@kernel.org>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_072243_157432_DFB0D0E6 
X-CRM114-Status: GOOD (  28.23  )
X-Spam-Score: -2.1 (--)
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

On Thu, 26 Nov 2026 17:28:29 +0000 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> The S2 user fault path tops up the MMU memcache (used for page table
> pre-allocation as the point at which page tables are installed may not
> allocate) except when:
> 
> * It's a permission fault AND
> * dirty page logging is disabled AND
> * pKVM is disabled
> 
> At which point it is assumed no page table will be allocated.
> 
> However nested virtualisation adds another edge case - the mapping size of
> a shadow S2 is clamped to that of the guest's own S2. If the guest
> hypervisor replaces a block mapping with a table, a permission fault on the
> shadow block has to be mapped at PAGE_SIZE, which requires a page table to
> collapse the block into.
> 
> With the memcache empty, kvm_mmu_memory_cache_alloc() hits its
> guest-triggerable WARN_ON(!nobjs) and falls back to a GFP_ATOMIC allocation
> under mmu_lock, with a BUG_ON() if that fails.
> 
> Therefore, also top up the memcache for permission faults taken on a
> shadow S2.
> 
> Note that dirty logging had a similar issue, addressed in commit
> 56fd1fc526e6 ("KVM: arm64: Top up stage-2 memcache for dirty logging
> faults").
> 
> Fixes: fd276e71d1e7 ("KVM: arm64: nv: Handle shadow stage 2 page faults")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  arch/arm64/kvm/mmu.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index a0d4981ebb99..e09a8f2c0482 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2256,16 +2256,18 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
>  
>  	/*
>  	 * Permission faults just need to update the existing leaf entry,
> -	 * and so normally don't require allocations from the memcache. The
> -	 * only exception to this is when dirty logging is enabled at runtime
> +	 * and so normally don't require allocations from the memcache. One
> +	 * exception to this is when dirty logging is enabled at runtime
>  	 * and a fault needs to collapse a block entry into a table.
>  	 * Under pKVM a permission fault can also collapse pages into a block,
>  	 * which needs a fresh mapping object, and the hypervisor requires the
>  	 * min-pages memcache even when the install allocates nothing.
> +	 * With nested, a shadow stage-2 block may also need to be collapsed
> +	 * into a table if the guest's own stage-2 mapping has become smaller.
>  	 */
>  	memcache = get_mmu_memcache(s2fd->vcpu);
>  	if (!perm_fault || memslot_is_logging(s2fd->memslot) ||
> -	    is_protected_kvm_enabled()) {
> +	    is_protected_kvm_enabled() || s2fd->nested) {
>  		ret = topup_mmu_memcache(s2fd->mmu, memcache);
>  		if (ret)
>  			return ret;
> 

Thanks for the fix!

On the narrow condition being the smaller backport: I don't think it
is. The hunk already conflicts on 7.3, where topup_mmu_memcache() still
takes the vCPU, and the condition looks different on 7.2 and older, so
every stable tree needs a small manual backport either way.

A permission fault can also allocate outside NV. For example, take an
exec permission fault on a THP block, where the VMM replaces that
memory with 64K hugetlb pages before the fault looks up the VMA:

  - the MMU notifier unmaps the block, and mmu_seq is read afterwards
  - kvm_s2_resolve_vma_size() forces PAGE_SIZE for the CONT_PTE hugetlb
  - PAGE_SIZE != perm_fault_granule, so kvm_pgtable_stage2_map() runs
    and allocates a table, with no top-up

That one is narrow and VMM-driven, but topping up for every fault would
cover it too, and it costs a single comparison when the cache already
holds enough pages.

> ---
> base-commit: 012e4bc01e339a65dc7c59181b5efb33b171d12c
> change-id: 20261126-fix-nv-cache-topup-9ab1fd829014
> 
> Cheers,
> -- 
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> 

