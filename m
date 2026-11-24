Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E703C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RS9Tf7kb;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uyS0uad2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+3hZmmjdGAbIUFaURgCd0rN5E6bZhKjLrYHk5hB6lCI=; b=RS9Tf7kb4zlr6u7+gHL+Gqd6Yn
	lRkWr91TPrlD1To/tnSe874paavGamWhA1u9zoCjQYgY0Rlr01ZlPvMxQu6Pi7nOrs64lGIwQlt4v
	OxzXR7t56WdXb/PzYG7Hm6Gj7ARfgKByFk7X+miyVJ/BUwlRlcCIlGnNc9p6oK6/W0ideA7eCGXHL
	cniP0Zvw5RA13wCwcpmwtlFrpsUbt+sLRj1D+0IAZgx/pIdCxWn0zNHRiZ6Qx+ZEKX+6HGxRcYekc
	1y1ZhcFBKRiav23Jne+fhbkFekZ7iVuhBJW616/EydlOy5MdXi6EbvwFtYUuB/qq8XBrIlemAP8hc
	fbScT5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt6n-000000074AC-1L9t;
	Tue, 24 Nov 2026 16:11:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt6j-0000000749L-0p8G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:11:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C981339;
	Tue, 24 Nov 2026 08:10:57 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A6AF3F86C;
	Tue, 24 Nov 2026 08:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795536660; bh=p/KCMH8AjHrrntbvJyfGXGcKxAMK6NHv+k3lXnBmCdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uyS0uad2H7yAitY7PNlw/9nw1YVzLML57ue2KgWGcaUzqiW9okVo6dD7IudPE7I83
	 FKpHSfeoU0gmH9JG9neCn4nxwb8+xw29BkEoutD3khGr4+0Qu9BokM4oQgBoN8r8wG
	 ulNaTgZfZ2RXvPyCp11l5KoqT26Wx3K5WqXHhibc=
Date: Tue, 24 Nov 2026 16:10:55 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yadong Qi <yadong.qi@linux.alibaba.com>
Cc: will@kernel.org, mark.rutland@arm.com, ying.huang@linux.alibaba.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com, robh@kernel.org, gregkh@linuxfoundation.org,
	ptg-linux-kernel@linux.alibaba.com, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: fixmap: fix missing break-before-make in
 __set_fixmap()
Message-ID: <awW3Dw743-rw_-cf@arm.com>
References: <20261123093505.974-1-yadong.qi@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123093505.974-1-yadong.qi@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_081101_358047_F8358CD3 
X-CRM114-Status: GOOD (  17.42  )
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

On Mon, Nov 23, 2026 at 05:35:05PM +0800, Yadong Qi wrote:
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index f66a0016dd02..5593d7e0d523 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -126,12 +126,19 @@ void __set_fixmap(enum fixed_addresses idx,
>  
>  	ptep = fixmap_pte(addr);
>  
> -	if (pgprot_val(flags)) {
> -		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> -	} else {
> +	/*
> +	 * Break-before-make: when the slot still holds a valid mapping
> +	 * (e.g. earlycon re-mapping FIX_EARLYCON_MEM_BASE), invalidate the
> +	 * old entry and flush the TLB entries caching it before a new
> +	 * mapping is installed, so old and new translations never coexist.
> +	 */
> +	if (pte_valid(__ptep_get(ptep))) {
>  		__pte_clear(&init_mm, addr, ptep);
> -		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);
> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>  	}
> +
> +	if (pgprot_val(flags))
> +		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
>  }

I guess that's easier than getting the driver or earlycon code to do
clear_fixmap(). Note that I queued Fuad's patches for missing barriers
onto arm64 for-next/fixes, so please rebase on top.

Sashiko also has a valid point about keeping the TLB flush unconditional
for the clear_fixmap() case:

https://sashiko.dev/#/patchset/20261123093505.974-1-yadong.qi@linux.alibaba.com

-- 
Catalin

