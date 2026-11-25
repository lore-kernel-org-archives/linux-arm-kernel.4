Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E535B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P1XDencG;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OjRBY/wE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MvZ1Apa0kG0tOQFjdr93l8HqQxxrkaONSQJCjsrGQW8=; b=P1XDencGJfsOx/HoWmqy0rs3on
	kMvjT4VV3PnxYWgD6YiG4Zv4bRv1gub+kPsBel4UDfvzeGI7f1CZ80sAi4zPTp9W28fn2uPeCjf5U
	YoZgjv0fs/ywc2/6/Gyk6NRROPAnAN9JJsRQ1lrDhM/2s/GWLeWOcvGmexUs9TR4CjBHCHv55rDf1
	NoHhst6g6s351xAJfy3yP0N0dbfxoFgMl/inxLU3EwuENBq6GLNK2iPVvMgudZ6i/cnExjS9BE96w
	UR540UlNZoYPnyDuI4aZZTywPp88kKiZ6WPne3DYd9AVomCMQEcK7uVN8NpkQJi1tSGKMeB4SPs8/
	5GlDMbBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Jm-00000008Zwg-295m;
	Wed, 25 Nov 2026 06:17:22 +0000
Received: from mail-ot1-f69.google.com ([209.85.210.69])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Iv-00000008YrE-3kjG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:16:35 +0000
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-847e2926d94so10374496a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587388; x=1796192188; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MvZ1Apa0kG0tOQFjdr93l8HqQxxrkaONSQJCjsrGQW8=;
        b=OjRBY/wEWLvgtLuObPh++Ubo+/U8mx6SVX556fwGuAnOoj+SJizp/vrTUdKyMu0Ift
         eed8boKb4/vuQfeJUs4AeUcH76EIf6yDl6FdNmVbsxz4KOiC5/o/RBlnJfbvsaufqQVx
         bE2WluZgc9XFL38K/SaWznI0khrmODfaiz+sXTWFb6al9pwUBQLppAbT0dR0ubodsABJ
         jSAVDt9G96d2vuyetC482gyZZOdsKOEy6MOeiqnj1V0LYygJyvcYLOxfmiiCMYOMs+nM
         mEFQi7VImnGZ/mtTBK/SBCqTC5aWwNI9IgUXOjgQsTQXb8bpfHvrdHd+7e3Fgn2bneZv
         cO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587388; x=1796192188;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvZ1Apa0kG0tOQFjdr93l8HqQxxrkaONSQJCjsrGQW8=;
        b=WlwQHDE7Xl2uwWa18IGS/BBZ2n/I/ZANAMDhD4/eYjFMQVpoqrzVHLnEwf//+GYVfL
         dzV4U1U6QFpSzn449iL4pNx7q0Yn/frMAf34MOrcO5En7rkFSHBXUO+b07BRFVgxiIWV
         jO+fBuFD8mJvmGaxdOANcW0Xg0z1J1UQ8JmsWv2qkU3mteDxVzZvaDTjNkc4cgoa2N3k
         JuNhOqEBEYEQlkmiVYzP/5pPZCH93d0EyQ9XNofAh6hAzDzTJ/5fBosNF6cEwE3Vw9l/
         /sgY0+xGaizSfXPYOV0XcOybpiGpvMhuvRORa7vefcg/yYeIdJ31nfxSU4J5SODfpdA4
         8FXQ==
X-Forwarded-Encrypted: i=1; AL+hErEI2AOpsDLHnfCtxT2PzyQlW67R1VXRnK81AVtVav33MIIT89KmwzzOGvUtpbeIUNcmpB2s4zuIapJ5J54QQMmU@lists.infradead.org
X-Gm-Message-State: APuU4Z/ULNr3LAZTnOG+V98I4mq4WjQiPR6Qh1B9RYmgIvwFWYDAcwbX
	LvAlYJ6qPfKV4gxxWoQwUB/J5u6XcvmcpjoI/KjWfDKOitwIf13rN0Wq1waSVTiku8lYYxesTej
	4E4B2EQFyXw==
X-Received: from jafo16-n1.prod.google.com ([2002:a05:6639:310:10b0:620:c289:80b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:50a7:b0:571:846e:6f06
 with SMTP id 5614622812f47-57a0a60f070mr19095260b6e.21.1795587387382; Tue, 24
 Nov 2026 22:16:27 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:08 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-16-irogers@google.com>
Subject: [RFC PATCH v2 15/30] arm64: Add DWARF CFI annotations to entry,
 ftrace, EFI, BPF, and KASAN
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_221630_027667_2676C461 
X-CRM114-Status: GOOD (  15.31  )
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

Annotate arm64 hand-written assembly helpers with .cfi_* directives
under CONFIG_UNWINDER_DWARF_CFI so runtime .eh_frame unwinding traverses
call_on_irq_stack(), __efi_rt_asm_wrapper(), return_to_handler() (and
exports ftrace_caller_end), __hwasan_tag_mismatch(), and
arch_bpf_timed_may_goto(), and allow bpf_jit_supports_exceptions() when
CONFIG_UNWINDER_DWARF_CFI is enabled.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/arm64/kernel/efi-rt-wrapper.S  | 22 ++++++++++++++++++
 arch/arm64/kernel/entry-ftrace.S    | 35 ++++++++++++++++++++++++++++-
 arch/arm64/kernel/entry.S           | 22 ++++++++++++++++++
 arch/arm64/lib/kasan_sw_tags.S      | 16 +++++++++++++
 arch/arm64/net/bpf_jit_comp.c       |  9 ++++----
 arch/arm64/net/bpf_timed_may_goto.S | 19 ++++++++++++++++
 6 files changed, 118 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/efi-rt-wrapper.S b/arch/arm64/kernel/efi-rt-wrapper.S
index e8ae803662cf..4ddfa5362e4f 100644
--- a/arch/arm64/kernel/efi-rt-wrapper.S
+++ b/arch/arm64/kernel/efi-rt-wrapper.S
@@ -7,8 +7,19 @@
 #include <asm/assembler.h>
 
 SYM_FUNC_START(__efi_rt_asm_wrapper)
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_startproc
+#endif
 	stp	x29, x30, [sp, #-112]!
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_offset 112
+	.cfi_offset 29, -112
+	.cfi_offset 30, -104
+#endif
 	mov	x29, sp
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_register 29
+#endif
 
 	/*
 	 * Register x18 is designated as the 'platform' register by the AAPCS,
@@ -48,11 +59,19 @@ SYM_FUNC_START(__efi_rt_asm_wrapper)
 
 	mov	x16, sp
 	mov	sp, x29
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_register 31
+#endif
 	str	xzr, [x16, #8]			// clear recorded task SP value
 
 	ldp	x1, x2, [sp, #16]
 	cmp	x2, x18
 	ldp	x29, x30, [sp], #112
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_offset 0
+	.cfi_restore 29
+	.cfi_restore 30
+#endif
 	b.ne	0f
 	ret
 0:
@@ -69,6 +88,9 @@ SYM_FUNC_START(__efi_rt_asm_wrapper)
 #endif
 
 	b	efi_handle_corrupted_x18	// tail call
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_endproc
+#endif
 SYM_FUNC_END(__efi_rt_asm_wrapper)
 
 SYM_CODE_START(__efi_rt_asm_recover)
diff --git a/arch/arm64/kernel/entry-ftrace.S b/arch/arm64/kernel/entry-ftrace.S
index 025140caafe7..d112a29fd1a7 100644
--- a/arch/arm64/kernel/entry-ftrace.S
+++ b/arch/arm64/kernel/entry-ftrace.S
@@ -167,6 +167,7 @@ SYM_INNER_LABEL(ftrace_caller_direct, SYM_L_LOCAL)
 	 */
 	br	x17
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
+SYM_INNER_LABEL(ftrace_caller_end, SYM_L_GLOBAL)
 SYM_CODE_END(ftrace_caller)
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
@@ -327,10 +328,23 @@ SYM_FUNC_END(ftrace_stub_graph)
  *
  * Run ftrace_return_to_handler() before going back to parent.
  * @fp is checked against the value passed by ftrace_graph_caller().
+ *
+ * Under CONFIG_UNWINDER_DWARF_CFI, FREGS_PC is seeded with &return_to_handler
+ * before calling ftrace_return_to_handler(), which then overwrites FREGS_PC
+ * with the restored caller PC prior to invoking return callbacks. Tracking the
+ * return address at FREGS_PC allows kunwind_next_cfi() to unwind cleanly from
+ * inside ftrace_return_to_handler(), graph return callbacks, and interrupts.
  */
 SYM_CODE_START(return_to_handler)
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_startproc
+	.cfi_def_cfa sp, 0
+#endif
 	/* Make room for ftrace_regs */
 	sub	sp, sp, #FREGS_SIZE
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_offset FREGS_SIZE
+#endif
 
 	/* Save return value regs */
 	stp	x0, x1, [sp, #FREGS_X0]
@@ -338,12 +352,24 @@ SYM_CODE_START(return_to_handler)
 	stp	x4, x5, [sp, #FREGS_X4]
 	stp	x6, x7, [sp, #FREGS_X6]
 
-	/* Save the callsite's FP */
+	/* Save the callsite's FP and clear unused LR slot in ftrace_regs */
 	str	x29, [sp, #FREGS_FP]
+	str	xzr, [sp, #FREGS_LR]
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_offset x29, FREGS_FP - FREGS_SIZE
+	adr	x9, return_to_handler
+	add	x10, sp, #FREGS_SIZE
+	str	x10, [sp, #FREGS_SP]
+	str	x9, [sp, #FREGS_PC]
+	.cfi_offset x30, FREGS_PC - FREGS_SIZE
+#endif
 
 	mov	x0, sp
 	bl	ftrace_return_to_handler	// addr = ftrace_return_to_hander(fregs);
 	mov	x30, x0				// restore the original return address
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_same_value x30
+#endif
 
 	/* Restore return value regs */
 	ldp	x0, x1, [sp, #FREGS_X0]
@@ -351,7 +377,14 @@ SYM_CODE_START(return_to_handler)
 	ldp	x4, x5, [sp, #FREGS_X4]
 	ldp	x6, x7, [sp, #FREGS_X6]
 	add	sp, sp, #FREGS_SIZE
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_offset 0
+	.cfi_restore x29
+#endif
 
 	ret
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_endproc
+#endif
 SYM_CODE_END(return_to_handler)
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 8d17f61d1b5b..15a591996307 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -882,6 +882,9 @@ NOKPROBE(ret_from_fork)
  * Calls func(regs) using this CPU's irq stack and shadow irq stack.
  */
 SYM_FUNC_START(call_on_irq_stack)
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_startproc
+#endif
 	save_and_disable_daif x9
 #ifdef CONFIG_SHADOW_CALL_STACK
 	get_current_task x16
@@ -891,7 +894,15 @@ SYM_FUNC_START(call_on_irq_stack)
 
 	/* Create a frame record to save our LR and SP (implicit in FP) */
 	stp	x29, x30, [sp, #-16]!
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_offset 16
+	.cfi_offset 29, -16
+	.cfi_offset 30, -8
+#endif
 	mov	x29, sp
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_register 29
+#endif
 
 	ldr_this_cpu x16, irq_stack_ptr, x17
 
@@ -906,10 +917,21 @@ SYM_FUNC_START(call_on_irq_stack)
 	 * record.
 	 */
 	mov	sp, x29
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_register 31
+#endif
 	ldp	x29, x30, [sp], #16
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_offset 0
+	.cfi_restore 29
+	.cfi_restore 30
+#endif
 	scs_load_current
 	restore_irq x9
 	ret
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_endproc
+#endif
 SYM_FUNC_END(call_on_irq_stack)
 NOKPROBE(call_on_irq_stack)
 
diff --git a/arch/arm64/lib/kasan_sw_tags.S b/arch/arm64/lib/kasan_sw_tags.S
index 20784ce75def..7959b5f3c6b0 100644
--- a/arch/arm64/lib/kasan_sw_tags.S
+++ b/arch/arm64/lib/kasan_sw_tags.S
@@ -38,6 +38,12 @@
  * incremented by 256 prior to return).
  */
 SYM_CODE_START(__hwasan_tag_mismatch)
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_startproc
+	.cfi_def_cfa_offset 256
+	.cfi_offset x29, -24
+	.cfi_offset x30, -16
+#endif
 	bti	c
 	add	x29, sp, #232
 	stp	x2, x3, [sp, #8 * 2]
@@ -66,9 +72,19 @@ SYM_CODE_START(__hwasan_tag_mismatch)
 	ldr	x18, [sp, #8 * 18]
 #endif
 	ldp	x29, x30, [sp, #8 * 29]
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_restore x29
+	.cfi_restore x30
+#endif
 
 	/* remove the structure from the stack */
 	add	sp, sp, #256
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_offset 0
+#endif
 	ret
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_endproc
+#endif
 SYM_CODE_END(__hwasan_tag_mismatch)
 EXPORT_SYMBOL(__hwasan_tag_mismatch)
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 33632fb20997..ee1436295046 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -3489,10 +3489,11 @@ bool bpf_jit_supports_ptr_xchg(void)
 
 bool bpf_jit_supports_exceptions(void)
 {
-	/* We unwind through both kernel frames starting from within bpf_throw
-	 * call and BPF frames. Therefore we require FP unwinder to be enabled
-	 * to walk kernel frames and reach BPF frames in the stack trace.
-	 * ARM64 kernel is always compiled with CONFIG_FRAME_POINTER=y
+	/*
+	 * We unwind through both kernel frames starting from within bpf_throw
+	 * call and BPF frames. Both UNWINDER_FRAME_POINTER and
+	 * UNWINDER_DWARF_CFI preserve x29 across kernel frames and walk
+	 * JITed BPF frame records.
 	 */
 	return true;
 }
diff --git a/arch/arm64/net/bpf_timed_may_goto.S b/arch/arm64/net/bpf_timed_may_goto.S
index f8732b13bb1e..6d0aa023c1f4 100644
--- a/arch/arm64/net/bpf_timed_may_goto.S
+++ b/arch/arm64/net/bpf_timed_may_goto.S
@@ -4,9 +4,20 @@
 #include <linux/linkage.h>
 
 SYM_FUNC_START(arch_bpf_timed_may_goto)
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_startproc
+#endif
 	/* Allocate stack space and emit frame record */
 	stp     x29, x30, [sp, #-96]!
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_offset 96
+	.cfi_offset 29, -96
+	.cfi_offset 30, -88
+#endif
 	mov     x29, sp
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_register 29
+#endif
 
 	/* Save BPF registers R0 - R5 (x8, x0-x4)*/
 	stp	x8, x0, [sp, #16]
@@ -35,6 +46,14 @@ SYM_FUNC_START(arch_bpf_timed_may_goto)
 
 	/* Restore FP and LR */
 	ldp     x29, x30, [sp], #96
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa 31, 0
+	.cfi_restore 29
+	.cfi_restore 30
+#endif
 
 	ret
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_endproc
+#endif
 SYM_FUNC_END(arch_bpf_timed_may_goto)
-- 
2.56.1.831.g720f3f5937-goog


