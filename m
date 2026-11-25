Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C953606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CmIc4IMB;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eh9ipDlL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LrB37YjSIPn8trdCr4bJ6E7VraYEZnstQn8iE1gmVfc=; b=CmIc4IMBQfjad21bstafa0rQJl
	HZA/7inyuNT4LkhIc975RCqOJJPLRgWpIeJrqOKIQCInnVbm7/xxtAl8CmN49grNr3dlqDiAPALRd
	JW2r6/sEX067EfUMyGBNja62i7LDA45pXaoXhXKbCYigJcgMQZ1rqQUVLc2Bam0FYUmozORQB1QSw
	+P9U71aprJAVPmlzWCZd4iUJfGugw1qH2QWHJ8YXlDA2RXjYrNyswsuFSDzX6tznaCRuyLuUEuxf2
	trdWwRQedY2zBYFilSPfZJ+Z3YhCdh97TT+io4fN9R4jP3NxiwHOeCCw8hFnqH7lA99tZKsnNDu9r
	/DoZXqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHw3-0000000B2S8-1lij;
	Wed, 25 Nov 2026 18:41:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHw0-0000000B2Rk-1w5j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:41:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 412571596;
	Wed, 25 Nov 2026 10:41:32 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F11C03F632;
	Wed, 25 Nov 2026 10:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795632095; bh=52zSmMtLrL/2Cilb3mI8GAy27SW4K/XC4afsFkJikIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eh9ipDlLCcMFGhBh5QibFlDUTE8oO+y7Tb3DQoLizW+1eTCXD02C0/+SWxoXVnOXx
	 fF7bEQMJIq1/EGwhcPfCC4r/RWN8gS/Dnl5e/jsNQGIUS3pJYbcDL5dENsw3cOM1fC
	 2yB2kcDBCKzLfNRIZnI75KHSFIzBZzMWDP0eMm9w=
Date: Wed, 25 Nov 2026 18:41:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Thomas Huth <thuth@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: mm: Stop using the previous ASID for init_mm
Message-ID: <awcr1wwqmkr7ilXp@arm.com>
References: <20261027100231.31184-1-jiangshanlai@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027100231.31184-1-jiangshanlai@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_104136_887276_7B256693 
X-CRM114-Status: GOOD (  28.29  )
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

On Tue, Oct 27, 2026 at 06:02:27PM +0800, Lai Jiangshan wrote:
> From: Lai Jiangshan <jiangshan.ljs@antgroup.com>
> 
> Switching to init_mm should prevent further accesses through the
> previous address space's translations.
> 
> Commit e53f21bce4d3 ("arm64: Use the reserved TTBR0 if context switching
> to the init_mm") avoided installing init_mm.pgd as a user page table.
> At the time, the ASID was held in TTBR0, so installing the reserved
> TTBR0 also switched to ASID 0.
> 
> Since commit 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1"),
> installing the reserved TTBR0 no longer changes the active ASID.
> Consequently, switching to init_mm leaves the CPU using the previous
> address space's ASID. An empty page table does not prevent TLB hits
> for that ASID.
> 
> This can retain access beyond the lifetime of the backing pages.
> During fullmm teardown, user data pages can be freed before their
> cached translations are invalidated. If those pages are subsequently
> reused for kernel data, an erroneous uaccess that hits a surviving
> translation can read or corrupt that data instead of faulting.
> 
> Fixes: 7655abb95386 ("arm64: mm: Move ASID from TTBR0 to TTBR1")
> Signed-off-by: Lai Jiangshan <jiangshan.ljs@antgroup.com>

Sorry for the delay. I looked at this again and it is indeed a bug but I
doubt you can trigger it. It relies on some erroneous uaccess to the old
pages. It also doesn't bring new TLB entries associated with the wrong
ASID. The CPU hotplug window is pretty small. The efi_virtmap_unload()
can also end up with the init_mm if no user spare ran.

Worth fixing though.

> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
> index 803b68758152..7e56099c5fbb 100644
> --- a/arch/arm64/include/asm/mmu_context.h
> +++ b/arch/arm64/include/asm/mmu_context.h
> @@ -235,15 +235,6 @@ enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
>  
>  static inline void __switch_mm(struct mm_struct *next)
>  {
> -	/*
> -	 * init_mm.pgd does not contain any user mappings and it is always
> -	 * active for kernel addresses in TTBR1. Just set the reserved TTBR0.
> -	 */
> -	if (next == &init_mm) {
> -		cpu_set_reserved_ttbr0();
> -		return;
> -	}
> -
>  	check_and_switch_context(next);
>  }
>  
> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
> index 0f4a28b87469..a96ebe904dd7 100644
> --- a/arch/arm64/mm/context.c
> +++ b/arch/arm64/mm/context.c
> @@ -218,6 +218,16 @@ void check_and_switch_context(struct mm_struct *mm)
>  	unsigned int cpu;
>  	u64 asid, old_active_asid;
>  
> +	/*
> +	 * init_mm.pgd contains kernel mappings, so use the reserved page
> +	 * tables for TTBR0 and switch TTBR1 to ASID 0. Leave active_asids
> +	 * unchanged to preserve the ASID rollover bookkeeping.
> +	 */
> +	if (mm == &init_mm) {
> +		cpu_do_switch_mm(__pa_symbol(reserved_pg_dir), mm);
> +		return;
> +	}

I don't think we need the full cpu_do_switch_mm() machinery here. Can we
not simply set the reserved ASID in __switch_mm()? Something like:

	if (next == &init_mm) {
		unsigned long ttbr1 = read_sysreg(ttbr1_el1);

		cpu_set_reserved_ttbr0_nosync();
		write_sysreg(ttbr1 & ~TTBRx_EL1_ASID_MASK, ttbr1_el1);
		isb();
		return;
	}

Or just add the above to a new cpu_set_reserved_ttbr0_asid() function
and call it. I think that's the only case where we need to set the
reserved ASID.

Thanks.

-- 
Catalin

