Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B18F606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1h98o6gS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WeFcb+CC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TL91F9v5y+iVASSEgSyoU/mO9eBJEE/mzexNJMkj6kw=; b=1h98o6gS5TFet+
	Ov3ro2NgfwS7/JCU7agO/iNy+EewCrYyuYEm0OjvBzetvC7VawqvhZtw9dUCy479MrxpWwG7SfAq9
	eGstK1lAwXiA6AcXuqQ0IJseGQi3PeSe5jZ2gj+Bu56z1i+E2FuTMn3/9++bxwMxrSW8VuG54Q8sB
	tWXEPaWpjNVKpvAJkFIZEETMNPmTooh9FLswlK4XNMHDFGrO5J2vhQUN5vtBA9IWkquzN6AsQ4hRh
	YWf2h4GcBqVtHKn9EDUV9+JvYr0HfVqQs1P90y3bM8/WjBr4kVlajHP9dscxWTfN/FtVut6HM+oV3
	H0+U0Gp88bjhSnWgQoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1Tq-0000000Et0A-2tN9;
	Sat, 14 Nov 2026 00:18:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1Tn-0000000EszJ-16tb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 00:18:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1D0341AEC;
	Sat, 14 Nov 2026 00:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52901F000C5;
	Sat, 14 Nov 2026 00:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794615530;
	bh=TL91F9v5y+iVASSEgSyoU/mO9eBJEE/mzexNJMkj6kw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WeFcb+CC/wJSw0oC3ElbhSPB6pyEvS0JvHHC0leghOZ6kDbQdkDWci/m30NbEX6qx
	 qEEi8ql/TtMK0sFL3QBfLWWtMWNgQTZ3SzRpWNNLRvz1Lm+qsyBV6DuJ8sZU3+iJBr
	 0/0CGRfTYqTctISkH5WD20tnV+38papDstKGpqDBHPxPXVevdJGvp4xLSWn0xlCTUF
	 ITCKKAuAierlgiIUDLMrtbPqWrZ2Ntvn7Mv6zJhuoRqDuVzRpjnPULzbjlIv/GKbvg
	 FruZZwJL7xQ4FVyb1YPEPxcYfBbOf0SMNZmDeSJqOlIaLybT4dGyzt5G/Tjohdnqz1
	 j8c6wuZvb1kmQ==
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
Subject: [PATCH bpf-next 1/3] arm64: perf: Don't report the caller twice in caller-regs callchains
Date: Fri, 13 Nov 2026 16:18:44 -0800
Message-ID: <20261114001846.873499-2-andrii@kernel.org>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261114001846.873499-1-andrii@kernel.org>
References: <20261114001846.873499-1-andrii@kernel.org>
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
the function it is used in (CALLER_ADDR0), but points regs->regs[29]
at that function's own frame record, whose saved LR is that same
return address. perf_callchain_kernel() reports regs->pc and then
unwinds from the frame record at x29, so the caller shows up twice at
the top of every kernel callchain built from perf_fetch_caller_regs():
tracepoint events, software events emitted by __perf_sw_event_sched()
(context-switches, cgroup-switches, cpu-migrations), and
bpf_get_stack() and bpf_get_stackid() in tracepoint, raw tracepoint,
tp_btf and fentry/fexit programs. E.g., for a tracepoint program
attached to sched_process_fork:

  __traceiter_sched_process_fork+0x44
  __traceiter_sched_process_fork+0x44
  kernel_clone+0x250
  ...

Use __builtin_frame_address(1), the caller's frame record, the same
way kunwind_init_from_caller() does, so that pc and x29 describe the
same frame.

x86 had the same duplicate entry, fixed by commit 6d08340d1e35
("Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"").

Fixes: 5b09a094f2fb ("arm64: perf: Fix callchain parse error with kernel tracepoint events")
Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
---
 arch/arm64/include/asm/perf_event.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
index ee45b4e77347..13efb46f0fe8 100644
--- a/arch/arm64/include/asm/perf_event.h
+++ b/arch/arm64/include/asm/perf_event.h
@@ -15,7 +15,7 @@
 
 #define perf_arch_fetch_caller_regs(regs, __ip) { \
 	(regs)->pc = (__ip);    \
-	(regs)->regs[29] = (unsigned long) __builtin_frame_address(0); \
+	(regs)->regs[29] = (unsigned long) __builtin_frame_address(1); \
 	(regs)->sp = current_stack_pointer; \
 	(regs)->pstate = PSR_MODE_EL1h;	\
 }
-- 
2.53.1-Meta


