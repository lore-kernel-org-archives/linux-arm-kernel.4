Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265AE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 18:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bn2u0G5C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rCRivMKW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lNoDcgtyIRtshKKQA77hdTnKAgEL8asv9kuIbWA+WPc=; b=Bn2u0G5CVvSaDMQTnVhJLkFUNd
	APXKlaPZy4gRBEgehl3PHyWRJA4x2WbVnBEB2ED6BAlGVXUNpfcSXuN0qVfHy8nOph0lMwDozpRKE
	1ZXCxXmlp5LkbRG0mTOLgzOvFNBTtg/KmpZV2dEPgvgIVBWA3WiOh2qBVP8yFO6rmHSmUrnxG5PFz
	nXUukfwIYLeRdfZRLoQBdEBOzDZqIQRTodm/aDEc9jN2k2oAd197ryvU0xz60uxTUZLxsj3HiUwjB
	rgza1+QjFVCJcPRu4uCHk15wRiC3n7SPBXcXyV760WK7Evs4YaBz4+cu2h4d4GOikjVhWk+AlgcVM
	UlB2HrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeJG-0000000EBi2-3gNC;
	Thu, 26 Nov 2026 18:35:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeJF-0000000EBhZ-0lcF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 18:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lNoDcgtyIRtshKKQA77hdTnKAgEL8asv9kuIbWA+WPc=; b=rCRivMKWHsAiaN8JRlhI3+jK8V
	+T0Sca7uBnOGSjoNNgOIu0W/geC6OsBdDDKHdzjRIcHhNB5bzFnkkOsNVQXeN2IPAGJ8hWqRGNud1
	xB8l50rPqNOIrVlfnsBMeXw7ADQb9DDVc9h0iN+TWHrU3Tvk4rO9wReixGol+gBuRHEV7N9zkX2pG
	TgapIprlCIPmlc11tAhkkZwRC6D+vvG5pFVy98gkr0VgvMT3hVRWRrmsGVmi+DmWl22Ab7Mh2/6rM
	5c8QEQcK+s55noA2BmBwI3gc8CBlWaXq/akpEkUsUqOiyP6l82caF79JOtrR49T/1NR8v2hmHqgpq
	LLLLjTVg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeJB-0000000A55i-2Zkw;
	Thu, 26 Nov 2026 18:35:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6F22E302186; Thu, 26 Nov 2026 19:34:53 +0100 (CET)
Date: Thu, 26 Nov 2026 19:34:53 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Hongyan Xia <hongyan.xia@transsion.com>, Song Liu <song@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] sched/preempt: Check notrace preempt-count updates
Message-ID: <20261126183453.GM49833@noisy.programming.kicks-ass.net>
References: <cover.1795631277.git.kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795631277.git.kmehltretter@gmail.com>
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
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 03:30:51AM +0100, Karl Mehltretter wrote:

> Hongyan Xia (1):
>   arm64: Always inline raw preempt count updates
> 
> Karl Mehltretter (2):
>   arm64: Always inline preempt count and reschedule checks
>   sched/preempt: Check preempt counts in notrace helpers
> 
>  arch/arm64/include/asm/preempt.h | 10 ++++----
>  include/linux/preempt.h          | 23 +++++++++++++-----
>  kernel/sched/core.c              | 40 ++++++++++++++++++++++++++++----
>  kernel/trace/Kconfig             |  1 +
>  4 files changed, 59 insertions(+), 15 deletions(-)

A quick reading doesn't show anything weird; I'll sit on them a while --
at the very least until I get an ACK from an ARM64 person ;-)

