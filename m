Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF51606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k2cskQj+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A5EYb/eT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RQlG0v4Trtbaptdh5GqnribpcB9Q2TYYpJ7BqbeuP0w=; b=k2cskQj+UsdJKAhO/PhCp8UFA1
	xaIqS2VcUkHemTPG7yXdq7e1ARecB1Ob0MXc7RcxPzENSIEa3bWQUGCi5S2kk+xZaHS1PSyC5U1wI
	1t7OFivCpEbLcvKu6KJedQoYDuBL1vBLVpi+cW5R+8G3v+xX6rfQnYY0qCIET2umze9c96qPLDe1L
	CMLu5OTF1/LSwx7GRMt44yta3TXS7cVF7cq6TzXoqHPd3gdoDAksBnuwDeyPhbOEhmk+VuoeeSEQ1
	Kq09hDysHjfNPObPHZBMJmKvSE3O9FczcNKLf3O7E3stvv5dJDBprlZGstHJWv74Z14uAfVuRPW2J
	RinPpR2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwDU-0000000GIT8-0bV2;
	Fri, 27 Nov 2026 13:42:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwDR-0000000GISN-1dte
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:42:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED7C31758;
	Fri, 27 Nov 2026 05:42:12 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DF053F632;
	Fri, 27 Nov 2026 05:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795786935; bh=xC6wYRcGfViCjcXm1JDHAhxmgvTwmoH9FHOORhqqP+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5EYb/eTLfRSLdOvhq6fwaXlbRUI9DcXJYTUSIlisNg1iHWL+X/bv91TO1mVDbeha
	 zTQvTfAg7y1yEiUToexDQQ5D/5GFU34Q4dl7QW2UkkUU3TISrFKZHE6j3NsfM7yO7F
	 NG1HBqENS5cK/xtQ57FZPlCA3ei27z0wHeqqMHfk=
Date: Fri, 27 Nov 2026 13:42:02 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
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
Subject: Re: [PATCH v2 2/3] arm64: Always inline preempt count and reschedule
 checks
Message-ID: <awmIqm3y8NLf4115@arm.com>
References: <cover.1795631277.git.kmehltretter@gmail.com>
 <9546998cffeaf365f8f67901a48ef103945dc342.1795631277.git.kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9546998cffeaf365f8f67901a48ef103945dc342.1795631277.git.kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_054217_515271_29D3E079 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 03:30:53AM +0100, Karl Mehltretter wrote:
> The preempt count and reschedule checks are plain inline functions,
> which permits out-of-line copies in instrumentable text. The checked
> notrace helpers added by the following patch use preempt_count(), while
> preempt_enable_notrace() uses should_resched() with
> CONFIG_DEBUG_PREEMPT and __preempt_count_dec_and_test() without it.
> 
> Force all three operations inline so noinstr callers keep them in their
> own section.
> 
> Reviewed-by: Hongyan Xia <hongyan.xia@transsion.com>
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

