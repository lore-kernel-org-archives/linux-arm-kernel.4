Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51980606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OI7EptVD;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v92uKoHn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Cerw/Z7KIbXX4bOl2Vw1MF/BZKr852ZbBEpPnDE+6mw=; b=OI7EptVDjZHvX+
	sXqpodVXL5lVc/5qRFTvl4ycfvv2XsjaktdCAciJHrWzVy6tsI8ncip8NQ/1tDVoomGdpm2Cj5tmm
	adBf3J9tpTwf4F7sUK17rlDRytohbGK18IJzfGsDFoQeZdTVgDE3m6Nc6Ur5enuKTDmE5L+GANPQH
	GthTCA/lUoRpux+RxZZ3w6HBNRry5Z0Sci2v79eUZav8Mz/g/mpwqLhw7EuCvGTYhYwYjGHCYPnMr
	z7VkunZTajsWk0hOQbQqESizL2Swj4SWAUxwSTmub1/BwiNO9dPYfklgBc8Cpip4fJNJfr6IMfKvI
	K/gjvZ92oo1UVbq6enaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuQj-00000007O3r-3NtH;
	Tue, 24 Nov 2026 17:35:45 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuQf-00000007O2A-2jb0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:35:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so3435858f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541739; x=1796146539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cerw/Z7KIbXX4bOl2Vw1MF/BZKr852ZbBEpPnDE+6mw=;
        b=v92uKoHn3TF8Xa6V5xERann88NqL/fPNlHSoCQrEuEPcugBFCALRx/dWuRg2xyMZLv
         lvwHpGVbyCLimxgyct8su1nmIGmsuTV/gx+pt7gDww9zAVOdMWmI8aFWNpVP+KC9Wgjm
         TDNK6RbraG6tcDS89Ao4Ss7t3c9IrHGx5uTLT4uQspUdN/RXze+vUGY/WMESNlrWPhBP
         VYOileGHETjAhkhEIX2dBYJOiIBrBl45gr5mqvF/GTVPcmBmQuk2XoCynbWnZrF4oIrb
         hh6VtBMLme0oaDbKtXp47gA98G1o/n6grFhtJ+3D3gM3vw94E9ftB5X2jxa1rpbZlw8t
         yD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541739; x=1796146539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cerw/Z7KIbXX4bOl2Vw1MF/BZKr852ZbBEpPnDE+6mw=;
        b=rx35dJH7hYOB0F1gGd8AQByDUdB1JzZDWAVUswxvEOqgdmer4yYUzgZrsn4BpyWw5U
         8zr+yWGLXFLhqchpozW1v/4xELYfkMbdFSW0SZfE310xCpoe8GnW4A6XHKomgn95PWOv
         jdmFr09jLD4QqUqRKA/jYtyzbKmNQWRBVkDePmJ2CTRcllwAHFBoRAVQscZhDDCu1GzF
         LhPiXHjUxStw2VjXNGVsKiIkgvk1mbmb6jKphgyXW+MEnlykVHGQWAf0JS1ifyNOY41U
         AKaQvBz2ia/bLEeeWSwW4YxiPYbifRu0JuVxcfRTpYT+yiXQ4A5GUlIwoF9xOZCCMEPY
         aOvw==
X-Forwarded-Encrypted: i=1; AL+hErGsPmHkoSQJRjlNua47UvqB0kOhU2oR/DT2nnrLu59ImLC2QIAmN1rbiN2F50ApHeQ74/16Xnr8+7yrPbMY5/0r@lists.infradead.org
X-Gm-Message-State: APuU4Z9nxIxcgIL3DDxo1d1WBrkwWYHM8JcHYRJwXJlxWVItk3knidQM
	5RVCGyJhL/ciR7G491xeFrtph9VlPopRPWluj0lJPKFwF0XjSe5xoWMsssAwzgotaZk=
X-Gm-Gg: AZFdTZdMAFYyCGepjFj0gQAPL9mX768deBVYRAqYEi0rf8BfAhDrEPd6YNR+lEB2VXK
	3Ss3FV0z0Cb6hvJlcQTnu73lFie+yZc7+nbJ3hqkxhr5J5rEcpm+b2VNaFWcNWgIucwFTdGPmZW
	Tb/AhtOuyiBUkjIahbwtj2BJcL4UdpU7aPFf35x/brYXLgMmDco9mTp9naSxzD8jYm99JCs5Taq
	O21fWyu60CNaFJULCbgJESUj38PmatEPeMfhIuyq0XHlgDfFzYBpVRZHpNvL4Xo2WrR+BlsIfAP
	8LX05pKPoGOHrZvE7+rCuCR8zMBxieFl7IcyW3htyYyKSbnitlr9TA1SkRiWDqFnFbSsanNB3ST
	VAx/21zlcvHHE3Zxg35x82LriIqwhaK2HtPvsunFmOYFOlLqKCq6fOFS9vh+gNPcZ9Ulwah7dcT
	vK5kN8JV/YBjq3EHPfFk7wy3b9u7lscBCligDkLQ1RycwgwnjYtdHXoGy+RbGfcxp++Z4pjpJuh
	sLDftrDq0sXSdq+OV8xu2f0ufUBHcFzD8MumeY4+MA6NgaEPIqTmZ8G3IZFwVgps74M79QCnfQ6
	a1Ny2YM55thTWuzdNK6YehHNaqZuzsCUS2rKSrh/GzBzs4xtJE7gdYY=
X-Received: by 2002:a05:6000:990:b0:493:ec0:861c with SMTP id ffacd0b85a97d-4abb0c5d53fmr28875984f8f.16.1795541739288;
        Tue, 24 Nov 2026 09:35:39 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm28453844f8f.30.2026.11.24.09.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:35:38 -0800 (PST)
Message-ID: <fa4e19d5-2e66-4468-9860-19cd9f3ea8db@linaro.org>
Date: Tue, 24 Nov 2026 17:35:37 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/19] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org,
 John Garry <john.garry@linux.dev>, Leo Yan <leo.yan@linux.dev>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_093541_745939_1036C4E5 
X-CRM114-Status: GOOD (  29.81  )
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



On 05/11/2026 11:44, James Clark wrote:
> This series depends on:
> https://lore.kernel.org/linux-perf-users/20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com/
> 
> Fix a few issues with per-thread mode:
>    - On nVHE, everything looks like guest trace instead of host
>    - Tracing multiple threads didn't really work
> 
> After adding a tests for those, it turns out there were some snapshot
> bugs not picked up by the other snapshot tests. That showed that the
> different snapshot searches for Intel BTS and Arm SPE were inconsistent
> and I think all tracers can benefit from using the same pointer fixup
> logic, so that gets refactored into the common auxtrace.c. Then SPE can
> just share the Intel BTS search as it was obviously copied from it
> originally. IntelPT keeps the more advanced duplicate data search, but
> in the future that could probably be made the common one and all tracers
> would benefit from using it (except maybe BTS if it always has a very
> small buffer, but I doubt the overhead of the duplicate search would be
> an issue). For now this is more of a refactor rather than behavioral
> change so don't do that yet.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> Changes in v4:
> - Change test snapshot size to 128K for 64K machines
> - Put patchset depencency in cover letter text
> - Link to v3: https://patch.msgid.link/20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org
> 
> Changes in v3:
> - Keep the find_snapshot() callback instead of adding
>    snapshot_has_wrapped() and monotonic_snapshot_head boolean (Adrian)
> - Add auxtrace_record__default_find_snapshot() for the simple search for
>    BTS and SPE (Adrian)
> - Add auxtrace_record__snapshot_fixup() for any snapshot search
>    implementation to use to update the pointers (Adrian)

Hi Adrian,

Did you get a chance to check these changes? Sorry it took a while to 
send the V3 after your comments.

Thanks
James

> - Reword UINT64_MAX timestamp comment (Leo)
> - Fix disassembly test after rebasing onto exception sample fixes
> - Only take 'perf_guest' into account if there is no PIDFMT_CTXTID2
> - Improve decoding of old files by hard coding queue 0 for per-thread
> - Link to v2: https://patch.msgid.link/20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org
> 
> Changes in v2:
> - Remove stale "may be reset to -1 in per-thread mode" comment
> - Set CPU when queueing auxtrace fragments otherwise
>    auxtrace_queues__add_event() overwrites the queue's CPU
> - Link to v1: https://patch.msgid.link/20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org
> 
> ---
> James Clark (19):
>        perf cs-etm: Fix nVHE per-thread decoding
>        perf cs-etm: Warn for invalid timestamp option
>        perf cs-etm: Turn on context packet timestamps in per-thread mode
>        perf cs-etm: Use per-CPU queues for per-thread mode
>        perf test: cs-etm: Increase window size in disassembly test
>        perf cs-etm: Don't drop previous target for kernel samples
>        perf python: Expose sample instruction length
>        perf cs-etm: Use instruction length in disassembly script
>        perf cs-etm: Increase default timestamp generation period
>        perf auxtrace: Turn Intel BTS snapshot search into a generic one
>        perf arm-spe: Use generic snapshot search
>        perf auxtrace: intel-pt: Use common snapshot pointer fixup
>        perf cs-etm: Queue partial AUX records
>        perf cs-etm: Don't print missing buffers in snapshot mode
>        perf auxtrace: cs-etm: Capture wrapped snapshots
>        perf test: Allow infinite named_thread loops
>        perf test: cs-etm: Add test for per-thread mode
>        perf test: cs-etm: Test multiple per-thread threads
>        perf test: cs-etm: Increase snapshot size
> 
>   tools/perf/Documentation/perf-test.txt             |   2 +-
>   tools/perf/arch/arm/util/cs-etm.c                  |  34 ++++-
>   tools/perf/arch/arm64/util/arm-spe.c               | 147 +--------------------
>   tools/perf/arch/x86/util/intel-bts.c               | 115 +---------------
>   tools/perf/arch/x86/util/intel-pt.c                |  21 +--
>   tools/perf/python/arm-cs-trace-disasm.py           |  22 +--
>   tools/perf/python/perf.pyi                         |   1 +
>   .../perf/tests/shell/coresight/per-thread-multi.sh |  76 +++++++++++
>   tools/perf/tests/shell/coresight/per-thread.sh     |  48 +++++++
>   .../perf/tests/shell/coresight/raw_dump_stress.sh  |   5 -
>   .../shell/coresight/test_arm_coresight_disasm.sh   |   8 +-
>   tools/perf/tests/workloads/named_threads.c         |   7 +-
>   tools/perf/util/auxtrace.c                         | 145 +++++++++++++++++++-
>   tools/perf/util/auxtrace.h                         |  18 +++
>   tools/perf/util/cs-etm.c                           | 113 +++++++++++-----
>   tools/perf/util/python.c                           |   1 +
>   16 files changed, 420 insertions(+), 343 deletions(-)
> ---
> base-commit: 28ef93607ad52acc8f8be25199711153ba11a0c2
> change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e
> prerequisite-message-id: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
> prerequisite-patch-id: 4ef889ad751e344ae47c1d75a2a2e6cb2eadf6e1
> prerequisite-patch-id: 636b39730334cbc5a76642c070e704ffe178e7be
> prerequisite-patch-id: fb58f6daebdf5a194f8aa56ccc4022f932a5a6e5
> prerequisite-patch-id: d240c10c6824f8ae6c3f10a1da01226a957f05fb
> prerequisite-patch-id: 17b291db261e32dcb0d6f1ab2ed0adb7e0411813
> prerequisite-patch-id: 45ae1d523c9e5c8c573309f1dab107a598f3d4f8
> prerequisite-patch-id: 39a3eb25b3a45f4481760c25fa270773bcfd94f5
> prerequisite-patch-id: 5723a15636c2a28ec40eb6b5c9836d162e971786
> prerequisite-patch-id: d18054b586fc38bc832ead185e8c1fbb0ce46f39
> prerequisite-patch-id: 6735b192189d7945613458abce3da871cb79b35d
> prerequisite-patch-id: 387cb2c6181bef8f45a8fb167e8ef86e4a54ff69
> prerequisite-patch-id: 50243a8d1739141aa24aa371a8452d4d2d078a99
> prerequisite-patch-id: 2ae6f1e7707ba0c71a0678331b02d738fb25cb3c
> prerequisite-patch-id: 1fa0a90cfbc904c4429c1427409125ac44b27aed
> 
> Best regards,
> --
> James Clark <james.clark@linaro.org>
> 


