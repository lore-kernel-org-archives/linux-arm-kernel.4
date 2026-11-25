Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4520B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JWVsIG+m;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lE6b9s1J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r7eUaTnWbW2BvWRMxbh7jxrAwYjypRP6/USaM3f8jSc=; b=JWVsIG+mKV78GK
	TM9U1OgA1VMYobo6VweT2JCIXMp6JwzeikEfD4T4naV8VliR7lFqhHFVuekr3V47N6JKqjc3HIEX1
	ijhtQYFC3FNdQ0vtwxemOiFpRvfbl4RbhDsWX1AUyjdvrF4FBex2v+vtjhyb+N+4fD8uZU/tW10yI
	GK0oyzSCuv/FibRBma7fSBENSDbjX5Ap/pxcfwO+9arOkQChHcmegNbuF70nkFoet0Vh9z6c+WKgY
	wRU+mh5sT/jR8yw1y5o1O9/RPlVXgooSZgsbzC/blz5rbGxRyRbE3UBgdqLeJiLZN0+6/zrMveRZs
	JN0R9yica9BjW2bANjuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLOr-0000000BRyw-3zEQ;
	Wed, 25 Nov 2026 22:23:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLOI-0000000BRrR-3mHA;
	Wed, 25 Nov 2026 22:23:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49FC045A3B;
	Wed, 25 Nov 2026 22:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF201F000C0;
	Wed, 25 Nov 2026 22:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645382;
	bh=r7eUaTnWbW2BvWRMxbh7jxrAwYjypRP6/USaM3f8jSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lE6b9s1JOiMcuk0tl00ORQIVp/TqENoNenSc4MHhpzL1/mh/B9Fcex4T3YHvnwQVP
	 BsS9AOq0FSojdESCRxM4ohPebxnm0Y/4EjEsernBhblYeHJ7PpBl7aQ1Iy61vD+RW4
	 Ry6ZH7TPTSGhmv031pJrz5Pabp+TRRB3tZy1vFozj/gyCBteaSKPQ/V5vhs+XRh2V2
	 vUtGS1t630PkCAqfDRh+JStGxDwbllxj9wEAkkrjhLiMZs9RkuhqnHaXPgh4GLTZkf
	 Wp+9MFp/USt5oYoJWx9uyfy9dumWGlXK9LJd47LWvMEN3fEdYQkP5rnlBuLWP9uiGy
	 7+9+yfIaWHUHA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 07/47] irqchip/bcm2836: Move CPUHP_AP_IRQ_BCM2836_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:21:50 +0100
Message-ID: <20261125222230.22508-8-frederic@kernel.org>
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

The teardown callback here just masks the per-cpu IRQ in the chip and
shouldn't race with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index cb0eb71c27c9..2e162425bfc7 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ARMADA_XP_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_BCM2836_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_ARMADA_XP_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_BCM2836_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.56.1


