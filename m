Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456F1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yHnpZW0N;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ZJgs/J6y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8Z15m+NbNiZQiSnpZp29G5Mqn1yjW1kGCZAqukJTahE=; b=yHnpZW0NM0Zgg7D3gIRXRm32yi
	Rz+48solqoX/vLtXFHWh81sD3b1wX9hbLxyLH89Yi/flWaCrxZCrw8chY0Eg53i2po106e7wytNG+
	/SW/ryKYsgYpRNX/6acz6iOQ8M5pwBYrCwrmSBRl/bI7aKMOOrl9ZS68QT8E8Jvt1QTNPOVfYZqPu
	fdJ/zsdHxOCt6r4qfRPebPeMHCUSZtPDsv2jLQ/WzyKj76eIQbdQtc+OIOAihdP42aZ1Zx8laxHs2
	fQ5brWd90v9gnFxboBOArmmcUd7MFnWUWt5ym53sglnZ9bhSrJLjOE4eOsxKts0tcnylXa1QAWq9s
	9WQFsZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUUC-0000000CLK9-2A3c;
	Thu, 26 Nov 2026 08:05:44 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUTz-0000000CLHJ-0yNm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:05:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8Z15m+NbNiZQiSnpZp29G5Mqn1yjW1kGCZAqukJTahE=;
	b=ZJgs/J6ySKZ7kivw/bNsrZv9YfSOpa1dxfURcrD/y/U+BbkZ21lhEoMSzKtQzH2A50BhzA6KE
	OCkWEPr+wX16bDinL1RDNPjJ9cfqiXWrQ/6JCADg/tUn67HGXqZZb1wOx/xRKdabF6Mmsemf5x1
	bNXZXCS7YvEjX9u6UqjBooI=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jZpxY2NHtzRhQT;
	Thu, 26 Nov 2026 16:05:05 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9042C4056E;
	Thu, 26 Nov 2026 16:05:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 16:05:23 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <linusw@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <shuah@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 1/3] arm64: ptrace: Fix spurious pseudo-single-step for PTRACE_SYSEMU_SINGLESTEP
Date: Thu, 26 Nov 2026 16:05:12 +0800
Message-ID: <20261126080514.1523978-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126080514.1523978-1-ruanjinjie@huawei.com>
References: <20261126080514.1523978-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_000531_902528_28D2F775 
X-CRM114-Status: GOOD (  15.76  )
X-Spam-Score: -2.8 (--)
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

PTRACE_SYSEMU_SINGLESTEP sets both _TIF_SYSCALL_EMU and _TIF_SINGLESTEP.
Since commit ac2081cdc4d99 ("arm64: ptrace: Consistently use
pseudo-singlestep exceptions"), syscall_trace_exit() injects a
pseudo-single-step SIGTRAP (si_code SI_USER) whenever _TIF_SINGLESTEP is
set, including for an emulated system call.

That pseudo-step was added for PTRACE_SINGLESTEP: the system call runs,
and the tracer must get a stop at the return address to inspect the
result. An emulated system call does not run, and its syscall-enter-stop
already reports the SVC, as the x86 implementation and generic entry
(report_single_step()) both say. The extra stop is wrong:

1) Stepping armed before the SVC (the normal case). The SVC exception
   leaves the step pending (SPSR_EL1.SS is 0, Arm ARM D2.11.5.1), so the
   hardware step is taken at the return address anyway, and the tracer
   now stops there twice without the tracee executing anything:

	syscall-enter-stop  pc=L
	pseudo-step         pc=L    si_code=SI_USER  <- added by that commit
	hardware step       pc=L    si_code=TRAP_TRACE
	hardware step       pc=L+4

2) Stepping armed after the SVC, e.g. a tracer resuming a
   PTRACE_EVENT_SECCOMP stop with PTRACE_SYSEMU_SINGLESTEP. The first
   stop is the pseudo-step at L, so the instruction at L is not
   executed before the step is reported. Before that commit, and on
   x86, the first stop follows the instruction at L.

Skip the pseudo-step when _TIF_SYSCALL_EMU is set, as generic entry
does. The behaviour of PTRACE_SYSEMU_SINGLESTEP goes back to what it was
before that commit. PTRACE_SINGLESTEP is unaffected and still gets the
pseudo-step, so both problems fixed by that commit stay fixed.

Only tracers using PTRACE_SYSEMU_SINGLESTEP see the difference. Measured
in QEMU, L is the instruction after the SVC:

  case          before that commit   v7.4-rc1      this patch
  normal        L, L+4               L, L, L+4     L, L+4
  after seccomp L+4                  L             L+4

Fixes: ac2081cdc4d99 ("arm64: ptrace: Consistently use pseudo-singlestep exceptions")
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 6a0b3a9b6125..07c80ebe948a 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2486,16 +2486,26 @@ int syscall_trace_enter(struct pt_regs *regs)
 	return regs->syscallno;
 }
 
+static inline bool report_single_step(unsigned long flags)
+{
+	if (flags & _TIF_SYSCALL_EMU)
+		return false;
+
+	return flags & _TIF_SINGLESTEP;
+}
+
 void syscall_trace_exit(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
+	bool step;
 
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
 		trace_sys_exit(regs, syscall_get_return_value(current, regs));
 
-	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
+	step = report_single_step(flags);
+	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
 
 	rseq_syscall(regs);
-- 
2.34.1


