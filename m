Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98E1606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cdMQjP1d;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=vG79UtM6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z7ZqvSQjxHguoc1FTxJ8uNaW6BCtmmOurJdgC95SiWI=; b=cdMQjP1dVdPPxk
	F9xOxgjyjodhesUV9BFLZ5skyR3VEYUWB41tPCcGdsPoixzBe75v8+24T6v7YvNF8QFEfJMDg+nRC
	a3pTRgyZEOkMmkLzpCy9t0yXiB0Xf4bB/MFpr3yf3CofMxG5K7sjxD10/urdL0OTs2UKYpeIggtFv
	l79GQ//BiZgV2Fnzr+BP1dtf3ypR2jL7LuqvUurBCY07eTQkbHufV3mcf2dJfSXttm4QqYqf0lR0g
	U44uA48yOaRCGSyxovIIufaSnuxEmXgr/5AL5iwMrrBbMW1hFIJ9tG28bpB5HRB6vUUS14H6JmDLI
	XEHhdDFAvMy5BjSnja8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuTL-00000007Ody-3KL7;
	Tue, 24 Nov 2026 17:38:27 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuTJ-00000007OdR-3Z9g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:38:27 +0000
Received: from omf18.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 29C9740CA4;
	Tue, 24 Nov 2026 17:38:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 97A0D32;
	Tue, 24 Nov 2026 17:38:13 +0000 (UTC)
Date: Tue, 24 Nov 2026 12:38:12 -0500
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
Subject: Re: [RFC PATCH v2 04/13] lockdep: Use raw access for pinned hardirq
 state
Message-ID: <20261124123812.46979f5c@gandalf.local.home>
In-Reply-To: <20261028033127.82193-5-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
	<20261028033127.82193-5-kmehltretter@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 97A0D32
X-Stat-Signature: 4xbhd988e3g1csasnigwrdkcdq4qsys5
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX198MftYJKZb6cHxlY3uXfTzLYEjUtUPn2o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=Z7ZqvSQjxHguoc1FTxJ8uNaW6BCtmmOurJdgC95SiWI=; b=vG79UtM65xVyDMhJcFJ0SJYuTRpNzihz/B5peKySpBcuvkVCkGYKYMsWF0bznW1oLEGCm6hOQr7mbFCA35ZzyhY0PViyO/owV3x//rZRGt7jTrCGtm/33B9kCAAA/LG4BT/iwvgFZwEOMLv4K1onpFbyk6J0w5qrId6JYmYbdrU=
X-HE-Tag: 1795541893-954039
X-HE-Meta: U2FsdGVkX19sulWhS/9891zS4KS5jVoQBW7ftJGYbRku5nwzwrevSJlpeohJjPhi0PGybtsZakyMexSWzlsfRQ3gW5tNzLIz0qeHXYAjlrVfZw96CfUGbT12mMbMzeFGsL/vMOuHNsc4JladTqyVibXWkNkjRE813CMxAAtPPI05Rn6zZ0GiRZfvRv3KThXKipyI+3gyetA1F4OZZ5yenvDob+pV0MF581Iv4hOJPhNf2vIL7OZLUSUqgnItiprU3NfU/sjicTkv7Yb+1aXYv2uUnzzCn5k8AKsCMQ7QO9OwXOa/firti7syKykRznECFqI2E5XsLt6OyXYVWWahbjH8CNmrS0Ed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_093825_960517_CA84C13A 
X-CRM114-Status: GOOD (  13.56  )
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
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 04:31:18 +0100
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> On arm64, this change relies on __kern_my_cpu_offset() being forced inline
> by the earlier prerequisite patch so the call chain remains noinstr-safe.
> 
> Assisted-by: LLM

Hmm, no Signed-off-by?

-- Steve

> ---
>  arch/arm64/kernel/entry-common.c | 6 +++---
>  include/linux/irqflags.h         | 3 +++
>  kernel/entry/common.c            | 2 +-
>  kernel/locking/lockdep.c         | 6 ++++--
>  4 files changed, 11 insertions(+), 6 deletions(-)


