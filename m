Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE43606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l/6vFJIO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=neBKGJcx;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BrbFa+yp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1tWrOtic/buTkSk/2DlTQdnpgTD163OrV0WQJdUCLJE=; b=l/6vFJIOGBEEPUeWHL3kRvWZqJ
	LU2+gM+Nrc3mZvhbjuAfbJjkYJDlCaIp8fxBXt5Pnu4CzmeH3vHoCq/RJrTEMWeYHOf4AwSQcYF42
	nIrjbdo3LhEVtd4OX6JlUda2v7zQUCjH4ReoOON2+JeqO7uw5MwXwZvm4YY9WT6ixersJQygH4z3/
	nXAccESSjiJH446lC6a4kK+bBwlqnuSfUnF9CC75OWf/qRuCsNsofXwKcf/ijlTxFeAkBHeEEcDem
	bC+Ich4tXUuzKDosUZnOkzlMqEJC4IWQpa2Nx+a0PRO6vKex+3iZ4UsRXoW17TK+iDp8N6mknLPvn
	oP2RzQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ0-00000001YaZ-0zn9;
	Sun, 22 Nov 2026 18:45:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYn-00000001YRB-1JXD
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1tWrOtic/buTkSk/2DlTQdnpgTD163OrV0WQJdUCLJE=; b=neBKGJcxiBwOtT7GiU0wau8ZfW
	IUMOgveMSxW4kMq6qiu7+97E+/dUFIN+7phbPmI4bwLJ+iAlzn/XCiGOufjKe0WoipI8jaCdhad9y
	YeSIOVJ4OivQEHJTAq7q/kThlXKJH6BIO66aNsAwZEJegDbdhiqJqB9e7/gMa2gNwrSp0BR6TDGOJ
	4A8ykzrhy/KqtSIMBJIcYQ074my6eJlEFs6ud3nGQFzRFYGaQirVJ1Eq2FBfWc8dAYlAKRERwvAqO
	K2mA+LQFz1+qBoH0O+3fI8kA4MC0Ndq1f0nkoBB+yxBllAgwB4+7DyWoQO6udq5eY+vH8bxqTltJp
	n3tEq3Vg==;
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYk-00000002RCF-3JtA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:08 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2f0467a525eso18549105ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373104; x=1795977904; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tWrOtic/buTkSk/2DlTQdnpgTD163OrV0WQJdUCLJE=;
        b=BrbFa+ypu6bZfw3lIa1l3F5MyQ+UReKUiFVcI0uEYXDpEjJoPsH7M8yOi5zHjmsHBm
         YhRYDkOI5qEd465YpFfMUWrSCVnZ9TImAeTm+Haf86gvgVQf4cXXll//M4wUfMxB4FR1
         eay5Qkcv74UXTeBowvbY1PvqhiZYZhn5t514qctnWPnL+VHy5NCh90s2dJ4tJSA2cbaO
         baXJyQ3Sthibk8hTP2u3tBZX7JJtZOWg3I4rA5nvOKMVruYzDr3rdpkDOA8TRRYqjEUv
         UVrizFa9edg5W4oMTINCFZh+Jb61RqIQoHYWmRFRf60ZOxWWlkdQ5sGcsvvq1Ir2J54T
         A7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373104; x=1795977904;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1tWrOtic/buTkSk/2DlTQdnpgTD163OrV0WQJdUCLJE=;
        b=dxOqGCzGUYBDDAHuIthHwV7Nu9hzohUO+KDrdtcBp+rPMokubgwnFn1xwQXaZC4Yn0
         mfPut/aLPpVIYRZAPG26JEXzstkMns0S6o2hJVxJBrwvs7/J5HRmx6uch4msnk/hB0a0
         ls59GbJLAoqrlT3f87hoTYNZkwlCvnqsa77stxDZnSr1Z+Znnc0k7aVom6KxoB3GL3FY
         za3BXSmfdgfSS7NXtRvjqc3+yrE1JhzoMPjTxlsAjassQe2m1nu+s8jG9h0owPvk2zzr
         hi2MC0ZkMniIO1P+QmqvmQ7/C4dpL6u8u1FzYFD5p4GcPSsr5A4+fqzGTjI8k7LEC/5e
         J48A==
X-Forwarded-Encrypted: i=1; AL+hErEStSScLef0RpcDhwTy8pTAqiZuRdJBzkKR7l+d9QV/Z8WakEmfNCHi8gUIx3nQ1xBZf7uZWcRKliTojiPkRY9e@lists.infradead.org
X-Gm-Message-State: APuU4Z92auvFgXoBpqkmu4BocVB0y7ABUXiAdxEL/cnVRnHvIP3MTpgz
	RRYf9tTkN85P4Umu4LGfm8HflBzRKf8xrgheqPwy6CksZeLIhMTWIzf+bpNtbGpyWjnzQ0v092R
	M4rxXqHqWwwoFDg9akkUmcQ==
X-Received: from plbmq8.prod.google.com ([2002:a17:902:fd48:b0:2f0:4f32:d57d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ef45:b0:2ef:d7ed:80dc with SMTP id d9443c01a7336-2f03f1e0d55mr91461845ad.49.1795373103813;
 Sun, 22 Nov 2026 10:45:03 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:38 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-5-jthoughton@google.com>
Subject: [PATCH v3 04/19] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
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
X-CRM114-CacheID: sfid-20261122_184506_728794_2C06B185 
X-CRM114-Status: GOOD (  24.84  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

set_pte_at() cannot be used to replace in-use vmemmap PTEs on arm64, so
replace it with a more specific routine, try_update_vmemmap_pte().

try_update_vmemmap_pte() is used for modifying page table entries such
that there is a guarantee that no fault will be taken.

For the generic implementation, please note one difference: set_pte()
does not invoke page_table_check_ptes_set(), but set_pte_at(), the call
we are about to replace, does. However, this is a functional no-op
because page_table_check_ptes_set() does nothing for init_mm PTEs, which
vmemmap PTEs are.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/loongarch/include/asm/pgtable.h |  2 ++
 arch/riscv/include/asm/pgtable.h     |  2 ++
 arch/x86/include/asm/pgtable.h       |  2 ++
 include/linux/pgtable.h              | 22 +++++++++++++++++++
 mm/hugetlb_vmemmap.c                 | 32 +++++++++++++++++++++++-----
 5 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index f87603135131..123eda3f6035 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -633,6 +633,8 @@ static inline long pmd_protnone(pmd_t pmd)
 #define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) != 0)
 #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+
 /*
  * We provide our own get_unmapped area to cope with the virtual aliasing
  * constraints placed on us by the cache architecture.
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2ebd5fa5adc5..c8d05bc12cc8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1172,6 +1172,8 @@ static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
 
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+
 /*
  * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
  * are !pte_none() && !pte_present().
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 000fc6c1ca37..271cdc61de3a 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1372,6 +1372,8 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 }
 #endif
 
+#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static inline pud_t pudp_establish(struct vm_area_struct *vma,
 		unsigned long address, pud_t *pudp, pud_t pud)
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index bc1353f03b08..ab33df268955 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -458,6 +458,28 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 #endif
 #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
 
+#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
+/*
+ * try_update_vmemmap_pte - Remap PTEs used by the vmemmap.
+ * @addr: Base address of the remapped PTE.
+ * @ptep: Page table pointer to be overwritten.
+ * @pte: Page table entry to write.
+ *
+ * This function is only to be used to update PTEs that map the vmemmap. The
+ * only valid transitions supported by this function are: leaf-level
+ * (PAGE_SIZE), valid-to-valid. The pfn and prot bits may be changed.
+ *
+ * Implementations of this function must ensure that, while the update is taking
+ * place, CPUs will not fault on the remapped virtual address.
+ */
+static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
+					 pte_t pte)
+{
+	set_pte(ptep, pte);
+	return 0;
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 extern int ptep_set_access_flags(struct vm_area_struct *vma,
 				 unsigned long address, pte_t *ptep,
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 2e9cf8d39c89..b4d0311bcc4a 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -218,15 +218,19 @@ static int alloc_vmemmap_page_list(struct list_head *head,
 	return -ENOMEM;
 }
 
+/*
+ * Copy @src into the first page on @vmemmap_pages and return it. The page is
+ * left on the list; the caller must remove it only once it has successfully
+ * been installed in the vmemmap.
+ */
 static struct page *vmemmap_dup_page_from_list(const struct page *src,
 		struct list_head *vmemmap_pages)
 {
 	struct page *dst = list_first_entry(vmemmap_pages, struct page, lru);
 
-	list_del(&dst->lru);
 	copy_page(page_address(dst), page_address(src));
 
-	/* Ensure updates to @dst page are visible before set_pte_at(). */
+	/* Ensure updates to @dst page are visible before try_update_vmemmap_pte(). */
 	smp_wmb();
 
 	return dst;
@@ -248,6 +252,8 @@ static int vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
 	const struct page *page = (const struct page *)addr;
 	const struct folio *folio = page_folio(page);
 	struct page *src = pte_page(ptep_get(pte)), *dst;
+	bool dup = false;
+	int ret;
 
 	if (likely(vmemmap_optimizable_pfn(page_to_pfn(page), folio_order(folio)))) {
 		dst = folio_vmemmap_shared_tail_page(folio);
@@ -255,16 +261,27 @@ static int vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
 			return -ENOMEM;
 	} else {
 		dst = vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
+		dup = true;
 	}
 
-	list_add(&src->lru, walk->vmemmap_pages);
 	/*
 	 * Map the shared tail page writable intentionally. A lockless get that
 	 * read a non-zero refcount before the remap can still do its cmpxchg
 	 * after it. The refcount is zero, so the cmpxchg fails and leaves the
 	 * page unchanged.
 	 */
-	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
+	ret = try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
+	if (ret)
+		return ret;
+
+	/*
+	 * We successfully overwrote the vmemmap PTE, so the page that was just
+	 * unmapped can be freed, and if we mapped a duplicated page, remove it
+	 * from the list so that it doesn't get freed later.
+	 */
+	if (dup)
+		list_del(&dst->lru);
+	list_add(&src->lru, walk->vmemmap_pages);
 
 	return 0;
 }
@@ -275,6 +292,7 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 	const struct page *page = (const struct page *)addr;
 	const struct folio *folio = page_folio(page);
 	struct page *src = pte_page(ptep_get(pte)), *dst, *tail;
+	int ret;
 
 	if (unlikely(!vmemmap_optimizable_pfn(page_to_pfn(page), folio_order(folio))))
 		return 0;
@@ -291,7 +309,11 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 		return 0;
 
 	dst = vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
-	set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
+	ret = try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
+	if (ret)
+		return ret;
+
+	list_del(&dst->lru);
 
 	return 0;
 }
-- 
2.56.1.809.ga0b61035b5-goog


