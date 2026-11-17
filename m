Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5B3606A884
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tJ/OlHxt;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3mjTo5zh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7i9FPBLxBo+nFBKLQHwPNwyitgFkr47EWET+hoYLFAE=; b=tJ/OlHxtNjEFKIo9qcUAwBVzmK
	+5FEDR/AZIa2WoMbXcvTe+UkMHDKPTylL5BrtTPZtkxbexw1xjIHdxeWwabQn/LbOj8NHfxZPY0qo
	2Y84ajk5AE2PLrflEt4c5g+5pKhY5MOnksWw/mnFAsNuZMXjalsIUJqwF4uQAXuemdt4BorxIw8rE
	FT5t6qUR/fsBov7Hh4T3QVhWhugO9Gx/LOJLH3HfLlrweUan9qzbRsCjqEQXyCxYrZmN0qgWMeCvA
	X/rheoiSTlKhuMD3nl/ljKhC57nRx5w2m6rP1MZJimCe//+xPxMfcaFmUE0m40mCiJqDYJLCHnx1Y
	5pbLrV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8XE-00000004LZP-1CFJ;
	Tue, 17 Nov 2026 02:03:00 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8X3-00000004LVf-3ssH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:02:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7i9FPBLxBo+nFBKLQHwPNwyitgFkr47EWET+hoYLFAE=;
	b=3mjTo5zhLcyKWtbueN+7irQ/JAJgxWhADx/d8zMIZITdwBU4LKuRLehqbBxIJrN9EVaEDw/ZI
	85RF0EpL2a94NP5QNVCoFCF6cuiQ/frjYZdYScnYLsTgLiXY7M03ZKfEvLlAjKXBCJQwTzqX06m
	bcEwx3P+WMOGznfqzUkS/7U=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jT7JX5dDPzcbPt;
	Tue, 17 Nov 2026 10:01:48 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id EB0A94056E;
	Tue, 17 Nov 2026 10:02:38 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 10:02:38 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<ryan.roberts@arm.com>, <peterx@redhat.com>, <dave.jiang@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH v2 1/4] mm: define generic pudp_invalidate() implementation
Date: Tue, 17 Nov 2026 10:02:34 +0800
Message-ID: <20261117020237.4037980-2-tujinjiang@huawei.com>
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
X-CRM114-CacheID: sfid-20261116_180250_321088_EF6089CC 
X-CRM114-Status: GOOD (  10.82  )
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

x86 and riscv have identical pudp_invalidate() implementations. Move it to
mm/pgtable-generic.c with the __HAVE_ARCH_PUDP_INVALIDATE override guard.
PowerPC keeps its own implementation. In the later patch, arm64 will use
the generic implementation too.

No functional change intended.

Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  1 +
 arch/riscv/include/asm/pgtable.h             |  3 ---
 arch/riscv/mm/pgtable.c                      |  9 ---------
 arch/x86/include/asm/pgtable.h               |  3 ---
 arch/x86/mm/pgtable.c                        | 12 ------------
 include/linux/pgtable.h                      |  7 +++++++
 mm/pgtable-generic.c                         | 14 ++++++++++++++
 7 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index dff8790a047d..267d5e24f3b0 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1412,6 +1412,7 @@ static inline pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm,
 #define __HAVE_ARCH_PMDP_INVALIDATE
 extern pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 			     pmd_t *pmdp);
+#define __HAVE_ARCH_PUDP_INVALIDATE
 extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
 			     pud_t *pudp);
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2ebd5fa5adc5..174a2f2bcaa2 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1162,9 +1162,6 @@ static inline pud_t pud_mkinvalid(pud_t pud)
 	return __pud(pud_val(pud) & ~(_PAGE_PRESENT | _PAGE_PROT_NONE));
 }
 
-extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
-			     pud_t *pudp);
-
 static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
 {
 	return pte_pud(pte_modify(pud_pte(pud), newprot));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index cd180f9abb5e..7c76756b59da 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -154,15 +154,6 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	return pmd;
 }
 
-pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
-		      pud_t *pudp)
-{
-	VM_WARN_ON_ONCE(!pud_present(*pudp));
-	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
-
-	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
-	return old;
-}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 000fc6c1ca37..ad7a40abef7d 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1391,9 +1391,6 @@ static inline pud_t pudp_establish(struct vm_area_struct *vma,
 extern pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma,
 				unsigned long address, pmd_t *pmdp);
 
-pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
-		      pud_t *pudp);
-
 /*
  * Page table pages are page-aligned.  The lower half of the top
  * level is used for userspace and the top half for the kernel.
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 4a105f283cfb..591931d144f2 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -519,18 +519,6 @@ pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
 }
 #endif
 
-#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && \
-	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
-pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
-		     pud_t *pudp)
-{
-	VM_WARN_ON_ONCE(!pud_present(*pudp));
-	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
-	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
-	return old;
-}
-#endif
-
 /**
  * reserve_top_address - Reserve a hole in the top of the kernel address space
  * @reserve: Size of hole to reserve
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b..0021eaf88e1d 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1318,6 +1318,13 @@ extern pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma,
 				unsigned long address, pmd_t *pmdp);
 #endif
 
+#ifndef __HAVE_ARCH_PUDP_INVALIDATE
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+			     pud_t *pudp);
+#endif
+#endif
+
 #ifndef __HAVE_ARCH_PTE_SAME
 static inline int pte_same(pte_t pte_a, pte_t pte_b)
 {
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 6e83ce3801b8..1b7081fc4a75 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -229,6 +229,20 @@ pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
 }
 #endif
 
+#ifndef __HAVE_ARCH_PUDP_INVALIDATE
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+		      pud_t *pudp)
+{
+	VM_WARN_ON_ONCE(!pud_present(*pudp));
+	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
+
+	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
+	return old;
+}
+#endif
+#endif
+
 #ifndef pmdp_collapse_flush
 pmd_t pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long address,
 			  pmd_t *pmdp)
-- 
2.54.0


