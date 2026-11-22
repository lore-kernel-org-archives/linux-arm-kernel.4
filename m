Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFEA606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cpnlovza;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bDAvqX4H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DyoGyMPHCZrPmXyDUiOnFwReVbPTH0j6B6OLTrZnNqc=; b=cpnlovzagftFdTfbT2QWwzdiGB
	vAsji9068x4Eyg9D2Mw0FZNuRS5Yhpk4Qiv4T5Y4GlNKfCx4uFNJfVmHLLY3owhdN+yA6FPOpZs0t
	7bfNOxeP1pAiAr1fkuJgC2kNpPQkzdfAddPVtrPAGboay3fvZHuL1O2In8PT02ViCL3gEDESF2QRG
	R57e/Qn6kxiAyCbQGSME1EhRB9T7q64fcOAFNFWt4tMDK32nQM360YQfusjg2H46YwaOklv2SdYkf
	RGIJDcXoRe+n8nnutQxMlQL4B1zdjBQWVJYPo4HkZXqE6mg6Lc9pd1Yw0VrZ1zncUSlcs7h3hX73F
	wqCS3H3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ8-00000001Yo6-2rru;
	Sun, 22 Nov 2026 18:45:30 +0000
Received: from mail-pl1-f197.google.com ([209.85.214.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYu-00000001YVW-32et
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:17 +0000
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f033dc37cfso25176725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373115; x=1795977915; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyoGyMPHCZrPmXyDUiOnFwReVbPTH0j6B6OLTrZnNqc=;
        b=bDAvqX4HBfauv7MHQN5ZWF1qBbgABQ7mUmJDMTP1w98x8wPtwnQoIbZCNjGGaBD14M
         lqGXMpJzrOEM1+ICVYDAWvUrbKDivkNBmPIykJu3iVqEVtjHtX6ijmBLUQPEs3A/5AaK
         k/zy4Lx3rUb8FDn9OHiRMY6Je0/eRPi5WbRFu94oOG8kR0z/XIIdR7i1wdtKjd+A7Vr1
         pE683+YRB/jGXl1LwADh7QX5XtsFuMOT3+RIOIQJkIQ7xYqbnORzPhlyGE9GYFVr8eAa
         iugOeawXKe9xpUjPdLVneVmtPA+4TVAl1Dj8uNwDGM5s8lzaamgjiYoF3grp4q3C1r4p
         NpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373115; x=1795977915;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyoGyMPHCZrPmXyDUiOnFwReVbPTH0j6B6OLTrZnNqc=;
        b=gGrUYQhAP0nDWHR9c0v8UrwqBrtizZFgCQrgXPNNx0k/64GG/JXEr+ItMXu5ZxpiQR
         XNa6vHZhFtSGXLwxpds+fDfY9H9aUfm/v+y0Lb2cOR5oraqGYES5CVvd+QDfLkoyJsSR
         T3eas8s8S5aSO+wGTZavLWlLDpTWDtiKzeG+oaGSOMOUqJ71flPnnYzvHM8YxB2OgPYt
         zJQiqmOauheAujjK+CYH52rl//teBg2xUJnKInPL4M4MD0b2VH/rk0LKfI1p9+HsYLNz
         7UPyinaHkdMmcqV4pRymZL6B7cp5ScDM0jE7DTKudMKSOHo94nrjKmAppKMym8jM9ttZ
         7dbw==
X-Forwarded-Encrypted: i=1; AL+hErGEZDEEAmBoh7jKLVhI+T5oHYDl/+pjSYFizOYuwq0+ENhUQArZluxwAOnfOC3UvBFQgimrXpYziIDDfZ66O72V@lists.infradead.org
X-Gm-Message-State: APuU4Z9YIbHczCvN7r8BaUd2xVIs3DCInaFJ/xObnfosoYwB47G81SaN
	FWt3vSLQeX0U7PzS7ALtTvzoO1gRcNy13fhLCfbdLTioJMpN9TZaXRZux/RNU2jDecnFk5yU9HG
	i+s0ASeI1DbF/a7s552cJ5A==
X-Received: from plgp1.prod.google.com ([2002:a17:902:ebc1:b0:2ef:d19c:27b7])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e80b:b0:2ed:ef1:f78 with SMTP id d9443c01a7336-2f03f11824amr92868135ad.21.1795373114972;
 Sun, 22 Nov 2026 10:45:14 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:49 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-16-jthoughton@google.com>
Subject: [PATCH v3 15/19 DO-NOT-MERGE] hugetlb_vmemmap: Use
 try_populate_vmemmap_pmd for replacing in-use PMDs
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
X-CRM114-CacheID: sfid-20261122_104516_772756_5BB75BE0 
X-CRM114-Status: GOOD (  20.75  )
X-Spam-Score: -9.5 (---------)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This routine is to be used for updating in-use, leaf-level PMDs in the
vmemmap without introducing a window where vmemmap accesses might fault.

Because try_populate_vmemmap_pmd() can fail, the split_page() call needs
to be moved to after the PMD update. Because both split_page() and the
PMD update are done under the page table lock, this rearrangement is
safe.

Only leaf-level PMD to non-leaf PMD (mapping the same physical pages) is
the only transition that needs to be supported.

Collapsing a non-leaf PMD to a leaf-level PMD is not used by HVO, so
try_populate_vmemmap_pmd() need not support it.

This patch allows arm64's implementation to replaced with one that does
not require BBML3.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgalloc.h     |  8 ++++++++
 arch/loongarch/include/asm/pgalloc.h |  2 ++
 arch/riscv/include/asm/pgalloc.h     |  2 ++
 arch/x86/include/asm/pgalloc.h       |  2 ++
 include/linux/pgalloc.h              | 21 +++++++++++++++++++++
 mm/hugetlb_vmemmap.c                 | 25 ++++++++++++++-----------
 6 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 1b4509d3382c..0263329fb7b3 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -121,4 +121,12 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
 		       PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_PXN);
 }
 
+static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
+					   pte_t *pgtable)
+{
+	/* BBLM3 is required. Its presence has been checked. */
+	pmd_populate_kernel(&init_mm, pmdp, pgtable);
+	return 0;
+}
+
 #endif
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 06a36da302d3..e37c94e6d929 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -21,6 +21,8 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t pte)
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PMD
+
 #ifndef __PAGETABLE_PMD_FOLDED
 
 static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 0133f7ba41d7..ad76df0b811a 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -31,6 +31,8 @@ static inline void pmd_populate(struct mm_struct *mm,
 	set_pmd(pmd, __pmd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
 }
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PMD
+
 #ifndef __PAGETABLE_PMD_FOLDED
 static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
 {
diff --git a/arch/x86/include/asm/pgalloc.h b/arch/x86/include/asm/pgalloc.h
index c88691b15f3c..f8d24b97cbf5 100644
--- a/arch/x86/include/asm/pgalloc.h
+++ b/arch/x86/include/asm/pgalloc.h
@@ -82,6 +82,8 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd(((pteval_t)pfn << PAGE_SHIFT) | _PAGE_TABLE));
 }
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PMD
+
 #if CONFIG_PGTABLE_LEVELS > 2
 extern void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd);
 
diff --git a/include/linux/pgalloc.h b/include/linux/pgalloc.h
index 9174fa59bbc5..1dbecb748028 100644
--- a/include/linux/pgalloc.h
+++ b/include/linux/pgalloc.h
@@ -26,4 +26,25 @@
 			arch_sync_kernel_mappings(addr, addr);		\
 	} while (0)
 
+#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PMD
+/*
+ * try_populate_vmemmap_pmd - Populate a PMD that is in use by the vmemmap.
+ * @addr: Base address of the remapped PMD.
+ * @pmdp: Page table pointer to be overwritten.
+ * @pgtable: Pointer to the page table that the new PMD will point to.
+ *
+ * This function is only to be used to update PMDs that map the vmemmap to
+ * point to a page of already-populated PTEs that map the same pages.
+ *
+ * Implementations of this function must ensure that, while the update is taking
+ * place, CPUs will not fault on the remapped virtual address range.
+ */
+static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
+					   pte_t *pgtable)
+{
+	pmd_populate_kernel(&init_mm, pmdp, pgtable);
+	return 0;
+}
+#endif
+
 #endif /* _LINUX_PGALLOC_H */
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 4cacd7aee719..d3230588f31f 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -82,6 +82,7 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 			     struct vmemmap_remap_walk *walk)
 {
 	pmd_t __pmd;
+	int ret;
 	int i;
 	unsigned long addr = start;
 	pte_t *pgtable;
@@ -101,8 +102,15 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 		set_pte_at(&init_mm, addr, pte, entry);
 	}
 
+	ret = 0;
 	spin_lock(&init_mm.page_table_lock);
 	if (likely(pmd_leaf(*pmd))) {
+		/* Make pte visible before pmd. See comment in pmd_install(). */
+		smp_wmb();
+		ret = try_populate_vmemmap_pmd(start, pmd, pgtable);
+		if (ret)
+			goto free;
+
 		/*
 		 * Higher order allocations from buddy allocator must be able to
 		 * be treated as independent small pages (as they can be freed
@@ -111,13 +119,6 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 		if (!PageReserved(head))
 			split_page(head, get_order(PMD_SIZE));
 
-		/* Make pte visible before pmd. See comment in pmd_install(). */
-		smp_wmb();
-		/*
-		 * On arm64, this requires BBML3. Its support has already been
-		 * checked.
-		 */
-		pmd_populate_kernel(&init_mm, pmd, pgtable);
 		/*
 		 * Modern MMUs allow overlapping TLB entries with different mapping
 		 * granularities only if they map the same physical address. So
@@ -125,12 +126,14 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 		 */
 		if (walk->remap_pte || !(walk->flags & VMEMMAP_DEFER_TLB_FLUSH))
 			flush_tlb_kernel_range(start, start + PMD_SIZE);
-	} else {
-		pte_free_kernel(&init_mm, pgtable);
+		goto out;
 	}
-	spin_unlock(&init_mm.page_table_lock);
 
-	return 0;
+free:
+	pte_free_kernel(&init_mm, pgtable);
+out:
+	spin_unlock(&init_mm.page_table_lock);
+	return ret;
 }
 
 static int vmemmap_pmd_entry(pmd_t *pmd, unsigned long addr,
-- 
2.56.1.809.ga0b61035b5-goog


