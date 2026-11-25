Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E56B606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aCmKMIzD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Td8JxagP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VgTb4TX8hzSCfpylfGvwRlsr4/jJFplNoBwpIYBpwfY=; b=aCmKMIzD/HCTrN
	XsBMDBqn6aUG1ZH+O6owR0tH/Hiv8tss3QR9ocNR5RMf3nijnqZFoz4qYl4hxBZVRkV33/d2bL6VJ
	VI2EOHvBPlUZZEOhHHMHun8ddp3oRmaUp1FNOmhaWWF7zLGPhm4F7FvjGGvbsMi0AjNMKxAk4COqm
	w6EKdvlSVruaaVn0Z1F0iL6PKWXb1210wymJc+X4PmS/rC2/9niabXj06JuXiWHql6bBd8cGN7qU/
	NPUGm6oI3eMI3EkLl9sDfNUnASmP4ITIzPD0cT3Xzj4aB5wcWV5f2yxxFxR75CekSyHN5LKGMa8JK
	9G6llwPnoYVFc8Co5o/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLRN-0000000BSmV-16R3;
	Wed, 25 Nov 2026 22:26:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLPG-0000000BS83-1KMb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 22:24:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BFD0E62C8B;
	Wed, 25 Nov 2026 22:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3978D1F000CF;
	Wed, 25 Nov 2026 22:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645441;
	bh=VgTb4TX8hzSCfpylfGvwRlsr4/jJFplNoBwpIYBpwfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Td8JxagPa5bb2bHNmmgTkt52zw2sMAOxNh1N23fgWTCqYSD7S4iOh/Ky/iOLiFBzz
	 vENDskhM95lMdOquE8agfjRyZdn32sJa4PQVa+mR/uNp4EXLJkdDbyfHwFlzV5pIKP
	 KtYFNkVmgev+MaZ8E/wVIDsMQvzKC6BdaWj14Z2Y8iDeG6nClYAwLd3B8OnzNa8MLv
	 /hZvphcguSBXOhumrK0MtlRz8vHBE/8IafFOh8s9J20G7xExH6O21MjULLHNNwvbNi
	 jpBcTq/UpEEGqIfqBIc8XxmT/myF/EJIzFY6wRtgE+0DX4c2VMCY/qCwzCs5YEk4v0
	 W1Ab7snS2sm0g==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 22/47] clocksource/drivers/exynos_mct: Move CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:05 +0100
Message-ID: <20261125222230.22508-23-frederic@kernel.org>
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

The teardown callback here simply disables the IRQ and clears/ack the
interrupt bit on the local device. All these operations can run
concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 498ff31b24cf..a4db04807aa7 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_L2X0_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_L2X0_STARTING);
+	WARN_ON(st->state != CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1


