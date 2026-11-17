Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15863606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HWWs3u4t;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=h5CrYLpt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4uA3Sv8ytCCOw7MeX7toFmQOLlM5lQ9hHEuSPO73dnQ=; b=HWWs3u4tzyXPOgiS6bUS4KTn9n
	RrKneXLvpJu3quIris2wnqUwCmn+yL3ult6G+EqQ8Au1+wGs+W6MyVyCHNmC3jPEC/NDYRhsP9tNl
	75/Zm18eeCygUECkSHbjGglcJy6fTMav1ap7V5rb9lMD14F7wpCPdpsVh6uCHLxIWEaj7uPonvZ6H
	ZocySDxwyPL25t05iywtzi6jQ2p3RUsLzNurv+hDCVLKQlXu75JM4M+JgnpJPX76nbn9lO+/51/CC
	uij7sBI36W68GXLASWjtiMUXtfzclcNhN8VoK0vTeU/qZxKqniToAmPhVYppd2mV87+NesEUb7QRK
	5JthC93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8XE-00000004LZt-2knH;
	Tue, 17 Nov 2026 02:03:02 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8X4-00000004LVo-0OMS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:02:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4uA3Sv8ytCCOw7MeX7toFmQOLlM5lQ9hHEuSPO73dnQ=;
	b=h5CrYLptzwHdrgv+0XVhIrE/aphC5MF1MhP/WPSiFWabXk2gNAf5X2IHr/vC0Spugfctft8Ef
	se5ykmjhSwwDH1kJm/O/rjXa9G4trYsjgt9SbZLmyHI8716PxohKlq9pv5hnoTqDJ3thJ/gbcMn
	7zkSbZu35EVtKUH3gXuONYQ=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jT7Jp534xz1T4hS;
	Tue, 17 Nov 2026 10:02:02 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 8CF274056E;
	Tue, 17 Nov 2026 10:02:40 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 10:02:39 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<ryan.roberts@arm.com>, <peterx@redhat.com>, <dave.jiang@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH v2 4/4] arm64: Add PUD THP support for DAX and pfnmap
Date: Tue, 17 Nov 2026 10:02:37 +0800
Message-ID: <20261117020237.4037980-5-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117020237.4037980-1-tujinjiang@huawei.com>
References: <20261117020237.4037980-1-tujinjiang@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_180250_495844_2E12D216 
X-CRM114-Status: GOOD (  12.54  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the necessary page table functions to deal with PUD THP, this enables
PUD THP for DAX and pfnmap.

I tested with CONFIG_DEBUG_VM_PGTABLE and CONFIG_PAGE_TABLE_CHECK enabled.
I wrote a test driver that invokes vmf_insert_pfn_pud() in the huge_fault
callback.  Page table setup works as expected with no errors, and userspace
read/write access to the PUD-sized mapping is verified correct.

Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
---
 arch/arm64/Kconfig               |  1 +
 arch/arm64/include/asm/pgtable.h | 81 +++++++++++++++++++++++++++++---
 2 files changed, 76 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..808d7106df34 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -173,6 +173,7 @@ config ARM64
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
+	select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD if PAGE_SIZE_4KB
 	select HAVE_ARCH_VMAP_STACK
 	select HAVE_ARM_SMCCC
 	select HAVE_ASM_MODVERSIONS
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 3c1c000cc5dd..2dc6aa3096d8 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -573,6 +573,11 @@ static inline pmd_t pmd_mkhuge(pmd_t pmd)
 #define pmd_mkspecial(pmd)	pte_pmd(pte_mkspecial(pmd_pte(pmd)))
 #endif
 
+#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
+#define pud_special(pud)	pte_special(pud_pte(pud))
+#define pud_mkspecial(pud)	pte_pud(pte_mkspecial(pud_pte(pud)))
+#endif
+
 #define __pmd_to_phys(pmd)	__pte_to_phys(pmd_pte(pmd))
 #define __phys_to_pmd_val(phys)	__phys_to_pte_val(phys)
 #define pmd_pfn(pmd)		((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT)
@@ -581,8 +586,15 @@ static inline pmd_t pmd_mkhuge(pmd_t pmd)
 #define pud_young(pud)		pte_young(pud_pte(pud))
 #define pud_mkyoung(pud)	pte_pud(pte_mkyoung(pud_pte(pud)))
 #define pud_mkwrite_novma(pud)	pte_pud(pte_mkwrite_novma(pud_pte(pud)))
+#define pud_mkwrite(pud)	pud_mkwrite_novma(pud)
 #define pud_mkvalid_k(pud)	pte_pud(pte_mkvalid_k(pud_pte(pud)))
 #define pud_write(pud)		pte_write(pud_pte(pud))
+#define pud_dirty(pud)		pte_dirty(pud_pte(pud))
+#define pud_wrprotect(pud)	pte_pud(pte_wrprotect(pud_pte(pud)))
+#define pud_mkdirty(pud)	pte_pud(pte_mkdirty(pud_pte(pud)))
+#define pud_mkold(pud)		pte_pud(pte_mkold(pud_pte(pud)))
+#define pud_mkinvalid(pud)	pte_pud(pte_mkinvalid(pud_pte(pud)))
+#define pud_mkclean(pud)	pte_pud(pte_mkclean(pud_pte(pud)))
 
 static inline pud_t pud_mkhuge(pud_t pud)
 {
@@ -738,6 +750,13 @@ static inline bool pmd_leaf(pmd_t pmd)
 #define pmd_leaf_size(pmd)	(pmd_cont(pmd) ? CONT_PMD_SIZE : PMD_SIZE)
 #define pte_leaf_size(pte)	(pte_cont(pte) ? CONT_PTE_SIZE : PAGE_SIZE)
 
+#if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS < 3
+static inline bool pud_table(pud_t pud) { return true; }
+#else
+#define pud_table(pud)		((pud_val(pud) & PUD_TYPE_MASK) == \
+				 PUD_TYPE_TABLE)
+#endif
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline int pmd_trans_huge(pmd_t pmd)
 {
@@ -747,14 +766,15 @@ static inline int pmd_trans_huge(pmd_t pmd)
 	 */
 	return pmd_present(pmd) && !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
 }
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-#if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS < 3
-static inline bool pud_table(pud_t pud) { return true; }
-#else
-#define pud_table(pud)		((pud_val(pud) & PUD_TYPE_MASK) == \
-				 PUD_TYPE_TABLE)
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+static inline int pud_trans_huge(pud_t pud)
+{
+	return pte_present(pud_pte(pud)) &&
+	       !pud_table(__pud(pud_val(pud) | PTE_VALID));
+}
 #endif
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 extern pgd_t swapper_pg_dir[];
 extern pgd_t idmap_pg_dir[];
@@ -1187,6 +1207,11 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 	return pte_pmd(pte_modify(pmd_pte(pmd), newprot));
 }
 
+static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
+{
+	return pte_pud(pte_modify(pud_pte(pud), newprot));
+}
+
 extern int __ptep_set_access_flags_anysz(struct vm_area_struct *vma,
 					 unsigned long address, pte_t *ptep,
 					 pte_t entry, int dirty,
@@ -1209,7 +1234,17 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 	return __ptep_set_access_flags_anysz(vma, address, (pte_t *)pmdp,
 					     pmd_pte(entry), dirty, PMD_SIZE);
 }
+
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+static inline int pudp_set_access_flags(struct vm_area_struct *vma,
+					unsigned long address, pud_t *pudp,
+					pud_t entry, int dirty)
+{
+	return __ptep_set_access_flags_anysz(vma, address, (pte_t *)pudp,
+					     pud_pte(entry), dirty, PUD_SIZE);
+}
 #endif
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
 static inline bool pte_user_accessible_page(struct mm_struct *mm, unsigned long addr, pte_t pte)
@@ -1285,6 +1320,14 @@ static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
 
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+static inline bool pudp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pud_t *pudp)
+{
+	return __ptep_test_and_clear_young(vma, address, (pte_t *)pudp);
+}
+#endif
+
 static inline pte_t __ptep_get_and_clear_anysz(struct mm_struct *mm,
 					       unsigned long address,
 					       pte_t *ptep,
@@ -1355,6 +1398,15 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 {
 	return pte_pmd(__ptep_get_and_clear_anysz(mm, address, (pte_t *)pmdp, PMD_SIZE));
 }
+
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+#define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR
+static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
+					unsigned long address, pud_t *pudp)
+{
+	return pte_pud(__ptep_get_and_clear_anysz(mm, address, (pte_t *)pudp, PUD_SIZE));
+}
+#endif
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
@@ -1445,7 +1497,23 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	return __pmd(xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
 }
+
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+#define __HAVE_ARCH_PUDP_SET_WRPROTECT
+static inline void pudp_set_wrprotect(struct mm_struct *mm,
+				      unsigned long address, pud_t *pudp)
+{
+	__ptep_set_wrprotect(mm, address, (pte_t *)pudp);
+}
+
+static inline pud_t pudp_establish(struct vm_area_struct *vma,
+		unsigned long address, pud_t *pudp, pud_t pud)
+{
+	page_table_check_pud_set(vma->vm_mm, address, pudp, pud);
+	return __pud(xchg_relaxed(&pud_val(*pudp), pud_val(pud)));
+}
 #endif
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 /*
  * Encode and decode a swap entry:
@@ -1521,6 +1589,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 #define update_mmu_cache_pmd(vma, address, pmd) do { } while (0)
+#define update_mmu_cache_pud(vma, address, pud) do { } while (0)
 
 #ifdef CONFIG_ARM64_PA_BITS_52
 #define phys_to_ttbr(addr)	(((addr) | ((addr) >> 46)) & TTBR_BADDR_MASK_52)
-- 
2.54.0


