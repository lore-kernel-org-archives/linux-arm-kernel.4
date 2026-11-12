Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A490F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 22:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pYD4qIRU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e6t+iVAP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dVftfgY9h5Mmz62Tp5CN9A5dWL3JITYcqWVOdUje7V0=; b=pYD4qIRUtr0tF4iOpSDmbROm5I
	I5ViAr+eWaDCdgjcs3COnfZwG+Mrw8sW5jbJRyjyGIYHP1SL6WJUstnm5bZe4ANVUcoCSoGOntCXL
	qMd8FwoYD2ffaf38lN9t0v+Eh5jiwD8O6TrsZfPvSzklkRlunVY+gbYXqySzgaXzemEOW20O5Pmmv
	2ICGOoyu9mW8KN8Muoye6OYpTgVw/wXE4jSd2GCigY7j55aogba4Ex/iSUXhCb6ew2bN1NzEGKl6G
	wZu3KKHenpV5LU0ddMCTA4ck6Y0GVeKXMZePlUxncA6cRMoILJytV71dZrEUvTL/7I/H4MeGd2/WH
	Cn1pG63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdXu-0000000BCUs-426n;
	Thu, 12 Nov 2026 22:45:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdXt-0000000BCUc-2Rgy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 22:45:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BF8E8611D6;
	Thu, 12 Nov 2026 22:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A241F000C4;
	Thu, 12 Nov 2026 22:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794523528;
	bh=dVftfgY9h5Mmz62Tp5CN9A5dWL3JITYcqWVOdUje7V0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e6t+iVAPM072pXeZ2LfauFekXuJWPOAN7a4R3aCsw80dvEHdtL1gu3FFGcaBJngk0
	 o6Y3EJGbfN/i4qX0vOlEB12HGwRtZ7T2qWixSmnWQXhleyzNtUwZzxV8ae2cwKb755
	 t9gIkjjuU1fatIQGNgyjfpXWARC9GxzZ6PoQ3bBGhvKTuKW4G5c48C2PrEyALoKrL+
	 2Any6znXudNxWSrEVwvfXv+2WrZ2lXPtIHuabytxC1T1p0BP7p6IqdFPrb4z949zhG
	 3tQlO8jSk+fMAU58QWAeaX9MsNQ4ZvAAg+ZAauxDRzf16UP0Ho3ucNc52NrKbt4C+A
	 WoXrglz9k9kjw==
Date: Thu, 12 Nov 2026 14:45:21 -0800
From: Oliver Upton <oupton@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev
Subject: Re: [PATCH v2] KVM: arm64: Fast fail transparent_hugepage_adjust()
 for non-PMD folios
Message-ID: <avZBgRLTFOQVh5LZ@kernel.org>
References: <20261112113729.2858513-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112113729.2858513-1-vdonnefort@google.com>
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

On Thu, Nov 12, 2026 at 11:37:29AM +0000, Vincent Donnefort wrote:
> transparent_hugepage_adjust() must walk the userspace stage-1 to detect
> if a PMD-level mapping is installed and whether a stage-2 block mapping
> can be used. Even though this stage-1 walk is most likely cache hot
> (in most cases, the mapping has just been installed), walking a
> page-table is still costly.
> 
> While we can't be sure by solely looking at the folio if the stage-1 is
> a block mapping as userspace has multiple ways to split it, we can infer
> from its size if the stage-1 mapping is smaller than PMD_SIZE. Anonymous
> memory or memfd faults allocate a big enough folio, as do khugepaged or
> MADV_COLLAPSE.
> 
> Add a fast fail based on the folio size: whenever a struct page is
> present and its folio is not PMD-mappable, bail out early and do not
> walk stage-1. This helps when THPs are disabled or under memory
> pressure, while adding a folio check on the PMD-hit path.
> 
> To measure this walk on 100% PMD misses, function_graph traced
> user_mem_abort() and get_user_mapping_size() with THP disabled while a
> guest faulted PAGE_SIZE anonymous pages:
> 
>   Platform            Setup                get_user_mapping_size()
>   ------------------  -------------------  -----------------------
>   Apple M2 (big CPU)  nested L1->L2, perf  mean  5.25%, med  2.70%
>   Ampere Altra        non-NV, VHE          mean 13.69%, med 12.28%
> 
> On non-NV VHE Ampere Altra, get_user_mapping_size() takes 0.26 us mean
> (0.24 us median) out of 2.32 us in user_mem_abort(). On nested L1->L2
> Apple M2, longer L1 user_mem_abort() handling shrinks the relative
> share.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Oliver Upton <oupton@kernel.org>

I missed the conversation on v1 but replacing get_user_mapping_size()
with something else is worth considering, even if it isn't to blame for
performance.

I worry a bit about KVM's view of the stage-1 configuration getting out
of sync with what's actually happening in the host stage-1. Using the
usual MM table walkers would allow us to completely gloss over this
point.

Anyway, LGTM.

Thanks,
Oliver

> ---
> 
> Notes:
>     v2:
>       - Reword commit message as a fast fail, describe the function_graph
>         setup, and include both nested Apple M2 and non-NV Ampere Altra
>         numbers (Marc)
>     
>     v1: https://lore.kernel.org/all/20261102211900.504192-1-vdonnefort@google.com/
> 
>  arch/arm64/kvm/mmu.c | 42 ++++++++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1db10d8d6db7..9d81d908e230 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1553,36 +1553,42 @@ static bool fault_supports_stage2_huge_mapping(const struct kvm_s2_fault_desc *s
>   * Returns the size of the mapping.
>   */
>  static long
> -transparent_hugepage_adjust(const struct kvm_s2_fault_desc *s2fd, kvm_pfn_t *pfnp, gfn_t *gfnp)
> +transparent_hugepage_adjust(const struct kvm_s2_fault_desc *s2fd,
> +			    const struct kvm_s2_fault_vma_info *s2vi, kvm_pfn_t *pfnp, gfn_t *gfnp)
>  {
>  	struct kvm *kvm = s2fd->vcpu->kvm;
> -	kvm_pfn_t pfn = *pfnp;
> -	gfn_t gfn = *gfnp;
> +	int sz;
>  
>  	/*
>  	 * Make sure the adjustment is done only for THP pages. Also make
>  	 * sure that the HVA and IPA are sufficiently aligned and that the
>  	 * block map is contained within the memslot.
>  	 */
> -	if (fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE)) {
> -		int sz = get_user_mapping_size(kvm, s2fd->hva);
> +	if (!fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE))
> +		return PAGE_SIZE;
>  
> -		if (sz < 0)
> -			return sz;
> +	/*
> +	 * If the allocated folio isn't at least PMD_SIZE, there is no way a
> +	 * stage-1 PMD level was installed.
> +	 */
> +	if (s2vi->page && !folio_test_pmd_mappable(page_folio(s2vi->page)))
> +		return PAGE_SIZE;
>  
> -		if (sz < PMD_SIZE)
> -			return PAGE_SIZE;
> +	/*
> +	 * Even though the folio size is big enough, the stage-1 mapping might
> +	 * have been split. Verify it.
> +	 */
> +	sz = get_user_mapping_size(kvm, s2fd->hva);
> +	if (sz < 0)
> +		return sz;
>  
> -		gfn &= ~(PTRS_PER_PMD - 1);
> -		*gfnp = gfn;
> -		pfn &= ~(PTRS_PER_PMD - 1);
> -		*pfnp = pfn;
> +	if (sz < PMD_SIZE)
> +		return PAGE_SIZE;
>  
> -		return PMD_SIZE;
> -	}
> +	*gfnp &= ~(PTRS_PER_PMD - 1);
> +	*pfnp &= ~(PTRS_PER_PMD - 1);
>  
> -	/* Use page mapping if we cannot use block mapping. */
> -	return PAGE_SIZE;
> +	return PMD_SIZE;
>  }
>  
>  static int get_vma_page_shift(struct vm_area_struct *vma)
> @@ -2186,7 +2192,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  		if (perm_fault_granule > PAGE_SIZE) {
>  			mapping_size = perm_fault_granule;
>  		} else {
> -			mapping_size = transparent_hugepage_adjust(s2fd, &pfn, &gfn);
> +			mapping_size = transparent_hugepage_adjust(s2fd, s2vi, &pfn, &gfn);
>  			if (mapping_size < 0) {
>  				ret = mapping_size;
>  				goto out_unlock;
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.56.0.567.gdb80ae8cd5-goog
> 
> 

