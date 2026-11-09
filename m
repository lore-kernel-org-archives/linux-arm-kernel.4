Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58E606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0p4KPaNv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N35wPGsJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KskkUGty1iNE6UcXC+HDPavjLCWymN3yFFfBa9g833A=; b=0p4KPaNvtVWkQe
	KvI3ddu4Of741z/uZNTkYd7R+n6gDGvSuB8BARv0sUpT1cxvH02NaOWaZzISeTdLFV1epScqCsIB0
	IADqJvmBW6nSB2ekUdF05GO3bVgjwCF6STPOErxxeOiPPKMuYDYc9ZmOUImOsUF5aDKuuqBINKwrY
	swBucCmQHLkOa+6WuJlnfupwsfdlUadpuvYMuhhpoJXnR/+/442HZ7a9G27iMRbpqn+xRXZxNmp1+
	YP6g7pRQxwQnPeh4xX9V0mFwK0aQyYNEuPg8HUy03xgGpx8f9ne77TosHouI9qN83pygOHFJVQOop
	K39S8zNB3Ed3YYrLv00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO7m-00000000c2Q-30T0;
	Mon, 09 Nov 2026 12:05:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO7l-00000000c1y-0Osq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:05:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7166763175;
	Mon,  9 Nov 2026 12:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C9E1F008A3;
	Mon,  9 Nov 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225920;
	bh=KskkUGty1iNE6UcXC+HDPavjLCWymN3yFFfBa9g833A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N35wPGsJeoWxIpoO2dJegT1A+/siw7F+lbw9O6kSfXRd8gTt3+YU2u7TBAAugmZZ4
	 EpzNTiU1BYgnv1CkT4VxnMEuENCH/Xqm1/ZffZGSzbHea/e3a2QxXTt7/L7o88CHR8
	 F7eH0ry+5GU2+UESUSIAmxBfG7gGLwwfd7eFKSmTbKZuZSNRCwLZTJ7GCW4Sj2zsv4
	 b4sTpXn1ihwfIArihA+4swEoa1Kabiirwa/SRtMXCHZwuJX46cL1d3a9lTgpHuZxPg
	 P8fNaPHNMnaZPhLsQEwJPkbRZFsjM7RD4CQ/QsStaCRpJmKK2aHLJWSHULGvVdzRUJ
	 G5dPd1AnGBTXg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH v2 2/6] arm64: entry: Always inline helpers used by non-instrumentable paths
Date: Mon,  9 Nov 2026 19:44:55 +0800
Message-ID: <20261109114500.20298-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109114500.20298-1-jszhang@kernel.org>
References: <20261109114500.20298-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The noinstr entry and exit paths call MTE and SME helpers, CPU feature
checks, and the architecture-specific rescheduling check. Several of
these helpers use plain inline, which permits the compiler to emit
instrumentable out-of-line copies.

A GCC build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y emitted
mte_disable_tco_entry(), sme_enter_from_user_mode() and
sme_exit_to_user_mode() in .text.

Use __always_inline for these helpers and their nested feature checks
so they inherit the instrumentation restrictions of their callers

Also update sme_enter_from_user_mode() and sme_exit_to_user_mode() to
use tif_test_bit(TIF_SME) instead of test_thread_flag(TIF_SME)

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/arm64/include/asm/cpufeature.h   |  8 ++++----
 arch/arm64/include/asm/entry-common.h |  2 +-
 arch/arm64/include/asm/fpsimd.h       |  8 ++++----
 arch/arm64/include/asm/mte-kasan.h    |  4 ++--
 arch/arm64/include/asm/mte.h          | 10 +++++-----
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e3c8a1493dc8..c62949693b92 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -774,7 +774,7 @@ static __always_inline bool system_supports_fpsimd(void)
 	return alternative_has_cap_likely(ARM64_HAS_FPSIMD);
 }
 
-static inline bool system_uses_hw_pan(void)
+static __always_inline bool system_uses_hw_pan(void)
 {
 	return alternative_has_cap_unlikely(ARM64_HAS_PAN);
 }
@@ -840,12 +840,12 @@ static __always_inline bool system_uses_irq_prio_masking(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_GIC_PRIO_MASKING);
 }
 
-static inline bool system_supports_mte(void)
+static __always_inline bool system_supports_mte(void)
 {
 	return alternative_has_cap_unlikely(ARM64_MTE);
 }
 
-static inline bool system_has_prio_mask_debugging(void)
+static __always_inline bool system_has_prio_mask_debugging(void)
 {
 	return IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING) &&
 	       system_uses_irq_prio_masking();
@@ -950,7 +950,7 @@ static inline bool cpu_has_hw_af(void)
 						ID_AA64MMFR1_EL1_HAFDBS_SHIFT);
 }
 
-static inline bool cpu_has_pan(void)
+static __always_inline bool cpu_has_pan(void)
 {
 	u64 mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
 	return cpuid_feature_extract_unsigned_field(mmfr1,
diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
index 1905765159aa..4856bc453c01 100644
--- a/arch/arm64/include/asm/entry-common.h
+++ b/arch/arm64/include/asm/entry-common.h
@@ -27,7 +27,7 @@ static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
 
 #define arch_exit_to_user_mode_work arch_exit_to_user_mode_work
 
-static inline bool arch_irqentry_exit_need_resched(void)
+static __always_inline bool arch_irqentry_exit_need_resched(void)
 {
 	/*
 	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index a67d5774e672..e7c881c1c1f7 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -749,17 +749,17 @@ void sme_enable_dvmsync(void);
 void sme_set_active(void);
 void sme_clear_active(void);
 
-static inline void sme_enter_from_user_mode(void)
+static __always_inline void sme_enter_from_user_mode(void)
 {
 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
-	    test_thread_flag(TIF_SME))
+	    tif_test_bit(TIF_SME))
 		sme_clear_active();
 }
 
-static inline void sme_exit_to_user_mode(void)
+static __always_inline void sme_exit_to_user_mode(void)
 {
 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
-	    test_thread_flag(TIF_SME))
+	    tif_test_bit(TIF_SME))
 		sme_set_active();
 }
 
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mte-kasan.h
index de910f1c19e1..cc2151325eb0 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -18,14 +18,14 @@
 /* Whether the MTE asynchronous mode is enabled. */
 DECLARE_STATIC_KEY_FALSE(mte_async_or_asymm_mode);
 
-static inline bool system_uses_mte_async_or_asymm_mode(void)
+static __always_inline bool system_uses_mte_async_or_asymm_mode(void)
 {
 	return static_branch_unlikely(&mte_async_or_asymm_mode);
 }
 
 #else /* CONFIG_KASAN_HW_TAGS */
 
-static inline bool system_uses_mte_async_or_asymm_mode(void)
+static __always_inline bool system_uses_mte_async_or_asymm_mode(void)
 {
 	return false;
 }
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 83f3b05fc784..de71d3449064 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -222,7 +222,7 @@ static inline bool folio_try_hugetlb_mte_tagging(struct folio *folio)
 }
 #endif
 
-static inline void mte_disable_tco_entry(struct task_struct *task)
+static __always_inline void mte_disable_tco_entry(struct task_struct *task)
 {
 	if (!system_supports_mte())
 		return;
@@ -245,7 +245,7 @@ static inline void mte_disable_tco_entry(struct task_struct *task)
 #ifdef CONFIG_KASAN_HW_TAGS
 void mte_check_tfsr_el1(void);
 
-static inline void mte_check_tfsr_entry(void)
+static __always_inline void mte_check_tfsr_entry(void)
 {
 	if (!kasan_hw_tags_enabled())
 		return;
@@ -256,7 +256,7 @@ static inline void mte_check_tfsr_entry(void)
 	mte_check_tfsr_el1();
 }
 
-static inline void mte_check_tfsr_exit(void)
+static __always_inline void mte_check_tfsr_exit(void)
 {
 	if (!kasan_hw_tags_enabled())
 		return;
@@ -278,10 +278,10 @@ static inline void mte_check_tfsr_exit(void)
 static inline void mte_check_tfsr_el1(void)
 {
 }
-static inline void mte_check_tfsr_entry(void)
+static __always_inline void mte_check_tfsr_entry(void)
 {
 }
-static inline void mte_check_tfsr_exit(void)
+static __always_inline void mte_check_tfsr_exit(void)
 {
 }
 #endif /* CONFIG_KASAN_HW_TAGS */
-- 
2.55.0


