Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FE260A6F5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CUStAA3l;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=QwuL8Lgf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FJJ1bTU/A5OGTKd8MNjjrQxrp+auhWfDz+fIqooO6Fk=; b=CUStAA3loPqQAQCvAuXifahvJL
	GacvvSTxYvufvLwfyGL7MYA2ygNk5v8NekG3s4Lbc+cbY3q4emJgW15zrSs6KGaYbpifUJnZzG5rJ
	qQaeftpvQNqZMEM+9Bm7P9LYpopszhDlKlnATuYga6FNef6LNwzhBxjyFanvDmISuNA6GTfCwK2TU
	iQueWfMgcRpPMTCkUg/NeY3bMyVI6CL3wqDShV9Q7WtNePZKK2zQtyM3YScsuxYvwgoOWHTiP+kp+
	WCeTEu2mMceIyxATw/FUphfhW1hZLjpHR3QVQFT3UOcdl+lp7WPwvx4QOx1XFrxf4BtlayOAMdOJe
	5dULGSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jF-00000006VYQ-2MdQ;
	Wed, 11 Nov 2026 11:43:01 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jB-00000006VWS-1zTF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:43:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FJJ1bTU/A5OGTKd8MNjjrQxrp+auhWfDz+fIqooO6Fk=;
	b=QwuL8Lgfjs647B2BdC9JzE7EU7rgeUgI2r13VyROZIG+vHPqZ6v3g9/Z1mO34uZjiywoGc/ki
	UUqWLsn5zHBX8tsJeQ06VBAyI9bBgGQ1KDmdvZkOjb64S9hsykDZ/wdwNARhR78QcMtFbRyJ6H7
	P6rjDJHzBAr98uIyaUvLr2o=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jPhTc0MByzKm4r;
	Wed, 11 Nov 2026 19:42:44 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1AF6C4048B;
	Wed, 11 Nov 2026 19:42:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:53 +0800
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
Subject: [PATCH v21 04/15] arm64: ptrace: Open-code seccomp check in syscall_trace_enter()
Date: Wed, 11 Nov 2026 19:42:14 +0800
Message-ID: <20261111114225.3977243-5-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20261111_034258_144250_B34D2F25 
X-CRM114-Status: GOOD (  12.41  )
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

Refactor syscall_trace_enter() by open-coding the seccomp check to
align with the generic entry framework.

The generic entry implementation expands the seccomp check in-place
by testing SYSCALL_WORK_SECCOMP and directly calling the underlying
__seccomp_permit_syscall() function. Moreover, generic entry explicitly
re-reads work flags after ptrace handling to ensure any updates to
seccomp work flags during the ptrace stop are observed.

Bring arm64 in line with this behavior:
- Re-read thread flags after ptrace handling.

- Test the updated flags for _TIF_SECCOMP and call
  __seccomp_permit_syscall().

No functional changes are intended; this change simplifies future
migration to the generic entry framework.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/all/20260713025712.416366-1-ruanjinjie@huawei.com/
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 22bda379b244..9c45ff796732 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2480,11 +2480,16 @@ int syscall_trace_enter(struct pt_regs *regs)
 		ret = report_syscall_entry(regs);
 		if (ret || (flags & _TIF_SYSCALL_EMU))
 			return NO_SYSCALL;
+
+		/* ptrace might have changed thread flags */
+		flags = read_thread_flags();
 	}
 
 	/* Do the secure computing after ptrace; failures should be fast. */
-	if (!seccomp_permit_syscall())
-		return NO_SYSCALL;
+	if (unlikely(flags & _TIF_SECCOMP)) {
+		if (!__seccomp_permit_syscall())
+			return NO_SYSCALL;
+	}
 
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, regs->syscallno);
-- 
2.34.1


