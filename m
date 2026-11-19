Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA32606A337
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZquBKRNU;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n3fQaOSc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tt34GVe7kBng/bcouD1dbLOnNpNCEkhyJnpoNOTfYBg=; b=ZquBKRNUYjjUjFdoXX88U6hi21
	yT2uDPFaJblz2lGl0FmqgAFG24IXCVJipF+5p92th3zDJOOuBEoruI8q2giC2YEprg378BpoVJfyz
	fFWmUexqZD4B93nYCYqGwjPk4Ua4N+VKMVQsz5w3iDLfm0aXVr2vQ+HaaCxTNGyiHOIcm3WJZ5ByJ
	uAYAqnHg5nDZElTwDHipHp2ECElwGjrJ7nj0LuIm1HTlVvcMtcoAr3NBlwfEMoLKR4GhoT5XICEyd
	+xkwK0GGKqraQ2qbiLa4Xsw4KqPQGsegK1bari6rjejajb5YJEcIfq6+/8g+L5fTpRCVwkHokLjtd
	6tMkGVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gr-0000000D5Tf-3uAk;
	Thu, 19 Nov 2026 18:54:09 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FM-0000000D3zR-3r1s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:38 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-57489477aabso177703b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114355; x=1795719155; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tt34GVe7kBng/bcouD1dbLOnNpNCEkhyJnpoNOTfYBg=;
        b=n3fQaOScX90T6a4SDrV4e5Op96t5QFA9a2Ppmu1G02aWrH7y3EH0ZMgvbSANbOBxfu
         sVS+cjqzFjG/3I9hFOmf6+yuaDg9BCJyUKixjc1JGxpRb+XAQgUYA1fjPMU2gBE0euJK
         cjUq9NEL2ZFVDj+8EljdXvV87zHsmmEIaRHmKeOhwfJlpy5tx4VQM7gwdnYD2Y2XYFHs
         J9sZ5bollFqB1n9RkuZUJ9sUN8arWyGA9PXPYNDxdQuCsm7Ni3h23RLUHbKdQSeEwwL4
         DvIkFJDZdkvHZcsPwgxrIO2CGCZQGAJhJXXjCf7H/itBkXdnxWPZITogig/O0y+e3ZrI
         tqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114355; x=1795719155;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tt34GVe7kBng/bcouD1dbLOnNpNCEkhyJnpoNOTfYBg=;
        b=be7/9JpGNRGA/MhgpyCQQn/FpzicNfJkdpsiT9mE6FGb+45s/eUXMRQOXsIjIJPET2
         E+4sZjYacH6vjmpwg+spdQMXAFCoEC6mAn1U/KUmhkLEpfi3MtGNT5CL5PLrfS3Mktet
         DaUR/Zq0gz2SBU6bwIze3/dXY3j4jHB8V7EgA1yAfx4N7fdCAUnCevOPWSPADStumIfZ
         pBDT86/fiOmI62AyZDVQdNYyyaH3Y2bS+d/GfH4GrSc6adIAPG/ljSp1h2i1rG6qIQQ5
         NqcMvCfJOQvib81XpTnIudy8wSPUxVZ8XFXvaMMxmSm3jZLYsC4A1M9fQyXjluN58GN2
         k5TA==
X-Forwarded-Encrypted: i=1; AL+hErE1ir2+0UVAHm7O/xPZM55nFwbCjxYMpJkjUiZ+NdGT3ux5Du4RBdw6La025177bqU+nuho00HLx4uPHRzlLIKe@lists.infradead.org
X-Gm-Message-State: APuU4Z/qz+JT8sOgD7EQF8433oV8foEaUntN7G68Pob+lWMpXIaNr3ME
	z0Tv4q2lBO6Osatj7QiYGGU6RjbaqgWZD2iKceZejWtETOdVbTFMsFcc7iErZC3IXA1jS3zU/JV
	SqWznjVYkZOV+AHl0qroXAQ13QQ==
X-Received: from jaho5-n1.prod.google.com ([2002:a05:6638:67c5:10b0:621:d005:6f2c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3c47:b0:4b9:e65b:8c33 with SMTP id 5614622812f47-57a09212719mr1036647b6e.33.1795114354568;
 Thu, 19 Nov 2026 10:52:34 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:01 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-20-coltonlewis@google.com>
Subject: [PATCH v10 19/33] perf: Add perf_pmu_resched_update()
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_105237_099906_1212055D 
X-CRM114-Status: GOOD (  15.67  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To modify PMU guest counter reservations dynamically, the per-CPU
available counter mask must be updated while host perf events are
temporarily scheduled out.

Introduce perf_pmu_resched_update() to update PMU state while holding
cpuctx->ctx.lock in between scheduling perf events out and scheduling
them back in. It accepts a callback invoked between ctx_sched_out() and
perf_event_sched_in(), accomplishing atomic counter mask updates with
minimal perf API expansion.

Refactor ctx_resched() into __ctx_resched() to invoke the callback at
the appropriate point.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 include/linux/perf_event.h |  3 +++
 kernel/events/core.c       | 33 ++++++++++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index e1e11500df097..8140457939658 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1242,6 +1242,9 @@ extern int perf_event_task_disable(void);
 extern int perf_event_task_enable(void);
 
 extern void perf_pmu_resched(struct pmu *pmu);
+extern void perf_pmu_resched_update(struct pmu *pmu,
+				    void (*update)(struct pmu *, void *),
+				    void *data);
 
 extern int perf_event_refresh(struct perf_event *event, int refresh);
 extern void perf_event_update_userpage(struct perf_event *event);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index e870f12c3ad81..dbc42ded5f698 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -3010,9 +3010,10 @@ static void perf_event_sched_in(struct perf_cpu_context *cpuctx,
  * event_type is a bit mask of the types of events involved. For CPU events,
  * event_type is only either EVENT_PINNED or EVENT_FLEXIBLE.
  */
-static void ctx_resched(struct perf_cpu_context *cpuctx,
-			struct perf_event_context *task_ctx,
-			struct pmu *pmu, enum event_type_t event_type)
+static void __ctx_resched(struct perf_cpu_context *cpuctx,
+			  struct perf_event_context *task_ctx,
+			  struct pmu *pmu, enum event_type_t event_type,
+			  void (*update)(struct pmu *, void *), void *data)
 {
 	bool cpu_event = !!(event_type & EVENT_CPU);
 	struct perf_event_pmu_context *epc;
@@ -3048,6 +3049,9 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	else if (event_type & EVENT_PINNED)
 		ctx_sched_out(&cpuctx->ctx, pmu, EVENT_FLEXIBLE);
 
+	if (update)
+		update(pmu, data);
+
 	perf_event_sched_in(cpuctx, task_ctx, pmu, 0);
 
 	for_each_epc(epc, &cpuctx->ctx, pmu, 0)
@@ -3059,6 +3063,29 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	}
 }
 
+static void ctx_resched(struct perf_cpu_context *cpuctx,
+			struct perf_event_context *task_ctx,
+			struct pmu *pmu, enum event_type_t event_type)
+{
+	__ctx_resched(cpuctx, task_ctx, pmu, event_type, NULL, NULL);
+}
+
+void perf_pmu_resched_update(struct pmu *pmu, void (*update)(struct pmu *, void *), void *data)
+{
+	struct perf_cpu_context *cpuctx;
+	struct perf_event_context *task_ctx;
+	unsigned long flags;
+
+	local_irq_save(flags);
+	cpuctx = this_cpu_ptr(&perf_cpu_context);
+	task_ctx = cpuctx->task_ctx;
+	perf_ctx_lock(cpuctx, task_ctx);
+	__ctx_resched(cpuctx, task_ctx, pmu, EVENT_ALL | EVENT_CPU, update, data);
+	perf_ctx_unlock(cpuctx, task_ctx);
+	local_irq_restore(flags);
+}
+EXPORT_SYMBOL_GPL(perf_pmu_resched_update);
+
 void perf_pmu_resched(struct pmu *pmu)
 {
 	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
-- 
2.56.1.708.g77570a6a1d-goog


