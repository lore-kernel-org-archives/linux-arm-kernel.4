Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3B0606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q2UjgHAb;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bx0zyrgg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jZUvrbhbcZvb+yNyUGJEDBN+jZxprMUpQ75mT/ONYDg=; b=q2UjgHAbLWWe00
	8nLElv7W5aA13ot7LQnWe1+ByGqtC+lTQcg3fidvX54WzvbhsUiRa9mLgryDc5c+LEuoP6vyHw+R1
	JQZ9r45YUSAlYSrSPoSqfIfqTXovZX5MYh49kO/GD/HXqNtFnnq4+Q3jZZIWcEpoZ3hJupTAixOsv
	NoIOXqOaWNvYh3PwbfCjfv2EVkdBZccRp6o0OrUNGbgVrojBRwlual9huDcBTs4pmY2efqmXtofQ2
	0ITMHFAO7SS93vXwXQfN+B67X0p8fZjB61lLn5MssjHkckkSgaMhaas2IgCATQVyXnZC+Qn4i2Gvk
	QoU7+PibfJjwsatWjw4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTibd-00000009XZ2-2Vxr;
	Wed, 18 Nov 2026 16:33:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTib7-00000009XPN-3ZDu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:33:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so13055335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019603; x=1795624403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZUvrbhbcZvb+yNyUGJEDBN+jZxprMUpQ75mT/ONYDg=;
        b=bx0zyrggrGxtd00Ttlvrpl1Os0qvquVEvGeE6o46QmDAc7ndBD3t12GFg7ECEfX/0z
         z+otmVjIQGEmj4tGERpWNl+bKlCRCYLYZM52V/matckp0LConKM4CzV+LS9rrbvYhGNp
         AKxwbyfZLxQAFTGEhb+aCRjY6Z+2AC1dw5I6bAsoihZGNyqMJy9WbnU7Gyj03i5bLr3K
         to3FW/dgmtOwAbBPEtVZn0v4+BaQkQxzDuZskjDipphZnCTKxN65YczO7OyNXaQ822k0
         6OZTCCij1WsIefJcGxV1IKHLUieHGXUQ3Uv7uwqJsh0rQj8wAapZ5NzRwKX2ijc+hc4q
         t4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019603; x=1795624403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZUvrbhbcZvb+yNyUGJEDBN+jZxprMUpQ75mT/ONYDg=;
        b=AfjjkQLOGlHwlkvPehFza0YhomRfZoG/X/EL0jLrTt+1lymD+rtrjalFPV2tnL3zHW
         mSY8e3VI8HbSKCQ1zAD2XKH4XnL2lBmKp6aRTqeQQ7MTY1E67a7flcI6jB1bb3nunfFL
         oYTegG3dByYx0LWq/I0B5T+jyA6XV1BoMYNd0Yt1DbUQf054anuROobCQHuEWB60BmFM
         CpqEBVpVkYRBtweaTRh6MxQt6c+RHkdpmSerEcWCoHhRjCoEb94ZvuLTRmQ+bX+bI1Cu
         +sFbcckASF5vOIohW5JU+TL90OVJ0sCGyH52uTQpvx24o/VKnW7UYB4gIEWuiplslDr5
         Zm1w==
X-Forwarded-Encrypted: i=1; AL+hErEdggJPKXpVY6hU4Jn9Mcue1b2z2nZlHPdCOfwGwMwZlBKCK3H/9ah/JW7c2TxtFGxw8UR2u/MduOy+yKRiLTtA@lists.infradead.org
X-Gm-Message-State: APuU4Z9u0OGlZLtFElpe+XKBfzKgxC/ePq19BxenWU4/ww3eeHvI62zL
	5tCAk3+ncBMyXCEyfYxNRlavNsNvGe6Sq8CjPzKVeE8dOSwdKcgTbwwESAcgV2Dh9OU=
X-Gm-Gg: AYBFou35BnU7vclqbnMIWWwLigFjUKGvlJJHGf8WZ2Orq2Z+Y/a+OfQV6GEFz+58xT1
	DWWbO81nf2DdNEIAF9uAEAkhIhq3GkrlaRFDY1NiSylN92LjKvKmuXuDcQH+oJqfi3kpP9X6uoG
	kgYvK/Jh8h74cmUZeLYhlrlhsmfMxnkV5PX/td0vL/mUHE8b+4prN3aaOCGp0tuNnTR5eFxCMF8
	W/j/Vt2rVSVvnK2lw+9SjL/2b9ySoOKralLzvN2RV8u0aw7gpMa/d30Nf8d7cv/Y5A6AxP0+SS+
	L+W7US0dNYyFJwV/1ewHZF8OUq58MaxKzKkXYKuE+3ocks7CEMees6jknWZCqHoZcmnH6NfUGOI
	bRmxxgtS/4o+izgPG9YiG2aWpWFyQKWZm1ebcHJz5w9D0Cc8AcD5cuO6FL+nkBSQB5GE9YKnBBb
	La8rdWvsY1yaOnD6iMg+7A40OrmgOgHu2fIopvALyG3HZzJOFqjJ6pT4IFhxFQpDE1eTa8yK7LM
	4+XJ5ZUrY8ZaB22eBK2YLKsTlgP1lHXVxLqD7A2y7u913Gn0iPfrgwmkXQG1riJqBI4JAhTvRtc
	G0DSSPnJUGs+r2LcX8/sHUuetnDKvc2XDg==
X-Received: by 2002:a05:600c:19d2:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb7d5d6636mr63465845e9.1.1795019603103;
        Wed, 18 Nov 2026 08:33:23 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm167009625e9.4.2026.11.18.08.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:33:22 -0800 (PST)
Message-ID: <c9a9e247-265d-476d-abc1-308fbe1d4a2b@linaro.org>
Date: Wed, 18 Nov 2026 16:33:21 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/34] perf cs-etm: JIT decoding support
To: Linux perf Profiling <linux-perf-users@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>,
 Suyash Mahar <smahar@meta.com>
References: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_083326_509802_573EF737 
X-CRM114-Status: GOOD (  28.46  )
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



On 18/11/2026 16:29, James Clark wrote:
> Restructure the Coresight decoder to decode trace in order with the Perf
> events. This improves decoding accuracy all workloads, but particularly
> with JIT code when instructions at the same addresses are re-written.
> 
> The resulting decode loop structure is simplified to
> cs_etm__insert_heap() and cs_etm__pop_heap(), which work in the same way
> for all of the timeless/per-thread/per-cpu etc modes.
> 
> For every Perf event, we pop from the heap while the packet's timestamps
> are before the current Perf event. When a packet is popped, the next
> packet is decoded and re-inserted.
> 
> The same path works for timeless mode because we can just assign the
> timestamp of the AUX record to all trace from that buffer. This also
> improves timeless decoding accuracy because now we don't use the
> timestamp from the very last AUX record for all samples.
> 
> In Coresight trace, timestamps come after their associated atoms and
> Perf uses a single decoder for both searching forwards for a timestamp
> and decoding. It does this by caching decoded packets into
> packet_buffer[] and replaying them once a timestamp is received.
> Unfortunately this does't work for strict ordering with Perf events
> because while searching for the timestamp the decoder will decode trace
> using previously seen mmap which is incorrect.
> 
> To fix this, add a "packet only" decoder for each queue. This is used
> for searching for the next timestamp after a discontinuity and not for
> decoding trace. Once it's found, the backend re-orders that timestamp
> and the previous packet before delivering them to the frontend so that
> we can be at the correct Perf event before processing context packets or
> ranges. Excluding the tests, this patchset results in similar total
> lines of code but if we updated OpenCSD to return timestamps and
> discontinuities in the correct order, then it would be a significant
> reduction in code and complexity.
> 
> This series depends on https://lore.kernel.org/linux-perf-users/20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org/
> 

Assisted by various Claude and Codex agents.

> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> James Clark (34):
>        perf jit: Support JITDUMP_USE_ARCH_TIMESTAMP on arm64
>        perf jit: Add name of clock in error message
>        perf jit: Add address ranges to DWARF compilation units
>        perf libdw: Don't look up the module by ELF address
>        perf cs-etm: Use the exception level to tell kernel from user
>        perf cs-etm: Don't read past the end of the map
>        perf build-id: Cache the vDSO in build ID mmap mode
>        perf cs-etm: arm-spe: Use arch timestamp in HW tracers
>        perf cs-etm: arm-spe: Report error if default clock isn't used
>        perf cs-etm: Remove old pipe mode support
>        perf cs-etm: Track threads in timeless mode
>        perf cs-etm: Track sched out events
>        perf cs-etm: Handle PERF_RECORD_SWITCH events
>        perf cs-etm: Always enable Perf event timestamps
>        perf cs-etm: Use time from Perf samples
>        perf cs-etm: Don't buffer non-timestamped packets
>        perf cs-etm: Decode in order of Perf samples
>        perf cs-etm: Don't special case per-thread mode
>        perf cs-etm: Decode one packet at a time and don't estimate timestamps
>        perf cs-etm: Remove the decoded packet ring buffer
>        perf cs-etm: Fold packet state into the trace ID queue
>        perf cs-etm: Rename trace ID queues to trace ID contexts
>        perf cs-etm: Rename tidq variables to tidc
>        perf cs-etm: Share the thread ctxt between frontend and backend
>        perf cs-etm: Consume each OpenCSD packet immediately
>        perf cs-etm: Split base and packet decoder state
>        perf cs-etm: Add packet-only timestamp decoder ops
>        perf cs-etm: Create timestamp decoders
>        perf cs-etm: Find timestamps by searching ahead
>        perf cs-etm: Invalidate OpenCSD's cache on MMAPs
>        perf test cs-etm: Add a Java JIT source-line test
>        perf test cs-etm: Test trace is ordered with context switch records
>        perf test cs-etm: Test decoding of kernel modules
>        perf test cs-etm: Add an HHVM JIT call stack test
> 
>   tools/perf/Makefile.perf                           |    4 +-
>   tools/perf/arch/arm/util/cs-etm.c                  |   21 +-
>   tools/perf/arch/arm64/util/arm-spe.c               |   11 +
>   tools/perf/jvmti/jvmti_agent.c                     |    5 +
>   tools/perf/tests/genelf.c                          |   70 +-
>   .../tests/shell/coresight/context_switch_thread.sh |   20 +-
>   tools/perf/tests/shell/coresight/hhvm-jit.sh       |   89 ++
>   tools/perf/tests/shell/coresight/java-jit.sh       |   65 +
>   tools/perf/tests/shell/coresight/kernel_module.sh  |   54 +
>   tools/perf/tests/shell/coresight/lib/PerfJit.java  |   82 ++
>   tools/perf/tests/shell/coresight/per-thread.sh     |   45 +-
>   tools/perf/tests/workloads/jitdump.c               |    7 +-
>   tools/perf/util/auxtrace.h                         |    2 +
>   tools/perf/util/build-id.c                         |   12 +
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.c    |  790 ++++++----
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.h    |   28 +-
>   tools/perf/util/cs-etm.c                           | 1515 ++++++++------------
>   tools/perf/util/cs-etm.h                           |   56 +-
>   tools/perf/util/genelf.c                           |    2 +-
>   tools/perf/util/genelf.h                           |    3 +-
>   tools/perf/util/genelf_debug.c                     |   22 +-
>   tools/perf/util/jitdump.c                          |    2 +-
>   tools/perf/util/libdw.c                            |   16 +-
>   23 files changed, 1643 insertions(+), 1278 deletions(-)
> ---
> base-commit: b7ff10b9ddec8da75304c40fe4abf1ee4f9f0a43
> change-id: 20260824-james-coresight-jit-250f19309e35
> prerequisite-message-id: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
> prerequisite-patch-id: 9c49b9ffb75309e9187eb2e3ef84026118fcfdb5
> prerequisite-patch-id: 4ce0ba0ab1302c9043f0d0734d9cf6a35298bc47
> prerequisite-patch-id: 5e69770fbaf94296da5c474ce09539a1993bc61e
> prerequisite-patch-id: 41d797af2aba7e97ff4435ae2659629e026d36ec
> prerequisite-patch-id: d5f67b3b704f4f4b3d9e39c4299d13a086b29363
> prerequisite-patch-id: a99348cc2065af31840f652286f840f23395892f
> prerequisite-patch-id: aa90408e69dedf9e68d7158f2499bd9fbc7b0b40
> prerequisite-patch-id: cd31a650f8dd3e7a9795fa641eee2415b126ad29
> prerequisite-patch-id: 922a7fe2937a575beb8d0e7777fd869a11023eb2
> prerequisite-patch-id: b0436630e22fd92803e277cd08d782c50f135be6
> prerequisite-patch-id: e136ff402ddf5121c63c1393b7fc00a826f60a69
> prerequisite-patch-id: 8a2674fa45e40848742e8b8472003e2b9706211d
> prerequisite-patch-id: df905386a100ac4b8b047328de08da86b3adf241
> prerequisite-patch-id: 44ee88eeafd54c0148ed2332dc5e33f1ba6dfce4
> prerequisite-patch-id: b9622164f99682ca6b813b9d38ced3e95170653e
> prerequisite-patch-id: 2f22df1738caf5af3a631851d8a57fc3bfea7742
> prerequisite-patch-id: afe679ea285ddc6cd281f697ce504b7a18888999
> prerequisite-patch-id: f507254858995051e8e1b96fb9fd95506228c5e6
> prerequisite-patch-id: 6fe822580ea330633f8a23260aa7b2c7de834ab3
> 
> Best regards,
> --
> James Clark <james.clark@linaro.org>
> 


