Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17C7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q7S35Ega;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFTirRh3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NA3dxPx5kpLeZIBZWy1VGAvPGIUfeVILehoK5Z42ZCI=; b=q7S35Egaa+uy03
	s1L7JOVD3gPWU8BBrC8+xl1UhVeaKPJzLXGbNQlIJ6NqfieVmGjfs2+kZwRDlM9eYSYyIxgV3Oz4B
	PsMxQUTFNQSXJpxODuoAgWY14kOsURi0y9a5vZFx+8I2TPo/RXHsz0GSPBlVLt1RdOv8L9DLVm9OS
	vQ0KiLf3vxK7jlYP6pI9sCOZOOKt+oheWG3j5KBoZTvGPBvg2ecLPEW7xUA5qPRErQu5Ow4nZFOPK
	NgmzB0POUk1WMv5Hgipt9UxRb5+BkokZjgBRkfZiVoHco7ob/N11GbzgW4Q73eMneJF5xakqxzbfW
	xjWLCggs7Wt3Vnvfh6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPGe-0000000BtuJ-38TG;
	Thu, 26 Nov 2026 02:31:24 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPGS-0000000Btqr-0xeV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:31:13 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48dee593f18so6018216f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660271; x=1796265071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NA3dxPx5kpLeZIBZWy1VGAvPGIUfeVILehoK5Z42ZCI=;
        b=TFTirRh3TTCKMOHNCY5ARZjlPWCCk3dx5y8cvQV5MsZot+nj8cMfi10PRmntksT44c
         Z+V3GlkyPR3Vmsa23/xEXAOKxlYf1+y1sJnByetM9OsZzhXjgg7RqJwz/XYItVgVKNB5
         7Hz5SB/fn5rPnyg4xYK7uzcfzJH7z0tC4zxLFlojF8Nm9TCygg/nIg8T5K2baX3BFIqY
         UuauGS5BfWxiuJ0sIBYFhFv4AsNhYT72ZRiifbkhEbjMhAhUTNdEdv9QEGdQpFXsX4Sb
         OUaIcdunpw9/Rt2fS9XfJx4n3w8rniqpf9qQ+dvVS/bbnNTocJ1ibU4c1bq2ZOQx1WFl
         Bsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660271; x=1796265071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NA3dxPx5kpLeZIBZWy1VGAvPGIUfeVILehoK5Z42ZCI=;
        b=wzZoQCzXIircsA8HAy0rrOjUAOPJilLMuV21bAQ3Gn/shEzgJm4zeaBMwELQaDTrg5
         NQWdlQnOkCxOqQc9F3GLYy5J/qF2yifP92RcrnisBAtxpFtDuEnHWCUXBZ3XwMuai0d2
         JK9DWZABelmUorZGMPy7KMdQbVwCS4P8/gNCuj2H8dgkBXTa1u01su4K50KO7dvuST6L
         VVdbWuGYdn0ZEcxAa2B+zde+XjkGLJJJXdqgKDHubgm+GcLIh39blFsUa/OLjJh161Lp
         QBhLQd/0t8kBdD81HhNc8Gxmq5GwMSrcym5WbgLM5/RVNy5eAAROpnvXuotuBPyFTx0v
         iOwQ==
X-Forwarded-Encrypted: i=1; AL+hErEbn4lsY1XtPzv297cOenGb3gUBshPI9prryWyw4re6ags5eZ4g/Qpu3xDw7CMvOHQUJMO0VXlfbz6ACWr3kn+l@lists.infradead.org
X-Gm-Message-State: APuU4Z/DT0eRjqBX8HZ1j4/nQ3/zCm/BbyvWetPSmEeNS1hQQWJ84RIm
	DObzJ/4oCTc7ATyfJItvf/YMLDamTrU5EtZrTE2uOIWqX/zlebA2VRxC
X-Gm-Gg: AZFdTZd0Bu9O9IyQCBvvaHlkYQtbKUBRN/LMRhN1z9cNuv9p7ljajaEqAgLYcDI4Drs
	3Of77dfr35v0rVQFXfMy97DmAyP6kcKOYBKMQbJr3smYfJB0TgPc7yPdn4GaLUO0I8BoVpwAeru
	EuLOdNIa4i2gv9aNBUH4jy+c6+HFvPUP7qsFsJUyO2ePVKvRoORS0yYvdpv+ygdjZO03FcBBi7n
	6+pS9bOsHChxd4NQNJ6ZdXCIcp+jcXzw2EJ196QIfoRFKAg+czJIqyj4u47q4vX3GEtkjFcyg1V
	4JyyRtHhH5YOE9osnr5sn1b48DZyHRXyFGUeDo1yXlKxBVqv8nW+tf8Bjp6ZkLG2qMiAjUyYtnC
	QMhIulht+ux3VpfbDmkTlLzH/JLubNxCv98Jy91w8vaSaoW2dyY3tTB5QmdwQmUH6AP4QMsXW+M
	DDW3oyppevcB/3Gom6PqXBSNMh3cLec9WfYwq4pQUh9Isl2ABCA1QSgi5lKC3IVE5HEDkoL1w3f
	uv3PpkcAVkHSBrkIRMsqTKYd+YHHq1mxyHzL/iGmfH6r2whfb2ItHurJQBoXhNLuKXssypSpR1w
	HS3xoQnLhZvrD1kOgXagz947AOD5oy95lg96y4lzyVlu6Aj5bRBZKaaHG5DCmvWSGdZLZDGeY9W
	7SEOqUPugy01qzZIDh9cNIG89IU165MJMN6jGYYm9ofyd/qlxlq0QwSw8xVeHAVYqWQVFKyXfwy
	LWjcGvJyPoTuBaLYTc5QwpYtrltgiqwWELS5vXXQ==
X-Received: by 2002:a5d:59c3:0:b0:4b5:b60:4814 with SMTP id ffacd0b85a97d-4b50b60487bmr20466444f8f.54.1795660270516;
        Wed, 25 Nov 2026 18:31:10 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b10e-d501-d0c4-b021-8d77-e472.310.pool.telefonica.de. [2a02:3100:b10e:d501:d0c4:b021:8d77:e472])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm37722445f8f.20.2026.11.25.18.31.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 18:31:10 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Song Liu <song@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] sched/preempt: Check preempt counts in notrace helpers
Date: Thu, 26 Nov 2026 03:30:54 +0100
Message-Id: <87f882f6c8a66a3d293b6ec00612fd5f25cb2edd.1795631277.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1795631277.git.kmehltretter@gmail.com>
References: <cover.1795631277.git.kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_183112_309296_DEB5DEA5 
X-CRM114-Status: GOOD (  19.01  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The notrace preemption macros use raw count updates even with
CONFIG_DEBUG_PREEMPT, bypassing the underflow and near-overflow checks
used by ordinary operations.

Add checked noinstr helpers for notrace preemption-count updates and use
them in preempt_disable_notrace(), preempt_enable_notrace() and
preempt_enable_no_resched_notrace(). Export the out-of-line helpers for
module callers and retain raw updates when CONFIG_DEBUG_PREEMPT is
disabled. Remove the now-unused __preempt_count_inc() and
__preempt_count_dec() macros.

Share validation with preempt_count_add() and preempt_count_sub(),
leaving their preemption-latency tracing and ordering unchanged.

DEBUG_LOCKS_WARN_ON() evaluates its condition before entering its
instrumentation region. Branch profiling would therefore call
ftrace_likely_update() from noinstr text. Make the Branch Profiling
Kconfig choice depend on !DEBUG_PREEMPT, covering both
PROFILE_ANNOTATED_BRANCHES and PROFILE_ALL_BRANCHES without changing
non-debug configurations.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20261029093219.GH1779021@noisy.programming.kicks-ass.net
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Replace the kernel/sched/Makefile CFLAGS_core.o override with a
  !DEBUG_PREEMPT dependency on the Branch Profiling Kconfig choice
  (Steven Rostedt), covering both PROFILE_ANNOTATED_BRANCHES and
  PROFILE_ALL_BRANCHES.
- Remove unused __preempt_count_inc() and __preempt_count_dec() macros
  and clarify the changelog wording (Hongyan Xia).
 include/linux/preempt.h | 23 +++++++++++++++++------
 kernel/sched/core.c     | 40 ++++++++++++++++++++++++++++++++++++----
 kernel/trace/Kconfig    |  1 +
 3 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 06ff44a4b8b..b60fce55a35 100644
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
@@ -228,8 +239,8 @@ extern void preempt_count_sub(int val);
 #define preempt_count_dec_and_test() __preempt_count_dec_and_test()
 #endif
 
-#define __preempt_count_inc() __preempt_count_add(1)
-#define __preempt_count_dec() __preempt_count_sub(1)
+#define preempt_count_inc_notrace() preempt_count_add_notrace(1)
+#define preempt_count_dec_notrace() preempt_count_sub_notrace(1)
 
 #define preempt_count_inc() preempt_count_add(1)
 #define preempt_count_dec() preempt_count_sub(1)
@@ -263,7 +274,7 @@ do { \
 #define preempt_enable_notrace() \
 do { \
 	barrier(); \
-	if (unlikely(__preempt_count_dec_and_test())) \
+	if (unlikely(preempt_count_dec_and_test_notrace())) \
 		__preempt_schedule_notrace(); \
 } while (0)
 
@@ -283,7 +294,7 @@ do { \
 #define preempt_enable_notrace() \
 do { \
 	barrier(); \
-	__preempt_count_dec(); \
+	preempt_count_dec_notrace(); \
 } while (0)
 
 #define preempt_check_resched() do { } while (0)
@@ -291,14 +302,14 @@ do { \
 
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
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 515b9d0353c..017549d1f72 100644
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
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 35d043b1933..a940dbe551b 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -663,6 +663,7 @@ config TRACE_BRANCH_PROFILING
 
 choice
 	prompt "Branch Profiling"
+	depends on !DEBUG_PREEMPT
 	default BRANCH_PROFILE_NONE
 	help
 	 The branch profiling is a software profiler. It will add hooks
-- 
2.39.5 (Apple Git-154)


