Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C78606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S5gMbY1w;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iSPbi8vi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Na1VDzrbvIvpjQE8LtaxXRNWvZdhl6ZmEpKFnkdTQY4=; b=S5gMbY1wFdsROI
	n/+1w+fM1O31RJs05ZTNd3L+aJFhohQUj3J2CBcmlqKKS72ApqEZcZC/WQnuPx1sZ9hshgQ/xsgCr
	Lfdmdg0cbZrFRu4KZvtArGbgdM2s/75m+ASmPYmSlqbSDbTgLYJSyWRK5uFdsbtDV0+FjxQwb9oqV
	EKS80poOKzhsWZhSSUU7Unp2Ys19Mma7jQAWWoTmHBugIN884CShUjCKha3xThzC/trNu4IZsm8rL
	L3jdk0Uqkrvq/YH59+O0wcaXyNIwhQ6A0ZpgSYEIVmTHtdNZTRdRpH0cDruJlsM1HEcNIEn2XdNVA
	zXdgtmN2PjPvEq75mO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRD0g-00000007PLC-3iTW;
	Wed, 11 Nov 2026 18:25:26 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRD0d-00000007PKe-11YH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:25:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4910b863b84so83583f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 10:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794421520; x=1795026320; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Na1VDzrbvIvpjQE8LtaxXRNWvZdhl6ZmEpKFnkdTQY4=;
        b=iSPbi8viIBskp21PX6RDlaVOZ2oAGEez9gtZ7qvdO57qMYHjACEpEb3CZNMfNIUXUK
         OrnuOhaB8ZW+3r8nAJS0fx5u1PFpeObWU3FWR/HQPr/gn6Ob3lCpJj+2DexAmJGXq63i
         qx2uQHAMNfXbUcxUzRQrpxUzd/hDPgQv+yVwOfBFcInv98fbUbn5+l8LnpoILewi9FLI
         ibfQaTA65etEIrT1JK6lviAFqEAWGxZuKD0YHtSsCNs/EU7xAi/mAPfFB8QCAXOhWYlw
         oaqCrN+ZuDMV/tt07aODa640LjRjmNS72Z7f6PzvCT6CWH2Axp6RsOpJ2WKRqhLezOGz
         pfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421520; x=1795026320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Na1VDzrbvIvpjQE8LtaxXRNWvZdhl6ZmEpKFnkdTQY4=;
        b=mwzzvge/x3wAgHZj11C60HlDmICEN/cXNBFjzCGytBOtaXIg5HU45wLfrB9N6wNKwY
         AbJ3M/jQ+fvO8BCB/IgghFhzA18zURJw4vvUNvKAjvBsTtidehVI6BwLJtGByiIyf1oX
         MAkMpzzJIKfr0xKfdrWdRtA4+zIYuMpys9UjTWnOnD6Q9KnLf23Abrfz/AIkYE7PQpVn
         6Wyo6IBJVROiMRd1EMotJbyYHt8d/cCQHaHT88iaJzfmfB/7uASg+fSMTbPMkfJAN3S5
         4m0wtD/fwgElpVQUJsGSioQh/Xy3ZXXI1nSzdK5vjprPcQ2xDUgbBHNQJ1tMMInBzNDG
         lqAA==
X-Gm-Message-State: APuU4Z8Sh0rcD9PNCIIbtBi6r5TylNMj8DIh7hpzt+IAOonJIGdjpk/t
	3Nf72FVqD9HooCq70QLv0Wb+Z7kLZsNWmW7YDiXrHioI8gs7I9lE9T3qgwdfQ5a2fLo=
X-Gm-Gg: AYBFou0jJxPMZMJ5VdnfnHJL4X06eNVlnaHG8NKmZTsF6ONIdEvqLYa2hzz+g/zLp0Z
	MU4PtoVunTUnS43BLyFkO12nSp3/2meMliVy5m+59X1CaCaUbBejHGJEkJi08vR8Et9Lw8hCaWm
	GW2i503c2pYRpI44l0+abKhZ9icdgv5zLBG3+YHchKUWRG6RM3Gvu4bKr2lnkbWi4WbOZPgPIcR
	abpDMHwQf+nA/1TGrS2ztyl0ZaZYer6ed9kXAH9loAhUfjSC6NKHk/kSULGLisFm0boI5pafnEH
	btir3BT1EEph+9D4xuehDAASgatthtjKYqVxpr7wp5sdBwmcqyeBPHR4nxN195t67DAp+rgDdZc
	mxnLkKznNVSE6cvMVsRLiYGOEacyHQabIXbaec7OuZdhIYBFMM8H7zCJD62s8M8Px1K09Rx5JZx
	hFOUWVoizHGitMnbljIj/rOBFvv5mbaiC0HxdDyXn6yYCXnzuJES/PFn+je48kd+jusZOvRfWwp
	kNg8N2wBsQEkh6iYREvgGZCdR9YdoYXfJfvn6FgjhC02NREZ866EJz/jNYAMjbKAdNNik9VU+VZ
	FTQdKDiDNT58LJAL10vm7KXEvznEDLJuZw==
X-Received: by 2002:a05:6000:5c6:b0:499:527f:ce55 with SMTP id ffacd0b85a97d-49b02f37714mr463058f8f.27.1794421520524;
        Wed, 11 Nov 2026 10:25:20 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836a9951csm12579057f8f.56.2026.11.11.10.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:25:20 -0800 (PST)
Message-ID: <2e2b2e01-246c-4730-95b0-2ae0e7281db2@linaro.org>
Date: Wed, 11 Nov 2026 18:25:19 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/23] coresight: trbe: Reload the AUX buffer on
 overflow restart
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-19-3f57cf3199b1@arm.com>
 <d93b9120-197d-4b01-a9ab-8df01657716d@linaro.org>
 <20261111174626.GF9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261111174626.GF9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_102523_347199_F618A48E 
X-CRM114-Status: GOOD (  37.00  )
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



On 11/11/2026 17:46, Leo Yan wrote:
> On Tue, Nov 10, 2026 at 03:12:06PM +0000, James Clark wrote:
>>
>> On 16/10/2026 17:55, Leo Yan wrote:
>>> PERF_EVENT_IOC_SET_OUTPUT lets events share another event's mapped output
>>> buffer. For AUX events, this also selects the associated AUX area and
>>> sink configuration. Perf normally establishes this sharing during setup.
>>>
>>> Consider the following hypothetical live-redirection sequence, permitted
>>> by the inspected perf-core paths. P is a parent event and C is its
>>> inherited event, with C->parent = P. A and B are mapped AUX destination
>>> buffers owned by separate, disabled cs_etm events in different task
>>> contexts. All three are per-task events restricted to the same CPU, with
>>> compatible output settings. P has no mmap of its own, allowing its output
>>> to be redirected while A and B remain mapped through their owner events.
>>>
>>> 1. P's output is redirected to A. C inherits from P and begins tracing
>>>      on the selected CPU, so its open AUX transaction and TRBE hardware
>>>      both use A. P can be inactive while C is running because their
>>>      events are scheduled with their respective tasks.
>>> 2. A userspace controller calls PERF_EVENT_IOC_SET_OUTPUT on P to select
>>>      B. ring_buffer_attach() calls perf_event_stop(P, 0), which returns for
>>>      inactive P without stopping C. P->rb now selects B, but C's existing
>>>      handle and hardware still use A.
>>> 3. C's next buffer overflow invokes trbe_handle_overflow() from the IRQ
>>>      handler. It saves buf for A, ends that AUX transaction, then calls
>>>      perf_aux_output_begin(handle, C). AUX begin follows C->parent and
>>>      reads P's current rb, rebinding the same handle to B.
>>>
>>> This is a hypothetical API sequence, not a reproduced TRBE failure or
>>> an observed buffer switch in normal perf record operation.
>>>
>>> Without reloading buf, __arm_trbe_enable() calculates the next buffer
>>> using B through the handle, but its workaround and hardware setup still
>>> receive A. If B has never been enabled, its missing CPU association can
>>> cause the normal-offset calculation to dereference NULL. With a snapshot
>>> buffer, hardware may instead keep using A while perf accounts output to B.
>>>
>>> Reload the sink configuration after perf_aux_output_begin() so the buffer
>>> and handle refer to the same AUX transaction. If the buffer is missing or
>>> its CPU association does not match the interrupt's CPU data, truncate the
>>> new transaction and leave TRBE disabled. Truncation requests perf to stop
>>> the event; a subsequent normal restart installs the buffer and its CPU
>>> association through the sink enable path.
>>>
>>> Stopping inherited writers during output redirection remains a separate
>>> perf-core fix.
>>>
>>
>> Shouldn't we do that instead of this? It seems much better to fix this in
>> perf core rather than here which is hard to understand and appears to be a
>> bit hacky, and doesn't apply to all users of aux buffers. I would expect
>> that even when using PERF_EVENT_IOC_SET_OUTPUT, the buffer should be
>> consistent between start and stops from the point of view of individual
>> drivers.
> 
> This is only a hypothetical scenario. Fixing common issues in perf core
> is right thing to do, but I'd rather not spend time on this until we
> can identify a real-world case.
> 

Can we drop the patch then? Doesn't seem like there's much point in 
fixing a hypothetical when we know the real fix should be elsewhere.

>> It makes sense to add a workaround in the driver if we can't
>> control that behavior, but the code is in the same repo. Maybe we could even
>> just leave this patch out and do the core fix later?
> 
> Let's see the simplified flow:
> 
>    trbe_handle_overflow() {
> 
>      buf = etm_perf_sink_config(handle);
> 
>      ...
> 
>      perf_aux_output_end(handle, size);
>      event_data = perf_aux_output_begin(handle, event);
> 
>      buf = etm_perf_sink_config(handle);
> 
>      ...
>    }
> 
> The overflow handler ends one AUX transaction and starts another.
> Although perf_aux_output_begin() returns updated event_data,
> the buf pointer still refers to the old buffer, potentially causing
> a mismatch in the hypothetical scenario.
> 
> In contrast, Intel PT and SPE use the updated buffer pointer returned
> by perf_aux_output_begin() to program the hardware, so they don't
> have the same issue.
> 

Why not do it the same way? Get the updated pointer from 
perf_aux_output_begin() and if it's different, reprogram the TRBE.

>> Unrelated to this, the sashiko report that says there is an out of bounds
>> read if the output is switched to an ETF buffer seems to be pre-existing.
>> But it's something worth thinking about.
> 
> I roughly remembered the comment mentioned a race condtion due to swap
> TRBE and ETF buffer _within_ the same session. I don't think this will
> happen. (I will double check Sashiko comment).
> 

What do you mean by session? Do you mean multiple events owned by the 
same user? AFAIK all you need is access to an ETF event fd and a TRBE 
event fd, anyone can get those two things by opening events and use 
PERF_EVENT_IOC_SET_OUTPUT to connect them together. But it's a 
pre-existing issue.

> Thanks,
> Leo


