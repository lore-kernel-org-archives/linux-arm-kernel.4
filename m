Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E02606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ntY1BYHZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AqT/kSrX;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=iN5i07JY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lHe6t0W6wJIz0Tl4HeE64/VhSLD31cFoO27KI4Qiuhw=; b=ntY1BYHZdM+KOe
	8GbNiASWRoLDrkQL8p1AcjZtT+S+pLgWaXYel8UG4f/Qg5MfzgfPfITtNGfEuWRgkOgmRW9aD0qaw
	zkyMZUmeHYFNTeLR3DmmW2lx+un657v/GPFIwLkj3Fkop2CJbE5yO1zS0xcrw/xH4osiiasO3lFaS
	o4Nw/xFzEMGU8dQcSaILB34YYKKyYkiL/rO+a1/JA3e1RaNvgeGbF+PJIwt4xKpoTlO4GQKZFbWd6
	OcZTtJl+UuTNXgW5vOldrxdyulxLgPBeQcFM008a0o0v71Rx/DO8ADtgwB1reMMWNQYSpmJIu16Ce
	g9bKE4j0giZtmnw+7Maw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt4s-000000073kJ-3OC5;
	Tue, 24 Nov 2026 16:09:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt4r-000000073kC-0zSP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lHe6t0W6wJIz0Tl4HeE64/VhSLD31cFoO27KI4Qiuhw=; b=AqT/kSrXtfDyEjDdbO7xnoJH0Q
	OXDuHEcrAUdro+k+mekP/hPPA9z+1nmNzB8ZxubNufo7T+tJb/r/oMrGOI4FHgNN1tJE3W8614lsy
	WiX/T3UHg1C405FF4pSo8Tr9APc4qs26cUQdwwjpl47Xrg36nZ2jhfCTTnvhneGCY/x1Yr1EMpS6g
	be4XGOpiIPilhRaEXnUSpf5IWvsa5lFRzFGJkC9NUzp0dZLb64FfpW+S/8uw7UPow+0QpL++3nz75
	m6S2NeWdjlmsi0L69n0QUQrA82/MfGUaQQUxMZsEEN5t1goBXPgkLvL1eyAY+Mo2wC7tJpiC0pGjE
	dYxMJFFQ==;
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt4Z-00000004Jui-3CUL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:08:52 +0000
Received: from omf11.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 3150A80C03;
	Tue, 24 Nov 2026 16:08:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id DBB8D2002D;
	Tue, 24 Nov 2026 16:08:38 +0000 (UTC)
Date: Tue, 24 Nov 2026 11:08:37 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Hongyan Xia
 <hongyan.xia@transsion.com>, Song Liu <song@kernel.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider
 <vschneid@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] sched/preempt: Check preempt counts in notrace
 helpers
Message-ID: <20261124110837.731d1d2e@gandalf.local.home>
In-Reply-To: <446e2bd042ce071da52ea80f577fe43c1b3dc031.1794814699.git.kmehltretter@gmail.com>
References: <cover.1794814699.git.kmehltretter@gmail.com>
	<446e2bd042ce071da52ea80f577fe43c1b3dc031.1794814699.git.kmehltretter@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DBB8D2002D
X-Stat-Signature: y99wuu3wcuparip11f8ts89pfbjmjbeq
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18DwXvKUKEkZAWHfXqOR0iuglFy7nRSMf0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=lHe6t0W6wJIz0Tl4HeE64/VhSLD31cFoO27KI4Qiuhw=; b=iN5i07JYlQRQ34fWR1AvoJAloSckSso7iEYRm9WjSFR3aLVMbXWgunSGg28ES0C5FDExitzGh9y49MzgHWF9QII2XRAodQ9+fdAH+0xqYGdEZcoa6I+qKWZROzXUy8sUXt6VD6xZuPfTG4ihukVU+xwbCp5f41/d091E0F7Xc5g=
X-HE-Tag: 1795536518-760363
X-HE-Meta: U2FsdGVkX18bnq3lqHEYYRQn2HbnrQkmCuTUkZ8yFM3JKQH/amoJ0fMN2eiSYNF1wZTyTk9ZMcRD0XZw1w2poxlye60YOayZcvOD+Zglk/0yLuYh/x6opXsqualSJdS8TeyIL3St6DBX+yi4braHVjh0wkhAgQoGXzX/Yth1jxC5Pc6LWOixWJ6ZYEjHBoBnePHWECl/K4iirlKgRJSmQMDvBOm7Irjy4rd0j1WHddRVlTpyEsJfsbT9A0ioGHd9b2MYoJNw/Q0zDOj8HHP5VEJrC0Dk4cqJtSpjJCHCByyLxvV3Z7GSbf/Et9mpRzrZX/7dZRF9xSgXtCgSvIfQ0E6CEtS05TYk0JohdFj7TAfA6ZUrtpmT8w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_160849_635545_05D2E27A 
X-CRM114-Status: GOOD (  14.59  )
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

On Mon, 16 Nov 2026 08:54:24 +0100
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> --- a/kernel/sched/Makefile
> +++ b/kernel/sched/Makefile
> @@ -27,6 +27,9 @@ endif
>  
>  # Branch profiling isn't noinstr-safe
>  ifdef CONFIG_TRACE_BRANCH_PROFILING
> +ifdef CONFIG_DEBUG_PREEMPT
> +CFLAGS_core.o += -DDISABLE_BRANCH_PROFILING
> +endif
>  CFLAGS_build_policy.o += -DDISABLE_BRANCH_PROFILING
>  CFLAGS_build_utility.o += -DDISABLE_BRANCH_PROFILING

Branch profiling is really for checking production code and not debug code.
I don't see a use case to see what branches are taken when the kernel is in
debug mode.

I think it would be better to just have BRANCH_PROFILING depend on
!DEBUG_PREEMPT. Then the above wouldn't even be possible.

Thanks,

-- Steve


>  endif
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1a088d4576f59..98ca93bc60887 100644

