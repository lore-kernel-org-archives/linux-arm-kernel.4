Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5F7606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 06:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mmcaoCq8;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PLiMgy2m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p0Q+aPh9FXmspSlImRXpx816BsnlvW0umQZjVoRPYEU=; b=mmcaoCq8foiBi7
	KpZRApOCFFtNH3LJ33B6QemGAIUFNs4xY2QWMZvY/ecMFfL6lHdwlWEhL/qefLuTx6rHA1WokTgRy
	xMrioFGDhX26tB3oJaps4mCrC4Uct6xoZoblBMmjietdiGRkBz/PcDHBJAsTxcQ1pxabW0xQcHJTN
	kYBDdcI3RqBGtVLs/nqFi2JFETyq0mcopHMO++0ERaiucjfBFO0ILVtGibVUkbEIUpO3Dk4IUuYQn
	GPRqZDxVSR+XfcfnNbyyzoTdcPMHIAeoI6HqAVugmmksxWtpGVejWt47eqlPBd2rtY+IhvuCpbJ+M
	DUuGdEEVZa4q5odBkeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaBH-0000000EHhH-2ux2;
	Sat, 07 Nov 2026 06:45:39 +0000
Received: from out-156.mta0.migadu.com ([2001:41d0:1004:224b::9c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaBC-0000000EHgn-2RGr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 06:45:35 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=l8FwMw+tmHQ7yeBnzjT9XdJgKx4elexMVrnBE3P9GII=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794033932; v=1; x=1794638732;
 b=PLiMgy2mkCsCeBwAzcCbel54H98GbsWHqYUPAwA5TRiOgHIetnjEEAApj6O5kb7uV3oKEhxR
 LGsMaFY4sLqQldb0T6GTheqink0+up+b5DfPjNWpu057NaTIe9xJfNGONa4kUuFMRghIbI0vCPD
 uLnvROtZzHXdMzbJHO5d1TDk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id c05da5992c7d8cdf;
	Sat, 07 Nov 2026 06:45:29 +0000
X-Mizu-Trace-ID: c05da5992c7d8cdf
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 13/20] arm64: Support hugetlb vmemmap optimization
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003002123.505555-14-jthoughton@google.com>
Date: Sat, 7 Nov 2026 14:45:11 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
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
Message-Id: <CAF9824D-CDC5-48E6-A1F6-840CB299EADB@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-14-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_224534_766831_80977E00 
X-CRM114-Status: GOOD (  19.84  )
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



> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
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
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> arch/arm64/Kconfig               | 2 ++
> arch/arm64/include/asm/hugetlb.h | 7 +++++++
> mm/hugetlb_vmemmap.c             | 4 ++++
> 3 files changed, 13 insertions(+)
>=20
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b51d23a62c92..e4c87487bc7f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -92,7 +92,9 @@ config ARM64
> 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
> 	select ARCH_WANT_FRAME_POINTERS
> 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || =
(ARM64_16K_PAGES && !ARM64_VA_BITS_36)
> +	select ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
> 	select ARCH_WANT_LD_ORPHAN_WARN
> +	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM

Because vmemmap optimization depends on compound_info_has_mask(), before
enabling HVO on arm64, its vmemmap start address needs to be aligned to
MAX_FOLIO_VMEMMAP_ALIGN. Therefore, a prerequisite patch is required.

Thanks,
Muchun

> 	select ARCH_WANTS_EXECMEM_LATE
> 	select ARCH_WANTS_NO_INSTR
> 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
> diff --git a/arch/arm64/include/asm/hugetlb.h =
b/arch/arm64/include/asm/hugetlb.h
> index d038ff14d16c..938d7896a31e 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -11,6 +11,7 @@
> #define __ASM_HUGETLB_H
>=20
> #include <asm/cacheflush.h>
> +#include <asm/cpufeature.h>
> #include <asm/mte.h>
> #include <asm/page.h>
>=20
> @@ -65,6 +66,12 @@ extern void huge_ptep_modify_prot_commit(struct =
vm_area_struct *vma,
> 					 unsigned long addr, pte_t =
*ptep,
> 					 pte_t old_pte, pte_t new_pte);
>=20
> +#define __HAVE_ARCH_HVO_SUPPORTED
> +static inline bool arch_hugetlb_vmemmap_optimization_supported(void)
> +{
> +	return system_supports_bbm_through_af();
> +}
> +
> #include <asm-generic/hugetlb.h>
>=20
> static inline void __flush_hugetlb_tlb_range(struct vm_area_struct =
*vma,
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index c1c736dd08b9..fabf2b25fe59 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -85,6 +85,10 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct =
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
> 		pmd_populate_kernel(&init_mm, pmd, pgtable);
> 		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
> 			flush_tlb_kernel_range(start, start + PMD_SIZE);
> --=20
> 2.56.0.rc1.315.gc6ed9934b7-goog
>=20


