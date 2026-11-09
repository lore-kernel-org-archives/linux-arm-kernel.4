Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29AF60A260F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LOvZiT7X;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=krRhCx9Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=86HOuVQYzJ9HP9T+tU7Glqbpyaws8eMrdwgzBdBZAUs=; b=LOvZiT7XgmRTnX
	FPIUILzYxgNXRKs40rqvhmg5q33e/4q3+V0ChzGDvbMAviDX/NbINT4FRDUFmUkKddFxxF6/cJH0S
	i46b+BiR+z4O6R/FjT0jJRQZIHgHSeZuRl7DgDWV2wEs2D1hCluGKV0tlr9uc3q7I9jBulU94PrIZ
	LF3c8GZmxbkvlTmwoIqCRauhJvXvTicoeahPOYxlpBngmKcUMc4Gjb5IxPGy1Lw9NrB/Mc6xxByU8
	SlO1PSnvmjSBuvWUA04+nluHuQC3wtDx84U/aRrfHsqJzsuViaR5N9CJx32aoEOMyl2VF6buTmvwv
	7o/Ww8jlpKlAeCvWiITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRom-000000018I7-1qgB;
	Mon, 09 Nov 2026 16:02:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRoV-0000000181W-0jjJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:01:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A779F2F;
	Mon,  9 Nov 2026 08:01:39 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C226C3F632;
	Mon,  9 Nov 2026 08:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794240102; bh=ZPX85IlkbQlPgohX2Zyn8cActE8CqgGaqWXBsgZhgrQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=krRhCx9ZXNmvUrrrUz1/ilS8737QW38epYNNuHQ0Flt/e3tmwQPDci92ie11wGuXf
	 2tVtTq99m7eeBgdC7hxFEUFpJjxY/eENnhgxz7dm4akpanIfza8CB3qBJl9tGviSd+
	 hAA06OrcTmHSTG+I8nCb3dtwuuvWKCAyEbY2qwnE=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Mon, 09 Nov 2026 15:58:38 +0000
Subject: [PATCH RFC v10 13/22] mm: kpkeys: Protect early kernel page tables
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-kpkeys-v10-13-aa6c4d9603bc@arm.com>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
In-Reply-To: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb+git@google.com>, Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org, 
 Ira Weiny <iweiny@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794240029; l=5621;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=ZPX85IlkbQlPgohX2Zyn8cActE8CqgGaqWXBsgZhgrQ=;
 b=BHEth1LPkXZiSPlKi9DxAsJzoM1sn8uQlPPkoyEZC2z4et3VLGO29Afdyoa35LNzsydljQBdG
 0v1bpT/UWh+Bl0VcgQu0qUQW/Cm6t2XuDnvDUnL2IisOv1rs7Hyy78Q
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_080143_313242_0AEA5DA0 
X-CRM114-Status: GOOD (  21.93  )
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

Initial kernel page tables (kernel image, direct map, vmemmap, etc.)
are not allocated using pagetable_alloc() - the buddy allocator
isn't ready at that point. We need to use a different approach to
protect them.

This patch takes the "brute force" route: when
kpkeys_hardened_pgtables is enabled, walk all installed kernel
page table, setting the pkey of their backing pages in the direct
map along the way.

The standard pagewalk API is used for that purpose, albeit in a
slightly unusual way:

* Visiting an entry is used to set the pkey of the table it points
  to, hence: .pmd_entry -> protect_pte_table

* PTE entries are always leaves, so no need to visit them (no
  .pte_entry callback)

* The range is meant to capture all installed kernel page tables.
  There doesn't seem to be a generic way to express this;
  [PAGE_OFFSET, ULONG_MAX) seems to be good enough on arm64/x86.

Locking probably isn't necessary so early during boot, but taking
the mmap_write_lock shouldn't hurt either. We also assume that all
page tables installed after that point are allocated using
pagetable_alloc(), which seems to be the case, at least on arm64.
There are some more assumptions - see comment above
protect_early_kernel_pgtables().

This simple approach should reliably protect all early kernel page
tables without invasive changes. However, adding support for large
blocks (PMD/PUD) is likely to be difficult and/or inefficient as
splitting will ocur when protecting individual page table pages.
Modifying the early page table allocators directly may be
preferable.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 mm/kpkeys_hardened_pgtables.c | 122 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/mm/kpkeys_hardened_pgtables.c b/mm/kpkeys_hardened_pgtables.c
index 2311fd8da6bb..f6825a0e0689 100644
--- a/mm/kpkeys_hardened_pgtables.c
+++ b/mm/kpkeys_hardened_pgtables.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/kpkeys.h>
 #include <linux/mm.h>
+#include <linux/pagewalk.h>
+#include <linux/pgtable.h>
 #include <linux/set_memory.h>
 
 #include <kunit/visibility.h>
@@ -54,10 +56,130 @@ void kpkeys_pgtable_free(struct page *page, unsigned int order)
 	__free_pages(page, order);
 }
 
+static void __init protect_pgtable_page(void *page)
+{
+	int ret;
+
+	ret = set_direct_map_pkey((unsigned long)page, 1, KPKEYS_PKEY_PGTABLES);
+	WARN_ON_ONCE(ret);
+}
+
+static int __init protect_pte_table(pmd_t *pmd, unsigned long addr,
+				    unsigned long next, struct mm_walk *walk)
+{
+	pmd_t entry = pmdp_get(pmd);
+
+	if (!pmd_present(entry) || pmd_leaf(entry))
+		return 0;
+
+	protect_pgtable_page(pte_offset_kernel(pmd, 0));
+
+	return 0;
+}
+
+static int __init protect_pmd_table(pud_t *pud, unsigned long addr,
+				    unsigned long next, struct mm_walk *walk)
+{
+	pud_t entry;
+
+	if (mm_pmd_folded(walk->mm))
+		return 0;
+
+	entry = pudp_get(pud);
+	if (!pud_present(entry) || pud_leaf(entry))
+		return 0;
+
+	protect_pgtable_page(pmd_offset(pud, 0));
+
+	return 0;
+}
+
+static int __init protect_pud_table(p4d_t *p4d, unsigned long addr,
+				    unsigned long next, struct mm_walk *walk)
+{
+	p4d_t entry;
+
+	if (mm_pud_folded(walk->mm))
+		return 0;
+
+	entry = p4dp_get(p4d);
+	if (!p4d_present(entry) || p4d_leaf(entry))
+		return 0;
+
+	protect_pgtable_page(pud_offset(p4d, 0));
+
+	return 0;
+}
+
+static int __init protect_p4d_table(pgd_t *pgd, unsigned long addr,
+				    unsigned long next, struct mm_walk *walk)
+{
+	pgd_t entry;
+
+	if (mm_p4d_folded(walk->mm))
+		return 0;
+
+	entry = pgdp_get(pgd);
+	if (!pgd_present(entry) || pgd_leaf(entry))
+		return 0;
+
+	protect_pgtable_page(p4d_offset(pgd, 0));
+
+	return 0;
+}
+
+static const struct mm_walk_ops protect_pgtable_ops __initconst = {
+	.pmd_entry = protect_pte_table,
+	.pud_entry = protect_pmd_table,
+	.p4d_entry = protect_pud_table,
+	.pgd_entry = protect_p4d_table,
+};
+
+/*
+ * Protect all installed kernel page tables by walking them and setting the
+ * direct mapping of all backing pages to pkey KPKEYS_PKEY_PGTABLES. We assume
+ * all non-root levels (PTE to P4D) are page-sized (asserts below).
+ *
+ * The root PGD page is left untouched; it is normally accessed via the kimg
+ * mapping only. On arm64 it cannot be written directly via any mapping.
+ *
+ * This approach is unsafe if set_direct_map_pkey() may split blocks in the
+ * direct map; we rely on the direct map being fully PTE-mapped.
+ */
+static void __init protect_early_kernel_pgtables(void)
+{
+	int ret;
+
+	mmap_write_lock(&init_mm);
+	/*
+	 * [PAGE_OFFSET, ULONG_MAX) covers all early kernel mappings on arm64
+	 * and x86 (at least).
+	 */
+	ret = walk_kernel_page_table_range(PAGE_OFFSET, ULONG_MAX,
+					   &protect_pgtable_ops, NULL, NULL);
+	mmap_write_unlock(&init_mm);
+	WARN_ON_ONCE(ret);
+}
+
+static_assert(MAX_PTRS_PER_PTE * sizeof(pte_t) == PAGE_SIZE);
+
+#ifndef __PAGETABLE_PMD_FOLDED
+static_assert(MAX_PTRS_PER_PMD * sizeof(pmd_t) == PAGE_SIZE);
+#endif
+
+#ifndef __PAGETABLE_PUD_FOLDED
+static_assert(MAX_PTRS_PER_PUD * sizeof(pud_t) == PAGE_SIZE);
+#endif
+
+#ifndef __PAGETABLE_P4D_FOLDED
+static_assert(MAX_PTRS_PER_P4D * sizeof(p4d_t) == PAGE_SIZE);
+#endif
+
 void __init kpkeys_hardened_pgtables_init(void)
 {
 	if (!kpkeys_supported())
 		return;
 
 	static_branch_enable(&kpkeys_hardened_pgtables_key);
+	protect_early_kernel_pgtables();
 }

-- 
2.56.0


