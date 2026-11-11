Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EFB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ny3+nHmt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SJoB2oHm;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=41TeA1+o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zlRZYLO+yq23J7cSGpjgpg8x5gwdyzqrzSP5RWgdStI=; b=Ny3+nHmtfqYGg6gcUTeWwFeTN7
	QapaBcqTphh8xMNsYa7ipwXwSJl72Xy+pEzefmTEk2m0iO3WdxzN6ZOPyBLf5RqF+IVWN7sXZ015s
	aLvJ67e7/i5heDZX4J1mh/RA7SrpJ6C8e6BGXIj4YH0Zy1O7/3nOQzMlRU+RvbCt1ef7i+vtsFMsq
	PmgHrKk/bXJjUAoVcBigg3bwa907oVKRXfNpE6Cn3S+8Ss3WgnaASi9S76GT6dYRw80KBqn9o7jqJ
	DN1X4BL1wRDRuhIlOfKGrW5YZ6HdH/Ua6FGSQkt1a7RfK9xbPFFCU+KSNCbiLyMSu77/lCYZDu96l
	L/I1tGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jt-00000006WDm-3hI0;
	Wed, 11 Nov 2026 11:43:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jR-00000006Vhn-45GP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Nov 2026 11:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zlRZYLO+yq23J7cSGpjgpg8x5gwdyzqrzSP5RWgdStI=; b=SJoB2oHmjHbxnOxy13kzRSDChq
	c3epQpcT5AF0+liMTxAzT9T3NW+NnJbefWUkEPYfqjYr6PT1zziRPwZAa7pDBnv/WBGnmEboCOlHJ
	3wrOgjOEvoqJFCsQIt3r89xauLUl2cXWPga/+rXScZsqzzUoVIKT5QAvkSZS4IBjk7eAsNl5K7whq
	BGe7GY8dZa5Ete3pKcd/od4u7POSUNvBWgPl5cUkmRQS3MhWPwgLgRFtb0gx1/xcQlGhVBin7gZEX
	5VOMDYOO3SdyMNN0hUVqHiGzn6jn+i2AewvRr5igffqfklN1kkQIQ7hj6beXEllDkx80n2YJRGu8S
	WX2z0c+g==;
Received: from [113.46.200.218] (helo=canpmsgout03.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jM-0000000956h-0Pc8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:43:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zlRZYLO+yq23J7cSGpjgpg8x5gwdyzqrzSP5RWgdStI=;
	b=41TeA1+oV5L2rcCWhCpHvJARHVtQUrs6t8BNC6uHtdY9k25VypP3Ny901HbMYeBWtSaM85KJi
	c2zxkSbQmIHkrTZHLAWyT3pXnVxdg+PKP5nw1O4klJj3waR79SFV0p1eX3A7X4BNqV1Wfbk6XGl
	ms9Ipkc7jDUz7L7XfbqkCHU=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jPhT80DZ5zpSvH;
	Wed, 11 Nov 2026 19:42:20 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A505840579;
	Wed, 11 Nov 2026 19:42:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:56 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<anshuman.khandual@arm.com>, <thuth@redhat.com>, <james.morse@arm.com>,
	<yeoreum.yun@arm.com>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<mathieu.desnoyers@efficios.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v21 09/15] arm64: ptrace: Only run syscall exit work when exit work flags are set
Date: Wed, 11 Nov 2026 19:42:19 +0800
Message-ID: <20261111114225.3977243-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111114225.3977243-1-ruanjinjie@huawei.com>
References: <20261111114225.3977243-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_114308_733939_12D29CC7 
X-CRM114-Status: GOOD (  16.08  )
X-Spam-Score: 1.1 (+)
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

Make the syscall exit path match generic entry, where
syscall_exit_work() is only called when one of the SYSCALL_WORK_EXIT
bits is set:

- Add _TIF_SYSCALL_EXIT_WORK for the thread flags that need work on
  syscall exit: trace, audit and tracepoint.

- Call the exit work from arm64_syscall_exit_to_user_mode_work() only
  when one of those flags or _TIF_SINGLESTEP is set.

- Rename syscall_trace_exit() to arm64_syscall_exit_work(), the arm64
  counterpart of syscall_exit_work().

- Move rseq_syscall() out of arm64_syscall_exit_work() into
  arm64_syscall_exit_to_user_mode_work(), so it still runs on every
  syscall exit and still runs before ptrace can change the PC, as in
  generic entry.

Checking _TIF_SYSCALL_AUDIT instead of calling audit_syscall_exit()
unconditionally is equivalent: the flag is set together with the audit
context at fork and neither changes while the task runs a system call.

No functional changes intended.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h     | 8 ++++++--
 arch/arm64/include/asm/thread_info.h | 3 +++
 arch/arm64/kernel/ptrace.c           | 5 +----
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 3e4672ab4a4f..7cc872fde019 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -8,6 +8,7 @@
 #include <uapi/linux/audit.h>
 #include <linux/compat.h>
 #include <linux/err.h>
+#include <linux/rseq.h>
 
 typedef long (*syscall_fn_t)(const struct pt_regs *regs);
 
@@ -121,13 +122,16 @@ static inline int syscall_get_arch(struct task_struct *task)
 }
 
 int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
-void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
+void arm64_syscall_exit_work(struct pt_regs *regs, unsigned long flags);
 
 static __always_inline void arm64_syscall_exit_to_user_mode_work(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
 
-	syscall_trace_exit(regs, flags);
+	rseq_syscall(regs);
+
+	if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
+		arm64_syscall_exit_work(regs, flags);
 }
 
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 6cb976c1c693..a85c72b65b82 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -108,6 +108,9 @@ void arch_setup_new_exec(void);
 				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
 				 _TIF_SYSCALL_EMU)
 
+#define _TIF_SYSCALL_EXIT_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
+				 _TIF_SYSCALL_TRACEPOINT)
+
 #ifdef CONFIG_SHADOW_CALL_STACK
 #define INIT_SCS							\
 	.scs_base	= init_shadow_call_stack,			\
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 043f48ddc168..4c2bdd37d67d 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -28,7 +28,6 @@
 #include <linux/hw_breakpoint.h>
 #include <linux/regset.h>
 #include <linux/elf.h>
-#include <linux/rseq.h>
 
 #include <asm/compat.h>
 #include <asm/cpufeature.h>
@@ -2507,12 +2506,10 @@ static inline bool report_single_step(unsigned long flags)
 	return flags & _TIF_SINGLESTEP;
 }
 
-void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
+void arm64_syscall_exit_work(struct pt_regs *regs, unsigned long flags)
 {
 	bool step;
 
-	rseq_syscall(regs);
-
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
-- 
2.34.1


