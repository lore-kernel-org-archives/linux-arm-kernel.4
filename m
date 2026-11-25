Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35158606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oO/05v3w;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Om0m70wA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m+xyA/YAPfZKLB3t/OQKpDGAdIcBthxhhZ6cpFMFCVQ=; b=oO/05v3wIXI+6G
	S2ZY4JayN6A+J3UkigqdrrjzALfaMou5TDa9PseDrEfL1N71tp5GQbjH/Jy31xs3KT23Dx6ZItaTY
	nOJyg3w1d9tNe9c0UDMVwtoLXkaATkvUZS9s2lQBa3T7V8ifzkE5WrlmQKn/Nlg3trH8Cj8y51ei/
	KM/BqIs0u9l8W3vGrRo5Xcm6fPXbm84GgxJEi1VHG/BWlXvp7JUuyPZjh+RJC3E0qit9h8KkxAwWS
	uA6oPLuegmaZaoIFpw+xjvojCxjDoWsrbG6FbHGUoXtRiXlbzyelv+fdWE+EEb6AzxzFFaSEJtpPa
	O13hReY9EsAvl+RbTUhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLRM-0000000BSlT-2pA3;
	Wed, 25 Nov 2026 22:26:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLPN-0000000BSB4-3qiB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 22:24:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E9CE6252F;
	Wed, 25 Nov 2026 22:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BFE1F000D2;
	Wed, 25 Nov 2026 22:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645448;
	bh=m+xyA/YAPfZKLB3t/OQKpDGAdIcBthxhhZ6cpFMFCVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Om0m70wAqLqaCfBUR96KJgX7tPsqxvw9bWDPwYUSct7f9/l1bAyre5US8oManeff2
	 ThPDmqiQHpr59GqOdzpT8e5iKy++8YjklUTxqzfwSZt+WIiMovG7b+VEqYGRP2FVIJ
	 codg79/aTAVHOfn4gsLopvxbTmiDGvH4pr4uD2jEplxaSmNSeRV/S7NzLdDr1crg7b
	 RJmDMi7vddOebLx6yFbv4CQvUMYHGZvZEq7KhKDWg0KEwZ9mjQ5Y8QqgYOsD+wJXA9
	 gvXBhXMqX4URyMoNLLO4JX243kelG61hhKge/rjcMyJHUq75oNWGbNeNys7p1Jrjxq
	 F9t5UGDsrdhUw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 24/47] clocksource/drivers/arm_arch_timer: Move CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:07 +0100
Message-ID: <20261125222230.22508-25-frederic@kernel.org>
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

The teardown callback here only clears the CPU from the
evtstrm_available cpumask, which is only ever checked locally for the
current CPU. And set/clear from other CPUs are atomic.

Therefore this callback is safe to run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 3c561a630962..6f4c609163e5 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_EVTSTRM_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1


