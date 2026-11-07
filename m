Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4741606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NsX8QX5q;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JeWA4XM/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tnh9BJDrW2Tas6QMn66ShAIs0W72jtzo/i49twtSyEs=; b=NsX8QX5qj4kHxkK2n59c9FfUWw
	m7gvor/Pb5MzgVexllsgxeUZP1rt4VkeYrNhnXrjQtYWW72VBLTv/UDpCdS+pZtB6CO25+o27g0Zv
	fDVFzED72n8RMOfX5II8b24WRcoKZAiXDMKixmB+tnqIk5DnKdod1p138/ysa2Ks/ASBpmNfmj2du
	phnVVqHUzpNJ3Q3p0hlW8/O/ZHUTTm9dAj1Q4VgQypFSPkgZ1X/QXvJbGrAad5p6T6MJht355wHQb
	u3LjHfu8OrQsMFA7fsMVPHH43TAm9xHWYOuc1Nu3xf78IwoJxEuNByT7zPFF/SZefkRy2Ets5PUC3
	QS6tOP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiUL-0000000EvdD-23A5;
	Sat, 07 Nov 2026 15:37:53 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTz-0000000Euxy-1tkt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:32 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c4d58203e40so23132266b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065849; x=1794670649; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tnh9BJDrW2Tas6QMn66ShAIs0W72jtzo/i49twtSyEs=;
        b=JeWA4XM/a5uzIyczuYhdgN7iwrnn9qwwsTD0I4848G+6Uv/FTXjOw52z/BMfPR1MVy
         ASxXDRPOFF667nnJr/CwVrtVe/+dRvh1/QNo5wkXCyjCD5XEwUdr2nga6J5M20KbyfUo
         0J+oWULFZbzb/EZj3OWYyFSHO6+slmAT1A5m8tHvUTeQ7Jr05EkPWPiVHfdDSBp9UyF1
         djCvQ6e8L6iQssL4V+agnAn98SDkBxdcx2D90TW2cqE/H0qZmN3uMaTSufw6luaNLnMI
         mStmt/3RqCfZ4TjYJRxoKDM5QEcmSMHy5DVhMjo2ppVo9nt9YduKzER2fMpJAKTzpiTn
         E4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065849; x=1794670649;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnh9BJDrW2Tas6QMn66ShAIs0W72jtzo/i49twtSyEs=;
        b=rIOAaHksTPg9wC0dTREGBpa96/FWTm5/tyo2yNSAwTENXdJ9+fACS0J9ehZKipOAYT
         w6DGNIpFCB29i61BK7s4Z8E9bM3KbFh1NnRXizJVC06RrGDK7YMAUKpoEgFDX+uYJRDH
         g9eDOk7WN+M8yPdiuWT83qGAmeWzSfEe4K3WIjRc6cBzdC5LVJVb3lJfrIWpF1SoXQC2
         M+7BMyER80kYBBltk8NXl2WQiiQQdwmtN1QjJm/CJ0ajplM9omF0u4iF1fDVkhHe6UzT
         NgO32Yf4x6pQNs0NmV6F9EsLyzvW4ZAn3QxU7mzX/6TZGVURmEvVOwMA4Ax0R98CQ8Si
         zMWw==
X-Forwarded-Encrypted: i=1; AL+hErFssNijHWtBigAnPkI9N2VCS4qigIGXvBSpBdXuU74+Xgh7YErWDQi1X4bZGP4W/NwaqHLyScWsWIqne5Q83X1R@lists.infradead.org
X-Gm-Message-State: APuU4Z/nRPUo5rf74c8URyKvTv6iuAsen94q1y7K76mFmlQysxzVQ/J8
	2tm8ed8IO4Busv+Dht0zB0I425cPWicUCrdcpr0yIDPtIOhz8232pvJcsSy0gpk4aNp/uwcDmw8
	mJQ==
X-Received: from ejbbg10.prod.google.com ([2002:a17:906:a04a:b0:c3f:85b7:3a4b])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:f5a3:b0:c42:fc8b:6c7a
 with SMTP id a640c23a62f3a-c4d34cb93dbmr425465766b.41.1794065848659; Sat, 07
 Nov 2026 07:37:28 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:21 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-15-d84ea5f30f94@google.com>
Subject: [PATCH 15/24] arm64: Refactor and remove mte_disable_tco_entry()
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Collingbourne <peter@pcc.me.uk>, "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073731_537884_0D9042DF 
X-CRM114-Status: GOOD (  21.08  )
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

Break the function up into the fundamental steps of checking the state
and clearing PSTATE.TCO. As a result, call sites can now be optimized
to only check the conditions that matter in their context, further
clarifying the intent in the code. This results in self-documenting code
and higher maintainability, addressing the need for lengthy comments.

Cc: Peter Collingbourne <peter@pcc.me.uk>
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte.h     | 30 ++++++++++--------------------
 arch/arm64/include/asm/uaccess.h |  6 ++++++
 arch/arm64/kernel/entry-common.c | 13 +++++++++++--
 arch/arm64/kernel/mte.c          |  8 ++++----
 4 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 815843079eb9..1308e37c43c6 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -18,6 +18,7 @@
 #include <linux/types.h>
=20
 #include <asm/barrier.h>
+#include <asm/cpufeature.h>
 #include <asm/pgtable-types.h>
 #include <asm/sysreg.h>
=20
@@ -62,6 +63,15 @@ static __always_inline bool mte_get_reset_tfsr(void)
 	return __mte_get_reset_tfsr();
 }
=20
+static inline bool task_uses_sync_mte_faults(struct task_struct *task)
+{
+	if (!system_supports_mte())
+		return false;
+
+	/* TCF0[0] is set for both synchronous (0b01) and asymmetric (0b11). */
+	return task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT);
+}
+
 #ifdef CONFIG_ARM64_MTE
=20
 /* track which pages have valid allocation tags */
@@ -254,26 +264,6 @@ static inline bool folio_try_hugetlb_mte_tagging(struc=
t folio *folio)
 }
 #endif
=20
-static inline void mte_disable_tco_entry(struct task_struct *task)
-{
-	if (!system_supports_mte())
-		return;
-
-	/*
-	 * Re-enable tag checking (TCO set on exception entry). This is only
-	 * necessary if MTE is enabled in either the kernel or the userspace
-	 * task in synchronous or asymmetric mode (SCTLR_EL1.TCF0 bit 0 is set
-	 * for both). With MTE disabled in the kernel and disabled or
-	 * asynchronous in userspace, tag check faults (including in uaccesses)
-	 * are not reported, therefore there is no need to re-enable checking.
-	 * This is beneficial on microarchitectures where re-enabling TCO is
-	 * expensive.
-	 */
-	if (kasan_hw_tags_enabled() ||
-	    (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT)))
-		set_pstate_tco(0);
-}
-
 #ifdef CONFIG_KASAN_HW_TAGS
 void mte_check_tfsr_el1(void);
=20
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uacc=
ess.h
index aac7676da531..e99faabd5dfc 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -123,6 +123,12 @@ static inline bool uaccess_ttbr0_enable(void)
 }
 #endif
=20
+static inline bool uaccess_requires_mte(struct task_struct *task)
+{
+	/* Asynchronous faults don't get reported to userspace. */
+	return task_uses_sync_mte_faults(task);
+}
+
 static inline void __uaccess_disable_hw_pan(void)
 {
 	asm(ALTERNATIVE("nop", SET_PSTATE_PAN(0), ARM64_HAS_PAN));
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-com=
mon.c
index fbf9bafc6962..ea385f579269 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -7,6 +7,7 @@
=20
 #include <linux/context_tracking.h>
 #include <linux/irq-entry-common.h>
+#include <linux/kasan-enabled.h>
 #include <linux/kasan.h>
 #include <linux/linkage.h>
 #include <linux/livepatch.h>
@@ -16,6 +17,7 @@
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/thread_info.h>
+#include <linux/uaccess.h>
=20
 #include <asm/cpufeature.h>
 #include <asm/daifflags.h>
@@ -72,7 +74,13 @@ static __always_inline void irqentry_exit_pcpu_adjust(st=
ruct pt_regs *regs)
 static __always_inline void mte_enter_from_kernel_mode(void)
 {
 	mte_check_tfsr_entry();
-	mte_disable_tco_entry(current);
+
+	/*
+	 * Taking an exception sets TCO but clearing it can be expensive on
+	 * some architectures so first check that MTE is actually required.
+	 */
+	if (kasan_hw_tags_enabled() || uaccess_requires_mte(current))
+		set_pstate_tco(0);
 }
=20
 static __always_inline void mte_exit_to_kernel_mode(void)
@@ -82,7 +90,8 @@ static __always_inline void mte_exit_to_kernel_mode(void)
=20
 static __always_inline void mte_enter_from_user_mode(void)
 {
-	mte_disable_tco_entry(current);
+	if (kasan_hw_tags_enabled() || uaccess_requires_mte(current))
+		set_pstate_tco(0);
 }
=20
 static __always_inline void mte_exit_to_user_mode(void)
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 47432c9c4de0..0d998289edcb 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -281,8 +281,8 @@ void mte_thread_switch(struct task_struct *next)
 	mte_update_gcr_excl(next);
=20
 	/* TCO may not have been disabled on exception entry for the current task=
. */
-	if (!kasan_hw_tags_enabled())
-		mte_disable_tco_entry(next);
+	if (!kasan_hw_tags_enabled() && uaccess_requires_mte(next))
+		set_pstate_tco(0);
=20
 	if (!system_uses_mte_async_or_asymm_mode())
 		return;
@@ -401,8 +401,8 @@ long set_mte_ctrl(struct task_struct *task, unsigned lo=
ng arg)
 		mte_update_sctlr_user(task);
 		mte_update_gcr_excl(task);
 		update_sctlr_el1(task->thread.sctlr_user);
-		if (!kasan_hw_tags_enabled())
-			mte_disable_tco_entry(task);
+		if (!kasan_hw_tags_enabled() && uaccess_requires_mte(task))
+			set_pstate_tco(0);
 		preempt_enable();
 	}
=20

--=20
2.56.0.455.g6c5a503b38-goog


