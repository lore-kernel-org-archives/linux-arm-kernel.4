Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804F4606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pkP2RCqP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPgY3ZKm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v+u8WOi6enSXf9p1uj17AxTmnZ64Z9UB12nhM5b0wBk=; b=pkP2RCqPbM9+JX
	Js6SndiitBP0lJF/jG/dXRjiUZ5mETMUUbjmTe1IdIQPpYlEJ48zJJKgY6B5e76PuS1wc8C+vMnra
	Bmj7fzyV7RsU7TVy0lVamxlD0h6SOyCUVCG7Fpyy2+txu2x4tcv6AoireOb7p6heaNmch+gxqwHsy
	ZsnPwF/QuQOMizAP+AXfx/fxWeVSRYgU3ZUbau3luHvbInqTaggFgZfOTF1QjoavcpsOgcuPCq+yL
	VF5GeTGs6lxV85rLO796Zf3p0BPMFe8WTJlgv3vG122qD9mBvAtaE0AaSxvhxLvNOjYbI7GLqb8Z0
	azlUV7KxJheLbSVVk8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwvP-00000002f0b-0K1p;
	Mon, 16 Nov 2026 13:39:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwvN-00000002f0S-3KgZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:39:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE8A961D1F;
	Mon, 16 Nov 2026 13:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809881F000C9;
	Mon, 16 Nov 2026 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794836348;
	bh=v+u8WOi6enSXf9p1uj17AxTmnZ64Z9UB12nhM5b0wBk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lPgY3ZKmD+AWK6OsqmvR2cCzK6j6u/WxfP3iaSyX9l+sr/3pxKSwrPdAxFUmB9xHS
	 Te4LG33kqlHxat/w0CkHdvZDbte0OMXN6muIL0x7x/arXg19Oq+TkrYgugukT86AIP
	 fBQDoHj+srBScbYERGJVtYGkySVWbQmNxiPyppwSnff8r1Gg1X48YTJ0M5spgri9sZ
	 cgtJFF25gMSdEn28dVFmDAaN0XSm5PAYY5CqRCitHfF55dnu7PV8zepEY0Q/zX8K79
	 MrjkPdaIuSw/y1vNQhJjd47gBkODFnoQwepsvQQyFNRel7sOC5ngZ+n7SoMLX7mQHl
	 QgBPPOdHcj0UQ==
Message-ID: <afebfaf5-f3ee-4234-875d-e5ebf1ee64fd@kernel.org>
Date: Mon, 16 Nov 2026 14:38:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] powerpc: kvm: allow flexible PAGE_OFFSET
To: Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Linus Walleij <linusw@kernel.org>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Malin Jonsson <malin.jonsson@est.tech>, Matthew Wilcox
 <willy@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>, Mike Rapoport <rppt@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nishanth Menon <nm@ti.com>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
References: <20261116124832.662455-1-arnd@kernel.org>
 <20261116124832.662455-5-arnd@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20261116124832.662455-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Arnd,

Le 16/11/2026 à 13:48, Arnd Bergmann a écrit :
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As described by the Sashiko bot, the KVM code on powerpc has multiple
> hardcoded PAGE_OFFSET values. In order to change the default, make these
> compute the correct register values from configuration symbols.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/powerpc/kvm/book3s_32_sr.S     | 4 ++--
>   arch/powerpc/kvm/booke_interrupts.S | 4 ++--
>   arch/powerpc/kvm/e500_mmu_host.c    | 3 ++-
>   3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_32_sr.S b/arch/powerpc/kvm/book3s_32_sr.S
> index 6cfcd20d4668..0d8a7857f2bd 100644
> --- a/arch/powerpc/kvm/book3s_32_sr.S
> +++ b/arch/powerpc/kvm/book3s_32_sr.S
> @@ -113,8 +113,8 @@
>   
>           li      r0, 4
>           mtctr   r0
> -	LOAD_REG_IMMEDIATE(r3, 0x20000000 | (0x111 * 0xc))
> -        lis     r4, 0xc000
> +	LOAD_REG_IMMEDIATE(r3, 0x20000000 | (0x111 * (PAGE_OFFSET >> 28)))
> +        lis     r4, (PAGE_OFFSET >> 16)

This is not enough I think. You need to load ctr with the number of 
segments you want to populate. Here above it is hardcoded to 4.

>   3:      mtsrin  r3, r4
>           addi    r3, r3, 0x111     /* increment VSID */
>           addis   r4, r4, 0x1000    /* address of next segment */
> diff --git a/arch/powerpc/kvm/booke_interrupts.S b/arch/powerpc/kvm/booke_interrupts.S
> index 205545d820a1..ede394f3f63f 100644
> --- a/arch/powerpc/kvm/booke_interrupts.S
> +++ b/arch/powerpc/kvm/booke_interrupts.S
> @@ -230,8 +230,8 @@ _GLOBAL(kvmppc_resume_host)
>   #endif
>   
>   	/* Restore host IVPR before re-enabling interrupts. We cheat and know
> -	 * that Linux IVPR is always 0xc0000000. */
> -	lis	r3, 0xc000
> +	 * that Linux IVPR is always PAGE_OFFSET. */
> +	lis	r3, PAGE_OFFSET >> 16

Maybe use PAGE_OFFSET@h instead of PAGE_OFFSET >> 16.

>   	mtspr	SPRN_IVPR, r3

That's probably valid but wouldn't it be more correct to use 
interrupt_base@h as in head_44x.S and head_85xx.S :

	lis	r4,interrupt_base@h	/* IVPR only uses the high 16-bits */
	mtspr	SPRN_IVPR,r4

>   
>   	/* Switch to kernel stack and jump to handler. */
> diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
> index fa6128119874..9edad9bed589 100644
> --- a/arch/powerpc/kvm/e500_mmu_host.c
> +++ b/arch/powerpc/kvm/e500_mmu_host.c
> @@ -115,7 +115,8 @@ static u32 get_host_mas0(unsigned long eaddr)
>   	mtspr(SPRN_MAS6, 0);
>   	mas4 = mfspr(SPRN_MAS4);
>   	mtspr(SPRN_MAS4, mas4 & ~MAS4_TLBSEL_MASK);
> -	asm volatile("tlbsx 0, %0" : : "b" (eaddr & ~CONFIG_PAGE_OFFSET));
> +	asm volatile("tlbsx 0, %0" :
> +		: "b" (eaddr & (rounddown_pow_of_two(PAGE_OFFSET)-1)));

I think this is not valid.

With PAGE_OFFSET equal to 0xc0000000,

Before:

eaddr & 0x3fffffff

Now:

eaddr & (0x80000000 - 1) = eaddr & 0x7fffffff

>   	mas0 = mfspr(SPRN_MAS0);
>   	mtspr(SPRN_MAS4, mas4);
>   	local_irq_restore(flags);

Christophe

