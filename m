Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D50606D807
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xrbvKxiG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5yACgfz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=felPx3uV3OszLiAgjC6qYiNB56VtKrw17gOMSvN5MlY=; b=xrbvKxiG1LnhZS
	GgDsWbV6TYkVLduDs4LNVUCytUARc+WcBsfMq7+MEFv39wRzF+tSEFnJm+wxRWew63KL3SYpeSaPZ
	vOS+joL8a5XrF/au/09WLOryfNUX6PFSP6ZuYEYfIx2vF+YSNM5v0s+q3lYfwfJoOWBn/ATZHF619
	x1QyD7iBNLAgpvuX/OPycDW6ceUBpbg1V5DOuo5qUv6GBn/sz+oSBVdk76wOwS0HjA7Hfq/dzIuj/
	AbFUHO0y2+PQuFT7FsEvrJ6Mz/bmhOYRhJr2TU72c+e/O6lKt0DczouSgB+FdYL/y/C/nHDeUgia1
	BiCZCTaVqNqsbNknUrDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgok-0000000ElO6-2bMh;
	Sat, 07 Nov 2026 13:50:50 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgoi-0000000ElLy-0EiZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:50:49 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2442086eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 05:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059447; x=1794664247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=felPx3uV3OszLiAgjC6qYiNB56VtKrw17gOMSvN5MlY=;
        b=L5yACgfzUNXWTfANPgwP4WxQJyvSVt7rtkZYR1C3bgWq/V7VeSrD4ERU/T/RcryZ2s
         6PS3lUoX6B1eY/Uooz1V0N6UN9F5yaV9xOLR33eXl/TeGjvbz19RBuyJQrtPRSiCYWAx
         SudIZMuXEx5atP/9lQb4TaDSUWwS5NX30cIMsb3dyNFKKkuYWtiRuyhmCCRVlPyq+R2E
         XN/4PtlbR14zK88yvSA4fMy+4f2Ef8zwVg5u2xJk082li8kZ/swwzVVAcrq5YAnnxeCh
         UWSRlIyujCVSTZDjzYsnPXvANBq9EPmAy8Q2UfN+/MAKRBBHTs7oeN8HSO8xro4aHlbr
         0u9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059447; x=1794664247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=felPx3uV3OszLiAgjC6qYiNB56VtKrw17gOMSvN5MlY=;
        b=p+b4WPjKMEQVPXzCmzwgst5GARbkUOTCJ7d1BEDStOI8CR/9tz2YXBr7a97HJ/h/Ug
         ZCZ4TenDUp0NHGVOUqQQV5ykVawneo2zFlWtN0Uv4/Og+oj4O94L+Cz1SY1oE90TxcHu
         JywBpYGscbxR7MMZhhe9Sy8btL92nwXKM+utVg5orfICWi5F++4aUb7EAYumy3nuVlv8
         txMynF1VSKdYfdxhSDyvVrvWGTrA/rJ/Y4Yv13e4fsiusZCn+0bDdtF8pNZCdpipG0Ly
         ipcRhdbp1x4VtZu5lXmSLxu+tHsYNADWtr1vaDHIyup/85C+eXb9BsV/s6212ElXjCuz
         YhSQ==
X-Forwarded-Encrypted: i=1; AL+hErHmcNuGol/wwlC9DDcfmMbJYTadkxWxYv8aUJbpSbKimCtpfwoGMFIGTzMTgVjrtx4xoGULJjTMb+gTDGUa12z0@lists.infradead.org
X-Gm-Message-State: APuU4Z/MSURZULIoJjd2+UAi1drdu8bxF87moOXlZCqk0nGYSO4557WP
	iYQ6taL4kaeaN+HjrrEbjobUHDNhppC0OtG8xCbNQJEjDwt82JUlqT0I
X-Gm-Gg: AYBFou2PadXbzMrQnJaElJ4yxmU+tsui2cfsQE9zDCdbtW5v5PKI9pFYLer8HkU7/NR
	xQyrOHRI7VVHpP5XznXr8Sx8W6TRzi5Nnve5Me1NT601Q37q9Ype9UrOeKDYucQMRhRek4MX52A
	zwxqtP99uNnbauxvili8n3g4LGPWwA8RFvqR1AubXptf+RpX3H+OYN1DZDETNawHwKndbVC49fm
	dpVNRCnBeeQP2ETpcB7EVOaJ1ouTwsPE+P4WGoaGn4pfkCTiH0EeJukluCzXDvT6xADTEv9g1f3
	WYWZWePbM/kFUTHStBT5Vd+ad/q/Jt70kRxbqt2sd++njfVdDRtFeM1axNcBmYSaROBDfpbP3a5
	657knsYbGYLgB5C/AJsxtj8Pu10d/EWGy4T4KWyqeuobtYN4lE8aRv7nCXWec4HAcsFpQ3cLnLL
	PcSd8AUFtm8zMj8DGew32wOIVCWlzkl9qjtKCh0sVaSQ+AdJkcau2VNp2hwASTPLMb6mD4eITwv
	fvwSya65W1QKlg1ufr7kCZuVGlw26RuVRpTOc0aViUFcSxI1ijJqMMTaMgZLNdh6+M5dMxsCOin
	Cumpt9F0gq0gJezKcPhiLPeFTVJic3shFsA4cgo7BBAMCZY9cS85UXtyHg==
X-Received: by 2002:a05:693c:88cd:20b0:370:1333:5e84 with SMTP id 5a478bee46e88-37013335ee3mr5769315eec.11.1794059447224;
        Sat, 07 Nov 2026 05:50:47 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:46 -0800 (PST)
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
Subject: [PATCH v12 07/10] mm/vmalloc: extend page table walk to support larger page_shift sizes and eliminate page table rewalk
Date: Sat,  7 Nov 2026 21:49:50 +0800
Message-Id: <20261107134953.748622-8-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_055048_102999_9150BEC7 
X-CRM114-Status: GOOD (  18.24  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
provides a clean interface by taking struct page **pages and mapping them
via direct PTE iteration. This avoids the page table rewalk seen when
using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.

Extend it to support larger page_shift values, and add PMD- and
contiguous-PTE mappings as well.

Rename it to vmap_pages_range_noflush_walk() since it now handles
more than just small pages.

For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
iterate over pages one by one via vmap_range_noflush(), which would
otherwise lead to page table rewalk. The code is now unified with the
PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().

The pages array may hold several physically discontiguous chunks that
are mapped with the same @shift. If the virtual range is not aligned to
the chunk size, a PMD boundary can split a chunk, and the walk resumes
in the next PMD in the middle of it. arch_vmap_pte_range_map_size()
only checks CONT_PTE_SIZE alignment there and could map past the end of
the chunk, so clamp each PTE-level mapping to the remainder of the
current chunk.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 88 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 54 insertions(+), 34 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e3ea9581e68d0..f2dd9bef4de0f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -558,8 +558,11 @@ void vunmap_range(unsigned long addr, unsigned long end)
 
 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
+	const unsigned long chunk_pages = 1UL << (shift - PAGE_SHIFT);
+	unsigned long pfn, size, chunk_end;
+	unsigned int nr_pages;
 	int err = 0;
 	pte_t *pte;
 
@@ -590,9 +593,13 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 			break;
 		}
 
-		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
-		(*nr)++;
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+		pfn = page_to_pfn(page);
+
+		/* A PMD boundary may split a chunk; never map past its end. */
+		chunk_end = addr + ((ALIGN(pfn + 1, chunk_pages) - pfn) << PAGE_SHIFT);
+		size = vmap_set_ptes(pte, addr, min(end, chunk_end), pfn, prot, shift);
+		nr_pages = PFN_DOWN(size);
+	} while (pte += nr_pages, *nr += nr_pages, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
@@ -602,60 +609,88 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 
 static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pmd_t *pmd;
 	unsigned long next;
+	int err;
 
 	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
 	if (!pmd)
 		return -ENOMEM;
 	do {
 		next = pmd_addr_end(addr, end);
-		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+
+		if (shift >= PMD_SHIFT) {
+			struct page *page = pages[*nr];
+			phys_addr_t phys_addr;
+
+			if (WARN_ON(!page))
+				return -ENOMEM;
+			if (WARN_ON(!pfn_valid(page_to_pfn(page))))
+				return -EINVAL;
+
+			phys_addr = page_to_phys(page);
+
+			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, shift)) {
+				*mask |= PGTBL_PMD_MODIFIED;
+				*nr += 1U << (PMD_SHIFT - PAGE_SHIFT);
+				continue;
+			}
+		}
+		err = vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (pmd++, addr = next, addr != end);
 	return 0;
 }
 
 static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pud_t *pud;
 	unsigned long next;
+	int err;
 
 	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
 	if (!pud)
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+		err = vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (pud++, addr = next, addr != end);
 	return 0;
 }
 
 static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	p4d_t *p4d;
 	unsigned long next;
+	int err;
 
 	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
 	if (!p4d)
 		return -ENOMEM;
 	do {
 		next = p4d_addr_end(addr, end);
-		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+		err = vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (p4d++, addr = next, addr != end);
 	return 0;
 }
 
-static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
-		pgprot_t prot, struct page **pages)
+/*
+ * It can take an array of pages which are not all contiguous, but it
+ * may have contiguous chunks, as hinted by @shift.
+ */
+static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages, unsigned int shift)
 {
 	unsigned long start = addr;
 	pgd_t *pgd;
@@ -670,7 +705,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
 			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
 		if (err)
 			break;
 	} while (pgd++, addr = next, addr != end);
@@ -693,28 +728,13 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
-	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
-
 	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
 		return -EINVAL;
 
-	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
-		return vmap_small_pages_range_noflush(addr, end, prot, pages);
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
+		page_shift = PAGE_SHIFT;
 
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
-
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
-					page_to_phys(pages[i]), prot,
-					page_shift);
-		if (err)
-			return err;
-
-		addr += 1UL << page_shift;
-	}
-
-	return 0;
+	return vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
-- 
2.34.1


