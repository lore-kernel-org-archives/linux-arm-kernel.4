Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567E7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1LClRCo4;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tk+WtAnf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DvHKY3cYSus7pHAxRYcjnamtRx26ijW7dyhFooUIFS4=; b=1LClRCo47I0mdWfnAzg0zcPLm+
	075jk4Tr3P4ypH15T1s/XEYQGmrTO2YtA2oukUbWGQU0r5Xq4Rr/B4FPHLtGgNx6rM6yM16Wc5dvj
	uBXJgvMHZQKbO05IlI8YDt4MRlzcg40cJPpCoLCGSRYdaUoAav3JNlqYT1mEbge4TsimoSqlEpOe/
	DGIXWByFCLLCjc/BUx9UxcuqHz0shKR3FsPmCMJTwAonYSkx1CsIPQMwzI+aI8SBfxAAcn3S/POb/
	NntSuVUBc9pyupiBkDe6GFiUW9mnwoz+ZM+FBW7AEjlkPNbb9m1pv03MTXTT8+RJapcuP44eALuc7
	6GdyhQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jQ-00000006VhR-3yma;
	Wed, 11 Nov 2026 11:43:12 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jN-00000006VWL-0fiD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:43:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DvHKY3cYSus7pHAxRYcjnamtRx26ijW7dyhFooUIFS4=;
	b=tk+WtAnfL3EXR6bdWC04NRutNXaNCjkTEvHif9ALQAwcy4SXilgysliGlMr+RwJrGnm9LoYvO
	SuA5oYKEwqkKu2gSKc+RdKt50DYF6GQgWATX8TT6RxaJuAUhq6tBtFOkW8n/l4RareC12wic2dt
	IvroOtdNoDSmbKQFlEiNxRo=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jPhT30jrqzpSvH;
	Wed, 11 Nov 2026 19:42:15 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B5CF94057F;
	Wed, 11 Nov 2026 19:42:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:51 +0800
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
Subject: [PATCH v21 02/15] arm64: ptrace: Check rseq critical section before reporting syscall exit
Date: Wed, 11 Nov 2026 19:42:12 +0800
Message-ID: <20261111114225.3977243-3-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261111_034309_628858_EFB36B9F 
X-CRM114-Status: GOOD (  13.88  )
X-Spam-Score: -2.1 (--)
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
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4baf04f20e67..a34d4893f4bf 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2495,6 +2495,8 @@ void syscall_trace_exit(struct pt_regs *regs)
 	unsigned long flags = read_thread_flags();
 	bool step;
 
+	rseq_syscall(regs);
+
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
@@ -2503,8 +2505,6 @@ void syscall_trace_exit(struct pt_regs *regs)
 	step = report_single_step(flags);
 	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
-
-	rseq_syscall(regs);
 }
 
 /*
-- 
2.34.1


