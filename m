Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B06B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 11:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UyCzKjHb;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=m+MLl17U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TWf+jlBIQBGwk4QT4KRo+cGa7wFWGG2xF2hmkjUB8u0=; b=UyCzKjHb7O+6Yt
	ADbBC0LBZCcV7liZh5i0J1pZCOFpGMeU3beZVgIMEpS5jvtl87gpi2x9LGv5ALLbl6hcK6w/RGlJq
	6bhsuw2Oi8b2NKDtfOwtjIXXHtuH+CsTB+3MpD+jAxkgLox7/dKvy1vmPDpQxWaCay6MbuPE2okew
	4cBHGFihh/fGAtL7LbqzXZ58dXaAgr+aHJJpC/dizL/3mxCyMLHBdLE5XnXSBiHVUZlyoNaVcLES3
	eSEdl3yWEcUIjE5K0NTKzPdOYU2RpTrBY8P7gme2u9i8+rLP9U2g3MQNjJeDjr1DzPfTkrRdOAp+i
	Rt9Scw6BB5JNEtvRRdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUir0-0000000H49v-0MfG;
	Sat, 21 Nov 2026 11:01:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiqx-0000000H49Y-1ybY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 11:01:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B29761575;
	Sat, 21 Nov 2026 03:01:50 -0800 (PST)
Received: from [10.57.93.173] (unknown [10.57.93.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A85D23F673;
	Sat, 21 Nov 2026 03:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795258913; bh=b606/LbDulrarsbGOfDsZnPHYpPyDvJEr5RossCWTCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m+MLl17UBpYuoJHPoix2uCTLkZOTjwAdDBLO2DuGlFrb/3ap/qbaoRqkWqHw5FDPJ
	 rYPl8cGGuPCr3y3My2HROvuBYmb8cU5lAsrv89CKDDSQ+Linu+MNsLN6Pb5ivVmjW3
	 OFeIq2rlrbSU+itEgTGbAVIriMtbruJm30MnGltQ=
Message-ID: <6782b5ee-3dfe-4076-a79c-fbeb2c2ac7da@arm.com>
Date: Sat, 21 Nov 2026 11:01:49 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: mm: Don't defer the barriers when installing a
 fixmap entry
To: Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, Kevin Brodsky
 <kevin.brodsky@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <tabba@google.com>, stable@vger.kernel.org
References: <20261120121638.194154-1-fuad.tabba@linux.dev>
 <20261120121638.194154-4-fuad.tabba@linux.dev>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20261120121638.194154-4-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_030155_580166_DBF3B712 
X-CRM114-Status: GOOD (  19.55  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/11/2026 12:16, Fuad Tabba wrote:
> In lazy MMU mode, __set_pte(), which __set_fixmap() uses, only queues
> its DSB and ISB, but a caller can dereference the slot as soon as
> __set_fixmap() returns. On a CPU with BBML3, runtime changes to the
> linear map are made in lazy MMU mode. With 4K pages and 39-bit VAs, for
> example, such a change can update a top-level entry, which
> set_swapper_pgd() writes through FIX_PGD. That store can fault, and the
> kernel then warns about a spurious translation fault. When kgdb stops a
> CPU in lazy MMU mode, its breakpoint writes through FIX_TEXT_POKE0 can
> fault the same way, and fail.
> 
> Emit the barriers directly in __set_fixmap().
> 
> Fixes: 5fdd05efa1cd3 ("arm64/mm: Batch barriers when updating kernel mappings")

My memory might be betraying me, but I think this change went in before BBML3
(BBML2_NOABORT)? In which case, the bug is only exposed by the latter series?

> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> --->  arch/arm64/mm/fixmap.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index f66a0016dd02d..951004ad700c3 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -127,7 +127,9 @@ void __set_fixmap(enum fixed_addresses idx,
>  	ptep = fixmap_pte(addr);
>  
>  	if (pgprot_val(flags)) {
> -		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> +		/* The slot must be usable on return, even in lazy MMU mode. */
> +		__set_pte_nosync(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> +		emit_pte_barriers();

I wonder if it would be clearer to wrap __set_ptes():

lazy_mmu_mode_pause()
__set_ptes()
lazy_mmu_mode_resume()

I notice that ptep_try_set() is also using emit_pte_barriers() directly, but
that feels like a layering violation to me.

Thanks,
Ryan


>  	} else {
>  		__pte_clear(&init_mm, addr, ptep);
>  		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);


