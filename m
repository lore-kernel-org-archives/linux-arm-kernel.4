Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227FB606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IGhZx2bE;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZKFQH9//
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ceh8RfChhYT4i+JdVCWUzDWUzJpR0l4QIJp9mPrhShg=; b=IGhZx2bEdHaI0tDi/iveum9aFo
	AtzjrfeSJE6X/C+TM+vRZhb/TbFye7MS039C6HsbjMdJibYXPJ/aHj1xo32bQv3mc5Qf2+Qa+LnUz
	d5So1gVc2cPCgbqPnYerOXjSyyyPUZNfGghx7l0GQA0QZwU/d0O4BzBw1n0Qq/Rrerv5hnt6FXIvZ
	jNCMCvcWivpQ6rI0WMerLYNjrJjQg1+xbEGVCE/Y3/A/w8ipXFacl2CD3cAHMo6zoQGwju5Gpw3zo
	ZSq/jNN3LxH8kW991Y7NSWPowZFuo7YZqzV3MCDFp8L5wA/xsJH6gbgyPzAbSEnRool+JeYoKd+8w
	Uv8ERrsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiUM-0000000Evet-0piN;
	Sat, 07 Nov 2026 15:37:54 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU3-0000000Ev4b-30lA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:37 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c210c66672eso190362166b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065853; x=1794670653; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ceh8RfChhYT4i+JdVCWUzDWUzJpR0l4QIJp9mPrhShg=;
        b=ZKFQH9//95dVmF2KiHk0FWmxI3v19T1GZYfHVr49xq+mG0LtNUMB292l4/vJPLKcc3
         6IB3Xq2YZzv+AmeLRzbBYexoUjWZzMWq4x/GZg06rOQjW7qj83poo0d0dEjZJTEzEz6q
         n12TKnBGzprrLKFN1w+HD+Y7IsBs1u0OfIB6SoqL84O/cWoaqiczPQvNF+WRjuSdYa81
         Dm9uTUgggsu8L67QhLPPWlSvu0UU+LvGeRWiJM8fDaWtvWGZPBux1sb4r+dVQvlfrNPT
         fD7WsiNx6/JQ1CItTYbyVv6t5klrQA8c7vgcqCG9w/kABCm85vsGOOmMM6VyUAoOG2mV
         34ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065853; x=1794670653;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ceh8RfChhYT4i+JdVCWUzDWUzJpR0l4QIJp9mPrhShg=;
        b=teGOdpIzRyfL67i0fhrFvFOTOEpAZqtgcJAYJyPNPWWjZa50I8bWHqIP+QkcwfWA17
         TCa8voIKsiRh0xIasH5Qi6JbJovv0yP3nJ7D7S284rtnwdj2LshbtaokV5JN+Nca+nND
         +nbu3KkYktf5PleiJ8/PKiokL5IGcSmpz2HQR0DSOjObhK/l33SNXbwlXlmkNLAFS6fa
         bnBl0RZV93DGMQaPkivLnz7vgvx+rv2e/72bpf4lOkaaUk1/WoZPG8eKAjoq9UsNIIQE
         b8Zwr3evmaumuZ6H+YwLur7wVCg6asG8ew7OQBfmfoKRl5uYOClXBJ77lQcruXXIT+cu
         QhNQ==
X-Forwarded-Encrypted: i=1; AKwUvByNuLWw3cou6N0vG2lAbeAjf71teS7+tHV1TjGoQqjoexWTLDcpRhbogwOizZNK22EI5A+/ukU79a3fO10qCUfL@lists.infradead.org
X-Gm-Message-State: APuU4Z+Y6Tb8ewPw2CJL5vIPt2llBXcQj89PbdLTqPjn1rvUF3qntFKG
	u3YYROjPndhxnHO++Rep9G0hufYS/aZrPzklc7C01rViqZNp8BuIsFN5vpamaTzDIKMQIUVV9J7
	hrw==
X-Received: from ejfg8.prod.google.com ([2002:a17:906:3b08:b0:c2e:1bc5:6c6c])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2d94:b0:c40:bbd2:62f6
 with SMTP id a640c23a62f3a-c4d35268ecemr454740566b.19.1794065852609; Sat, 07
 Nov 2026 07:37:32 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:24 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-18-d84ea5f30f94@google.com>
Subject: [PATCH 18/24] arm64: Inline and remove mte_check_tfsr_*()
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073736_041256_8C004354 
X-CRM114-Status: GOOD (  19.91  )
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

Inline mte_check_tfsr_{entry,exit}() into the kernel entry/exit helpers,
which should ever be their only callers and therefore were an unneeded
extra layer of indirection. This allows deduplicating checks that were
performed within the functions and outside.

Inline mte_check_tfsr_el1() as the now-trivial check-and-report,
improving readability of the code and clearly showing the dependency on
KASAN, while abstracting away synchronization for mte_suspend_enter().
Use an early kasan_hw_tags_enabled() guard to let the compiler optimize
it all out when !KASAN_HW_TAGS.

As a result, <mte.h> finally drops its dependency on KASAN.

Note that mte_enter_from_kernel_mode() now clears TCO before checking
TFSR, which should be functionally equivalent and even provide a
negligibly higher coverage.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte.h     | 45 ------------------------------------=
----
 arch/arm64/kernel/entry-common.c | 22 ++++++++++++++++----
 arch/arm64/kernel/mte.c          | 28 ++++++++-----------------
 arch/arm64/mm/copypage.c         |  1 +
 4 files changed, 28 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 1308e37c43c6..1e20a43c0a67 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -12,7 +12,6 @@
 #ifndef __ASSEMBLER__
=20
 #include <linux/bitfield.h>
-#include <linux/kasan-enabled.h>
 #include <linux/page-flags.h>
 #include <linux/sched.h>
 #include <linux/types.h>
@@ -264,49 +263,5 @@ static inline bool folio_try_hugetlb_mte_tagging(struc=
t folio *folio)
 }
 #endif
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-void mte_check_tfsr_el1(void);
-
-static inline void mte_check_tfsr_entry(void)
-{
-	if (!kasan_hw_tags_enabled())
-		return;
-
-	if (!system_uses_mte_async_or_asymm_mode())
-		return;
-
-	mte_check_tfsr_el1();
-}
-
-static inline void mte_check_tfsr_exit(void)
-{
-	if (!kasan_hw_tags_enabled())
-		return;
-
-	if (!system_uses_mte_async_or_asymm_mode())
-		return;
-
-	/*
-	 * The asynchronous faults are sync'ed automatically with
-	 * TFSR_EL1 on kernel entry but for exit an explicit dsb()
-	 * is required.
-	 */
-	dsb(nsh);
-	isb();
-
-	mte_check_tfsr_el1();
-}
-#else
-static inline void mte_check_tfsr_el1(void)
-{
-}
-static inline void mte_check_tfsr_entry(void)
-{
-}
-static inline void mte_check_tfsr_exit(void)
-{
-}
-#endif /* CONFIG_KASAN_HW_TAGS */
-
 #endif /* __ASSEMBLER__ */
 #endif /* __ASM_MTE_H  */
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-com=
mon.c
index ea385f579269..db4ff003a5b6 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -73,19 +73,29 @@ static __always_inline void irqentry_exit_pcpu_adjust(s=
truct pt_regs *regs)
=20
 static __always_inline void mte_enter_from_kernel_mode(void)
 {
-	mte_check_tfsr_entry();
-
 	/*
 	 * Taking an exception sets TCO but clearing it can be expensive on
 	 * some architectures so first check that MTE is actually required.
 	 */
 	if (kasan_hw_tags_enabled() || uaccess_requires_mte(current))
 		set_pstate_tco(0);
+
+	if (!kasan_hw_tags_enabled())
+		return;
+
+	/* Asynchronous faults are sync'ed automatically on kernel entry. */
+	if (system_uses_mte_async_or_asymm_mode() && __mte_get_reset_tfsr())
+		kasan_report_async();
 }
=20
 static __always_inline void mte_exit_to_kernel_mode(void)
 {
-	mte_check_tfsr_exit();
+	if (!kasan_hw_tags_enabled())
+		return;
+
+	/* Asynchronous faults require explicit sync'ing on kernel exit. */
+	if (system_uses_mte_async_or_asymm_mode() && mte_get_reset_tfsr())
+		kasan_report_async();
 }
=20
 static __always_inline void mte_enter_from_user_mode(void)
@@ -96,7 +106,11 @@ static __always_inline void mte_enter_from_user_mode(vo=
id)
=20
 static __always_inline void mte_exit_to_user_mode(void)
 {
-	mte_check_tfsr_exit();
+	if (!kasan_hw_tags_enabled())
+		return;
+
+	if (system_uses_mte_async_or_asymm_mode() && mte_get_reset_tfsr())
+		kasan_report_async();
 }
=20
 /*
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 725f48faec3e..b65e3aa3bd07 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -5,6 +5,7 @@
=20
 #include <linux/bitops.h>
 #include <linux/cpu.h>
+#include <linux/kasan.h>
 #include <linux/kasan-enabled.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -180,14 +181,6 @@ int mte_enable_kernel_store_only(void)
 }
 #endif
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-void mte_check_tfsr_el1(void)
-{
-	if (__mte_get_reset_tfsr())
-		kasan_report_async();
-}
-#endif
-
 /*
  * This is where we actually resolve the system and process MTE mode
  * configuration into an actual value in SCTLR_EL1 that affects
@@ -285,6 +278,9 @@ void mte_thread_switch(struct task_struct *next)
 	if (!kasan_hw_tags_enabled() && uaccess_requires_mte(next))
 		set_pstate_tco(0);
=20
+	if (!kasan_hw_tags_enabled())
+		return;
+
 	if (!system_uses_mte_async_or_asymm_mode())
 		return;
=20
@@ -296,7 +292,8 @@ void mte_thread_switch(struct task_struct *next)
 	 * are synchronized before this point.
 	 */
 	isb();
-	mte_check_tfsr_el1();
+	if (__mte_get_reset_tfsr())
+		kasan_report_async();
 }
=20
 void mte_cpu_setup(void)
@@ -348,18 +345,11 @@ void mte_suspend_enter(void)
 	if (!system_supports_mte())
 		return;
=20
-	if (!system_uses_mte_async_or_asymm_mode())
+	if (!kasan_hw_tags_enabled())
 		return;
=20
-	/*
-	 * The barriers are required to guarantee that the indirect writes
-	 * to TFSR_EL1 are synchronized before we report the state.
-	 */
-	dsb(nsh);
-	isb();
-
-	/* Report SYS_TFSR_EL1 before suspend entry */
-	mte_check_tfsr_el1();
+	if (system_uses_mte_async_or_asymm_mode() && mte_get_reset_tfsr())
+		kasan_report_async();
 }
=20
 void mte_suspend_exit(void)
diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
index cd5912ba617b..e6796bf1fad1 100644
--- a/arch/arm64/mm/copypage.c
+++ b/arch/arm64/mm/copypage.c
@@ -7,6 +7,7 @@
  */
=20
 #include <linux/bitops.h>
+#include <linux/kasan-enabled.h>
 #include <linux/mm.h>
=20
 #include <asm/page.h>

--=20
2.56.0.455.g6c5a503b38-goog


