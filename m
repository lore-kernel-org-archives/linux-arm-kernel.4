Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19408606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DpobEPJR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Pj8RMo4+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BWblz2p3e+RANKxaoCJc2peYHCm2/SRIz3+0ra5cwvs=; b=DpobEPJRNrIxwPsmlcKHlFHyVE
	zUmzSa4IHgnorpV3jQ1nY5F2OczyO3CN7H3nS7sFtl1qQJ0UhgbZcxo4UDtY7uQkYEqewiUR2DXEA
	OOCQCt9U5th0CF7cuZ66CGy2Hv6Teh6FL7lvYL/Ko+6f8F0o8DWI+DV5oh5EYhLen3RZCwHDYmmmR
	o891R51fs4MVa9f8DzcboOqdITyIy+5Tpal6OV3m+By8ZFZtKrAkjWrhmoZXwBV4LWtHna/V9c3e5
	K8FJ2G390yJOKcMfSSwV9djnk0wmj1biQ49lqRHoEcWCzBonF2VK4B/MIyNS/vFdoXZIJgGsy66m7
	Ke/ILyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0pk-0000000HRJY-1LGY;
	Fri, 27 Nov 2026 18:38:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0pf-0000000HRIf-2v8q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:38:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 932731575;
	Fri, 27 Nov 2026 10:37:59 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7798F3F86C;
	Fri, 27 Nov 2026 10:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795804682; bh=WmazKbbRJkJgrB2424W6m6iKCFKjBQNVA1FAYPEAZmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pj8RMo4+8uVvzglyYRCuvg790viYUgDQspUF3aRjCZFHTiLXEeLCktxCz2Q7UPnWh
	 4Z1ld8xUtlEp1n8tZigZexN643W7Amw3OqJikuSRR51zOqjfZIVcfNaTH0fln3cY1l
	 SXQYNpjkf8/BO1QI4Ya//Lf7Zr/ObA7Ku4CQn1+s=
Date: Fri, 27 Nov 2026 18:37:55 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v5] ARM, ARM64, LONGARCH, XTENSA: Delay HW BP
 notification to task_work()
Message-ID: <awnOAw-bnxDbljaE@arm.com>
References: <20261120144553.TjgAd_G6@linutronix.de>
 <20261120150320.GQ2668804@noisy.programming.kicks-ass.net>
 <20261120155806.GK2669272@noisy.programming.kicks-ass.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120155806.GK2669272@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_103803_815472_D7014558 
X-CRM114-Status: GOOD (  26.15  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Oleg Nesterov <oleg@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, linux-rt-devel@lists.linux.dev, Clark Williams <clrkwllms@kernel.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, James Clark <james.clark@linaro.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 04:58:06PM +0100, Peter Zijlstra wrote:
> On Fri, Nov 20, 2026 at 04:03:20PM +0100, Peter Zijlstra wrote:
> > On Fri, Nov 20, 2026 at 03:45:53PM +0100, Sebastian Andrzej Siewior wrote:
> > > Waiman, Luis, Ada reported that HW breakpoints on ARM64 trigger
> > > "sleeping while atomic" warnings on PREEMPT_RT. The hardware event is
> > > delivered with disabled interrupts and perf intrastrucure expects
> > > disabled interrupts while the overflow callback is invoked.
> > > 
> > > The callback then sends a SIGTRAP signal for which it acquires
> > > sighand_struct::siglock, a spinlock_t which becomes a sleeping lock and
> > > must not be acquired in atomic context.
> > > 
> > > Delay the event callback until the return to userland.
> > > Add perf_hwbp_notify(), a generic perf callback which delayes the
> > > actual callback invocation to task_work_add() callback. This callback
> > > invokes the architecture defined callback perf_arch_hwbp_send_sig().
> > > This requires struct callback_head and the functions require
> > > ARCH_NEED_PERF_HW_NOTIFY to be defined.
> > > 
> > > This was reported against ARM64. ARM, LongARCH and Xtensa follow the
> > > same pattern are also converted. Xtensa is the only not supporting
> > > PREEMPT_RT but now we have all architectures using the same pattern.
> > > 
> > > Fixes: d8fccd9ca5f90 ("arm64: Allow to enable PREEMPT_RT.")
> > > Reported-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> > > Reported-by: Waiman Long <longman@redhat.com>
> > > Closes: https://lore.kernel.org/all/aho0eqjMESuHxECr@redhat.com/
> > > Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> > > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > ---
> > 
> > Mark; you was going to stare at this :-)
> > 
> > I'm thinking the archs are doing it wrong and should be sending the
> > signal elsewhere.
> 
> Notably, I'm thinking arm64 should be sending the signal from either
> do_watchpoint()/do_breakpoint(), after it has done perf_bp_event(),
> or from el0_watchpt()/el0_breakpt().
> 
> Perf overflow handlers are not the place to send signals from.
> 
> That is very much what x86 also does, we send the signal from
> exc_debug_user(); which is roughly equivalent to the above mentioned
> functions.

(Mark and Will are the experts here but they are busy)

I think we can do something similar for arm64, send the signal in
el0_breakpt()/el0_watchpt() after local_daif_restore(). We do this with
el0_brk64(). ptrace_hbptriggered() can just record the perf_event and
defer the sending (we may need a new field in thread_struct::debug). No
core code changes needed.

I think Russell also objected to this patch for arm and Sashiko
complains about loongarch issues (I haven't parsed them).

-- 
Catalin

