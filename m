Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A715F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=15CWPMj/;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xrLvamyi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GyubhaEOLN7D/19FkpOmekZzLJ5vhZuDJz1CV5g+qx4=; b=15CWPMj/h1DgWf
	E4K2oe/6K7JSkET5m6wYWQJV1hl/5nWj0PcGhZTRyvl7m9RzP2OH50E8ieJIFbaJtUIcbcIWVPqXK
	v1AtTtQ0Rfjc59j/45E6Bn7Va4P2QArt0k6QOXeiViSzOrSmWrhCyFvcNoPSxtpRn423cbLxnyQkN
	ndTZlkAKNXMWD1DVWE285/lgY6XF09Ki6JUceZtN+HaZJUqvRdTdaAtNf1ibX9JGzUd0OMq4+TB0X
	m9qWHUJscgAOUUVlL2An/ZJ66nKeiR845ocGmagQVXrW3UniKEL/+rSvWsF/bBfNgI/7W0y/lCuS6
	9U+0pxb2W9+i2O+dB7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMUJ-00000000OV8-1fqK;
	Mon, 09 Nov 2026 10:20:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMUH-00000000OUg-0SU4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:20:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a215e64962so7839105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794219627; x=1794824427; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyubhaEOLN7D/19FkpOmekZzLJ5vhZuDJz1CV5g+qx4=;
        b=xrLvamyid/dx7UDieTa1PMR8OHXvndb8sxW/xKohg+rVz6aqzw05LIV6RMZ/HiNyx+
         oGmCuEMBaawcxa4oEmGcBgCeF1FydLCkTGUNiz80TQ/dXq2ZiPCNWdWHyu28FLXGILs0
         8fckUERKrhTp5p+Zc1wefcoW0pDVD96vk/r+hlfQHw44hubp3wJo1BY32pTFkVPiaGJ6
         q+1oo/YBtG+a88DX2d58BhaNTHgN09E/U0FjrbWXuOKFjXbJlqHuSKbWStUC1heYxgRn
         28DHBVm+7mh+viSV8n4q4mbjQniTQf4QsE5GCK5DFqzGpp83mYGOcVF4AtBvgeKiOgwk
         q24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219627; x=1794824427;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyubhaEOLN7D/19FkpOmekZzLJ5vhZuDJz1CV5g+qx4=;
        b=WltjAJ5H3uT7P6GfT1vmi3+FRYArytnd4iMVNlkgNXXWTNHZS/E4/sZ0iLVEreJHeO
         1Jzp446hm1gK0uvHqhY2sickaop+U0uDd9dc+4Z94949yNezEZeod5nnrcXmdkaKXDdN
         jlqcxsaTGvPjeADKSYoCy0xOpRSW7pT12wWS8ZiCQ7HF4TqpyqTIjUJw+1zOlDl6XHog
         xD4DZK9llEiFIyu6KI2jUcX38AL9iBN9gHdJZ3qniphGOBjo4r41hZo8z+EX3fEw0smz
         6sr1EK9XD1aWMChXLPZx2DF/d3vfU9OWrc5WtPqvcnOjDSjGaaBjGQt6iwr03Bzgq7WL
         I81g==
X-Forwarded-Encrypted: i=1; AL+hErGTUGuhUgK6xU2/BXDy2Og7bA2kTdYkD+WHUQ/XHv+zfl6ZBCKEe8sFTcmk2yqzD2LGbU4VLBYn6kKuLYEbxCIc@lists.infradead.org
X-Gm-Message-State: APuU4Z9OajR1IHDCZ48whlmcKJeuv3Tm3kfto+aUWE8k8YmjWpwmAUdF
	t8LgNex4i89m81tUO9DZAL3pEAd9ZG5ElZ1P6Vok6A7OO72qGdAFN4lx7rvEHBzg7QI=
X-Gm-Gg: AYBFou3FBNdnymyTHIW+y+sXumHjQ5UnKxF5BoA285sbRifoazu6O3nc2K/N6UPkrm8
	aL30HKlIssLdQ7dtti2dMg4jMaN599hzokbwAG3+4LIhFivVaEoi/evcVAcxjH1vNFOU8Oh0aUz
	akvKF05KAvLRGQiMW/l2v+1zNoT1xCVwV1x9vsUuPT9aT+pK9ppdZ4OxAhAYBhraogYQz0qQDzr
	KpRVmjr0vXbTbMaiz2NZk9sp5dK/gBIh9ncApA7r+T3LnQBphtJwhg9H6dwYdY8eij0Pl9THGJ0
	S/WFsyAKsG3xUkp8hZnTY0G3R2Vg/E+XkUjp0QPPz9x62Be8YQzWjHkhnDRDlYHAI1A3Vh7Lnut
	DQLDZnPCU21GsgTUqKHBLZiR14B19QM7EB5EOM4ApisyLCTvbL9uM4iRD79X+903Zl4o5v9hBaU
	jc0isxHrb/KlLubsAJyk/MmeqE/eAa6taejbUQ+RVL/OmXEByhOgqGFke779q8ck+9XPAsSJP+i
	7s538xO56Jh6u+luib7oQ8OhatgAU122XS112YBAS9yrNgTrYLK1wcnqOBBpbbbynmsyCKFzS24
	8DgXgr1be5Eyu1IE+OO//MNr/kFJlfThPvSn7t2GiBJ+UWprDk5bew==
X-Received: by 2002:a05:600c:8b45:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4b963c8ea4emr61122485e9.24.1794219626867;
        Mon, 09 Nov 2026 02:20:26 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495974660cfsm9316703f8f.38.2026.11.09.02.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:20:26 -0800 (PST)
Message-ID: <5d77f0ed-e175-47f6-af0a-050e0bbc66c7@linaro.org>
Date: Mon, 9 Nov 2026 10:20:25 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64: Fix typos in event descriptions
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org,
 Shunsuke Nakamura <nakamura.shun@fujitsu.com>,
 John Garry <john.garry@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
References: <20261108184654.3811267-1-takano32@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261108184654.3811267-1-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_022029_187707_5EE5C51F 
X-CRM114-Status: GOOD (  19.09  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 08/11/2026 18:46, TAKANO Mitsuhiro wrote:
> Six entries in common-and-microarch.json spell Statistical as "Statisical"
> (the SAMPLE_FEED_* events), and one entry in the Fujitsu a64fx table, the
> L2HWPF_STREAM_PF event, spells prefetcher as "prefecher" in both its
> BriefDescription and its PublicDescription.
> 
> The SAMPLE_FEED_* events are inherited through ArchStdEvent by the
> neoverse-n3, neoverse-v3 and t410 tables, so the misspelling reaches those
> three generated tables.  The a64fx pair appears once, because the long
> description is dropped when it equals the brief one.
> 
> Spell the words correctly.  Event names, codes and expressions are
> unchanged.
> 
> Written with Hermes Agent, an LLM assistant.  Running jevents.py for arm64
> before and after this change removes 12 occurrences of "Statisical" and the
> one "prefecher" from the generated string table; perf was not rebuilt.
> 
> Fixes: 994256a79867 ("perf vendor events arm64: Add N3 events/metrics")
> Fixes: 5497b23e870c ("perf vendor events arm64: Add Fujitsu A64FX pmu event")
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
>   .../pmu-events/arch/arm64/common-and-microarch.json  | 12 ++++++------
>   .../pmu-events/arch/arm64/fujitsu/a64fx/other.json   |  4 ++--
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> index 144325d87be4..c61d6c0ceb4f 100644
> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> @@ -1340,32 +1340,32 @@
>       {
>           "EventCode": "0x812A",
>           "EventName": "SAMPLE_FEED_BR",
> -        "BriefDescription": "Statisical Profiling sample taken, branch"
> +        "BriefDescription": "Statistical Profiling sample taken, branch"
>       },
>       {
>           "EventCode": "0x812B",
>           "EventName": "SAMPLE_FEED_LD",
> -        "BriefDescription": "Statisical Profiling sample taken, load"
> +        "BriefDescription": "Statistical Profiling sample taken, load"
>       },
>       {
>           "EventCode": "0x812C",
>           "EventName": "SAMPLE_FEED_ST",
> -        "BriefDescription": "Statisical Profiling sample taken, store"
> +        "BriefDescription": "Statistical Profiling sample taken, store"
>       },
>       {
>           "EventCode": "0x812D",
>           "EventName": "SAMPLE_FEED_OP",
> -        "BriefDescription": "Statisical Profiling sample taken, matching operation type"
> +        "BriefDescription": "Statistical Profiling sample taken, matching operation type"
>       },
>       {
>           "EventCode": "0x812E",
>           "EventName": "SAMPLE_FEED_EVENT",
> -        "BriefDescription": "Statisical Profiling sample taken, matching events"
> +        "BriefDescription": "Statistical Profiling sample taken, matching events"
>       },
>       {
>           "EventCode": "0x812F",
>           "EventName": "SAMPLE_FEED_LAT",
> -        "BriefDescription": "Statisical Profiling sample taken, exceeding minimum latency"
> +        "BriefDescription": "Statistical Profiling sample taken, exceeding minimum latency"
>       },
>       {
>           "EventCode": "0x8130",
> diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json b/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json
> index 10c823ac26cc..6fa2936e427d 100644
> --- a/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json
> +++ b/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json
> @@ -162,10 +162,10 @@
>       "BriefDescription": "This event counts non-allocation type prefetch injection requests to L1D cache generated by hardware prefetcher."
>     },
>     {
> -    "PublicDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefecher.",
> +    "PublicDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefetcher.",
>       "EventCode": "0x233",
>       "EventName": "L2HWPF_STREAM_PF",
> -    "BriefDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefecher."
> +    "BriefDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefetcher."
>     },
>     {
>       "PublicDescription": "This event counts allocation type prefetch injection requests to L2 cache generated by hardware prefetcher.",
> 
> base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee

Reviewed-by: James Clark <james.clark@linaro.org>


