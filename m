Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A169E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=slJyy+sM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=n2x5Zi8/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QmCu5AKk2S3c57ZAB2ojsPsTfvTf7eCUQPKcTVLaD0M=; b=slJyy+sMOb9A+giyiLeyj4SGoF
	IaaeoKaUIF4abowgwC/GDedyvOITUYHQenAjyNKUXk0Gp4LmJBZgksroUpbGc58MFQ+UKuA1epmxI
	n5zJAxxvRd+4JxQsdLoj+/hpofajbMtI8nufCMwBFdkVUACIitIacwB0Ju+JYtYwnNlHEPE+7Z1FB
	78Mdp18ZJmtSbJLvMrXEvJauSnAVRI9DDUJB218I7ub0D/yRPG/IEe59m49w/PMHftuoSSv2r0wQg
	0TvufNPHfdmPldRJHKIsCmSqCbMZ0uiFRe5XSumpk8W5PwyJXsefFg46fJkGiCHuic88QG8cPTXGN
	BxRaZ1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWETU-0000000AHUz-1gVW;
	Wed, 25 Nov 2026 14:59:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWETO-0000000AHTu-2JUY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:59:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB3742F;
	Wed, 25 Nov 2026 06:59:46 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F6733F632;
	Wed, 25 Nov 2026 06:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795618789; bh=BL+q0fknC9F7rKqq5zcQg0XNAF41khT3DRJ+4gVKlts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n2x5Zi8/WqfDNOnZ6v9d/sVFIIVK3FMWV+exGow74TZqDh+OF+L9kGMdRL71y4deS
	 kBbGDLfBxbCgRa1uIz9HVyDIkbjvjOq/aN15MGozvmdW4VHhX9JmGNFqCDH41dnQqB
	 4rGAC1SeG9p2mb/uwMuB28ncr5OZGq1lDXL6PjZQ=
Date: Wed, 25 Nov 2026 14:59:45 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yadong Qi <yadong.qi@linux.alibaba.com>
Cc: will@kernel.org, mark.rutland@arm.com, ying.huang@linux.alibaba.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com, robh@kernel.org, gregkh@linuxfoundation.org,
	ptg-linux-kernel@linux.alibaba.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: fixmap: fix missing break-before-make in
 __set_fixmap()
Message-ID: <awb34Zfblg-A1tHQ@arm.com>
References: <20261125063224.553-1-yadong.qi@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125063224.553-1-yadong.qi@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_065950_715508_ABFB3272 
X-CRM114-Status: GOOD (  32.72  )
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

On Wed, Nov 25, 2026 at 02:32:24PM +0800, Yadong Qi wrote:
> __set_fixmap() installs a new PTE with __set_pte() but never invalidates
> the TLB; only the clear path calls flush_tlb_kernel_range(). The
> dsb(ishst)/isb that __set_pte() emits makes the new PTE visible to the
> table walker but does not invalidate stale TLB entries. Overwriting a
> still-valid slot therefore leaves the old translation cached and
> violates break-before-make: accesses may keep hitting the old output
> address, and changing the attributes of a cached entry can trigger TLB
> conflict aborts or CONSTRAINED UNPREDICTABLE behaviour.
> 
> Two in-tree callers overwrite a valid FIX_EARLYCON_MEM_BASE slot:
> 
>  - earlycon: earlycon_map() maps the UART before match->setup() runs.
>    If setup fails, con->write is unset, or the DT reg-io-width is
>    unsupported, the slot stays valid but no console is registered. The
>    console_is_registered() guard only blocks successful registrations,
>    so a later attempt (e.g. a failed DT earlycon followed by earlycon=
>    on the command line) remaps the slot to a different UART.
> 
>  - samsung_tty: apple_s5l_early_console_setup() overrides the
>    just-installed entry from PROT_DEVICE_nGnRE (FIXMAP_PAGE_IO) to
>    PROT_DEVICE_nGnRnE on the normal successful boot path.
> 
> Both are valid-to-valid changes (different output address or memory
> type), which arm64 requires to be break-before-make.
> 
> Fix this in __set_fixmap() by invalidating any existing valid mapping
> up front: clear the old PTE and flush the TLB, then install the new PTE
> only when setting. The old translation is gone before the new one is
> created, so the two can never coexist in the TLB. A first-time mapping
> (old entry invalid) skips the invalidation and pays no extra cost, and
> clearing a slot is handled by the same step.
> 
> A clear (!flags) always clears and flushes, even when the PTE is already
> invalid. An invalid PTE does not imply an invalid TLB: another CPU may
> have cleared the PTE but not yet completed its TLB flush, leaving a stale
> entry cached locally. The unconditional flush preserves clear_fixmap()'s
> TLB shootdown guarantee, which callers such as the KVM VNCR unmap path
> rely on when racing with a remote invalidation.
> 
> This belongs in the callee, as on x86: __set_fixmap() there calls
> set_pte_vaddr(), which flushes the TLB unconditionally after writing the
> PTE. x86 can flush after the write because it has no break-before-make
> requirement; arm64 must invalidate and flush before installing the new
> valid entry to avoid TLB conflict aborts.
> 
> Fixes: 9aac5887595b ("tty/serial: add generic serial earlycon")
> Cc: stable@vger.kernel.org
> Reported-by: Huang Ying <ying.huang@linux.alibaba.com>
> Signed-off-by: Yadong Qi <yadong.qi@linux.alibaba.com>

Nit: commit 9aac5 added earlycon_map() -> set_fixmap_io() but I think a
a few other commits later caused overriding this fixmap entry. I think
set_fixmap_io() was underspecified, not requiring a clear_fixmap() after
use but they inherited the x86 behaviour already which did the flushing.
Anyway, I think a better tag would be (to make it arm64-specific issue):

Fixes: bf4b558eba92 ("arm64: add early_ioremap support")

> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index 951004ad700c..5da49e201b6f 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -126,13 +126,49 @@ void __set_fixmap(enum fixed_addresses idx,
>  
>  	ptep = fixmap_pte(addr);
>  
> +	/*
> +	 * Break-before-make: when the slot still holds a valid mapping
> +	 * (e.g. earlycon re-mapping FIX_EARLYCON_MEM_BASE), invalidate the
> +	 * old entry and flush the TLB entries caching it before a new
> +	 * mapping is installed, so old and new translations never coexist.
> +	 *
> +	 * A clear (!flags) always flushes even if the PTE is already invalid:
> +	 * a remote CPU may have cleared the PTE but not yet completed its TLB
> +	 * flush, leaving a stale entry cached locally. Take KVM VNCR unmap as
> +	 * example:
> +	 * When CPU1 wins atomic_xchg_relaxed(&vt->cpu, -1) in unmap_l1_vncr(),
> +	 * CPU0 calls clear_fixmap() on its own slot so it cannot finish
> +	 * vcpu_put() before the local TLB entry is invalidated:
> +	 *      CPU0                                  CPU1
> +	 *                                 invalidate_vncr()
> +	 *                                 unmap_l1_vncr()
> +	 *                                   atomic_xchg_relaxed(&vt->cpu, -1)
> +	 *                                   clear_fixmap(vncr_fixmap(0))
> +	 *                                     __pte_clear(..., ptep)
> +	 *                                     <delayed before TLB flush>
> +	 * kvm_vcpu_put_hw_mmu()
> +	 * this_cpu_reset_vncr_fixmap()
> +	 *   unmap_l1_vncr() == -1
> +	 *   clear_fixmap(vncr_fixmap(0))
> +	 *     !pte_valid(__ptep_get(ptep))
> +	 *     <skips flush_tlb_kernel_range()>
> +	 *                    <stale TLB entry still live on CPU0>
> +	 * If another nested vCPU then schedules on CPU0 and calls
> +	 * kvm_map_l1_vncr() before CPU1 finishes flush_tlb_kernel_range(),
> +	 * __set_fixmap() also sees !pte_valid(__ptep_get(ptep)) and installs
> +	 * the new PTE while the old translation is still cached in CPU0's TLB.
> +	 * Unconditionally clearing and flushing when !pgprot_val(flags)
> +	 * preserves clear_fixmap()'s TLB shootdown guarantee.
> +	 */

There's too much text here. Move it in the commit log if you want and
just write a few lines in the code, something like:

	/*
	 * Break-before-make if the slot holds a valid mapping. Always
	 * flush on clear since another CPU may have cleared the pte
	 * without completing its TLBI yet.
	 */

> +	if (pte_valid(__ptep_get(ptep)) || !pgprot_val(flags)) {
> +		__pte_clear(&init_mm, addr, ptep);
> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +	}
> +

With these changes,

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

