Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC2860A2626
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uVvHPfO2;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DVZWanrd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XBmhljpBm36DpauCU/FC6A+ud2fsxJbY98dDN8rTn0E=; b=uVvHPfO2bFZxfr
	HGgg6yBOjYAZpG2zkUt+NeA43yhSgYHsv86eJN43tlr3GqimfI4b6dxYZF3+VxQ16tp5O5RMYTxIJ
	COHeeirwbPfPMDkFImTAzad3yC+PCyr2pgkoYklsI0RUkljTAZR7RqtV5N0GPSAJ/4ul+RFQjvIjn
	OzWZ8X8Ll26ur+LODV/JeFO2HSkWaqVdvFDdC2bOtqHeZRVwBtK6QUdgdOnuPLZUYkRmdp25sccFV
	5bXWeaPwUWdsvVxP3ygIEQWGYX5Iqu3dDAfLQJKYUiKC6LFaKlkRGJaRFksO0eRIgHiVeLxEg7DgR
	L0BdTbwOOu8SUuaogbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDHF-00000004i4F-3rat;
	Tue, 17 Nov 2026 07:06:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDH4-00000004hz9-47Ov
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:06:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 356CA1476;
	Mon, 16 Nov 2026 23:06:35 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C8DB3F763;
	Mon, 16 Nov 2026 23:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899198; bh=H9pPB228ZKcouR7EGAqs954E12//ZNJz1w9Ri3nVlDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DVZWanrdeOkLWYf6DEdxSEAPF1W6DW8GvjazZk2burG4qUVfM3Wu5X70vLTHHw2Ui
	 dwYx8ZTf4NFFsPBR67TsJhxeoAx1AwQJB9UZbpc5+Vi15DqVIH1PGqFkaDPo333Zbm
	 LChHw/uwrOD0IzjBpVI1AnnF19kJX03Yp2MZjfxU=
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
Subject: [PATCH V3 04/14] arm64/mm: Route all pgtable atomics to central helpers
Date: Tue, 17 Nov 2026 12:36:03 +0530
Message-ID: <20261117070613.1183243-5-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_230639_106557_41A899F9 
X-CRM114-Status: GOOD (  13.82  )
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

Route all cmpxchg() operations performed on various page table entries to a
new ptval_cmpxchg_relaxed() helper. Similarly route all xchg() operations
performed on page table entries to a new ptval_xchg_relaxed() helper.

Currently these helpers just forward to the same APIs that were previously
called direct, but in future we will change the routing for D128 which is
too long to use the standard APIs.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V3:

- Fixed indent problems in ___ptep_set_wrprotect() and __clear_young_dirty_pte()

 arch/arm64/include/asm/pgtable.h | 30 +++++++++++++++++++++---------
 arch/arm64/mm/fault.c            |  2 +-
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0ce2e59e09198..d3a50d35fd017 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -87,6 +87,17 @@ static inline void arch_leave_lazy_mmu_mode(void)
 #define ptval_get(x)		READ_ONCE(x)
 #define ptval_set(x, val)	WRITE_ONCE(x, val)
 
+static inline ptval_t ptval_cmpxchg_relaxed(ptval_t *ptep, ptval_t old,
+					      ptval_t new)
+{
+	return cmpxchg_relaxed(ptep, old, new);
+}
+
+static inline ptval_t ptval_xchg_relaxed(ptval_t *ptep, ptval_t new)
+{
+	return xchg_relaxed(ptep, new);
+}
+
 #define pmdp_get pmdp_get
 static inline pmd_t pmdp_get(const pmd_t *pmdp)
 {
@@ -1287,8 +1298,8 @@ static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
 	do {
 		old_pte = pte;
 		pte = pte_mkold(pte);
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
-					       pte_val(old_pte), pte_val(pte));
+		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
+						      pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 
 	return pte_young(pte);
@@ -1330,7 +1341,7 @@ static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
 					       pte_t *ptep,
 					       unsigned long pgsize)
 {
-	pte_t pte = __pte(xchg_relaxed(&pte_val(*ptep), 0));
+	pte_t pte = __pte(ptval_xchg_relaxed(&pte_val(*ptep), 0));
 
 	switch (pgsize) {
 	case PAGE_SIZE:
@@ -1406,8 +1417,8 @@ static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
 	do {
 		old_pte = pte;
 		pte = pte_wrprotect(pte);
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
-					       pte_val(old_pte), pte_val(pte));
+		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
+						     pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 }
 
@@ -1444,8 +1455,8 @@ static inline void __clear_young_dirty_pte(struct vm_area_struct *vma,
 		if (flags & CYDP_CLEAR_DIRTY)
 			pte = pte_mkclean(pte);
 
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
-					       pte_val(old_pte), pte_val(pte));
+		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
+						     pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 }
 
@@ -1483,7 +1494,7 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
 	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
-	return __pmd(xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
+	return __pmd(ptval_xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
 }
 #endif
 
@@ -1813,7 +1824,8 @@ static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
 {
 	pteval_t old = 0;
 
-	if (!try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte)))
+	old = ptval_cmpxchg_relaxed(&pte_val(*ptep), old, pte_val(new_pte));
+	if (old != 0)
 		return false;
 
 	/*
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b489fbeeb070..74bbcd49f52fc 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -244,7 +244,7 @@ int __ptep_set_access_flags_anysz(struct vm_area_struct *vma,
 		pteval ^= PTE_RDONLY;
 		pteval |= pte_val(entry);
 		pteval ^= PTE_RDONLY;
-		pteval = cmpxchg_relaxed(&pte_val(*ptep), old_pteval, pteval);
+		pteval = ptval_cmpxchg_relaxed(&pte_val(*ptep), old_pteval, pteval);
 	} while (pteval != old_pteval);
 
 	/*
-- 
2.43.0


