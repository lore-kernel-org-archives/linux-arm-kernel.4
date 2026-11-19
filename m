Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A78C60A260B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0qHFwpdS;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=Ezr+Xr5o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VQ/IR4gfjs4ztpghZWkr3QrsQftFY6FdwIRRKdzCS/0=; b=0qHFwpdSBY49If
	N6MzKPdlNKXWneyIEfDyESfhfzZv75EzgkU1Hk7773qVCYaezFB5eHM2Ka2Vhqim1kH0NLJwAVFZS
	vVZZV2hidaQbm/9AlFuLVmrkFAuVCzv3SvDXE2fyMj/YdaCV/HyXZmIUMG7X3mKeOX35gLoJ41Brx
	kxWNEVcdCXjeiZCSe4sjIJXNtjkx49TE8bniRJ9QckkfQuc9gLuGitaJRI9Ka+a2YeYWTruX/MRR/
	GlFeam2AgpR/ZLg5EyOGvFRZSU/KnPRTnzCfvQmd9y3XXcSFrvh7zsvXzv+GaG5nZRZ3RpUHB7rNY
	XXkpMMKQD5uoOV7CkUzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy51-0000000BL3U-3hb9;
	Thu, 19 Nov 2026 09:05:19 +0000
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy4z-0000000BL1F-3OJJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1795079117; x=1826615117;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=GNyLIrBeNfaWtsqx3sAkJwBbPb77cM5V2dmBCm/TUjQ=;
  b=Ezr+Xr5oM7wYrLAMpMNuQE+k7vY5FSRDhayuHHsxCK7E0pJLY4DZ3ZgG
   1pRXIgZP18OH/ZpUupuZv5atSif558acRDNcuvLn5Lm9Wg7//f2c87djF
   01nQqHdrSebr2BtYcPswAI9V2wOXjqNzaQESg22Ojw6ZtNJdflzfxMSu5
   K/P8c3gHK1rHDcx+Ja1QYZ0KwIw04ab170hU90ocqI8Ely3ucCMmhNp1L
   wZrFsiRM8+Y+WZs9HR022V89/GPotYagviEMVU7MzL+GnpriuQV0jnAcN
   btxwF+i4XKmKiVgj9zcPjuqvqjQjlm79FIFfxzO0bs+qbRAE/rkgzZeEH
   Q==;
X-CSE-ConnectionGUID: QobvU1rgR5Gb7NeekcSb9A==
X-CSE-MsgGUID: 1gPjErN4Q8e9ObYAtyy/PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="262307349"
X-IronPort-AV: E=Sophos;i="6.27,220,1786978800"; 
   d="scan'208";a="262307349"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:05:16 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E36B0C0DE7A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:05:15 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 95B2B140037D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:05:15 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 09F74100116B;
	Thu, 19 Nov 2026 09:05:07 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Date: Thu, 19 Nov 2026 18:04:34 +0900
Subject: [PATCH v3 2/5] arm64: tlb: Add tlbi workaround for FUJITSU-MONAKA
 Erratum E#030001
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-monaka-fix-for-upstream-v3-2-057df4d2ca3c@fujitsu.com>
References: <20261119-monaka-fix-for-upstream-v3-0-057df4d2ca3c@fujitsu.com>
In-Reply-To: <20261119-monaka-fix-for-upstream-v3-0-057df4d2ca3c@fujitsu.com>
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Kohei Enju <enju.kohei@fujitsu.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795079092; l=6576;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=GNyLIrBeNfaWtsqx3sAkJwBbPb77cM5V2dmBCm/TUjQ=;
 b=cDc5mEfbJ/poB4Qc+ue4ZDq1y/fix+JN8FiC5kWDlkT4FZyXC04/K2lf/xSLWW7O18IE2WQpW
 be92IHsLalZA4wr2oxVrXlHfQgYp1FWLDFYZcxHqOYFks7GkuJcYTwi
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_010518_146645_F7F2B567 
X-CRM114-Status: GOOD (  19.95  )
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

FUJITSU-MONAKA Erratum E#030001 affects FUJITSU-MONAKA CPU
when using TLBI range operations.

On affected FUJITSU-MONAKA CPUs, range-based TLBI operations
targeting a VA or IPA may fail to invalidate TLB entries when
addr[34:29] == all 1 && addr[28:0] == 0 for 512MB mappings.
The affected instructions are:
  RVA[L]E{1,2,3}*, RVAA[L]E1*, and RIPAS2[L]E1*.

Work around the erratum by disabling TLB range operations on
both host and guest.

Signed-off-by: Tomohiro Misono <misono.tomohiro@fujitsu.com>

---
Changes in v3:
 - rework patch to disable TLB range operations on both host and guest
 - use ERRATA_MIDR_ALL_VERSIONS macro
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 18 ++++++++++++++++++
 arch/arm64/include/asm/cpucaps.h            |  2 ++
 arch/arm64/kernel/cpu_errata.c              |  7 +++++++
 arch/arm64/kernel/cpufeature.c              | 11 ++++++++++-
 arch/arm64/kvm/sys_regs.c                   |  8 ++++++++
 arch/arm64/tools/cpucaps                    |  1 +
 7 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index dc4144ac895b..bd9ac993495b 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -393,6 +393,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Fujitsu        | A64FX           | E#010001        | FUJITSU_ERRATUM_010001      |
 +----------------+-----------------+-----------------+-----------------------------+
+| Fujitsu        | MONAKA          | E#030001        | FUJITSU_ERRATUM_030001      |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | ASR            | ASR8601         | #8601001        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9b08b2457a55..8a0c94a0c879 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1384,6 +1384,24 @@ config FUJITSU_ERRATUM_010001
 
 	  If unsure, say Y.
 
+config FUJITSU_ERRATUM_030001
+	bool "FUJITSU-MONAKA erratum E#030001: Range TLBI may fail to invalidate some entries"
+	default y
+	help
+	  This option adds a workaround for FUJITSU-MONAKA erratum E#030001.
+	  On affected FUJITSU-MONAKA CPUs, range-based TLBI operation
+	  targeting a VA or IPA may fail to invalidate some TLB entries
+	  when hugepage is used in a certain condition. The affected
+	  instructions are RVA[L]E{1,2,3}*, RVAA[L]E1*, and RIPAS2[L]E1*
+	  and this affects on both S1 and S2 tables.
+
+	  Work around the erratum by disabling TLB range operations on both
+	  host and guest.
+
+	  The erratum only affects the FUJITSU-MONAKA.
+
+	  If unsure, say Y.
+
 config HISILICON_ERRATUM_161600802
 	bool "Hip07 161600802: Erroneous redistributor VLPI base"
 	default y
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 0c3bfbe99aad..7c73a739eee1 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -68,6 +68,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_ARM64_ERRATUM_4193714);
 	case ARM64_WORKAROUND_NXP_ERR050104:
 		return IS_ENABLED(CONFIG_NXP_IMX8QM_ERRATUM_ERR050104);
+	case ARM64_WORKAROUND_FUJITSU_030001:
+		return IS_ENABLED(CONFIG_FUJITSU_ERRATUM_030001);
 	case ARM64_MPAM:
 		/*
 		 * KVM MPAM support doesn't rely on the host kernel supporting MPAM.
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index ca31d33152e9..c8a0ea73ec1a 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -1096,6 +1096,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.matches = has_impdef_pmuv3,
 		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
 	},
+#ifdef CONFIG_FUJITSU_ERRATUM_030001
+	{
+		.desc = "FUJITSU-MONAKA Erratum E#030001",
+		.capability = ARM64_WORKAROUND_FUJITSU_030001,
+		ERRATA_MIDR_ALL_VERSIONS(MIDR_FUJITSU_MONAKA),
+	},
+#endif
 	{
 		.desc = "Known broken GICv3 SEIS implementation",
 		.capability = ARM64_WORKAROUND_GICv3_BROKEN_SEIS,
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c9c9a6889455..097d283169a0 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1662,6 +1662,15 @@ static bool has_cache_dic(const struct arm64_cpu_capabilities *entry,
 	return ctr & BIT(CTR_EL0_DIC_SHIFT);
 }
 
+static bool has_tlb_range(const struct arm64_cpu_capabilities *entry,
+			  int scope)
+{
+	if (cpus_have_cap(ARM64_WORKAROUND_FUJITSU_030001))
+		return false;
+
+	return has_cpuid_feature(entry, scope);
+}
+
 static bool __maybe_unused
 has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
 {
@@ -2638,7 +2647,7 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.desc = "TLB range maintenance instructions",
 		.capability = ARM64_HAS_TLB_RANGE,
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
-		.matches = has_cpuid_feature,
+		.matches = has_tlb_range,
 		ARM64_CPUID_FIELDS(ID_AA64ISAR0_EL1, TLB, RANGE)
 	},
 #ifdef CONFIG_ARM64_HW_AFDBM
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c7d91138a6d4..2e8965b7702e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1949,6 +1949,14 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 	case SYS_ID_AA64PFR2_EL1:
 		val = sanitise_id_aa64pfr2_el1(vcpu, val);
 		break;
+	case SYS_ID_AA64ISAR0_EL1:
+		if (cpus_have_final_cap(ARM64_WORKAROUND_FUJITSU_030001)) {
+			/* disable TLBI range operatoins on guest */
+			val &= ~ID_AA64ISAR0_EL1_TLB_MASK;
+			val |= SYS_FIELD_PREP(ID_AA64ISAR0_EL1, TLB,
+				ID_AA64ISAR0_EL1_TLB_OS);
+		}
+		break;
 	case SYS_ID_AA64ISAR1_EL1:
 		if (!vcpu_has_ptrauth(vcpu))
 			val &= ~(ID_AA64ISAR1_EL1_APA |
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 3125695122a0..1a199502614d 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -134,3 +134,4 @@ WORKAROUND_SPECULATIVE_SSBS
 WORKAROUND_SPECULATIVE_UNPRIV_LOAD
 WORKAROUND_BROKEN_AMU_CONSTCNT
 WORKAROUND_BROKEN_AMU_CORECNT
+WORKAROUND_FUJITSU_030001

-- 
2.43.0


