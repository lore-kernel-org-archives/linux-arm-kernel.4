Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FDD606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WCfW26AT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfI/L2eY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VytgQi4p8wcmmELrEfY15mVmpLYzi4XAlS7bqFMpaOA=; b=WCfW26AThGrPw5keyCw/1Y2Qti
	tywjVqZq8XdCz19wu6gxP+9WKYJOrQFKmztH5GqYAARMpV7adRCf4FUaffyiDAXnMVaFUsVsu+YKJ
	KbU/MlDDAt73evP5EMxzGJQICt07l2GBtNV/u+QrUSA07ogLSymrP1RL3qy/AjmA0MB3ltbZMde3C
	hQ0xEAnm/Hqw3MMBxI3RURCiIlbP2YLatCczhb1eR0lAqlvNcZ/+G+UDsTbmU0DWzYrnCAZznQUvM
	gnNNsyHSWf+9yO5lZgv1CzY5lZ6keZEKls2cio1D2AMM8+XeZM+skytxw0FLD0w0JoZsd1QIr162a
	2nxQ0LRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwDq-0000000Dylp-1g4J;
	Fri, 13 Nov 2026 18:42:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwDo-0000000DylE-1dJg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:42:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFC84615E4;
	Fri, 13 Nov 2026 18:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0221F000C4;
	Fri, 13 Nov 2026 18:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794595319;
	bh=VytgQi4p8wcmmELrEfY15mVmpLYzi4XAlS7bqFMpaOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cfI/L2eY2qjwVL7APHC67QJOIGk/JNOUabcKBMNTHVN19Rcz72eUV6Yh3y5Ea/LHZ
	 z5QbQ0lofex0YKPkP/CrCot0WtLB3Iun9cb9TpGzWGq7i0diBi7RiTfH+PMAtEzL2+
	 C0j/tS7srsbkDAQQkLK7ashTa4LxtBlawzOcVQduTw15A7JC0FoBx70BE+lVHeY9Dq
	 c07fq9ZOjzPKmREqLefO5blbiTlVapyN80u0xRg/xm4Y01ZY7klw7sdg1ydyXEPskb
	 46DP+YMZNRJ2jvH8liJQifBhGUdO/X8ERo88dTaNWRmserH3XKGKSg7PzJ1GdT/0k3
	 sU3CZpk80JuTg==
Date: Fri, 13 Nov 2026 18:41:52 +0000
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
Subject: Re: [PATCH v2 3/6] ARM: drop CONFIG_HIGHPTE support
Message-ID: <avdZ5SCLnUg29Te8@gremlin>
References: <20261112112528.1116405-1-arnd@kernel.org>
 <20261112112528.1116405-4-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112112528.1116405-4-arnd@kernel.org>
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

On Thu, Nov 12, 2026 at 12:25:25PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> CONFIG_HIGHPTE was added in linux-2.6.32, a few years before 64-bit
> support. At the time it made sense, as the CONFIG_ARM_LPAE option allowed
> systems with 16GB of memory that made lowmem a particularly scarce
> resource, and the HIGHPTE implementation gave feature parity with 32-bit
> x86 and frv machines.
>
> Since Arm is the last architecture remaining that uses this, and almost
> no 32-bit machines support more than 4GB of RAM, the cost of continuing
> to maintain HIGHPTE seems unjustified, so remove it here to allow
> simplifying the generic page table handling.
>
> Link: https://lore.kernel.org/lkml/20241204103042.1904639-8-arnd@kernel.org/T/#u
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I sent a patch to drop HIGHPTE support on x86 today, see
> https://lore.kernel.org/lkml/20241210144945.2325330-9-arnd@kernel.org/T/#u
>
> If that one gets merged, we can merge this one instead of the one
> that makes HIGHPTE depend on !PREEMPT_RT, but if we decide against
> the x86 change, then we probably don't want this one either.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

With Mike's change applied, LGTM and:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  arch/arm/Kconfig               | 11 -----------
>  arch/arm/include/asm/pgalloc.h |  8 +-------
>  2 files changed, 1 insertion(+), 18 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index fd01ccab9c12..fc66d52d847e 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1225,17 +1225,6 @@ config HIGHMEM
>
>  	  If unsure, say n.
>
> -config HIGHPTE
> -	bool "Allocate 2nd-level pagetables from highmem" if EXPERT
> -	depends on HIGHMEM && !PREEMPT_RT
> -	default y
> -	help
> -	  The VM uses one page of physical memory for each page table.
> -	  For systems with a lot of processes, this can use a lot of
> -	  precious low memory, eventually leading to low memory being
> -	  consumed by page tables.  Setting this option will allow
> -	  user-space 2nd level page tables to reside in high memory.
> -
>  config ARM_PAN
>  	bool "Enable privileged no-access"
>  	depends on MMU
> diff --git a/arch/arm/include/asm/pgalloc.h b/arch/arm/include/asm/pgalloc.h
> index a17f01235c29..ef6cb3e6d179 100644
> --- a/arch/arm/include/asm/pgalloc.h
> +++ b/arch/arm/include/asm/pgalloc.h
> @@ -85,18 +85,12 @@ pte_alloc_one_kernel(struct mm_struct *mm)
>  	return pte;
>  }
>
> -#ifdef CONFIG_HIGHPTE
> -#define PGTABLE_HIGHMEM __GFP_HIGHMEM
> -#else
> -#define PGTABLE_HIGHMEM 0
> -#endif
> -
>  static inline pgtable_t
>  pte_alloc_one(struct mm_struct *mm)
>  {
>  	struct page *pte;
>
> -	pte = __pte_alloc_one(mm, GFP_PGTABLE_USER | PGTABLE_HIGHMEM);
> +	pte = __pte_alloc_one(mm, GFP_PGTABLE_USER);
>  	if (!pte)
>  		return NULL;
>  	if (!PageHighMem(pte))
> --
> 2.53.0
>

--
Cheers, Lorenzo

