Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAAD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KBz04PiI;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QQNt7T0i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8pAN+cMNDAKpI0U2TXKKPxCHGtnx0QjdYb7WetjOVfA=; b=KBz04PiIdQe25h2TApwp8wMDoJ
	Y3aN9msh74HjB9I5vQxM7kCmgnkSZ/nZJXOZ5QkUYA1hlWDPJ3gxV3TRSYpq1ENbM+0b8zQhQjpFi
	QZq3PV6g46Es8AK8PBAUlnNx/2DzH2BOKvIix8MGBFD88dAaNk84MNOj8XMH/p+FMB9Mu/AekFwBF
	thVvVexHRLux536j22b1tp8Su/+6L/oVPgJ3Tg5go8EoLlBbR7g+YcbpdzR3xOmQP0Z1u86EGhaES
	UBIvYD9M7V+OZ9bVEM1tldvKkHQzdLgSV5gzx9w1CQEQbZM87E3MSLK1k4KF0m+74SM9Hb8fCAIfr
	C65IButA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDtF-0000000A8fb-2gtD;
	Wed, 25 Nov 2026 14:22:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDtD-0000000A8eP-2fxy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:22:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AF482F;
	Wed, 25 Nov 2026 06:22:23 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFBB03F763;
	Wed, 25 Nov 2026 06:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795616546; bh=JMMVosT4VTiw7rOBFumnNRwKpJxvpO3L1Ux34kDKMME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQNt7T0iVQmM94OhDwbo2jUVxlWiS0B4lQHGscliOaWAXcteupZw1IqicwsEEAxPv
	 Az1K1rtUc5oVZuCBWnXAtCgLeG1Xmy9zNmEFL9WTaZkqF0l66mkQezTkvCyZ1a1wGO
	 5E/Dul/2PTdpPER5DMjUevgq8g4Af4GBsV3ogi2g=
Date: Wed, 25 Nov 2026 14:22:21 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Yadong Qi <yadong.qi@linux.alibaba.com>, will@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ryan.roberts@arm.com, robh@kernel.org,
	gregkh@linuxfoundation.org, ptg-linux-kernel@linux.alibaba.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: fixmap: fix missing break-before-make in
 __set_fixmap()
Message-ID: <awbvHVSX7sB8jzYA@arm.com>
References: <20261123093505.974-1-yadong.qi@linux.alibaba.com>
 <awW3Dw743-rw_-cf@arm.com>
 <87mrqxto23.fsf@DESKTOP-5N7EMDA>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mrqxto23.fsf@DESKTOP-5N7EMDA>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_062227_724625_4D6E1A61 
X-CRM114-Status: GOOD (  22.12  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 02:36:36PM +0800, Huang, Ying wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> 
> > On Mon, Nov 23, 2026 at 05:35:05PM +0800, Yadong Qi wrote:
> >> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> >> index f66a0016dd02..5593d7e0d523 100644
> >> --- a/arch/arm64/mm/fixmap.c
> >> +++ b/arch/arm64/mm/fixmap.c
> >> @@ -126,12 +126,19 @@ void __set_fixmap(enum fixed_addresses idx,
> >>  
> >>  	ptep = fixmap_pte(addr);
> >>  
> >> -	if (pgprot_val(flags)) {
> >> -		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> >> -	} else {
> >> +	/*
> >> +	 * Break-before-make: when the slot still holds a valid mapping
> >> +	 * (e.g. earlycon re-mapping FIX_EARLYCON_MEM_BASE), invalidate the
> >> +	 * old entry and flush the TLB entries caching it before a new
> >> +	 * mapping is installed, so old and new translations never coexist.
> >> +	 */
> >> +	if (pte_valid(__ptep_get(ptep))) {
> >>  		__pte_clear(&init_mm, addr, ptep);
> >> -		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);
> >> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> >>  	}
> >> +
> >> +	if (pgprot_val(flags))
> >> +		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> >>  }
> >
> > I guess that's easier than getting the driver or earlycon code to do
> > clear_fixmap().
> 
> Yes.  And because set_fixmap() flushes the tlb on x86, IMHO, it's a
> little hard to justify the driver modification.
> 
> However, set_fixmap() only flushes the tlb on the local CPU instead of
> broadcasting the flush, because fixmap is either per-CPU or used during
> early boot.  In theory, we could follow that approach and perform a
> local flush instead though the benefit may be marginal.

Local TLBI won't work on arm64 since the page tables are shared (any CPU
can speculatively load the TLB) and only FIX_VNCR has per-CPU entries.

-- 
Catalin

