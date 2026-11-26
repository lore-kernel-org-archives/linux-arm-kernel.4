Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC6606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i4LucD5P;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ltY/Hblt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=D9BbuCBvz+3YcHKVGn/xJbMHO6prVxAgpemJ515Bw74=; b=i4LucD5P7xv57TXRiVJnXGr+n4
	e9hZEe/mXOYYuKenQ7CH6dGJrVSA/ndCoRbq4euJ0kT8sUMMnDZfb180VkHjkSZ4DoQ6XkcaurWFn
	KLTcBWVGaJxoiiNx9igeeGevlbQxl6uTGPLLvxrasPeBG3ofgnMvSc2eXGWIj38FBFyGPJjzeFUfe
	33SlPVaJr3o00mshVFZ3CJqPGKB2UmvJwqt1L04ZjssFw96UaWd/VHh6j3KW1msEBsVQuSLIr5WOJ
	mAOfMV5uLpC57FfCprOxypIJj0lLvv+r1hGkyqeolEaDdKS7xMphJOkaVcT4EOmyS14DnRpjvXN/2
	uazfCfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPGP-0000000BtqJ-0rXQ;
	Thu, 26 Nov 2026 02:31:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPGM-0000000Btpe-3OWO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:31:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3699236f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660265; x=1796265065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D9BbuCBvz+3YcHKVGn/xJbMHO6prVxAgpemJ515Bw74=;
        b=ltY/HbltE6yUaZtXc+w+v/RNe4J3SH+iXz0QyHloiK2sIdGqlbXuBE0pbSBilx+LSI
         E8JVDV/5vS84bIx3MeL7yOFBNqVyGEE6p3Q0Z/FwWXq5l/d10Im4hWnUGYHzx92ktnhu
         iWCwdyebcB7M1/R/LQgHuThhkrH8sokuPEjHUhpzmCIccOIRorMJjTDLQfFcVXAaQDfl
         sn/R3JvUabqJE3FXiJ4aRZvho9ffo1/8yQN1NfZdqzI+zJRDIF0f4fDv3IAVaZSa/Sr6
         FVtrdz7oU1YhHv5QCMEi0LkCuWrc5MbvZy8zoloeozLiR5hC06icpBNEG6fR3fJZMJK9
         70Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660265; x=1796265065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9BbuCBvz+3YcHKVGn/xJbMHO6prVxAgpemJ515Bw74=;
        b=e3KTRlKYN0gQoC/JnbVgV2IX9O+pSHMw2hwDL9DuKzRJYSfv6/vtCjbcVCblpcX9q8
         tyHLqRNGzSwqbETBeRBJ1H30vNlQA/CewNaNRy1Hgo+fydm/viKx7wXU7KSzz1QQX0NM
         xdnPFtEa9LeFMy8rn333fdNhx82rX1dD9RDPSTpfGluWPMubNsafLaEBxRqMj3hucHix
         TGaoCMzLk848tO7vh7p5UgZAcox7ZCE2wUT3JdmXcIrlcOo7LcLGvEdjaOirohKUGVSz
         zxb8kemYAeSM2ytB/Gmx0IV3q5L8loW7nM8M1P5/nIStciJuqr+mrYWDgm/mpSsBWof5
         SLGA==
X-Forwarded-Encrypted: i=1; AL+hErGAmT1PZlx8FEy768vvBYcZGPrWmsw8lWeSMb1KEe7vO9VoSZb+tcT6SHBtqs+keWIksTAGQP2eP8hR9LX2c+d2@lists.infradead.org
X-Gm-Message-State: APuU4Z/lUqWUXPi/ANTpCOmC83Lf7/uTrpPlJXLQAnNtg2zIsmLslzi8
	bniI8EWG0DYkUfpLq5khwlSqvVYh4K0yWs/2hnkhO4k6lrv4lZcjIxsl
X-Gm-Gg: AZFdTZfifIRIVXu79dyQUK2yfVSanZKE+7ZZkibksA0+xPhWPXR/OAUMYwR9xUCegi4
	xTpcW2e3oXpXaQyKiDC9hH9ih6V98CHQNUGhMJJDqesTjdwF1GOwsuKfkAQTqETgZap9f31inZP
	F5QhnuMkpBX3ztmz71JeTV8APSIFd3FuGDHLYVMICqLc1griJGK4Kslkq5hIK8Z1sHuEiH2nqSt
	sIns1rf99j1xmyvN4Hb4nfsq/OoHDF5rSM7MS4o2eDvOCtzJAmtZkH9g50lbF0w4w35mgmaNEYt
	RwSdrm6hl4bozQVceNYBMfJE7DPkXQffH3IPfBLUJZBrAoMX+n8vFqJT6fjZQbC0E/ofT3g8FUq
	UyaFSnrl9wf+u+9impOjLEeSeasAqMGLThkFeqYs7ScNCnuaG0tUrLFCm9eDhz6hZwbRIhIbSQk
	4k/7QaMxHz8iet22boKfMzkuE+/0j9VCz0Douf7Mdb1mjj8Ux+SKYqhCpxiKx6rjD8hCDo00dTd
	DXQRmW3CtfDOC0Q/wvG2WdvPh68IYhHzlbOXKOE5PMulw0h+q3c87B5fN/MPEX5AFGqqET3ME22
	Ct0jxhlf72RSkdpWFNzd9aSsbAyY0NjKzk0I8OwhUd8HACpQ6L0rTFYyuAhS/0gg6EzODk1tdEB
	E/uuQhGslXSNEBLfYWSa8BmZxxiutE7zzgpbKC/llRm06sqOfnzw7e8nt07aPgiurKERIx8VAOi
	KKaCkpkVv8wwYkUrPlitN8Wih2oEomWojZSkkL2Q==
X-Received: by 2002:a05:6000:2c05:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4abb19c16a4mr38680089f8f.22.1795660264607;
        Wed, 25 Nov 2026 18:31:04 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b10e-d501-d0c4-b021-8d77-e472.310.pool.telefonica.de. [2a02:3100:b10e:d501:d0c4:b021:8d77:e472])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm37722445f8f.20.2026.11.25.18.31.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 18:31:04 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Song Liu <song@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] sched/preempt: Check notrace preempt-count updates
Date: Thu, 26 Nov 2026 03:30:51 +0100
Message-Id: <cover.1795631277.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_183106_926427_2CD9EC25 
X-CRM114-Status: GOOD (  12.77  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CONFIG_DEBUG_PREEMPT, the notrace preemption macros bypass the
underflow and near-overflow checks used by ordinary operations. Add
checked noinstr updates for their existing callers and share validation
with preempt_count_add() and preempt_count_sub().

Patches 1 and 2 mark the arm64 raw preempt-count and reschedule helpers
__always_inline, matching x86, s390 and asm-generic, so noinstr callers
keep them in their own section.

Patch 3 also disables branch profiling with DEBUG_PREEMPT to prevent
instrumentation from reaching noinstr text, covering both
PROFILE_ANNOTATED_BRANCHES and PROFILE_ALL_BRANCHES.

Patch 1 is extracted from Hongyan Xia's entry RFC. Song Liu also posted
notrace annotations for the same arm64 helpers:

  https://lore.kernel.org/r/20261023011049.1164625-10-song@kernel.org

Changes in v2:
- Patches 1 and 2: no code changes, added Hongyan Xia's Reviewed-by.
- Patch 3: replace the Makefile CFLAGS override with a !DEBUG_PREEMPT
  dependency on the Branch Profiling Kconfig choice (Steven Rostedt).
- Patch 3: remove the unused __preempt_count_inc() and
  __preempt_count_dec() macros and clarify the changelog wording
  (Hongyan Xia).

Link to v1:

  https://lore.kernel.org/r/cover.1794814699.git.kmehltretter@gmail.com

This series is independently useful and also provides the checked count
updates planned for follow-up IRQ-entry work. It does not change IRQ
entry, trace-recursion lifetime or TRACE_CTX_TRANSITION.

This addresses Peter's suggestion:

  https://lore.kernel.org/r/20261029093219.GH1779021@noisy.programming.kicks-ass.net

The series is based on Linus's tree at commit 4dce97c6c265
("Merge tag 'ext4_for_linus-7.4-rc5' of
git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4", after
v7.4-rc4).

Testing:

- Kconfig: x86-64, arm64 and arm builds with Clang 22.1.8 verified both
  branch-profiling modes, DEBUG_PREEMPT and non-debug configurations,
  !CONFIG_PREEMPTION with PREEMPT_COUNT=y, plus allmodconfig,
  allyesconfig and defconfig + debug.config.
- arm64 v2 runtime: Clang 22.1.8, W=1, PREEMPT, DEBUG_PREEMPT,
  PROVE_LOCKING, FTRACE and PREEMPT_TRACER. Full Image and external
  module builds passed, .noinstr.text disassembly showed no
  ftrace_likely_update() or outlined preempt-count calls, and QEMU
  boots verified balanced load/unload, underflow rejection and
  near-overflow detection at 0xf5.
- Additional v1 testing (C code in arch/arm64/include/asm/preempt.h and
  kernel/sched/core.c unchanged): x86-64 Clang 19 objtool noinstr
  validation and nested-KVM runs, arm64 GCC 14.2 PREEMPT_RT and
  allmodconfig builds plus native Axion boot, and ARC, C-SKY and MIPS
  builds and QEMU tests.

I used an LLM to help extract and review the changes, write the test
harnesses and prepare the commit messages.

Hongyan Xia (1):
  arm64: Always inline raw preempt count updates

Karl Mehltretter (2):
  arm64: Always inline preempt count and reschedule checks
  sched/preempt: Check preempt counts in notrace helpers

 arch/arm64/include/asm/preempt.h | 10 ++++----
 include/linux/preempt.h          | 23 +++++++++++++-----
 kernel/sched/core.c              | 40 ++++++++++++++++++++++++++++----
 kernel/trace/Kconfig             |  1 +
 4 files changed, 59 insertions(+), 15 deletions(-)


base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.39.5 (Apple Git-154)


