Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79608606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y09Hbd89;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NKWKxza3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vA+hkqkTbHX9a8DOepJDZfPRSPWPvv4RpwYIaThVROM=; b=y09Hbd895DcLc4WLzbrEW6kqx3
	+lNzSRyqGR85woQyO2ZcWCxsz4Fj2re7GOo/OfM//S5IqTQN9IwIJMVwfxDeqOLLRdhrGolPYlRe5
	54iHLWN6w/ojohnM1GIezbQyNRIHWoyyWrK2I55mGrMYH9v+R8OqSY9E2oXDjZX04IIZxLW9BFpIj
	6XbpFKPzgcrkuQJwbWPNDRvcw3UyjVHTadhdgDWA1Ry+dMLY3xO0NwJZHf1+bM60mZgAxmwe+a5Px
	y8+jB+9UraNNrGVmkTt97rqr5njfCgPsns8L0yMaQ85/Hsn8QGJ0THKi2rtoMtgG3YjsXSMf8Lbs6
	PA6GkO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8c8-00000004N7z-28Yc;
	Tue, 17 Nov 2026 02:08:04 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bH-00000004MTa-2tCj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:07:15 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cddc4bde4adso1879338a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881230; x=1795486030; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vA+hkqkTbHX9a8DOepJDZfPRSPWPvv4RpwYIaThVROM=;
        b=NKWKxza32vyJu2ZmfxhyE5XrTyTUd/fYlhjBrBhGuGIUBssjZfmV+n8I6+KDpIXIgb
         jt/i0zBqZwsucIUCkeGfzwPNxtN0FgFHW7Qv2sVJ6ztK3PKBZwtNGe57Rma+cG6t+O8z
         vHdAYgBn12xZXuNLBw4TFXuezluRk8y100iLVOQXrw+Xn2CWJt/JnbYxk217uNBN1s8U
         nC093K31qgjGJm3mDJFVTTvoLjM8VtYZUMM/GKgdZD+y/Y39e9T3KKVhYlbTk2Ir6xOq
         DE1ploIzDorO1qSz5WdLqsci42LWjyB/sSAlvfScgSJAnyIz3a3N7QhswiNVpLKpSXi7
         VD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881230; x=1795486030;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vA+hkqkTbHX9a8DOepJDZfPRSPWPvv4RpwYIaThVROM=;
        b=VvoE+FM96z0GzPltTOiDfOvASTqLk8iliQrHb88rshNTcqBX/ro1gxdjtFXv4Z4EN7
         UEldoB7XT4vtCv8BwaJdaHLfYTDeUacXNSNfkDLctdRQnUCPp5CkJjmPzOaruWPyecaQ
         vrcvawKg+dbr8nL7PyEnZO6NdQaKSS755DiiUYKF5vH6XooT5LrRI6dzrdDSefdAT3Pi
         Zrn024ZQmmfzQMH9+HgNrhqPWBvbfl5KmgJmm5IrKJ37E5p4Xnax0jB2Vo+igmOQKtD5
         b0cEBwLnHCUQO1xCjjcDRHHi+j8uCgH8lxRWi0xmiRQcGlrhDxNt3E3A6pqv/uBUkve9
         P0Ew==
X-Forwarded-Encrypted: i=1; AL+hErGqn1uU2cpDtCFPHuQaXq7TKRwTAUNnEdqZ/YLUUEvssxbUp29QuimKr7f2pIbfzWeP+5uEacpO6uU6jobEvRub@lists.infradead.org
X-Gm-Message-State: APuU4Z8nqazRSUVjbsrEdU5EttDQDR/4YJUxNB7Pn+HgWTyRKNA9quXA
	Cs/CEsGYAwK3kYES50aSqu/VsRMEB9hhFoWwnxhGF0hm8Xw9/926DbXA0MBmkOgvs5ubxky526K
	inVmYtWgBbNYkGxwuVjy1GK6O9Q==
X-Received: from pgjk8-n1.prod.google.com ([2002:a05:6a02:81c8:10b0:cdb:932c:948b])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7e05:b0:3e2:b85c:4b2a with SMTP id adf61e73a8af0-3f7a8fe1586mr9088034637.73.1794881229362;
 Mon, 16 Nov 2026 18:07:09 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:48 +0000
In-Reply-To: <20261117020648.323464-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117020648.323464-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117020648.323464-12-dylanbhatch@google.com>
Subject: [PATCH v9 11/11] unwind: arm64: Use sframe to unwind interrupt frames
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_180711_775643_7545F332 
X-CRM114-Status: GOOD (  28.70  )
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

Add kunwind_next_regs_sframe() function to unwind by sframe info if
present. Use this method at exception boundaries, falling back to
frame-pointer unwind only on failure. In such failure cases, the
stacktrace is considered unreliable. During normal unwind, prefer frame
pointer unwind (for better performance).

This change restores the LR behavior originally introduced in commit
c2c6b27b5aa14fa2 ("arm64: stacktrace: unwind exception boundaries"),
But later removed in commit 32ed1205682e ("arm64: stacktrace: Skip
reporting LR at exception boundaries")

This can be done because the sframe data can be used to determine
whether the LR is current for the PC value recovered from pt_regs at the
exception boundary.

Co-developed-by: Weinan Liu <wnliu@google.com>
Signed-off-by: Weinan Liu <wnliu@google.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v8:
 - (sashiko) Restrict SFrame unwinding at KUNWIND_SOURCE_REGS_PC to real
   on-stack FRAME_META_TYPE_PT_REGS exception frames so synthetic pt_regs
   fall back to frame-pointer unwinding.
 - (sashiko) Remove invalid cross-stack 'fp < sp' check in
   UNWIND_CFA_RULE_FP_OFFSET and enforce 8-byte alignment in get_word().
 - (sashiko) Propagate state->unreliable when kunwind_next() terminates
   with -ENOENT in do_kunwind().
---
 arch/arm64/kernel/stacktrace.c | 211 +++++++++++++++++++++++++++++++--
 1 file changed, 198 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 3ebcf8c53fb04..e876af54a4055 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -13,6 +13,7 @@
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
+#include <linux/sframe.h>
 #include <linux/stacktrace.h>
 
 #include <asm/efi.h>
@@ -26,6 +27,7 @@ enum kunwind_source {
 	KUNWIND_SOURCE_CALLER,
 	KUNWIND_SOURCE_TASK,
 	KUNWIND_SOURCE_REGS_PC,
+	KUNWIND_SOURCE_REGS_LR,
 };
 
 union unwind_flags {
@@ -45,6 +47,7 @@ union unwind_flags {
  * @kr_cur:      When KRETPROBES is selected, holds the kretprobe instance
  *               associated with the most recently encountered replacement lr
  *               value.
+ * @unreliable:  Stacktrace is unreliable.
  */
 struct kunwind_state {
 	struct unwind_state common;
@@ -56,6 +59,7 @@ struct kunwind_state {
 	enum kunwind_source source;
 	union unwind_flags flags;
 	struct pt_regs *regs;
+	bool unreliable;
 };
 
 static __always_inline void
@@ -80,12 +84,31 @@ static __always_inline void
 kunwind_init_from_regs(struct kunwind_state *state,
 		       struct pt_regs *regs)
 {
+	struct stack_info *info;
+
 	kunwind_init(state, current);
 
-	state->regs = regs;
 	state->common.fp = regs->regs[29];
 	state->common.pc = regs->pc;
 	state->source = KUNWIND_SOURCE_REGS_PC;
+
+	/*
+	 * Synthetic pt_regs (e.g. from perf_fetch_caller_regs() or
+	 * ftrace_fill_perf_regs()) do not have a full register state
+	 * consistent with regs->pc and cannot be unwound with SFrame.
+	 * Real exception pt_regs have FRAME_META_TYPE_PT_REGS.
+	 */
+	if (!regs->stackframe.record.fp && !regs->stackframe.record.lr &&
+	    regs->stackframe.type == FRAME_META_TYPE_PT_REGS) {
+		info = unwind_find_stack(&state->common, (unsigned long)regs,
+					 sizeof(*regs));
+		if (info) {
+			unwind_consume_stack(&state->common, info,
+					     (unsigned long)regs,
+					     sizeof(*regs));
+			state->regs = regs;
+		}
+	}
 }
 
 /*
@@ -181,7 +204,6 @@ int kunwind_next_regs_pc(struct kunwind_state *state)
 	state->regs = regs;
 	state->common.pc = regs->pc;
 	state->common.fp = regs->regs[29];
-	state->regs = NULL;
 	state->source = KUNWIND_SOURCE_REGS_PC;
 	return 0;
 }
@@ -244,6 +266,163 @@ kunwind_next_frame_record(struct kunwind_state *state)
 	return 0;
 }
 
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+
+static __always_inline struct stack_info *
+get_word(struct unwind_state *state, unsigned long *word)
+{
+	unsigned long addr = *word;
+	struct stack_info *info;
+
+	if (addr & 0x7)
+		return NULL;
+
+	info = unwind_find_stack(state, addr, sizeof(addr));
+	if (!info)
+		return info;
+
+	*word = READ_ONCE(*(unsigned long *)addr);
+
+	return info;
+}
+
+static __always_inline int
+get_consume_word(struct unwind_state *state, unsigned long *word)
+{
+	struct stack_info *info;
+	unsigned long addr = *word;
+
+	info = get_word(state, word);
+	if (!info)
+		return -EINVAL;
+
+	unwind_consume_stack(state, info, addr, sizeof(addr));
+	return 0;
+}
+
+/*
+ * Unwind from a pt_regs according to sframe.
+ */
+static __always_inline int
+kunwind_next_regs_sframe(struct kunwind_state *state)
+{
+	struct unwind_frame frame;
+	unsigned long cfa, fp, ra;
+	enum kunwind_source source = KUNWIND_SOURCE_FRAME;
+	struct pt_regs *regs = state->regs;
+
+	int err;
+
+	if (WARN_ON_ONCE(state->source != KUNWIND_SOURCE_REGS_PC))
+		return -EINVAL;
+	if (WARN_ON_ONCE(!state->regs))
+		return -EINVAL;
+
+	/* FP/SP alignment 8 bytes */
+	if (state->common.fp & 0x7)
+		return -EINVAL;
+
+	err = sframe_find(state->common.pc, &frame);
+	if (err)
+		return -EINVAL;
+
+	/*
+	 * A kernel unwind should always end at a FRAME_META_TYPE_FINAL
+	 * frame. There should be no outermost frames within the kernel.
+	 */
+	if (frame.outermost)
+		return -EINVAL;
+
+	/* Get the Canonical Frame Address (CFA) */
+	switch (frame.cfa.rule) {
+	case UNWIND_CFA_RULE_SP_OFFSET:
+		cfa = state->regs->sp;
+		break;
+	case UNWIND_CFA_RULE_FP_OFFSET:
+		cfa = state->common.fp;
+		break;
+	/*
+	 * UNWIND_CFA_RULE_REG_OFFSET and UNWIND_CFA_RULE_REG_OFFSET_DEREF not
+	 * implemented -- flexible FDEs are not currently generated by assembler
+	 * for arm64.
+	 */
+	default:
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+	cfa += frame.cfa.offset;
+
+	/* CFA alignment 16 bytes */
+	if (cfa & 0xf)
+		return -EINVAL;
+
+	/*
+	 * Consume RA and FP from the stack. The frame record puts FP at a lower
+	 * address than RA, so we read FP first.
+	 */
+	switch (frame.fp.rule) {
+	case UNWIND_RULE_RETAIN:
+		fp = state->common.fp;
+		break;
+	/*
+	 * UNWIND_RULE_CFA_OFFSET is currently not used for FP
+	 * (e.g. SFrame cannot represent this rule).
+	 */
+	case UNWIND_RULE_CFA_OFFSET_DEREF:
+		fp = cfa + frame.fp.offset;
+		if (!get_word(&state->common, &fp))
+			return -EINVAL;
+		break;
+	/*
+	 * UNWIND_RULE_REG_OFFSET and UNWIND_RULE_REG_OFFSET_DEREF not
+	 * implemented -- flexible FDEs are not currently generated by assembler
+	 * for arm64.
+	 */
+	default:
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+
+	switch (frame.ra.rule) {
+	case UNWIND_RULE_RETAIN:
+		ra = regs->regs[30];
+		source = KUNWIND_SOURCE_REGS_LR;
+		break;
+
+	/*
+	 * UNWIND_RULE_CFA_OFFSET doesn't make sense for RA.
+	 * The return address cannot legitimately be a stack address.
+	 */
+	case UNWIND_RULE_CFA_OFFSET_DEREF:
+		ra = cfa + frame.ra.offset;
+		if (get_consume_word(&state->common, &ra))
+			return -EINVAL;
+		break;
+	/*
+	 * UNWIND_RULE_REG_OFFSET and UNWIND_RULE_REG_OFFSET_DEREF not
+	 * implemented -- flexible FDEs are not currently generated by assembler
+	 * for arm64.
+	 */
+	default:
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+
+	state->common.pc = ra;
+	state->common.fp = fp;
+
+	state->source = source;
+
+	return 0;
+}
+
+#else /* !CONFIG_HAVE_UNWIND_KERNEL_SFRAME */
+
+static __always_inline int
+kunwind_next_regs_sframe(struct kunwind_state *state) { return -EINVAL; }
+
+#endif /* !CONFIG_HAVE_UNWIND_KERNEL_SFRAME*/
+
 /*
  * Unwind from one frame record (A) to the next frame record (B).
  *
@@ -259,10 +438,23 @@ kunwind_next(struct kunwind_state *state)
 	state->flags.all = 0;
 
 	switch (state->source) {
+	case KUNWIND_SOURCE_REGS_PC:
+		if (state->regs)
+			err = kunwind_next_regs_sframe(state);
+		else
+			err = -EINVAL;
+
+		if (err) {
+			/* Fallback to FP based unwinder */
+			err = kunwind_next_frame_record(state);
+			state->unreliable = true;
+		}
+		state->regs = NULL;
+		break;
 	case KUNWIND_SOURCE_FRAME:
 	case KUNWIND_SOURCE_CALLER:
 	case KUNWIND_SOURCE_TASK:
-	case KUNWIND_SOURCE_REGS_PC:
+	case KUNWIND_SOURCE_REGS_LR:
 		err = kunwind_next_frame_record(state);
 		break;
 	default:
@@ -294,7 +486,7 @@ do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
 			return -EINVAL;
 		ret = kunwind_next(state);
 		if (ret == -ENOENT)
-			return 0;
+			return state->unreliable ? -EINVAL : 0;
 		if (ret < 0)
 			return ret;
 	}
@@ -393,15 +585,7 @@ noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
 static __always_inline bool
 arch_reliable_kunwind_consume_entry(const struct kunwind_state *state, void *cookie)
 {
-	/*
-	 * At an exception boundary we can reliably consume the saved PC. We do
-	 * not know whether the LR was live when the exception was taken, and
-	 * so we cannot perform the next unwind step reliably.
-	 *
-	 * All that matters is whether the *entire* unwind is reliable, so give
-	 * up as soon as we hit an exception boundary.
-	 */
-	if (state->source == KUNWIND_SOURCE_REGS_PC)
+	if (state->unreliable)
 		return false;
 
 	return arch_kunwind_consume_entry(state, cookie);
@@ -452,6 +636,7 @@ static const char *state_source_string(const struct kunwind_state *state)
 	case KUNWIND_SOURCE_CALLER:	return "C";
 	case KUNWIND_SOURCE_TASK:	return "T";
 	case KUNWIND_SOURCE_REGS_PC:	return "P";
+	case KUNWIND_SOURCE_REGS_LR:	return "L";
 	default:			return "U";
 	}
 }
-- 
2.56.0.679.gc527c65306-goog


