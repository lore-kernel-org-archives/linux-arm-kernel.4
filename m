Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232D0606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3nFY1WXh;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ibLttQ2f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4H9SESbbRGSoAq2gQL4B9mysuCtb/u5ZBxs535NDDIs=; b=3nFY1WXhf50XVTyJ1Yd1fUsGPM
	Eg0clAzYKZ2Qpk3z5t3EsUFS9u7ZFZUHVzmRlzJpITBxVmN3QaKd1LcKAbRFc9RyxbnZUd+vNxGPZ
	xcGl+ghTJOWYxPSKcxD4s+UPje+CqoPMGLJPtoUwg7WZO269tdxHSXAc49FebyxNGGnoykgqiM1Id
	U7POkqNKG6KHLuSHtj+BNpj+sH+c7VBBO86hZD6Ds6TYxrY4rnjCLx9Sai7hoEEvWY3QlF2gyX53a
	ZkIHRX3XaeyZAdwrUmmm6Ta+9OOwW9jqdYTVvL335bDLlQfHCp6182NXV+xWgJ9uxWl/S7Ozr//qj
	8ctawk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bw-00000004N3O-01mV;
	Tue, 17 Nov 2026 02:07:52 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bE-00000004MQ6-1cr5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:07:10 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2ed08904845so25626435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881227; x=1795486027; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4H9SESbbRGSoAq2gQL4B9mysuCtb/u5ZBxs535NDDIs=;
        b=ibLttQ2f2/ZJbo4WD1aGri1kENP2Nq8R5wZ7qM7eNKd+d+tg4w+8mV7V0TZvp6KKYm
         Jc0vPt1jP68DgY5dNVxYLqf/a+qo34lkyPsZ0JQJhWBC2o4hV4qgQAUNTG5ov2vOmvhz
         bboPLkj6lJKE+/VRYE1qUOLlB6edwgE5vrjXGacKUaFqxe9j22rpi5aKqG29XhJzZij0
         Vuijjne9+i1pXp5Zi+ntALTHBCY53+dbRwclKoY2ytRhZkQnbWKP6guILckF1iOYx3Fu
         dgOOrieC9WghdJ+rPnHJnS9kKFApmAiSDI3mmlNxa2r3zmEq3LAK8isfw4IRNlsFv+tU
         JtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881227; x=1795486027;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4H9SESbbRGSoAq2gQL4B9mysuCtb/u5ZBxs535NDDIs=;
        b=wOuFzvyfCDfO4dyie0kxlJX29SLS8PavPetpoQOLBaP2VeMtzwqPpOmEz0VJrWA2al
         xUyRYKZbQvfgW9X0QfGufeEjsaiR/03atCRQLFflwXmO5jKdziKCJfoJcpHna+enpeTz
         tVltUGuhBVKOjqDLPP8f5wgv1YM6ZvitdZa97rXDc0M/SOXGpepPPJr9SPMXUPTycy19
         UHZ0Sn9jh1ZLp3Vp5sVDvn6tMSbCoTPbxwYJ1RTJkXndUz/9mLn1N5NUxtqOnR39ZIT+
         FDwR6nVmT7hpLHMCpiXnB+MSPoeTbmfUxYN04yxRRtnBygtAWAOH6AuzUr5yo4iD3+Dk
         TatA==
X-Forwarded-Encrypted: i=1; AL+hErEQqE4L4R3Y8Q+NtLhs8quZCLdXo4xkl9OAx5vM7UtDJL078SDCWdIjc/z4v1MswI6erbOvSqEUXJXydM5lMv9K@lists.infradead.org
X-Gm-Message-State: APuU4Z98xMXKS5kgOuYehIpd52rRwOBNB/Q/h5ju00QCQ3SBlSpywsbe
	sfX+CRgHDBFgt4bNkZgRqgYZlaCY5oWna/okMKla6jOtB8T5FBSdBhqflTAvSMozNDcqAgE2qiS
	uR9i6xIIH3Y/JeL5PFfqfnI/fzA==
X-Received: from plsb22.prod.google.com ([2002:a17:902:b616:b0:2ef:e0e7:c9d1])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5c9:b0:2e9:73db:3c78 with SMTP id d9443c01a7336-2ee0daa43c4mr117565405ad.17.1794881226561;
 Mon, 16 Nov 2026 18:07:06 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:46 +0000
In-Reply-To: <20261117020648.323464-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117020648.323464-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117020648.323464-10-dylanbhatch@google.com>
Subject: [PATCH v9 09/11] arm64: entry: add unwind info for call_on_irq_stack()
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
X-CRM114-CacheID: sfid-20261116_180708_445003_2FC6E2E8 
X-CRM114-Status: GOOD (  12.96  )
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

From: Weinan Liu <wnliu@google.com>

DWARF CFI (Call Frame Information) specifies how to recover the return
address and callee-saved registers at each PC in a given function.
Compilers are able to generate the CFI annotations when they compile
the code to assembly language. For handcrafted assembly, we need to
annotate them by hand.

Frame pointers alone are usually sufficient to recover stack frames
(without CFI), except at the exception boundary, where more information
is needed to determine if the LR is live.

Since an exception can be taken from call_on_irq_stack(), annotate it
with CFI. The actual entry assembly functions are left untouched, since
they are not expected to take exceptions themselves.

Signed-off-by: Weinan Liu <wnliu@google.com>
Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v8:
 - (sashiko) Use SYM_START() with .cfi_startproc before 'bti c' so the
   FDE covers the landing pad at call_on_irq_stack+0.
---
 arch/arm64/kernel/entry.S | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 8d17f61d1b5b2..cc9290b218204 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -30,6 +30,12 @@
 #include <asm/asm-uaccess.h>
 #include <asm/unistd.h>
 
+/*
+ * Do not generate .eh_frame.  Only generate .debug_frame and optionally
+ * .sframe (via assembler option --gsframe[-N]).
+ */
+	.cfi_sections .debug_frame
+
 	.macro	clear_gp_regs
 	.irp	n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
 	mov	x\n, xzr
@@ -881,7 +887,9 @@ NOKPROBE(ret_from_fork)
  *
  * Calls func(regs) using this CPU's irq stack and shadow irq stack.
  */
-SYM_FUNC_START(call_on_irq_stack)
+SYM_START(call_on_irq_stack, SYM_L_GLOBAL, SYM_A_ALIGN)
+	.cfi_startproc
+	bti	c
 	save_and_disable_daif x9
 #ifdef CONFIG_SHADOW_CALL_STACK
 	get_current_task x16
@@ -892,6 +900,9 @@ SYM_FUNC_START(call_on_irq_stack)
 	/* Create a frame record to save our LR and SP (implicit in FP) */
 	stp	x29, x30, [sp, #-16]!
 	mov	x29, sp
+	.cfi_def_cfa 29, 16
+	.cfi_offset 29, -16
+	.cfi_offset 30, -8
 
 	ldr_this_cpu x16, irq_stack_ptr, x17
 
@@ -907,9 +918,13 @@ SYM_FUNC_START(call_on_irq_stack)
 	 */
 	mov	sp, x29
 	ldp	x29, x30, [sp], #16
+	.cfi_restore 29
+	.cfi_restore 30
+	.cfi_def_cfa 31, 0
 	scs_load_current
 	restore_irq x9
 	ret
+	.cfi_endproc
 SYM_FUNC_END(call_on_irq_stack)
 NOKPROBE(call_on_irq_stack)
 
-- 
2.56.0.679.gc527c65306-goog


