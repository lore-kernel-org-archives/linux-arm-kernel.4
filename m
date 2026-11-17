Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8978606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dWVWr6oX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YJVccZ4F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L9/zmyDwR7zpVKBQBxJnUV/A6ZXWQ4xYlPUf1Rc2SXE=; b=dWVWr6oXpjVhcp5qqhscn46Tf4
	dr1jj6LIZW54Ktbyqh+nT+j24LX9uaIT9urqzNJW8h2M3lH3b+FxhV43OizVWIbH05girHGRpbYE9
	1N1ShNb+ASJ5qtlstZUoIqSscgRD9rqC/ZbRNk8f34Tzp13sAWxM3Wf46xJn6tH5qv/BAAN3GxYOa
	DyVdHjwIyVRDTQ25UiurQo9ZCSpEOuzKTCp/qDPhfizIFFYnjv5EXGO/ciVodLj5BCJFq7Ej+oEOw
	kP3CWgevxu1kBGOITtRwUcvX+eUlzqzeWMwa7fswO9yNrPwNtGuMBAWosbphGfGl/4BvMdBZ7jXbE
	DqlQmP5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTINI-00000005dRv-3Xp6;
	Tue, 17 Nov 2026 12:33:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTINH-00000005dRg-3en8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:33:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 683CD401AD;
	Tue, 17 Nov 2026 12:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2991F000C4;
	Tue, 17 Nov 2026 12:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794918803;
	bh=L9/zmyDwR7zpVKBQBxJnUV/A6ZXWQ4xYlPUf1Rc2SXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YJVccZ4FtB30FrpS0eEMJXhwJRbh2ntPnBPlG2e1Cr/x3syKsL1nDqCSfZ3ZNeAXb
	 a/D9uDRNYuc8aJE3Fz6A7jmLiUEoEysx4hcnrKdDfqKxr3JE+w90zEj6j8LKcEOozi
	 5xBGQo/4YVCNT5pGDPOsmKqhjag08h+JaeCSBDmPzlwLkzH0gc3l+QB6BdvGrv+Grw
	 qSWuEAs3L4W6sWxLLu2g83niXofan0w7VYJawhLtQ1iWjIZ+4dDToBb7mUKsihSQ/4
	 l0hsEOIX5sHnc3GjosU+QJnCdpIKUEa7hhCC6+JLUtoEXmUp3Xtj8fr/8MG9cMBCOP
	 4HG5/3cnLanWQ==
Date: Tue, 17 Nov 2026 12:33:17 +0000
From: Will Deacon <will@kernel.org>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, peterz@infradead.org,
	jolsa@kernel.org, rostedt@goodmis.org, ardb@kernel.org
Subject: Re: [PATCH bpf-next 1/3] arm64: perf: Don't report the caller twice
 in caller-regs callchains
Message-ID: <avxJjTWOp250aDYC@willie-the-truck>
References: <20261114001846.873499-1-andrii@kernel.org>
 <20261114001846.873499-2-andrii@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114001846.873499-2-andrii@kernel.org>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 04:18:44PM -0800, Andrii Nakryiko wrote:
> perf_arch_fetch_caller_regs() sets regs->pc to the return address of
> the function it is used in (CALLER_ADDR0), but points regs->regs[29]
> at that function's own frame record, whose saved LR is that same
> return address. perf_callchain_kernel() reports regs->pc and then
> unwinds from the frame record at x29, so the caller shows up twice at
> the top of every kernel callchain built from perf_fetch_caller_regs():
> tracepoint events, software events emitted by __perf_sw_event_sched()
> (context-switches, cgroup-switches, cpu-migrations), and
> bpf_get_stack() and bpf_get_stackid() in tracepoint, raw tracepoint,
> tp_btf and fentry/fexit programs. E.g., for a tracepoint program
> attached to sched_process_fork:
> 
>   __traceiter_sched_process_fork+0x44
>   __traceiter_sched_process_fork+0x44
>   kernel_clone+0x250
>   ...
> 
> Use __builtin_frame_address(1), the caller's frame record, the same
> way kunwind_init_from_caller() does, so that pc and x29 describe the
> same frame.
> 
> x86 had the same duplicate entry, fixed by commit 6d08340d1e35
> ("Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"").
> 
> Fixes: 5b09a094f2fb ("arm64: perf: Fix callchain parse error with kernel tracepoint events")
> Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
> ---
>  arch/arm64/include/asm/perf_event.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
> index ee45b4e77347..13efb46f0fe8 100644
> --- a/arch/arm64/include/asm/perf_event.h
> +++ b/arch/arm64/include/asm/perf_event.h
> @@ -15,7 +15,7 @@
>  
>  #define perf_arch_fetch_caller_regs(regs, __ip) { \
>  	(regs)->pc = (__ip);    \
> -	(regs)->regs[29] = (unsigned long) __builtin_frame_address(0); \
> +	(regs)->regs[29] = (unsigned long) __builtin_frame_address(1); \
>  	(regs)->sp = current_stack_pointer; \
>  	(regs)->pstate = PSR_MODE_EL1h;	\

This doesn't look right to me. Presumably, the compiler is now going to
emit the first step of the unwind, but it has no idea about the different
stacks that we have, the meta frames or the invariants that the walker
in arch/arm64/kernel/stacktrace.c takes care of.

So we should continue to unwind from the current frame, but then perf
can discard the duplicate leaf entry if we don't want it. After all,
it's perf that's passing in CALLER_ADDR0 for __ip.

Will

