Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002C4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kuF7UuBE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eem3T4eH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8i0TTE7h9bbQBwURemuTXftASyL5xgUCoM3o8JauDWs=; b=kuF7UuBE7ZgZL3DTOd1wNL9Zwe
	5GbOlcZMz2umloS5MuUMz6lM/8eMtnNpm2WTWWcmiCaI0dnAcX8lVMvfRIkw9trFHYfe8nbbmOJ47
	R/yrYE0ttf/SAApgFsOxthUckX18jmnw5NGVUy6VnagqQ6PRg/Yvy28ADeeNhYc8C9DhEd30yjDDk
	fY9PqLC2EKSQqQWzYW2aiIP1mZX/BEe6Qk2R1SjDP5pqnt3k87oipr+Z5NL9A2y6bj/MmTsQ8qcSL
	+8NwqwBDmvwXpbiyyS0/8u0SR29hwJqGAFPkyxj95/3TbhjWfmJyuDtvFBuuV99cA4OmtODl/aJaw
	/oNwX8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTERS-00000004rrK-1n0V;
	Tue, 17 Nov 2026 08:21:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTERQ-00000004rrB-2JNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:21:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF0CF623DD;
	Tue, 17 Nov 2026 08:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066871F000C4;
	Tue, 17 Nov 2026 08:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903683;
	bh=8i0TTE7h9bbQBwURemuTXftASyL5xgUCoM3o8JauDWs=;
	h=From:Date:Subject:To:Cc;
	b=eem3T4eHcQ2HzlfNt5xHYmoj4MrJEUiXZ9VwDP3Hw4xrTohCP7OyUktYyAn3BimYE
	 U3fjjBfO7WsKMNqjVOuI40CguDlb4xbE9HpDzrXcw23a2Eloy+xJ0HnGVSVZaYCC0S
	 qjFjk+fVQ1y/s8iM7DZMQgmOg5tM3MPuDXUXGOlkEIzvCw0AmQO+s4q35C3Ud88gvH
	 q4oMZfRv9valUvNNayO+kuPwyogjuzA8v1W1PcTere/ICiDj5uaQ8wuuCHxka5KHsj
	 h344ZjOmpeSDdeTw7Rrcygr4mN0AHW479SPalmV1Ci5lT8elbTl53308ivtP7IorPC
	 sy5Oet1pPCrtQ==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 09:21:19 +0100
Subject: [PATCH] ARM: enable PREEMPT_LAZY
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-arm-lazy-preempt-v1-1-b5a9b0824b59@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQqCQBAG4KsM/7MDjpTaXiV62NZRB9KWWYlKv
 HvQd4BvR1E3LQi0w/VlxZ4rAklFSHNcJ2UbEAhN3bQi0nH0hR/x++HsqkveuD6Pl3RKvQztHRU
 hu472/pfX23H8AEkvHMtiAAAA
X-Change-ID: 20261117-arm-lazy-preempt-05f9c4c81d6b
To: Russell King <linux@armlinux.org.uk>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

Add lazy preemption support following commit c8597e2dd8b6 ("arm64:
enable PREEMPT_LAZY"). Define TIF_NEED_RESCHED_LAZY in the low flag
bits inspected by the assembly return-to-user paths, include it in
_TIF_WORK_MASK, and handle it in do_work_pending() by calling schedule().

Keep kernel-mode IRQ return preemption restricted to TIF_NEED_RESCHED,
so lazy requests can defer preemption until return to userspace or
escalation by the scheduler tick.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Tested with Debian armhf on QEMU virt with four Cortex-A15 CPUs, in
both lazy and full modes: 45 futex, 21 POSIX timer and 12 nanosleep
checks passed, along with CPU/syscall, affinity and signal stress.
A temporary test module verified scheduling on lazy-only syscall
return requests. Single-CPU lazy-mode boot and stress also passed.
ARMv5 and Thumb-2 static-lazy return-path build checks passed.

Assisted by an LLM.
---
 arch/arm/Kconfig                   | 1 +
 arch/arm/include/asm/thread_info.h | 6 ++++--
 arch/arm/kernel/signal.c           | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0cc289a7184a..9f5e346249a1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -21,6 +21,7 @@ config ARM
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
+	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SET_MEMORY
diff --git a/arch/arm/include/asm/thread_info.h b/arch/arm/include/asm/thread_info.h
index 943ffcf069d2..8bc647b8e079 100644
--- a/arch/arm/include/asm/thread_info.h
+++ b/arch/arm/include/asm/thread_info.h
@@ -144,6 +144,7 @@ extern int vfp_restore_user_hwstate(struct user_vfp *,
 #define TIF_NOTIFY_RESUME	2	/* callback before returning to user */
 #define TIF_UPROBE		3	/* breakpointed or singlestepping */
 #define TIF_NOTIFY_SIGNAL	4	/* signal notifications exist */
+#define TIF_NEED_RESCHED_LAZY	5	/* lazy rescheduling needed */
 
 #define TIF_USING_IWMMXT	17
 #define TIF_MEMDIE		18	/* is terminating due to OOM killer */
@@ -156,6 +157,7 @@ extern int vfp_restore_user_hwstate(struct user_vfp *,
 
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
+#define _TIF_NEED_RESCHED_LAZY	(1 << TIF_NEED_RESCHED_LAZY)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_UPROBE		(1 << TIF_UPROBE)
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
@@ -172,9 +174,9 @@ extern int vfp_restore_user_hwstate(struct user_vfp *,
 /*
  * Change these and you break ASM code in entry-common.S
  */
-#define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
+#define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY | \
 				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
-				 _TIF_NOTIFY_SIGNAL)
+				 _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING)
 
 #endif /* __KERNEL__ */
 #endif /* __ASM_ARM_THREAD_INFO_H */
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 763e1930a1ea..efc8b8c2dc67 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -619,7 +619,7 @@ do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 	 */
 	trace_hardirqs_off();
 	do {
-		if (likely(thread_flags & _TIF_NEED_RESCHED)) {
+		if (likely(thread_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))) {
 			schedule();
 		} else {
 			if (unlikely(!user_mode(regs)))

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261117-arm-lazy-preempt-05f9c4c81d6b

Best regards,
--  
Linus Walleij <linusw@kernel.org>


