Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA073606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tJJaxZKU;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z41FOEsX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k6KEcTl/pyiQsKyyg/2eQ+l+POB59ejsRYmW+NNyeA8=; b=tJJaxZKUOni52q
	R7VXPyhwnvXUPzcQEgtU8mHExZvHEBPASQCFnFKhsU3oDG2RvxNH7zaq8KnqHAJkK761SDOce6CzN
	BnvtWEf7q+EtG5wUcIw49Ltaa/VMvd4oDlNKmwt8loO6iq4wE7FQUjyACMMsI/QlNxFt7UIL+qQbE
	iiCDVT4828RF3hDgz6oTcf/WS9MIh1rlKWQk994m8PG099MMfI7s4+dyWOpH4JDFqy0Mi+0jWkC8W
	0n41nRmiGgTTBw2NoOBVjH53dLAF0BYQwcMe2qr9844Zi2qQDXlAwnc6m2z1cJffgeso6EK5BAq/C
	E1yV4vn82kq9rgOXl2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9lI-00000009Osg-1yXF;
	Wed, 25 Nov 2026 09:58:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9lF-00000009Os5-2gEM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:57:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so3590363f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 01:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795600676; x=1796205476; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6KEcTl/pyiQsKyyg/2eQ+l+POB59ejsRYmW+NNyeA8=;
        b=z41FOEsXRcucRN7ee+KDtOHWe7Gi2K7WNMrXqkfzcA8nxLB8fL12cpGQPJWYHn8rjU
         q+gvPPT0UsJYZKJBz+BvGY9lhG/s4AXnm1nZPrS9qg/SpxwkS25aTt7d6lFt7P4ju6f5
         Ik49/jFxfNEWb10c+wnhQ6FdcGzkEo8a8gserwTzlITEOmq4ksYxSAAaq/LNK2DVtXYE
         6q3VmduuXZrnUs96Y1MWN0mIz7EyKXyW5xqYiQsAVAJ5O3Z49xjwcdCQjZlmJdtg0qEM
         tlBCnt5Smg4Mm/wtuePNAwTrYU98mL/6XExpOFJJxxqnjKa0OoWHXaMTnS3md3Cx3eFo
         P34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600676; x=1796205476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6KEcTl/pyiQsKyyg/2eQ+l+POB59ejsRYmW+NNyeA8=;
        b=Ip3eEQFa8xv0EAgkbRzYNrAzPY9TW+9xQ0Z3TqbLYNi4Dx5FSIkEJFrK37GTra4yAy
         C6KNuB32K1PIkpfGagiOLSK0A5GzaHAzHEjiGyVNiZSYrz0IceDJRSmKJ9zRzKvAFyHy
         7wjdC+rSz0+CAnQhHVWMgVtYaami5KFajRvWEoh0OCLXN/lcJUBra3BJKvuFlZwDbQbx
         fTIue99j0GMbjE8V21giLYN1EEyBRzE+6HzZOQ7A0ROx3imrcS+VfpXV7izQY2biq5yV
         XPQ64Qj6ha4swa5zVji6Bezg/QD3DIJYzw6BfddBh9fAPpXQ5Pna/7kWz/UCKXdF1CpN
         BxaA==
X-Forwarded-Encrypted: i=1; AL+hErH+7n9LrB3qP5NEKJ7lTE5kh/M/1bTv50pYKPoP/gWLo0F+L8tgvz1asx4AnB+ZJLH5u77gHdkyZupo8hZUhLdp@lists.infradead.org
X-Gm-Message-State: APuU4Z9pE0BTHJdUgxea5X1QcExKZ0R8axWrzBdypEAc5W6lwswjxHqj
	drGWOkPCyGqXdrgZM3hwHLnxciXJC7pNxm8o04CVQNZtzo0uvbNITFJ52GwqY4EJZ/k=
X-Gm-Gg: AZFdTZeSV+p8becDlO8vASTzBZxwCFoYrOcyeZbOk9syW/uLj9dMfxtwEeZasFCnDvP
	LYl9x3WaRQrPFkvsLPBoCD7nxroJM+KUJROm/NXXF2Umj3m99sY921F6Li0AMYcRpycKlcNHfYK
	hzjRI7Fjco5UOiYRR5pDCCP52RNZ4zfIIBKWYi4DCyGSGTRQJcbZTnI1DNksV1srjjuAcNIE7Ko
	xeRgECIASo8bgTH5/C3+4JuTS54OG1UP1HIHASdGLD7LjQOTY9pxA8JNf5kBYl5RcDktM4ld0iJ
	wdydC0jpHR/Q8QEnkKPqg0sMpnSP0X9dmmtPnavfqZlIvMous/S9H5FvogKnKXxRndhI/joqpcM
	zIyqT/tFho5fQr84iMWLnXv3gMDxTlemOCaxaXBi/orlthlzGPiNYpEpTPpPn1QJ2o4rnE6ccpG
	oQeWxO5TD3BxAPGlHWfPZs5VsAKRUBwh/bXk4P1gDNQGJZrk9zZ5LML/4/Gy+7NrpqiCcy9wx28
	Ue3ORvZfB9NgSO1owpgZXjfz6jFAmpvAC8wywExHJhSyWXuP0YGmC1adpSuN1ZUQMaNLeBKplOQ
	3QQYMaNHOwc9I6zaMTEWFYuy22Br7OsMvw==
X-Received: by 2002:a5d:64c9:0:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-4abb0f3c071mr35368426f8f.14.1795600675654;
        Wed, 25 Nov 2026 01:57:55 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm32730070f8f.10.2026.11.25.01.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:57:55 -0800 (PST)
Message-ID: <d2ae7970-63cb-4c8a-8c04-483d88fcbffb@linaro.org>
Date: Wed, 25 Nov 2026 09:57:53 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/19] perf auxtrace: cs-etm: Capture wrapped snapshots
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
 <20261105-james-cs-unformatted-per-thread-fix-v4-15-7759e0ce2449@linaro.org>
 <8b37f5ea-9427-43f6-8abf-07a36a9bbb72@intel.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <8b37f5ea-9427-43f6-8abf-07a36a9bbb72@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_015757_706517_452AB070 
X-CRM114-Status: GOOD (  17.48  )
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



On 24/11/2026 20:41, Adrian Hunter wrote:
> On 05/11/2026 13:45, James Clark wrote:
>> find_snapshot() isn't implemented for Coresight, so when a wrap occurs
>> we only save from offset 0 to current head, modulo buffer size, rather
>> than capturing the whole buffer. Coresight drivers currently use a
>> monotonic head pointer even in snapshot mode, which gives a lot more
>> information for taking snapshots than a wrapped pointer. It means we
>> don't need to search for data at the end of the buffer to guess if a
>> wrap has occurred, and we can go back to saving partial buffers after a
>> wrap by checking if the next size to take is less than the buffer
>> size.
>>
>> The drivers will always be able to generate a monotonic head because
>> TRBE has a bytes written counter, so even if we stop generating an AUX
>> record on every overflow, we can check if the counter indicated an
>> overwrite and offset head by a whole buffer size if it wrapped. This
>> forces userspace to read the whole buffer rather than between last and
>> current head. ETR and other sinks use software double buffering, so can
>> continue as they are.
>>
>> Add auxtrace_record__monotonic_find_snapshot() and use it for Coresight.
>> A monotonic head can't be auto-detected in the default find_snapshot()
>> by checking if head > buffer size, because before the first wrap a
>> monotonic head looks the same as a wrapped one. The search would then
>> falsely detect a wrap when head is near the end of the buffer, and the
>> wrapped pointer fixup moves 'old' and 'head' a whole buffer ahead of the
>> driver's head. With a wrapped head that doesn't matter because only the
>> offset within the buffer is used, but with a monotonic head the next
>> snapshot would either save already saved data again or drop up to a
>> buffer's worth of new data.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> 

Thanks!


