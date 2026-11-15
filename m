Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB4606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1x9oGFtI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XhLu85Ua
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fLaQUPcYKxXkir2twg3fsW7g9Gg8lBOZ22Z32cylxH0=; b=1x9oGFtIMbY/0tPBdk+5a03mCa
	TrRoI6knLmcUmmLHADMVPTDOye9zT5Z4WCms0yFWwR/2X80EeeOST3BYWMb8QGLyCAjqjsGmNq1fZ
	BFSP2V46bnIf29LhnuNAMaaDntmCFxC7TxK7Lgf9DGg8bX+LgL0I6gr7RL55UQVw5sTeHmeKifpRc
	DH4WU0rMMgwKk/IWRkb2WxM2F69WQAjg9BaHrkrAR3uoIxl/us/bnFMrOYuUwTW0Xk57thOB3sids
	6r+Hw/UNi8WZdJrrGLe38hzxzCgBGqQ2KsGH2KoxcteF0Dtzp+WGD0CSGTNlv9baLXPsU5z5xYg3I
	kimufYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSfmA-00000000NC2-1yPh;
	Sun, 15 Nov 2026 19:20:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSfm8-00000000NBw-3BXi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 19:20:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AB737601CC;
	Sun, 15 Nov 2026 19:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC921F000C4;
	Sun, 15 Nov 2026 19:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770427;
	bh=fLaQUPcYKxXkir2twg3fsW7g9Gg8lBOZ22Z32cylxH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XhLu85Ua2c6WZLlLlAlu41R/VyenJMuIzs9+HeEnHjow/dZUNr5fsUxv33MVe0xR9
	 NiqKgGZojOd6z653AmlAbwBWSNz0Y/J4dsO9oqMstKyh/UAzeOwqo1F24tatjYGczh
	 Q0qBu2kvlSa0F8oIVuhxCAoOMhwI/hK6jFz/WnzR0a+3Y8LmbXpxRwMM+kxXmZY1iq
	 25w3eguzUz3kcvSwQsQNl1CFRImzluQwZPqKEdduaE+/HXoeSbYwThL2YZMJLNU1I0
	 E3zvrbGwhP652mJ1OL7CToELmOQZpBOaxBkQTr+i8KiSeA8Qj626ksqR9/Ha+aLwjb
	 //TVlKyt3smmQ==
Date: Sun, 15 Nov 2026 21:20:16 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	m.szyprowski@samsung.com, jenswi@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mark.rutland@arm.com,
	robin.murphy@arm.com, hch@lst.de, ryan.roberts@arm.com,
	sumit.garg@kernel.org, sudeep.holla@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/8] arm64: Add support for MEMBLOCK_PTEMAP
Message-ID: <avoF8IbOxVJ9Uh8Y@kernel.org>
References: <20261111110738.872947-1-vdonnefort@google.com>
 <20261111110738.872947-3-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111110738.872947-3-vdonnefort@google.com>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 11:07:32AM +0000, Vincent Donnefort wrote:
> With the MEMBLOCK_PTEMAP flag, force a PTE-level mapping. This also

I'd expand this to "Force a PTE-level mapping for memblock regions with
MEMBLOCK_PTEMAP flag set".

> disables contiguous PTEs to make sure any page from the memblock can be

                                     and memblock region here ^

> safely unmapped from the linear map.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  arch/arm64/mm/mmu.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 140520b351e2..a4cafafa1d82 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1184,9 +1184,8 @@ static void __init map_mem(void)
>  	phys_addr_t init_begin = __pa_symbol(__init_begin);
>  	phys_addr_t init_end = __pa_symbol(__init_end);
>  	phys_addr_t kernel_end = __pa_symbol(__bss_stop);
> -	phys_addr_t start, end;
>  	int flags = NO_EXEC_MAPPINGS;
> -	u64 i;
> +	struct memblock_region *r;
>  
>  	/*
>  	 * Setting hierarchical PXNTable attributes on table entries covering
> @@ -1226,9 +1225,14 @@ static void __init map_mem(void)
>  		       flags);
>  
>  	/* map all the memory banks */
> -	for_each_mem_range(i, &start, &end) {
> +	for_each_mem_region(r) {
> +		phys_addr_t start, end;
> +		int rflags = flags;
> +
> +		if (memblock_is_nomap(r))
> +			continue;
>  		/*
> -		 * for_each_mem_range may return sub-page-aligned boundaries
> +		 * for_each_mem_region may return sub-page-aligned boundaries
>  		 * after memblock_mark_nomap() splits regions at byte precision.
>  		 * __create_pgd_mapping_locked aligns phys down to PAGE_MASK,
>  		 * which could accidentally map no-map memory on the boundary.
> @@ -1237,17 +1241,21 @@ static void __init map_mem(void)
>  		 * regions. The cost is at most one page of unmapped gap at
>  		 * each boundary.
>  		 */
> -		start = PAGE_ALIGN(start);
> -		end = end & PAGE_MASK;
> +		start = PAGE_ALIGN(r->base);
> +		end = (r->base + r->size) & PAGE_MASK;

Nit: as we anyway change the assignment to end, PAGE_ALIGN_DOWN() is
slightly more explicit.

>  		if (start >= end)
>  			continue;
> +
> +		if (memblock_is_ptemap(r))
> +			rflags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> +
>  		/*
>  		 * The linear map must allow allocation tags reading/writing
>  		 * if MTE is present. Otherwise, it has the same attributes as
>  		 * PAGE_KERNEL.
>  		 */
>  		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
> -			       flags);
> +			       rflags);
>  	}
>  }
>  
> -- 
> 2.56.0.542.g3ef89b7020-goog
> 

-- 
Sincerely yours,
Mike.

