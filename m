Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E133606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RD+eGqfa;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h2IRWKNA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1P9jh/3dNVPHo3/JRb6QOjFyR52ByPWaY+Xbs/2Psnw=; b=RD+eGqfaurhqSQ
	b3twe605n+W76IX6rTQlnN1Svz53FTSIDm393P9T6yAWO1vrreVCs6OEUKjQwalOMAC4+hwaXtLJV
	JvQTZfn/jqh3pq5SAsPFv2nrOYaARzIGwvNxLs4DXob9pyXZH16Xc88xG0nHzmym3ysmYEFEJJxD7
	eJAG/l1m9IDinmp3idptApar9LaDQLeum5Xtae3Qi0iVRZuKUcWjI3qIVTg7vtBE51mRgWdhM2X/K
	PelIrzuaXZh2DCzbRc0qEGZCV8fNORdBbOmO/JPpahuIJc5WbI8Sv6ybWAtCaRbEqMITCkNzFtiaG
	C3lIMpLfYFPbjUYiNltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtdS-0000000FiFl-1VKx;
	Fri, 27 Nov 2026 10:56:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtd1-0000000FiBk-2ymD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:56:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so80531625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795776990; x=1796381790; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1P9jh/3dNVPHo3/JRb6QOjFyR52ByPWaY+Xbs/2Psnw=;
        b=h2IRWKNADw9CoYNb0DYdfojX41i7CTbK8xI78JdZsAirfDVnbuZNA6YDjF2CjPM0JI
         eheJShLUWZ0aTCJWvO5W1/4GqSbDTkI786Z+njnqQHqSEABN86DV4xf1UkwQ3q7f2D9S
         WpNKN3G2p5DOihfh1mwDedjqqxzBJYae4jM0khBZxnMo8DMCJC7c5l3wbfO5PQfIFZYS
         +6znlreXSi93EgfyNx9P0HMbTPN4/lsWkVs8grO433gykm4DBFb5ABV/o3N+fYOdZxCz
         jvroUL5dRdApHd0Qbg+SwKRqn7znQSPnTvnUOmfUOAyxe7ur2Myqhw37BL+YBHKQdpwx
         B/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776990; x=1796381790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1P9jh/3dNVPHo3/JRb6QOjFyR52ByPWaY+Xbs/2Psnw=;
        b=Sg7a5mNu3+6z4JhdJtpXX0nCwbVK7x6oZm9YESsrgTWHklvedOkH2waO2A/e39Ov+o
         htdR7aHP0b7+0r6KRdjp/jm8jfEyip+aeTPhdnAu/aufuhletpXNeZt3nO9CBGJbKXQ4
         3SWxumgeXz151odJIVSLz39kaz3+sY2WO1BR+5UkKkS6leR/HC5f3ZI4GC2s6+6vLDgu
         zX+KkYFDQJ1flIXMiZwca0rAbQGv4s7YINEi/VG1cI+nB972GIHMuM9extKkxBfBdxxI
         Y/N/Hcfrhi/l7MIOEWjvojfAVdTwbI3EXWrCo0eSUyZYrIxzgbffp/Msrg24Ij+n8E8p
         Ilgg==
X-Forwarded-Encrypted: i=1; AL+hErGrpYq3HMAoHSKHPYcGFGUu3nBfFXnEWFh0IDg6b1OvLbMOBiXpW7MG3PbmNqwTC1Et6ZlDE+jRXcbkeflB6WYg@lists.infradead.org
X-Gm-Message-State: APuU4Z9rH8ex132AKBv7leX/bwtV1UYmPqdSrXzGJzvcpMX/JCWRiUjv
	82Jvg2Uz/LjnPrAWQ//2KbsQMgOHMs/VE84xPvzAC0dX/eWtZhcgTzDU9MuoJWjkxmk=
X-Gm-Gg: AZFdTZfKUY+oLGm03Ivb1SwF+k0H8u/ZrJFh4r/JjYfavZmEonuSfKTVH1thyDP/GbK
	5keNvwXPGUU55XKyZ0R2dVtsFMZbuZtjmEyFY5UgM8Bm3OlOEj1tLwn0R1l4oA6qC6e39yCZQEq
	MvpESh9Qi9TuFQJwsyKZ5+q7bctYpmbE0dGqMagTqBwPhaLFGw88j9X0MkwP9xqGSX9OthXae4t
	nCS9QZHo9WLleZwNXsXDTOgpmWoB46cbcr3DcQUkY60XmNHQsGaY2NODcbOOy8vHwRU23exvTmg
	GoYWd2UKRiaRCmfSIhUqpre6Qu/ZbsBtZkvCJW5+rKJdOgVOnfsoFXM/SYMZEixOxooqUDF0EGA
	zsjJ/llhQnzIGdF35my30p5eXJhyCtcsDLXWGo255YRHk9EhGRgAam+tXGI6z7YW7rEQNFJ6iIk
	vF3qHnme6659TeLb9dLChabRBk2EOICmz0Y0WDP/2qL/pdoXm2LIBkYm+tg8cmQfRKFodB3sYLY
	eqyoLcoC2potyJwdBxJ70PnkqJxF2r/6XaEcoThm+wIeY91W/q6lWCHvH3eZ+uMcADb4JUkufEX
	IVz0zOXm0CWIMjJAi3pvEBZoyhgi/qHfvw==
X-Received: by 2002:a05:600c:6744:b0:4bb:afae:150d with SMTP id 5b1f17b1804b1-4bbafae24acmr75249945e9.33.1795776990010;
        Fri, 27 Nov 2026 02:56:30 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm408746585e9.1.2026.11.27.02.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:56:29 -0800 (PST)
Message-ID: <9a471409-04c2-4f6e-aec9-0b23bb9b69f0@linaro.org>
Date: Fri, 27 Nov 2026 10:56:27 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] arm64: Add BRBE support for
 bpf_get_branch_snapshot()
To: Leo Yan <leo.yan@arm.com>, Puranjay Mohan <puranjay12@gmail.com>
Cc: vladimir.murzin@arm.com, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
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
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>
References: <20260810164622.1829843-1-puranjay@kernel.org>
 <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
 <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com>
 <dfa8362e-0dad-4f23-9d2e-dde03cb5facc@linaro.org>
 <CAEf4BzZ=ahQNtA-1KdZFRONXMOEkV9Nb1OUY==JRQCarkbMM0Q@mail.gmail.com>
 <5c7f4a5f-fe5e-4367-9c60-86f1818346e8@linaro.org>
 <20261126180214.GB809232@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261126180214.GB809232@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_025631_792718_5106F067 
X-CRM114-Status: GOOD (  24.57  )
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



On 26/11/2026 18:02, Leo Yan wrote:
> On Thu, Nov 26, 2026 at 12:39:52PM +0000, James Clark wrote:
> 
> [...]
> 
>>>>> Mark, Will, you guys seems to be designated as maintainers for
>>>>> drivers/perf/arm_brbe.c, can you please take a look and give your
>>>>> feedback as well? This is important and useful feature for newer arm64
>>>>> CPUs, it would be great to get access to this functionality that we
>>>>> had on x86-64 side for a long while now. Please help get this upstream
>>>>> or, if it's not in the right shape, guide Puranjay towards a better
>>>>> implementation. Thank you!
> 
> ...
> 
>> + Vladimir
>>
>> Hi Mark, Will, Vladimir,
>>
>> Any thoughts on this approach where NMIs need to be disabled? Alternatively
>> we could do something like track where the PMU interrupts and BPF snapshots
>> overlap and then discard the BRBE buffer and make sure they don't trample on
>> each other etc, but it looks like it would be significantly more
>> complicated.
> 
> Could we restrict bpf_get_branch_snapshot() on arm64 to a free-running
> BRBE mode? On a given CPU, at least one active event would have to
> request a branch stack, and every such event would have to be a
> counting event.
> 
> This seems to fit in this series. The selftest opens a CPU-cycles event
> with PERF_SAMPLE_BRANCH_STACK and sample_period = 0, then takes the
> snapshot from an fexit program.
> 
> Counting events can still generate overflow interrupts for bookkeeping.
> It requires to refactor the PMU driver to leave BRBCR_ELx.FZP clear so
> an overflow doesn't freeze BRBE. The interrupt handler could service the
> counters without touching BRBE and losing the branch records.
> 
> Thanks,
> Leo

Yeah I think this is a pretty good idea. It looks like it would avoid 
having to disable NMIs. You only need a local_irq_save() to avoid new 
events from reconfiguring BRBE while taking a snapshot, and you don't 
have to disable the PMU counters either.

If any sampling BRBE event gets scheduled then the snapshots just start 
skipping and returning empty.

