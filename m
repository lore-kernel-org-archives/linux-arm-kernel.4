Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4084606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QhFIhzIs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GoER1X1/;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=IKsjSGKG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cgbskdNiwv1foCu8NskiI0D1syGORGzYIPtRO06UAuE=; b=QhFIhzIsEwzFrC
	ZMyflGbHXqVp+FyqAjFm+geBsezoqZ9yH008DGKOT44TI6EXsN9o3hAPoR4jbLHqpvAi+ymR0qbCg
	XRfPYibwWhyd+9ZiZbTwh9/4Mj+8vJywqoshUP9MkgpWIdfi5OP1be6HgW7wu/VvM5VabVFz5ZBAY
	xv0AHwWmA4AhjdGjD6DCF4JMhWUoRVRZCqQRuF8nWjLHi253grS5hPZSdvwMbEZ7Q6X0v5gceyVSO
	pyCPQiHuZxW5F2khuWEkca2mgfazhWzAWgWHMSOgGv+mFyrqxrrG6euEUK1IiIV/Qd4Mm6l3xxt7o
	nkMi7uBf/pysARPsLiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuRz-00000007OME-0FtH;
	Tue, 24 Nov 2026 17:37:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuRx-00000007OLT-1o7P
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 17:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cgbskdNiwv1foCu8NskiI0D1syGORGzYIPtRO06UAuE=; b=GoER1X1/vzL4dsORC2OkquCtsw
	X5ryjQcPgavlnNEzqtzRyniMLTC2bsmqSckV9nrRXrnwQjYv8gf33joCHkXCBvQT8RQ9zJQ/I9aUJ
	Rc3DdkLp9I4GHOBn2t2Iby97fvBLulbkuGwd6VYTnmChVckb/l1oQijLWuz/HDtsa0Hp3nqE+tsnQ
	7b4cGXo+j4WX1V/6tTdvPffJirfRjBLKjYGdQxIsBn7OOqUE3QJiD3wlQA1arBSS8DTpdHRWjopE6
	zZQgan5+Rzqjed+9C9EEQwBA7WJyZXkmC+brWTMrvUlCObfpSWAbjOS2keHImZmCC8LUOn/EhH1Su
	v7z70TzA==;
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuRs-00000004Q8T-2X8x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:37:00 +0000
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 98CE81A0C2A;
	Tue, 24 Nov 2026 17:36:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 5C8E520025;
	Tue, 24 Nov 2026 17:36:40 +0000 (UTC)
Date: Tue, 24 Nov 2026 12:36:38 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner
 <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, Andy
 Lutomirski <luto@kernel.org>, Frederic Weisbecker <frederic@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Waiman Long <longman@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak <kprateek.nayak@amd.com>, Hongyan Xia <hongyan.xia@transsion.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 03/13] sched: Split preempt-count bookkeeping
 from raw updates
Message-ID: <20261124123638.0a4e795f@gandalf.local.home>
In-Reply-To: <20261028033127.82193-4-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
	<20261028033127.82193-4-kmehltretter@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: o7t4gho3twp1pjm483fepzra6sqea1zo
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 5C8E520025
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19jjJfeX0Pq5rKkc5XDNag2YF12GXEJJ0c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=cgbskdNiwv1foCu8NskiI0D1syGORGzYIPtRO06UAuE=; b=IKsjSGKGP88SZhny+HOXUAncmF19+0BUUDc0u5l131xdPNIc+2cg03+qSMi4x6VuvPafyYRbcZOODK7TaUD++oAq/LMHs2D0SKg5emJipMmethrJ58TkI4h8EoUxZ0NZ8yxGtlukmRBcEXebp911C1pjPZXIb3/Pn1vcULBVoBE=
X-HE-Tag: 1795541800-76208
X-HE-Meta: U2FsdGVkX1//0KdiMOWlABzDJ67uxFLp67YDmtynpCt6dGXlAXSOGXfWHH0NQNs4J18yoejLLirzKE6G+vDscomrddt0UbSWq2IScO0sdUJn1oCI575V2BTFdRhwUotSimZAihEXlFEgu3xlutyREHxNwcNEBrwolkeD0shXWG2W2MBsl/ucTPI5lO1Iea1l0g38kDuJ8CQrWgVl5qMnbwe4rUtj4gpUSI2wgRhN2vevOwdKbe4O6wS7u77F+Iug+Lna94xG+7dS6JKnxC5hF52AwE7bilNEZN4y7ubYvJ6DOkX3WMV2o5HCvaD6l7VtjteZjoPT6dth7kBCDU7R1W5RCOmwKVa0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_173657_520348_32EB20A2 
X-CRM114-Status: GOOD (  21.31  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 04:31:17 +0100
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> diff --git a/include/linux/irqentry_hardirq.h b/include/linux/irqentry_hardirq.h
> new file mode 100644
> index 0000000000000..1937fc972e846
> --- /dev/null
> +++ b/include/linux/irqentry_hardirq.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_IRQENTRY_HARDIRQ_H
> +#define __LINUX_IRQENTRY_HARDIRQ_H
> +
> +#include <linux/preempt.h>
> +
> +struct irqentry_hardirq_cookie {
> +#if defined(CONFIG_DEBUG_PREEMPT) && \
> +	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
> +	bool applied;
> +#endif
> +};
> +
> +static __always_inline bool
> +irqentry_hardirq_count_applied(struct irqentry_hardirq_cookie cookie)
> +{
> +#if defined(CONFIG_DEBUG_PREEMPT) && \
> +	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
> +	return cookie.applied;
> +#else
> +	return true;
> +#endif
> +}
> +
> +static __always_inline bool irqentry_hardirq_count_valid(void)
> +{
> +#ifdef CONFIG_DEBUG_PREEMPT
> +	/*
> +	 * Without separate reschedule bits, preempt_count() excludes any
> +	 * shared reschedule bit. A negative result therefore denotes an
> +	 * existing underflow.
> +	 */
> +	if (!IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS) &&
> +	    preempt_count() < 0)
> +		return false;
> +#endif
> +	return true;
> +}
> +
> +#if defined(CONFIG_DEBUG_PREEMPT) && \
> +	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
> +struct irqentry_hardirq_cookie noinstr
> +__irqentry_hardirq_count_start_slow(void);
> +#endif
> +
> +/*
> + * Attempt the non-instrumentable part of a staged hardirq-count addition and
> + * record whether it was applied. The returned cookie must be passed to the
> + * matching irqentry_hardirq_count_finish() and subtraction preparation. A
> + * rejected cookie attempts deferred reporting and suppresses post-add
> + * bookkeeping and the matching subtraction regardless of warning
> + * suppression.
> + */
> +static __always_inline struct irqentry_hardirq_cookie
> +irqentry_hardirq_count_start(void)
> +{
> +	struct irqentry_hardirq_cookie cookie = { };
> +
> +#if defined(CONFIG_DEBUG_PREEMPT) && \
> +	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
> +	cookie.applied = true;
> +	/* DEBUG_LOCKS_WARN_ON() permits the addition during an oops. */
> +	if (unlikely(!irqentry_hardirq_count_valid()))
> +		return __irqentry_hardirq_count_start_slow();
> +#endif
> +	__preempt_count_add(HARDIRQ_OFFSET);
> +
> +	return cookie;
> +}
> +

BTW, the above would look so much better and be much easier to maintain if
you just made stubs when not needed:

#if defined(CONFIG_DEBUG_PREEMPT) && !defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)

struct irqentry_hardirq_cookie {
	bool applied;
};

static __always_inline bool
irqentry_hardirq_count_applied(struct irqentry_hardirq_cookie cookie)
{
	return cookie.applied;
}

static __always_inline bool irqentry_hardirq_count_valid(void)
{
	/*
	 * Without separate reschedule bits, preempt_count() excludes any
	 * shared reschedule bit. A negative result therefore denotes an
	 * existing underflow.
	 */
	return preempt_count >= 0;
}

#else /* !CONFIG_DEBUG_PREEMPT || CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
struct irqentry_hardirq_cookie {
};
static __always_inline bool
irqentry_hardirq_count_applied(struct irqentry_hardirq_cookie cookie)
{
	return true;
}
static __always_inline bool irqentry_hardirq_count_valid(void)
{
	return true;
}
#endif /* defined(CONFIG_DEBUG_PREEMPT) && !defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS) */

-- Steve

