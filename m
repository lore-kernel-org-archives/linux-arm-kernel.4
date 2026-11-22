Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6573360A261C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J5a3CvTj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GU+0Ez9l;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PArQaV4k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=d2lwa4hINYYQ0nBeh+oY2ssfCU8F0ViMhnqiEfhLckw=; b=J5a3CvTjJT05DFlDRUJiG0spgp
	KwPRRByupFwsFs+cEjyQ3M6aDnxfbzeFhmi9A+wG2+kEXfEXG5toF63XyCgzA1afniJt5umFsLO0v
	WKKvx7tbjdZotqXF0C8n+uqAvYp778XQaOc9biGczlnQPbAZKCGr6q7c/SOCAxbp01JFCeWfk7CqN
	kTkFUxf36fXkNP2o0yeZT75Oa8QjhLZLFf8TUfA9eVYqKXg5qsu+iJ9hdaZNOPN6g+qkHFn2s6s8n
	exoVskXWhGzqkG4jBZezZMtGD4WY3uKA/582KXJTyvVBXj/SbMH3A701XraChYjpPqT//+Q5EUfZY
	LT1bamYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYi-00000001YOS-1Mxl;
	Sun, 22 Nov 2026 18:45:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYg-00000001YNZ-1O8v
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=d2lwa4hINYYQ0nBeh+oY2ssfCU8F0ViMhnqiEfhLckw=; b=GU+0Ez9lHTsKvmaKsZrPnClvHs
	o2DgQwVyekTYptQgQODU/0a91HON2qRIyLdN1pDuhd8Uu3araL9LY+EoNnyuCkmM9kgbaP/Tj4JcM
	j++RL+TU5YxOGbw7Scn6m+OVkGTMku0W4pUvSLHTEyMLBCi+9QN84qTq9gVyNNabmKx4c+u2CJClV
	JWlHgsu+rPzefAVSiJYpBo7HCLHWx5MhY5YsxIg6Ic5hkwv+672uJE5/SJGHbDoqvPWs3FqOw8YOG
	z4HOF5ytg8xelpjx4CYTE4C4CIZHS/a5qYJcgDKB6To0EmwpUhaHAslRsg0XwZiIu5Dwc0T4toSvq
	3T3HjsRQ==;
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYd-00000002R9L-1ekB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:01 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2f0578f1d51so22549435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373096; x=1795977896; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d2lwa4hINYYQ0nBeh+oY2ssfCU8F0ViMhnqiEfhLckw=;
        b=PArQaV4k9zY4S8qQOHnr/QzOosaad8fyBDtRgQkBmPGpVQwJv5v2lWjcXuXOVpyBLB
         tmDrKap2IczpGewWekcRJcOVvolgxu57FcCFtGNMzgEEFvr6LVqdCKXoQj6BdP4MQ3Vw
         T5NFuEBFCXi47gF2nhbtCQQT8OcvkhXb6hbSC+w9ynVYlUhdL1ZPm3/kJXyv0mpzMM1a
         B8Q1boOTOnzEqko4ujh2WEI8vQXvTKZUrPwbSQSayVCNJY85LItMDzjMdC0W0nWq78uC
         XSTN35goDnWXkwvR0E6JK42vfkjn+2mHotuFDY63RuSCf7sxZVX50nQSZ6WKts9cXpa+
         sq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373096; x=1795977896;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2lwa4hINYYQ0nBeh+oY2ssfCU8F0ViMhnqiEfhLckw=;
        b=MmQL/wDJ4rRPSk2FpKn6CDAR4mMLhWMq9Kl9VXY7nyEfQ6wnyAn8CEa6b+Ls0mvyh1
         SVxIsAAI+GgMgdfKsQNWMMfARx+bIvKg51lw9uG06cpKEG1cfUdjcRWmtIlCAqOgRwlO
         MaoDV2vAMcQxC46CaZww0B09mfqpQS58Be5igo3sjcSzPz5b/dZ5zEqj9AENzLyeZ6n+
         GtubMtMvlZyLMLJk7fYAJpeeaSWRocKWxV1jUuoUiBRIzeiMLLNSsXXancIHj5bzwu7/
         L03dVcse0RsEi1jT3INBahd27hkq4tFxvPcR9r75hDILrZ7WDIIQIBHPmX9ZNhS06ElQ
         ayOA==
X-Forwarded-Encrypted: i=1; AL+hErHaVAfARH3mm3w9dybafFdWPZKTHKG+AlVow/cs8LiwLYILTPZPd6ebEDFbaCwuQ0okrfuOWprys8ojqaETRaul@lists.infradead.org
X-Gm-Message-State: APuU4Z9wl2nUJExmCm9f/uTyrhHqUjqz/rK8iX6S68xIj4f5fu6jbf2A
	Ui8CY8gnx5KNHFGMycSHv5tXEqzvdnt4rlq0G5/USOX/SdNYtumGLC3fuhkL2X4Ao0vVfhwQBxp
	gSUnz+22Rfgw6x+x85SqRgQ==
X-Received: from pjbhl13.prod.google.com ([2002:a17:90b:134d:b0:3b4:6d3:e4ea])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:17cb:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b41cb20b9amr8960160a91.53.1795373095920;
 Sun, 22 Nov 2026 10:44:55 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:34 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-1-jthoughton@google.com>
Subject: [PATCH v3 00/19] Another attempt at HVO support on arm64
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_184459_499301_9387C52F 
X-CRM114-Status: GOOD (  36.13  )
X-Spam-Score: -7.6 (-------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi everyone,

This is v3 of the series to enable HVO on arm64.

This version of the series is based on mm-new (15f114dac9a7) plus
Muchun's "mm: Unify memmap initialization for compound pages" v3[2].
The first patch from v2 was sent standalone[3] and is currently in
mm-new, so it is not included in this series.

I realize this series might be difficult to reapply later, so I've also
uploaded it here: http://github.com/48ca/linux hvo-v3

As with last time, the last 5 patches are optional, and I've tagged
them as DO-NOT-MERGE, as it's unclear if using the AF trick to do
BBM-less block -> table transitions is architecturally sound without
BBML3. The patches should be mergeable if it is in fact sound.

The biggest changes since v2:

- Replaced "hugetlb: Fully initialize tail struct pages of
  non-pre-HVOed bootmem folios" with "hugetlb: Optimize bootmem folios
  that were not pre-HVOed". Muchun's series now initializes all tail
  struct pages of such folios, but it also drops the boot-time bulk
  optimization pass, assuming that all boot-time HVO folios are
  pre-HVOed. On arm64, HVO support is not known yet when bootmem folios
  are allocated, so they are not pre-HVOed and must be optimized when
  they are gathered. Muchun, I'd appreciate your thoughts on this one.

- Reworked "Leave pages partially HVOed upon restore failure" and "Use
  try_update_vmemmap_pte to update in-use PTEs" for the folio-oriented
  code. Restoring a folio now only remaps PTEs that still point at the
  shared tail page and frees any replacement pages that were not
  consumed, and vmemmap_pages list updates only happen once the PTE
  update has succeeded.

- bbm_through_af now checks the local CPU's ID_AA64MMFR1_EL1 when
  verifying a late CPU, instead of the sanitised value.

- New patch: "arm64/mm: Align vmemmap to maximal folio size". With
  CONFIG_VMEMMAP_OPTIMIZATION, compound_head() relies on head struct
  pages being naturally aligned, which arm64 did not guarantee (e.g.
  16G CONT_PMD folios with 64K pages). This mirrors the changes for
  riscv[4] and LoongArch[5]. (Thanks Muchun and Kefeng!)

- In "Allow architectures to dynamically disallow HVO": the arch hook
  is now the generic arch_support_vmemmap_remap(), and arm64 now
  disables the section-based vmemmap optimization with
  section_vmemmap_optimization_disable() in vmemmap_populate() instead
  of hugetlb_vmemmap_optimize_bootmem_page() checking for arch support.
  (Thanks Muchun!)

And some smaller changes:

- "arm64: Add bbm_through_af capability" now selects
  ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO itself, fixing a build
  failure (BUILD_BUG_ON) when bisecting.

- Renamed ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT to
  ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO. It now only makes the
  hugetlb_optimize_vmemmap sysctl read-only; vmemmap_optimize_enabled
  is no longer __ro_after_init.

- Removed an unused __HAVE_ARCH_TRY_UPDATE_VMEMMAP_PTE define.

- hugetlb_vmemmap_optimizable_size() now returns 0 when the architecture
  does not support HVO, so such hstates are no longer reported or
  treated as optimizable.

- Dropped "hugetlb_vmemmap: Disable HVO sysctl if arch doesn't support
  HVO". Now that hugetlb_vmemmap_optimizable_size() checks for arch
  support, the sysctl is not registered on such systems anyway.

- try_update_vmemmap_pte() is now defined outside of the
  CONFIG_ARM64_CONTPTE block, fixing the build with
  CONFIG_ARM64_CONTPTE=n.

- Documented fail_hugetlb_vmemmap_pte= and fail_hugetlb_vmemmap_pmd= in
  kernel-parameters.txt.

- Selftest: stop all worker processes (including in-flight dd/cat) at
  the end of each phase, so that they cannot race with the accounting
  checks, without blocking if a worker does not exit; drain surplus
  hugepages on cleanup; and don't treat "unmovable page" dumps from
  failed memory offlining as errors when running with -m.

v2: https://lore.kernel.org/linux-mm/20261003002123.505555-1-jthoughton@google.com/
v1: https://lore.kernel.org/linux-mm/20260708031129.3503195-1-jthoughton@google.com/

Claude Opus 5.5 was used while drafting this version of the series. Like
the last version, it was used to draft the selftests (hugely helpful),
and in this version of the series, it helped with finding some of the
smaller fixes and drafting some of the new patches. A local Sashiko run
pointed out the bbm_through_af error that is now fixed in this version.

Thanks!

And now for the rest of the background of these patches, updated from
v2's cover letter:

-- Background and Structure --

This patch series uses a trick with the Access Flag on CPUs that support
hardware update of the AF to update vmemmap page table entries without
introducing a time window where CPUs accessing the vmemmap might fault.

By avoiding faults, the HugeTLB vmemmap optimization (HVO) can be
implemented correctly on arm64 in a much more straightforward way than
previously attempted, most recently here[1] (please see [1] for a
breakdown of the other approaches attempted before).

For large-memory systems that allocate most of their available memory to
HugeTLB, HVO saves a huge amount of memory (1.5% of system memory).

This series has a few parts:
  1. Use LDCLR to clear the AF for PTEs (patch 1).
  2. Some preliminary HVO changes to support HVO on Arm (patches 2-8).
  3. arm64 changes to enable HVO (patches 9-12).
  4. Fault injection and a stress test (patches 13-14).
  5. Drop the BBML3 requirement for HVO (patches 15-19).

Part 5 is optional, and whether or not the claims it makes about the Arm
memory model are accurate is not 100% clear.

-- The AF trick --

The trick is that translations with the AF unset cannot be cached in the
TLB (see Rule R_DWZCQ in the Arm ARM), so they can be atomically updated
without needing a full break-before-make sequence.

So the PTE update sequence becomes:
  1. Atomically clear the AF on the existing PTE.
  2. Invalidate the TLB.
  3. cmpxchg the AF=0 PTE with the new PTE. If this fails, goto 1.

If there is a CPU on the system that does not support hardware access
flag updates, clearing the AF is problematic, as those CPUs might fault
on the vmemmap usage. Therefore, HVO compatibility checks all CPUs for
HW AF updates.

-- Application to HVO --

HVO relies on the following page table transitions:
  - When enabling HVO for a page, PMD block entries in the vmemmap are
    shattered into PMD table entries. The first vmemmap page of the
    folio is copied to a newly allocated page and remapped to it, and
    the remaining PTEs are remapped to a shared page of tail struct
    pages (that is, there is an OA change for every PTE).
  - When disabling HVO for a page, the PTEs that map the shared tail
    page are remapped to newly reallocated pages of struct pages. The
    PMD block -> table transition is not undone.

In part 3 of this series, I use the Access Flag trick to do the PTE
updates. We rely on BBML3 for the PMD block -> table transition.

In part 5, I re-use the Access Flag trick to do the PMD block -> table
transition without needing BBML3. For systems that support BBML3, the
logic is unchanged.

Because the in-place updates can fail (if the cmpxchg keeps losing the
race with hardware AF updates), HVO now handles failures at any point:
a failed optimization is rolled back, and if the rollback or a later
restore fails, the folio is left partially optimized (and remains marked
as such) rather than being freed with a broken vmemmap.

-- Late-onlining of CPUs that do not support HW AF --

HVO support is modeled as a system feature (called "BBM through AF"). If
not all early CPUs support the feature, attempts to HVO pages will fail,
and the HVO sysctl will be hidden.

To avoid penalizing systems that have asymmetric support for
BBM-through-AF (i.e., HW AF, as BBML3 cannot be mismatched),
BBM-through-AF will check that HVO is in fact enabled.

Because BBM-through-AF needs to know if HVO will be enabled when system
features are finalized, HVO cannot be dynamically enabled, hence the
patches that do this. (There are other ways to solve this, please see
v1).

-- Litmus test --

The following Herd litmus test demonstrates the PTE update routine:

  AArch64 TTDFaultlessUpdate
  Variant=vmsa
  TTHM=HA
  {
   uint64_t x=1;
   uint64_t y=2;
   [PTE(x)]=(oa:PA(x), af:1);
   0:X0=PTE(x); 1:X0=PTE(x);
   0:X1=x; 1:X1=x;
   pteval_t 0:X2=(oa:PA(x), af:0);
   pteval_t 0:X3=(oa:PA(y), af:1);
  }
   P0                | P1             ;
   LDR X4,[X0]       | L0:            ;
   MOV X5,X4         | LDR X2,[X1]    ;
   CAS X4,X2,[X0]    |                ;
   DSB ISHST         |                ;
   LSR X9,X1,#12     |                ;
   TLBI VAALE1IS,X9  |                ;
   DSB ISH           |                ;
   ISB               |                ;
   CAS X2,X3,[X0]    |                ;
  exists
    0:X5=0:X4 /\ (* First CAS must succeed *)
    (fault(P1:L0) \/ ~(1:X2=2 \/ 1:X2=1))

  (* This test should not contain "Warning-BBM-expected". *)

-- Testing --

I've tested this series with the included selftest, which stresses
the optimization, unoptimizing, and failure cases.

[1] https://lore.kernel.org/linux-arm-kernel/20241107202033.2721681-1-yuzhao@google.com/
[2] https://lore.kernel.org/linux-mm/20261120100856.16929-1-songmuchun@bytedance.com/
[3] https://lore.kernel.org/linux-mm/20261116221557.3128331-1-jthoughton@google.com/
[4] commit 476849b0fba4 ("riscv/mm: align vmemmap to maximal folio size")
[5] commit 2969b42c8f99 ("LoongArch/mm: align vmemmap to maximal folio size")

James Houghton (19):
  arm64/pgtable: Clear AF with LDCLR on supported systems
  hugetlb_vmemmap: Always flush TLB if needed upon PTE remapping
  hugetlb_vmemmap: Leave pages partially HVOed upon restore failure
  hugetlb_vmemmap: Use try_update_vmemmap_pte to update in-use PTEs
  hugetlb_vmemmap: Allow architectures to dynamically disallow HVO
  hugetlb: Optimize bootmem folios that were not pre-HVOed
  hugetlb_vmemmap: Allow architectures to make HVO enablement boot-time
    only
  hugetlb_vmemmap: Expose whether HVO is enabled to architecture code
  arm64: Add bbm_through_af capability
  arm64: Implement try_update_vmemmap_pte using the AF trick
  arm64/mm: Align vmemmap to maximal folio size
  arm64: Support hugetlb vmemmap optimization
  hugetlb_vmemmap: Add fault injection for in-place vmemmap PTE updates
  selftests/mm: Add HugeTLB vmemmap optimization stress test
  hugetlb_vmemmap: Use try_populate_vmemmap_pmd for replacing in-use
    PMDs
  arm64: Implement try_populate_vmemmap_pmd using AF trick
  arm64: Drop BBML3 requirement for HVO
  hugetlb_vmemmap: Add fault injection for in-place vmemmap PMD splits
  selftests/mm: Add HVO pmd-split fault injection tests

 .../admin-guide/kernel-parameters.txt         |   2 +
 Documentation/admin-guide/sysctl/vm.rst       |   3 +
 .../fault-injection/fault-injection.rst       |   8 +
 arch/arm64/Kconfig                            |   2 +
 arch/arm64/include/asm/cpufeature.h           |   5 +
 arch/arm64/include/asm/pgalloc.h              |  53 +++
 arch/arm64/include/asm/pgtable.h              |  73 +++-
 arch/arm64/kernel/cpufeature.c                |  32 ++
 arch/arm64/mm/init.c                          |  18 +-
 arch/arm64/mm/mmu.c                           |   9 +
 arch/arm64/tools/cpucaps                      |   1 +
 arch/loongarch/include/asm/pgalloc.h          |   2 +
 arch/loongarch/include/asm/pgtable.h          |   2 +
 arch/riscv/include/asm/pgalloc.h              |   2 +
 arch/riscv/include/asm/pgtable.h              |   2 +
 arch/x86/include/asm/pgalloc.h                |   2 +
 arch/x86/include/asm/pgtable.h                |   2 +
 fs/Kconfig                                    |   3 +-
 include/linux/hugetlb.h                       |   9 +
 include/linux/pgalloc.h                       |  21 +
 include/linux/pgtable.h                       |  37 ++
 lib/Kconfig.debug                             |   9 +
 mm/Kconfig                                    |   7 +
 mm/hugetlb.c                                  |  11 +
 mm/hugetlb_vmemmap.c                          | 164 +++++++-
 mm/hugetlb_vmemmap.h                          |   2 +
 tools/testing/selftests/mm/Makefile           |   2 +
 .../selftests/mm/hugetlb_vmemmap_stress.sh    | 384 ++++++++++++++++++
 .../selftests/mm/ksft_hugetlb_vmemmap.sh      |   4 +
 tools/testing/selftests/mm/run_vmtests.sh     |   4 +
 30 files changed, 839 insertions(+), 36 deletions(-)
 create mode 100755 tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
 create mode 100755 tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh


base-commit: 15f114dac9a7bde1796f0e54e22726fd31cfa8a5
prerequisite-patch-id: 79139d48d73311a6b93f3ef4fcf35e81fa62b439
prerequisite-patch-id: 1decdc13c91eb4c111978d0a81264c80ee150f5c
prerequisite-patch-id: 3e89010bdfb5265dd7629e0ac0cdd4188e1e0fcb
prerequisite-patch-id: a46914935c0d5a34a2fe8fc5894372a6f4d3a9b9
prerequisite-patch-id: f5cc7ae1c18a204b0fdcd3d5a8ca2dc4ab02ab9c
prerequisite-patch-id: fa40c383a05f7713030e8e45f2c1d32b1891d59f
prerequisite-patch-id: e4996c7f982db0996d3a6a223d866ba303ae9b38
prerequisite-patch-id: 6e33595454fa72593f0f87a84190b2960e95d28b
prerequisite-patch-id: b6d144f2e3d6166cd6361f8095f7b1fc723c989a
prerequisite-patch-id: 36ea05703be8c54a4adf89a86457a4c73f16bae5
prerequisite-patch-id: 94bb8e10c55ce80b9eef1314b387a9dd5840faea
-- 
2.56.1.809.ga0b61035b5-goog


