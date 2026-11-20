Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117CD606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZhSvLdYB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kFjPXEtn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fvkyUjxL9ZoCNsldL2/7evVfO66l1h2mjXG4ejQxtI8=; b=ZhSvLdYBv2VBcsS/lISNeZnlmL
	cTmicS1IXbwXW5+fAHZ1K1mOpkXj6eu1sVL/5Ekde5NEDW7pq6dy6FhnQjBrWIFWdcIOY6Drufm3M
	UUMIruhh1goVLJNc+uQFhKUOHk+tkEuJIxVRJfIpECZm5IIrfT3/PXGAZuhZAibekoH30vXFf98NF
	wFhdlCBTW3MfwYaIFJHQuATzrZZqMWF2UthDzYbEgjasb3rpie97uVldleF7tsCsTGUsFJCXsjWrN
	YI19ntecFL2K87SlwnZXBVxqSBixc7MSeFG/i8xiFBbY/5ZGdGKIrpzBHGDcVD+dgffA8ZmmQ+lyY
	wYzB1odw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ9A-0000000FLVb-0KSL;
	Fri, 20 Nov 2026 15:03:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ98-0000000FLUg-3ERj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Nov 2026 15:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fvkyUjxL9ZoCNsldL2/7evVfO66l1h2mjXG4ejQxtI8=; b=kFjPXEtnZGIo+ELMkIM96umTyQ
	AtWq/NBU5bdY2S1cjluBF8GEEThJZG0qXbe+0rTZ6ZcFmAKXQ/l7i0ajRxsxEO8ukpvINOIGsrg7l
	quWBEeIAaIG47ukuV3WGqFMWBTml4iudQWwab+JPrCEMc/GC/VS7cwkKGdcAaUIjwJhyzPy5uKfjk
	cf4RADxdnEM93KsBah86iIIjc66SGwPN3NyrUjjBFFaFddPIk/JpheE0dwGzG/kK09ItS8lmE9OjF
	p004VUBNaapZlsA7dhGfmZsNFnA6cBVWeXv+W5GK3TpW0vAxf1sfL2Vf04ByWe/Yd+AX5wMbsHsq8
	VVujwunA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ93-00000006X6N-3zaP;
	Fri, 20 Nov 2026 15:03:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E5BA13008D6; Fri, 20 Nov 2026 16:03:20 +0100 (CET)
Date: Fri, 20 Nov 2026 16:03:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v5] ARM, ARM64, LONGARCH, XTENSA: Delay HW BP
 notification to task_work()
Message-ID: <20261120150320.GQ2668804@noisy.programming.kicks-ass.net>
References: <20261120144553.TjgAd_G6@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120144553.TjgAd_G6@linutronix.de>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-rt-devel@lists.linux.dev, Oleg Nesterov <oleg@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Clark Williams <clrkwllms@kernel.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, James Clark <james.clark@linaro.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 03:45:53PM +0100, Sebastian Andrzej Siewior wrote:
> Waiman, Luis, Ada reported that HW breakpoints on ARM64 trigger
> "sleeping while atomic" warnings on PREEMPT_RT. The hardware event is
> delivered with disabled interrupts and perf intrastrucure expects
> disabled interrupts while the overflow callback is invoked.
> 
> The callback then sends a SIGTRAP signal for which it acquires
> sighand_struct::siglock, a spinlock_t which becomes a sleeping lock and
> must not be acquired in atomic context.
> 
> Delay the event callback until the return to userland.
> Add perf_hwbp_notify(), a generic perf callback which delayes the
> actual callback invocation to task_work_add() callback. This callback
> invokes the architecture defined callback perf_arch_hwbp_send_sig().
> This requires struct callback_head and the functions require
> ARCH_NEED_PERF_HW_NOTIFY to be defined.
> 
> This was reported against ARM64. ARM, LongARCH and Xtensa follow the
> same pattern are also converted. Xtensa is the only not supporting
> PREEMPT_RT but now we have all architectures using the same pattern.
> 
> Fixes: d8fccd9ca5f90 ("arm64: Allow to enable PREEMPT_RT.")
> Reported-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> Reported-by: Waiman Long <longman@redhat.com>
> Closes: https://lore.kernel.org/all/aho0eqjMESuHxECr@redhat.com/
> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---

Mark; you was going to stare at this :-)

I'm thinking the archs are doing it wrong and should be sending the
signal elsewhere.

