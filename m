Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494E0606A88B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rXT3Z0Ek;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EV89ErD8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eRJMwvDmLa0Mxt7lUvodHEIfZ5kLtrx4K/1ogYaxsoQ=; b=rXT3Z0EkQ+rpAQ
	nXnRzVdtIUy2BUOwGcKlRbrHzItFIKCywT1FRXkDRKrencwB4KuBFTqyxkRkel2q28R54/3HNhJVc
	IdAvjrPq99oT3+Juu90irgQyMTDprGcVZchvezqUP+Fn7PiZK/yr5zIiLuEzk8QdhXvB4eGAYPpvD
	Y21JtlM/+sqIfbelW+arBEU8zafH+/VOa9Iz4n5QdqwH+PIURsGnuY67YM23IZ94j0rretJa7VVeB
	l1DqJjjvmYB94ldPvRaL72ROBAhQsg/TOnIKIFpMXNXqvZvM3NpPp7ykdcxMp4HzkKInpDZo3N8bB
	TcKwMED2Y70YA2/FLbcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDHH-00000004i7m-1ACy;
	Tue, 17 Nov 2026 07:06:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDHC-00000004i1b-1rNR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:06:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7AF91476;
	Mon, 16 Nov 2026 23:06:42 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B04F3F763;
	Mon, 16 Nov 2026 23:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899205; bh=cjFCjsGjjj3NFQXfJiX7x6ODC1OdEC1eKFuR2TOwJ+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EV89ErD8dmhrCVbgTiKEkJd0dmsZr5W+dUysQu7rq6Ef38hr1a8eEIJaRa9uVoDhJ
	 /Z/yaKebEMMt2WXEM8qXKJjo5Mg+j1a8Y3Vwn0PPF+PuGvprw8y24H1oqjdNvtPscF
	 4xgqMzOlIz4KoSBzl3lkSqgDicQ4ryI07hf66H6o=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V3 06/14] arm64/mm: Enable fixmap with 5 level page table
Date: Tue, 17 Nov 2026 12:36:05 +0530
Message-ID: <20261117070613.1183243-7-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_230646_611426_74C142A9 
X-CRM114-Status: GOOD (  15.41  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

FEAT_D128 halves PTRS_PER_PXX thus shrinking the VA range coverage for each
pgtable level. So in order to preserve all existing VA range configurations
for various base page sizes, some pgtable configurations now need to become
5-level which were 4-level earlier.

Since fixmap builds and manipulates kernel page tables early on during boot
these mappings must also gain that additional level, which was not required
earlier.

Changes in the page table geometry can result in the P4D table covering the
fixmap range no longer being populated by other kernel initialization code.

Enable this scenario by allocating and populating a static P4D table during
early fixmap initialization, similar to the existing handling of other page
table levels.

Add a pgd_page_paddr() fallback stub when (PGTBALE_LEVELS <= 4) which helps
in intercepting any unintended usage.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V3:

- Updated the commit message

 arch/arm64/include/asm/pgtable.h |  1 +
 arch/arm64/mm/fixmap.c           | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 737e1e42f1ec0..290aefcf0f0f1 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1184,6 +1184,7 @@ static inline p4d_t *p4d_offset_kimg(pgd_t *pgdp, u64 addr)
 #else
 
 static inline bool pgtable_l5_enabled(void) { return false; }
+#define pgd_page_paddr(pgd)	({ BUILD_BUG(); 0; })
 
 #define p4d_index(addr)		(((addr) >> P4D_SHIFT) & (PTRS_PER_P4D - 1))
 
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index 2a0fe0b0f7710..5512521fef8fa 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -34,6 +34,7 @@ static_assert(NR_BM_PMD_TABLES == 1);
 static pte_t bm_pte[NR_BM_PTE_TABLES][PTRS_PER_PTE] __bss_pgtbl;
 static pmd_t bm_pmd[PTRS_PER_PMD] __bss_pgtbl __maybe_unused;
 static pud_t bm_pud[PTRS_PER_PUD] __bss_pgtbl __maybe_unused;
+static p4d_t bm_p4d[PTRS_PER_P4D] __bss_pgtbl __maybe_unused;
 
 static inline pte_t *fixmap_pte(unsigned long addr)
 {
@@ -95,6 +96,19 @@ static void __init early_fixmap_init_pud(p4d_t *p4dp, unsigned long addr,
 	early_fixmap_init_pmd(pudp, addr, end);
 }
 
+static void __init early_fixmap_init_p4d(pgd_t *pgdp, unsigned long addr,
+					 unsigned long end)
+{
+	pgd_t pgd = pgdp_get(pgdp);
+	p4d_t *p4dp;
+
+	if (pgd_none(pgd))
+		__pgd_populate(pgdp, __pa_symbol(bm_p4d),
+			       PGD_TYPE_TABLE | PGD_TABLE_AF);
+	p4dp = p4d_offset_kimg(pgdp, addr);
+	early_fixmap_init_pud(p4dp, addr, end);
+}
+
 /*
  * The p*d_populate functions call virt_to_phys implicitly so they can't be used
  * directly on kernel symbols (bm_p*d). This function is called too early to use
@@ -107,9 +121,7 @@ void __init early_fixmap_init(void)
 	unsigned long end = FIXADDR_TOP;
 
 	pgd_t *pgdp = pgd_offset_k(addr);
-	p4d_t *p4dp = p4d_offset_kimg(pgdp, addr);
-
-	early_fixmap_init_pud(p4dp, addr, end);
+	early_fixmap_init_p4d(pgdp, addr, end);
 }
 
 /*
-- 
2.43.0


