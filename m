Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC429606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 03:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JokDDfqr;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=KuEDjXji
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0hASrZa3KsQ/rJDPLJgE3hfFDgP737Rr5tw+ZVyeGEQ=; b=JokDDfqrflXfSl7+fjtwn0cRLJ
	l1B5Ypd1agTbqTXcH3qbx1ol1s3veXbNQZNhWtCydrL4Bkc0DNBrXvkhHaNF2yf5A8NLQTpeQhaDo
	GFj2PMwebSDVLXnsj/QCdw7yeIJoc+O9sJQM/XXPqP9gqNm103UJahD534AmxUR75PjBVToHzx1sL
	/kU96wQ5LojO13FiCcFxZG+5oymmUzM30NNdxOb0B9t/DPpXPI3K3b4QiP/BCgX9sEZneNe5xDIC+
	jXhfVXtzhr+jdAbAP6/Z04E0VgHW45gmq8UxlO6XWub/YcLMIXyPcri5SMr45GX+cN9rpx66Q6hIs
	z9eTa3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLAk-00000008acB-3Q0q;
	Thu, 12 Nov 2026 03:08:22 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLAh-00000008ab3-1MGY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 03:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794452894; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=0hASrZa3KsQ/rJDPLJgE3hfFDgP737Rr5tw+ZVyeGEQ=;
	b=KuEDjXjiQ8GklFW+NWbVOu4odCMFSqlzhTmvhPxDRY7Cl3wArweQpIGPU4BHryxtmxDaYSF1Gzs6tQzauufXaiBOD6ow2Uc6ChC+dxsFP2cqGprYL3ITIeQeCizCeOaHBJXE5tBSsmaWIs1TVvm4MUxxG4hoQPxKXAns1IB8fMA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R691e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XEaUfqM_1794452884;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XEaUfqM_1794452884 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 12 Nov 2026 11:08:14 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Chris Down <chris@chrisdown.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  linux-kernel@vger.kernel.org,  kernel-team@meta.com,
  Mark Rutland <mark.rutland@arm.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Muchun Song <muchun.song@linux.dev>,  Oscar
 Salvador <osalvador@suse.de>,  David Hildenbrand <david@kernel.org>,  Mike
 Kravetz <mike.kravetz@oracle.com>,  linux-arm-kernel@lists.infradead.org,
  linux-mm@kvack.org
Subject: Re: [PATCH] arm64: hugetlb: Prevent write fault livelocks on stale
 TLB entries
In-Reply-To: <avPxZjjdBIlM_8_g@chrisdown.name> (Chris Down's message of "Tue,
	10 Nov 2026 20:39:02 -0800")
References: <avPxZjjdBIlM_8_g@chrisdown.name>
Date: Thu, 12 Nov 2026 11:08:02 +0800
Message-ID: <87ld6yn3vx.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_190819_670368_4440AC36 
X-CRM114-Status: GOOD (  27.98  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-24.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Chris Down <chris@chrisdown.name> writes:

> In Meta production, we have had tasks get stuck in a fault loop while
> using hugetlb on arm64. During my investigations I found that affected
> tasks share a private hugetlb page.
>
> Looking at the stuck task states, I found the following ordering:
>
>   CPU0                                 CPU1
>   ----                                 ----
>   read page
>   [read only entry cached in TLB]
>                                        write page
>                                        hugetlb_fault()
>                                          hugetlb_wp()
>                                          [reuse folio]
>                                          set_huge_ptep_maybe_writable()
>                                            set_huge_ptep_writable()
>                                          [flush local TLB only]
>
>   write page using stale entry
>   hugetlb_fault()
>     huge_ptep_set_access_flags()
>     [entry already writable, no flush]
>   retry write using stale entry
>   [fault indefinitely. well, that's not ideal!]
>
> The reason is that when a write fault makes a non-contiguous hugetlb
> entry writable, it only invalidates the local TLB. However, another CPU
> can keep the old read-only entry, so its write will fault even though
> the page table already permits it. hugetlb_fault() then finds nothing to
> change and leaves the stale entry in place, so the same write keeps
> going round in circles.

Good catch!  Thanks!

> This is particularly bad because, if the kernel is copying to user
> memory, the retry stays inside the kernel and the task can't act on the
> pending signal.
>
> It can even remain unkillable while holding locks across the copy,
> resulting in further failures. For example, a read into a hugetlb
> buffer can hold the pipe mutex and block other users of the pipe until
> the loop ends, causing cascading lockups across the machine.
>
> To fix this, when a write fault finds nothing to change in a
> non-contiguous hugetlb entry, let's invalidate the local entry.
>
> Fixes: cb1fa2e99955 ("arm64, tlbflush: don't TLBI broadcast if page reused in write fault")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
>  arch/arm64/mm/hugetlbpage.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8e799c1fe0aa..ff1f53e435e1 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -429,9 +429,24 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  	VM_WARN_ON(!pte_present(pte));
>  	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
>  
> -	if (!pte_cont(pte))
> -		return __ptep_set_access_flags_anysz(vma, addr, ptep, pte,
> -						     dirty, pgsize);
> +	if (!pte_cont(pte)) {
> +		if (__ptep_set_access_flags_anysz(vma, addr, ptep, pte,
> +						  dirty, pgsize))
> +			return 1;
> +
> +		/*
> +		 * Another CPU may have made the entry writable without
> +		 * invalidating our stale read-only TLB entry. To avoid
> +		 * indefinitely faulting on this entry, flush it.
> +		 */
> +		if (dirty)
> +			__flush_hugetlb_tlb_range(vma, addr, addr + pgsize,
> +						  pgsize,
> +						  TLBF_NOWALKCACHE |
> +						  TLBF_NOBROADCAST |
> +						  TLBF_NONOTIFY);

IIUC, this is similar to fix_spurious_fault() for non-hugetlb folios.
Can we use similar logic?

> +		return 0;
> +	}
>  
>  	if (!__cont_access_flags_changed(ptep, pte, ncontig))
>  		return 0;
>
> base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620

---
Best Regards,
Huang, Ying

