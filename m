Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68837606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NizbjVzN;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bBHUvF1U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yVtNEwefQmvDUIkWL22wrsyVTS0HPIUc2diMJs3lPPw=; b=NizbjVzNC1eVZTgTn/HXWv5rTn
	amhq6MHjKGB4JdPHobYdvXzt5iBWoHNuKH2k01DzuWvrJJIfBggjklE9gR7D5CElFDSETgES95182
	S4HGXJBGQ/gxxtX47lfU8B5ej9MzclYg5NrIKurv1Q5AoZxuKKJqN2KDsp3evTFqsPQopycrUwhRt
	ibAUfEPQYIviD+8kvUlpa+P71KYxSLonvfYm1zB6IpbfpyX8jMhphSpHo+XgFeHCG7jCvxKMqtLO8
	E6qFoepnex3Eg2MOrPwg6fMg/w6IwHqnq3kOK/oRVid6eFawRGKM2FEbOotHtP3GWx7KDVhFt3m/I
	i475i7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYGZ-00000004RS7-0dkd;
	Mon, 23 Nov 2026 17:55:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYGV-00000004RQg-474e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:55:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DBC6176B;
	Mon, 23 Nov 2026 09:55:40 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A939E3F763;
	Mon, 23 Nov 2026 09:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795456543; bh=DmpffMUW+0WvtzW7S8Ulzv+huswGuPkjQ4AkTENQ9gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBHUvF1UZA61LUkCxTjPlYt6sDQ01oOFpmVDLA62dE4dshGEUtqAz3VgnJP2zFRK1
	 sWkKzQJGGVZhvwBPrU2kTx0pa9cTPt4cNY4gBaTitoLOuk4/zJcxVBNSoJEd0RRo+M
	 nD/2Q0JZ9uXTawZzWD76SO78AKlVDYF8z9wnM4v0=
Date: Mon, 23 Nov 2026 17:55:40 +0000
From: Leo Yan <leo.yan@arm.com>
To: Amir Ayupov <aaupov@fb.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [RFC] perf: SW strobing for AUX trace windows
Message-ID: <20261123175540.GE9176@e132581.arm.com>
References: <20261113074125.4146687-1-aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113074125.4146687-1-aaupov@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_095544_118489_F706C773 
X-CRM114-Status: GOOD (  25.62  )
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

On Thu, Nov 12, 2026 at 11:41:18PM -0800, Amir Ayupov wrote:

[...]

> pmu_pulse (coresight-only)
> ----------------------------------------------
> 
> The first attempt was to try to avoid perf/core entirely, and extend
> a coresight config with pulsing ETE external output on every cycle
> while tracing is enabled [1]. This way, pause event on TRCEXTOUTn
> ends the window after exacly N traced cycles. The use of ETE external
> output is pure coincidence, just a way to count cycles only while
> tracing is enabled.
> 
> However, the review has raised that the config is not self-contained
> and requires a lot of checks to only enable it on capable HW:
> - needs a helper in the arm64 PMUv3 header and a move of PMU
>   definitions - needs arm64 maintainer's approval;
> - only works on ETE whose PMU counts TRCEXTOUTn,
> - the window is always measured in traced cycles;
> - is restricted to ETM, doesn't help Intel PT,
> - the further it is from a pure config change, the less understanding
>   I have to support the patch series further.
> 
> I decided to abandon that approach and ask for a better/more general
> solution, hence this RFC.

I saw you have sent CoreSight and PMU pulse v6, I will review it.
It is a good improvement for me.

> Option 3: cross-event "arming" (attr.aux_pause_armed)
> ---------------------------------------------------------------------
> 
> This extends aux-action with a new bit (aux_pause_armed):
> - aux pause event period is set in an overflow of aux resume in group,
> - restarts from the full period,
> - on overflow, pauses aux tracing:
> 
> This is the most flexible and general solution:
> ```
>   # resume every 10M cycles, trace 5000 cycles
>   -e '{cs_etm/aux-action=start-paused/,
>        cycles/aux-action=resume,period=10000000/,
>        cycles/aux-action=pause-armed,period=5000,call-graph=fp/}'
> 
>   # resume on page faults, trace 100k instructions
>   -e '{intel_pt/aux-action=start-paused/,
>        page-faults/aux-action=resume/,
>        instructions/aux-action=pause-armed,period=100000/}'
> ```

I am just wandering if we can extend a bit "aux-action" syntax to
support delta value, something like:

  -e '{cs_etm/aux-action=start-paused/,
       cycles/aux-action=resume,period=10000000/,
       cycles/aux-action=pause,period=+5000,call-graph=fp/}'

The + symbol indicates that the pause event occurs 5,000 cycles after
the resume event.

> Cons:
> 1. the core has to keep a disarmed event stopped across group
> scheduling, throttling, ioc_period, power mgmt.
> 2. rearming happens in the overflow handler (in NMI/IRQ).
> 3. Software pause events are not supported.

Why here software pause event cannot be supported?

> Question
> ---------
> 
> Does it sound reasonable for perf to support this, or it's better
> to pursue pt/coresight-specific solutions? In the end, my use case
> is about tracing.

I think you are asking perf core maintainers to explore a proper way to
move forward. If no feedback, it is good to send RFC series to
demonstrate idea if you have a preference.

> If yes, which option is preferable?
> - Option 1 with restoring first period behavior that was already there,
> - option 2 as cleaner fix,
> - option 3 as completely general but with more core state to track,
> - something else?

Seems to me, if we extend a bit with "+" syntax, this can be general
enough to benefit all AUX trace. And we don't need to introduce extra
new interface.

Thanks,
Leo

