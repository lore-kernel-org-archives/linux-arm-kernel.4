Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCAF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i1QaImHs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHC8Cs1K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=78nTSKa2nxUaY/GhhwmGmp03fHV3/pZwZP3Jmcc23BQ=; b=i1QaImHsaMy5yQuALE2ThE89Hw
	Nas85+inGUZ+XQYJCljga3oI78RkHpdhj5Fv1d8SzScUag3oC4tf6KL5CM36/grFvbPLtEuDNrTk3
	O9PW/kDkvi6J09B398iD2tI/nUTZMPQl/S0naV3EryBkq1RVt46SwrHQNkc026CT9urWQ2rHM4KuP
	jbGx1lqSjX7bI7jKWsQLXpItoWPoKEd7DV/iGvMJX5OeZba7OTDg6/IyEdEBRJZLswpAgSftDKcee
	gR7mW+wd2hq8AVd/gYjqZ4iC0pNvVEtVtAjDfRJWyvUjA8Kn2lmbpc19CZeVNHNmAliRcd25m+iI3
	YsRq6FHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcmL-000000056PZ-3OvJ;
	Mon, 23 Nov 2026 22:44:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcmK-000000056PT-1hqb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 22:44:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7ECDC611ED;
	Mon, 23 Nov 2026 22:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0A61F000CA;
	Mon, 23 Nov 2026 22:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795473891;
	bh=78nTSKa2nxUaY/GhhwmGmp03fHV3/pZwZP3Jmcc23BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EHC8Cs1Kalr85i1XaKE8vK2DWqQ6ng3dDjJ4htpMw6l3MViggmYZJjPbGVJnADvv3
	 EakIi5HKzXXyGjxzPeLH/0V6txzs/HJR2/eGUfi7+8fjBHbGzrUx66Qn/fCotbagPa
	 rQS8bwSoK73GReIz6R2WXkUgpqwesUPQ+avXxMj0tzqRObgzz5oJuk6lX251+FbGZY
	 zTKyaaejT+XzewxFtZrF2JcUu1ktvUtGtnhkIDNHGyX5x0HS8ErA3p6avTtUD6kXvc
	 bNVrm+6CZlg6SP1qglDqy3J/L+ho199+r3gJCs3fgEd26CfKAIEqUY3nCtzBvBzhCF
	 osr49JaJ4asjg==
Date: Mon, 23 Nov 2026 14:44:49 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: linux-perf-users@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH v12 1/2] perf vendor events: Fix misspelled keys in the
 event tables
Message-ID: <awTB4cryDW4H4no7@google.com>
References: <20261120060931.711483-1-takano32@gmail.com>
 <20261120134252.1036963-1-takano32@gmail.com>
 <20261120134252.1036963-2-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120134252.1036963-2-takano32@gmail.com>
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

Hello,

On Fri, Nov 20, 2026 at 01:42:51PM +0000, TAKANO Mitsuhiro wrote:
> Sixteen objects in arch/arm64/ampere/ampereonex/mmu.json carry
> "PublicDescrition" and one object in each of amdzen4/cache.json,
> amdzen5/load-store.json and amdzen6/load-store.json carries
> "BriefDescript6ion".  jevents.py reads only the keys it knows by name, so
> these fields have no effect: the text is dropped without a word and never
> reaches the generated tables.
> 
> For the three AMD events that leaves them with no description at all, and
> the text comes back.  The AmpereOneX events carry the same text in
> BriefDescription and the generator drops a duplicate long description, so
> the generated arm64 tables are unchanged.
> 
> This is the same change as "perf vendor events arm64 AmpereOneX: Fix
> misspelled PublicDescription keys" (Message-ID
> <20261113065253.746615-1-takano32@gmail.com>) and "perf vendor events amd:
> Fix a misspelled JSON key" (<20261108184600.3810059-1-takano32@gmail.com>),
> squashed into one patch so that this series applies on its own.
> 
> Written with Hermes Agent, an LLM assistant; the author reviewed it and
> ran the generator as described.
> 
> Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU events and metrics")
> Fixes: 658448281d19 ("perf vendor events amd: Add Zen 4 core events")
> Fixes: 45c072f2537a ("perf vendor events amd: Add Zen 5 core events")
> Fixes: 2f42fb0661d9 ("perf vendor events amd: Add Zen 6 core events")
> Acked-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>

Can you please rebase your series on top of perf-tools-next?

Thanks,
Namhyung


> ---
>  .../arch/arm64/ampere/ampereonex/mmu.json     | 32 +++++++++----------
>  .../pmu-events/arch/x86/amdzen4/cache.json    |  2 +-
>  .../arch/x86/amdzen5/load-store.json          |  2 +-
>  .../arch/x86/amdzen6/load-store.json          |  2 +-
>  4 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
> index 66d83b680651..9457f9be4ecc 100644
> --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
> +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
> @@ -30,37 +30,37 @@
>          "BriefDescription": "Data TLB translation cache hit on S2L2 walk cache entry"
>      },
>      {
> -        "PublicDescrition": "Data TLB translation cache hit on S2L1 walk cache entry",
> +        "PublicDescription": "Data TLB translation cache hit on S2L1 walk cache entry",
>          "EventCode": "0xd805",
>          "EventName": "MMU_D_TRANS_CACHE_HIT_S2L1_WALK",
>          "BriefDescription": "Data TLB translation cache hit on S2L1 walk cache entry"
>      },
>      {
> -        "PublicDescrition": "Data TLB translation cache hit on S2L0 walk cache entry",
> +        "PublicDescription": "Data TLB translation cache hit on S2L0 walk cache entry",
>          "EventCode": "0xd806",
>          "EventName": "MMU_D_TRANS_CACHE_HIT_S2L0_WALK",
>          "BriefDescription": "Data TLB translation cache hit on S2L0 walk cache entry"
>      },
>      {
> -        "PublicDescrition": "Data-side S1 page walk cache lookup",
> +        "PublicDescription": "Data-side S1 page walk cache lookup",
>          "EventCode": "0xd807",
>          "EventName": "MMU_D_S1_WALK_CACHE_LOOKUP",
>          "BriefDescription": "Data-side S1 page walk cache lookup"
>      },
>      {
> -        "PublicDescrition": "Data-side S1 page walk cache refill",
> +        "PublicDescription": "Data-side S1 page walk cache refill",
>          "EventCode": "0xd808",
>          "EventName": "MMU_D_S1_WALK_CACHE_REFILL",
>          "BriefDescription": "Data-side S1 page walk cache refill"
>      },
>      {
> -        "PublicDescrition": "Data-side S2 page walk cache lookup",
> +        "PublicDescription": "Data-side S2 page walk cache lookup",
>          "EventCode": "0xd809",
>          "EventName": "MMU_D_S2_WALK_CACHE_LOOKUP",
>          "BriefDescription": "Data-side S2 page walk cache lookup"
>      },
>      {
> -        "PublicDescrition": "Data-side S2 page walk cache refill",
> +        "PublicDescription": "Data-side S2 page walk cache refill",
>          "EventCode": "0xd80a",
>          "EventName": "MMU_D_S2_WALK_CACHE_REFILL",
>          "BriefDescription": "Data-side S2 page walk cache refill"
> @@ -90,61 +90,61 @@
>          "BriefDescription": "Level 2 instruction translation buffer allocation"
>      },
>      {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S1L2 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S1L2 walk cache entry",
>          "EventCode": "0xd901",
>          "EventName": "MMU_I_TRANS_CACHE_HIT_S1L2_WALK",
>          "BriefDescription": "Instruction TLB translation cache hit on S1L2 walk cache entry"
>      },
>      {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S1L1 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S1L1 walk cache entry",
>          "EventCode": "0xd902",
>          "EventName": "MMU_I_TRANS_CACHE_HIT_S1L1_WALK",
>          "BriefDescription": "Instruction TLB translation cache hit on S1L1 walk cache entry"
>      },
>      {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S1L0 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S1L0 walk cache entry",
>          "EventCode": "0xd903",
>          "EventName": "MMU_I_TRANS_CACHE_HIT_S1L0_WALK",
>          "BriefDescription": "Instruction TLB translation cache hit on S1L0 walk cache entry"
>      },
>      {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S2L2 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S2L2 walk cache entry",
>          "EventCode": "0xd904",
>          "EventName": "MMU_I_TRANS_CACHE_HIT_S2L2_WALK",
>          "BriefDescription": "Instruction TLB translation cache hit on S2L2 walk cache entry"
>      },
>      {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S2L1 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S2L1 walk cache entry",
>          "EventCode": "0xd905",
>          "EventName": "MMU_I_TRANS_CACHE_HIT_S2L1_WALK",
>          "BriefDescription": "Instruction TLB translation cache hit on S2L1 walk cache entry"
>      },
>      {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S2L0 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S2L0 walk cache entry",
>          "EventCode": "0xd906",
>          "EventName": "MMU_I_TRANS_CACHE_HIT_S2L0_WALK",
>          "BriefDescription": "Instruction TLB translation cache hit on S2L0 walk cache entry"
>      },
>      {
> -        "PublicDescrition": "Instruction-side S1 page walk cache lookup",
> +        "PublicDescription": "Instruction-side S1 page walk cache lookup",
>          "EventCode": "0xd907",
>          "EventName": "MMU_I_S1_WALK_CACHE_LOOKUP",
>          "BriefDescription": "Instruction-side S1 page walk cache lookup"
>      },
>      {
> -        "PublicDescrition": "Instruction-side S1 page walk cache refill",
> +        "PublicDescription": "Instruction-side S1 page walk cache refill",
>          "EventCode": "0xd908",
>          "EventName": "MMU_I_S1_WALK_CACHE_REFILL",
>          "BriefDescription": "Instruction-side S1 page walk cache refill"
>      },
>      {
> -        "PublicDescrition": "Instruction-side S2 page walk cache lookup",
> +        "PublicDescription": "Instruction-side S2 page walk cache lookup",
>          "EventCode": "0xd909",
>          "EventName": "MMU_I_S2_WALK_CACHE_LOOKUP",
>          "BriefDescription": "Instruction-side S2 page walk cache lookup"
>      },
>      {
> -        "PublicDescrition": "Instruction-side S2 page walk cache refill",
> +        "PublicDescription": "Instruction-side S2 page walk cache refill",
>          "EventCode": "0xd90a",
>          "EventName": "MMU_I_S2_WALK_CACHE_REFILL",
>          "BriefDescription": "Instruction-side S2 page walk cache refill"
> diff --git a/tools/perf/pmu-events/arch/x86/amdzen4/cache.json b/tools/perf/pmu-events/arch/x86/amdzen4/cache.json
> index e6d710cf3ce2..01c848a9dbb3 100644
> --- a/tools/perf/pmu-events/arch/x86/amdzen4/cache.json
> +++ b/tools/perf/pmu-events/arch/x86/amdzen4/cache.json
> @@ -182,7 +182,7 @@
>    {
>      "EventName": "ls_inef_sw_pref.all",
>      "EventCode": "0x52",
> -    "BriefDescript6ion": "Software prefetches that did not fetch data outside of the processor core for any reason.",
> +    "BriefDescription": "Software prefetches that did not fetch data outside of the processor core for any reason.",
>      "UMask": "0x03"
>    },
>    {
> diff --git a/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json b/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json
> index b1994539ece8..774da0bfa0dd 100644
> --- a/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json
> +++ b/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json
> @@ -351,7 +351,7 @@
>    {
>      "EventName": "ls_inef_sw_pref.all",
>      "EventCode": "0x52",
> -    "BriefDescript6ion": "Software prefetches that did not fetch data outside of the processor core for any reason.",
> +    "BriefDescription": "Software prefetches that did not fetch data outside of the processor core for any reason.",
>      "UMask": "0x03"
>    },
>    {
> diff --git a/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json b/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json
> index 4291eb59426f..4adba70bffb1 100644
> --- a/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json
> +++ b/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json
> @@ -351,7 +351,7 @@
>    {
>      "EventName": "ls_inef_sw_pref.all",
>      "EventCode": "0x52",
> -    "BriefDescript6ion": "Software prefetches that did not fetch data outside of the processor core for any reason.",
> +    "BriefDescription": "Software prefetches that did not fetch data outside of the processor core for any reason.",
>      "UMask": "0x03"
>    },
>    {
> -- 
> 2.53.0
> 

