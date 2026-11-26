Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0720F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fD+SHeQ7;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aTH245Fj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+CjvtlLtZ8LD35jmsrC/DW5uvUUSL1yNq5kGmVgUFAw=; b=fD+SHeQ7Vak4t9
	B4/bWY/yYH1DolmsvTGeuCYH13cMp7UZQwuDN3wHZC4/IQNh9W5zyU5EAsW2+G5VHqoeyyRat3Y0p
	g/3Wy9isnwyx8FHQONxR+0v+OmIOGmU8kb8Ah6EE/6R9V9Zi1cBMu8CZ2+QAmr2vzBZCpCC+vi38T
	/94bC9rHnP54mk7fTGXi2fjNARvQbLKy9bBsbFeOAun1Nkx+MO3daQXcyHGX+Wz+pVQRmuhhrqjpA
	AXOFIoHo+7qvGugDSCsdSWqsUulOlfBGtp5tLIWZHpUIbjmWuhrHMSqFq0hA0Gq+8ufAuxwX7/hK1
	91Df8ArJSeWL/RyBztCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYlb-0000000DAnr-3llV;
	Thu, 26 Nov 2026 12:39:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYlY-0000000DAkt-2UI8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:39:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so56278015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795696794; x=1796301594; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CjvtlLtZ8LD35jmsrC/DW5uvUUSL1yNq5kGmVgUFAw=;
        b=aTH245Fje3ChxFzZKY2EUTbJerW2jK0l96KwhzbDWJKgshW43kq6OkLaljmWwl3qSx
         /SN3uD/tAxWP1JcJgJ6A0LIAH3jemqtXCcSMxN4QfScrZaurpIfWunbf9x4yYr3ntsr8
         y75bK1Rlrt1kSTHcPNh2S0+OlK9b8J01D4yXn2s/YMjwG23A6ILMuo+XXjXMTqd/nhI+
         2Bcg5g73CXWf0a+4HHjGGSm7ZbP09X77ivOMP4NxAUNvE21MnSVfnabJLVT+8YrkAK29
         dViStks5rrZWos3YeQXfQFXFbS7B6hsUI9Ih+BXuI8QaFgiI/vpQz79Z+qR+9Sru5TZX
         rAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696794; x=1796301594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CjvtlLtZ8LD35jmsrC/DW5uvUUSL1yNq5kGmVgUFAw=;
        b=Z/p+4TLxpkxsOlnxG9dl1OSlU9gYU9Si1hPyPp1EbZ132iZwWCyZP5ZsnskHFoRVjP
         ExxfG9ohk8SpJN7Xfxyu7qC4g2SQx68VB7deEfmwmlD2NPAtVV9nySKW+//p675Gg64f
         JvmdbZnSr8r/iX/nQUMi895ob7XENxfM3VCP4OY+zkQY2489AmlkPEkeUHCH0dgizDSG
         m1ScRQqiDpDQedSUzqg2oWkfqvbVD54WuvLYBBLQdD1Ac04S9haPHQgWFBVrJQ0bygwv
         yaaIFMp2fFbtV/Vp+nC29moLZSanvGYn0BxV0VBpH4hZg6kGPE3m3ooyDH/cfsQe6GoP
         8BOg==
X-Forwarded-Encrypted: i=1; AL+hErEePO6EgNSwzUI5nvCbVOl3+0lFb8I/ok4o1pWLcOrBlJdDNLVZ1ofqQ4Ah4uqv+DDBQ/Vi234Rn3jmLk3osX7M@lists.infradead.org
X-Gm-Message-State: APuU4Z9rhdgA2n4Ljmi4dYzzWurU6S4vDdxB6DbH03B5eUgBBaFXrxWG
	R3a3lzE7ihIz/F+q0LKICMdz0Dl924wlrWQk7rFPMJ5zvtnDD+sWlBoJRJajgpWc6RA=
X-Gm-Gg: AZFdTZcES2bFt/7UljMyDVum94b7JKSj3UcBtgI1nmgS4noZ17Fb5n9/a4UFhpqMAkj
	aGibZbnAE3egRCzcQ6BTssLs/0zq0ElJTQ6BZqSpQnhOsiaKNvwfUMnDPKd62F5851BvTMkqsMm
	x0CwH8eE+OTkQ3/z5BDH7MNW2YrAbroqSDHc1pMBBvU9ucwgjEnGAGMj7slUfiYNOgYJClVeShv
	WXYJJZjJ7gdPlPtHQ7MkMkR8FV+Ul0hi0WAJpj4MI1+KnATbfPn0XWQ1m04eJzvXvm5rCDjGK20
	zbxZPTkHLGi+dfqe6otmIx0wjqJAmW00pDA68101Z2Q7dN71+oeo2X2HqYIvykzO4GrSRv4fkOw
	xR4ZhP+CQ/KNWj8b/FPVCtuvRF85n5vlP9ynpTG0GdqB5MrTGLoUS6KhoV18ZS2S9gT6OnAU6XM
	qNCDxeM89jM5qdFcxvRONy/FfUyxyPbhXBNAM9ydMPjPep8AcxHQiaLj+pIhf+hkvY7tFVPbdy1
	g8D+oN/02CmpVuJ31QrLytV666qy2hNr8gLCILCPghBmnXfM2ojmqjp688VRTAqCm2B0Y0yYxCk
	jb5R38EuZXcQO/OpDJp3Rz+qSj3DA2LSAQ==
X-Received: by 2002:a05:600c:4515:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb888267f4mr432189715e9.29.1795696794423;
        Thu, 26 Nov 2026 04:39:54 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm330174705e9.3.2026.11.26.04.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:39:53 -0800 (PST)
Message-ID: <5c7f4a5f-fe5e-4367-9c60-86f1818346e8@linaro.org>
Date: Thu, 26 Nov 2026 12:39:52 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] arm64: Add BRBE support for
 bpf_get_branch_snapshot()
To: vladimir.murzin@arm.com, Puranjay Mohan <puranjay12@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>
Cc: bpf@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAEf4BzZ=ahQNtA-1KdZFRONXMOEkV9Nb1OUY==JRQCarkbMM0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_043956_665069_94E4F2FA 
X-CRM114-Status: GOOD (  21.61  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 23/09/2026 17:46, Andrii Nakryiko wrote:
> On Wed, Sep 23, 2026 at 2:15 AM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 22/09/2026 21:40, Andrii Nakryiko wrote:
>>> On Tue, Sep 1, 2026 at 6:45 AM Puranjay Mohan <puranjay12@gmail.com> wrote:
>>>>
>>>> Hi James,
>>>>
>>>> Can you review this version of the patchset? It is implementing what
>>>> we discussed in the thread on the last version.
>>>>
>>>
>>> James, do you mind reviewing the patches again, seems like Puranjay
>>> went with the implementation you suggested, would be nice to review
>>> and ack, if it looks good to you.
>>>
>>> Mark, Will, you guys seems to be designated as maintainers for
>>> drivers/perf/arm_brbe.c, can you please take a look and give your
>>> feedback as well? This is important and useful feature for newer arm64
>>> CPUs, it would be great to get access to this functionality that we
>>> had on x86-64 side for a long while now. Please help get this upstream
>>> or, if it's not in the right shape, guide Puranjay towards a better
>>> implementation. Thank you!
>>>
>>
>> LGTM, and the Sashiko review is good too. It does conflict with the
>> FEAT_NMI patches on the list, and you'd have to disable NMIs but as it
>> stands right now it's ok.
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>>
> 
> Thank you, James! Mark, Will, do you have any suggestions on correct
> sequencing of things and how we should proceed? Thanks!
>>
>>

+ Vladimir

Hi Mark, Will, Vladimir,

Any thoughts on this approach where NMIs need to be disabled? 
Alternatively we could do something like track where the PMU interrupts 
and BPF snapshots overlap and then discard the BRBE buffer and make sure 
they don't trample on each other etc, but it looks like it would be 
significantly more complicated.

Thanks
James


