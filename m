Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422EB606A8A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WLvxri3l;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WIS1wqQr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hGBP36E9LTYeRQe9lgSGYGc4SeQI1Vsj1JRBREfQpFg=; b=WLvxri3l6RrK7zkPNCH3R2tNLR
	bwEhU+hG8tLc2wKiItOtH3iF/BsZhiUWFzNY3J+WRvB2hMRF5mTwa1z1YGTGGg6HdbBg8NpX2Ht/U
	+rBNBsCgBiXSPjlSLSCZxwYhbq0Zu63O5bylOI4xCv0lrO/nFcoAsunSr3fmfCIijoCIbQDv2njhD
	wWBYVMjSi0GmEEtXqVvBF6EwUw+rxgABi5tK3YsJbRi2saXUjX1HXiJqxl+/fh2EmS3IeACk5KU18
	DF36rvFdXr9w2b8r86zUNXtpDPWTwxBoT31M7fPXe3ADEh1sTRQmfrmaM8Pzpset2q8FJYS7Ojd+3
	GPd1IZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jQ-00000006VhB-3ESv;
	Wed, 11 Nov 2026 11:43:12 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jI-00000006VYX-16i4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:43:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hGBP36E9LTYeRQe9lgSGYGc4SeQI1Vsj1JRBREfQpFg=;
	b=WIS1wqQrSUtsAIR45ecL+9Uc/y0quiS8JpfxA0fvFJ0wvxP8U3aD1SZhbUcp5Rp10cOh6m8a2
	Fh4DETZNYd/jpuOV73iNwbwXH8FO4aPr5LOXQOpO1ilSb3zl9u5LPMYscZoWzi5Nckcz4nCMSdM
	ig3Y9IQk0JL/OBZHG2hRvW4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jPhTK75Knz1T4HZ;
	Wed, 11 Nov 2026 19:42:29 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CF1844057F;
	Wed, 11 Nov 2026 19:42:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:58 +0800
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
Subject: [PATCH v21 12/15] arm64: ptrace: Return bool from arm64_syscall_trace_enter()
Date: Wed, 11 Nov 2026 19:42:22 +0800
Message-ID: <20261111114225.3977243-13-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261111_034305_304609_0460A183 
X-CRM114-Status: GOOD (  16.66  )
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

In preparation for migrating arm64 to the generic entry infrastructure,
decouple the decision to run the system call from the syscall number.
arm64_syscall_trace_enter() now returns a bool, like generic entry's
syscall_trace_enter(), instead of overloading NO_SYSCALL (-1):

- false: do not run the system call (ptrace or seccomp rejected it)
- true: run it, after re-reading the syscall number from regs

When it returns true, el0_svc_common() re-reads the syscall number and
still skips invoke_syscall() if it is NO_SYSCALL. A tracer skips a
system call by setting the number to -1 and its own return value in x0;
calling invoke_syscall() would overwrite that x0 with -ENOSYS from
sys_ni_syscall().

The user-visible behaviour does not change:

- syscall(-1) issued by userspace still returns -ENOSYS.
- A tracer skip with a custom x0 still returns that x0.
- A tracer skip without setting x0 still returns the original x0.
- Normal system calls and seccomp rejections are unaffected.

No functional changes intended.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h | 2 +-
 arch/arm64/kernel/ptrace.c       | 8 ++++----
 arch/arm64/kernel/syscall.c      | 6 +++++-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 7cc872fde019..f19d4a8824ba 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -121,7 +121,7 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
-int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
+bool arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
 void arm64_syscall_exit_work(struct pt_regs *regs, unsigned long flags);
 
 static __always_inline void arm64_syscall_exit_to_user_mode_work(struct pt_regs *regs)
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4c2bdd37d67d..d3c52c9a1105 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2470,14 +2470,14 @@ static inline void syscall_enter_audit(struct pt_regs *regs)
 static inline void syscall_enter_audit(struct pt_regs *regs) { }
 #endif
 
-int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
+bool arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 {
 	int ret;
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
 		ret = report_syscall_entry(regs);
 		if (ret || (flags & _TIF_SYSCALL_EMU))
-			return NO_SYSCALL;
+			return false;
 
 		/* ptrace might have changed thread flags */
 		flags = read_thread_flags();
@@ -2486,7 +2486,7 @@ int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	/* Do the secure computing after ptrace; failures should be fast. */
 	if (unlikely(flags & _TIF_SECCOMP)) {
 		if (!__seccomp_permit_syscall())
-			return NO_SYSCALL;
+			return false;
 	}
 
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
@@ -2495,7 +2495,7 @@ int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	if (unlikely(audit_context()))
 		syscall_enter_audit(regs);
 
-	return syscall_get_nr(current, regs);
+	return true;
 }
 
 static inline bool report_single_step(unsigned long flags)
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 3488afd45d20..72c6e8b7ab21 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -108,7 +108,11 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		 */
 		if (scno == NO_SYSCALL)
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		scno = arm64_syscall_trace_enter(regs, read_thread_flags());
+		if (!arm64_syscall_trace_enter(regs, read_thread_flags()))
+			goto trace_exit;
+
+		/* Reread the syscall number as it might have been modified */
+		scno = syscall_get_nr(current, regs);
 		if (scno == NO_SYSCALL)
 			goto trace_exit;
 	}
-- 
2.34.1


