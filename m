Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541C860A263A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tV+Ce5QP;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tBR6b794
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=emRRxOo38GGoG0OqsYCSeZjP1qZaERfoyqyxbY6jVHU=; b=tV+Ce5QPPnew3X
	IMN5bUQJVK+RCOuYuxhqntbs2KrUTZ0oKIc3d/9f7YVZ2Dq/KwSfherOusyV99zrlncdK7NaXtiLf
	FSj0CzZrhG/a3Cy+GCLZzLyZyjqTqO5RA74yuJeVVy4s49RlaVM1MuqJHHk2pD66Y2IpyUcGTPqpE
	Pg+Y/Qo8feSRwcEsuT/knVLC0eCEsNvhY0eK9SoQmaFVABa2kFjgHo6qH5EITdaUjdfpi0axi67gQ
	uIBOelQgkMstuHv45hUqi1mpgr2ny6E5ZRozEIEVietgBEuUZbcQ0B4BLOr4gxgp16lO6py/YC9sP
	uZNb6BgmBCxD9f0N7mTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ4v-0000000FKZE-27vN;
	Fri, 20 Nov 2026 14:59:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ4h-0000000FKUU-1KpT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:58:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so5483785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 06:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795186729; x=1795791529; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=emRRxOo38GGoG0OqsYCSeZjP1qZaERfoyqyxbY6jVHU=;
        b=tBR6b794mA++5Wc7ALfqNw/rdMK5kHNpYu6oTTBWuMV0Gv+98HaB8mxWYITMcSMB+Z
         vB0WuA4ZqYjGb2MJSEepAjk9lfchpMj+IE6zLytnUjKVPwgbJTTNOy4MQnpsU1AznatU
         w3oXOxzoIOcbMHirWIN8ggCyWuNdOn756/6+Gb3FcRYqbGUZTlDFemsne93TP04KU77q
         nVtHv9pZsTIBRLMpzxbMkoQthmaBb5clUVwQTHlf+xNtOnhShxvvR3q7XLhof3QkG/Ws
         T6yLZk1goCOBIr9H8cY5MYzBo01y8QzlkIiE+bRAkJBCBZxWTkcf+Xx9QR93qthRKX3L
         +uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186729; x=1795791529;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emRRxOo38GGoG0OqsYCSeZjP1qZaERfoyqyxbY6jVHU=;
        b=SpzmcLZ0Z5BzIpCh5BUg1Apiyhw97IA7fDoe4HvWMfQ4u61VwHlWu0dDKK6Jskvdt7
         TbolmBvDSD7GIMsNU8Ee74xicZpH8u+s/vFHlFTbeTCsLIL1UVpzT1b08i2QiElSblfq
         +s9MkDnncX0TUdZjBCOdFl5cvlBeFmDg+bMRBfNiVhFN+s1YGWs9/e3OubpdPBZfJowp
         zUy5ejgg/iMZ+nCz4Vu0/U3qxu2Rs8iWuUAfVulZTZZxiU479t9iMY7+Bffej7ooobKA
         UTsHaRkdB8A5RDKStPABkST8EyPTtjdZ9Rnsi5j53fyoJRugNP6nsZyXkWFKUjHbrQRa
         LGVg==
X-Forwarded-Encrypted: i=1; AL+hErFex3JUAlOZgq3LifF/2YuGhsqgSiDJ4QS9VTrEzfwxveK/+Gcv+7Hj2d/46L74IvEiCTMM4fYEwnnHIjvhFoWG@lists.infradead.org
X-Gm-Message-State: APuU4Z+8SsAQgyuHNMzwaR4EtjfibXYJKpYpobPnQUiILaUMfgmFWcmu
	DEhmHLfxEuOnkmiQm5IhivxlEQvBZTsqOXcNZvyb3qmi1G5tmwtQeEpu1pp/cyoCVec=
X-Gm-Gg: AYBFou3bYKfEkiNCkUEbAzCie0fX+A+aeiMjpRaAhICR6C+RdzQ2RPUWvVcpbpXBJNO
	nn3dH4tH5O+H3VTy9f6YIHeTmZi64DiAGJLoFE5pOjMXDuwE9Kqm2s++1ahXZyEq5vRkHRipmor
	Uva+FiIFpi/Y1pLQTRYpcOK40MWUUWrF3lGc0SsdD1QoaGgqPowmoeK6m/iu4HYqlsFmWQKYlw2
	wgud9CsoC6/k5XPFKV7NBAqg8udJGH2E+0yu89QK0t675/snzwJ2OPUw85DPBY8BSTCg8vo1HRG
	L2S/+Eqee3iEeF31iwiu8+DOl9NeMlZLXdgQo8yJgoC1zpWHDTIhL5M5shqKc7wX/dO4volYubN
	ZN4BpA0tQgV7rZCx0Qov1OHVaimW1PzJET/myqJxlhPaUrwqK26Fbm5NFVnNsNJvLGgsH8GH+XT
	RvgKlJSFHUC15XbMzjeBKY3o930eouKZXyZcPU1e3dwKesCvO+2CQUBhydgv47N6kqm/Y10mLze
	2HtV5rdRmzWwEWn+l229wiEu+8ffvSD0YqJm28cx4K8Dc6I419HC1I0ZvCZv1aY7DuZluWrYD9e
	I3MJxThd/YLdCmsSp+2MVFGqT3IC5xxcqw==
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr71132445e9.12.1795186729437;
        Fri, 20 Nov 2026 06:58:49 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm120356755e9.5.2026.11.20.06.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 06:58:48 -0800 (PST)
Message-ID: <9366b008-37e3-483d-b85f-a850bad4253b@linaro.org>
Date: Fri, 20 Nov 2026 14:58:47 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/2] perf jevents: Fail the build on a key the tables
 may not carry
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Ian Rogers <irogers@google.com>, John Garry <john.garry@linux.dev>,
 linux-arm-kernel@lists.infradead.org,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-perf-users@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>
References: <20261120060931.711483-1-takano32@gmail.com>
 <20261120134252.1036963-1-takano32@gmail.com>
 <20261120134252.1036963-3-takano32@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261120134252.1036963-3-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_065851_438514_81E0DBC5 
X-CRM114-Status: GOOD (  28.74  )
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



On 20/11/2026 13:42, TAKANO Mitsuhiro wrote:
> jevents.py takes the fields it wants out of each JSON object by name and
> ignores the rest, so a key that is spelled differently is dropped without
> a word and the object is built without whatever that field held.
> 
> Compare the keys of each object with _valid_keys, the keys a table may
> carry, and fail on anything else.  The generator already names the file it
> was reading and the exception names the keys it did not expect, so the
> build stops with a message that says where to look.
> 
> Written with Hermes Agent, an LLM assistant; the author reviewed it and
> ran the generator on every arch directory, with and without a key the
> tables may not carry.
> 
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
>   tools/perf/pmu-events/jevents.py          | 24 +++++++++++
>   tools/perf/tests/shell/jevents_bad_key.sh | 52 +++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
>   create mode 100755 tools/perf/tests/shell/jevents_bad_key.sh
> 
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
> index 080e04b51b8c..1baeae76349f 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -63,6 +63,27 @@ _json_metric_attributes = [
>   # Attributes that are bools or enum int values, encoded as '0', '1',...
>   _json_enum_attributes = ['aggr_mode', 'deprecated', 'event_grouping', 'perpkg',
>                            'default_show_events']
> +# Keys a table under arch/ may carry.  jevents.py takes the fields it wants by
> +# name and drops the rest without a word, so a key that is spelled differently
> +# is only visible as a field that went missing; a table carrying anything else
> +# is an error.  The list holds the keys jevents.py reads, plus the ones the
> +# tables carry and it does not read: Counter, CountersNumFixed and
> +# CountersNumGeneric (read by nothing) and Experimental (read by metric.py).
> +_valid_keys: Set[str] = {
> +    'AggregationMode', 'AnyThread', 'ArchStdEvent', 'BriefDescription',
> +    'Compat', 'ConfigCode', 'Counter', 'CounterMask',
> +    'CountersNumFixed', 'CountersNumGeneric', 'Data_LA', 'DefaultMetricgroupName',
> +    'DefaultShowEvents', 'Deprecated', 'EdgeDetect', 'EnAllCores',
> +    'EnAllSlices', 'Errata', 'EventCode', 'EventidCode',
> +    'EventName', 'Experimental', 'ExtSel', 'FCMask',
> +    'Filter', 'Invert', 'LegacyCacheCode', 'LegacyConfigCode',
> +    'MetricConstraint', 'MetricExpr', 'MetricGroup', 'MetricgroupNoGroup',
> +    'MetricName', 'MetricThreshold', 'MSRIndex', 'MSRValue',
> +    'NodeType', 'PEBS', 'PerPkg', 'PortMask',
> +    'PublicDescription', 'RdWrMask', 'RetirementLatencyMax', 'RetirementLatencyMean',
> +    'RetirementLatencyMin', 'SampleAfterValue', 'ScaleUnit', 'SliceId',
> +    'ThreadMask', 'UMask', 'Unit',
> +}
>   
>   def file_name_to_table_name(prefix: str, parents: Sequence[str],
>                               dirname: str) -> str:
> @@ -196,6 +217,9 @@ class JsonEvent:
>     def __init__(self, jd: dict):
>       """Constructor passed the dictionary of parsed json values."""
>   
> +    if extra := set(jd) - _valid_keys:
> +      raise ValueError(f'Unknown keys: {sorted(extra)}')
> +
>       def llx(x: int) -> str:
>         """Convert an int to a string similar to a printf modifier of %#llx."""
>         return str(x) if x >= 0 and x < 10 else hex(x)
> diff --git a/tools/perf/tests/shell/jevents_bad_key.sh b/tools/perf/tests/shell/jevents_bad_key.sh
> new file mode 100755
> index 000000000000..6084205b5f4d
> --- /dev/null
> +++ b/tools/perf/tests/shell/jevents_bad_key.sh
> @@ -0,0 +1,52 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# Check jevents.py reports unknown keys as errors (no_mlock)
> +#
> +# A key that is spelled differently is dropped without a word, so jevents.py
> +# compares the keys of each object in a table against the keys a table may
> +# carry and fails on anything else.
> +
> +jevents=$(dirname "$0")/../../pmu-events/jevents.py
> +python=${PYTHON:-python3}
> +
> +# An installed perf has the test but not the generator, and a python that is
> +# not there or too old to run it is a skip, not a failure of the check.
> +[ -r "${jevents}" ] || exit 2
> +[ "$("${python}" -c 'import sys; print(sys.version_info >= (3, 9))' 2>/dev/null)" = True ] \
> +  || exit 2
> +
> +tmp=$(mktemp -d) || exit 2
> +trap 'rm -rf "${tmp}"' EXIT HUP INT TERM
> +tables="${tmp}/arch/x86/model"
> +mkdir -p "${tables}" "${tmp}/arch/common"
> +printf '[]\n' > "${tmp}/arch/common/empty.json"
> +printf 'Family-model,Version,Filename,EventType\nGenuineIntel-6-97,v1.0,model,core\n' \
> +  > "${tmp}/arch/x86/mapfile.csv"
> +printf '[{"EventName": "a", "NotAKey": "x"}]\n' > "${tables}/events.json"
> +
> +if "${python}" -B "${jevents}" x86 all "${tmp}/arch" \
> +    "${tmp}/pmu-events.c" "${tmp}/pmu-events-string.c" \
> +    > "${tmp}/out" 2> "${tmp}/err"; then
> +  echo "jevents.py accepted a key it does not read" >&2
> +  exit 1
> +fi
> +
> +# The generator says which file it was reading, and the exception says which
> +# key it did not expect.
> +grep -qF -- "Exception processing" "${tmp}/out" || {
> +  echo "jevents.py failed without naming the file" >&2
> +  cat "${tmp}/out" "${tmp}/err" >&2
> +  exit 1
> +}
> +grep -qF -- "${tables}/events.json" "${tmp}/out" || {
> +  echo "jevents.py failed without naming the path" >&2
> +  cat "${tmp}/out" "${tmp}/err" >&2
> +  exit 1
> +}
> +grep -qF -- "NotAKey" "${tmp}/err" || {
> +  echo "jevents.py failed without naming the key" >&2
> +  cat "${tmp}/out" "${tmp}/err" >&2
> +  exit 1
> +}
> +
> +exit 0

Reviewed-by: James Clark <james.clark@linaro.org>


