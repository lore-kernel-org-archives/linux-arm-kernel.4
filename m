Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64C8606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PM+cBshs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vcQIYCkg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dnt2GtHzfP5h866vP0cRtDl18L844ZAZum/+U48ESm4=; b=PM+cBshszT5hNojBwDaAwgBYi8
	NAf1NknAjuKAaGq2iP3vke5guBBEycl1rweyhcRghcpMgo+W3hw3UFU2g8lyhwCmFHYJ/EYUGjq7d
	QT1ZPdXvZRozA2hOlsDvdfAryfp/UBreFPLy1QaPfw++GlfoB8sDhH+evVtG4GNDCiC8+qtFTHlev
	UtJzwgI1V+HJ5aXJoUgyIik0+7HhAZ2Clo6F7omAZON8GllpN5pTnWeeuLooAzbOc09uA43na/36L
	vVk81MknKuXGu62NGb8EACv0BM0Czl2WYmUBuLxCwAfdHNyte8vx5Q8nAmOx8VW2WLo+2t1SRYtI6
	Mqp1W/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXej-00000004KPw-20Z8;
	Mon, 23 Nov 2026 17:16:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXeJ-00000004KGg-0nkX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:16:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4743819F6;
	Mon, 23 Nov 2026 09:16:11 -0800 (PST)
Received: from e137867.cambridge.arm.com (unknown [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BABE3F86F;
	Mon, 23 Nov 2026 09:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795454174; bh=OKpA5BGzsnvMNkmETrY5EVQga+MEy2xQO6CCLFEttso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vcQIYCkgDxusqCN8hgHN6yqNXMxn0KtyUYXFr9Ob2sXYdpscTr0HybhfuF9sLu8Ud
	 xboVdIOA0RmuwR2vaBmLJhWHvAKapg8h2SebzWv5T9hlr3b6kBl5e1huSjIlk5J2cB
	 PZTKbUaPV9G2rs6z1CqSFFbJ70652hCWDw8+JYOQ=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/3] arm64: head: set __entry_task along with task setup
Date: Mon, 23 Nov 2026 17:15:57 +0000
Message-ID: <20261123171557.140944-4-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123171557.140944-1-ada.coupriediaz@arm.com>
References: <20261123171557.140944-1-ada.coupriediaz@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_091615_309757_6D2A882F 
X-CRM114-Status: GOOD (  16.04  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Kiryl Shutsemau <kas@kernel.org>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Usama Arif <usama.arif@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>, Breno Leitao <leitao@debian.org>, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Will Deacon <will@kernel.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

`__entry_task` is only set after the first `switch_to()`, despite
a proper task being set up in SP_EL0 as soon as CPUs go through
`__{primary,secondary}_switched()`.

As SDEI can interrupt execution at any time, it can interrupt before
the first `switch_to()`[0] and use a NULL `__entry_task`
to set its current task.

Set `__entry_task` as soon as we have a proper task set up in
`init_cpu_task()` in case we get interrupted before switching threads.

Remove the second paragraph of the comment on `__entry_task`, as it has
been incorrect since the introduction of SDEI, and even more so
with this change.

[0]: This can only happen on secondary CPUs first brought online after
     initial boot :
     - all CPUs onlined at boot-time switch at least once
       before drivers are probed ;
     - hotplugged CPUs that booted once still have their `__entry_task`
       in memory, so it would not be NULL.

Fixes: f5df26961853 ("arm64: kernel: Add arch-specific SDEI entry code and CPU masking")
Cc: stable@vger.kernel.org
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/kernel/head.S    | 3 +++
 arch/arm64/kernel/process.c | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index d6ba3c0af811..e53a9c6fec83 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -209,6 +209,9 @@ SYM_CODE_END(preserve_boot_args)
 	ldr	w\tmp2, [\tsk, #TSK_TI_CPU]
 	ldr	\tmp1, [\tmp1, \tmp2, lsl #3]
 	set_this_cpu_offset \tmp1
+
+	adr_l	\tmp2, __entry_task
+	str	\tsk, [\tmp2, \tmp1]
 	.endm
 
 /*
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 42b15b0c069f..c3d194676efc 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -584,9 +584,6 @@ static void ssbs_thread_switch(struct task_struct *next)
 /*
  * We store our current task in sp_el0, which is clobbered by userspace. Keep a
  * shadow copy so that we can restore this upon entry from userspace.
- *
- * This is *only* for exception entry from EL0, and is not valid until we
- * __switch_to() a user task.
  */
 DEFINE_PER_CPU(struct task_struct *, __entry_task);
 
-- 
2.43.0


