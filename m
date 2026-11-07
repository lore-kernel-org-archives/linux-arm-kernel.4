Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F897606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gBLExx5N;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQBRPF/H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0tSO75+dLoTbxUTsccW1GH3+P5H454b2/ssDfpBt7oM=; b=gBLExx5N0/UXNT
	e6Z/vZCw2COq1dY29Nex2fGIodvoVrNzBxtKSscOkqvFLpcHWc07J2ly4GUTs+9dI6BaqosXqOk5K
	RNHuGSgTmKILhXpeYcP2byqDipve2dPw62ZEEpmiuBOzpxI2u5c+XKfcDhpzFmbnbPYGfmQI5sntA
	YQQTbBrHyh9eHNilpsggSnMyJeYw/W8GVt+wPr1wCU8J2Id7zn0pIIx2pw6cFI8hSZjSdo+2E4GJj
	o5WUxjJj3JxEeBt2hnVot3LbLa9BmHj4kPqh+ll3vwEYhsFfOPHFWOyo3X6LIT7u783WtwFSULFy9
	H3PAI2BOXVVExzbo7LRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgoK-0000000El6H-3tdW;
	Sat, 07 Nov 2026 13:50:24 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgoI-0000000El46-2UyE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:50:24 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2543910eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 05:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059422; x=1794664222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tSO75+dLoTbxUTsccW1GH3+P5H454b2/ssDfpBt7oM=;
        b=pQBRPF/HOSvOnN61U2r/Jeyq0FvY7RbFh72X2lDSn0Mafo924pyB6ryhsKU+S2msYo
         p0M3vUgeGjR7kUHtNBrKMcmT6ZrNhn4bvnYC3N0VymiDkwzT4PppnI10PHklBw5sNWeQ
         7aKpnzOw1OkRxm9MxpeQg9OUFQfbmG4XnzDuHPeT99VTDV+2vj7v9AT40Niv5WiH3u1l
         FqsKdCSE/KHqsvtcK6S+Abr6m7puwoRP6AE/k7z3PM11+6bzxHnXBOq3p04tesG9k7RU
         xhluih1ADw2WOtAMqCVqnjLFjCMwRS910aYdN4f71e7GLtRlVt2T5xjcRAkJV8LGx4CK
         8Uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059422; x=1794664222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tSO75+dLoTbxUTsccW1GH3+P5H454b2/ssDfpBt7oM=;
        b=HWeV8Byy6CJId1nKSlnPtJiZBauBuAcqG4Z2e6cMkTSOcG0cCnkvwYK6x3MROzsQ1L
         IKhyl1L1/AcBlb0cL4Ov4YnA4gKjsO5oyVaHuNWZsfZfbBPBYVH7DImJmX7X/DZaDWFT
         Z6sr/baBLk+fFfwmuJ8FIWZlAZw/t6lD6q5eck7nhyBnOP+Jnhvn5Xz4lpFAnK0u5RTU
         g/9zt2NVlxW7G8ERJx57m7rHRnOI1YlFin8/a//4AoSMdMtlyK640yUc0/dYXbVyfKA5
         Ac/locH3tB6wBBPU5QvMX/t5QS9/U0ZNdA1dGfsdSBnQIxWt+GxgNHWUbb+7YvPL2ufN
         lpIA==
X-Forwarded-Encrypted: i=1; AL+hErEx/lG5zac0qx7pi9bn2QVnXN/KJ4S8V+qp1RO0iCVXZAaa5kc2xWZIVKzbM075NSSKKB5b6dBlpbMhWmgHTsZt@lists.infradead.org
X-Gm-Message-State: APuU4Z/EHGkh0q1RiLKAgz/CiKjHSQY1GI/opQLkLxwlFEjPMWjCoc1v
	t8hHue4YlIsCvE6Uwy2wo/ZsShQ1rcX8+aWIS/qah2dC5+tR4R182jEU
X-Gm-Gg: AYBFou0fFqZujn5zLNiiAsfGCl8L4rbtMWFXQG7cWtaeJrDJOly30hU3c4YMNDMCfpm
	d+KI+JSZVNLGukccP11rRdqgEOff95qlkHUWtXOrqsaKwrRtO+Yp2HH5+InkkgoSpB6kKGi78n7
	EY2i3aEXN5T5gsJJ2fjBW3IJf8IQ1sew/H3bYNeswKyqBE3qJCbhBX/qvomD0OjV46tOPHQTrWC
	5M0eG3HJv3UL2eQZ2WGx8ft2rLHei/ANJKnBx/K3uTG+vEMngpDUrCJlO9pgIuu1JTbVOHIbOM9
	OMUzpUqv++z2ySz2EYo3g+oMySavaKk7n6ZCyZrr4KxtSlwwi4VdU2GfzSdk9QiZAKPonLKSn2h
	Rl/vgs8dnEFParyd8shSBqYbJ2G2LpY1Tgp9cjRtTeMUiPmISBUT6SNwlYkq4KijWVVgDCmnHwE
	ZDZ7720ZO2BkZS3LHZkg3By8ZKmkHEMfcaljqV6msPLF8rq3n7KaXNUBMGd1tx07p/DOFpm7qBy
	Yi2ncrms6NKUPTnAjeJxxHy2DA/ufZp+wKm8nGYRbSqfv9T81oqovmANk0InheNUHkGBU7hORH8
	N4qIuu3lg+QDhh0wFEQS/bkF4zALOPMm5naJMopFc2ArFxia6gCuEGe5rw==
X-Received: by 2002:a05:7300:c8c2:b0:36a:2289:c599 with SMTP id 5a478bee46e88-36f76522120mr8195640eec.29.1794059421478;
        Sat, 07 Nov 2026 05:50:21 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:21 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org
Cc: baohua@kernel.org,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	rppt@kernel.org,
	leo.yan@arm.com,
	xueyuan.chen21@gmail.com,
	chleroy@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ajd@linux.ibm.com,
	jiangwen6@xiaomi.com,
	jiangwenxiaomi@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 03/10] mm/vmalloc: use vmap_pte_set_huge()/vmap_pte_clear_huge() for PTE-level block mappings
Date: Sat,  7 Nov 2026 21:49:46 +0800
Message-Id: <20261107134953.748622-4-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_055022_652218_C8B9B5A6 
X-CRM114-Status: GOOD (  15.09  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wen Jiang <jiangwen6@xiaomi.com>

vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.

Now that arm64 and powerpc/8xx provide vmap_pte_set_huge() and
vmap_pte_clear_huge(), add the generic fallbacks next to the existing
pmd/pud_set_huge() family and convert vmap_pte_range() and
vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
around the block-mapping paths are dropped, so PTE-level block mappings
now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
longer includes <linux/hugetlb.h>.

The fallbacks exist only to keep the build working on architectures
without PTE-level block mapping support. They are unreachable there:
the callers only run when arch_vmap_pte_range_map_size() or
arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
which requires an arch implementation. BUILD_BUG() makes that
explicit rather than silently doing nothing.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
 mm/vmalloc.c            | 19 ++++++-------------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b7..7e62479db5df7 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2204,6 +2204,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 }
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
+/*
+ * PTE-level block mappings for vmap.
+ *
+ * vmap_pte_set_huge() only has to be implemented by architectures whose
+ * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
+ */
+#ifndef __HAVE_ARCH_VMAP_PTE_SET_HUGE
+static inline void vmap_pte_set_huge(pte_t *ptep, unsigned long addr,
+				     phys_addr_t phys, pgprot_t prot,
+				     unsigned long size)
+{
+	BUILD_BUG();
+}
+#endif
+
+/*
+ * Likewise, vmap_pte_clear_huge() only has to be implemented by architectures
+ * whose arch_vmap_pte_range_unmap_size() can return a size other than
+ * PAGE_SIZE.
+ */
+#ifndef __HAVE_ARCH_VMAP_PTE_CLEAR_HUGE
+static inline pte_t vmap_pte_clear_huge(pte_t *ptep, unsigned long addr,
+					unsigned long size)
+{
+	BUILD_BUG();
+	return __pte(0);
+}
+#endif
+
 #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f7aa4686fe5b9..df37c8490ae7e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -38,7 +38,6 @@
 #include <linux/rbtree_augmented.h>
 #include <linux/overflow.h>
 #include <linux/pgtable.h>
-#include <linux/hugetlb.h>
 #include <linux/sched/mm.h>
 #include <asm/tlbflush.h>
 #include <asm/shmparam.h>
@@ -100,7 +99,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte_t *pte;
 	u64 pfn;
 	struct page *page;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -121,17 +120,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-#ifdef CONFIG_HUGETLB_PAGE
 		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
 		if (size != PAGE_SIZE) {
-			pte_t entry = pfn_pte(pfn, prot);
-
-			entry = arch_make_huge_pte(entry, ilog2(size), 0);
-			set_huge_pte_at(&init_mm, addr, pte, entry, size);
+			vmap_pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
 			pfn += PFN_DOWN(size);
 			continue;
 		}
-#endif
 		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
 		pfn++;
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
@@ -391,25 +385,24 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 {
 	pte_t *pte;
 	pte_t ptent;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
 
 	pte = pte_offset_kernel(pmd, addr);
 	lazy_mmu_mode_enable();
 
 	do {
-#ifdef CONFIG_HUGETLB_PAGE
 		size = arch_vmap_pte_range_unmap_size(addr, pte);
 		if (size != PAGE_SIZE) {
 			if (WARN_ON(!IS_ALIGNED(addr, size))) {
 				addr = ALIGN_DOWN(addr, size);
 				pte = PTR_ALIGN_DOWN(pte, sizeof(*pte) * (size >> PAGE_SHIFT));
 			}
-			ptent = huge_ptep_get_and_clear(&init_mm, addr, pte, size);
+			ptent = vmap_pte_clear_huge(pte, addr, size);
 			if (WARN_ON(end - addr < size))
 				size = end - addr;
-		} else
-#endif
+		} else {
 			ptent = ptep_get_and_clear(&init_mm, addr, pte);
+		}
 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
 	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
 
-- 
2.34.1


