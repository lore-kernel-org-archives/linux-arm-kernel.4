Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B527606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QD3ttIHC;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lhRJNn0e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7PWYFgnWRA7J2Tp/U4CnHi6Y624sycAtEGCSG6P7wvY=; b=QD3ttIHCwGI8iUOsLNGkgocHuk
	VJEdhnfG+bNlkgf+AfB2cVF4HL4sGD7kgd11esiCcDetLDvEShPNcNPsaSSye3WAFq9Uk75vw+5gq
	lr/drcPBOIQGwi5eOEGT9ppsLjUi5qjqXE/bWBaEVXgpsCKzPF89SKv8CzCMrMFuO+psPAxlGvfeH
	0wnvhwDvOklQvv+5u4HjdNLXchO1eDHZWenyiN9o6IgZlz9BI5rLUIF7WRVczQ4CClEoXRXtHn7b3
	oBkLWU2SdZmkv9r2V4UCKzBkGubuGoUQnmJPL6qYsBi21ZxSLs4iNQn0MyiiJKBbJKTIwWFeQfMM6
	4HRtJTAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwCn-0000000GIIH-38mw;
	Fri, 27 Nov 2026 13:41:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwCk-0000000GIHy-2ibN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:41:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F3CB1570;
	Fri, 27 Nov 2026 05:41:30 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E06573F632;
	Fri, 27 Nov 2026 05:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795786893; bh=8KEDacbw0dHPGzTZCNTPxnLhbFoFMfZ9vy+2X8aYvwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhRJNn0e0C7SOTPvKpU24lIDbZ0aTvOoLxGMhvMLvDl0xm2HQGGd1Q4gkd2evIv+3
	 detfJ3BZlCwzoWLpVLy7SFHm9VpAYM9k8LFLvxE43d8mWDZq2wvGrYg9O+uwOOQa6N
	 ZMs14ruTwOSQucCvmEkmAvhRAUalfERUcaDj4R7g=
Date: Fri, 27 Nov 2026 13:41:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Will Deacon <will@kernel.org>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Song Liu <song@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: Always inline raw preempt count updates
Message-ID: <awmIhwotoPEWoO6B@arm.com>
References: <cover.1795631277.git.kmehltretter@gmail.com>
 <5ba8c2a33188f43f0b1d99d6ba97c8ea2e285f94.1795631277.git.kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ba8c2a33188f43f0b1d99d6ba97c8ea2e285f94.1795631277.git.kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_054134_733357_AC6091FC 
X-CRM114-Status: UNSURE (   9.48  )
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

On Thu, Nov 26, 2026 at 03:30:52AM +0100, Karl Mehltretter wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> Raw preempt count updates can be emitted out of line by the compiler.
> For a noinstr caller, that puts the update in ordinary instrumentable
> text. Force __preempt_count_add() and __preempt_count_sub() inline so
> their code stays in the caller's section.
> 
> Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> [kmehltretter: split out the arm64 preempt.h hunk and rewrite the changelog]
> Reviewed-by: Hongyan Xia <hongyan.xia@transsion.com>
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

