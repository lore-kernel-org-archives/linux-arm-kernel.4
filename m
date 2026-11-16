Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA23606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CB1sbZBb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F4CkdEFx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3S8KfE2z0glH5v8quz46BnbWAnWJFZkpiRBDqpKkjZU=; b=CB1sbZBb0oZK+2OjrynINFkQur
	vdCGffInDfCJGulZI8DoYGLMVuFxhsvatvssufF36G2zhV2MyL6NZJlPN4pz48CbUh48BYDv546Kt
	KkqrxXh3yzgB+vpj3UiqxtjHKdxXo+vDuolfE4HaykOqBd/Er/cM5LtKtZArco1h+v7opUXPqf8ix
	ey9Y+FE0UBo5cV3tiCxmKqQ1W9PQ30tIUqQYWqoRyQOzKTzQXL1TCrKw53vwH7/ub+D7v0HwNjprI
	zdxW9VonACJyNhQaEfE4m2vjI+4vwNBErKyFDOE0GmBfaGkn07KGoupyqCcA3A49c/DvNC5CECc7y
	/ra76UkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrY8-00000001TSr-3fxQ;
	Mon, 16 Nov 2026 07:54:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrY5-00000001TRM-3enW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:54:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so6725735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815682; x=1795420482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3S8KfE2z0glH5v8quz46BnbWAnWJFZkpiRBDqpKkjZU=;
        b=F4CkdEFxu9jQHijvKr+olIm+LDR1L/kcMdynCmXRZXq91btHlSW9wMkwNVhhYI6nxe
         nrwQgsHfExoIVLNSfFhAnA46MtbbeGkaDvUp+8pn7itw6Cm823B2r/Kh7tkuC6wjDiWK
         UJZ4BRe6k+3xEFM6RujhZcxhGZcYZy87nXaHJ7x4E3WbA7D2WXl9RqTScgzAX0jcqzGI
         4KigOVyMZkx7+V1jFaeD10DMDTQXBi5v2t5opuDc9O7LDmFRUbCF1EjI/lih1mu8gNse
         XwlXZ2zDTNQW+vAXC14UN86T1vmsduOftKWNueSqJ11s0olLjyVn08DYUGAiPQFllHcy
         BjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815682; x=1795420482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3S8KfE2z0glH5v8quz46BnbWAnWJFZkpiRBDqpKkjZU=;
        b=XGrUUk6lvG58n27xQKg2Q3rDD3UQcKdSt/Y4ozSC/0rGDhvRM33JVqToVNhSgu0NEw
         2Ra5dlgrQQxJhwRRxF6QkJGhVtNj3wNEg7qddvEMt1HyMROY/Cim4GzvwG3y3KgOAgaX
         mDRBj1uQuvNEQE1v4OJbYgfYj4If6sSgh7k0HQBx5rSt6qFzSoD6QaXaQoWop040BbgT
         TpkCxSZqqVMMrfjX7EF9YtB4ioxOtMbtcq6eT0Xi5YrOiX5mbO+6YxUr5V0LJwQtPIGB
         fudjr/yr0o8Gs8PAjZ9uGhxFfYN/uN4SCFA0WhWBaljn6PTcrAu4ft8ykm+RIVYjuhjN
         sPew==
X-Forwarded-Encrypted: i=1; AL+hErFG5gUoDRnjvf5leg0h5cY1eVBPHaJUmJWydhSQ8pX5rxjag3jQmnotsmOgZt23OTZFqxqWfavdU9vk/shF+6/w@lists.infradead.org
X-Gm-Message-State: APuU4Z818sSb+JQfAcorrvq6xtq681EvnRgqaoegg/yH6rCSKe2JOCxa
	7tbN8o7UWZTck0Gz7qxN0kHUYPW2znMdnduQJh3zIz9kD+hMTVNCObng
X-Gm-Gg: AYBFou296csj+Z5/P8iicX70OCQ1LQwpWC4DFU7fiRsCsYZGQvo9ft61s4HFkQ7KU2q
	oQl+jm+9DlemO0h9wBr5DNKg93Irkj4DWybeAO4r8rFALslGWJJO5CZhRzhbrrIIqPPsBxQTru/
	v0ud/TRhOLyW0uQqdVAPIw7nVMNULZ33w/ex73J6GD/ChLVoR78uM3EPIjn4WUaXmeMA+Rl2V0O
	lQmDpqLI86JItBx7CTUbxU2n2xMZVW6md9oIrNKV7KVLw0iMwAycaVtuMb14Fle7TR9ep5EAJUM
	T4PFvbDLK6FpEyCsIxXKVWq+dwID6hLufpG8YDhkRvr1mb76hrK42Au2B307hZdI0IADvaRtftd
	yI8v6dKpVzfZC0406y6g1AyBtYzSG6KAGuQnUFXekFKYpE1vAZUmt4pY+7HcmJb5prAZ8u6xPi2
	UQmH96BwnWskyt03JTslMDYmFpkye4IXNqjrm+gS2YmDviLoJjs6KeLt5O1TR1DHJdM0UKFs9wd
	nJfUwc9954MCkYbKRIFEJEPrDViIQYw8I1S939Whqza9oLXtfSqLSe+dllWH/ItG+pJJyDsnimL
	Nbqle4foZ2wfL2ZFbgD5E4eLwdr3V9nS9+TirRiLiu+etDyL4DYmzg/ZBPREA+XMgDEgiDqVFML
	9P4cUXpIY6nkSsUO5SBlgnnIO8NRBvV4vcGQzovrdbBNp7gFBoV1+lib+EHsZEU81M4sGgq5tf/
	i9mQLzSDVhwBk+s/8ndVP/Wf3H6ago
X-Received: by 2002:a05:600c:2d2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb55a63720mr149965015e9.24.1794815682214;
        Sun, 15 Nov 2026 23:54:42 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-117-148-032.95.117.pool.telefonica.de. [95.117.148.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm210329875e9.14.2026.11.15.23.54.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:54:41 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] sched/preempt: Check notrace preempt-count updates
Date: Mon, 16 Nov 2026 08:54:21 +0100
Message-Id: <cover.1794814699.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235445_945823_7759965C 
X-CRM114-Status: GOOD (  12.70  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CONFIG_DEBUG_PREEMPT, the notrace preemption macros bypass the
bounds checks used by ordinary operations. Add checked noinstr updates
for their existing callers and share validation with
preempt_count_add() and preempt_count_sub().

Patch 1 forces the arm64 raw updates called by the new helpers inline.
Patch 2 does the same for preempt_count(), which the helpers use, for
should_resched(), reached by the debug notrace enable path, and for the
existing non-debug __preempt_count_dec_and_test() path. The corresponding
x86, s390 and asm-generic operations are already __always_inline.

Patch 1 is extracted from Hongyan Xia's entry RFC. Song Liu also posted
notrace annotations for the same arm64 helpers:

  https://lore.kernel.org/r/20261023011049.1164625-10-song@kernel.org

Patch 3 disables branch profiling for core.o when DEBUG_PREEMPT and
TRACE_BRANCH_PROFILING are both enabled. DEBUG_LOCKS_WARN_ON() evaluates
its condition before entering its instrumentation region, so profiling
that condition would call ftrace_likely_update() from noinstr text. The
scheduler Makefile already uses this per-object exclusion for
build_policy.o and build_utility.o.

The cost is loss of branch-profile data for the rest of core.o in that
configuration. Scheduler tracepoints and function tracing are unchanged.
A dedicated non-profiled object is the fallback if this object-wide cost
is considered too broad.

This series is independently useful. It also supplies the checked count
update planned for follow-up IRQ-entry work; it does not change IRQ entry,
trace-recursion lifetime or TRACE_CTX_TRANSITION.

This addresses Peter's suggestion here:

  https://lore.kernel.org/r/20261029093219.GH1779021@noisy.programming.kicks-ass.net

The series is based on v7.4-rc2.

Testing:

- Clang 19.1.7 x86-64: a W=1 defconfig-derived build with
  DEBUG_PREEMPT, annotated branch profiling, DEBUG_ENTRY and noinstr
  validation passed. A nested-KVM boot passed the built-in and external
  module checks and all five tracer workloads. A DEBUG_PREEMPT=n control
  retained branch profiling for core.o and emitted no new helper symbols.
- GCC 14.2 arm64: a W=1 PREEMPT_RT build and allmodconfig passed. The
  latter's nVHE object had no undefined references to the new helpers.
  A native Axion boot passed the built-in and module checks and all five
  tracers.
- GCC 14.2 and 16.2 ARC, C-SKY and MIPS: performance, size, all-branches
  and forced-noinline core.o inspections passed without prohibited
  noinstr relocations or branch-profile records. Full baseline and patched
  kernels plus the external debug module built. Matching QEMU boots reached
  the expected balanced and invalid-count markers on ARC and C-SKY UP and
  MIPS UP/SMP. The patched kernels diagnosed every invalid operation;
  rejected decrements retained their counts. An ARC DEBUG_PREEMPT=n
  control retained core.o profiling without references to the new helpers.

The MIPS UP baseline and patched positive boots emitted the same three
existing smp_processor_id() diagnostics; the SMP boots emitted none.

I used an LLM to help extract and review the changes, write the test
harnesses and prepare the commit messages.

Hongyan Xia (1):
  arm64: Always inline raw preempt count updates

Karl Mehltretter (2):
  arm64: Always inline preempt count and reschedule checks
  sched/preempt: Check preempt counts in notrace helpers

 arch/arm64/include/asm/preempt.h | 10 ++++----
 include/linux/preempt.h          | 22 ++++++++++++++----
 kernel/sched/Makefile            |  3 +++
 kernel/sched/core.c              | 40 ++++++++++++++++++++++++++++----
 4 files changed, 62 insertions(+), 13 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb

