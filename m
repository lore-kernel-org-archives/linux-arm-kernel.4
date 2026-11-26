Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CAB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dUhM5bd8;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mVSTwD83
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b6RKS7d+8OXBa4lf8wQdl6bNH2OEwyyMIAjDGvUrIQg=; b=dUhM5bd8uSwWiz
	P4SnNqjrR0kjqq4JrKli8tDBkzleAS7eTW8qpiJzSM+Q7dQWH5tJC8ozh+uXHzq0XQQrpP/5gNQ5u
	ROJ1VnTSyyAM8unUaAMTKZFYSVc+6exrSp10PLXw1lhx3SfZNGAVSpqKzhOA4oUNlsnwATNRu0ClD
	VtcQwgJDwDQFT0tzSrMCTent6zwHu4mBFyk+hB0RgrxJwG5PFilzrSurcb+Wl/cr1Vdtt7mQObE1Y
	ocE/zHQBrpgZEteM5gMlIGzjLc7y/6PCwLGcA4eicvLjGWA2BmmL8fJXq0Yw65Wc2pLuiZDaj1KRz
	PUcC+4wFmmcF3tEFKvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY1C-0000000D4hb-0pZB;
	Thu, 26 Nov 2026 11:52:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzx-0000000D43I-0t2e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:50:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E24011D14;
	Thu, 26 Nov 2026 03:50:40 -0800 (PST)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EB5D3F632;
	Thu, 26 Nov 2026 03:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795693843; bh=HFgFPYvLi5gGPuxJoYLpU9XoDsImLyCEfToLCdk4fOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mVSTwD83dW7z4DaJbTOOIc5t6kDvTGe8nHBMShtHhDM2cQuHkc0IgbbAJ50+zOIYN
	 Ib3hB34kg047QUtGSzPZCn/KQYJvHGYPZT+v4LMMxBekG53Jvb6ZJ4vUZ8EYe/XVmB
	 /kQA3xa/3FlzSZktPmitLlwBJTjpDNfkfM/D3PNs=
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
Subject: [RFC v2 10/13] arm64: tlbid: Track the TLBI domain of a task
Date: Thu, 26 Nov 2026 11:49:33 +0000
Message-ID: <20261126114936.864256-11-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126114936.864256-1-kristina.martsenko@arm.com>
References: <20261126114936.864256-1-kristina.martsenko@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_035045_342992_73D89A43 
X-CRM114-Status: GOOD (  26.22  )
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

Maintain a bitmap of valid TLBI domains for each mm. A later patch will
issue TLBIs for an mm to one of the domains in its bitmap.

As a performance optimization, we want to avoid sending TLB
invalidations to CPUs that have never installed a particular mm, since
their TLBs can't contain the mm's PTEs. To achieve this, have each mm
contain a bitmap of valid TLBI domains. A domain is valid if it contains
all the CPUs that the mm has been installed on. Initially all domains
are valid. Whenever an mm is installed on a new CPU, its set of domains
is reduced (using a bitwise AND) to only include those domains that
contain the new CPU.

Use atomic operations to reduce the bitmap. In case two threads update
the bitmap concurrently, the result will be the same.

efi_mm is initialized very early, before TLBI domains are initialized,
so e.g. system_supports_tlbid() will return false. Just configure efi_mm
to use the largest domain in the system (containing all CPUs).

Note: The initial bitmap is all ones. If a TLBI were issued before the
mm is installed, then any domain could be selected, regardless of which
CPUs are in it. (The bits above the last valid domain will be ignored.)
This is fine, since at this point no TLBs actually need to be
invalidated, since the mm hasn't been installed anywhere yet.

Note: destroy_tlbid_context() doesn't need to check mm_is_efi() since
efi_mm is never freed.

Note: It would be possible to use mm_cpumask() instead of a domain
bitmap, but arm64 doesn’t maintain it at the moment, and we would need a
way to convert the cpumask to a domain, which would require more work
than reading the domain bitmap.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/include/asm/mmu.h         | 11 ++++++
 arch/arm64/include/asm/mmu_context.h |  9 ++++-
 arch/arm64/mm/context.c              |  6 ++-
 arch/arm64/mm/tlbid.c                | 59 ++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 5e1211c540ab..fc4e759f9f64 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -25,6 +25,7 @@ typedef struct {
 	void		*vdso;
 	unsigned long	flags;
 	u8		pkey_allocation_map;
+	atomic64_t	*tlbid_domains;
 } mm_context_t;
 
 /*
@@ -106,5 +107,15 @@ static inline void kpti_install_ng_mappings(void) {}
 
 extern bool page_alloc_available;
 
+#ifdef CONFIG_ARM64_TLBID
+int init_tlbid_context(struct mm_struct *mm);
+void destroy_tlbid_context(struct mm_struct *mm);
+void update_tlbid_domains(struct mm_struct *mm, unsigned int cpu);
+#else
+static inline int init_tlbid_context(struct mm_struct *mm) { return 0; }
+static inline void destroy_tlbid_context(struct mm_struct *mm) {}
+static inline void update_tlbid_domains(struct mm_struct *mm, unsigned int cpu) {}
+#endif
+
 #endif	/* !__ASSEMBLER__ */
 #endif
diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 803b68758152..5bf2d3f73e1c 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -21,6 +21,7 @@
 #include <asm/cpufeature.h>
 #include <asm/daifflags.h>
 #include <asm/gcs.h>
+#include <asm/mmu.h>
 #include <asm/proc-fns.h>
 #include <asm/cputype.h>
 #include <asm/sysreg.h>
@@ -172,7 +173,13 @@ init_new_context(struct task_struct *tsk, struct mm_struct *mm)
 	/* pkey 0 is the default, so always reserve it. */
 	mm->context.pkey_allocation_map = BIT(0);
 
-	return 0;
+	return init_tlbid_context(mm);
+}
+
+#define destroy_context(mm) destroy_context(mm)
+static inline void destroy_context(struct mm_struct *mm)
+{
+	destroy_tlbid_context(mm);
 }
 
 static inline void arch_dup_pkeys(struct mm_struct *oldmm,
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 0f4a28b87469..21146d57e8b7 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -13,6 +13,7 @@
 #include <linux/mm.h>
 
 #include <asm/cpufeature.h>
+#include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/smp.h>
 #include <asm/tlbflush.h>
@@ -215,7 +216,7 @@ static u64 new_context(struct mm_struct *mm)
 void check_and_switch_context(struct mm_struct *mm)
 {
 	unsigned long flags;
-	unsigned int cpu;
+	unsigned int cpu = smp_processor_id();
 	u64 asid, old_active_asid;
 
 	if (system_supports_cnp())
@@ -251,7 +252,6 @@ void check_and_switch_context(struct mm_struct *mm)
 		atomic64_set(&mm->context.id, asid);
 	}
 
-	cpu = smp_processor_id();
 	if (cpumask_test_and_clear_cpu(cpu, &tlb_flush_pending))
 		local_flush_tlb_all();
 
@@ -262,6 +262,8 @@ void check_and_switch_context(struct mm_struct *mm)
 
 	arm64_apply_bp_hardening();
 
+	update_tlbid_domains(mm, cpu);
+
 	/*
 	 * Defer TTBR0_EL1 setting for user threads to uaccess_enable() when
 	 * emulating PAN.
diff --git a/arch/arm64/mm/tlbid.c b/arch/arm64/mm/tlbid.c
index 33d669e6bf1e..2c22ab71edbf 100644
--- a/arch/arm64/mm/tlbid.c
+++ b/arch/arm64/mm/tlbid.c
@@ -7,18 +7,77 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/atomic.h>
 #include <linux/bitops.h>
 #include <linux/bitmap.h>
+#include <linux/efi.h>
 #include <linux/jump_label.h>
+#include <linux/mm_types.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
 
+#include <asm/mmu.h>
+
 DEFINE_STATIC_KEY_FALSE(tlbid_enabled);
 
 static u16 *domain_ids;
 static unsigned long **cpu_domains;
 static int domain_count;
 
+void update_tlbid_domains(struct mm_struct *mm, unsigned int cpu)
+{
+	atomic64_t *mm_domains = mm->context.tlbid_domains;
+
+	if (!system_supports_tlbid())
+		return;
+
+	for (int i = 0; i < BITS_TO_U64(domain_count); i++) {
+		s64 mm_domain_bits = atomic64_read(&mm_domains[i]);
+		s64 cpu_domain_bits = cpu_domains[cpu][i];
+
+		if ((mm_domain_bits & cpu_domain_bits) != mm_domain_bits)
+			atomic64_and(cpu_domain_bits, &mm_domains[i]);
+	}
+}
+
+int init_tlbid_context(struct mm_struct *mm)
+{
+	bool is_efi = mm_is_efi(mm);
+	atomic64_t *domains;
+	int ndomains, nwords;
+
+	/* TLBI domain support not yet known at EFI init time */
+	if (!system_supports_tlbid() && !is_efi)
+		return 0;
+
+	ndomains = is_efi ? MAX_TLBI_DOMAINS : domain_count;
+	nwords = BITS_TO_U64(ndomains);
+	domains = kcalloc(nwords, sizeof(*domains), GFP_KERNEL);
+	if (!domains)
+		return -ENOMEM;
+
+	if (is_efi) {
+		/*
+		 * Use a safe domain since updates to domains would be lost if
+		 * efi_mm were installed before TLBID is enabled.
+		 */
+		atomic64_set(domains, 1);
+	} else {
+		for (int i = 0; i < nwords; i++)
+			atomic64_set(&domains[i], -1);
+	}
+
+	mm->context.tlbid_domains = domains;
+
+	return 0;
+}
+
+void destroy_tlbid_context(struct mm_struct *mm)
+{
+	if (system_supports_tlbid())
+		kfree(mm->context.tlbid_domains);
+}
+
 static int __init init_cpu_domain_bitmaps(struct tlbi_domain *domains)
 {
 	int cpu;
-- 
2.43.0


