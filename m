Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B9D606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NOl/lenP;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=e+jFczCL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DK2z9R2aNAMo3cpbyc0iXvLVMBFbNb2nl1yBHrZjVC8=; b=NOl/lenP9dXuhLe7nyJgrye7Fd
	WIdR+xRavu/J7q5vAqkE+Kz2eQhSi+M18b02rcf4vaV+sQqLg1Bhhws113eaPx8Hyn3HaG7nIAMsV
	OiZYRaj7RHfugPTJteOopuIAAtMa0PRcB8DSATgdF/b94AgUzIiloqA+nS4/5o8r89dY2yTa1vpD3
	APxga59dJOo4a3m5FzxjSwUJ0wJ/TMBnRoc2dm7ko7sPKCew+Da8XFVIjJMEuUV3POEBi4E0YexjS
	aKQN26oWGlIVHOVJO9Ewotzez9DxHtl8UPHXHPPNQosrVBjRqOtTfMYCdqyklq4VRq+w1BW2SMgMS
	n5BVwlMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDGv-00000004hv5-1XTe;
	Tue, 17 Nov 2026 07:06:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDGr-00000004hu4-1Ssy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:06:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00F531476;
	Mon, 16 Nov 2026 23:06:20 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 387743F763;
	Mon, 16 Nov 2026 23:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899182; bh=D5+Eq+T7MAw8bpJAmSIS1rTAXl9Z1ZNiIKrmuflYZwI=;
	h=From:To:Cc:Subject:Date:From;
	b=e+jFczCLGQAOioqneFFj22S+yLP1wxiFrMoYIvhEJdmXZKlBAYZLCM4Ua+5oPS+jn
	 FmVGsdDV86NuZT4zJlqcEPMq5dfQTd12+pizhKnHpSoUC6+1QTp9SZ4QjV6wediHgz
	 ywunezzOP0QFUytM3sHdnwQiHZ01kLuVYXx/No3Q=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V3 00/14] arm64/mm: Enable 128 bit page table entries
Date: Tue, 17 Nov 2026 12:35:59 +0530
Message-ID: <20261117070613.1183243-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_230625_562770_ECCD8C5C 
X-CRM114-Status: GOOD (  21.01  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
arm64 platforms with FEAT_D128 enabled will now have two different memory
translation systems i.e VMSAv8-64 and VMSAv9-128.

FEAT_D128 adds 128 bit page table entries, thus supporting larger physical
and virtual address range while also expanding available room for more MMU
feature bits for both HW and SW usage.

A new config option ARM64_D128 is being added thus enabling users to chose
between aforementioned memory translations regimes VMSAv8-64 (aka D64) and
VMSAv9-128 (aka D128) during the build time. If the ARM64_D128 built kernel
does not detect FEAT_D128 feature on the hardware, then it gets stuck with
with a new reason code CPU_STUCK_REASON_NO_D128. So ARM64_D128 built kernel
cannot fallback to D64 translation regime on unsupported HW. Besides config
ARM64_D128 is only available with CONFIG_EXPERT.

ARM64_[VA|PA]_BITS combinations for respective CONFIG_ARM64_XXK_PAGES are
now supported both on VMSAv8-64 and VMSAv9-128 memory translation regimes.
Although FEAT_D128 provided 52 bit VA and PA space along with skip levels
are not supported currently.

Basic page table geometry has also been changed with VMSAv9-128, as there
are fewer entries per level as compared to VMSAv8-64. Please refer to the
following table for various leaf entry sizes including the cont entries.

------------------------------------------------
|           |       D64      |       D128      |
------------------------------------------------
| PAGE_SIZE |   PMD  |  PUD  |   PMD  |   PUD  |
-----------------------------|-----------------|
|     4K    |    2M  |  1G   |    1M  |  256M  |
|    16K    |   32M  | 64G   |   16M  |   16G  |
|    64K    |  512M  |  4T   |  256M  |    1T  |
------------------------------------------------

--------------------------------------------------------------------
|           |            D64           |             D128          |
--------------------------------------------------------------------
| PAGE_SIZE |   CONT_PTE  |  CONT_PMD  |   CONT_PTE  |   CONT_PMD  |
--------------------------|------------|-------------|--------------
|     4K    |     64K     |     32M    |     64K     |      16M    |
|    16K    |      2M     |      1G    |      1M     |     256M    |
|    64K    |      2M     |     16G    |      1M     |      16G    |
--------------------------------------------------------------------

Besides arm64 kernel features such as KVM and UNMAP_KERNEL_AT_EL0 are not
supported currently. This series applies on v7.4-rc3 after applying the
following posted earlier.

https://lore.kernel.org/all/20261117012758.3814093-1-anshuman.khandual@arm.com/

There are no apparent problems while running MM kselftests with and without
CONFIG_ARM64_D128 being enabled on various pgtable geometry configurations.

For referfence

git@git.gitlab.arm.com:linux-arm/linux-anshuman.git (arm64_d128_V3)

Changes in V3:

- Rebased on v7.4-rc3
- Add const pgprot_t * in pgprot_read() both for generic and arm64 per David
- Fixed indent problems in ___ptep_set_wrprotect() and __clear_young_dirty_pte()
- Updated commit message for the 5-level fixmap patch per David

Changes in V2:

https://lore.kernel.org/all/20260907035030.2839978-1-anshuman.khandual@arm.com/

- Rebased on v7.3-rc1
- Enabled KASAN on D128 - dropped !KASAN dependency from CONFIG_ARM64_D128
- Split out pgtable printf standardizsation into a separate series
- Split out READ_ONCE() conversion into separate series
- Added d128.config for testing ARM64_D128 enabled kernels in CI environment

Changes in V1:

https://lore.kernel.org/all/20260729122452.3797443-1-anshuman.khandual@arm.com/

- Rebased on v7.2-rc5
- Pulled in new standardized pgtable entry print patch
- Added standardized pgtable entry print on arm64 platform
- Added KASAN related pgdp_get() changes missing earlier
- Renamed pxxval_get/set() as ptval_get/set()
- Renamed ptval_cmpxchg_relaxed() and ptval_xchg_relaxed()
- Renamed tlbi_args_t as tlbi_arg_t per Ryan
- Split final D128 enablement patch into four separate ones
- Updated all commit messages as required

Changes in RFC V2:

https://lore.kernel.org/all/20260513044547.4128549-1-anshuman.khandual@arm.com/

- Dropped some patches that were merged upstream and rebased on v7.1-rc3
- Updated commit message for the 5-level fixmap change per David
- Moved pxdval_t definition inside generic page table header
- Dropped _once from pgprot_read/write() per Mike
- Updated ARM64_CONT_[PTE|PMD]_SHIFT both for 16K and 64K base pages
- Renamed __PRIpte as __PRIpxx per David
- Added abstraction for tlbi_op
- Adopted TLBIP implementation to recent TLB flush changes
- Moved back all helpers back from arch/arm64/mm/mmu.c into the header
- Moved arm64 pgtable header READ_ONCE() replacements later in the series
- Renamed all ptdesc_ instances as pxxval_ instead
- Updated all commit messages as required and suggested
- Restored print format in __print_bad_page_map_pgtable() per Usama

Changes in RFC V1:

https://lore.kernel.org/linux-arm-kernel/20260224051153.3150613-2-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (12):
  mm: Add read-write accessors for vm_page_prot
  arm64/mm: Route all pgtable reads via ptval_get()
  arm64/mm: Route all pgtable writes via ptval_set()
  arm64/mm: Route all pgtable atomics to central helpers
  arm64/mm: Override read-write accessors for vm_page_prot
  arm64/mm: Enable fixmap with 5 level page table
  arm64/mm: Enable pgtable geometry for FEAT_D128
  arm64/mm: Enable pgtable descriptor for FEAT_D128
  arm64/mm: Enable 128 bit translation
  arm64/mm: Relax KASAN shadow alignment for FEAT_D128
  arm64/mm: Make ARM64_D128 selectable
  arm64/configs: Add d128.config

Linu Cherian (2):
  arm64/mm: Add an abstraction level for tlbi_op
  arm64/mm: Enable TLBIP instruction based TLB flush

 arch/arm64/Kconfig                     |  50 ++++++++-
 arch/arm64/Makefile                    |   4 +
 arch/arm64/configs/d128.config         |   6 ++
 arch/arm64/include/asm/assembler.h     |   4 +-
 arch/arm64/include/asm/el2_setup.h     |   9 ++
 arch/arm64/include/asm/pgtable-hwdef.h | 137 ++++++++++++++++++++++++
 arch/arm64/include/asm/pgtable-prot.h  |  20 +++-
 arch/arm64/include/asm/pgtable-types.h |   4 +
 arch/arm64/include/asm/pgtable.h       | 120 +++++++++++++++++----
 arch/arm64/include/asm/smp.h           |   1 +
 arch/arm64/include/asm/tlbflush.h      | 138 +++++++++++++++++--------
 arch/arm64/kernel/head.S               |  12 +++
 arch/arm64/mm/fault.c                  |   2 +-
 arch/arm64/mm/fixmap.c                 |  18 +++-
 arch/arm64/mm/kasan_init.c             |   4 +-
 arch/arm64/mm/mmu.c                    |   4 +-
 arch/arm64/mm/proc.S                   |  25 ++++-
 include/linux/pgtable.h                |  14 +++
 mm/huge_memory.c                       |   4 +-
 mm/memory.c                            |   2 +-
 mm/migrate.c                           |   2 +-
 mm/mmap.c                              |   2 +-
 22 files changed, 497 insertions(+), 85 deletions(-)
 create mode 100644 arch/arm64/configs/d128.config

-- 
2.43.0


