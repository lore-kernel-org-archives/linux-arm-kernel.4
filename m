Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFDA606D808
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WdNVUBR7;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ob6o03Xe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=D1OP9qC177zA3aBfRfenxMIit8o8G0GoKrdtUwc1iHk=; b=WdNVUBR7FRYmk20oGlYStWBmO7
	psnxXI3d29PC646fh8H2ig5/uBV0ac2334Vx2jdtnyVcA3M87VAU0nbTV41s/uTNfNNV4f9f4ATSM
	y/kUik329QkJhqn4J6JBUhi9CC05Z6h9tTaDhx57tExXBIwtRGQ5bZnonuhW4U3L7PituOg7p5bbx
	xh0gR7jnWCdKJ1EaTX8CEoRCLnt/IxiSlcvt4QQ6WWQvVtibFXwBFvjWLPoF+W1XV/N4H1TUEZGOM
	hxMcgrKpw91IbSvOBGKZO72rlPbhejkiLrAzOKpXMAAEdHKpg5rlsoQphUjiD9hm2DwurolkksmHt
	Ett3wZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNir-0000000DDzq-3Ob6;
	Fri, 06 Nov 2026 17:27:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNio-0000000DDyt-27we
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 17:27:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBB311477;
	Fri,  6 Nov 2026 09:27:19 -0800 (PST)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 282A43F632;
	Fri,  6 Nov 2026 09:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793986042; bh=6bzuAkIaDZvpb/WEZZmaV1YDCZ13Mh9rHG1iq3jJ37w=;
	h=Date:From:To:Cc:Subject:From;
	b=Ob6o03Xec1fUWggLPZ/Zu5jDYGGVgmIPtWdBk1KGltVeDja5el7//AVqGpMJtWish
	 l7EuGPFP34NXFapK/r591dA5Uok+vifaW/hB3jYQZ50pImwfLBqcssjSMwuk9B3+6Z
	 5gEQm0qrcKFXYkCxACwhnpuLvakHukn0Klu44rvQ=
Date: Fri, 6 Nov 2026 22:57:19 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arch@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ryan Roberts <ryan.roberts@arm.com>
Subject: [RFC] ARM64 ESR ownership issue for signal delivery
Message-ID: <fp2tsl5lkj4rzvwfkkgogeka7uhd2bwkci37zvikjjtg7wkckd@qc2lyhdpdocx>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_092726_653668_ABDBB8DF 
X-CRM114-Status: GOOD (  16.44  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I am sharing some details on the ARM64 ESR ownership issue during
signal delivery, along with a few possible solutions.
I would appriciate feedback on the scenarios and proposed approaches.

Introduction to ESR
~~~~~~~~~~~~~~~~~~~

ESR refers to an AArch64 system register, Exception syndrome register
which holds the information about why an exception occurred.

For relevant hardware faults, Linux exposes this value to user space, by
including ESR context in the signal frame. This was originally introduced [1]
for user space instruction emulators to identify whether a fault is read/write
and its access size without decoding the instruction itself.

Problem statement
~~~~~~~~~~~~~~~~~

ARM64 uses a task level field, current->thread.fault_code to retain the
ESR state captured during faults. This is later used to generate the ESR
context during signal frame generation. Essentially the ESR state stored
in fault_code has no ownership relation with the signals queued.

From Linux arm64 point of view, there are two categories,
* Signals with relevant ESR context - triggered by hardware faults only
* Signals without ESR context - triggered by hardware faults and software as well.

Because fault_code has no signal ownership, an ESR captured for one signal can be
included in the frame of an unrelated signal.

Some possible error scenarios are given below that show the ESR ownership issue.

Assumption:
1. Signals described as being delivered to user space are assumed to have handlers
installed that allow the task to continue.
2. Cases 2 and 3 assume that the task is traced by ptrace

Case 1: Hardware fault followed by an unrelated asynchronous signal

* An EL0 exception generates and delivers a fault signal with ESR A.
* current->thread.fault_code remains set after the signal is delivered.
* A subsequent asynchronous SIGUSR1 is delivered
* Since ESR context is added to signal frame based on non zero fault_code,
  a stale ESR context can get attached to this non fault signal.

Case 2: Two EL0 faults, each with distinct ESR values

* An EL0 store to a read-only page triggers hardware fault with ESR A
  and SIGSEGV gets queued.
* At the SIGSEGV ptrace stop, ptrace tracer
  - masks SIGSEGV
  - queues SIGUSR1 to the tracee
  - continues the tracee task with SIGSEGV and hence SIGSEGV gets requeued.
    ie. PTRACE_CONT(..., SIGSEGV)
  So essentially SIGSEGV gets deferred and SIGUSR1 gets processed first.
* Task continues with SIGUSR1 user space handler which in turn triggers another
  hardware fault with ESR B resulting in a SIGBUS. This overwrites ESR A in
  the task level storage.
* When the initially deferred SIGSEGV is later delivered,
  its ESR context is generated from ESR B instead of ESR A.

Case 3: One EL0 fault with valid ESR + software-originated fault signal without ESR

* A task masks SIGBUS signal and then self-queues the same SIGBUS/BUS_ADRERR signal
  This is software generated but uses the same encoding (signo, si_code)
  of hardware fault signal.
* The task then encounters a hardware fault with ESR A and SIGSEGV
  gets queued.
* At the SIGSEGV ptrace stop, ptrace tracer
  - masks SIGSEGV,
  - unmasks SIGBUS,
  - continues the tracee with SIGSEGV and hence SIGSEGV gets requeued
* Task continues with SIGBUS handling and the signal can get wrongly framed with ESR A.

Open questions
~~~~~~~~~~~~~~

Are there any known users for ESR context in arm64 signal frames currently?
If not, should we really continue exposing ESR context through signal frames ?

Possible solutions
~~~~~~~~~~~~~~~~~~

If we wish to expose ESR context in signal frames, below are few options.

Option 1: Task-level ESR with filtering (no changes to generic kernel)
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Category A: Non-synchronous signals
Prevent signals such as SIGUSR1 from receiving an ESR context.
Fix: Allow ESR framing only for sigmask(ksig->sig) & SYNCHRONOUS_MASK

Category B: Synchronous signal codes that cannot carry ESR
Exclude codes such as TRAP_PERF, BUS_MCEERR_AO, and SEGV_MTEAERR.
Fix: Allow ESR framing only for ARM64 ESR-capable (signo, si_code) pair.

Category C: ESR-capable pairs without a captured ESR
Some software-generated signals use the same ESR-capable (signo, si_code)
pair as hardware exceptions.
Fix: Add current->thread.esr_valid, set only by ESR-capturing exception paths
and cleared after consumption or invalidation.

Required assumption: Multiple ESR-less ESR-capable(Cat C) signals may be outstanding
while esr_valid is clear. While esr_valid is set, the signal owning the ESR must
be the only outstanding ESR-capable signal until its ESR is framed or invalidated.

Atleast cases 2 and 3 violate this assumption.

Option 2: Per-signal ESR ownership flag
+++++++++++++++++++++++++++++++++++++++

Add a per signal ESR ownership flag, potentially using unused bits in the fields of
_sigfault (part of struct kernel_siginfo) to mark which queued signal owns
current->thread.fault_code.

By default, the field should stay cleared.

  - Set thread.esr_valid when an exception captures ESR.
  - Set the signal’s ESR_VALID flag when queueing it.
  - Generate an ESR context only when both are set.
  - Clear thread.esr_valid after the owning signal has framed the ESR,
     or when the owning signal is discarded
  - Detect an ownership conflict if ESR is captured while thread.esr_valid
    is already set.
  - Detect stale ownership if a flagged signal is dequeued while thread.esr_valid
     is clear.

This approach resolves ambiguity between any number of ESR-less Category C signals
and one ESR-owning signal. It detects, but does not solve, the case where multiple
ESR-owning signals coexist.

This may be involve fewer changes than Option 3, but then this option needs further
validiation of layout compatibility and sanitization of siginfo passed from/to userspace.
Also implications of reusing siginfo storage for kernel internal metada need to be
looked further.

Option 3: Add per-signal arch context
+++++++++++++++++++++++++++++++++++++

Probably a cleaner but more invasive solution is to add arch context
(ESR value and valid bit) to each struct sigqueue (ie. outside struct kernel_siginfo)
and propagate it into struct ksignal.
Context aware APIs can be used to specify ESR value and its validity while existing
APIs would leave the context invalid.

This option could open a way for ptrace to get the precise ESR value and that can be really
benefecial for POE2 use case.

[1] https://github.com/torvalds/linux/commit/15af1942dd61ee236a48b3de14d6f31c0b9e8116

Thanks,
Linu Cherian.

