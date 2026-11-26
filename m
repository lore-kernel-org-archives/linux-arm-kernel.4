Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421AF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cTn/yUqI;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=G1Zv6WOA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=azZ3KQu2QEF63DgvbCLhBPpTz7ayv4JWXUinkgaEY0U=; b=cTn/yUqI3aGBMV
	v2G9pt3q+5kE8hA8cLzOJDq6pIdJv5uExO0HBGac94QoInOb+r2QAve7/xxnMOAKbd90ug7s0Zt25
	qwysKd0b4OQ37luipL0ovusY07F7oFquuh6o/f3uR6IYUYNwRBT8Kce6iKFqU1lKYGTF3u/wwT961
	kOWw4luhSp0KUOiWE9cTmk1eXrlULC50OhGSk/aJ3YaLU6WG/YFGF8eqoRi8UMbMsrUxuHLHgyW8a
	nb3AKrSOqe7u472DEecZsWiaMXRY+BBNPajFm8TL7n51CDwMBVUBN1/9w2iDYOkkVdZfbyv7eR2rg
	OqJ3v6ZDalzdO0PU1RwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY01-0000000D47f-0aYt;
	Thu, 26 Nov 2026 11:50:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzp-0000000D40p-3CtC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:50:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC68F1CE2;
	Thu, 26 Nov 2026 03:50:33 -0800 (PST)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58F933F632;
	Thu, 26 Nov 2026 03:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795693836; bh=8QlSd2smlIXF53k84CUiTHAkghqqHY3TKxduzhWQPs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G1Zv6WOAFD8/+FkhhNw32S6gMJlePJnG8ukoIiPetxSDatIDtRyd9u+5dFjhW8Z2b
	 XbBsR36uioWjYtKZ6Vj57dU+Ce4XtFma7xFeBQom+oHteqvFlwmzE63o/u5MDSpzzP
	 rVOgpgjskrN0SUkT91zvfzzO4HQbKjy7PBH9c8ec=
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
Subject: [RFC v2 08/13] arm64: tlbid: Set up CPU domain bitmaps
Date: Thu, 26 Nov 2026 11:49:31 +0000
Message-ID: <20261126114936.864256-9-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126114936.864256-1-kristina.martsenko@arm.com>
References: <20261126114936.864256-1-kristina.martsenko@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_035037_889376_F348B701 
X-CRM114-Status: GOOD (  21.91  )
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

For each CPU, set up a bitmap of TLBI domains that contain the CPU.
This will be used in later patches to select a domain that contains a
given set of CPUs.

Sort the bitmap by size, with the largest domain at the smallest index.
This will be used to select the smallest domain. Domains are sorted
based on the number of CPUs that they contain. Domains may also contain
SMMUs but we ignore that for now.

Do the setup in arm64 code, near to where it will be used. The ACPI
table parser calls the arm64 setup code directly after parsing the TLBI
table, and passes a list of parsed domains. Afterwards, the parser's own
temporary structures are freed. Alternatively the arm64 setup could be
done from a subsys_initcall_sync().

Add a static key that will be used to check if TLBI domains are enabled.
Disable domains for nVHE EL2 hypervisor code since it would otherwise
need access to the static key (since it #includes tlbflush.h which will
use system_supports_tlbid()) but it wouldn't use domains anyway.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/include/asm/acpi.h       |   1 +
 arch/arm64/include/asm/cpufeature.h |   8 ++
 arch/arm64/mm/Makefile              |   1 +
 arch/arm64/mm/tlbid.c               | 114 ++++++++++++++++++++++++++++
 drivers/acpi/arm64/tlbi.c           |   6 ++
 5 files changed, 130 insertions(+)
 create mode 100644 arch/arm64/mm/tlbid.c

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index fb0bddd3b7ef..5d173c26b56c 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -178,6 +178,7 @@ struct tlbi_domain {
 	u16 id;
 	cpumask_var_t cpus;
 };
+int arm64_tlbid_init(struct tlbi_domain *domains, int count);
 #endif
 
 #define ACPI_TABLE_UPGRADE_MAX_PHYS MEMBLOCK_ALLOC_ACCESSIBLE
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index b236fe3077f5..93da0ab03177 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -916,6 +916,14 @@ static inline bool system_supports_bbml3(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_BBML3);
 }
 
+DECLARE_STATIC_KEY_FALSE(tlbid_enabled);
+static inline bool system_supports_tlbid(void)
+{
+	return IS_ENABLED(CONFIG_ARM64_TLBID) &&
+	       !is_nvhe_hyp_code() &&
+	       static_branch_unlikely(&tlbid_enabled);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index c26489cf96cd..cfd3255d8f0a 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_TRANS_TABLE)	+= trans_pgd-asm.o
 obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
 obj-$(CONFIG_ARM64_MTE)		+= mteswap.o
 obj-$(CONFIG_ARM64_GCS)		+= gcs.o
+obj-$(CONFIG_ARM64_TLBID) 	+= tlbid.o
 KASAN_SANITIZE_physaddr.o	+= n
 
 obj-$(CONFIG_KASAN)		+= kasan_init.o
diff --git a/arch/arm64/mm/tlbid.c b/arch/arm64/mm/tlbid.c
new file mode 100644
index 000000000000..33d669e6bf1e
--- /dev/null
+++ b/arch/arm64/mm/tlbid.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TLBI domains (FEAT_TLBID) support
+ *
+ * Copyright (C) 2026 Arm Ltd.
+ * Author: Kristina Martsenko <kristina.martsenko@arm.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/bitmap.h>
+#include <linux/jump_label.h>
+#include <linux/slab.h>
+#include <linux/sort.h>
+
+DEFINE_STATIC_KEY_FALSE(tlbid_enabled);
+
+static u16 *domain_ids;
+static unsigned long **cpu_domains;
+static int domain_count;
+
+static int __init init_cpu_domain_bitmaps(struct tlbi_domain *domains)
+{
+	int cpu;
+
+	cpu_domains = kcalloc(nr_cpu_ids, sizeof(*cpu_domains), GFP_KERNEL);
+	if (!cpu_domains)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		cpu_domains[cpu] = bitmap_zalloc(domain_count, GFP_KERNEL);
+		if (!cpu_domains[cpu])
+			goto err;
+
+		for (int i = 0; i < domain_count; i++) {
+			if (cpumask_test_cpu(cpu, domains[i].cpus))
+				set_bit(i, cpu_domains[cpu]);
+		}
+	}
+
+	return 0;
+err:
+	for_each_possible_cpu(cpu)
+		bitmap_free(cpu_domains[cpu]);
+	kfree(cpu_domains);
+	return -ENOMEM;
+}
+
+static int __init store_domain_ids(struct tlbi_domain *domains)
+{
+	domain_ids = kmalloc_array(domain_count, sizeof(*domain_ids),
+				   GFP_KERNEL);
+	if (!domain_ids)
+		return -ENOMEM;
+
+	for (int i = 0; i < domain_count; i++)
+		domain_ids[i] = domains[i].id;
+
+	return 0;
+}
+
+static int __init tlbi_domain_cmp(const void *a, const void *b)
+{
+	const struct tlbi_domain *d1 = a;
+	const struct tlbi_domain *d2 = b;
+
+	/* Sort domains from largest to smallest */
+	return cmp_int(cpumask_weight(d2->cpus), cpumask_weight(d1->cpus));
+}
+
+static struct tlbi_domain *__init sort_domains_by_size(struct tlbi_domain *domains)
+{
+	struct tlbi_domain *domains_sorted;
+
+	domains_sorted = kmemdup(domains, domain_count * sizeof(*domains),
+				 GFP_KERNEL);
+	if (!domains_sorted)
+		return NULL;
+
+	sort(domains_sorted, domain_count, sizeof(*domains_sorted),
+	     tlbi_domain_cmp, NULL);
+
+	return domains_sorted;
+}
+
+int __init arm64_tlbid_init(struct tlbi_domain *domains_in, int count)
+{
+	struct tlbi_domain *domains;
+	int ret;
+
+	domain_count = count;
+
+	domains = sort_domains_by_size(domains_in);
+	if (!domains)
+		return -ENOMEM;
+
+	ret = store_domain_ids(domains);
+	if (ret)
+		goto err_ids;
+
+	ret = init_cpu_domain_bitmaps(domains);
+	if (ret)
+		goto err_cpu;
+
+	static_branch_enable(&tlbid_enabled);
+
+	kfree(domains);
+	return 0;
+err_cpu:
+	kfree(domain_ids);
+err_ids:
+	kfree(domains);
+	return ret;
+}
diff --git a/drivers/acpi/arm64/tlbi.c b/drivers/acpi/arm64/tlbi.c
index 1a4b591f8f70..7fa7439a296f 100644
--- a/drivers/acpi/arm64/tlbi.c
+++ b/drivers/acpi/arm64/tlbi.c
@@ -208,4 +208,10 @@ void __init acpi_tlbi_init(void)
 		pr_err("Failed to parse ACPI table\n");
 		return;
 	}
+
+	ret = arm64_tlbid_init(domains, domain_count);
+	if (ret)
+		pr_err("Failed to initialize domains\n");
+
+	free_tlbi_domains();
 }
-- 
2.43.0


