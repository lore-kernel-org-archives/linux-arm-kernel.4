Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D1F606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JVqfsHpO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VZKwDank
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6DABqvPmRZQ9oUhOgSWnNOl71UnHng1Nk40a2Wv2ZOk=; b=JVqfsHpOiyk+BuVWRFa2wZO0ME
	AVksoyiOzjF1TTv1Pgk6oO5Bc8W14x3VnZzt7f64DbocQaUIFdwDyqNL1EyGh5GyMzehaTTHCuneX
	J2OQxw/t3u5bMft3ZI/uHwkH3MU1jqryVcqO/HC8Sw6fuIVNYJuh1qR+dcix1vYX62fJ6pf/93fCd
	1pcRq9DRH0X2q3jTwfxmJwQDf2koHJPo25EvWzWzCCwyKc7TdRLfHZgd9XjmNbms/gPbKkzDzqTYc
	TCQNcnaL9lRS4H6KZ5A2K1OMdpp9uB+gd+0y0RC3GVt43NOD6B7TGepXokmQU28U5q+0xGCgxktDM
	lN//+mWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwOt-0000000E0vG-2Xpm;
	Fri, 13 Nov 2026 18:53:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwOi-0000000E0rG-2A23
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:53:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4674140822;
	Fri, 13 Nov 2026 18:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62B11F000C4;
	Fri, 13 Nov 2026 18:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794595996;
	bh=6DABqvPmRZQ9oUhOgSWnNOl71UnHng1Nk40a2Wv2ZOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VZKwDankvfuzex2kRsuuyuqHtFOBDmCaX+0WDxsKL/ouO87kgLIB3xb7y6yOm/l4j
	 S2Hzsy3SFJbSAfPNpN5/WCPjXE7lb2e5myi9k1xiqxrHzc763+i64zEJqAuEDsEm7w
	 uMkCEgAbD+8ekgjG4FklqyNU/1b5rvooVJAA1POv4y6HUtbiYHEgQgYDgPoAc+m9Hh
	 ToYoOlC742wO+lulBmOy7vDZnkmacJKxLOREhis/Tt2axILXyzJPa3zG9ixS/CXFAV
	 XBAzB3tDKbseqSfaR/otntCp+rYZDrvbMx/fIiAxtDqSI8W93FtHmyJCo6VYd9sBQy
	 zC+gw78C8+jvw==
Date: Fri, 13 Nov 2026 18:53:09 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthew Wilcox <willy@infradead.org>, 
	Malin Jonsson <malin.jonsson@est.tech>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v2 4/6] mm: drop HIGHPTE support altogether
Message-ID: <avdciuic3FAy6evm@gremlin>
References: <20261112112528.1116405-1-arnd@kernel.org>
 <20261112112528.1116405-5-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112112528.1116405-5-arnd@kernel.org>
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

On Thu, Nov 12, 2026 at 12:25:26PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> With both x86 and arm having dropped CONFIG_HIGHPTE support, no
> architecture is left using it, so remove the remnants in common code.
>
> It is likely that further cleanups are possible in the page table
> code but those are not obvious from the config options.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

LGTM assuming Mike's changes :)

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  include/linux/hugetlb.h | 5 +----
>  include/linux/mm.h      | 1 -
>  include/linux/pgtable.h | 9 ---------
>  3 files changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 58f755e70e96..7c6d191fdf50 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -178,7 +178,6 @@ void hugetlb_bootmem_set_nodes(void);
>
>  /* arch callbacks */
>
> -#ifndef CONFIG_HIGHPTE
>  /*
>   * pte_offset_huge() and pte_alloc_huge() are helpers for those architectures
>   * which may go down to the lowest PTE level in their huge_pte_offset() and
> @@ -193,7 +192,6 @@ static inline pte_t *pte_alloc_huge(struct mm_struct *mm, pmd_t *pmd,
>  {
>  	return pte_alloc(mm, pmd) ? NULL : pte_offset_huge(pmd, address);
>  }
> -#endif
>
>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
>  			unsigned long addr, unsigned long sz);
> @@ -1047,9 +1045,8 @@ static inline spinlock_t *huge_pte_lockptr(struct hstate *h,
>  	 */
>  	if (size >= PUD_SIZE)
>  		return pud_lockptr(mm, (pud_t *) pte);
> -	else if (size >= PMD_SIZE || IS_ENABLED(CONFIG_HIGHPTE))
> +	else if (size >= PMD_SIZE)
>  		return pmd_lockptr(mm, (pmd_t *) pte);
> -	/* pte_alloc_huge() only applies with !CONFIG_HIGHPTE */
>  	return ptep_lockptr(mm, pte);
>  }
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 6af3b7008f1a..019de55bd796 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4025,7 +4025,6 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
>
>  static inline spinlock_t *ptep_lockptr(struct mm_struct *mm, pte_t *pte)
>  {
> -	BUILD_BUG_ON(IS_ENABLED(CONFIG_HIGHPTE));
>  	BUILD_BUG_ON(MAX_PTRS_PER_PTE * sizeof(pte_t) > PAGE_SIZE);
>  	return ptlock_ptr(virt_to_ptdesc(pte));
>  }
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 780fe849ff8b..1352b4cee7ae 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -100,14 +100,6 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
>  #define pte_offset_kernel pte_offset_kernel
>  #endif
>
> -#ifdef CONFIG_HIGHPTE
> -#define __pte_map(pmd, address) \
> -	((pte_t *)kmap_local_page(pmd_page(*(pmd))) + pte_index((address)))
> -#define pte_unmap(pte)	do {	\
> -	kunmap_local((pte));	\
> -	rcu_read_unlock();	\
> -} while (0)
> -#else
>  static inline pte_t *__pte_map(pmd_t *pmd, unsigned long address)
>  {
>  	return pte_offset_kernel(pmd, address);
> @@ -116,7 +108,6 @@ static inline void pte_unmap(pte_t *pte)
>  {
>  	rcu_read_unlock();
>  }
> -#endif
>
>  void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
>
> --
> 2.53.0
>

--
Cheers, Lorenzo

