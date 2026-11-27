Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE22606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kxTaguwg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWXGJ3nQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XJ6dLcJRyw1jE4cTwzDI4SNKKPQCPwBuOoGOfwsnKrY=; b=kxTaguwghcuYj4HmVmhmYuqQkP
	IX7bAqfFYI1DarbhRBoPagGjB+plw4wCCd64aMm/1glpxZ9ORf8Bo8paD5gxhQ5WAoOjRqQZmLE+G
	QGqcGBhfPr17vQJ73hGM5JEcFNze5nem6MXAu+Qm1JgBJZ64hZH6uYV7ylqwa930c0K4dhh0kMLI8
	hcqws7no7qh8tO54hddfvv7Ec1OS9CxDcJkxgh8NRx6xtgjTT/iUuFvCIU2JD0AK1NaB6uk9fJF2w
	4fTkX64bPC8rY+6KespCvr9q0wTFzDP+9VdBW6AmgSF4J5sbOhcwq0MuDcb0k/o+o/6QpIXXFO3PS
	zhmJ/JbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxjU-0000000GjkV-2P3G;
	Fri, 27 Nov 2026 15:19:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxjP-0000000Gjj5-2UcR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:19:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43C9D400E6;
	Fri, 27 Nov 2026 15:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12651F0089F;
	Fri, 27 Nov 2026 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792762;
	bh=XJ6dLcJRyw1jE4cTwzDI4SNKKPQCPwBuOoGOfwsnKrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FWXGJ3nQsND/tE+euJfiLObEgVXBMerVS1ZjYjurXkHJ1WWim3atpwkN0ekU02UGE
	 JluiFAZbt66CCzvmr3k3eY6PdtQgrbjLDZ4QDPB4dGYTLDxOSWyOVaT0J57xpUFfbE
	 QCzNhwE2vj2vCcH3Q3fTICbrOnkmMbTw/PPsqcpjqMGfUMiMSDVHJlNJMKM9ZsLnfe
	 q76ZMiHrukIwb/AFj6g/DRa6/fCzrs+3Vf6yjg5Jxnllut8plQkO/bKM2PXZvH+l1v
	 1xSzVmxh5cvdAX1hxDXN6/2kZxLK60RayFhBuyK7F9kRBmQD4IiAOl9Syaw/td8xZh
	 bvOiQuZWdS6sQ==
Date: Fri, 27 Nov 2026 15:19:16 +0000
From: Will Deacon <will@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, rafael@kernel.org, mark.rutland@arm.com,
	lenb@kernel.org, pavel@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, thierry.reding@kernel.org,
	rppt@kernel.org
Subject: Re: [PATCH v1 3/4] arm64: mm: Introduce linear_map_needs_set() helper
Message-ID: <awmfdBx229aZCn9Y@willie-the-truck>
References: <20260918131656.3710047-1-vdonnefort@google.com>
 <20260918131656.3710047-4-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918131656.3710047-4-vdonnefort@google.com>
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

On Fri, Sep 18, 2026 at 02:16:55PM +0100, Vincent Donnefort wrote:
> can_set_direct_map() is intended as an external query function, but is
> also being called internally by map_mem() to initialise
> linear_map_requires_bbml3, duplicating the feature checks already
> present in force_pte_mapping().
> 
> Factor the list of features that require modifying linear map attributes
> into a shared helper linear_map_needs_set().
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  arch/arm64/include/asm/mmu.h |  1 +
>  arch/arm64/mm/mmu.c          | 22 ++++++++++++++++++++--
>  arch/arm64/mm/pageattr.c     | 12 +-----------
>  3 files changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 5e1211c540ab..12ed21e2d0d7 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -70,6 +70,7 @@ extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
>  			       pgprot_t prot, bool page_mappings_only);
>  extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
>  extern void mark_linear_text_alias_ro(void);
> +extern bool linear_map_needs_set(void);
>  extern int split_kernel_leaf_mapping(unsigned long start, unsigned long end);
>  extern void linear_map_maybe_split_to_ptes(void);
>  
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 79d90226fd5d..c18ed601f0a8 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -776,6 +776,24 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>  	return ret;
>  }
>  
> +/*
> + * True if the linear map needs to be modified for one of the following
> + * features:
> + *
> + * rodata_full and DEBUG_PAGEALLOC need to protect/unprotect pages in
> + * the linear map.
> + *
> + * KFENCE pool needs to protect/unprotect pages in the linear map if
> + * initialized late.
> + *
> + * Realms need to mark pages shared/protected in the linear map.
> + */
> +bool linear_map_needs_set(void)
> +{

nit: I'm not a big fan of this function name, but see below.

> +	return rodata_full || debug_pagealloc_enabled() ||
> +	       arm64_kfence_can_set_direct_map() || is_realm_world();
> +}
> +
>  static inline bool force_pte_mapping(void)
>  {
>  	const bool bbml3 = system_capabilities_finalized() ?
> @@ -785,7 +803,7 @@ static inline bool force_pte_mapping(void)
>  		return true;

This 'return true' above is part of a check for debug_pagealloc_enabled(),
which is now redundant because you've added that to linear_map_needs_set().

>  	if (bbml3)
>  		return false;
> -	return rodata_full || arm64_kfence_can_set_direct_map() || is_realm_world();
> +	return linear_map_needs_set();
>  }
>  
>  static DEFINE_MUTEX(pgtable_split_lock);
> @@ -1203,7 +1221,7 @@ static void __init map_mem(void)
>  
>  	arm64_kfence_map_pool();
>  
> -	linear_map_requires_bbml3 = !force_pte_mapping() && can_set_direct_map();
> +	linear_map_requires_bbml3 = !force_pte_mapping() && linear_map_needs_set();

That looks pretty odd now that force_pte_mapping() calls
linear_map_needs_set() under the hood.

I wonder if you should avoid introducing the new function and just put
the logic in force_pte_mapping() instead? You could rename it to
linear_map_force_pte_mapping().

Then map_mem() just needs to check force_pte_mapping() whereas
can_set_direct_map() is force_pte_mapping() || has_bbml3().

Will

