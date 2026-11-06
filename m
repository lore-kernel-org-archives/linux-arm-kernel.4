Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42937606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yBlrAUA8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mLSXzEqy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vIkavoY4n/2ifojsD/pwpTnMH3j6uXS6/wlgJxw81VE=; b=yBlrAUA8q1Asiv2p4JEIanfTuY
	XPX2LdP7WMUMaIdeLTb/ebwgd8RQVNn4G1jfQYbyHenEgfjXrEDh75ogCISbSw67h1uVNmDdfcB3f
	95Cjc0aG2W9se13Q5jQF6QElpFfTNphq8onU9Uz9P9Z8VrFkp8VCnQGojiyHtCCowm/UrtP2VGRpy
	oSCkASfr0t0PNA0OZ6Zjcj4n8NGFsk5xH3oYyG8LTysGZaB1yXuNAnCsbYpGKZrz/2fu2RdYvdStv
	TOBC0wWr7y/xQ4xsO0dhjx2lOIOA5snSdZDjQ7G2V+GAtEBRvR30VMsrsWqRurpp+Oc/0Rn9akCV7
	qSp0s+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRRw-0000000DhVJ-0IDF;
	Fri, 06 Nov 2026 21:26:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRRu-0000000DhTy-2uEl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:26:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B9F39601F8;
	Fri,  6 Nov 2026 21:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4014A1F0089F;
	Fri,  6 Nov 2026 21:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794000372;
	bh=vIkavoY4n/2ifojsD/pwpTnMH3j6uXS6/wlgJxw81VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mLSXzEqytKd5xOzhWK/7DPCd+wkjNKWraYbdGNRjsbxHiBOB7iaCjWYF19lLfDACb
	 Qh7BNN/QRCXTlmlPBfD/4li4uunFL30UF1mB2d4Z/d8h8RlZx08UKHYQcFvw2MW07a
	 RZNC90e6px/yu5qR5ZZdBh3XroPMSrfbsEhLE+O6HDB/hRxBychLISO2GVyon3ym8X
	 h6FCfb+PcdEyZ69+8iR5bqThT9CuzGf4vhL9Gt9uC1BffCM3FTXs9qlvwvcYcqpBmI
	 XzdcjXKXmKae/T/QkyP2XF5ITYsq8ASOfr+VVgg+r5RnRA7qAxJ4N22a1jmyf9ztD9
	 59taTtPSojrpw==
Date: Fri, 6 Nov 2026 13:26:10 -0800
From: Oliver Upton <oupton@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	vdonnefort@google.com, tabba@google.com, xuheng@cs.columbia.edu,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v3] KVM: arm64: Use consistent type for pool size
Message-ID: <au5F8u4onNe-KtyM@kernel.org>
References: <20261106172750.2678873-1-smostafa@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106172750.2678873-1-smostafa@google.com>
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

On Fri, Nov 06, 2026 at 05:27:49PM +0000, Mostafa Saleh wrote:
> All the pool sizes in the hypervisor are "unsigned long" but when
> they get passed to hyp_early_alloc_contig() or hyp_pool_init() they get
> truncated to 32-bits.
> 
> That is not a big problem at the moment as to overflow this we need
> 4G bytes of carveout (2 TB of host or guest system memory).
> 
> However when new users are added (as IOMMU) it is hard to reason
> about the carveout size anymore.
> 
> Fixes: e75960408723 ("KVM: arm64: Introduce an early Hyp page allocator")
> Fixes: 8e17c66249e9 ("KVM: arm64: Introduce a Hyp buddy page allocator")
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Acked-by: Will Deacon <will@kernel.org>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

> ---
>  arch/arm64/kvm/hyp/include/nvhe/early_alloc.h | 2 +-
>  arch/arm64/kvm/hyp/include/nvhe/gfp.h         | 4 ++--
>  arch/arm64/kvm/hyp/nvhe/early_alloc.c         | 2 +-
>  arch/arm64/kvm/hyp/nvhe/page_alloc.c          | 6 +++---
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h b/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
> index dc61aaa56f31..462883c4e325 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/early_alloc.h
> @@ -7,7 +7,7 @@
>  void hyp_early_alloc_init(void *virt, unsigned long size);
>  unsigned long hyp_early_alloc_nr_used_pages(void);
>  void *hyp_early_alloc_page(void *arg);
> -void *hyp_early_alloc_contig(unsigned int nr_pages);
> +void *hyp_early_alloc_contig(unsigned long nr_pages);
>  
>  extern struct kvm_pgtable_mm_ops hyp_early_alloc_mm_ops;
>  
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/gfp.h b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> index 3766333bace9..3a428dc40b14 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> @@ -29,6 +29,6 @@ void hyp_get_page(struct hyp_pool *pool, void *addr);
>  void hyp_put_page(struct hyp_pool *pool, void *addr);
>  
>  /* Used pages cannot be freed */
> -int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
> -		  unsigned int reserved_pages);
> +int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages,
> +		  unsigned long reserved_pages);
>  #endif /* __KVM_HYP_GFP_H */
> diff --git a/arch/arm64/kvm/hyp/nvhe/early_alloc.c b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
> index 00de04153cc6..9fef0c7d2185 100644
> --- a/arch/arm64/kvm/hyp/nvhe/early_alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/early_alloc.c
> @@ -21,7 +21,7 @@ unsigned long hyp_early_alloc_nr_used_pages(void)
>  	return (cur - base) >> PAGE_SHIFT;
>  }
>  
> -void *hyp_early_alloc_contig(unsigned int nr_pages)
> +void *hyp_early_alloc_contig(unsigned long nr_pages)
>  {
>  	unsigned long size = (nr_pages << PAGE_SHIFT);
>  	void *ret = (void *)cur;
> diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> index 57f86aa0f82f..51460d420c94 100644
> --- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> +++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
> @@ -229,12 +229,12 @@ void *hyp_alloc_pages(struct hyp_pool *pool, u8 order)
>  	return hyp_page_to_virt(p);
>  }
>  
> -int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
> -		  unsigned int reserved_pages)
> +int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned long nr_pages,
> +		  unsigned long reserved_pages)
>  {
>  	phys_addr_t phys = hyp_pfn_to_phys(pfn);
>  	struct hyp_page *p;
> -	int i;
> +	unsigned long i;
>  
>  	hyp_spin_lock_init(&pool->lock);
>  	pool->max_order = min(MAX_PAGE_ORDER,
> -- 
> 2.56.0.455.g6c5a503b38-goog
> 

