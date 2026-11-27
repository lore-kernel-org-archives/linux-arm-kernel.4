Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23822606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OgKlvMjb;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tF4dse+7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wOSam9agbw1+dzF6MgDQrdgzWaJav+iyppZ1shM/GUA=; b=OgKlvMjbv0+YPB
	u3B/xv+S1J7cWoROcPB7+1IdgVUVmw+yAOv251P8j7MClw9AJIaeTRvsYZVsUuv3zILFXz5agw2xz
	zOeSdD7cLzU8XqaT4YkNuG1FW0bYL5f1e9zKEN6Vnrwcf6DW92zt3xtXJLHzTudrHwQg0RUL8bb50
	imuv6mSySHio4PsmzTlWsDwFfkwsqHLtQb1pBGNC78a+Z/uWroyVRdnJNBUxOLVQ5TpjVYuGulFdB
	aXpBjMfCR7BfxXar6qOZUjXlKbdrUmr2eBBFEd0QqYJglusarijNgtVygMxuxRZxXTdQ9JS7oBFoK
	stsBBTDVezvlqhczMQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuap-0000000FvQ5-16GE;
	Fri, 27 Nov 2026 11:58:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuan-0000000FvPX-068t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:58:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6781E1756;
	Fri, 27 Nov 2026 03:58:13 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C98EC3F632;
	Fri, 27 Nov 2026 03:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795780696; bh=xXErXhUett0rBMIuptXq/Dm31j/RK5+84KbmHuA57kQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tF4dse+7YvhP7rH5RzPUNzAGGI5TCy35roJFW+HWFcJt5TEkyG5bFhKgeIMf9Goq6
	 gWJ8yLjNdSs+NagBnpbSY9i7NtcwEd2ljuRrj9UhbQ8X8qEGpwuxd9cOtLXzTmP6wU
	 y3cfMWCwlQoS/kXesVN8c671I5aCxUmDZWiEvOq4=
From: Leonardo Bras <leo.bras@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
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
	Wei-Lin Chang <weilin.chang@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Usama Arif <usama.arif@linux.dev>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Top up the mmu memcache on user fault for NV
Date: Fri, 27 Nov 2026 11:58:04 +0000
Message-ID: <awlwTGHVjoO72YFw@LeoBrasDK>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-fix-nv-cache-topup-v1-1-a22c936872fe@kernel.org>
References: <20261126-fix-nv-cache-topup-v1-1-a22c936872fe@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_035817_136332_DD56E32D 
X-CRM114-Status: GOOD (  28.05  )
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

On Thu, Nov 26, 2026 at 05:28:29PM +0000, Lorenzo Stoakes (ARM) wrote:
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

Can you please expand on how would that happen?

IIUC when a guest hypervisor replaces a block mapping with a table, it 
calls a tlbi in the range, and L0 will trap and remove the Shadow S2 entry, 
then next access shouldn't be a permission but a translation fault.

What am I missing?

Thanks!
Leo

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
> ---
> base-commit: 012e4bc01e339a65dc7c59181b5efb33b171d12c
> change-id: 20261126-fix-nv-cache-topup-9ab1fd829014
> 
> Cheers,
> -- 
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 

