Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA16C606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m9B7lMin;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RHVAYtKS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RoqvmCK2qkOodjdsXGnbvnsvP/GHWBE0XmbngxrSrDA=; b=m9B7lMindGF8WpSd4kdEn3vbm1
	24ETfTQfeLTtWX8T4OfIXcVXSn3LRE/RhlOLNXYIFLn2ZnRay4eO1hR+P2rocqRvG8jkhKTqm8O6C
	5PGNiF4ZtUB8xJpadSoBPW9nfs5lVuD3A7U/uRRo+i8SM74Bf2/V+eCG8okBVouZVL4TvCsdUQYku
	QC4MNTmWRZPbzSZEIDkN+pFSexiwNfbrOvSjR8DzwZKbPzHmXLKpbRe+R+xbr5S8luu8MIWOOT3Vv
	kj49GDdnq+1fi5Nb+3Ng3ecPR75nCnGPl25mkCH5rsi21YgMceXqnPWkm1Q1GrCZJVjHRmGISxZA7
	ir+A0lig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gs-0000000D5Ts-0Pjh;
	Thu, 19 Nov 2026 18:54:10 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FN-0000000D41e-3VhN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:39 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-574ae6cc614so1183886b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114356; x=1795719156; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoqvmCK2qkOodjdsXGnbvnsvP/GHWBE0XmbngxrSrDA=;
        b=RHVAYtKSyQapVnwHCw5CsnSiCK8zbe8wlQhdY49Js6+SQI+YP2LY7AzUibhH+Rt1Gr
         goxFqXkIFVUrhrnhDjLqDy/klaJqRIb5rKbTH+OQ0hGinAmu29QjHblruPcOq76cP91b
         o9+b1et3Rq6aWe8VG6+FQmdv94poyYCTzk4cdElzK0fXpdfIUq4KCBvfJz/NbeKtiqDS
         iS1uWw/t48KDSMfVOnmWR8e7GjVyiIVHlChzvnM7YgBn4avqrYVXJwbZZ2hxnTjIxcH4
         tPQlmF5phNLQ0bLWAaFMtjKCY+1KIBOZB0KgzZU0jfVshr+N8CeygKZUaSvBzKs6h7bt
         LpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114356; x=1795719156;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoqvmCK2qkOodjdsXGnbvnsvP/GHWBE0XmbngxrSrDA=;
        b=1u73PvYtzvcRh2jk6+WdPXCIRpc8/A0TpW6nsw3Y4eYmmFcTUjX3si3IbfNe2PmIRa
         atnwgtqh4SvHUOyJdVl5dlocn+XaMkfMQAUbxuGIKHsd1HGVLSHVkSeH29/ZFYy7i1ph
         b78iBafld8T34Bc1ncGvtTXe+cIGhOfhZG1fvYS5iUWMb4eS8N5wnRr+SM9wCXMHn8WY
         hXMDAoVpCldGfOLRdRheOANJXpgsW4Ko0ZzgkFvNM8yMgUvTMB81lvkvwz618pE+xexn
         X6WM6Oj6YI1HdtjsWxMgjFglccsTGhEd8oe5lEisLzxCAlP1HcgBSnyRaWVBzvMKPjYT
         veng==
X-Forwarded-Encrypted: i=1; AL+hErErqGZuVj8fJ75buv+8HyHZWbF+LShwHuxyGxvlLcaH7g8BIXReLNj9gaLM9JsoqA+VT8wz0WM3PRUpwbq9A3jZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8hNsdmweWQby9tQ/xOqqkWV0QG54rxHyuKqq4GTvus8gxgr4yX
	blJRxDHrsJKvpjfQN576E7HRp2ESjOSbygt7a6g2+i+dikMTakqlPGpGPP6mIWFts2F3XEP8Zap
	yGfv8vTMFykka+MQMQ5juJUiUbA==
X-Received: from ilen3.prod.google.com ([2002:a05:6e02:13a3:b0:524:d8ac:6887])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6b8e:b0:521:561a:8e8c with SMTP id 5614622812f47-5797d6add74mr1519937b6e.33.1795114355656;
 Thu, 19 Nov 2026 10:52:35 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:02 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-21-coltonlewis@google.com>
Subject: [PATCH v10 20/33] perf/core: Prioritize kernel-owned pinned events
 when scheduling groups
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
X-CRM114-CacheID: sfid-20261119_105237_969891_23407843 
X-CRM114-Status: GOOD (  17.41  )
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

When scheduling event groups in visit_groups_merge(), pinned and
flexible groups are ordered by group_index (creation order). Normally,
kernel-owned pinned events such as the hardlockup NMI watchdog are
created at boot with group_index 0 and are scheduled ahead of userspace
events.

However, if the NMI watchdog is disabled and re-enabled at runtime
after a userspace pinned per-CPU event is already active, the
watchdog's group_index is larger than the userspace event's
group_index. When hardware counters are constrained (for example, when
PMU partitioning reserves counters for a guest and leaves only one
general-purpose counter for the host), the userspace pinned event
claims the remaining counter first and merge_sched_in() transitions the
kernel watchdog event into PERF_EVENT_STATE_ERROR.

Order pinned kernel-owned events (is_pinned_kernel_event()) ahead of
userspace pinned events in perf_event_groups_cmp() and
perf_less_group_idx() while leaving flexible groups ordered by
group_index for normal round-robin rotation.

Suggested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 kernel/events/core.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index dbc42ded5f698..6b82029b8ebc5 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -237,11 +237,16 @@ class_perf_ctx_lock_constructor(struct perf_cpu_context *cpuctx,
 
 #define TASK_TOMBSTONE ((void *)-1L)
 
-static bool is_kernel_event(struct perf_event *event)
+static bool is_kernel_event(const struct perf_event *event)
 {
 	return READ_ONCE(event->owner) == TASK_TOMBSTONE;
 }
 
+static bool is_pinned_kernel_event(const struct perf_event *event)
+{
+	return event->attr.pinned && is_kernel_event(event);
+}
+
 static DEFINE_PER_CPU(struct perf_cpu_context, perf_cpu_context);
 
 struct perf_event_context *perf_cpu_task_ctx(void)
@@ -1781,7 +1786,8 @@ static inline struct cgroup *event_cgroup(const struct perf_event *event)
  */
 static __always_inline int
 perf_event_groups_cmp(const int left_cpu, const struct pmu *left_pmu,
-		      const struct cgroup *left_cgroup, const u64 left_group_index,
+		      const struct cgroup *left_cgroup, const bool left_kernel,
+		      const u64 left_group_index,
 		      const struct perf_event *right)
 {
 	if (left_cpu < right->cpu)
@@ -1824,6 +1830,9 @@ perf_event_groups_cmp(const int left_cpu, const struct pmu *left_pmu,
 	}
 #endif
 
+	if (left_kernel != is_pinned_kernel_event(right))
+		return left_kernel ? -1 : 1;
+
 	if (left_group_index < right->group_index)
 		return -1;
 	if (left_group_index > right->group_index)
@@ -1839,7 +1848,8 @@ static inline bool __group_less(struct rb_node *a, const struct rb_node *b)
 {
 	struct perf_event *e = __node_2_pe(a);
 	return perf_event_groups_cmp(e->cpu, e->pmu_ctx->pmu, event_cgroup(e),
-				     e->group_index, __node_2_pe(b)) < 0;
+				     is_pinned_kernel_event(e), e->group_index,
+				     __node_2_pe(b)) < 0;
 }
 
 struct __group_key {
@@ -1853,8 +1863,9 @@ static inline int __group_cmp(const void *key, const struct rb_node *node)
 	const struct __group_key *a = key;
 	const struct perf_event *b = __node_2_pe(node);
 
-	/* partial/subtree match: @cpu, @pmu, @cgroup; ignore: @group_index */
-	return perf_event_groups_cmp(a->cpu, a->pmu, a->cgroup, b->group_index, b);
+	/* partial/subtree match: @cpu, @pmu, @cgroup; ignore: @kernel, @group_index */
+	return perf_event_groups_cmp(a->cpu, a->pmu, a->cgroup,
+				     is_pinned_kernel_event(b), b->group_index, b);
 }
 
 static inline int
@@ -1863,9 +1874,9 @@ __group_cmp_ignore_cgroup(const void *key, const struct rb_node *node)
 	const struct __group_key *a = key;
 	const struct perf_event *b = __node_2_pe(node);
 
-	/* partial/subtree match: @cpu, @pmu, ignore: @cgroup, @group_index */
+	/* partial/subtree match: @cpu, @pmu, ignore: @cgroup, @kernel, @group_index */
 	return perf_event_groups_cmp(a->cpu, a->pmu, event_cgroup(b),
-				     b->group_index, b);
+				     is_pinned_kernel_event(b), b->group_index, b);
 }
 
 /*
@@ -4024,6 +4035,9 @@ static bool perf_less_group_idx(const void *l, const void *r, void __always_unus
 	const struct perf_event *le = *(const struct perf_event **)l;
 	const struct perf_event *re = *(const struct perf_event **)r;
 
+	if (is_pinned_kernel_event(le) != is_pinned_kernel_event(re))
+		return is_pinned_kernel_event(le);
+
 	return le->group_index < re->group_index;
 }
 
-- 
2.56.1.708.g77570a6a1d-goog


