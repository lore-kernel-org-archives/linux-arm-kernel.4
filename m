Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0226606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X4aEckHs;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Z5nyoxNa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CskE5BvFLsmuIh09XbO/4T3i41no4zBMNW1nB5V0okQ=; b=X4aEckHsFXVBJM
	hT5Poxt7YW6zrv0UtyNdf9MjLER5vvBcG7KWFX8Y+Z1b1BLFB4ER9Skqk7PtlJ9MJbYNca5tSOZW2
	C+yUUVQmlM00n3+WcfRiWisKlUhJaYDG9I38+vAHs2jIOMLU/UhVD7LW5bK1YjaDvRFdzbVShJ6tt
	L8hGupzzb8uxETdDstIcg9kTNc1y1Kqn6quECKbSgiVyGzNOD8XNj+I8B7PYJdhjKjnl9vUxRgRkn
	/Uxsu7+sSiaAjewwdnM1WJPPgwEHlXV/k/ip6zXJ5fPQYAUlrtfsk/6c/3J5flA9w/X0J016fOwLF
	hBjpB6JAHVFSVsy4cUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY1C-0000000D4hw-1gtB;
	Thu, 26 Nov 2026 11:52:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY03-0000000D4B4-26WS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:50:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13F901D13;
	Thu, 26 Nov 2026 03:50:48 -0800 (PST)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A436E3F632;
	Thu, 26 Nov 2026 03:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795693850; bh=wsWg76cjgv83Wlty+GYvvSJPXiyNefj4Gb9JXNr9hjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z5nyoxNaDDvb44/emzNW4Jcb9gNtBGb2ZupKHLP6C13VODlus3NX7pdBxUe+5ErGA
	 0q6QpKk8Puom7fitYgTnUENLQIKWSGxG7KHMuZORBY4eQ3n5qO34e+MNm0ONzvkcZU
	 R5FpFbYFtBW+ZT9DMwkUsr1PIAti3dI0VZH36/+w=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [RFC v2 12/13] arm64: tlbid: Pass domain to TLBI instructions
Date: Thu, 26 Nov 2026 11:49:35 +0000
Message-ID: <20261126114936.864256-13-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126114936.864256-1-kristina.martsenko@arm.com>
References: <20261126114936.864256-1-kristina.martsenko@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_035051_664075_9EFF1569 
X-CRM114-Status: GOOD (  26.54  )
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

Update the TLB invalidation interfaces in tlbflush.h to pass a TLBI
domain to TLBI instructions (when available). This may improve
performance by sending the TLBI to only the subset of CPUs that needs
it.

Only use TLBI domains for user mappings, as the kernel is mapped on all
CPUs. Use the mm domain bitmap to choose the smallest domain that
contains all the CPUs that an mm has been installed on.

Most invalidations need to use the TLBIP instruction in order to use a
TLBI domain. The exception is TLBI ASID* (flush_tlb_mm()) which can pass
a domain to a regular TLBI instruction.

To avoid runtime checks on the TLBI domain, use TLBIP instructions for all
invalidations (except local/non-shareable) when supported. When no
domain is needed, callers pass 0 which is the fallback domain
broadcasting to the entire Inner Shareable domain. Local invalidations
continue to use TLBI instructions since the TLBID architecture does not
have non-shareable versions of TLBIP instructions.

The mm domain bitmap may be updated concurrently by another CPU while it
is being read. Use a DSB to ensure that invalidations don't miss any CPU
that has relevant mappings.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/include/asm/mmu.h      |  2 +
 arch/arm64/include/asm/tlbflush.h | 90 ++++++++++++++++++++++---------
 arch/arm64/kvm/hyp/nvhe/tlb.c     |  2 +-
 arch/arm64/kvm/hyp/vhe/tlb.c      |  2 +-
 arch/arm64/mm/tlbid.c             | 36 +++++++++++++
 5 files changed, 104 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index fc4e759f9f64..ae43a91ddabc 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -111,10 +111,12 @@ extern bool page_alloc_available;
 int init_tlbid_context(struct mm_struct *mm);
 void destroy_tlbid_context(struct mm_struct *mm);
 void update_tlbid_domains(struct mm_struct *mm, unsigned int cpu);
+u16 get_tlbid_domain(struct mm_struct *mm);
 #else
 static inline int init_tlbid_context(struct mm_struct *mm) { return 0; }
 static inline void destroy_tlbid_context(struct mm_struct *mm) {}
 static inline void update_tlbid_domains(struct mm_struct *mm, unsigned int cpu) {}
+static inline u16 get_tlbid_domain(struct mm_struct *mm) { return 0; }
 #endif
 
 #endif	/* !__ASSEMBLER__ */
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index da7f99d722a5..7c7349236fb8 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -62,7 +62,9 @@
 	}									\
 } while (0)
 
+#define TLBI_ASID_MASK		GENMASK_ULL(63, 48)
 #define TLBI_TLBID_MASK		GENMASK_ULL(15, 0)
+#define TLBIP_ADDR_MASK		GENMASK_U128(107, 64)
 
 /* This macro creates a properly formatted VA operand for the TLBI */
 #define __TLBI_VADDR(addr, asid)				\
@@ -145,6 +147,7 @@ static inline void sme_dvmsync_batch(void)
  * in asm/stage2_pgtable.h.
  */
 #define TLBI_TTL_MASK		GENMASK_ULL(47, 44)
+#define TLBIP_TTL64		BIT(32)
 
 #define TLBI_TTL_UNKNOWN	INT_MAX
 
@@ -220,22 +223,38 @@ static __always_inline void ipas2e1is(bool tlbip, u128 arg)
 }
 
 static __always_inline void __tlbi_level_asid(tlbi_op op, u64 addr, u32 level,
-					      u16 asid)
+					      u16 asid, bool local, int domain)
 {
-	u64 arg = __TLBI_VADDR(addr, asid);
+	bool tlbip = system_supports_tlbid() && !local;
+	u128 arg = 0;
+
+	if (tlbip) {
+		arg |= (((u128)addr >> 12) << 64) & TLBIP_ADDR_MASK;
+		arg |= FIELD_PREP(TLBI_ASID_MASK, asid);
+		arg |= domain;
+	} else {
+		arg |= __TLBI_VADDR(addr, asid);
+	}
 
 	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
 		u64 ttl = level | (get_trans_granule() << 2);
+		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);
 
-		FIELD_MODIFY(TLBI_TTL_MASK, &arg, ttl);
+		if (tlbip)
+			arg |= TLBIP_TTL64;
 	}
 
-	op(false, arg);
+	op(tlbip, arg);
 }
 
 static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
 {
-	__tlbi_level_asid(op, addr, level, 0);
+	__tlbi_level_asid(op, addr, level, 0, false, 0);
+}
+
+static inline void __tlbi_level_local(tlbi_op op, u64 addr, u32 level)
+{
+	__tlbi_level_asid(op, addr, level, 0, true, -1);
 }
 
 /*
@@ -419,15 +438,16 @@ static inline void flush_tlb_all(void)
 
 static inline void flush_tlb_mm(struct mm_struct *mm)
 {
-	unsigned long asid;
+	unsigned long arg;
 
 	dsb(ishst);
 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_NXP_ERR050104)) {
 		__tlbi(vmalle1is);
 	} else {
-		asid = __TLBI_VADDR(0, ASID(mm));
-		__tlbi(aside1is, asid);
-		__tlbi_user(aside1is, asid);
+		arg = __TLBI_VADDR(0, ASID(mm));
+		arg |= get_tlbid_domain(mm);
+		__tlbi(aside1is, arg);
+		__tlbi_user(aside1is, arg);
 	}
 	__tlbi_sync_s1ish(mm);
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
@@ -539,24 +559,38 @@ static __always_inline void ripas2e1is(bool tlbip, u128 arg)
 
 static __always_inline void __tlbi_range(tlbi_op op, u64 addr,
 					 u16 asid, int scale, int num,
-					 u32 level, bool lpa2)
+					 u32 level, bool lpa2, bool local,
+					 int domain)
 {
-	u64 arg = 0;
+	bool tlbip = system_supports_tlbid() && !local;
+	u128 arg = 0;
+
+	if (tlbip) {
+		arg |= (((u128)addr >> 12) << 64) & TLBIP_ADDR_MASK;
+		arg |= domain;
+	} else {
+		arg |= FIELD_PREP(TLBIR_BADDR_MASK, addr >> (lpa2 ? 16 : PAGE_SHIFT));
+	}
+
+	if (level <= 3) {
+		arg |= FIELD_PREP(TLBIR_TTL_MASK, level);
+		if (tlbip)
+			arg |= TLBIP_TTL64;
+	}
 
-	arg |= FIELD_PREP(TLBIR_BADDR_MASK, addr >> (lpa2 ? 16 : PAGE_SHIFT));
-	arg |= FIELD_PREP(TLBIR_TTL_MASK, level > 3 ? 0 : level);
 	arg |= FIELD_PREP(TLBIR_NUM_MASK, num);
 	arg |= FIELD_PREP(TLBIR_SCALE_MASK, scale);
 	arg |= FIELD_PREP(TLBIR_TG_MASK, get_trans_granule());
 	arg |= FIELD_PREP(TLBIR_ASID_MASK, asid);
 
-	op(false, arg);
+	op(tlbip, arg);
 }
 
 static __always_inline void __flush_tlb_range_op(tlbi_op lop, tlbi_op rop,
 						 u64 start, size_t pages,
 						 u64 stride, u16 asid,
-						 u32 level, bool lpa2)
+						 u32 level, bool lpa2,
+						 bool local, int domain)
 {
 	u64 addr = start, end = start + pages * PAGE_SIZE;
 	int scale = 3;
@@ -574,23 +608,24 @@ static __always_inline void __flush_tlb_range_op(tlbi_op lop, tlbi_op rop,
 
 		num = __TLBI_RANGE_NUM(pages, scale);
 		if (num >= 0) {
-			__tlbi_range(rop, addr, asid, scale, num, level, lpa2);
+			__tlbi_range(rop, addr, asid, scale, num, level, lpa2,
+				     local, domain);
 			addr += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT;
 		}
 
 		scale--;
 		continue;
 invalidate_one:
-		__tlbi_level_asid(lop, addr, level, asid);
+		__tlbi_level_asid(lop, addr, level, asid, local, domain);
 		addr += stride;
 	}
 }
 
-#define __flush_s1_tlb_range_op(op, start, pages, stride, asid, tlb_level) \
-	__flush_tlb_range_op(op, r##op, start, pages, stride, asid, tlb_level, lpa2_is_enabled())
+#define __flush_s1_tlb_range_op(op, start, pages, stride, asid, tlb_level, local, domain) \
+	__flush_tlb_range_op(op, r##op, start, pages, stride, asid, tlb_level, lpa2_is_enabled(), local, domain)
 
 #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
-	__flush_tlb_range_op(op, r##op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled())
+	__flush_tlb_range_op(op, r##op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled(), false, 0)
 
 static inline bool __flush_tlb_range_limit_excess(unsigned long pages,
 						  unsigned long stride)
@@ -631,6 +666,7 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	unsigned long asid, pages;
+	int domain;
 
 	pages = (end - start) >> PAGE_SHIFT;
 
@@ -639,10 +675,12 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
 		return;
 	}
 
-	if (!(flags & TLBF_NOBROADCAST))
+	if (!(flags & TLBF_NOBROADCAST)) {
 		dsb(ishst);
-	else
+		domain = get_tlbid_domain(mm);
+	} else {
 		dsb(nshst);
+	}
 
 	asid = ASID(mm);
 
@@ -653,11 +691,11 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
 		switch (flags & (TLBF_NOWALKCACHE | TLBF_NOBROADCAST)) {
 		case TLBF_NONE:
 			__flush_s1_tlb_range_op(vae1is, start, pages, stride,
-						asid, tlb_level);
+						asid, tlb_level, false, domain);
 			break;
 		case TLBF_NOWALKCACHE:
 			__flush_s1_tlb_range_op(vale1is, start, pages, stride,
-						asid, tlb_level);
+						asid, tlb_level, false, domain);
 			break;
 		case TLBF_NOBROADCAST:
 			/* Combination unused */
@@ -665,7 +703,7 @@ static __always_inline void __do_flush_tlb_range(struct vm_area_struct *vma,
 			break;
 		case TLBF_NOWALKCACHE | TLBF_NOBROADCAST:
 			__flush_s1_tlb_range_op(vale1, start, pages, stride,
-						asid, tlb_level);
+						asid, tlb_level, true, -1);
 			break;
 		}
 	}
@@ -736,7 +774,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 
 	dsb(ishst);
 	__flush_s1_tlb_range_op(vaale1is, start, pages, stride, 0,
-				TLBI_TTL_UNKNOWN);
+				TLBI_TTL_UNKNOWN, false, 0);
 	__tlbi_sync_s1ish_kernel();
 	isb();
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/tlb.c b/arch/arm64/kvm/hyp/nvhe/tlb.c
index fdb90483340c..f7cac7f1f4fe 100644
--- a/arch/arm64/kvm/hyp/nvhe/tlb.c
+++ b/arch/arm64/kvm/hyp/nvhe/tlb.c
@@ -187,7 +187,7 @@ void __kvm_tlb_flush_vmid_ipa_nsh(struct kvm_s2_mmu *mmu,
 	 * Instead, we invalidate Stage-2 for this IPA, and the
 	 * whole of Stage-1. Weep...
 	 */
-	__tlbi_level(ipas2e1, ipa, level);
+	__tlbi_level_local(ipas2e1, ipa, level);
 
 	/*
 	 * We have to ensure completion of the invalidation at Stage-2,
diff --git a/arch/arm64/kvm/hyp/vhe/tlb.c b/arch/arm64/kvm/hyp/vhe/tlb.c
index e848ba880694..84650220e60e 100644
--- a/arch/arm64/kvm/hyp/vhe/tlb.c
+++ b/arch/arm64/kvm/hyp/vhe/tlb.c
@@ -135,7 +135,7 @@ void __kvm_tlb_flush_vmid_ipa_nsh(struct kvm_s2_mmu *mmu,
 	 * Instead, we invalidate Stage-2 for this IPA, and the
 	 * whole of Stage-1. Weep...
 	 */
-	__tlbi_level(ipas2e1, ipa, level);
+	__tlbi_level_local(ipas2e1, ipa, level);
 
 	/*
 	 * We have to ensure completion of the invalidation at Stage-2,
diff --git a/arch/arm64/mm/tlbid.c b/arch/arm64/mm/tlbid.c
index 2c22ab71edbf..2615ccb6bc56 100644
--- a/arch/arm64/mm/tlbid.c
+++ b/arch/arm64/mm/tlbid.c
@@ -10,6 +10,7 @@
 #include <linux/atomic.h>
 #include <linux/bitops.h>
 #include <linux/bitmap.h>
+#include <linux/bug.h>
 #include <linux/efi.h>
 #include <linux/jump_label.h>
 #include <linux/mm_types.h>
@@ -24,6 +25,33 @@ static u16 *domain_ids;
 static unsigned long **cpu_domains;
 static int domain_count;
 
+u16 get_tlbid_domain(struct mm_struct *mm)
+{
+	unsigned long mask = BITMAP_LAST_WORD_MASK(domain_count);
+	int idx = (domain_count - 1) / 64;
+	unsigned long domain_idx;
+	unsigned long domains;
+
+	if (!system_supports_tlbid())
+		return 0;
+
+	/* Open-coded find_last_bit() that uses atomic reads */
+	do {
+		domains = atomic64_read(&mm->context.tlbid_domains[idx]);
+		domains &= mask;
+		if (domains) {
+			domain_idx = idx * 64 + __fls(domains);
+			break;
+		}
+		mask = ~0UL;
+	} while (idx--);
+
+	if (WARN_ON(idx < 0))
+		return 0;
+
+	return domain_ids[domain_idx];
+}
+
 void update_tlbid_domains(struct mm_struct *mm, unsigned int cpu)
 {
 	atomic64_t *mm_domains = mm->context.tlbid_domains;
@@ -38,6 +66,14 @@ void update_tlbid_domains(struct mm_struct *mm, unsigned int cpu)
 		if ((mm_domain_bits & cpu_domain_bits) != mm_domain_bits)
 			atomic64_and(cpu_domain_bits, &mm_domains[i]);
 	}
+
+	/*
+	 * Pairs with the DSB before reading tlbid_domains in the TLBI paths.
+	 * Either a concurrent PTE update is visible to this CPU before it uses
+	 * the mm, or the PTE updater observes the reduced domain bitmap and
+	 * includes this CPU in its TLBI.
+	 */
+	dsb(ish);
 }
 
 int init_tlbid_context(struct mm_struct *mm)
-- 
2.43.0


