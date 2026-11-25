Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C69606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BmAg/hec;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYQ7THR/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wXVhNpPhMZerP0BjB/K+dlonu1sylB9X1MKZXQ/YNw4=; b=BmAg/hecKUVsVJ
	76EHNd4odpp/YMQN1PeJtMbMOpbDC3pAgD32g6sbOQRdp44PS7LReeHhSqkbPSwnQftFFBin3MnS3
	rrZfwTOgc5yn/LHfHanpN0YUNNsUMQbdlMNr0jdapieRkXt/QJWJKebYnMxvmOcdk+44plKHZgAcL
	yj1UgcSCn0q1afg/ou3ewuVmBvFco4oPQOHoZu3thxeB6lPLIuicVKFcSxIxV+QQalAGMpxbbNdmW
	J6Xb1vV6r0FJy/Q2s5/sTPOD+5uqhrQBvC6En1CGSLl0gTnNOuB43ueZC0tLN73vjOPmghiKVZoUQ
	bmI+E+3RqmEV0ECRKEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLRN-0000000BSmL-0fdb;
	Wed, 25 Nov 2026 22:26:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLPC-0000000BS7u-0vmG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 22:24:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A940462572;
	Wed, 25 Nov 2026 22:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06331F000CF;
	Wed, 25 Nov 2026 22:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645437;
	bh=wXVhNpPhMZerP0BjB/K+dlonu1sylB9X1MKZXQ/YNw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HYQ7THR/r0LUPBIs2azTMg9aXQjjT0xwkWSoxHRTMEsRCTehfc6uJ9JgON/FhjVB1
	 fsSrbz7Ag67YFDjwWzjOL8Q4RnDPF6q9QJb9f8ZPFS2z88D/IjzvP/toRtbr2MQvTz
	 RJto1B4FuW8XIhXjVFipGNQDEwvc5YwGHNXRw8g2b9uVDt6h/b8ri1Q5kQFKNkEnhw
	 52MaDmrdZxtyeT9wSZZxhzit2C7YhBZrOPdYzo9vo8wO65L7yzo/FA7UrxbNsaQj3N
	 o0gv5e4x4kBrfT9Uh0Nq5KZjCvA7nIljUH/eSu6EuUBDUGa4aR84wA3lS5bG1THWjD
	 TfmmDYAYReCwg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 21/47] ARM: l2c: Move CPUHP_AP_ARM_L2X0_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:04 +0100
Message-ID: <20261125222230.22508-22-frederic@kernel.org>
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

The teardown callback here disables the L1/L2 cache prefetch and the
write full line of zeros mode. These operations should only impact the
outgoing CPU and can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 2ad19f3f2563..498ff31b24cf 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_RISCV_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_L2X0_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_PERF_RISCV_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_L2X0_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1


