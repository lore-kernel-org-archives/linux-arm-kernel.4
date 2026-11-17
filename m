Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE956606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wPJqKSKl;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Czs8bkSq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uPqr0Kb8/zLLbXQWePyEB3+zBFb98bC3Fi1OiT7G+kU=; b=wPJqKSKljJPgEM
	f2kDYBL1XSQNxO4TmQaGUuixkx1GjJpRVNcxKlGJ8N2uWiYRmlMxsbRJSwjRfe/wLyYfiFxosVs0T
	qEcizoFRUJG6YPBtly1ml0uCLZhTPU5GA6MFEO1dkKQQOSz82xc1YnxsCx3sPKcXagFOQDQwjCuvf
	2q/izfoCi7jPCY/KCzey4REEn6CkHLEZCd2aWJq6L8+ek15wQ/JezjPMMenjJl3yC2msYvQEF0Q8O
	FZDzSc3aDHRriW8hELRDCci2PUftP4FMYnzvvoTLZx1dzWRqRqxjDigGjWr8JyYT0RfK2z2YC/trJ
	E5oONghXzV75DJ7UVsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDHl-00000004iif-23sS;
	Tue, 17 Nov 2026 07:07:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDHG-00000004i4j-1HDC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:06:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96D341476;
	Mon, 16 Nov 2026 23:06:46 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE8C53F882;
	Mon, 16 Nov 2026 23:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899209; bh=gdVTWnm9aG0Cay0F+b7IneTsiFz5Oxc1mfFiGUFXEI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Czs8bkSqNqmqyO2k1vt9iXnL/MSq8J6IWx3r/NJZX2lBiySrLwt/TzpnkKIi+/54U
	 hXrfGa5FnQri67gW6m2wltZcur5mrhKJ0wJ2fBZCiHI85naU0rHtAXsW8lxjtWFD7l
	 13kHnuQKOelzKd006uSxoYMQkGbixqev7KKCg2SU=
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
Subject: [PATCH V3 07/14] arm64/mm: Enable pgtable geometry for FEAT_D128
Date: Tue, 17 Nov 2026 12:36:06 +0530
Message-ID: <20261117070613.1183243-8-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_230650_446615_0CF3DF61 
X-CRM114-Status: GOOD (  13.18  )
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

Add build time support for FEAT_D128 page tables with a new Kconfig option
i.e CONFIG_ARM64_D128. When selected, PTE types become 128 bits wide and
PTE bits are mapped to their new locations. Besides the basic page table
geometry is also updated since each table page now holds half the number
of entries (aka PTRS_PER_PXX) as it did previously. Similarly update the
geometry relevant macros ARM64_CONT_[PTE|PMD]_SHIFT, PGTABLE_LEVELS, and
PTDESC_ORDER.

Although for now config ARM64_D128 remains disabled while all the required
dependencies are getting created in subsequent patches.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/Kconfig                     | 37 ++++++++++++++++++++++----
 arch/arm64/include/asm/pgtable-hwdef.h |  4 +++
 arch/arm64/include/asm/pgtable.h       |  2 ++
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9b08b2457a555..e54cff118f8a8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -280,14 +280,18 @@ config MMU
 
 config ARM64_CONT_PTE_SHIFT
 	int
-	default 5 if PAGE_SIZE_64KB
-	default 7 if PAGE_SIZE_16KB
+	default 4 if PAGE_SIZE_64KB && ARM64_D128
+	default 5 if PAGE_SIZE_64KB && !ARM64_D128
+	default 6 if PAGE_SIZE_16KB && ARM64_D128
+	default 7 if PAGE_SIZE_16KB && !ARM64_D128
 	default 4
 
 config ARM64_CONT_PMD_SHIFT
 	int
-	default 5 if PAGE_SIZE_64KB
-	default 5 if PAGE_SIZE_16KB
+	default 6 if PAGE_SIZE_64KB && ARM64_D128
+	default 5 if PAGE_SIZE_64KB && !ARM64_D128
+	default 4 if PAGE_SIZE_16KB && ARM64_D128
+	default 5 if PAGE_SIZE_16KB && !ARM64_D128
 	default 4
 
 config ARCH_MMAP_RND_BITS_MIN
@@ -366,6 +370,16 @@ config FIX_EARLYCON_MEM
 
 config PGTABLE_LEVELS
 	int
+	default 4 if ARM64_D128 && ARM64_4K_PAGES && ARM64_VA_BITS_39
+	default 5 if ARM64_D128 && ARM64_4K_PAGES && ARM64_VA_BITS_48
+	default 5 if ARM64_D128 && ARM64_4K_PAGES && ARM64_VA_BITS_52
+	default 3 if ARM64_D128 && ARM64_16K_PAGES && ARM64_VA_BITS_36
+	default 4 if ARM64_D128 && ARM64_16K_PAGES && ARM64_VA_BITS_47
+	default 4 if ARM64_D128 && ARM64_16K_PAGES && ARM64_VA_BITS_48
+	default 4 if ARM64_D128 && ARM64_16K_PAGES && ARM64_VA_BITS_52
+	default 3 if ARM64_D128 && ARM64_64K_PAGES && ARM64_VA_BITS_42
+	default 3 if ARM64_D128 && ARM64_64K_PAGES && ARM64_VA_BITS_48
+	default 3 if ARM64_D128 && ARM64_64K_PAGES && ARM64_VA_BITS_52
 	default 2 if ARM64_16K_PAGES && ARM64_VA_BITS_36
 	default 2 if ARM64_64K_PAGES && ARM64_VA_BITS_42
 	default 3 if ARM64_64K_PAGES && (ARM64_VA_BITS_48 || ARM64_VA_BITS_52)
@@ -1697,7 +1711,7 @@ config ARM64_PA_BITS
 
 config ARM64_LPA2
 	def_bool y
-	depends on ARM64_PA_BITS_52 && !ARM64_64K_PAGES
+	depends on ARM64_PA_BITS_52 && !ARM64_64K_PAGES && !ARM64_D128
 
 config NR_CPUS
 	int "Maximum number of CPUs (2-4096)"
@@ -2369,6 +2383,19 @@ config ARM64_HAFT
 
 endmenu # "ARMv8.9 architectural features"
 
+menu "ARMv9.3 architectural features"
+
+config ARM64_D128
+	bool
+	default n
+	help
+	  ARMv9.3 introduces FEAT_D128, which provides a 128 bit page
+	  table format, along with related instructions.
+
+	  If unsure, say Y.
+
+endmenu # "ARMv9.3 architectural features"
+
 menu "ARMv9.4 architectural features"
 
 config ARM64_GCS
diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index 72f31800c7030..1ee1a6d9db6d4 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -7,7 +7,11 @@
 
 #include <asm/memory.h>
 
+#ifdef CONFIG_ARM64_D128
+#define PTDESC_ORDER 4
+#else
 #define PTDESC_ORDER 3
+#endif
 
 /* Number of VA bits resolved by a single translation table level */
 #define PTDESC_TABLE_SHIFT	(PAGE_SHIFT - PTDESC_ORDER)
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 290aefcf0f0f1..bd31211624d4d 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1081,6 +1081,8 @@ static inline bool pgtable_l4_enabled(void) { return false; }
 
 static __always_inline bool pgtable_l5_enabled(void)
 {
+	if (IS_ENABLED(CONFIG_ARM64_D128))
+		return true;
 	if (!alternative_has_cap_likely(ARM64_ALWAYS_BOOT))
 		return vabits_actual == VA_BITS;
 	return alternative_has_cap_unlikely(ARM64_HAS_VA52);
-- 
2.43.0


