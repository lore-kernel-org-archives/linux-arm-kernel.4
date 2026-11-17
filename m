Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B2D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1gek/aoo;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vho7oZPk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=adJlCMc/x5vh5hhPkeNSjJ1CaT5lEnc4+iZowhfe3qs=; b=1gek/aooPkULNma42pEWojRO/J
	GZcnHNtIEue+zD8XqjRDQvluZvwaSk9rolhNXlGRj/6gY84BrYPRqY5jtlDa7xepA2WZC/uXgxebU
	MAb7aoaDOXWIY4AI1l8jTc7PyzbEqI4TNvrm3jft5/RzQjEeQC/HNtXGwqSYKE1nQh5OSH07eY3e1
	b8+PciSAcpu8a3hUjEzrk+zcEdGtJl1eNSJhm7AvePx8uOgKL218TkAXIAgGxm8EXgY/vXE3nYn31
	8FnslPZiCA2wAj2596TkYenflsXg4uD4sj7SBJR2NdSxv+qmUf4TyRt0BWHn1tQqcl18q/ZlXBHcm
	RoE+r7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTINq-00000005dWy-0OXA;
	Tue, 17 Nov 2026 12:33:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTINp-00000005dWe-1dmM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:33:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F0A46186B;
	Tue, 17 Nov 2026 12:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9011F000C4;
	Tue, 17 Nov 2026 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794918836;
	bh=adJlCMc/x5vh5hhPkeNSjJ1CaT5lEnc4+iZowhfe3qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vho7oZPkqfoiJj76Vcv5A/zl1ZmtxAhm+LVC6njmn/QuQMqsxiTKSgSJA+bc3xivR
	 H/NWybKgwbouR+Ca20ijSsjx09E80FGepJGppIz/gOsdIe3ByJD9hp6cEmyf36UgFy
	 UDQJF46KBJUqZKLf+l2o2TZ+x85ic6P19wVZNvRMjmRUaqy7yyqTYe8zpDJVvxua08
	 O9KqqIoTA7Mk50eekb8/lIaZmVTzYjwwEvaLebQybLCBwhLy82F5svlMZNOI77lLTF
	 t7QATowifNI0eqS+9XxKGMAn2Q53VEKR/IKOaQegOlddQDTuVC1NOpKWY5lhmzcmtA
	 KxsAyk4TB9cwg==
Date: Tue, 17 Nov 2026 12:33:50 +0000
From: Will Deacon <will@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	mark.rutland@arm.com, linux-perf-users@vger.kernel.org,
	peterz@infradead.org, jolsa@kernel.org, rostedt@goodmis.org
Subject: Re: [PATCH bpf-next 1/3] arm64: perf: Don't report the caller twice
 in caller-regs callchains
Message-ID: <avxJrsiT5vdFESFO@willie-the-truck>
References: <20261114001846.873499-1-andrii@kernel.org>
 <20261114001846.873499-2-andrii@kernel.org>
 <DMUJKFF59EU0.3D4OXJLXB2N6B@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DMUJKFF59EU0.3D4OXJLXB2N6B@gmail.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 01:27:16AM +0000, Alexei Starovoitov wrote:
> On Fri, Nov 13, 2026 at 04:18 PM Andrii Nakryiko <andrii@kernel.org> wrote:
> > perf_arch_fetch_caller_regs() sets regs->pc to the return address of
> > the function it is used in (CALLER_ADDR0), but points regs->regs[29]
> > at that function's own frame record, whose saved LR is that same
> > return address. perf_callchain_kernel() reports regs->pc and then
> > unwinds from the frame record at x29, so the caller shows up twice at
> > the top of every kernel callchain built from perf_fetch_caller_regs():
> > tracepoint events, software events emitted by __perf_sw_event_sched()
> > (context-switches, cgroup-switches, cpu-migrations), and
> > bpf_get_stack() and bpf_get_stackid() in tracepoint, raw tracepoint,
> > tp_btf and fentry/fexit programs. E.g., for a tracepoint program
> > attached to sched_process_fork:
> >
> >   __traceiter_sched_process_fork+0x44
> >   __traceiter_sched_process_fork+0x44
> >   kernel_clone+0x250
> >   ...
> >
> > Use __builtin_frame_address(1), the caller's frame record, the same
> > way kunwind_init_from_caller() does, so that pc and x29 describe the
> > same frame.
> >
> > x86 had the same duplicate entry, fixed by commit 6d08340d1e35
> > ("Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"").
> 
> riscv has the same duplicate it seems.
> Its perf_arch_fetch_caller_regs() stores __builtin_frame_address(0)
> in s0. walk_stackframe() reports epc, then frame->ra of that frame.
> Can be a follow up by riscv folks.
> 
> > @@ -15,7 +15,7 @@
> >
> >  #define perf_arch_fetch_caller_regs(regs, __ip) { \
> >  	(regs)->pc = (__ip);    \
> > -	(regs)->regs[29] = (unsigned long) __builtin_frame_address(0); \
> > +	(regs)->regs[29] = (unsigned long) __builtin_frame_address(1); \
> >  	(regs)->sp = current_stack_pointer; \
> >  	(regs)->pstate = PSR_MODE_EL1h;	\
> >  }
> 
> Will, Mark,
> this looks correct to me.
> Mind if I take it via bpf-next together with the selftests?

Please don't pick this up, as I don't think it's quite right. I replied
on the patch itself.

Will

