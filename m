Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97EB606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TE1NrxCZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K706cijN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aamSgS9mN4fl3LNN9RVzzpQBmZHNs4ovTx1ZPQ9tpB8=; b=TE1NrxCZbvoPVK
	ux5GkYZbQY0QrreGRk0SOzqqvBXg2HeMHRzkEcYcwHsUAF91Z0SlyCK1ekpZm4+4XRCeSXvr2Wx7i
	OGK0tpaeSxtoH4sdTWkEn4auMpWvAV1/2Au/BXGMN+mEMFfaiDF9pSWBZBAKwpjuVC+UJboDGbNxh
	0ckseE2Tqz6hoDkP7Sid07DITURXu1dRU2w+SnEvUEdr8NyfaZDvN+8bakC4SJE1U1NvFo8BKwGSc
	mtnrZxktuqTlR842a5G8rQuEmXmDu3pkAM9wdEiW7XdAkNeNJfnvsjn1WPTQBQ0xre3QftJntubmE
	WtUzLf2KEmFpahH031zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLOD-0000000BRqH-1QET;
	Wed, 25 Nov 2026 22:22:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLOC-0000000BRq3-1but
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 22:22:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 734F86252F;
	Wed, 25 Nov 2026 22:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5867D1F000D0;
	Wed, 25 Nov 2026 22:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645374;
	bh=aamSgS9mN4fl3LNN9RVzzpQBmZHNs4ovTx1ZPQ9tpB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K706cijNYCe/Yc4AIzTkXKGEAkwDYfOsOKxwbipF3DsJfyYuEBvXcyst/xMEQLsxM
	 kdgxMLYhRuzuKHqw7MFQzMj2kW6nkuGDBmnTt5BLfzDtXRVE0omCsx2BmeH4hWw/NQ
	 UjmsAAcJXxuWAPvTOChX265gFU3fmuCHBsDmJX2jgsc0sLoKGiqy56UXdFNnjXPL+1
	 z5oKvNqof8cC+uCQo7XPJpPbQR0rYi8mJ2Pq2S1OvjgXKGL8jYNn6AbwqvaN1axuk4
	 2ENr+aEjSdN8h9SCofQFCkpj50JUfiNU7JdBIlUyXtSP6gWR9L8S+8yYiMDJVUtn8F
	 Q7oD9u3Qj7tzw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 05/47] cpuidle: Move CPUHP_AP_CPU_PM_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:21:48 +0100
Message-ID: <20261125222230.22508-6-frederic@kernel.org>
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

The teardown callback here only touches local data and also the local
power device under its power lock. Therefore it should be safe to run
against other CPUs.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 58bb74f0fcb0..acc6a0e6446c 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_RCUTREE_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_CPU_PM_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_RCUTREE_DYING);
+	WARN_ON(st->state != CPUHP_AP_CPU_PM_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1


