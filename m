Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87447606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wMU+5UIy;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C6wsU8IG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+90+pqil6CBAVbA79RRMMCs5y0fU+WuyAvov2TcftGQ=; b=wMU+5UIy4AThh4
	eTG5xKUCuWjSy8Osr4cBw4wJx0Yu4YyYLklF6uPUAJDHlZjFGjnKERnAU0lX6ajXiDcAmmKJqPNeB
	EIb9UqRaigmrfLgoR067B2gx4nV+MqTHgnst5HaBAtoySys3+3yWDiAy4jrXcYokxMKzezMROTGth
	ErbPomBHq7XN3H43+J1uAHPRIM1qGgY3YJG5BU5nLw7We4UJSEgmqLwcI1DdGHY8YZ+0wHGZkcSh6
	4JbJZNRPAqtni2Pxz/E0MfMQW/K7/WR5MI9GSep6+7wJC4CYsGRj+C8Cq24ct8VL8h0D6hI5dhZlv
	JXRjH45G6/kGfNdauz6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULWL-0000000EZG9-2gV8;
	Fri, 20 Nov 2026 10:07:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULWH-0000000EZFR-2I4a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:07:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so5794115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795169218; x=1795774018; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+90+pqil6CBAVbA79RRMMCs5y0fU+WuyAvov2TcftGQ=;
        b=C6wsU8IGG+ievhs6Kl4jBdOhUB2cFZ0XYg7OBXol2l2/i6WibEIqL0K2f0w3+Sz2bT
         X9GVGtR0ivGwecRTK3DSSJGnWeteU2sr1kU2MQBSnDitXcyI30A6NlqFunXs1ayxqCQw
         HBMgw8uKD+8Ni95bOlNh1ARzEPGJcaNZIFVf8tykADsilAYn+vNs4mhbmO+DN/uhbA66
         RTB31iGWZDwHz4JFr9RVO6jQQ4mCKNhbCqckvVPHKacFTsNeT5nuxZd57xydZnVMlY6H
         RENOUsdWrTNvcei1mEx9/F4d97EceIsGr43eLswd7mkRGTopowAvGOw3ekwOvdAF8qAK
         Jyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169218; x=1795774018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+90+pqil6CBAVbA79RRMMCs5y0fU+WuyAvov2TcftGQ=;
        b=fhsmWnOlxPAhJ0komzhFH92cWhVqe4KpFqJT4JyO0W/2Sp3ccdPJ75/+dq3U/CNFXf
         xhDe4aih8dpMSp4B84kVS5HLoR1LmeACK7oqK0++TNKmjfo1uCuKUATGV9mAGiYIfSBF
         ptfTxhTjdMVa5qrSPPeEztOnmp6G3X0YHG9pDJKyln8OLPUyLzKetm6b7CqfcqlL3XkO
         mv2x3d7TRCVb+cFoB1hequQ2MdIKCQ1xUIJb903F7nOmgKiU21jYAyCRmK+/VXIEGnpP
         oDhjruTFXBw77z9bJ6z5iMFJsZ9TLknfpu2H7KwiiNv2HhYjMvRMcdx7IRgyd9sSth+S
         l9ew==
X-Forwarded-Encrypted: i=1; AL+hErEr3WRaNlu+b5LVB99m8FH1IxZo1GOomzR7h9pGbg6ln3yZTEtyZxf3FquC7KStM0Ar+BtMtPjjoWXZcVG2cHBP@lists.infradead.org
X-Gm-Message-State: APuU4Z89yOYV3iVfm8+8Jm4slyyCGDbP45XD8+SSNS4E+Ri0YO2AxlAn
	E3MuFvTHtJM/c6fF9z6+74LSW4sp3/QV9Se0bR8hdAUviPiIeJqisCRxTLbCpZ4QU/0=
X-Gm-Gg: AYBFou2nZFxYTtFUMbEHTp3rHT6CbMcuAJnvZRcFjIWZMFc4JPHDQZ/YBpK+Q4SghUt
	0WfQHO1ztCbT+lnVv8CiA+oM+YHmDDbHy3WzWNJ7aNOI1fcCPmcTW4bbuEYQAjRf3Xc+tRn5H4l
	R2f23zVepyT3Ow5r85F8thsFC0nOLvAXacjcqwHiqesMx3yEgnLR5o5ftI8sW/ZYu8eLMHgnWiV
	yJ6ua+X0RFHa6vRROhNCl+my6v+/9AMNxc644tGEBbThIEgpnldAeRLfDXm8L8zgEifLwr9CvJR
	NZ5sQmXJfnhvfTvomgpYGiV87qlDxC4Bakq1Txt/79ky5yTvweVrkgFJBwY3kCxc5ME2uDYApFG
	mexq6oIPwXaeMC3ju/5VqgHTdizCfsOco1trF4YmP059e77Hx5rrkjQts5WeDkr2R8o/UMnO44N
	h4tTC9cCZaUDCHTTgP+N/u/7RGRME/x42C1cGHf1TMwbJeg5K9MrxLEppucs5G5qNwWZBtPsxet
	edPE9LTHT83Hz8z3NFEVhWZKlguqd1/7kTLiox/JjsLYw3Dh0fnkiqo+AZBhc8XjCCySCLj4eJN
	Mfsa3Hl8VGyW+1370EXKRJjDXEGqFypCuQ==
X-Received: by 2002:a05:600c:c4a2:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4bb88807d87mr58234305e9.7.1795169217686;
        Fri, 20 Nov 2026 02:06:57 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm20236705e9.4.2026.11.20.02.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 02:06:57 -0800 (PST)
Message-ID: <4c59af55-230f-4fd5-980e-91b953a1709a@linaro.org>
Date: Fri, 20 Nov 2026 10:06:56 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/2] perf jevents: Fail the build on a key the tables
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
References: <20261113032927.634183-1-takano32@gmail.com>
 <20261120060931.711483-1-takano32@gmail.com>
 <20261120060931.711483-3-takano32@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261120060931.711483-3-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_020701_880238_C55E942E 
X-CRM114-Status: GOOD (  35.51  )
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



On 20/11/2026 06:09, TAKANO Mitsuhiro wrote:
> jevents.py takes the fields it wants out of each JSON object by name and
> ignores the rest, so a key that is spelled differently is dropped without
> a word and the object is built without whatever that field held.
> 
> Compare the keys of each object with _valid_keys, the keys a table may
> carry, and fail on anything else.  The error is one line naming the file
> and the key:
> 
>    jevents.py: <path>: unknown key(s): ['BriefDescript6ion']
> 
> Written with Hermes Agent, an LLM assistant; the author reviewed it and
> ran the generator on every arch directory, with and without a key the
> tables may not carry.
> 
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
>   tools/perf/pmu-events/jevents.py          | 70 ++++++++++++++++++-----
>   tools/perf/tests/shell/jevents_bad_key.sh | 43 ++++++++++++++
>   2 files changed, 98 insertions(+), 15 deletions(-)
>   create mode 100755 tools/perf/tests/shell/jevents_bad_key.sh
> 
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
> index 080e04b51b8c..65e51dafd42b 100755
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
> +      raise ValueError(f'unknown key(s): {sorted(extra)}')
> +

All you need is this raise, you don't need any of the other try catch 
changes. It already prints the filename, a little bit of stack and then 
the missing key as the last line:

   Exception processing pmu-events/arch/x86/amdzen1/core.json

   ...

   ValueError: Unknown keys ['EvendtName'] ...

It's perfectly legible as an error as it is and not worth the churn and 
extra noise in the code.

>       def llx(x: int) -> str:
>         """Convert an int to a string similar to a printf modifier of %#llx."""
>         return str(x) if x >= 0 and x < 10 else hex(x)
> @@ -459,6 +483,8 @@ def _read_json_events_impl(path: str, topic: str) -> Sequence[JsonEvent]:
>     try:
>       with open(path, encoding='utf-8') as f:
>         events = json.load(f, object_hook=JsonEvent)
> +  except ValueError as exc:
> +    raise ValueError(f'{path}: {exc}') from exc
>     except BaseException:
>       print(f"Exception processing {path}")
>       raise
> @@ -492,6 +518,8 @@ def preprocess_arch_std_files(archpath: str) -> None:
>             _arch_std_events[event.name.lower()] = event
>           if event.metric_name:
>             _arch_std_events[event.metric_name.lower()] = event
> +    except ValueError:
> +        raise
>       except Exception as e:
>           raise RuntimeError(f'Failure processing \'{item.name}\' in \'{archpath}\'') from e
>   
> @@ -643,7 +671,10 @@ def preprocess_one_file(parents: Sequence[str], item: os.DirEntry) -> None:
>     assert _bcs is not None
>     if item.name.endswith('metricgroups.json'):
>       with open(item.path, encoding='utf-8') as f:
> -      metricgroup_descriptions = json.load(f)
> +      try:
> +        metricgroup_descriptions = json.load(f)
> +      except ValueError as exc:
> +        raise ValueError(f'{item.path}: {exc}') from exc
>       for mgroup in metricgroup_descriptions:
>         assert len(mgroup) > 1, parents
>         description = f"{metricgroup_descriptions[mgroup]}\\000"
> @@ -1473,6 +1504,8 @@ def main() -> None:
>               continue
>         try:
>           action(parents, item)
> +      except ValueError:
> +        raise
>         except Exception as e:
>           raise RuntimeError(f'Action failure for \'{item.name}\' in {parents}') from e
>         if item.is_dir():
> @@ -1536,20 +1569,27 @@ struct pmu_table_entry {
>       if item.is_file() and item.name.endswith('.json') and not item.name.endswith('metricgroups.json'):
>         tasks.append((item.path, get_topic(item.name)))
>   
> -  for arch in archs:
> -    arch_path = f'{_args.starting_dir}/{arch}'
> -    preprocess_arch_std_files(arch_path)
> -    ftw(arch_path, [], collect_json)
> -
> -  with concurrent.futures.ProcessPoolExecutor(max_workers=_parallel_worker_count(len(tasks)),
> -                                              initializer=_init_worker,
> -                                              initargs=(_arch_std_events,)) as executor:
> -    for path, topic, events in executor.map(_parallel_read_json_events, tasks):
> -      _json_cache[(path, topic)] = events
> -
> -  for arch in archs:
> -    arch_path = f'{_args.starting_dir}/{arch}'
> -    ftw(arch_path, [], preprocess_one_file)
> +  try:
> +    for arch in archs:
> +      arch_path = f'{_args.starting_dir}/{arch}'
> +      preprocess_arch_std_files(arch_path)
> +      ftw(arch_path, [], collect_json)
> +
> +    with concurrent.futures.ProcessPoolExecutor(max_workers=_parallel_worker_count(len(tasks)),
> +                                                initializer=_init_worker,
> +                                                initargs=(_arch_std_events,)) as executor:
> +      for path, topic, events in executor.map(_parallel_read_json_events, tasks):
> +        _json_cache[(path, topic)] = events
> +
> +    for arch in archs:
> +      arch_path = f'{_args.starting_dir}/{arch}'
> +      ftw(arch_path, [], preprocess_one_file)
> +  except ValueError as exc:
> +    # A worker's traceback is three levels of ProcessPoolExecutor noise around
> +    # the one line that matters, so say it here and stop.  make deletes the
> +    # target it failed to build (.DELETE_ON_ERROR), so the next run reads the
> +    # JSON again rather than a half-written table.
> +    sys.exit(f'jevents.py: {exc}')
>   
>     assert _bcs is not None
>     _bcs.compute()
> diff --git a/tools/perf/tests/shell/jevents_bad_key.sh b/tools/perf/tests/shell/jevents_bad_key.sh
> new file mode 100755
> index 000000000000..7848e60b8b4a
> --- /dev/null
> +++ b/tools/perf/tests/shell/jevents_bad_key.sh
> @@ -0,0 +1,43 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# Check jevents.py reports unknown keys as errors (no_mlock)
> +#
> +# A key that is spelled differently is dropped without a word, so jevents.py
> +# compares the keys of each object in a table against the keys it reads and
> +# fails on anything else.
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
> +    "${tmp}/pmu-events.c" "${tmp}/pmu-events-string.c" 2> "${tmp}/err"; then
> +  echo "jevents.py accepted a key it does not read" >&2
> +  exit 1
> +fi
> +grep -qF -- "NotAKey" "${tmp}/err" || {
> +  echo "jevents.py failed without naming the key" >&2
> +  cat "${tmp}/err" >&2
> +  exit 1
> +}
> +grep -qF -- "${tables}/events.json" "${tmp}/err" || {
> +  echo "jevents.py failed without naming the file" >&2
> +  cat "${tmp}/err" >&2
> +  exit 1
> +}
> +
> +exit 0


