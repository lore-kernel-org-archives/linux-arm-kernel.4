Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91E3606A895
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gsDWm4S1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQ4M66Ff
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1ahb900BtN45H4B5q25OIDwOBOyq++YAh9gkOLMihQg=; b=gsDWm4S12Ae7zO
	2cGgETYnuR8gh+KLMdjXgp+4kTBOOtTU+5Li4MbsOjCJtMSzujj39VO1bsDJtnXFklHUY+ESHIxXd
	zcUjfMTqUVjCt8+qaAnx7s8t8dGG83B/a/x1cECBhLCZCUCUBEOA54LztGnnYDO6MtdzknClOOalp
	MtbkOiT4hu6+YGr9U0gTYyWZJ1Uz+fl4ExY36kqtxteZt6HAPy/EAw4KKuKakcyyOe3ZWtjLgzltz
	FbSMhuLtF6hJhuyG6z+fIfVHoxLcTLzOuHHAmu6eFuaCk4byanVhgg1wlDfzLp+UrWDZYbFb0RA7F
	Wto4BOjNLMtPNPg59QJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwU-00000009gkt-3JsH;
	Thu, 12 Nov 2026 11:26:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwM-00000009gh4-0ADS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:26:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5742561D19;
	Thu, 12 Nov 2026 11:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EEE1F00A07;
	Thu, 12 Nov 2026 11:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482761;
	bh=1ahb900BtN45H4B5q25OIDwOBOyq++YAh9gkOLMihQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WQ4M66FfhknQRiwDgcQNx9UTF6dw9I471yvpzzFpUSuIaGtUEIDttLJmvxsZHmCLQ
	 hJX0F1qlMlGDXUOYxTWf7SdVpL7CvzelD5QV/7wcBolWvM85ghWaA+9JhhRWKEqC3r
	 WniKL7pGR1/h0wZfwpTPxeY9yrq0JtLKm6qJS9CAq4M5AQAbwbQPtcvfMNTke5zy86
	 CxstBYAp1AKAptvpHqOlsDaeMJlRSIBRt4KAg8Z1cmGVPcjrm8Oq8RHrUiuj0GsC7p
	 YMtbiBe7/bYpGf43nhfrv078hWGpRSWJwn/m5859ygg8Z1pOoCtVRFawuoaJgLIDPa
	 xmpvfL3jz+yuQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Malin Jonsson <malin.jonsson@est.tech>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH v2 4/6] mm: drop HIGHPTE support altogether
Date: Thu, 12 Nov 2026 12:25:26 +0100
Message-ID: <20261112112528.1116405-5-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112112528.1116405-1-arnd@kernel.org>
References: <20261112112528.1116405-1-arnd@kernel.org>
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

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/hugetlb.h | 5 +----
 include/linux/mm.h      | 1 -
 include/linux/pgtable.h | 9 ---------
 3 files changed, 1 insertion(+), 14 deletions(-)

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
index 780fe849ff8b..1352b4cee7ae 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -100,14 +100,6 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
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
 static inline pte_t *__pte_map(pmd_t *pmd, unsigned long address)
 {
 	return pte_offset_kernel(pmd, address);
@@ -116,7 +108,6 @@ static inline void pte_unmap(pte_t *pte)
 {
 	rcu_read_unlock();
 }
-#endif
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
 
-- 
2.53.0


