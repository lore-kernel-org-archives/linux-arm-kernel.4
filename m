Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BABD606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=doC4UW9Q;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RpKDwRah
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=In5XHn8tUjmrwGSxql+VVDMlJ1U6WaHJPkyrd9YfyY8=; b=doC4UW9QKJaTDt
	LexqdVUtMnDJs5hWhFFqzycflvGZz91bxew5xGxGNojtJGOUvzAoL0+N4F8sIti1n1NEkr04S2uU9
	CIlx2sfc/yTdOlX4MPK0KzdeNC9mchtIvaNN3E0Blt2S1A9lo1/T1UtM+FHfz/G7X6aeJPgQGKJIe
	msMXy+LNfqryzYurS4nhNpDG0RyAeWe7s+Eeva9Iu4KIQ5oRfX25wXoys7tXZs7zg+3cAUSm/FY+E
	SE4SvaPuh7OqRCVrcpTY+Swg3d1P7jhdo9ffEdPICGx3WCGM+1kHG/mHuZrRrpD8pFxzhsWjsUu/A
	Urbli+Dt3hmGechNIDsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDHp-00000004inT-06pf;
	Tue, 17 Nov 2026 07:07:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDHZ-00000004iQ7-2AhE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:07:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E27B1688;
	Mon, 16 Nov 2026 23:07:05 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D40553F882;
	Mon, 16 Nov 2026 23:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899228; bh=rSvlSIXr+wDtZe2exxPGHZkrukV+OXQGNowh+BkvXcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RpKDwRahiZsvs5NYiVXBle9NMAptxzASgBjrEsOtbv2j12uijayfCF8G5LzpedR6X
	 hwxBix7JkHGWE3238+qyf56bAhlEGeiko/kQ4tw6tnrP1PKUvJptKHjfjgWmc8S52H
	 2qj6Vz1wFEM15r2AnKiOZOlMBY5d5KgPcdly8+B8=
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
	linux-mm@kvack.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	kasan-dev@googlegroups.com
Subject: [PATCH V3 12/14] arm64/mm: Relax KASAN shadow alignment for FEAT_D128
Date: Tue, 17 Nov 2026 12:36:11 +0530
Message-ID: <20261117070613.1183243-13-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_230709_622069_A6D02B45 
X-CRM114-Status: GOOD (  13.01  )
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

D128 reduces the number of descriptors in each translation table, causing
some VA size and page granule combinations that use two page table levels
with D64 to now require three levels.

For three-level page tables, the PUD level is folded while the PMD level
remains a real translation level. Hence, PUD_SIZE represents a root-level
span. With D128, some configurations have a KASAN shadow region smaller
than this span, making it impossible for both KASAN shadow boundaries to
satisfy the existing PUD_SIZE alignment requirement.

The KASAN initialization code on arm64 already supports shadow boundaries
which are not root-level aligned, by installing or cloning the next-level
table as required.

Similarly for three level D128 page tables, relax SHADOW_ALIGN to PMD_SIZE,
which corresponds to the first non-folded level below the root level. Keep
the existing alignment requirements unchanged for all other configurations.

Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: kasan-dev@googlegroups.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/kasan_init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index f61f5bc09467c..e12abea6ad156 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -178,7 +178,9 @@ static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
 	} while (pgdp++, addr = next, addr != end);
 }
 
-#if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS > 4
+#if defined(CONFIG_ARM64_D128) && CONFIG_PGTABLE_LEVELS == 3
+#define SHADOW_ALIGN	PMD_SIZE
+#elif defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS > 4
 #define SHADOW_ALIGN	P4D_SIZE
 #else
 #define SHADOW_ALIGN	PUD_SIZE
-- 
2.43.0


