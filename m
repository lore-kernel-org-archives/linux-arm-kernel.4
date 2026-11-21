Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C38606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 10:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TnCHiSgA;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Vc0/zWM3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H844ouKcu89wqaDaGvID9peNPao245E6sX0x5p75VlY=; b=TnCHiSgArgL2Lf
	8h9PISw6W9BmTjSwrTQk09FQKM0M5a7SzxI1iXfZ5oBaEar4FJJrC8oBa5+csburHrUl59RdWHtVM
	DmU9hH0+kYhfvfBW6yZAUeUDQIYzAMCwJ4rA2KIDlK49algYXqtBZhjZupPHM6d5Gkthm+5JGYTcr
	04cwlnQaQCIDeFjw2zYuBxSK8omVrwPptDlbQDunRhB92enj2YpTB01nNkakEMlHELbU2Y669mhZD
	CqdLiCj4j2nVesWudk6basksUEhQS+PFFgXErHwPud54ebvpeIMJ7U7WlFFbofSKuJ808fL4H0mxa
	WfDYX28eEEZ+sKgtr9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUido-0000000H3Jx-1Bp2;
	Sat, 21 Nov 2026 10:48:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUidm-0000000H3Jb-2SnM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 10:48:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6934D1575;
	Sat, 21 Nov 2026 02:48:14 -0800 (PST)
Received: from [10.57.93.173] (unknown [10.57.93.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D267B3F673;
	Sat, 21 Nov 2026 02:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795258097; bh=LWvhA+JKvTLjW7JOpSb4mg9kc3djq13jibSTget6C78=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vc0/zWM38R8FTcWCHAViA0/Baa+4ZHh1v2TjkzkH/2li+snCxtoze+VH7hEqmS9pg
	 2Tzy4n83cHpQ5wkiBwlTHgAmWIDljCj/w/oxzt8Vd1l/dcVzFW+CiflosE6m9xE0iw
	 z95D0p1LJjTbpKknzcc96wZ3fm4g5DY4VFRMfuXg=
Message-ID: <100de3fa-ce00-4dd5-9a50-9182968b5a8b@arm.com>
Date: Sat, 21 Nov 2026 10:48:13 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: mm: Add an ISB after remapping the KPTI
 page-table slot
To: Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, Kevin Brodsky
 <kevin.brodsky@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <tabba@google.com>, stable@vger.kernel.org
References: <20261120121638.194154-1-fuad.tabba@linux.dev>
 <20261120121638.194154-3-fuad.tabba@linux.dev>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20261120121638.194154-3-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_024818_699596_3232594B 
X-CRM114-Status: GOOD (  12.84  )
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
> kpti_map_pgtbl remaps a temporary slot with break-before-make, and
> kpti_mk_tbl_ng then reads the page tables through it. The make ends in
> a DSB alone, so the reads can fault on a translation of the slot made
> speculatively before the new entry was written. With the temporary page
> tables in TTBR1 the kernel's vectors are unmapped, and the boot hangs.
> 
> Add an ISB after the DSB.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> 
> Fixes: 47546a1912fc4 ("arm64: mm: install KPTI nG mappings with MMU enabled")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/mm/proc.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 12aacc74f7647..7ca36d59bf77f 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -262,6 +262,7 @@ SYM_FUNC_ALIAS(__pi_idmap_cpu_replace_ttbr1, idmap_cpu_replace_ttbr1)
>  	orr	pte, pte, pte_flags
>  	str	pte, [temp_pte, #8 * (\level + 2)]
>  	dsb	nshst
> +	isb
>  	.endm
>  
>  /*


