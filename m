Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7866606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=slPvg9ni;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Xa69qGdO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O52PwFsmFhWi7FdfI+zo2ZB5WyY21jdKJ3YIMBIbqbU=; b=slPvg9niT1wFmeOHJX3p+A/WBA
	+/UTHdP5B+jWf2/GSpLwOxq7DYoZ+0O3+RQxrc30p/WVsHhYQJ3DvSVaddYRh1NmiIBIc2IN0v1Q1
	LtLxmpJt/NziX12c7/czCjn7kInNINyyyfl/N96JT8te7Qv5h/MtyLZSDpNfcj3IPEg8m0FdQd97K
	Dan0HXArlgUaDEEtcVY70XV1dtJXhNadVJQCUl4ho0xNsOEjA8LG+EFdb8wYY3aC5nCqd+EHO3TcN
	onO57pNZUgj4wM520j0M7oUczHqsxkhNnpSwgMsfkfFMcIG7FSTYCPrw9RUOxaCQGx46Vg38rGR1V
	UfUsq9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiUM-0000000EvgF-2rrj;
	Sat, 07 Nov 2026 15:37:54 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU4-0000000Ev7u-2Mwm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:38 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c41f85ee4a3so155551266b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065854; x=1794670654; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O52PwFsmFhWi7FdfI+zo2ZB5WyY21jdKJ3YIMBIbqbU=;
        b=Xa69qGdOhrNFTkWHPE1XoSyHN1AfVBXcLAHHPCn8U4PD/qMUU3gM4O4lZXF3fjXO8H
         GC1H/85Ge0wvMXzUbSnWI0ZJBnGRTgb9aCWYYUfCd9cn8rqYz3M1YLaK4OG9D90ITi8X
         SknPsvTfj7ZWxnkTv1fCVVRlQNq+69KgxkmTQXVXWKXoyHTEqTCEuHTVL1xtB2/QNLQ1
         yvoOOtAoqA00E57yHYpm5LfYAupzeae74JGqlkOlt61NvOkdAVVgdrLk5j+X6VnhlK0o
         1rJDo0Hi5GWvnzS7eBc4nF3I2KKqKV89d3SDSXo8E8nhm4axfDZYpKmBRKINZKbbFGQ5
         jw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065854; x=1794670654;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O52PwFsmFhWi7FdfI+zo2ZB5WyY21jdKJ3YIMBIbqbU=;
        b=nB2ncVOF8JeNQHHl1O1gNeVy7bbofYi70VFh9Hj60muGuqgYbNt/T7SqfpYWfwUmC3
         HprxenkxivBRlcsPXZv75DgYxLqUaR0DDmkhTZIuESZQ2i3A5MvxL1+8Ui3FBkS79j8B
         C2R8Db2/uPGZTLVZVOR4asno/VXio/zLUYnGQWIKCo6pjxPTvaydJLXCK5v8tc/ckey5
         ZZGw4fp9U+JzyWtMeaVoF1v+BsmYpF6VKDSdlIZxONh6EIMmHvxaxcj789+SRYjzBln4
         u3hgNApRfneB0bRTc6BVYLJf6yqS9fejb+W5h2PNaZCM9yHgsR49XsuMjNBRbzrhWlZX
         uUTg==
X-Forwarded-Encrypted: i=1; AL+hErGmjKCHJDA6BfJceOxhFoxhT0Sel0Zx0Q9W3qQGRgksRItBUJ5Awj332+QqCWDg8fB/Qzl62YUqRPR1eUhNoeAV@lists.infradead.org
X-Gm-Message-State: APuU4Z8P5uNF2ec20nn5jdoKnJ26gMsgRWhpa7CO1hdEMXBl3Ts775Kd
	r2eopwxLwAAg3cAd7dzaQbGDIeveBzm2wgZzXUvrTqdyiKAgflZgYNY1gY/JsQdzEnvDApj4VQh
	PZA==
X-Received: from ejblg2.prod.google.com ([2002:a17:906:f882:b0:c31:97e0:f2cc])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:97c7:b0:c4c:ddd1:d006
 with SMTP id a640c23a62f3a-c4d34c3e908mr432353866b.38.1794065853944; Sat, 07
 Nov 2026 07:37:33 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:25 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-19-d84ea5f30f94@google.com>
Subject: [PATCH 19/24] arm64: Rework static branches for kernel MTE
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073736_687836_19E2FDC8 
X-CRM114-Status: GOOD (  24.26  )
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
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rename system_uses_mte_async_or_asymm_mode() to the more concise
system_uses_async_mte_faults(), which better reflects the intention, and
relocate it from <asm/mte-kasan.h> to <asm/mte.h> as it reflects the
state of MTE, not KASAN. This removes <asm/mte-kasan.h> from <asm/mte.h>
and further progresses our untangling of the features.

Introduce the all-encompassing system_uses_mte(), tracking when any mode
of MTE is used by the kernel (mimicking <asm/cpufeature.h>) and use it
in place of KASAN functions, when the intention was to check MTE state.

For now, leave the mte_enable_kernel_*() unchanged even though they
clearly don't support arbitrary successive transitions, as commented in
mte_enable_kernel_{async,asymm}(). Once we want to clean that up, note
that the TCF bits map cleanly to the static branches:

        TCF[0]  <-->  mte_sync_or_asymm_mode
        TCF[1]  <-->  mte_async_or_asymm_mode

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h      | 19 -------------------
 arch/arm64/include/asm/mte.h            | 32 +++++++++++++++++++++++++++++=
++-
 arch/arm64/include/asm/uaccess.h        |  9 ++++-----
 arch/arm64/include/asm/word-at-a-time.h |  4 ++--
 arch/arm64/kernel/entry-common.c        | 10 +++++-----
 arch/arm64/kernel/mte.c                 | 26 +++++++++++++++++---------
 6 files changed, 59 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 24d5d9d6d04b..9d018d3a0b3b 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -47,25 +47,6 @@ static __always_inline u8 kasan_tag_from_mte(u8 tag)
 	return u8_replace_bits(KASAN_TAG_MIN, tag, KASAN_TAG_MTE_MASK);
 }
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-
-/* Whether the MTE asynchronous mode is enabled. */
-DECLARE_STATIC_KEY_FALSE(mte_async_or_asymm_mode);
-
-static inline bool system_uses_mte_async_or_asymm_mode(void)
-{
-	return static_branch_unlikely(&mte_async_or_asymm_mode);
-}
-
-#else /* CONFIG_KASAN_HW_TAGS */
-
-static inline bool system_uses_mte_async_or_asymm_mode(void)
-{
-	return false;
-}
-
-#endif /* CONFIG_KASAN_HW_TAGS */
-
 #ifdef CONFIG_ARM64_MTE
=20
 /*
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 1e20a43c0a67..8826d64c8e33 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -7,13 +7,13 @@
=20
 #include <asm/compiler.h>
 #include <asm/mte-def.h>
-#include <asm/mte-kasan.h>
=20
 #ifndef __ASSEMBLER__
=20
 #include <linux/bitfield.h>
 #include <linux/page-flags.h>
 #include <linux/sched.h>
+#include <linux/static_key.h>
 #include <linux/types.h>
=20
 #include <asm/barrier.h>
@@ -33,6 +33,36 @@ void mte_invalidate_tags_area(int type);
 void *mte_allocate_tag_storage(void);
 void mte_free_tag_storage(char *storage);
=20
+#ifdef CONFIG_KASAN_HW_TAGS
+DECLARE_STATIC_KEY_FALSE(mte_sync_or_asymm_mode);
+DECLARE_STATIC_KEY_FALSE(mte_async_or_asymm_mode);
+
+static inline bool system_uses_sync_mte_faults(void)
+{
+	return static_branch_unlikely(&mte_sync_or_asymm_mode);
+}
+
+static inline bool system_uses_async_mte_faults(void)
+{
+	return static_branch_unlikely(&mte_async_or_asymm_mode);
+}
+#else
+static inline bool system_uses_sync_mte_faults(void)
+{
+	return false;
+}
+
+static inline bool system_uses_async_mte_faults(void)
+{
+	return false;
+}
+#endif
+
+static inline bool system_uses_mte(void)
+{
+	return system_uses_sync_mte_faults() || system_uses_async_mte_faults();
+}
+
 static __always_inline bool __mte_get_reset_tfsr(void)
 {
 	u64 tfsr_el1 =3D read_sysreg_s(SYS_TFSR_EL1);
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uacc=
ess.h
index e99faabd5dfc..22a176ac8341 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -16,7 +16,6 @@
  */
 #include <linux/bitops.h>
 #include <linux/kasan-checks.h>
-#include <linux/kasan-enabled.h>
 #include <linux/string.h>
=20
 #include <asm/asm-extable.h>
@@ -145,13 +144,13 @@ static inline void __uaccess_disable_mte(void)
 	 * Unlike get_user(), privileged uaccess (TTBR0) uses TCF (not TCF0)
 	 * such that a bad user address tag could trigger a kernel MTE fault.
 	 */
-	if (kasan_hw_tags_enabled())
+	if (system_uses_mte())
 		set_pstate_tco(1);
 }
=20
 static inline void __uaccess_enable_mte(void)
 {
-	if (kasan_hw_tags_enabled())
+	if (system_uses_mte())
 		set_pstate_tco(0);
 }
=20
@@ -316,7 +315,7 @@ do {									\
 	__typeof__(dst) __gkn_dst =3D (dst);				\
 	__typeof__(src) __gkn_src =3D (src);				\
 									\
-	if (system_uses_mte_async_or_asymm_mode())			\
+	if (system_uses_async_mte_faults())				\
 		__raw_get_mem_tco("ldr", *((type *)(__gkn_dst)),	\
 		      (__force type *)(__gkn_src), err_label, K);	\
 	else								\
@@ -422,7 +421,7 @@ do {									\
 	__typeof__(dst) __pkn_dst =3D (dst);				\
 	__typeof__(src) __pkn_src =3D (src);				\
 									\
-	if (system_uses_mte_async_or_asymm_mode())			\
+	if (system_uses_async_mte_faults())				\
 		__raw_put_mem_tco("str", *((type *)(__pkn_src)),	\
 			      (__force type *)(__pkn_dst), err_label, K); \
 	else								\
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/a=
sm/word-at-a-time.h
index 430d5ab8f042..53fd58460235 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -10,7 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/wordpart.h>
=20
-#include <asm/mte-kasan.h>
+#include <asm/mte.h>
 #include <asm/sysreg.h>
=20
 struct word_at_a_time {
@@ -64,7 +64,7 @@ static inline unsigned long load_unaligned_zeropad(const =
void *addr)
 	unsigned long ret;
=20
 	/* We handle synchronous exceptions so only use TCO in non-sync MTE. */
-	if (!system_uses_mte_async_or_asymm_mode())
+	if (!system_uses_async_mte_faults())
 		return __load_unaligned_zeropad(addr);
=20
 	set_pstate_tco(1);
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-com=
mon.c
index db4ff003a5b6..c6a9cc4e99a2 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -77,14 +77,14 @@ static __always_inline void mte_enter_from_kernel_mode(=
void)
 	 * Taking an exception sets TCO but clearing it can be expensive on
 	 * some architectures so first check that MTE is actually required.
 	 */
-	if (kasan_hw_tags_enabled() || uaccess_requires_mte(current))
+	if (system_uses_mte() || uaccess_requires_mte(current))
 		set_pstate_tco(0);
=20
 	if (!kasan_hw_tags_enabled())
 		return;
=20
 	/* Asynchronous faults are sync'ed automatically on kernel entry. */
-	if (system_uses_mte_async_or_asymm_mode() && __mte_get_reset_tfsr())
+	if (system_uses_async_mte_faults() && __mte_get_reset_tfsr())
 		kasan_report_async();
 }
=20
@@ -94,13 +94,13 @@ static __always_inline void mte_exit_to_kernel_mode(voi=
d)
 		return;
=20
 	/* Asynchronous faults require explicit sync'ing on kernel exit. */
-	if (system_uses_mte_async_or_asymm_mode() && mte_get_reset_tfsr())
+	if (system_uses_async_mte_faults() && mte_get_reset_tfsr())
 		kasan_report_async();
 }
=20
 static __always_inline void mte_enter_from_user_mode(void)
 {
-	if (kasan_hw_tags_enabled() || uaccess_requires_mte(current))
+	if (system_uses_mte() || uaccess_requires_mte(current))
 		set_pstate_tco(0);
 }
=20
@@ -109,7 +109,7 @@ static __always_inline void mte_exit_to_user_mode(void)
 	if (!kasan_hw_tags_enabled())
 		return;
=20
-	if (system_uses_mte_async_or_asymm_mode() && mte_get_reset_tfsr())
+	if (system_uses_async_mte_faults() && mte_get_reset_tfsr())
 		kasan_report_async();
 }
=20
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index b65e3aa3bd07..675ba6a803cf 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -13,6 +13,7 @@
 #include <linux/ptrace.h>
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
+#include <linux/static_key.h>
 #include <linux/string.h>
 #include <linux/swap.h>
 #include <linux/swapops.h>
@@ -37,6 +38,8 @@ static DEFINE_PER_CPU_READ_MOSTLY(u64, mte_tcf_preferred)=
;
  */
 DEFINE_STATIC_KEY_FALSE(mte_async_or_asymm_mode);
 EXPORT_SYMBOL_GPL(mte_async_or_asymm_mode);
+DEFINE_STATIC_KEY_FALSE(mte_sync_or_asymm_mode);
+EXPORT_SYMBOL_GPL(mte_sync_or_asymm_mode);
 #endif
=20
 void mte_sync_tags(pte_t pte, unsigned int nr_pages)
@@ -114,10 +117,13 @@ void mte_enable_kernel_sync(void)
 	 * Make sure we enter this function when no PE has set
 	 * async mode previously.
 	 */
-	WARN_ONCE(system_uses_mte_async_or_asymm_mode(),
+	WARN_ONCE(system_uses_async_mte_faults(),
 			"MTE async mode enabled system wide!");
=20
 	__mte_enable_kernel("synchronous", SCTLR_EL1_TCF_SYNC);
+
+	if (!system_uses_sync_mte_faults())
+		static_branch_enable(&mte_sync_or_asymm_mode);
 }
=20
 void mte_enable_kernel_async(void)
@@ -132,7 +138,7 @@ void mte_enable_kernel_async(void)
 	 * mode in between sync and async, this strategy needs
 	 * to be reviewed.
 	 */
-	if (!system_uses_mte_async_or_asymm_mode())
+	if (!system_uses_async_mte_faults())
 		static_branch_enable(&mte_async_or_asymm_mode);
 }
=20
@@ -150,7 +156,9 @@ void mte_enable_kernel_asymm(void)
 		 * mode in between sync and async, this strategy needs
 		 * to be reviewed.
 		 */
-		if (!system_uses_mte_async_or_asymm_mode())
+		if (!system_uses_sync_mte_faults())
+			static_branch_enable(&mte_sync_or_asymm_mode);
+		if (!system_uses_async_mte_faults())
 			static_branch_enable(&mte_async_or_asymm_mode);
 	} else {
 		/*
@@ -227,9 +235,9 @@ static void mte_update_gcr_excl(struct task_struct *tas=
k)
 {
 	/*
 	 * SYS_GCR_EL1 will be set to current->thread.mte_ctrl value by
-	 * mte_set_user_gcr() in kernel_exit, but only if KASAN is enabled.
+	 * mte_set_user_gcr() in kernel_exit, when the kernel uses MTE.
 	 */
-	if (kasan_hw_tags_enabled())
+	if (system_uses_mte())
 		return;
=20
 	write_sysreg_s(
@@ -275,13 +283,13 @@ void mte_thread_switch(struct task_struct *next)
 	mte_update_gcr_excl(next);
=20
 	/* TCO may not have been disabled on exception entry for the current task=
. */
-	if (!kasan_hw_tags_enabled() && uaccess_requires_mte(next))
+	if (!system_uses_mte() && uaccess_requires_mte(next))
 		set_pstate_tco(0);
=20
 	if (!kasan_hw_tags_enabled())
 		return;
=20
-	if (!system_uses_mte_async_or_asymm_mode())
+	if (!system_uses_async_mte_faults())
 		return;
=20
 	/*
@@ -348,7 +356,7 @@ void mte_suspend_enter(void)
 	if (!kasan_hw_tags_enabled())
 		return;
=20
-	if (system_uses_mte_async_or_asymm_mode() && mte_get_reset_tfsr())
+	if (system_uses_async_mte_faults() && mte_get_reset_tfsr())
 		kasan_report_async();
 }
=20
@@ -393,7 +401,7 @@ long set_mte_ctrl(struct task_struct *task, unsigned lo=
ng arg)
 		mte_update_sctlr_user(task);
 		mte_update_gcr_excl(task);
 		update_sctlr_el1(task->thread.sctlr_user);
-		if (!kasan_hw_tags_enabled() && uaccess_requires_mte(task))
+		if (!system_uses_mte() && uaccess_requires_mte(task))
 			set_pstate_tco(0);
 		preempt_enable();
 	}

--=20
2.56.0.455.g6c5a503b38-goog


