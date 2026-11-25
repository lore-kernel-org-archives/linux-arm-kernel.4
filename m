Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AD1606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pg3ZRUOv;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P4Lj0TYQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=66XtB+U2+4to9qy3PAxUKRgvt3J9EZgv7Tv26f9LUCA=; b=Pg3ZRUOvqBwWag
	XFjl0KdC5fmHB2trSw56TCaOczkacufy/U9xAn5guUX14gJRzwvYkK3pg8/X0K4dduXfedvJNe8Fj
	axLJk7el1FekG0XLXhwkyypcesD5xdO9XLvtn0WQXU/5dmt5Q1WpeNXo1d4M6bxJb5CjFLpXZdk2y
	z3g8++TvBvvNj272xsZCkVZ5y8YUZ/pZAY91R605SOHISS3CryAJRewq+Y1ept5lgc3vuVOJVxDl9
	DTxTaNJg4xNUA0HHpyYpHkvw3QZV7FxjXD2K9hp7x3vJ4t8JiTxS31zgIwydhyqnd046pyKw/l6H4
	+PKvo6zNs169PWeG3P9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGaP-0000000AhQn-3JXb;
	Wed, 25 Nov 2026 17:15:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGaM-0000000AhNc-1cjz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:15:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C5EA2F;
	Wed, 25 Nov 2026 09:15:00 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAD523F86F;
	Wed, 25 Nov 2026 09:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795626903; bh=Fa3kAtHgk384B8+kxGzOb41KHv8hVt7t5M1nRsdUqZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P4Lj0TYQ1E2+KwPgoQLRQawek111L2jgfj75ceRrVPopmPV5WEC/jimuonWU6uuxu
	 EPZTdtrW87BBPVddh55ElWuKDXIJrsOdHpPbvGvJoGflbaT5vYzk+3qfshOpGYyIrb
	 FujYylv/+RGIMBvs0/t1VJiWOYQxE1j5mLCUP92U=
From: Leonardo Bras <leo.bras@arm.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	rkeilty@meta.com,
	atish.patra@linux.dev,
	dgreid@meta.com,
	"ARM ljs@kernel.org" <LorenzoStoakes@leobrasdk>
Subject: Re: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
Date: Wed, 25 Nov 2026 17:14:46 +0000
Message-ID: <awcXhk885lqDRAHy@LeoBrasDK>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124152842.2634495-1-usama.arif@linux.dev>
References: <20261124152842.2634495-1-usama.arif@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_091510_541902_7D992220 
X-CRM114-Status: GOOD (  23.24  )
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

On Tue, Nov 24, 2026 at 07:28:42AM -0800, Usama Arif wrote:
> When a stage-2 fault may need new page tables, KVM first tops up the
> vCPU's page cache: if it holds fewer pages than the fault might need, it
> is refilled to KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE, which arm64 sets to
> 40. Unused pages stay in the cache until the vCPU is destroyed.
> 
> With 64 KiB pages, that is 2.5 MiB per vCPU, and most of it is never
> used. Stage-2 has at most three levels and the root is preallocated, so
> a fault needs at most two new table pages (kvm_mmu_cache_min_pages()).
> As every last-level table covers 512 MiB, an 8 GiB guest needs just 17
> table pages to map all of its memory, while its four vCPU caches get
> filled with 160.
> 
> On a production host with 64 KiB pages running 101 VMs with four vCPUs
> each, the caches were still 86% full. The memory used:
> 
>                         before      after
>   per-vCPU capacity     2.5 MB     512 KB
>   all 404 vCPUs         869 MB     <= 202 MB
> 
> Let's lower the capacity to 8 with 64 KiB pages, In the production
> usecase above, it frees at least 667 MB. That still covers the two-page
> minimum and leaves room for several table allocations per refill. 4 KB
> and 16 KB pages keep 40.
> 
> The temporary cache in kvm_phys_addr_ioremap() uses the same capacity,
> but it is topped up before every page it maps, so 8 is sufficient there
> as well. The pKVM hypervisor memcache and the eager split cache don't
> use this capacity.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  arch/arm64/include/asm/kvm_types.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
> index 9a126b9e2d7c99..28568da9ea4a7b 100644
> --- a/arch/arm64/include/asm/kvm_types.h
> +++ b/arch/arm64/include/asm/kvm_types.h
> @@ -2,7 +2,12 @@
>  #ifndef _ASM_ARM64_KVM_TYPES_H
>  #define _ASM_ARM64_KVM_TYPES_H
>  
> +/* Must cover kvm_mmu_cache_min_pages(), at most 2 with 64 KiB pages. */
> +#ifdef CONFIG_ARM64_64K_PAGES
> +#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 8
> +#else
>  #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
> +#endif
>  
>  #endif /* _ASM_ARM64_KVM_TYPES_H */
>  
> -- 
> 2.53.1-Meta
> 

Hi Usama,

Have you tried to reproduce this issue in v7.4-rc1 or newer?

IIUC Lorenzo Stoakes introduced a change that would cause the memcache to 
skip topup if the cache contains a minimum of ~4 pages, so it can possibly 
improve that issue.

Although I can see that when it's below that minimum it fills the whole 
capacity (40) of the cache.

In any case, Lorenzo, could you advise?

CC:Lorenzo Stoakes (ARM) (ljs@kernel.org) 

Thanks,
Leo

