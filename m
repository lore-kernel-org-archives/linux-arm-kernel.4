Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DC6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QbdFOz4q;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xMYMjMjs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kIn3Z40GB3Fv6RQJNleZ9bonkImRIY4BwaanX9JUugM=; b=QbdFOz4qkQ4zoM
	UG0JEK3uoUchjuiyAkRNBsEyQgBbJdllBDr9bUnkyHEy8cfL9Pj/yyyfMZviNvzP8+ehMV873nfv1
	YKNX4qhG5nhUGSYl6s52WE4fdikKtJikx8lgY6ATKhhPa7CQ8SsrcgZY7ypIQHRMdm8mdOyiYbr06
	DcDNKo61Ct1QQY2ZXp6Ew02bwo4ncPvvjJHMQyyspcpemH3/rnANreSxQo6SHM8cbV3k6Tv5EvZAW
	urAZ6GIvsMJK0rzsUuZpZ9U3qLq7CCXFjhwH9aDAPGj2UNzH07Rt/+232r/Tr1zXT0dytGfGcP/YC
	9KNZsx+Vfa3YAqt9mo1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvg2-0000000GEB4-0Ubr;
	Fri, 27 Nov 2026 13:07:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvfx-0000000GEAJ-41Ag
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:07:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so65625865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 05:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795784860; x=1796389660; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIn3Z40GB3Fv6RQJNleZ9bonkImRIY4BwaanX9JUugM=;
        b=xMYMjMjsYeyhgRVNvJ2Z3KtbQGQvBVdnBmp6XpuW8eBd7ZvcrJZSx2I4S5eRonY4Jc
         ktTlGUKmKGStj6us+zw0gZtZrQsF9pxSkiDiX+0ESB+d3ZXEZihohaHPS3RtXitbeV4Y
         4Fsz4CnM4Vi8E4CDxmslJ080RvaAMBEuAcF2M8fvsftl0PbIlo+FnKjUpZGpHjupHNY1
         DyPPsVXNKXqmy1EGiEBac1GpVXYmwJdtrr1T5ZJPlWEcGsc1D9p/NE3tQHQa8Tp/BoBj
         ntrlj1oTr6gP7hSG1nB2TYZinLp/XTc6N/ne95+Phv3v0vmEeNOTbzjqRRsd7JBpiuaa
         1+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784860; x=1796389660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIn3Z40GB3Fv6RQJNleZ9bonkImRIY4BwaanX9JUugM=;
        b=gqDyRKZtSRo/5rtfEewpke7KCJvyFH1UevvWZB0DJEme4CsIZ65vqIojbW+pMrBNao
         LoWZPdasT/hfKEauxgp2zyPcicPJ80CHTpY7WcFOvuxqQ/GfBKHeIxQ5tSowuPuDf/T4
         7EIbgclLf45Hfdu9SQG5O26M0k3DLBI3a+jcaX7IiPvkq6JUnSSOuQv229TtCz5tYByx
         KhlNzWIGo3gkgfu4Kh614c2fJlk8zYyBPVkrv6MVqjqHxGlsesDqLZj4+WYbOv8XgKEK
         EFeKlx8o1evL7LXW0r/2Q28Zm9H7CQRhQMcDpn0Il79RugexVg8iW70Hncg3GCGvQ6il
         FnIg==
X-Forwarded-Encrypted: i=1; AL+hErHfNaCRUxxUcitXG73LtrTH0CbykWW4TerwseCfE5px0MNJpSpBOfFIdvCxTkq+6pzhE5ch79mpOR1fFIwQpRKM@lists.infradead.org
X-Gm-Message-State: APuU4Z8SDzbLEduSawxkROSIl0VTUpaGCBYXA7RXYPXY0P2VR9GxMud/
	gTmE+DGYn5Fc/qWxW2pKDTasY/Q2hGeUkqjZ0ccKqOzK+YdijyoyTSRudY/rRldO8mA=
X-Gm-Gg: AZFdTZdF77TdXCA/+/ao7ZuNHimh25Hf+59UKANVUdXpfKLUZqbmsA3B05ROagGt1fJ
	GOZJO2sjF6ZZAFfXYuBFaNMjdna+/bDtiIgnu0qK3N6J/8CzjGdueUiHRkRTYcttHqWQmac+Pgm
	RkhszGeBJOJ0FiLZpkrkCIsulq1laB83OD+dt2yBBnLggRoZ4gozPuxTeapFPRBr+VipFe5CWVQ
	93kvfUXWhofPrNAOeWyIdKe9CL7uW9HZDefWrGGvHd0Stg1WfWl57idXN2XcWQPTPwLxK+eJYR4
	COiD+UhraF8iblIhgJqtqAzqRf5NPADD+EfLEKMvhXwow6SfspX8vmS/QaNZY8FGVrfg1JakUOz
	yVtJSr+ZAzFthbYYHJWDUNE6I5Z/SdIfRMaul1xpvAG7VoOdRuiV7YevSQTn74uQoN+ix3qVuhW
	g94d9sCOkz5aFLS+riyVaoVWEncVdaWfr7KpS72BSNZcYJAQRf7zYpiT8Sy+VbWtF7DZ963RwmN
	1lFbj3rRbbG6NBG8eOKQ7vrgC7a0ymLCtg9pB3VDPOdExA2Pwzwe3W/yVxZuivT8V/0EnQYvU/5
	JvPKRtFdF7d20qj/37AVLaIO+k5u+54xkA==
X-Received: by 2002:a05:600c:6749:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4bb8881b52dmr457902075e9.23.1795784859950;
        Fri, 27 Nov 2026 05:07:39 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm725641925e9.2.2026.11.27.05.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:07:39 -0800 (PST)
Message-ID: <f1cd9130-76d3-4828-9cd0-aebb43e51de2@linaro.org>
Date: Fri, 27 Nov 2026 13:07:38 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf arm-spe: Honor --time ranges when synthesizing
 samples
To: Jan Bernloehr <jbernloehr@nvidia.com>
Cc: Leo Yan <leo.yan@linux.dev>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, John Garry <john.garry@linux.dev>,
 Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matt Ochs <mochs@nvidia.com>,
 Linux perf Profiling <linux-perf-users@vger.kernel.org>
References: <20261127123855.78212-1-jbernloehr@nvidia.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261127123855.78212-1-jbernloehr@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_050743_992652_554B5345 
X-CRM114-Status: GOOD (  32.67  )
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



On 27/11/2026 12:38, Jan Bernloehr wrote:
> perf script and perf report pass their --time ranges to the AUX trace
> decoders through itrace_synth_opts. Intel PT uses them to skip decoding
> outside the ranges, but Arm SPE ignores them: it synthesizes a sample
> for every record, only for the tool to drop the samples outside the
> ranges in its sample handler.
> 
> Check each record's timestamp against the ranges before synthesizing
> samples for it. The check runs after the --itrace period count and
> converts the record timestamp with tsc_to_perf_time(), as
> arm_spe_prep_sample() does for sample->time, so the tool receives the
> same samples as before. Without timestamps (timeless decoding) nothing
> changes.
> 
> Decoding still runs to the end of each queue rather than stopping at the
> first record past the last range: record timestamps do not always
> increase within a queue, and on Neoverse V2 traces such an early stop
> dropped samples that were inside the range.

Do you care that timestamps don't always increase? Seems like it would 
be acceptable to stop after the first timestamp that you see outside of 
the range, even if there are some edge cases where there may be an 
earlier one later.

Also can you elaborate why they don't always increase? I would have 
thought that they would always generally increase in SPE data, if not 
for some allowance for instruction re-ordering or something like that. 
But that would be tiny and not really relevant for this feature.

> 
> On 28 GB and 55 GB Neoverse V2 traces, perf script --itrace=i1i with
> --time=70%-95% goes from 212 s to 188 s and from 383 s to 339 s, and
> with --time=70%-70.01% from 101 s to 72 s and from 188 s to 131 s, with
> byte-identical output.
> 
> The code and this message were drafted with an AI coding assistant
> (Claude Opus 5.5).
> 
> Signed-off-by: Jan Bernloehr <jbernloehr@nvidia.com>
> ---
> Tested on GB200 (Neoverse V2) with two perf.data files (28 GB, 55 GB)
> recorded with
>    perf record -e 'arm_spe_0/branch_filter=1,event_filter=0x2,jitter=1,period=4096/u'
> and decoded with
>    perf script --itrace=i1i -F comm,tid,cpu,time,period,event,addr,ip,dso --no-demangle
> using perf-tools-next 29fd95dbd25 with and without this patch:
> 
>                            28 GB            55 GB
>    --time=70%-95%          212 s -> 188 s   383 s -> 339 s
>    --time=70%-70.01%       101 s ->  72 s   188 s -> 131 s
>    --itrace=i10i 70%-95%    84 s ->  81 s   150 s -> 147 s
> 
> Output was byte-identical to the unpatched perf in every case.
> 
> An earlier version also stopped decoding a queue at its first record past
> the last range. On the 55 GB trace that dropped 21% of the in-range
> samples, because some queues produced in-range records after a record
> stamped past the range, so this version decodes every queue to the end.
> 
>   tools/perf/util/arm-spe.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 8d95df23be6..bf1e824ea76 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -26,6 +26,7 @@
>   #include "symbol.h"
>   #include "thread.h"
>   #include "thread-stack.h"
> +#include "time-utils.h"
>   #include "tsc.h"
>   #include "tool.h"
>   #include "util/synthetic-events.h"
> @@ -93,6 +94,9 @@ struct arm_spe {
>   
>   	u64				kernel_start;
>   
> +	struct perf_time_interval	*ptime_range;
> +	int				range_num;
> +
>   	unsigned long			num_events;
>   	u8				use_ctx_pkt_for_pid;
>   
> @@ -1077,6 +1081,19 @@ arm_spe__synth_data_source(struct arm_spe_queue *speq,
>   	return data_src;
>   }
>   
> +/*
> + * Check a record against the --time ranges. Samples outside them would only
> + * be dropped by the tool, so do not synthesize them.
> + */
> +static bool arm_spe__skip_record(struct arm_spe *spe, u64 timestamp)
> +{
> +	if (!spe->range_num)
> +		return false;
> +
> +	return perf_time__ranges_skip_sample(spe->ptime_range, spe->range_num,
> +					     tsc_to_perf_time(timestamp, &spe->tc));
> +}
> +
>   static int arm_spe_sample(struct arm_spe_queue *speq)
>   {
>   	const struct arm_spe_record *record = &speq->decoder->record;
> @@ -1092,6 +1109,9 @@ static int arm_spe_sample(struct arm_spe_queue *speq)
>   		return 0;
>   	speq->sample_count = 0;
>   
> +	if (arm_spe__skip_record(spe, record->timestamp))
> +		return 0;
> +
>   	arm_spe__sample_flags(speq);
>   	data_src = arm_spe__synth_data_source(speq, record);
>   
> @@ -1255,6 +1275,17 @@ static int arm_spe_run_decoder(struct arm_spe_queue *speq, u64 *timestamp)
>   	return 0;
>   }
>   
> +static void arm_spe__setup_time_ranges(struct arm_spe *spe,
> +				       struct itrace_synth_opts *opts)
> +{
> +	/* Without timestamps, samples cannot be filtered by time */
> +	if (!opts || !opts->range_num || spe->timeless_decoding)
> +		return;
> +
> +	spe->ptime_range = opts->ptime_range;
> +	spe->range_num = opts->range_num;
> +}
> +
>   static int arm_spe__setup_queue(struct arm_spe *spe,
>   			       struct auxtrace_queue *queue,
>   			       unsigned int queue_nr)
> @@ -2055,6 +2086,8 @@ int arm_spe_process_auxtrace_info(union perf_event *event,
>   	 */
>   	spe->synth_opts.period = spe->synth_opts.period ?: 1;
>   
> +	arm_spe__setup_time_ranges(spe, session->itrace_synth_opts);
> +
>   	if (spe->synth_opts.period > 1)
>   		ui__warning("Arm SPE has a hardware-based sampling period.\n\n"
>   			    "--itrace periods > 1i downsample by an interval of n SPE samples rather than n instructions.\n");


