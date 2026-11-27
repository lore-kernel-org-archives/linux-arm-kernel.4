Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F67606B35B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0R6xHvTo;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=rL8GBQQS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6kRCE4e9B1yAdG4N0ntHe8x6Dfjo7HptYTW2o7NmsLw=; b=0R6xHvToVM/Mf2
	UDRgAvTKNcavdUpOyE1HcO5P4MvWvaY7Ermy7O1N2T7k6wI/6Ls3huwW1vwbLEdYGD30F47DR5fPV
	8/vlY4EUbSJIFgGuAVs7mc1BsmmYLalEHqb36VOuHcmXtGdhDgl4nw+++SdWd1SsyeopE8Z2KWa66
	fcrvg6e3R16tAL4Nqbpdn9V8kTmxv7DWw3HVu7Z7/w4GMzH8Hr0lnp93oS3nyAGsEfvPBVpG9uEVJ
	oLXEMJFg587RuLMXHqkYB3HJAe/yHCYwZwyFA8X8ECkKM8TiKMeg55frQc9H6r9jQmFLCxhv1S+dd
	RLvYSlo16YeKcpNwxgpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX19S-0000000HUyr-3mTW;
	Fri, 27 Nov 2026 18:58:30 +0000
Received: from smtpout.efficios.com ([2607:5300:400:ed00::31e5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX19Q-0000000HUxN-0oBa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795805905;
	bh=6kRCE4e9B1yAdG4N0ntHe8x6Dfjo7HptYTW2o7NmsLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rL8GBQQSZjalsn/InH7Bc1MLMqUaDyz2qxXxFvsPdenZHQPpjgSZefwOfT6xqrBro
	 sx1aV/sEKfVyzGA5YeOzMrdVMfMNm4Ne/4FJHM9FOe1qdHYENl8bRsUkLUezNp0asq
	 QGEVnUoNwbFdwTyXbckAd6MPX/2ge5KKAjyDpNbdfeQHvQRp7iU3pTnfkA1/36af+Q
	 bzyTCiO8/oxl36QoaEIfcPbUkZnmeLNTjmcBDjBAmiwidN9o0jAIJD6vCJgcvuXfdL
	 Cxe3HiXcCJBI44VahI72vNA0IwGjatFQt41hEuKn8+rxGiyB9fUJbgK/Bz9sgTNkVP
	 temPGQlzAVaKw==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jbjNx0KdszXX0;
	Fri, 27 Nov 2026 13:58:25 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 11/16] Documentation/features: Update the membarrier sync core requirements
Date: Fri, 27 Nov 2026 13:58:16 -0500
Message-ID: <20261127185822.158216-12-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127185822.158216-1-mathieu.desnoyers@efficios.com>
References: <20261127185822.158216-1-mathieu.desnoyers@efficios.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_105828_302694_46B2A0C2 
X-CRM114-Status: GOOD (  17.28  )
X-Spam-Score: -0.4 (/)
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

The x86 text says that the return from interrupt uses IRET, which
serializes the core after the IPI. This is not what the code relies
on, and it is not always true:

 - Since commit a493d1ca1a03 ("x86/membarrier: Get rid of a dubious
   optimization"), the IPI handler issues a core serializing
   instruction right away. The interrupted thread can be rescheduled
   before the return from interrupt, and another thread of the mm can
   then return to user-space through SYSRET.

 - With FRED, the kernel returns through ERETS and ERETU. The Intel
   SDM does not list them as serializing instructions. It states that
   ERETU has the instruction ordering guarantees of SYSRET.
   The AMD APM does not describe these two instructions.

Describe what x86 relies on instead: sync_core_before_usermode() and
the writes to CR3.

On arm64 with FEAT_ExS, an exception return is a context
synchronization event only when SCTLR_ELx.EOS is set. The kernel sets
it. Document that the sync core command depends on it.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 .../membarrier-sync-core/arch-support.txt     | 35 +++++++++++++------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/Documentation/features/sched/membarrier-sync-core/arch-support.txt b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
index 7425d2b994a3..2782b0d25f43 100644
--- a/Documentation/features/sched/membarrier-sync-core/arch-support.txt
+++ b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
@@ -10,6 +10,10 @@
 # Rely on implicit context synchronization as a result of exception return
 # when returning from IPI handler, and when returning to user-space.
 #
+# On arm64 with FEAT_ExS, an exception return is a context synchronization
+# event only when SCTLR_ELx.EOS is set. The kernel sets it, cf.
+# SCTLR_EL1_EOS in INIT_SCTLR_EL1_MMU_ON. It must stay set.
+#
 # * riscv
 #
 # riscv uses xRET as return from interrupt and to return to user-space.
@@ -28,19 +32,28 @@
 #
 # * x86
 #
-# x86-32 uses IRET as return from interrupt, which takes care of the IPI.
-# However, it uses both IRET and SYSEXIT to go back to user-space. The IRET
-# instruction is core serializing, but not SYSEXIT.
+# x86-32 returns to user-space through either IRET or SYSEXIT. x86-64 returns
+# to user-space through either SYSRETL (compat code), SYSRETQ or IRET, or
+# through ERETU when FRED is enabled. It returns from interrupt through IRET,
+# or through ERETS or ERETU when FRED is enabled.
+#
+# The IRET instruction is core serializing. SYSRET{L,Q}, SYSEXIT, ERETS and
+# ERETU are not. Therefore x86 does not rely on the return instruction:
+#
+#  - the IPI handler calls sync_core_before_usermode(), which issues a core
+#    serializing instruction right away (cf. ipi_sync_core()). The thread may
+#    otherwise be rescheduled before the return from interrupt, and a thread
+#    of the same mm may return to user-space through SYSRET,
+#
+#  - write_cr3() performed by switch_mm() provides core serialization after
+#    changing the current mm,
 #
-# x86-64 uses IRET as return from interrupt, which takes care of the IPI.
-# However, it can return to user-space through either SYSRETL (compat code),
-# SYSRETQ, or IRET.
+#  - the special case of kthread -> uthread (temporarily keeping current mm
+#    into active_mm) issues a sync_core_before_usermode().
 #
-# Given that neither SYSRET{L,Q}, nor SYSEXIT, are core serializing, we rely
-# instead on write_cr3() performed by switch_mm() to provide core serialization
-# after changing the current mm, and deal with the special case of kthread ->
-# uthread (temporarily keeping current mm into active_mm) by issuing a
-# sync_core_before_usermode() in that specific case.
+# With page table isolation, sync_core_before_usermode() does nothing: each
+# return to user-space writes to CR3, which is core serializing. Page table
+# isolation and FRED are mutually exclusive.
 #
     -----------------------
     |         arch |status|
-- 
2.47.3


