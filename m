Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41802606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hS6oFMTs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mEQXOg8+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gHb6nvhJIAlTNV9nHwzDh8waM0q0j7+Nd6OgW1GdinE=; b=hS6oFMTsr6Pf9mFLjQN2q0HcLT
	nnf5aUPNsnT23QDyc6/nuROq4eeCSNC7RiPm8eCkxLc0NhXnS5nEPGFjSTTNVAw294KRZv+uQM8xs
	QeDg/A6Xsi6Z0AJh71jz5ktv8REfpzP6hnoEMRXoQuBZ3AlVra4FPvUSVIV62UaH5hO/cbZimpYGy
	lmGvs52W3VtvAbnNK+XG4atDaGKJBb477hm6Dh75QmLX+pY6NOgVacU8Sjgid6VZxE09rbK7ssr4+
	fJhIcmhQ3PLjUcTMu2Xd433l0M2VlRfiY6DCnIVaq+pqj9//9xuEkH8m+FxVGDTME29L75/5Mt+2N
	0yg3PgKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUmA-0000000A2Gu-2z0M;
	Thu, 12 Nov 2026 13:23:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkz-0000000A15B-3bcK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AAF81477;
	Thu, 12 Nov 2026 05:22:22 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC5C53F632;
	Thu, 12 Nov 2026 05:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489745; bh=lWPO7sbYzIBugFnZwpwZAwbEg5Wpd675jC2f9vasEyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mEQXOg8+6V94b3SbmoJaOqmDYhipRAbbo+wQRqwTbRrulwl78vKloKE7eU06OoK4Q
	 6vAHQjxqkqLCy55t9uCsaidIQ1FEGu0erj7JYiqJLqlM6BZhWei43XX281XWfBcN2w
	 lXKxZeeVs/Q/4cxOj8zNlxZHyCUAE78fywY3O2rc=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 23/39] arm64: cpufeature: Detect PE support for FEAT_NMI
Date: Thu, 12 Nov 2026 13:20:26 +0000
Message-Id: <20261112132042.129062-24-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052226_202238_94E167E3 
X-CRM114-Status: GOOD (  19.32  )
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, Mark Brown <broonie@kernel.org>, maz@kernel.org, will@kernel.org, ruanjinjie@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Use of FEAT_NMI requires that all the PEs in the system and the GIC
have NMI support. This patch implements the PE part of that detection.

In order to avoid problematic interactions between real and pseudo NMIs
we disable the architected feature if the user has enabled pseudo NMIs
on the command line. If this is done on a system where support for the
architected feature is detected then a warning is printed during boot in
order to help users spot what is likely to be a misconfiguration.

As KVM does not care about the host kernel supporting FEAT_NMI or not
to allow guests to use it, split the CPU cap in two : ARM64_HAS_NMI is
the hardware support, ARM64_NMI is the kernel making use of it.

Co-developed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/cpucaps.h    |  2 +
 arch/arm64/include/asm/cpufeature.h | 10 +++++
 arch/arm64/kernel/cpufeature.c      | 68 ++++++++++++++++++++++++++++-
 arch/arm64/tools/cpucaps            |  2 +
 4 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 0c3bfbe99aad..c1d07bc8d88d 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -77,6 +77,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
 	case ARM64_HAS_LSUI:
 		return IS_ENABLED(CONFIG_ARM64_LSUI);
+	case ARM64_NMI:
+		return IS_ENABLED(CONFIG_ARM64_NMI);
 	}
 
 	return true;
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 1c624b50b7a6..cc47a4c1d29f 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -840,6 +840,16 @@ static __always_inline bool system_uses_irq_prio_masking(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_GIC_PRIO_MASKING);
 }
 
+static __always_inline bool system_supports_nmi(void)
+{
+	return alternative_has_cap_unlikely(ARM64_HAS_NMI);
+}
+
+static __always_inline bool system_uses_nmi(void)
+{
+	return alternative_has_cap_unlikely(ARM64_NMI);
+}
+
 static inline bool system_supports_mte(void)
 {
 	return alternative_has_cap_unlikely(ARM64_MTE);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 34c5c03c0c9b..de27b92bbc44 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -83,13 +83,14 @@
 #include <asm/cpu_ops.h>
 #include <asm/fpsimd.h>
 #include <asm/hwcap.h>
+#include <asm/hypervisor.h>
 #include <asm/insn.h>
+#include <asm/interrupts/common_flags.h>
 #include <asm/kvm_host.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/mpam.h>
 #include <asm/mte.h>
-#include <asm/hypervisor.h>
 #include <asm/processor.h>
 #include <asm/smp.h>
 #include <asm/sysreg.h>
@@ -317,6 +318,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_GCS),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_GCS_SHIFT, 4, 0),
 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MTE_frac_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_NMI_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SME),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SME_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MPAM_frac_SHIFT, 4, 0),
@@ -2191,6 +2193,51 @@ static bool has_gic_prio_relaxed_sync(const struct arm64_cpu_capabilities *entry
 }
 #endif
 
+#ifdef CONFIG_ARM64_NMI
+static bool can_use_nmi(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	/*
+	 * ARM64_HAS_NMI has a lower index, and is a boot CPU
+	 * feature, so will be detected earlier.
+	 */
+	BUILD_BUG_ON(ARM64_NMI <= ARM64_HAS_NMI);
+	if (!cpus_have_cap(ARM64_HAS_NMI))
+		return false;
+
+	/*
+	 * Having both real and pseudo NMIs enabled simultaneously is
+	 * likely to cause confusion.  Since pseudo NMIs must be
+	 * enabled with an explicit command line option, if the user
+	 * has set that option on a system with real NMIs for some
+	 * reason assume they know what they're doing.
+	 *
+	 * ARM64_HAS_GIC_PRIO_MASKING has a lower index, and is a boot CPU
+	 * feature, so will be detected earlier.
+	 */
+	BUILD_BUG_ON(IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) &&
+			(ARM64_NMI <= ARM64_HAS_GIC_PRIO_MASKING));
+	if (cpus_have_cap(ARM64_HAS_GIC_PRIO_MASKING)) {
+		pr_info_once("Pseudo NMI enabled, not using architected NMI\n");
+		return false;
+	}
+
+	return true;
+}
+
+static void nmi_enable(const struct arm64_cpu_capabilities *__unused)
+{
+	/*
+	 * Enable use of NMIs controlled by ALLINT, SPINTMASK should
+	 * be clear by default but make it explicit that we are using
+	 * this mode.  Ensure that ALLINT is clear first in order to
+	 * avoid leaving things masked.
+	 */
+	_allint_clear();
+	sysreg_clear_set(sctlr_el1, SCTLR_EL1_SPINTMASK, SCTLR_EL1_NMI);
+	isb();
+}
+#endif
+
 static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
 				 int scope)
 {
@@ -3083,6 +3130,25 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64ISAR3_EL1, LSUI, IMP)
 	},
+#endif
+	{
+		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
+		.capability = ARM64_HAS_NMI,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, NMI, IMP)
+	},
+#ifdef CONFIG_ARM64_NMI
+	/*
+	 * Depends on ARM64_HAS_NMI
+	 * Checks for conflict with pseudo-NMIs, giving them priority.
+	 */
+	{
+		.desc = "Non-maskable Interrupts",
+		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
+		.capability = ARM64_NMI,
+		.matches = can_use_nmi,
+		.cpu_enable = nmi_enable,
+	},
 #endif
 	{},
 };
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 20cc185649f9..cf26c450b8d9 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -52,6 +52,7 @@ HAS_LS64_V
 HAS_LSUI
 HAS_MOPS
 HAS_NESTED_VIRT
+HAS_NMI
 HAS_NV2P1
 HAS_NV3
 HAS_PAN
@@ -82,6 +83,7 @@ MTE
 MTE_ASYMM
 MTE_FAR
 MTE_STORE_ONLY
+NMI
 SME
 SME_FA64
 SME2
-- 
2.34.1


