Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FF8606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 01:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ougIolhk;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PAN/pUC2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3sAwd1OYAPtJIvp0+aMwt5En8YYbp7SOke9HmZYmXQI=; b=ougIolhk0Zmyr5
	QO9Dh9DJUxI6wepj3ZoNpTawqZO0Y04tVfGJ0ZiGU4vkzquTpG0SivbZpuOOGmchUFm5aah3bEyEa
	RTPlJC7wRmUzSGbL0brxPu6rFfNqwQaDcD+El53x4fyY1woQcikk7qMidTuD7UvE+o44GovwBsUL0
	yp97FrTmxPBbDBGPXKjtD+JKH90sTexWr72i1+wDgJc+6nklavjzGPBrvrHQ8wblBxAr56ys40Ooi
	YZVAYPQvOoqHqLsJF8JJsZ4EwJVAwbgZl+qxMFbDFvf25WvNIHx4UC8FDbUd5zxnwZYlSETppRZ7t
	S1/+Hty8iXqoe1iYqv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7zY-00000004JRN-30Xm;
	Tue, 17 Nov 2026 01:28:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7zV-00000004JQM-3wPF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 01:28:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 748E11713;
	Mon, 16 Nov 2026 17:28:06 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB7C33F673;
	Mon, 16 Nov 2026 17:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794878889; bh=Xd+QiLg/zLEQsMd+uVJstDo2hqAQSLN8dcnm4H1eZjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PAN/pUC2L/FBgaVu75eJXYRml4uyMdvP2AP9BisVu6j936oDdHWW1T/GowAwiPAbs
	 C8lTSbjNZmKrq3OVEIMp/caM9mLFcasZhm8iPMXOWYwYPIbjWknG9DG06jpSogAVN9
	 BTOmL3ftNRSi3j7ixphTG6je8eTRbidbdB8O24xY=
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
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com
Subject: [PATCH V5 1/4] arm64/mm: Use pmdp_get() for PMD accesses
Date: Tue, 17 Nov 2026 06:57:55 +0530
Message-ID: <20261117012758.3814093-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117012758.3814093-1-anshuman.khandual@arm.com>
References: <20261117012758.3814093-1-anshuman.khandual@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_172810_062605_E5934508 
X-CRM114-Status: GOOD (  24.06  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace READ_ONCE() with pmdp_get() for PMD accesses in preparation for
supporting both D64 and D128 translation table formats.

READ_ONCE() cannot currently be used for 128-bit page table entries on
arm64 because it does not provide the required 128-bit single-copy
atomicity, causing builds to fail for accesses wider than 64 bits.

Although LDP/STP provide the required atomicity when FEAT_LSE is
available (as required by FEAT_D128), extending READ_ONCE() to support
128-bit accesses is undesirable. READ_ONCE() is a general-purpose API,
so doing so could encourage other 128-bit users that would either fail
to build in configurations without D128 support or, if D128 becomes a
runtime option, silently permit tearing on systems without the required
hardware support.

Instead, standardize PMD accesses on the existing page-table helpers.
These can be overridden on arm64 to provide 128-bit single-copy
atomicity when required.

Override pmdp_get() on arm64 platform. Although the same as the generic MM
default fallback for pmdp_get(), it does help avoid a build problem while
converting READ_ONCE() in pmdp_test_and_clear_young() because of a cyclic
dependency between <linux/pgtable.h> and <asm/pgtable.h>.

No functional change intended.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kasan-dev@googlegroups.com
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 11 +++++++++--
 arch/arm64/mm/fault.c            |  2 +-
 arch/arm64/mm/fixmap.c           |  2 +-
 arch/arm64/mm/hugetlbpage.c      |  2 +-
 arch/arm64/mm/kasan_init.c       |  4 ++--
 arch/arm64/mm/mmu.c              | 22 +++++++++++-----------
 arch/arm64/mm/pageattr.c         |  2 +-
 arch/arm64/mm/trans_pgd.c        |  2 +-
 8 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a474c9fb485a..ab5641f60fa3 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -84,6 +84,12 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	arch_flush_lazy_mmu_mode();
 }
 
+#define pmdp_get pmdp_get
+static inline pmd_t pmdp_get(const pmd_t *pmdp)
+{
+	return READ_ONCE(*pmdp);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 
@@ -811,7 +817,8 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 }
 
 /* Find an entry in the third-level page table. */
-#define pte_offset_phys(dir,addr)	(pmd_page_paddr(READ_ONCE(*(dir))) + pte_index(addr) * sizeof(pte_t))
+#define pte_offset_phys(dir, addr)	(pmd_page_paddr(pmdp_get(dir)) + \
+					 pte_index(addr) * sizeof(pte_t))
 
 #define pte_set_fixmap(addr)		((pte_t *)set_fixmap_offset(FIX_PTE, addr))
 #define pte_set_fixmap_offset(pmd, addr)	pte_set_fixmap(pte_offset_phys(pmd, addr))
@@ -1291,7 +1298,7 @@ static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp)
 {
 	/* Operation applies to PMD table entry only if FEAT_HAFT is enabled */
-	VM_WARN_ON(pmd_table(READ_ONCE(*pmdp)) && !system_supports_haft());
+	VM_WARN_ON(pmd_table(pmdp_get(pmdp)) && !system_supports_haft());
 	return __ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index b22736853fcd..33b05a9f13d7 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -188,7 +188,7 @@ static void show_pte(unsigned long addr)
 			break;
 
 		pmdp = pmd_offset_lockless(pudp, pud, addr);
-		pmd = READ_ONCE(*pmdp);
+		pmd = pmdp_get(pmdp);
 		ptval_to_str(pxd_str, pmd_val(pmd));
 		pr_cont(", pmd=%s", pxd_str);
 		if (pmd_none(pmd) || pmd_bad(pmd))
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index f66a0016dd02..3cdac8021d4f 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -42,7 +42,7 @@ static inline pte_t *fixmap_pte(unsigned long addr)
 
 static void __init early_fixmap_init_pte(pmd_t *pmdp, unsigned long addr)
 {
-	pmd_t pmd = READ_ONCE(*pmdp);
+	pmd_t pmd = pmdp_get(pmdp);
 	pte_t *ptep;
 
 	if (pmd_none(pmd)) {
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index ff1f53e435e1..301b5b7265a2 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -304,7 +304,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 		addr &= CONT_PMD_MASK;
 
 	pmdp = pmd_offset(pudp, addr);
-	pmd = READ_ONCE(*pmdp);
+	pmd = pmdp_get(pmdp);
 	if (!(sz == PMD_SIZE || sz == CONT_PMD_SIZE) &&
 	    pmd_none(pmd))
 		return NULL;
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index 45fbdce684c8..7ca833c5de5e 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -62,7 +62,7 @@ static phys_addr_t __init kasan_alloc_raw_page(int node)
 static pte_t *__init kasan_pte_offset(pmd_t *pmdp, unsigned long addr, int node,
 				      bool early)
 {
-	if (pmd_none(READ_ONCE(*pmdp))) {
+	if (pmd_none(pmdp_get(pmdp))) {
 		phys_addr_t pte_phys = early ?
 				__pa_symbol(kasan_early_shadow_pte)
 					: kasan_alloc_zeroed_page(node);
@@ -138,7 +138,7 @@ static void __init kasan_pmd_populate(pud_t *pudp, unsigned long addr,
 	do {
 		next = pmd_addr_end(addr, end);
 		kasan_pte_populate(pmdp, addr, next, node, early);
-	} while (pmdp++, addr = next, addr != end && pmd_none(READ_ONCE(*pmdp)));
+	} while (pmdp++, addr = next, addr != end && pmd_none(pmdp_get(pmdp)));
 }
 
 static void __init kasan_pud_populate(p4d_t *p4dp, unsigned long addr,
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 140520b351e2..0433033c0a71 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -200,7 +200,7 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 			       int flags)
 {
 	unsigned long next;
-	pmd_t pmd = READ_ONCE(*pmdp);
+	pmd_t pmd = pmdp_get(pmdp);
 	pte_t *ptep;
 
 	BUG_ON(pmd_leaf(pmd));
@@ -257,7 +257,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 	unsigned long next;
 
 	do {
-		pmd_t old_pmd = READ_ONCE(*pmdp);
+		pmd_t old_pmd = pmdp_get(pmdp);
 
 		next = pmd_addr_end(addr, end);
 
@@ -272,7 +272,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			 * only allow updates to the permission attributes.
 			 */
 			BUG_ON(!pgattr_change_is_safe(pmd_val(old_pmd),
-						      READ_ONCE(pmd_val(*pmdp))));
+						      pmd_val(pmdp_get(pmdp))));
 		} else {
 			int ret;
 
@@ -282,7 +282,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 				return ret;
 
 			VM_WARN_ON_ONCE(pmd_val(old_pmd) != 0 &&
-					pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
+					pmd_val(old_pmd) != pmd_val(pmdp_get(pmdp)));
 		}
 		phys += next - addr;
 	} while (pmdp++, addr = next, addr != end);
@@ -293,7 +293,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 static bool pmd_range_has_valid_noncont(pmd_t *pmdp)
 {
 	for (int i = 0; i < CONT_PMDS; i++) {
-		pte_t pte = pmd_pte(READ_ONCE(pmdp[i]));
+		pte_t pte = pmd_pte(pmdp_get(pmdp + i));
 
 		if (pte_valid(pte) && !pte_cont(pte))
 			return true;
@@ -1553,7 +1553,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 	do {
 		next = pmd_addr_end(addr, end);
 		pmdp = pmd_offset(pudp, addr);
-		pmd = READ_ONCE(*pmdp);
+		pmd = pmdp_get(pmdp);
 		if (pmd_none(pmd))
 			continue;
 
@@ -1708,7 +1708,7 @@ static void free_empty_pmd_table(pud_t *pudp, unsigned long addr,
 	do {
 		next = pmd_addr_end(addr, end);
 		pmdp = pmd_offset(pudp, addr);
-		pmd = READ_ONCE(*pmdp);
+		pmd = pmdp_get(pmdp);
 		if (pmd_none(pmd))
 			continue;
 
@@ -1729,7 +1729,7 @@ static void free_empty_pmd_table(pud_t *pudp, unsigned long addr,
 	 */
 	pmdp = pmd_offset(pudp, 0UL);
 	for (i = 0; i < PTRS_PER_PMD; i++) {
-		if (!pmd_none(READ_ONCE(pmdp[i])))
+		if (!pmd_none(pmdp_get(pmdp + i)))
 			return;
 	}
 
@@ -1881,7 +1881,7 @@ int pmd_set_huge(pmd_t *pmdp, phys_addr_t phys, pgprot_t prot)
 	pmd_t new_pmd = pfn_pmd(__phys_to_pfn(phys), mk_pmd_sect_prot(prot));
 
 	/* Only allow permission changes for now */
-	if (!pgattr_change_is_safe(READ_ONCE(pmd_val(*pmdp)),
+	if (!pgattr_change_is_safe(pmd_val(pmdp_get(pmdp)),
 				   pmd_val(new_pmd)))
 		return 0;
 
@@ -1906,7 +1906,7 @@ int pud_clear_huge(pud_t *pudp)
 
 int pmd_clear_huge(pmd_t *pmdp)
 {
-	if (!pmd_leaf(READ_ONCE(*pmdp)))
+	if (!pmd_leaf(pmdp_get(pmdp)))
 		return 0;
 	pmd_clear(pmdp);
 	return 1;
@@ -1917,7 +1917,7 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 	pte_t *table;
 	pmd_t pmd;
 
-	pmd = READ_ONCE(*pmdp);
+	pmd = pmdp_get(pmdp);
 
 	if (!pmd_table(pmd)) {
 		VM_WARN_ON(1);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index de7bf95003ea..bf1fd1258a75 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -362,7 +362,7 @@ bool kernel_page_present(struct page *page)
 		return pud_valid(pud);
 
 	pmdp = pmd_offset(pudp, addr);
-	pmd = READ_ONCE(*pmdp);
+	pmd = pmdp_get(pmdp);
 	if (pmd_none(pmd))
 		return false;
 	if (pmd_leaf(pmd))
diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index cca9706a875c..b27b2d2c20c3 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -74,7 +74,7 @@ static int copy_pmd(struct trans_pgd_info *info, pud_t *dst_pudp,
 
 	src_pmdp = pmd_offset(src_pudp, start);
 	do {
-		pmd_t pmd = READ_ONCE(*src_pmdp);
+		pmd_t pmd = pmdp_get(src_pmdp);
 
 		next = pmd_addr_end(addr, end);
 		if (pmd_none(pmd))
-- 
2.43.0


