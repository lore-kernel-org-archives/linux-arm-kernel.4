Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5F3606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 04:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eJNCmCwM;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Trhfne/X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g8r2rmW8mXTC4Y+YUXI9eRvrm7kgFqB9xo4pH3w0HkU=; b=eJNCmCwM2yQFYQqvV4oIz2/GOc
	tXPrrgDgIi4NZsEwQm1jXFtQma/atyp0PSj58TTzRbVUKpzLeMpS5sFRp9/Z1D6TnNoW5fRtR27fk
	PQhMEPasybVB4c0Sy8TKY5Z4V4JJXIjYRNuHEAYyWpaZ51P7lhu2l6kxJvtz6eedqA8qmOxmAYUcm
	+kvwUmwkPaeb7e1cwf63+CkStkrxZRTnPlQqtDZWvhEpbVNdNXFZcEjf+QfqvPYnSNhY5SXbevcrP
	Y2b37G5gSPvdhhmoW59pnnETamN1cLA/uBI1dzKfS5IAVGk+ly+THE3sP10auqr0LOUjICt4ItKXO
	PnUrISBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAvD-00000004YKs-0D9l;
	Tue, 17 Nov 2026 04:35:55 +0000
Received: from mail-pj1-x1045.google.com ([2607:f8b0:4864:20::1045])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAuk-00000004Xwo-2BNL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 04:35:29 +0000
Received: by mail-pj1-x1045.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so2602623a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 20:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890125; x=1795494925; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8r2rmW8mXTC4Y+YUXI9eRvrm7kgFqB9xo4pH3w0HkU=;
        b=Trhfne/Xvj9x+JlCb/lBIStquVuGfnCo9UFedyRzuGFSi7cknEp/5P/h5kHpI8MA7v
         IWz91P7y9SFYODmbebDUjmp3zj+frshz0JmNuL8H0L4Pkz0MqQN41Tlcf3HuUAJNql3K
         jFwiNKfCWCs7PSmqgz9LrTbEFeVgliFB2DAsbKMmzPd2pdJR/oaCwj43qyIeXBHg4bFE
         1VQxiMfJUzpBvP8u/3nmPaZWtB4O3qRCeaeq0cLS7Rn8Gto5eXFy1T/n3pE3SdJ6mon3
         4Sxc0TMqdKwkLDW4Gvb2dRvDNGOBYVivvcMM79bfFrUOblkZQ70GQeq9wuBvJip9IASr
         Mtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890125; x=1795494925;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8r2rmW8mXTC4Y+YUXI9eRvrm7kgFqB9xo4pH3w0HkU=;
        b=KoQltT7xhP9ywq3Mtb2QcN7/B4SPOuOF4H509yUg360CFZ+ASRWwi/FIJjxwhAGvx2
         wLErdySewllUXXbjXFOIeVJgPjrqfl3UX3qsnm1RNb2rLyOIi+V83wJpVjaUANbI/ak8
         r1v/7NUaLQxxmLv5rr5s0wxMPiJd/cUXu6tyv+JGfUBw/jEqdXvmB2vE5L/++vqRbL7s
         RCGTpiHXfTHm7YwivaFddTxMus3djTDEXjIR0AbL76Rtn3LJXFzu4Dmy2TsIJfJs2Mxx
         EiMHkJKk1fV0mXTP9rpu6iIdzR1s29SbR61lz0ck3sXDNYn7JmLSmrXLZuF3JxrjRN55
         pxDQ==
X-Forwarded-Encrypted: i=1; AL+hErGAYj8DeKw//9bcAIccR3XoDfmejclben0xlvzk9j7nFcFT/aYuKP95mKQlcsz3ID9cLJ0yi6kDPDaKuotv05HW@lists.infradead.org
X-Gm-Message-State: APuU4Z/5BNvLqsqQrR2pCrvdAuT73kyB0d2CzInsMz3CtxCcKNwi79v8
	9GuBmWTMDC9y4L9wqeNFoZSGYWtQjVWILjmydhvEv9RZfwmxHYqfLn1v+JLM35yJdeI1lirXJVf
	vOgr5RJ1TmCfi1VBcf6q3b1Hejg==
X-Received: from pjto7.prod.google.com ([2002:a17:90a:c707:b0:3b3:b6df:b0be])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3f50:b0:3b0:a1af:e4fc with SMTP id 98e67ed59e1d1-3b1b0d984bcmr13134201a91.63.1794890124572;
 Mon, 16 Nov 2026 20:35:24 -0800 (PST)
Date: Tue, 17 Nov 2026 04:35:04 +0000
In-Reply-To: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117043504.1021063-13-dylanbhatch@google.com>
Subject: [RFC PATCH 12/12] unwind: arm64: use .lr_unwind to unwind interrupt frames
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Weinan Liu <wnliu@google.com>, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Indu Bhagat <ibhagatgnu@gmail.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, live-patching@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_203526_571063_89335545 
X-CRM114-Status: GOOD (  21.20  )
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

Add kunwind_next_regs_lr_unwind() to unwind across pt_regs exception
boundaries using .lr_unwind mode and SP-offset metadata (live x30, [x29]
frame record, or [sp + sp_off] frame record), falling back to
frame-pointer unwinding and marking the stacktrace unreliable on
failure.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/kernel/stacktrace.c | 85 ++++++++++++++++++++++++++++++----
 1 file changed, 75 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 3ebcf8c53fb04..842555a4a3fe2 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -10,6 +10,7 @@
 #include <linux/filter.h>
 #include <linux/ftrace.h>
 #include <linux/kprobes.h>
+#include <linux/overflow.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
@@ -17,6 +18,7 @@
 
 #include <asm/efi.h>
 #include <asm/irq.h>
+#include <asm/lr_unwind.h>
 #include <asm/stack_pointer.h>
 #include <asm/stacktrace.h>
 
@@ -26,6 +28,7 @@ enum kunwind_source {
 	KUNWIND_SOURCE_CALLER,
 	KUNWIND_SOURCE_TASK,
 	KUNWIND_SOURCE_REGS_PC,
+	KUNWIND_SOURCE_REGS_LR,
 };
 
 union unwind_flags {
@@ -45,6 +48,7 @@ union unwind_flags {
  * @kr_cur:      When KRETPROBES is selected, holds the kretprobe instance
  *               associated with the most recently encountered replacement lr
  *               value.
+ * @unreliable:  Stacktrace is unreliable.
  */
 struct kunwind_state {
 	struct unwind_state common;
@@ -56,6 +60,7 @@ struct kunwind_state {
 	enum kunwind_source source;
 	union unwind_flags flags;
 	struct pt_regs *regs;
+	bool unreliable;
 };
 
 static __always_inline void
@@ -67,6 +72,7 @@ kunwind_init(struct kunwind_state *state,
 	state->source = KUNWIND_SOURCE_UNKNOWN;
 	state->flags.all = 0;
 	state->regs = NULL;
+	state->unreliable = false;
 }
 
 /*
@@ -181,7 +187,6 @@ int kunwind_next_regs_pc(struct kunwind_state *state)
 	state->regs = regs;
 	state->common.pc = regs->pc;
 	state->common.fp = regs->regs[29];
-	state->regs = NULL;
 	state->source = KUNWIND_SOURCE_REGS_PC;
 	return 0;
 }
@@ -244,6 +249,65 @@ kunwind_next_frame_record(struct kunwind_state *state)
 	return 0;
 }
 
+#ifdef CONFIG_ARM64_LR_UNWIND
+
+/*
+ * Unwind from a pt_regs according to .lr_unwind info.
+ */
+static __always_inline int
+kunwind_next_regs_lr_unwind(struct kunwind_state *state)
+{
+	struct pt_regs *regs = state->regs;
+	enum lr_unwind_mode mode;
+	unsigned int sp_off;
+	unsigned long fp;
+	int err;
+
+	if (WARN_ON_ONCE(state->source != KUNWIND_SOURCE_REGS_PC))
+		return -EINVAL;
+	if (WARN_ON_ONCE(!regs))
+		return -EINVAL;
+
+	state->regs = NULL;
+
+	err = lr_unwind_find(state->common.pc, &mode, &sp_off);
+	if (err) {
+		/* Fallback to FP based unwinder */
+		state->unreliable = true;
+		return kunwind_next_frame_record(state);
+	}
+
+	switch (mode) {
+	case LR_UNWIND_LIVE:
+		if (state->common.fp & 0x7)
+			return -EINVAL;
+		state->common.pc = regs->regs[30];
+		state->source = KUNWIND_SOURCE_REGS_LR;
+		return 0;
+	case LR_UNWIND_FP:
+		return kunwind_next_frame_record(state);
+	case LR_UNWIND_SP:
+		if (check_add_overflow(regs->sp, (unsigned long)sp_off, &fp))
+			return -EINVAL;
+		state->common.fp = fp;
+		return kunwind_next_frame_record(state);
+	default:
+		return -EINVAL;
+	}
+}
+
+#else /* !CONFIG_ARM64_LR_UNWIND */
+
+static __always_inline int
+kunwind_next_regs_lr_unwind(struct kunwind_state *state)
+{
+	state->regs = NULL;
+	state->unreliable = true;
+	return kunwind_next_frame_record(state);
+}
+
+#endif /* CONFIG_ARM64_LR_UNWIND */
+
 /*
  * Unwind from one frame record (A) to the next frame record (B).
  *
@@ -259,10 +323,13 @@ kunwind_next(struct kunwind_state *state)
 	state->flags.all = 0;
 
 	switch (state->source) {
+	case KUNWIND_SOURCE_REGS_PC:
+		err = kunwind_next_regs_lr_unwind(state);
+		break;
 	case KUNWIND_SOURCE_FRAME:
 	case KUNWIND_SOURCE_CALLER:
 	case KUNWIND_SOURCE_TASK:
-	case KUNWIND_SOURCE_REGS_PC:
+	case KUNWIND_SOURCE_REGS_LR:
 		err = kunwind_next_frame_record(state);
 		break;
 	default:
@@ -294,7 +361,7 @@ do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
 			return -EINVAL;
 		ret = kunwind_next(state);
 		if (ret == -ENOENT)
-			return 0;
+			return state->unreliable ? -EINVAL : 0;
 		if (ret < 0)
 			return ret;
 	}
@@ -394,14 +461,11 @@ static __always_inline bool
 arch_reliable_kunwind_consume_entry(const struct kunwind_state *state, void *cookie)
 {
 	/*
-	 * At an exception boundary we can reliably consume the saved PC. We do
-	 * not know whether the LR was live when the exception was taken, and
-	 * so we cannot perform the next unwind step reliably.
-	 *
-	 * All that matters is whether the *entire* unwind is reliable, so give
-	 * up as soon as we hit an exception boundary.
+	 * If unwinding across an exception boundary fell back to frame-pointer
+	 * unwinding without a valid .lr_unwind entry, the caller frame may
+	 * have been skipped or duplicated. Abort reliable stack walks.
 	 */
-	if (state->source == KUNWIND_SOURCE_REGS_PC)
+	if (state->unreliable)
 		return false;
 
 	return arch_kunwind_consume_entry(state, cookie);
@@ -452,6 +516,7 @@ static const char *state_source_string(const struct kunwind_state *state)
 	case KUNWIND_SOURCE_CALLER:	return "C";
 	case KUNWIND_SOURCE_TASK:	return "T";
 	case KUNWIND_SOURCE_REGS_PC:	return "P";
+	case KUNWIND_SOURCE_REGS_LR:	return "L";
 	default:			return "U";
 	}
 }
-- 
2.56.0.679.gc527c65306-goog


