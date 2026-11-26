Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD25606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3F1JGYiA;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WQwPnco+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rhuNE5ZBjPY4tQM9iK0/pMmQ8I5mIIDIxgZDyp0clYQ=; b=3F1JGYiANshbVufKu9Zz2cNQq8
	xRKicoZaFqnzChx3DLqqBLFSLbI00FvRoK8qatx2aE+ddhB4ApcU+Uat7Ao3bLPGyitImzzVqjp1G
	jBoDlZx01NTU58a9jDcf+zhHTPDK2P5lhBcmQOxTHd0bhcncIIEVviGStT2qOO4cvgAbLw25kxdhr
	7yJV9PUEqQr3hD1iQyRo0v74/LOkrmRFa0/cx/QxNKyiImDor2edp9C9CpxYMhBcLN9iTFniuB7Zg
	z0VA4aKUsReAGbJvZDPA8PPtHOUSzPzRTe1WpLALA/2UQz5b750173D4zPEOTMDAKuj+8nSIn1Om3
	F6TdbM8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd7o-0000000E2BS-0aDH;
	Thu, 26 Nov 2026 17:19:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd7l-0000000E2AH-32xq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:19:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 976901BA8;
	Thu, 26 Nov 2026 09:19:03 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FB553F632;
	Thu, 26 Nov 2026 09:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795713546; bh=sZs002yDgzA/dip7O6vSkyyHHDBEqKsTsOooqP68T3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQwPnco+m4E6tas0PwJz5g+dSTh0h6mJYL1KDaMMF7XGQnmhSEeBYfbePNjX/pdfJ
	 vsxH+p786cl9H6eKs3yMNEgCshrcbaIiIirRx8w5NN4hk45Y1SsOdTJIHJpImcA0jZ
	 vM6YrW02LPKHZvLfZk9W2dAqEPcoKEc7sWq1Ln20=
Date: Thu, 26 Nov 2026 17:19:04 +0000
From: Leo Yan <leo.yan@arm.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	bpf@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shuah Khan <shuah@kernel.org>, Breno Leitao <leitao@debian.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Stephane Eranian <eranian@google.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v6 2/3] perf/arm64: Add BRBE support for
 bpf_get_branch_snapshot()
Message-ID: <20261126171904.GA809232@e132581.arm.com>
References: <20260810164622.1829843-1-puranjay@kernel.org>
 <20260810164622.1829843-3-puranjay@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810164622.1829843-3-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_091909_845298_BBC18326 
X-CRM114-Status: GOOD (  17.29  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Aug 10, 2026 at 09:46:19AM -0700, Puranjay Mohan wrote:

[...]

> +int brbe_snapshot_branch_stack(struct perf_branch_entry *entries, unsigned int cnt)
> +{
> +	u64 brbidr, brbfcr, brbcr, pmcr;
> +	int nr_hw, nr_copied = 0;
> +	bool paused_here = false;
> +	unsigned long flags;
> +
> +	/* Called with migration disabled, so this is the CPU read below. */
> +	if (!valid_brbe_version())
> +		return 0;
> +
> +	flags = raw_local_daif_save();
> +
> +	brbcr = read_sysreg_s(SYS_BRBCR_EL1);
> +	brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
> +
> +	/*
> +	 * PAUSED is only ever set behind our back, so finding it set is final.
> +	 * likely() keeps this inline; a taken branch costs a record.
> +	 */
> +	if (likely(brbcr && !(brbfcr & BRBFCR_EL1_PAUSED))) {
> +		/*
> +		 * Stop the counters so a freeze cannot set PAUSED behind the
> +		 * value read below; the D19.3 conditions need a PMOVSCLR_EL0
> +		 * bit, which a stopped counter cannot set.
> +		 */
> +		pmcr = read_pmcr();
> +		write_pmcr(pmcr & ~ARMV8_PMU_PMCR_E);
> +		isb();
> +
> +		brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
> +		paused_here = !(brbfcr & BRBFCR_EL1_PAUSED);
> +
> +		write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> +		isb();
> +	}

AI pointed out a edge case:

 1) The PMU is enabled (PMCR_EL0.E=1). The first BRBFCR_EL1 read
    observes PAUSED=0.
 2) A counter overflows and hardware freezes BRBE before the helper
    stops the counters. This can happen while interrupt is masked.
 3) The helper saves PMCR_EL0 and clears PMCR_E. Its second BRBFCR_EL1
    read observes PAUSED=1, so paused_here becomes false.
 4) The only write restoring the saved PMCR_EL0 is inside
    "if (paused_here)". The helper therefore returns with PMCR_EL0.E=0.

This can happen with a normal PMU IRQ because hardware can freeze BRBE
while local IRQs are masked.

> +	trace_hardirqs_off();

The irqsoff tracer misses the time between raw_local_daif_save() and
this call. Other callers could introduce similar gaps by using the raw
helper.

I'll reply separately on the pNMI / NMI cases with an approach that
may avoid adding the raw helpers.

Thanks,
Leo

