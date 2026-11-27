Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501DC606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=21mfVZ94;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hz4gDa8q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SrR+taCSYKOy0V34lVNOUOBJDJI1/m+bArOv03O8lxI=; b=21mfVZ94g5UROI
	bjtGs6wd06MK41TKoD4NJ1AQUgQoiLdTb8SJpipvme+QjHRWvkfLogMxbzpXupRbzydaxJPPgdzkj
	8MH6+3qyGa6gjCHMQS0oVpLssUt7AdzbaKZnj9hQS8RUhKrKUILCKi/BQjapnE4mTuz1lsR/Zsb4B
	JW/H0Yk/8W3evHMbxmK7gsbLCI3nwEod97AqFngIRXuJxlSrsxC5keje6uhQ4NOoyytFlcBVnotKb
	H6RF57oEHpgB8NjWBzviN1LTYx54TKTiAYfoIDYZecYKjqD3DXIjNSWl/jC51t+FkhX9whaD47nuL
	LhuYp+DekoGeAiXvvW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtdq-0000000FiP8-2jLo;
	Fri, 27 Nov 2026 10:57:22 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtdV-0000000FiH3-3Lkc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:57:03 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-497614c95f0so4533168f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795777020; x=1796381820; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrR+taCSYKOy0V34lVNOUOBJDJI1/m+bArOv03O8lxI=;
        b=Hz4gDa8q90Wqm/e1FKbdigWa8I++39vN9BxOu8RMb8RLulwsedF1L4rFEASS/ce/AX
         GQSmMpu65QVf5cUn41eT8SNNA7hHRJudPSEr5hibkh2p6j6cRBgX2k8Pg8NqIfYt5ISH
         7Z2t9JaEp23VmIr1WlXxfe+bYVH0FJ5DkNN2wQBZUFx08jiq9cEWjWqRGGnWUVRlMzkc
         upAortpRn61FwKKomyEnzf4MpDMpzRzYX9UTEnQcRBWHNUF2XXB9C0HYHOHoLKiP4nRq
         jA10jr2ZwhFXUWMVzzh8z/43kXUGvKZEj2OEUBGFBxCgoXNzYBwivqnqwCJaJgER3yB4
         zKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777020; x=1796381820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrR+taCSYKOy0V34lVNOUOBJDJI1/m+bArOv03O8lxI=;
        b=Z8ea3DP/APyk2KdES4qfnIWZv18IMnOPkb2sA9ygMoRQ3Fzj42AovoojiHyOfmV19G
         MCMol7oo/aY0ojbta3aDX1REhhd7ES/0bEARHxK3zaYTdf78CwvbIbNqj7iqhaEggP8T
         Y+vvPuWtonYPwNYtnDkbsvQGCKsZA2HH+hWSjDsz2MLx8kfxZxfuoGJ4VIvqGr1SGZXC
         mEu6JHRtJkULTT2SS4AayyulMu2tAz2l80k82MHYfwReyXU8pNBB5BDr66n3JK9LamoW
         fEMnwF79y6H+N10vYW2WRTaHRN/WhRrlnGXyVgDwtYSeVZleaiyqnd1ROpDjfKWO4dBy
         Edxg==
X-Forwarded-Encrypted: i=1; AL+hErFVRXWNMY+fDhm1RIf/cY8SjxpZnqbdZrzgG0fZUwkeLRQRnpMIxB3UZv4wU3SozglmRy/nwb5DRW+uh+NEYmt8@lists.infradead.org
X-Gm-Message-State: APuU4Z/l689opSi9Aq1QmelIV3ofAyEZWlv0+qJg2B2ivJ2BPWbHnO6v
	J1kv+ImO23Qi9pfjzaEc4jBnWsaKj63qjP0CwCd65bsYe+PrrJMwyU/jacJI8+WhbSY=
X-Gm-Gg: AZFdTZcksGLVZ5EIlBRSyAaBf1ArGiUbKsmPaRjak9ocRzrca2d0DCEC4zrtW+4D61w
	iTPM5rnQ/Zw61eo1/BTg+MNUqaTuhXqSCUnbDoEJsS24dDd9/sb1NLMeaR/F+oGWwphWIAx2R0n
	2RW5DF1cloxOqeWmFx73F5q5Xn2vUYQrXlj0F7KFSLMls/nL8Msq6PcbKRBYqSV9mZT0xTKZuiJ
	s7V//8O/tGBVSv+LR3wPKcUrX5cZ9hVTvVXHC3TDW1eoIyf3NdK7pokJq8jlwMmMsJMrKyqH4AC
	gB8q0Zwt/9tlg3FC6g9vKDXjZp0oqk8LKqewaEvRUL5eUWMSUexmUuGrbSmo/lsOLwS6zOCUmLS
	ZJnwNM9pKalwJdU0iFuDitayZvs0o0Vly1WYrW4gLQxYf0YJ+BZ6Qt/FlfwunJz308I71AJAWj/
	BLP8Jmc7WIEZmyTLnXH4tzM0wPKAg7Cko7LY4q8J7r338EIT9cSqVpaI4MCw3SR4gJmPtfyLWrs
	NNNDAOWRlvhiuGaPqUXIF3BlkNiOKiz3MmwNqkI8m4FFoiXuOZ+pDAbeNbcZ48p7Zx6L/fTtF+s
	rmmHUC7ldQQ0KQkrV8wRPpsFlxvR7gpS3g==
X-Received: by 2002:a05:6000:2309:b0:4a7:45a2:ec26 with SMTP id ffacd0b85a97d-4abb0f3bc89mr49275277f8f.16.1795777020031;
        Fri, 27 Nov 2026 02:57:00 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm46346149f8f.4.2026.11.27.02.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:56:59 -0800 (PST)
Message-ID: <167b3016-4881-4ef4-9c1c-100ba96b50bd@linaro.org>
Date: Fri, 27 Nov 2026 10:56:58 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] perf/arm64: Add BRBE support for
 bpf_get_branch_snapshot()
To: Leo Yan <leo.yan@arm.com>, Puranjay Mohan <puranjay@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Rob Herring <robh@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>,
 Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Stephane Eranian <eranian@google.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif
 <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20260810164622.1829843-1-puranjay@kernel.org>
 <20260810164622.1829843-3-puranjay@kernel.org>
 <20261126171904.GA809232@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261126171904.GA809232@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_025701_879741_3A9B9CF4 
X-CRM114-Status: GOOD (  24.14  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 26/11/2026 17:19, Leo Yan wrote:
> On Mon, Aug 10, 2026 at 09:46:19AM -0700, Puranjay Mohan wrote:
> 
> [...]
> 
>> +int brbe_snapshot_branch_stack(struct perf_branch_entry *entries, unsigned int cnt)
>> +{
>> +	u64 brbidr, brbfcr, brbcr, pmcr;
>> +	int nr_hw, nr_copied = 0;
>> +	bool paused_here = false;
>> +	unsigned long flags;
>> +
>> +	/* Called with migration disabled, so this is the CPU read below. */
>> +	if (!valid_brbe_version())
>> +		return 0;
>> +
>> +	flags = raw_local_daif_save();
>> +
>> +	brbcr = read_sysreg_s(SYS_BRBCR_EL1);
>> +	brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
>> +
>> +	/*
>> +	 * PAUSED is only ever set behind our back, so finding it set is final.
>> +	 * likely() keeps this inline; a taken branch costs a record.
>> +	 */
>> +	if (likely(brbcr && !(brbfcr & BRBFCR_EL1_PAUSED))) {
>> +		/*
>> +		 * Stop the counters so a freeze cannot set PAUSED behind the
>> +		 * value read below; the D19.3 conditions need a PMOVSCLR_EL0
>> +		 * bit, which a stopped counter cannot set.
>> +		 */
>> +		pmcr = read_pmcr();
>> +		write_pmcr(pmcr & ~ARMV8_PMU_PMCR_E);
>> +		isb();
>> +
>> +		brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
>> +		paused_here = !(brbfcr & BRBFCR_EL1_PAUSED);
>> +
>> +		write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
>> +		isb();
>> +	}
> 
> AI pointed out a edge case:
> 
>   1) The PMU is enabled (PMCR_EL0.E=1). The first BRBFCR_EL1 read
>      observes PAUSED=0.
>   2) A counter overflows and hardware freezes BRBE before the helper
>      stops the counters. This can happen while interrupt is masked.
>   3) The helper saves PMCR_EL0 and clears PMCR_E. Its second BRBFCR_EL1
>      read observes PAUSED=1, so paused_here becomes false.
>   4) The only write restoring the saved PMCR_EL0 is inside
>      "if (paused_here)". The helper therefore returns with PMCR_EL0.E=0.
> 
> This can happen with a normal PMU IRQ because hardware can freeze BRBE
> while local IRQs are masked.
> 

Nice catch. This can be fixed by adding 'pmcr_saved' in addition to 
'paused_here'. So 'pmcr_saved' would always always be set if the 
likely-not-paused branch is true, and then 'paused_here' is still set 
from the second read of BRBFCR.

Then on exit they are both treated separately. 'paused_here' invalidates 
and unpauses again but 'pmcr_saved' can control restoring PMCR.

>> +	trace_hardirqs_off();
> 
> The irqsoff tracer misses the time between raw_local_daif_save() and
> this call. Other callers could introduce similar gaps by using the raw
> helper.
> 
> I'll reply separately on the pNMI / NMI cases with an approach that
> may avoid adding the raw helpers.

And that other approach also avoids having to disable the PMU counters 
so avoids the edge case above.

> 
> Thanks,
> Leo


