Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7302606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bZYQXMQw;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bFDbg/Xr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EQ0rA8yaqA1vSCBqSZZVZvjqdV+T4ndirWABYJGy5RI=; b=bZYQXMQwmgRtYnCZD/ZtSkEsuB
	M+uSca+2LA5krVbIb0vMRWyagyFNa5Qp2BHVJ5gJ8lrIE4jEGEHeS1W78m3omZPcJmVBvb792OMPF
	ddvmnnuLD2CzXF1DVe40Mqndm1Yl0bh+0gQZaqVk2R5yVNYU0wgEhmDdWVfEJB1KoxZ0/NqFTF7sh
	hGhDYNMRoGRluMix06rNWrnxByOJ2AI4UKuH+cIKK/x2URi9jSb/Fu2TR97SIv9wu4setrha+thWX
	dqc2riHoJ6nEEnVPF2EEkQIHF7j16zZKkC+EaTLIhZvhVV3bPxtkS2Rnlpi9u+zreqT+JgzBY4ODc
	nvH1PB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ1-00000001YeC-46W3;
	Sun, 22 Nov 2026 18:45:23 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYr-00000001YT9-1BuD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:14 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2f03a137f6aso22794725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373111; x=1795977911; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQ0rA8yaqA1vSCBqSZZVZvjqdV+T4ndirWABYJGy5RI=;
        b=bFDbg/Xr8YjFPKwyIzNrvtWeXg7teVn08wLRNiDmJ803aZaLuwoGMGDr5p+7FsqRmD
         XENs4Blyq/B0I8Lq3zatr77yh7NGbXmtQ5gmUbTpuYFEN5ChdPDRMd4KTbZCRWayyRrT
         BQK6WFMAL1Sjgb1I6g7Ls78zjqqvTFoXlHsBUZjNKiQ0DTOWP+0Awzux58+Z/3x78LG8
         5YCfwQ+oXLBGSeAN7WCJz29FJ/MCMQOKGhvGvTP9fHLCG78e1kzxBdPlF4K2jbBzKzHh
         IVfggBg6v8hs6YHemGU+HbPdo8CwCtum9lQog2VqHYBTDJdxsM0BAFz7h4b2O/y5z0H2
         1ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373111; x=1795977911;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQ0rA8yaqA1vSCBqSZZVZvjqdV+T4ndirWABYJGy5RI=;
        b=f7CuC+iCnBWTIUFOityvdxZF+aCRNtHTdDjYajcjT5OnqpqmyPjxjjQnnW3JN4Ta02
         U2rLVvG5xQwlTVZ4MoNEs7rL/4mwUwABaP6gu62a65m7LKj9Xd9KDFECmj0zy3sKkPEw
         6P4DIyU9w12ysQCGHNLqgLbdNVSg4YPZ8QC1FYH2+sklzHWX3W1eg+iKCh2nCwVv5Yu9
         1S5q5n5Xg0oArRyEiSgfyRmH9DHmuwhM3OsyS36+1ohp988atEU+ksYiS4b3ZbUolG3x
         5V1Dgd08uoYLH3IoLNBVfHgmy6sgVs3eb1ISOR2EU6youtecwhqEE0uAroA9ySJ4FB1o
         fC4Q==
X-Forwarded-Encrypted: i=1; AL+hErEEmj0U34yWZCqzXhbkJoC4tsKa5VGDnCYjo9ZS/evnEjb9SUzQYDLpeJbgk5Mo7rcuxAr49fCt5ozp6N8d/fnv@lists.infradead.org
X-Gm-Message-State: APuU4Z+F8/9eCxUSbaYveLDXztkSx3IFaNRX2ea79lcR6lwZ3lLy9dT/
	RUWEpckiJT5JQbQKPzdmNJut/9BQKOHNxhmTqL8qTdBd9DTJ38x/S/zM5DcuKieDU4y9vw1kNit
	ccF/A4BVpCBq3X0ZksLWzYg==
X-Received: from plbmq8.prod.google.com ([2002:a17:902:fd48:b0:2f0:4f32:d57d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:eccf:b0:2ef:e465:5049 with SMTP id d9443c01a7336-2f03f156193mr88468125ad.10.1795373110869;
 Sun, 22 Nov 2026 10:45:10 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:46 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-13-jthoughton@google.com>
Subject: [PATCH v3 12/19] arm64: Support hugetlb vmemmap optimization
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
X-CRM114-CacheID: sfid-20261122_104513_348497_1098C762 
X-CRM114-Status: GOOD (  16.37  )
X-Spam-Score: -9.5 (---------)
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

Support HVO if HW AF and BBML3 are supported. These are the required
features for the vmemmap to be modified in place.

On arm64 systems that do not have the required hardware features to
support HVO, the HVO sysctl will not appear, and any attempts to enable
HVO (either via the command line or via
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y) will have no effect.

Because HVO support is only known after the vmemmap has been populated,
disable the section-based vmemmap optimization in vmemmap_populate(), as
LoongArch and powerpc do. Boot-time HugeTLB folios are then optimized
when they are gathered.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/Kconfig               | 1 +
 arch/arm64/include/asm/pgtable.h | 6 ++++++
 arch/arm64/mm/mmu.c              | 9 +++++++++
 mm/hugetlb_vmemmap.c             | 4 ++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 4cce60c2de66..b13618f0ace5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -95,6 +95,7 @@ config ARM64
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM
 	select ARCH_WANTS_EXECMEM_LATE
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 7421c0a048ff..5dadaac54bef 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1931,6 +1931,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+#define arch_support_vmemmap_remap arch_support_vmemmap_remap
+static inline bool arch_support_vmemmap_remap(void)
+{
+	return system_supports_bbm_through_af();
+}
+
 static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
 					 const pte_t pte)
 {
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a61464cf7367..bc3eea16004c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -30,6 +30,7 @@
 #include <linux/mm_inline.h>
 #include <linux/pagewalk.h>
 #include <linux/stop_machine.h>
+#include <linux/vmemmap-optimization.h>
 
 #include <asm/barrier.h>
 #include <asm/cputype.h>
@@ -1843,6 +1844,14 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 	/* [start, end] should be within one section */
 	WARN_ON_ONCE(end - start > PAGES_PER_SECTION * sizeof(struct page));
 
+	/*
+	 * Whether HVO is supported is only known once the system-wide CPU
+	 * features have been finalized, which is after the vmemmap has been
+	 * populated, so the section-based vmemmap optimization (pre-HVO) is
+	 * not supported. Boot-time HugeTLB folios are optimized later instead.
+	 */
+	section_vmemmap_optimization_disable(start, end);
+
 	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
 	    (end - start < PAGES_PER_SECTION * sizeof(struct page)))
 		return vmemmap_populate_basepages(start, end, node, altmap);
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index fb6da64bd80d..a01377c37c96 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -79,6 +79,10 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
+		/*
+		 * On arm64, this requires BBML3. Its support has already been
+		 * checked.
+		 */
 		pmd_populate_kernel(&init_mm, pmd, pgtable);
 		/*
 		 * Modern MMUs allow overlapping TLB entries with different mapping
-- 
2.56.1.809.ga0b61035b5-goog


