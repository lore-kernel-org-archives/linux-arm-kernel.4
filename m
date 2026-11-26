Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9398606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WcB+x+OF;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=uPiNeOjZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eucfmT/o/Eozou3D8TIi0sNyFcoiYBVuMw7umZiWiHo=; b=WcB+x+OFnnOJgLQfRMYLlCdCrf
	HCRIusJxDMGf4Qh3hOjHHcTUDud/HDRXsoIfWq5+Dc5FNhivpucCiG4pFGUUx0RJ65cVpNa8f+fuv
	a1+Os6AAt6v1/cL5V3yijXpCFyfBUlLiTryb2MAWLQFLHQSJa2afVLM31kjUvqm1OfUaCFFTlOE7d
	iXBexBGnmpfE+71/y+Bab5K4KGzM67Et6JNIMT5eMhgf0OfKC+eDwKApeEku6jHRulT6HF5afOaft
	wsiIqyw+fNyCBNqnXk89wn50SEddwAuvjobtlAqyJr1HWHJnvQki94IywVLBmVmjl6k7cuaqIURaZ
	tTRoS21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUU2-0000000CLII-1loJ;
	Thu, 26 Nov 2026 08:05:34 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUTz-0000000CLHK-12LA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:05:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=eucfmT/o/Eozou3D8TIi0sNyFcoiYBVuMw7umZiWiHo=;
	b=uPiNeOjZvUhLdvjRznqZwRhUuQ72RNUQ6xBznmYewwXds/X6q437IXt3MEFB0gF2B2Ddd43w2
	lu52LvqkvufO6dSoD6Rai0KyjeEU/9hqIUv8kcucFfnRfmiyf17kXQgimWj9crPEHGgDUBhjHoO
	ez00NO/K6YO2+4A7sU1I/xw=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jZpxT0WCCzLlWD;
	Thu, 26 Nov 2026 16:05:01 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1EFC640586;
	Thu, 26 Nov 2026 16:05:25 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 16:05:24 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <linusw@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <shuah@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 2/3] arm64: ptrace: Check rseq critical section before reporting syscall exit
Date: Thu, 26 Nov 2026 16:05:13 +0800
Message-ID: <20261126080514.1523978-3-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261126_000531_902553_059D2881 
X-CRM114-Status: GOOD (  14.41  )
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

With CONFIG_DEBUG_RSEQ=y, rseq_syscall() kills the task with SIGSEGV if
the system call was issued from inside an rseq critical section. It
decides this from regs->pc.

arm64 calls rseq_syscall() after report_syscall_exit(), so a tracer
stopped at the syscall-exit-stop can change regs->pc with
PTRACE_SETREGSET before the check runs. The check then looks at the PC
written by the tracer, not the PC the system call was issued from:

- a system call issued inside a critical section is not detected if
  the tracer moves the PC out of it;

- a system call issued outside a critical section kills the task with
  SIGSEGV if the tracer moves the PC into it.

Call rseq_syscall() first, before audit, tracepoints and ptrace, as
generic entry (rseq_debug_syscall_return()), x86 before it moved to
generic entry, and arm32 already do.

Only kernels with CONFIG_DEBUG_RSEQ=y are affected. The option depends
on EXPERT and DEBUG_KERNEL, is off by default, and is otherwise a no-op
stub. Measured in QEMU with a traced task that issues getppid():

  case                                  before    after
  inside the CS, PC moved out           not killed SIGSEGV
  outside the CS, PC moved into the CS  SIGSEGV    exits normally

Fixes: 409d5db49867 ("arm64: rseq: Implement backend rseq calls and select HAVE_RSEQ")
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 07c80ebe948a..4e43f9841d10 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2499,6 +2499,8 @@ void syscall_trace_exit(struct pt_regs *regs)
 	unsigned long flags = read_thread_flags();
 	bool step;
 
+	rseq_syscall(regs);
+
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
@@ -2507,8 +2509,6 @@ void syscall_trace_exit(struct pt_regs *regs)
 	step = report_single_step(flags);
 	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
-
-	rseq_syscall(regs);
 }
 
 /*
-- 
2.34.1


