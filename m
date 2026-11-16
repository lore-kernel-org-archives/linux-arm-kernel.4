Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6217606A339
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wjt6G/qR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oT+R11gA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qoB7g+eS1ylSOIwCWgqOZHTyzN8hCooYymexDoSw87s=; b=Wjt6G/qRUhcPVg
	ki5kRUDHNHrbH8vO/iM224VRmiwC+nVEI8GnB69UD02f/NX8k5GQF9KOIOy5pV3aagSVNtCkmKorr
	2veFsir2bjI9h5lnbzhXv4ewszyk5HUFJ4fnkBWEgmXPk6oxR7EG2RAmxDlvoQ+WPJ88lm6J0enKS
	GnP4Yf/nqrBX1tfTXoJbydOlS/Lv0f2lUiOe386qmEyPmuh16dt/FgIOzMy9/7O31DC/oYM1IO0rP
	j8Viu1Y8UTwPZe4hYBtZDwt+4zSg9wS8JJNXj5S1Ab/QxPDZSS/gBipMFyfJRm68bVca+6BrmlnPW
	aT6rD/j1OAeEkgckw8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw9T-00000002TZC-289N;
	Mon, 16 Nov 2026 12:49:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw9S-00000002TXt-06a9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:49:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23542623F3;
	Mon, 16 Nov 2026 12:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370C91F000C9;
	Mon, 16 Nov 2026 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833376;
	bh=qoB7g+eS1ylSOIwCWgqOZHTyzN8hCooYymexDoSw87s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oT+R11gAH0vSoXIiJOgzL5DZMmDQu0VBOCSu1NCF69MwsOaOw3S5H6STg2aurkm0c
	 vCW0onxviZL+52Xf8/hkUgFDwBhS+P/Xdk8+xVC+TqH3AjBlK2cn2o8M59Bk35+/D+
	 HyuNnlNXE+gcEo2hmCEL4ySU52WuasJXDzj+2Cg9Xso1he/SYgpAqBCZzh6vXCs+Sz
	 tiNjF2YDbfxn06+Z5wAHK6xzHxQ+nicz9fLY2nmzj4XZNUMisfcXrk6CFuCxd/4ztr
	 z8CFOOoCbzImh3vqm+Una6IOlMn+BUfRY0PB69xSwdMElN+DfbcNrS/qi5HthWGdKL
	 mbMs0PLz9MS/w==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Malin Jonsson <malin.jonsson@est.tech>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH v3 09/10] mm: drop HIGHPTE support altogether
Date: Mon, 16 Nov 2026 13:48:31 +0100
Message-ID: <20261116124832.662455-10-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116124832.662455-1-arnd@kernel.org>
References: <20261116124832.662455-1-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arnd Bergmann <arnd@arndb.de>

With both x86 and arm having dropped CONFIG_HIGHPTE support, no
architecture is left using it, so remove the remnants in common code.

It is likely that further cleanups are possible in the page table
code but those are not obvious from the config options.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/hugetlb.h |  5 +----
 include/linux/mm.h      |  1 -
 include/linux/pgtable.h | 13 -------------
 mm/pgtable-generic.c    | 25 ++++++++++++-------------
 mm/userfaultfd.c        |  6 +-----
 5 files changed, 14 insertions(+), 36 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 58f755e70e96..7c6d191fdf50 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -178,7 +178,6 @@ void hugetlb_bootmem_set_nodes(void);
 
 /* arch callbacks */
 
-#ifndef CONFIG_HIGHPTE
 /*
  * pte_offset_huge() and pte_alloc_huge() are helpers for those architectures
  * which may go down to the lowest PTE level in their huge_pte_offset() and
@@ -193,7 +192,6 @@ static inline pte_t *pte_alloc_huge(struct mm_struct *mm, pmd_t *pmd,
 {
 	return pte_alloc(mm, pmd) ? NULL : pte_offset_huge(pmd, address);
 }
-#endif
 
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 			unsigned long addr, unsigned long sz);
@@ -1047,9 +1045,8 @@ static inline spinlock_t *huge_pte_lockptr(struct hstate *h,
 	 */
 	if (size >= PUD_SIZE)
 		return pud_lockptr(mm, (pud_t *) pte);
-	else if (size >= PMD_SIZE || IS_ENABLED(CONFIG_HIGHPTE))
+	else if (size >= PMD_SIZE)
 		return pmd_lockptr(mm, (pmd_t *) pte);
-	/* pte_alloc_huge() only applies with !CONFIG_HIGHPTE */
 	return ptep_lockptr(mm, pte);
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6af3b7008f1a..019de55bd796 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4025,7 +4025,6 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
 
 static inline spinlock_t *ptep_lockptr(struct mm_struct *mm, pte_t *pte)
 {
-	BUILD_BUG_ON(IS_ENABLED(CONFIG_HIGHPTE));
 	BUILD_BUG_ON(MAX_PTRS_PER_PTE * sizeof(pte_t) > PAGE_SIZE);
 	return ptlock_ptr(virt_to_ptdesc(pte));
 }
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b..594c309b1475 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -100,23 +100,10 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
 #define pte_offset_kernel pte_offset_kernel
 #endif
 
-#ifdef CONFIG_HIGHPTE
-#define __pte_map(pmd, address) \
-	((pte_t *)kmap_local_page(pmd_page(*(pmd))) + pte_index((address)))
-#define pte_unmap(pte)	do {	\
-	kunmap_local((pte));	\
-	rcu_read_unlock();	\
-} while (0)
-#else
-static inline pte_t *__pte_map(pmd_t *pmd, unsigned long address)
-{
-	return pte_offset_kernel(pmd, address);
-}
 static inline void pte_unmap(pte_t *pte)
 {
 	rcu_read_unlock();
 }
-#endif
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
 
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 6e83ce3801b8..f78b9d874b93 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -314,7 +314,7 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 		pmd_clear_bad(pmd);
 		goto nomap;
 	}
-	return __pte_map(&pmdval, addr);
+	return pte_offset_kernel(&pmdval, addr);
 nomap:
 	rcu_read_unlock();
 	return NULL;
@@ -353,11 +353,11 @@ pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
  * for read (or for write). In a few cases, it may be used with pmd pointing to
  * a pmd_t already copied to or constructed on the stack.
  *
- * When successful, it returns the pte pointer for addr, with its page table
- * kmapped if necessary (when CONFIG_HIGHPTE), and locked against concurrent
- * modification by software, with a pointer to that spinlock in ptlp (in some
- * configs mm->page_table_lock, in SPLIT_PTLOCK configs a spinlock in table's
- * struct page).  pte_unmap_unlock(pte, ptl) to unlock and unmap afterwards.
+ * When successful, it returns the pte pointer for addr, locked against
+ * concurrent modification by software, with a pointer to that spinlock in ptlp
+ * (in some configs mm->page_table_lock, in SPLIT_PTLOCK configs a spinlock in
+ * table's struct page).  pte_unmap_unlock(pte, ptl) to unlock and unmap
+ * afterwards.
  *
  * But it is unsuccessful, returning NULL with *ptlp unchanged, if there is no
  * page table at *pmd: if, for example, the page table has just been removed,
@@ -366,13 +366,12 @@ pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
  * page table can be safely removed or replaced by THP while holding its lock.)
  *
  * pte_offset_map(pmd, addr), and its internal helper __pte_offset_map() above,
- * just returns the pte pointer for addr, its page table kmapped if necessary;
- * or NULL if there is no page table at *pmd.  It does not attempt to lock the
- * page table, so cannot normally be used when the page table is to be updated,
- * or when entries read must be stable.  But it does take rcu_read_lock(): so
- * that even when page table is racily removed, it remains a valid though empty
- * and disconnected table.  Until pte_unmap(pte) unmaps and rcu_read_unlock()s
- * afterwards.
+ * just returns the pte pointer for addr, or NULL if there is no page table at
+ * *pmd.  It does not attempt to lock the page table, so cannot normally be
+ * used when the page table is to be updated, or when entries read must be
+ * stable.  But it does take rcu_read_lock(): so that even when page table is
+ * racily removed, it remains a valid though empty and disconnected table.
+ * Until pte_unmap(pte) unmaps and rcu_read_unlock()s afterwards.
  *
  * pte_offset_map_ro_nolock(mm, pmd, addr, ptlp), above, is like pte_offset_map();
  * but when successful, it also outputs a pointer to the spinlock in ptlp - as
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 169f681f9849..f6bf476abdcd 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1696,11 +1696,7 @@ static long move_pages_ptes(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd
 		folio_unlock(src_folio);
 		folio_put(src_folio);
 	}
-	/*
-	 * Unmap in reverse order (LIFO) to maintain proper kmap_local
-	 * index ordering when CONFIG_HIGHPTE is enabled. We mapped dst_pte
-	 * first, then src_pte, so we must unmap src_pte first, then dst_pte.
-	 */
+
 	if (src_pte)
 		pte_unmap(src_pte);
 	if (dst_pte)
-- 
2.53.0


