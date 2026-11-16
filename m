Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CBC606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zkklUneV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKwGexS0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V/ALRmUD/hAy570O2Xf1osysz7Ylv+AoJE5xebVPkiE=; b=zkklUneVvns0oE
	eYyTySzvZR/xdjPxMfYzsQAGz46Y+ksvYztgpDeXs/4vNXTwNsi9hb17JYlvbHB0ni4IT055kGGBN
	JMNvOGeSdQC1610q8xlaVzcSQbCshDe/yY9pkc7VuWcDUg8Ig5BfulaH213O5E54KjqSMaHGX6XCB
	kZcIf6jwAvT08xVHSDZ3NxNKpqlpZ2+RzOsDxwAkXIewEuwtYQf97WEsFL3lMmnkwSnKjV3omz33F
	69mhk4D3zWDbsg6nigKijqcwnJcsCyhkHb3HmBBuC6MNRxmWt10cmeQwTBFfiBNE3vrC9h/A1BkGL
	7lNgK0Mz14k3ZfVc/T8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrYG-00000001TVb-0x4n;
	Mon, 16 Nov 2026 07:54:56 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrY8-00000001TS4-30B7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:54:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so6726315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815686; x=1795420486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/ALRmUD/hAy570O2Xf1osysz7Ylv+AoJE5xebVPkiE=;
        b=iKwGexS0+6xQRU5xV2SEJ9+bB9NCRysdXQnU43azkzpgMCxBE1tt6G1wEyllLez1+b
         bidwCwgFq1VBgjKd7nu0vlRNP8I0z2aFT+LYHnd+vPLoAUkteSVxyQ2X5rZe6/gBEffI
         s2HRdovKqSSo60hD1m0ZAiJz3M7vVzp+kZeL8vNHj/Pbv6p423/7yawoeGvnoVfP0kFq
         EYriDUTEJzGXu5rBjTSnYhYS5L05KHVgwn88jXg2/Z2h6JqLUo9/yOiWmi94n/RZyWgQ
         Ugk5op7Q9kNPlHgTu+J+MYsZfiKnPikU5RqJkVVThd11HBRCw5LVPd+UsEZ7DmxnBWdu
         ztBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815686; x=1795420486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/ALRmUD/hAy570O2Xf1osysz7Ylv+AoJE5xebVPkiE=;
        b=GgAJyYXU2tCKfsxuhnCRWOlehwucIzxp7qeIYrDXw+NsNBTb8HZ/gd/v+OzkoGfkYm
         7eg8pbu8YDsxVo4B8ZLrddERpI9rk6zWLFbxFuFmiTOEYEFOPohCMlb28MTO6QgVxdTm
         aMqygmQd9LSXCIKs9ATD8yh3TB2T0EpOYlRKzo3/A8IJF3CK94A+EZdHE0PcHgv9YKfC
         CILoQzx3Ij5o++qhtH7veORFMRQj7awYLZpAdC4ull4lqxgspmCuo7hiTzoQySQqMIuh
         zrGXbOw/Hz1ae3zxFIjA0f8O7aV/xqEJzuxvo0YRMmeLPA9V7+0A7uHo+MOLglt4hZqj
         lQJw==
X-Forwarded-Encrypted: i=1; AL+hErHnN6KAYiOgwYPQiJjAWjtl8O7QEw72J7r0pHpHyTURNthOhxVB/jx145g64uRXwC9VBNU765xLY0/euCuB2dEG@lists.infradead.org
X-Gm-Message-State: APuU4Z8oTR4z+iVt6WNpfw/SmKvNRc1TAqwVoy5KUrrvSebvZAd5aYkJ
	Pe/uVnRjMOxef63SeETuAgrwW1wDbZnDGao9AVQgOzsBa4AqcB9thXPS
X-Gm-Gg: AYBFou2Tkz5qqWsugx6+EMaJn6TSUAaKKd8LeRsP2fthfZ1seMxJYeiKMgX3iI6mrQq
	WaqjAcNrDN13RnwETajuCi53soKFg5MGztr0hvva79N1TE4PovQj2AI94hvvaClY9sd1tLvYTnK
	TATu6MKupVW22ujBIuM3LLRzkHUkK+ULpLKEz3bkXyQgknXzaBekSHtXH2Hkv1g0fgaFP2grJ7w
	iyFGIvpcVYr2bJOqttWQWlltLMoWvSn6F0hmeKJ3fh/WAfnmT0YOwkErChLfdVmHlX5FY5W66Ab
	1OQHoONQk4R4x3zGMqX2KvDcS8YCB9IbDjiJICZ5bJF5x/mOvDrgQNuwx9tbX8XaTA1y8FBHfUV
	CzpnJhKnGp6eKCGYsyOA1ENQiR8drThgiFYKv/kJ9oqByls7fuizfStpvi1KAKzGqMvKiOKVZXr
	YwWZkgCtRZtOll53OrY1FOZbNad1W9a/B5jcE51d9j2IwDzgkgt3gP2vZebxA5jG1iDPxEN+xJX
	Wn0qs1rAZgLTAUq7uUILyhw1woT88FMG76u4Jybx8oeZCKHVCJqK14UlCugOiIrb0p/5IrqGNuL
	O8Ls+E51m6zUGaJiukwAdK2x7lVc6ynK8sPrmyLuEXxFoUV18hHRr0CANfO1sJ279T4WDV/BzI8
	efozhb1EzeFWXQcN1FOoRLimhZSI+Zm5vc3mrkVjBAk3Pk7f/z0Gn2gGr8HUmJwS8hhQmgaD5C7
	7m9cEZJK49XCon5VsBXwkeDFi/6x/E
X-Received: by 2002:a05:600c:a010:b0:4bb:6238:cd81 with SMTP id 5b1f17b1804b1-4bb6238d365mr123245015e9.10.1794815685909;
        Sun, 15 Nov 2026 23:54:45 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-117-148-032.95.117.pool.telefonica.de. [95.117.148.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm210329875e9.14.2026.11.15.23.54.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:54:45 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] sched/preempt: Check preempt counts in notrace helpers
Date: Mon, 16 Nov 2026 08:54:24 +0100
Message-Id: <446e2bd042ce071da52ea80f577fe43c1b3dc031.1794814699.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1794814699.git.kmehltretter@gmail.com>
References: <cover.1794814699.git.kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235448_806959_0F2CB9D6 
X-CRM114-Status: GOOD (  17.20  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The notrace preemption macros use raw count updates even with
CONFIG_DEBUG_PREEMPT enabled. They therefore skip the bounds checks
which ordinary preemption operations provide.

Add checked noinstr preempt-count helpers and use them in
preempt_disable_notrace(), preempt_enable_notrace() and
preempt_enable_no_resched_notrace(). Export the out-of-line helpers
for module callers. Keep raw updates when CONFIG_DEBUG_PREEMPT is
disabled.

Share the validation with preempt_count_add() and preempt_count_sub(),
while leaving their preemption-latency tracing and ordering unchanged.
DEBUG_LOCKS_WARN_ON() brackets its diagnostic work with
instrumentation_begin() and instrumentation_end(), but evaluates its
condition before that region. Branch profiling would therefore call
ftrace_likely_update() from noinstr text.

Compile core.o with branch profiling disabled when DEBUG_PREEMPT and
TRACE_BRANCH_PROFILING are both enabled, as the scheduler Makefile already
does for build_policy.o and build_utility.o. This keeps valid notrace count
updates free of profiler calls while retaining the existing warning path.
The tradeoff is loss of branch-profile data for the rest of core.o in that
configuration; scheduler tracepoints and function tracing are unchanged.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20261029093219.GH1779021@noisy.programming.kicks-ass.net
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/preempt.h | 22 ++++++++++++++++++----
 kernel/sched/Makefile   |  3 +++
 kernel/sched/core.c     | 40 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 06ff44a4b8b6a..42c585fd91d45 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -217,6 +217,17 @@ static __always_inline unsigned char interrupt_context_level(void)
  */
 #define in_atomic_preempt_off() (preempt_count() != PREEMPT_DISABLE_OFFSET)
 
+#ifdef CONFIG_DEBUG_PREEMPT
+void preempt_count_add_notrace(int val);
+void preempt_count_sub_notrace(int val);
+#define preempt_count_dec_and_test_notrace() \
+	({ preempt_count_sub_notrace(1); should_resched(0); })
+#else
+#define preempt_count_add_notrace(val)	__preempt_count_add(val)
+#define preempt_count_sub_notrace(val)	__preempt_count_sub(val)
+#define preempt_count_dec_and_test_notrace() __preempt_count_dec_and_test()
+#endif
+
 #if defined(CONFIG_DEBUG_PREEMPT) || defined(CONFIG_TRACE_PREEMPT_TOGGLE)
 extern void preempt_count_add(int val);
 extern void preempt_count_sub(int val);
@@ -231,6 +242,9 @@ extern void preempt_count_sub(int val);
 #define __preempt_count_inc() __preempt_count_add(1)
 #define __preempt_count_dec() __preempt_count_sub(1)
 
+#define preempt_count_inc_notrace() preempt_count_add_notrace(1)
+#define preempt_count_dec_notrace() preempt_count_sub_notrace(1)
+
 #define preempt_count_inc() preempt_count_add(1)
 #define preempt_count_dec() preempt_count_sub(1)
 
@@ -263,7 +277,7 @@ do { \
 #define preempt_enable_notrace() \
 do { \
 	barrier(); \
-	if (unlikely(__preempt_count_dec_and_test())) \
+	if (unlikely(preempt_count_dec_and_test_notrace())) \
 		__preempt_schedule_notrace(); \
 } while (0)
 
@@ -283,7 +297,7 @@ do { \
 #define preempt_enable_notrace() \
 do { \
 	barrier(); \
-	__preempt_count_dec(); \
+	preempt_count_dec_notrace(); \
 } while (0)
 
 #define preempt_check_resched() do { } while (0)
@@ -291,14 +305,14 @@ do { \
 
 #define preempt_disable_notrace() \
 do { \
-	__preempt_count_inc(); \
+	preempt_count_inc_notrace(); \
 	barrier(); \
 } while (0)
 
 #define preempt_enable_no_resched_notrace() \
 do { \
 	barrier(); \
-	__preempt_count_dec(); \
+	preempt_count_dec_notrace(); \
 } while (0)
 
 #else /* !CONFIG_PREEMPT_COUNT */
diff --git a/kernel/sched/Makefile b/kernel/sched/Makefile
index b1f1a367034ff..d87f1bd3c28c3 100644
--- a/kernel/sched/Makefile
+++ b/kernel/sched/Makefile
@@ -27,6 +27,9 @@ endif
 
 # Branch profiling isn't noinstr-safe
 ifdef CONFIG_TRACE_BRANCH_PROFILING
+ifdef CONFIG_DEBUG_PREEMPT
+CFLAGS_core.o += -DDISABLE_BRANCH_PROFILING
+endif
 CFLAGS_build_policy.o += -DDISABLE_BRANCH_PROFILING
 CFLAGS_build_utility.o += -DDISABLE_BRANCH_PROFILING
 endif
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1a088d4576f59..98ca93bc60887 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6040,7 +6040,7 @@ static inline void preempt_latency_start(int val)
 	}
 }
 
-void preempt_count_add(int val)
+static __always_inline bool __preempt_count_add_checked(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
 	/*
@@ -6052,7 +6052,7 @@ void preempt_count_add(int val)
 	 */
 	if (!IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS) &&
 	    DEBUG_LOCKS_WARN_ON((preempt_count() < 0)))
-		return;
+		return false;
 #endif
 	__preempt_count_add(val);
 #ifdef CONFIG_DEBUG_PREEMPT
@@ -6062,6 +6062,21 @@ void preempt_count_add(int val)
 	DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >=
 				PREEMPT_MASK - 10);
 #endif
+	return true;
+}
+
+#ifdef CONFIG_DEBUG_PREEMPT
+void noinstr preempt_count_add_notrace(int val)
+{
+	__preempt_count_add_checked(val);
+}
+EXPORT_SYMBOL(preempt_count_add_notrace);
+#endif
+
+void preempt_count_add(int val)
+{
+	if (!__preempt_count_add_checked(val))
+		return;
 	preempt_latency_start(val);
 }
 EXPORT_SYMBOL(preempt_count_add);
@@ -6077,7 +6092,7 @@ static inline void preempt_latency_stop(int val)
 		trace_preempt_on(CALLER_ADDR0, get_lock_parent_ip());
 }
 
-void preempt_count_sub(int val)
+static __always_inline bool preempt_count_sub_debug_checks(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
 	/*
@@ -6087,15 +6102,32 @@ void preempt_count_sub(int val)
 	unsigned int pc = preempt_count();
 
 	if (DEBUG_LOCKS_WARN_ON(pc - uval > pc))
-		return;
+		return false;
 	/*
 	 * Is the spinlock portion underflowing?
 	 */
 	if (DEBUG_LOCKS_WARN_ON((val < PREEMPT_MASK) &&
 			!(preempt_count() & PREEMPT_MASK)))
+		return false;
+#endif
+	return true;
+}
+
+#ifdef CONFIG_DEBUG_PREEMPT
+void noinstr preempt_count_sub_notrace(int val)
+{
+	if (!preempt_count_sub_debug_checks(val))
 		return;
+	__preempt_count_sub(val);
+}
+EXPORT_SYMBOL(preempt_count_sub_notrace);
 #endif
 
+void preempt_count_sub(int val)
+{
+	if (!preempt_count_sub_debug_checks(val))
+		return;
+
 	preempt_latency_stop(val);
 	__preempt_count_sub(val);
 }

