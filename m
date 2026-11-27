Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300D8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v051j6wm;
	dkim=pass (2048-bit key, unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=tW6r8OYi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LncpIWG6iTepcF/WKfjkr7sRjr1uPyZNvnirgUbb4J0=; b=v051j6wmaYLBLU
	wgnuLd92LOGrBFSLa+ANIG7Xn8CYvR1GK7zu+ku0v301SlfHjtRxCZCr9njQkOwcRxeclprmuYxBJ
	ztcZnPV9VgMOFtO0rDDnIH/iTDKWD3kJIOT6LWr6G17vZnFrBqE1mJoZGJmtRFnfsbxNToJ1zsX4i
	ERf3vMEw4aZaYG1IZdoXd42OXAr12f1tGv7taD/h2dd+j5HcjA/LL1YAEok+sPuUdZM+VhU0ziQMo
	JKtNSbjsY2mAadyvBXumCxPVhoakij4cQisZVD3j72KrjJglLB2D2C0XY+hbLahHC91rj1yF+J5fh
	uijGbzxmZ5bHvRcsZWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWoet-0000000EyXZ-1LNw;
	Fri, 27 Nov 2026 05:38:07 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWoea-0000000EyKG-3GGx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 05:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1795757868; x=1827293868;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Q8c8VlFPRQHMx0oQxdd88FZY+/L6JFZnz3WaEVSHBC4=;
  b=tW6r8OYimzqb4WDQz7m9msKQ2CWjqKTKXom4Jea60wKxlHcdyEG5QQWo
   3tE47Zf76i8LS8XrDolNnwMJ/V+KRpJ6pOQfhQmanff5fJKi6vNy9QbWg
   upJz6OrIF2t6nZQfvdaaa+49lJIOJecBrmp4gBx6J5Gj0z4mp721rDiTk
   iX1dJ3p2uugW3EeuJqEv2IpH5i25H4acGw+YxMJ4jJx/khMXzyRc74rZ2
   a7t/Sb+SNcYGQQzWLvxI/CLg8MYjG0PJz8yhO3UVKFdnqs3hIwsBfEA8I
   OWjp1N6ej2SnkQ+pKhwXpOaBvRLw7eIF8o4Lv3JORaei8iDDeyvAGGBpD
   A==;
X-CSE-ConnectionGUID: s2cVtOYkRTC6N3qmboYXvA==
X-CSE-MsgGUID: qbdr46+QS2qCWYgA8WCt0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="263301740"
X-IronPort-AV: E=Sophos;i="6.27,236,1786978800"; 
   d="scan'208";a="263301740"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 14:37:46 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A845BC0182B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 05:37:46 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5D8A3180008C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 05:37:46 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id EBED640262B;
	Fri, 27 Nov 2026 05:37:38 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Date: Fri, 27 Nov 2026 14:36:34 +0900
Subject: [PATCH v4 5/5] arm64: Add workaround to replace WFE with NOP for
 FUJITSU-MONAKA Erratum E#030004
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-monaka-fix-for-upstream-v4-5-3395c415bbe4@fujitsu.com>
References: <20261127-monaka-fix-for-upstream-v4-0-3395c415bbe4@fujitsu.com>
In-Reply-To: <20261127-monaka-fix-for-upstream-v4-0-3395c415bbe4@fujitsu.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795757822; l=8485;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=Q8c8VlFPRQHMx0oQxdd88FZY+/L6JFZnz3WaEVSHBC4=;
 b=7ohupvYzWh/aKgkXhbtT6oYS0fqFTYylJomYHNhrUB3GRp+uywsHnGmypBxxw1AtwZYl1KwCG
 fYQQjA5ZfSgAVWWRFAvO0I3Gk3Aib0PlmAkT9jFKrmgKZkCAcPxgIsJ
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_213749_136084_2FAE47BA 
X-CRM114-Status: GOOD (  23.48  )
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

This option adds a workaround for FUJITSU-MONAKA erratum E#030004.

On affected CPUs, if a wake-up event generated by clearing the
global exclusive monitor or by a SEV instruction arrives in the
same cycle as a WFE instruction commits, the CPU may fail to
advance the program counter and re-execute the same WFE
instruction. If no further wake-up event occurs, the CPU may
remain waiting indefinitely (for example, in spinlock code).
This may cause a system hang before the generic timer event stream
is enabled. WFI, WFIT, and WFET instructions are not affected.

After the event stream is enabled (shortly after the secondary CPU
bring-up), event stream could wake up affected cores.
However, in order to prevent the condition during secondary CPU
bring-up, the workaround replaces all WFE instructions in host kernel
code with NOP using the boot alternative framework before the secondary
CPU bring-up on the MONAKA CPU.

Note that there is no need to take care of WFE usage in Host EL0 and
VHE Guest since if event stream is enabled in Host EL2, the event
reaches to every ELx & world. This effectively means FUJITSU-MONAKA
does not guarantee disabling event stream
(clocksource.arm_arch_timer.evtstrm=0) nor running nVHE guests
(kvm-arm.mode=nvhe/protected), although these configurations
are not rejected by this patch.

This only affects FUJITSU-MONAKA CPUs.

Signed-off-by: Tomohiro Misono <misono.tomohiro@fujitsu.com>

---
Changes in v4:
 - Remove assisted-by: LLM tag as I understand it is not needed.
   No code change
Changes in v3:
 - New patch
 - Note that wfe instruction used in nVHE spinlock code is
   not updated since nVHE is out of scope of this patch as the
   above commit message explains
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 22 ++++++++++++++++++++++
 arch/arm64/include/asm/assembler.h          |  4 ++++
 arch/arm64/include/asm/barrier.h            |  3 ++-
 arch/arm64/include/asm/cmpxchg.h            |  4 ++--
 arch/arm64/include/asm/cpucaps.h            |  2 ++
 arch/arm64/kernel/cpu_errata.c              | 18 ++++++++++++++++++
 arch/arm64/tools/cpucaps                    |  1 +
 8 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index e6bbc54208b1..8cf25857c617 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -405,6 +405,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Fujitsu        | MONAKA GICv3/v4 | E#030003        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
+| Fujitsu        | MONAKA          | E#030004        | FUJITSU_ERRATUM_030004      |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | ASR            | ASR8601         | #8601001        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 2f195da6dd1c..6fa2d728eff8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1420,6 +1420,28 @@ config FUJITSU_ERRATUM_030002
 
 	  If unsure, say Y.
 
+config FUJITSU_ERRATUM_030004
+	bool "FUJITSU-MONAKA erratum E#030004: CPU may hang when executing WFE"
+	default y
+	help
+	  This option adds a workaround for FUJITSU-MONAKA erratum E#030004.
+	  On affected CPUs, if a wake-up event generated by clearing the
+	  global exclusive monitor or by a SEV instruction arrives in the
+	  same cycle as a WFE instruction commits, the CPU may fail to
+	  advance the program counter and re-execute the same WFE
+	  instruction. If no further wake-up event occurs, the CPU may
+	  remain waiting indefinitely (for example, in spinlock code).
+	  This may cause a system hang before the generic timer event stream
+	  is enabled. WFI, WFIT, and WFET instructions are not affected.
+
+	  The workaround replaces host WFE instructions in arm64 code with
+	  NOP using the boot alternative framework before the secondary
+	  CPU bring-up on the MONAKA CPU.
+
+	  The workaround only affects the FUJITSU-MONAKA.
+
+	  If unsure, say Y.
+
 config HISILICON_ERRATUM_161600802
 	bool "Hip07 161600802: Erroneous redistributor VLPI base"
 	default y
diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 020670814bda..a83db010a88e 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -69,6 +69,10 @@
 9990:
 	.endm
 
+	.macro	wfe
+alternative_insn "hint #2", nop, ARM64_WORKAROUND_FUJITSU_030004
+	.endm
+
 /*
  * RAS Error Synchronization barrier
  */
diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
index 9495c4441a46..28598d441c10 100644
--- a/arch/arm64/include/asm/barrier.h
+++ b/arch/arm64/include/asm/barrier.h
@@ -17,7 +17,8 @@
 #define nops(n)		asm volatile(__nops(n))
 
 #define sev()		asm volatile("sev" : : : "memory")
-#define wfe()		asm volatile("wfe" : : : "memory")
+#define ARM64_WFE_INSN	ALTERNATIVE("wfe", "nop", ARM64_WORKAROUND_FUJITSU_030004)
+#define wfe()		asm volatile(ARM64_WFE_INSN : : : "memory")
 #define wfet(val)	asm volatile("msr s0_3_c1_c0_0, %0"	\
 				     : : "r" (val) : "memory")
 #define wfi()		asm volatile("wfi" : : : "memory")
diff --git a/arch/arm64/include/asm/cmpxchg.h b/arch/arm64/include/asm/cmpxchg.h
index 6cf3cd6873f5..afedf2788469 100644
--- a/arch/arm64/include/asm/cmpxchg.h
+++ b/arch/arm64/include/asm/cmpxchg.h
@@ -218,11 +218,11 @@ static inline void __cmpwait_case_##sz(volatile void *ptr,		\
 									\
 	asm volatile(							\
 	"	sevl\n"							\
-	"	wfe\n"							\
+	ARM64_WFE_INSN "\n"						\
 	"	ldxr" #sfx "\t%" #w "[tmp], %[v]\n"			\
 	"	eor	%" #w "[tmp], %" #w "[tmp], %" #w "[val]\n"	\
 	"	cbnz	%" #w "[tmp], 1f\n"				\
-	"	wfe\n"							\
+	ARM64_WFE_INSN "\n"						\
 	"1:"								\
 	: [tmp] "=&r" (tmp), [v] "+Q" (*(u##sz *)ptr)			\
 	: [val] "r" (val));						\
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index f4aa6bd257c5..cc6b8f2270e1 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -72,6 +72,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_FUJITSU_ERRATUM_030001);
 	case ARM64_WORKAROUND_FUJITSU_030002:
 		return IS_ENABLED(CONFIG_FUJITSU_ERRATUM_030002);
+	case ARM64_WORKAROUND_FUJITSU_030004:
+		return IS_ENABLED(CONFIG_FUJITSU_ERRATUM_030004);
 	case ARM64_MPAM:
 		/*
 		 * KVM MPAM support doesn't rely on the host kernel supporting MPAM.
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 37bbe8268499..2a91292b6329 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -723,6 +723,15 @@ static const struct midr_range cnp_erratum_cpus[] = {
 };
 #endif
 
+#ifdef CONFIG_FUJITSU_ERRATUM_030004
+static bool
+has_fujitsu_monaka_erratum_030004(const struct arm64_cpu_capabilities *entry,
+				  int __unused)
+{
+	return is_midr_in_range(&entry->midr_range);
+}
+#endif
+
 const struct arm64_cpu_capabilities arm64_errata[] = {
 #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
 	{
@@ -1109,6 +1118,15 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.capability = ARM64_WORKAROUND_FUJITSU_030002,
 		ERRATA_MIDR_ALL_VERSIONS(MIDR_FUJITSU_MONAKA),
 	},
+#endif
+#ifdef CONFIG_FUJITSU_ERRATUM_030004
+	{
+		.desc = "FUJITSU-MONAKA Erratum E#030004",
+		.capability = ARM64_WORKAROUND_FUJITSU_030004,
+		.type = ARM64_CPUCAP_SCOPE_BOOT_CPU,
+		.matches = has_fujitsu_monaka_erratum_030004,
+		.midr_range = MIDR_ALL_VERSIONS(MIDR_FUJITSU_MONAKA),
+	},
 #endif
 	{
 		.desc = "Known broken GICv3 SEIS implementation",
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 73a4aeb535a0..4d97f20aad07 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -136,3 +136,4 @@ WORKAROUND_BROKEN_AMU_CONSTCNT
 WORKAROUND_BROKEN_AMU_CORECNT
 WORKAROUND_FUJITSU_030001
 WORKAROUND_FUJITSU_030002
+WORKAROUND_FUJITSU_030004

-- 
2.43.0


