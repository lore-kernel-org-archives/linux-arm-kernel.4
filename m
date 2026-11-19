Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C74606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 00:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r7NmEFTK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=msKGQpQA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=trtLB8r/fahuF36Shh8QQA5qcdNHOIUos7dZSGhQIc0=; b=r7NmEFTK+2Ed/Y
	r16+/8c8W69MkncDIhuLCAU4KbkThRpD3ktwCKScP3XG1NPEfUaRnNHk6tTaa8LbAEYD103xMSVOY
	XUeUR6HJMy8gdEep2S/2l1FwlwvWf6c15zJnRS46/sr0nvP06caVngS9s0BBVUFazja111Ooxn0wh
	+Ktel2V/cQxXIWNpUmQuLmS9CO95XRckU1KON4oKZ+vjbHEBNqd76oxcvfeOcPfhrtIR8MvFMcpk2
	Je7O4IXoEOsF4YNvzNVpu4MWhoU9q4h1lFRsw9ZC6YDaDnappQ63xTG0UY1OKAFu0ISmnvWpceiGu
	tbCCHqS6EupBuxQcxyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpac-0000000AXj2-2QXe;
	Thu, 19 Nov 2026 00:01:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpaY-0000000AXgc-1Wwg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 00:01:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C6A7661EED;
	Thu, 19 Nov 2026 00:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564661F000C7;
	Thu, 19 Nov 2026 00:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795046477;
	bh=trtLB8r/fahuF36Shh8QQA5qcdNHOIUos7dZSGhQIc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=msKGQpQA4zGhpTkU4DYSGrlvG9EZ0L/9/Q/c06KlytxgCaP5otPzjjk65baBYc5dp
	 KLeKiSrQobgEB6ZA+Py9fK+eH+WiseD/Pg/2ZJzcwhTnYf/oxt9RrEfEfL2PhFSzB4
	 HddT0xi4S930mhMXBPUjLBFrTFBGBwVG8uSePGyarJmx/ZMfqKelwS1Jqyz5Qv8PBp
	 tAmeASJm3sz+W3TRMHSn+baltActGQp/uBZ2+NR9Lfbqc+5pvbSVoffnhui31xcsVV
	 PtpVXyKwvhWiSN0bFks+EALUTCNn+H4CNfMr9iI1jo9tzEGsGMIcZWe0SnjIULO2L8
	 wQ4c1kimiiqyQ==
From: Andrii Nakryiko <andrii@kernel.org>
To: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	peterz@infradead.org,
	jolsa@kernel.org,
	rostedt@goodmis.org,
	Andrii Nakryiko <andrii@kernel.org>
Subject: [PATCH bpf-next v2 1/3] arm64: perf: Don't report the caller twice in caller-regs callchains
Date: Wed, 18 Nov 2026 16:01:10 -0800
Message-ID: <20261119000112.2377949-2-andrii@kernel.org>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261119000112.2377949-1-andrii@kernel.org>
References: <20261119000112.2377949-1-andrii@kernel.org>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

perf_arch_fetch_caller_regs() sets regs->pc to the return address of
the function it is used in (CALLER_ADDR0) and points regs->regs[29] at
that function's own frame record, whose saved LR is that same return
address. perf_callchain_kernel() reports regs->pc and then unwinds from
the frame record at x29, so the caller shows up twice at the top of
every kernel callchain built from perf_fetch_caller_regs(): tracepoint
events, software events emitted by __perf_sw_event_sched()
(context-switches, cgroup-switches, cpu-migrations), and
bpf_get_stack() and bpf_get_stackid() in tracepoint, raw tracepoint,
tp_btf and fentry/fexit programs. E.g., for a tracepoint program
attached to sched_process_fork:

  __traceiter_sched_process_fork+0x44
  __traceiter_sched_process_fork+0x44
  kernel_clone+0x250
  ...

x86 tells such regs apart in perf_callchain_kernel() with
perf_hw_regs(): perf_arch_fetch_caller_regs() sets regs->flags to 0,
while hardware-saved RFLAGS always has X86_EFLAGS_FIXED set, and
regs->ip is not reported for regs that fail the check.

Do the same on arm64. Set pstate to PSR_MODE_EL1t, which exceptions
taken from the kernel never have (the kernel runs in EL1h, or EL2h
with VHE), and skip the leaf regs->pc in perf_callchain_kernel() for
regs with that mode. The unwind still starts from regs, with the frame
record at x29 walked by the unwinder.

regs->pstate of software events emitted by __perf_sw_event_sched(),
which BPF perf_event programs see in bpf_perf_event_data::regs, changes
from PSR_MODE_EL1h to PSR_MODE_EL1t.

x86 had the same duplicate entry, fixed by commit 6d08340d1e35
("Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"").

Fixes: 5b09a094f2fb ("arm64: perf: Fix callchain parse error with kernel tracepoint events")
Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
---
 arch/arm64/include/asm/perf_event.h |  2 +-
 arch/arm64/kernel/perf_callchain.c  | 33 ++++++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
index ee45b4e77347..b3e7c24a5aab 100644
--- a/arch/arm64/include/asm/perf_event.h
+++ b/arch/arm64/include/asm/perf_event.h
@@ -17,7 +17,7 @@
 	(regs)->pc = (__ip);    \
 	(regs)->regs[29] = (unsigned long) __builtin_frame_address(0); \
 	(regs)->sp = current_stack_pointer; \
-	(regs)->pstate = PSR_MODE_EL1h;	\
+	(regs)->pstate = PSR_MODE_EL1t;	\
 }
 
 #endif
diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
index 9b7f26b128b5..3e956c4b0798 100644
--- a/arch/arm64/kernel/perf_callchain.c
+++ b/arch/arm64/kernel/perf_callchain.c
@@ -28,6 +28,31 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 	arch_stack_walk_user(callchain_trace, entry, regs);
 }
 
+/*
+ * Determine whether the regs were taken from an exception handler rather than
+ * from perf_arch_fetch_caller_regs().
+ */
+static bool perf_hw_regs(struct pt_regs *regs)
+{
+	return (regs->pstate & PSR_MODE_MASK) != PSR_MODE_EL1t;
+}
+
+struct caller_regs_callchain {
+	struct perf_callchain_entry_ctx *entry;
+	bool skip_leaf;
+};
+
+static bool caller_regs_callchain_trace(void *data, unsigned long pc)
+{
+	struct caller_regs_callchain *cc = data;
+
+	if (cc->skip_leaf) {
+		cc->skip_leaf = false;
+		return true;
+	}
+	return callchain_trace(cc->entry, pc);
+}
+
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
@@ -36,5 +61,11 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 		return;
 	}
 
-	arch_stack_walk(callchain_trace, entry, current, regs);
+	if (perf_hw_regs(regs)) {
+		arch_stack_walk(callchain_trace, entry, current, regs);
+	} else {
+		struct caller_regs_callchain cc = { .entry = entry, .skip_leaf = true };
+
+		arch_stack_walk(caller_regs_callchain_trace, &cc, current, regs);
+	}
 }
-- 
2.53.1-Meta


