Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA91606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 03:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AWyIuvJi;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SGMR0g2y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1+cegTBR/Mxg4hlkws6xLAzLLN9NMMKBynuAC4t3778=; b=AWyIuvJiJa1d2+
	tN3cPHx8o7AmPUZqlObv7gAzPjlW2KjAFZiQjNUnBd90jVpVT/wCfZtUwkpm1TV53jhu+CbUIdzTl
	gGryz1/xxt8kb12HLAX2dW6rm2ci4kVZ3sf5o6AFulFIjprkqEP4n+m1g1DRbTvvG1kZaX8/FaEkZ
	Z9MtLOI+HbX/N1pAHi6CxbMABMeF4FPe7EI5a5EVjA9d1iYuEi+UEqyKH7Ot2NxLCSLDTRbjB6Iu5
	wqzuRmb/X27bb25WVs8MAe3OzPJwrqUk49gy4USF2lgL5dSh4rnkUaYl0DglORni/kL6DiklfG46W
	zKqQkr3ACWtjUSmy/u2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKhW-00000002CcW-3Efw;
	Mon, 23 Nov 2026 03:26:42 +0000
Received: from out-100.mta1.migadu.com ([2001:41d0:203:375::64] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKhT-00000002Cbo-3wR0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 03:26:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TkbWYCa4MJQ1BBcXLO39QWi9ZKwMLeD/PRh+069eUio=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795404397; v=1; x=1796009197;
 b=SGMR0g2ysyRhEClMqRQFseFUIrDyr0M4S+pk0yHCer23GYL8Lvu578d2pPzUlcnTeK9mJr+i
 Xd1BziDVTP2R919tmNm966/at3n5YCHGBXAFsr2DJ5nFpLANzVzJxR+x/ypn2Y3eY9Jb1K2WD+J
 glEVjcZZEcd3nsoOdHacvYag=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2ca7b3a68f8feb45;
	Mon, 23 Nov 2026 03:26:37 +0000
X-Mizu-Trace-ID: 2ca7b3a68f8feb45
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 12/19] arm64: Support hugetlb vmemmap optimization
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-13-jthoughton@google.com>
Date: Mon, 23 Nov 2026 11:26:12 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <64639588-CB39-4980-A9E3-8423AB0DF268@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-13-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_192640_168414_8150CB6F 
X-CRM114-Status: GOOD (  24.91  )
X-Spam-Score: -2.1 (--)
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



> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>=20
> Support HVO if HW AF and BBML3 are supported. These are the required
> features for the vmemmap to be modified in place.
>=20
> On arm64 systems that do not have the required hardware features to
> support HVO, the HVO sysctl will not appear, and any attempts to =
enable
> HVO (either via the command line or via
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=3Dy) will have no =
effect.
>=20
> Because HVO support is only known after the vmemmap has been =
populated,
> disable the section-based vmemmap optimization in vmemmap_populate(), =
as
> LoongArch and powerpc do. Boot-time HugeTLB folios are then optimized
> when they are gathered.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> arch/arm64/Kconfig               | 1 +
> arch/arm64/include/asm/pgtable.h | 6 ++++++
> arch/arm64/mm/mmu.c              | 9 +++++++++
> mm/hugetlb_vmemmap.c             | 4 ++++
> 4 files changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 4cce60c2de66..b13618f0ace5 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -95,6 +95,7 @@ config ARM64
> 	select ARCH_WANT_FRAME_POINTERS
> 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || =
(ARM64_16K_PAGES && !ARM64_VA_BITS_36)
> 	select ARCH_WANT_LD_ORPHAN_WARN
> +	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM
> 	select ARCH_WANTS_EXECMEM_LATE
> 	select ARCH_WANTS_NO_INSTR
> 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
> diff --git a/arch/arm64/include/asm/pgtable.h =
b/arch/arm64/include/asm/pgtable.h
> index 7421c0a048ff..5dadaac54bef 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1931,6 +1931,12 @@ static inline void =
clear_young_dirty_ptes(struct vm_area_struct *vma,
>=20
> #endif /* CONFIG_ARM64_CONTPTE */
>=20
> +#define arch_support_vmemmap_remap arch_support_vmemmap_remap
> +static inline bool arch_support_vmemmap_remap(void)
> +{
> +	return system_supports_bbm_through_af();
> +}
> +
> static inline int try_update_vmemmap_pte(unsigned long addr, pte_t =
*ptep,
> 					 const pte_t pte)
> {
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a61464cf7367..bc3eea16004c 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -30,6 +30,7 @@
> #include <linux/mm_inline.h>
> #include <linux/pagewalk.h>
> #include <linux/stop_machine.h>
> +#include <linux/vmemmap-optimization.h>
>=20
> #include <asm/barrier.h>
> #include <asm/cputype.h>
> @@ -1843,6 +1844,14 @@ int __meminit vmemmap_populate(unsigned long =
start, unsigned long end, int node,
> 	/* [start, end] should be within one section */
> 	WARN_ON_ONCE(end - start > PAGES_PER_SECTION * sizeof(struct =
page));
>=20
> +	/*
> +	 * Whether HVO is supported is only known once the system-wide =
CPU
> +	 * features have been finalized, which is after the vmemmap has =
been
> +	 * populated, so the section-based vmemmap optimization =
(pre-HVO) is

It's better to avoid the term of "pre-HVO", It's an obsolete term. All =
infrastructure
of it are removed now.

> +	 * not supported. Boot-time HugeTLB folios are optimized later =
instead.
> +	 */
> +	section_vmemmap_optimization_disable(start, end);
> +
> 	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
> 	    (end - start < PAGES_PER_SECTION * sizeof(struct page)))
> 		return vmemmap_populate_basepages(start, end, node, =
altmap);
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index fb6da64bd80d..a01377c37c96 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -79,6 +79,10 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct =
page *head, unsigned long start,
>=20
> 		/* Make pte visible before pmd. See comment in =
pmd_install(). */
> 		smp_wmb();
> +		/*
> +		 * On arm64, this requires BBML3. Its support has =
already been
> +		 * checked.
> +		 */

Please don't add an architecture specific comment here. That is =
something architecture
itself needs to consider.

Thanks,
Muchun

> 		pmd_populate_kernel(&init_mm, pmd, pgtable);
> 		/*
> 		 * Modern MMUs allow overlapping TLB entries with =
different mapping
> --=20
> 2.56.1.809.ga0b61035b5-goog
>=20


