Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFE7606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 04:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rk22sZt5;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cLETZEHw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BY1PW5EQCsSwahWNQsNirKWCM+cX6Fs3QmmMD9rosww=; b=Rk22sZt5no6OIU
	13XfkaucpE6ddVqUo68sknQjFfQ6uoOMjZbWcJtSR5GHjH/HPI7wdATkJU2/Ef9n/5uEUmI7Y1WfF
	mU+dqSpgckJj6GdaIElktJtW66DNa3LG4RB90v1WBa1liHMgfMQE+yExu+bY4HXYP1itpC874/uWQ
	2J+DCYhiSyCUPoFhwDmv/7ZHjtflrLnwtt0Yk3xKQ1nulHKzXdlyMwOY3xk0sdjmna6R3DStQc0Eq
	SHcysqdEbASDRBlajoUtTcBkFv80TMSjNbQuQYbHBWoslDOpsuG7I17wmT7be0RjQ254SIvjensac
	d2IGV6bjoy6rs6JHpsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY6V-0000000ECI3-21It;
	Sat, 07 Nov 2026 04:32:35 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY6S-0000000ECF9-0eYT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 04:32:34 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso617545a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 20:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025951; x=1794630751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BY1PW5EQCsSwahWNQsNirKWCM+cX6Fs3QmmMD9rosww=;
        b=cLETZEHwzEV9QFF8D229I7hCuU4CznEAAnde4MxfUtGRJapfUZXMHMoXm5f9W2cS4r
         habIyLxyFOB+WQU0xob/XJrB2TYuU6ITEjrH1XBLYcrCQo7hIb38FmhxiVND2wqIGh0w
         ZSFSz93v12x6JwAQiFUOQN+M54lFHF6uo2DVhZ7cdjbESrfP34ZWjCjpay4TeefbQWy1
         TaYYsEmpTZEtbum5vyxlLO4fG5BNviJKuxZ/DrJnC7hqjzVaIKS2EYplzIZS7ZJSQBxe
         g3dPoVi0gTgiM9UgqLCkV7levW1hgXQhNWeqsh1597esw536QjupxeOLpOltg2XIZtGf
         89Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025951; x=1794630751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BY1PW5EQCsSwahWNQsNirKWCM+cX6Fs3QmmMD9rosww=;
        b=Td/N5EUIv6Fy5y+6JLAVyIetwByaTdY7ndMtAD4kFG/PlEASJxJYdYggfiIXqvUR44
         N3hSm2dcv2hAlPiibErg+6UuBaHZkI68p4Pf0pP8cbFRpoT8CqZ/WK/IBl5YP8R+3qxr
         WXofCaKaELxDc82h27+bfdV5wMWmJPF88jmFdLwYgldREhOdkh5p8A3mE5KVLTu5+oSA
         wz+A5dq8QwSk18s16IhbZ7ezoBYlzbg0lOFgD/iE/CEmGbTDtEepy6H9gvoSv9OdFPGU
         3wB45gU5F0dZ4JZ8z7r/A52UR57xf/2yioZSuDwLY/u9xFxMEkCUGnAXYyEodJp6BT+g
         2BVg==
X-Forwarded-Encrypted: i=1; AL+hErGjL/a0nX+M974VG7m+eh+X1151kwqq8dMZ+x6pwxJ3paMIBV5j4laFBrlBytC6TDLD86WYJqMdqsE5sAdCLe8j@lists.infradead.org
X-Gm-Message-State: APuU4Z+fHnZRwjZWMTqIRArYwuQz0CPVKuV26/kBsaVMwj3aDukuEMQg
	RSiDNeLdCoC+lMfM15xDDnYaKW0XNY3PrQ/W9r6H7697vmL5wfMm8B6PA4ymq3FTu1U=
X-Gm-Gg: AYBFou2/fWojBDudex/7mrwvTpu+EomnKFKPOX4s0guQpdjAjKpYFO1rKdofgcPmcU3
	CCFTXX9pmHV57coaxPSIXNkgdU+27bEW4nIpkqO20Ib+ldB9jzMKLJ8r+Ms/mxoCdMeSnvLDnHU
	3Yoilc7VSi0uuNjEVdlZogH3GRNCV3HwzJXZcZ0yqxeUbRvD8RZR1jNyOCLomm/UTc3lAp1ZzRT
	k+IZOFaSmhK4Wmfkfx0mXbnKBDF69aqykNJJtPWS//dgP8O2RcVYtil09BtZmpHJUEiYDYT7Yq7
	snWEuFuxIN/itd69KlQn8xNzaor0JUwKYNp1KQzrWdzQzFAEwui6peCWxKUovAKfBBTaSv55iSt
	pEWL38jJw/R+EVRJnmq3xtBMJNiKqwowns/rWh+JB8scrJx1ai+lmvNT71ubJgUCK1LTMUyH1No
	Y7K1c1ivaoof+8Ti9OBTjxnw2j8mgHWu5XALG1vLSflhU4IMdy1UOIsjYbuoowMtCuXNK+15iKl
	G45vB8gOyZgSoOgH6nvCk59sYMZNs9kJkxlsm2MkHoi98CHZIwpAOhQENN2oJ3m3UTJQq502HpZ
	oVxnaAV34/VGFp9fq5UnXZLXIACnhOu4f24oeoOEoxGzcSKzYSmOzwQNkn1gBVulEVmbT633FOf
	0qUePTA==
X-Received: by 2002:a17:90b:530c:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3b0db71d480mr4559125a91.57.1794025951057;
        Fri, 06 Nov 2026 20:32:31 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.32.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:32:30 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 4/5] mm/sparse-vmemmap: drop vmemmap_can_optimize()
Date: Sat,  7 Nov 2026 12:31:21 +0800
Message-ID: <20261107043122.25650-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107043122.25650-1-songmuchun@bytedance.com>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_203233_275950_362512AD 
X-CRM114-Status: GOOD (  17.96  )
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

section_vmemmap_optimizable() can already decide whether a section uses
vmemmap optimization based on the section compound order. The DAX-specific
vmemmap_can_optimize() helper duplicates that policy, so remove it to
simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Ignore non-optimizable nonzero section orders while retaining zero
  as the reset value (reported by Sashiko)
- Use section_vmemmap_optimization_disable() for the altmap fallback
- Move vmemmap_optimizable_order() before its first caller
---
 include/linux/mm.h                   | 37 ----------------------------
 include/linux/vmemmap-optimization.h | 25 ++++++++++---------
 mm/sparse-vmemmap.c                  |  6 +++--
 3 files changed, 18 insertions(+), 50 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2d0b8a4c9974..43eb19474d26 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -38,7 +38,6 @@
 #include <linux/bitops.h>
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kcsan-checks.h>
-#include <linux/vmemmap-optimization.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -5385,42 +5384,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
 }
 #endif
 
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
-					  struct dev_pagemap *pgmap)
-{
-	unsigned long nr_pages;
-	unsigned long nr_vmemmap_pages;
-
-	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
-		return false;
-
-	if (!pgmap || !is_power_of_2(sizeof(struct page)))
-		return false;
-
-	nr_pages = pgmap_vmemmap_nr(pgmap);
-	nr_vmemmap_pages = ((nr_pages * sizeof(struct page)) >> PAGE_SHIFT);
-	/*
-	 * For vmemmap optimization with DAX we need minimum 2 vmemmap
-	 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
-	 */
-	return !altmap && (nr_vmemmap_pages > VMEMMAP_OPTIMIZATION_PAGES);
-}
-/*
- * If we don't have an architecture override, use the generic rule
- */
-#ifndef vmemmap_can_optimize
-#define vmemmap_can_optimize __vmemmap_can_optimize
-#endif
-
-#else
-static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
-					   struct dev_pagemap *pgmap)
-{
-	return false;
-}
-#endif
-
 enum mf_flags {
 	MF_COUNT_INCREASED = 1 << 0,
 	MF_ACTION_REQUIRED = 1 << 1,
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index 22e5a322be0b..985a37dfcab7 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -31,6 +31,17 @@
 #define VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES	(VMEMMAP_OPTIMIZATION_SIZE / sizeof(struct page))
 #define VMEMMAP_OPTIMIZATION_MIN_ORDER		(ilog2(VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) + 1)
 
+static inline bool vmemmap_optimizable_order(unsigned int order)
+{
+	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
+		return false;
+
+	if (!is_power_of_2(sizeof(struct page)))
+		return false;
+
+	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
+}
+
 #ifdef CONFIG_VMEMMAP_OPTIMIZATION
 static inline unsigned int section_compound_order(const struct mem_section *section)
 {
@@ -40,6 +51,9 @@ static inline unsigned int section_compound_order(const struct mem_section *sect
 static inline void section_set_compound_order(struct mem_section *section,
 					      unsigned int order)
 {
+	if (order && !vmemmap_optimizable_order(order))
+		return;
+
 	VM_WARN_ON(section_compound_order(section) && order &&
 		   section_compound_order(section) != order);
 	section->compound_page_order = order;
@@ -109,15 +123,4 @@ static inline bool vmemmap_optimizable_pfn(unsigned long pfn, unsigned int order
 
 	return (pfn & (nr_pages - 1)) >= VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
 }
-
-static inline bool vmemmap_optimizable_order(unsigned int order)
-{
-	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
-		return false;
-
-	if (!is_power_of_2(sizeof(struct page)))
-		return false;
-
-	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
-}
 #endif /* _LINUX_VMEMMAP_OPTIMIZATION_H */
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 57aa5c2d8034..f6a8b8e51b6c 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -490,6 +490,9 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
+	/* Altmap-backed vmemmap pages cannot be optimized. */
+	if (altmap)
+		section_vmemmap_optimization_disable(start, end);
 	r = vmemmap_populate(start, end, nid, altmap);
 	if (r < 0)
 		return NULL;
@@ -717,10 +720,9 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 	struct mem_section *ms = __pfn_to_section(pfn);
 	struct mem_section_usage *usage = NULL;
 	struct page *memmap;
-	unsigned int order;
+	unsigned int order = pgmap ? pgmap->vmemmap_shift : 0;
 	int rc;
 
-	order = vmemmap_can_optimize(altmap, pgmap) ? pgmap->vmemmap_shift : 0;
 	if (nr_pages < PAGES_PER_SECTION && section_compound_order(ms))
 		return ERR_PTR(-EOPNOTSUPP);
 
-- 
2.54.0


