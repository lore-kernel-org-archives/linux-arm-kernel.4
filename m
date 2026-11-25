Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DE9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PkvjxO6y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FH7U29fh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JFDwj/pnESgT5RsqZkiNTJbiciIkfCBVY6ENbjGVw0k=; b=PkvjxO6yFmehDW
	1WyYyEvgzSkJ+iIK64RWn8FzT58qY1fY7Y3CL/vHI01BmKvursfK67JJd2WNzW8PxkEdCaCPv2MNi
	Ab6LDu6za3i++joqsosGrvADz3IfMtNuvWXWvo2sQU2HJcbthfzXxh06HUAttnDWqQxo46WoZjkOU
	UZ8e8bt5GWmyDVRN6E+k6pwwZ7zloneHKvAlUeTRn3jJOIkfPDOMGqalmus2WFnyTrz3un6dsMFrC
	T+qf81yuJNj/cQMwZZmgqu90fIg7nYRVbqgaTnOvLAXchZ3WNs19g0h2UPTfJHYuZBxSW72OjBWGw
	PPzLaiJvzrUH7VPbee9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLWe-0000000BTrR-0Ra3;
	Wed, 25 Nov 2026 22:31:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLP3-0000000BS6H-14Mi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 22:23:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AFB036219E;
	Wed, 25 Nov 2026 22:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D9D1F0093E;
	Wed, 25 Nov 2026 22:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645428;
	bh=JFDwj/pnESgT5RsqZkiNTJbiciIkfCBVY6ENbjGVw0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FH7U29fhqrWoUnmnlK5PZyT86FuUn/AgnUxf8pxztjah6wSOhvxZG2dg0Zeb2gQUX
	 AEwbd0DIreFMRq/S3s5w2j+iZ0Yp5jsHMXzARDzndg4NoJCeACknCfaUG78GWkZt28
	 Ex15ZAVAJsQBLJAnQtrpKSo+Xw+/4CjdtA+VRYVHbaIbENIH0jfp9osSre7vnNAoSE
	 eR8vC7UZiJbdjKGgVgVAH/phC/j8//tj+f+5C+DPAF8tMM9sBCZLtCu03iTKvLSX8K
	 jvfl4dzbs2uQmH5sy9UTnv7KGUOW9uIgkd6+BaBoyfgc5DvjgDwv+r7oVb3dgxpjj+
	 vCRFRFrhFLpKQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 19/47] perf/arm_pmu: Move CPUHP_AP_PERF_ARM_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:02 +0100
Message-ID: <20261125222230.22508-20-frederic@kernel.org>
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

The teardown callback here just disables the IRQs for each PMUs, which
shouldn't expose any specific race while other CPUs are running.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 37cca370794a..632103c9b4d9 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_ARM_ACPI_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_ARM_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_PERF_ARM_ACPI_STARTING);
+	WARN_ON(st->state != CPUHP_AP_PERF_ARM_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1


