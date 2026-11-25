Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB3F606A68B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nj/mMftg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z3NigmJs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nXrLOU8GsMiHDNNHwzWSVTpu9xEsISBEn05wWpz4LO4=; b=Nj/mMftgZNtObM
	fcWdqa3sJksJLb3Z57KtqQtxtlxjwo6ROF93sSrpi4jZIyOTafa+2ikK+I9noMfE9x5e4i39NDo1d
	IinIopdAZOxW+L1zTgyl4jvoBTOAe7FuLdXs/G8cJ0SK7CFoworb98dk3jX8XD4RD6sKUPBJ0p6wP
	Vnt4sc5e9t6sPaN3hBoxPoStbHJEnfjY8I2SVr39C0nHBOyNjdccb7sxuJDgjrrAX3zlrERBbHbJk
	qEzOXyr9GjmmUhQEwXR05zC4nRofo7O8xyXJetwDNVs4cDHud/Fe1ad8aLj0nFRv/FFGw8qw0fEW6
	TF5j31Wyz8mIkYTOyNTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLRM-0000000BSlb-3pM0;
	Wed, 25 Nov 2026 22:26:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLP7-0000000BS7o-40cJ;
	Wed, 25 Nov 2026 22:24:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9D1E41433;
	Wed, 25 Nov 2026 22:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503D41F01561;
	Wed, 25 Nov 2026 22:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645433;
	bh=nXrLOU8GsMiHDNNHwzWSVTpu9xEsISBEn05wWpz4LO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z3NigmJsNMTYGt1pNe8/ahLrDCJt00f5KT16hyX0WhLAF5mR/fIlkOtUMf1xGty7P
	 x11APHol0hGF0htdKo1ykF7JPMUW6fXtR+A5CnyH0P2mYa2RAccV4ZMlFLQGLydVkn
	 ctuIuR0IxbXMWV6UEyry6gU7D/BdtFn426YcIed/2PSTLazmf1WBNHmpuKtNi2etOs
	 x9Qn6BRXZUmwwSlPtZHUdwAcGegAWFfswwidCoViOUyXzYILbZHDCbUDAudH2mi8mv
	 9s/lH/ZtizW96ULug1Rl5/ddU1KR3DSeW5ihwUWi0bfI9tgc8zcMzVGDUCy33xIEcj
	 OhT3oHw/iLgAg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 20/47] perf: RISC-V: Move CPUHP_AP_PERF_RISCV_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:03 +0100
Message-ID: <20261125222230.22508-21-frederic@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125222230.22508-1-frederic@kernel.org>
References: <20261125222230.22508-1-frederic@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while temporarily stopping/pausing all CPUs
in the system. This doesn't mix well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here:

* Disables the per-cpu IRQ
* Disables user-mode access to the CPU counter
* Disables the shared memory snapshot of the CPU PMU.

All these operations are local to the CPU and should be able to execute
concurrently with other CPUs.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 632103c9b4d9..2ad19f3f2563 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_ARM_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_RISCV_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_PERF_ARM_STARTING);
+	WARN_ON(st->state != CPUHP_AP_PERF_RISCV_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1


