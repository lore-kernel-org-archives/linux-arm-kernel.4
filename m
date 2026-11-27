Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A69F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MSRnyVfY;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bE1iioEv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BmvSFNwuZZ6ZhhMfOJ07HjKd8JZmJAhwtuSSqIjvLDI=; b=MSRnyVfYjWoAgQ
	Qz0FvzFX3hoGpKVpYW8O3zAAxphk8cWVrD3WWpTBz8L3Uf3DuA1AqyIRUU5eX94XMchXlxpLbnC09
	p7Y9Lmgb2gQojQ2eyAM73hFzEYRjAnkSL/fTACLfdN7gDxodhgC58UD8AKd5T0zfNOVpleVZz0O+V
	bROdvaIbOSrxhtB/7lhsagzRgE2cutgq/77Mbao2mObCXhOz7wAUxVrNjEt0z+mT+7kgfmbT6yQHq
	edHYFavalNasueZ8zuwvkjciL+XHE/KN03Q3WGjR9zE2wjXNfXtcb75AVqY+S8SEp9o39NQnXo6+m
	LdzMMeIowyr5shUD1zyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsEZ-0000000FR2e-2sEs;
	Fri, 27 Nov 2026 09:27:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsEW-0000000FR1j-2tQw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:27:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C82521E4D;
	Fri, 27 Nov 2026 01:27:04 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2D533F632;
	Fri, 27 Nov 2026 01:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795771627; bh=JR2LNnD/GioQmSMBCZUq+Ee7uvXzWpRUqwQ+mu1odsU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=bE1iioEvTg35faEDRH8QQcmSSxco5PcTLwvDaem+q49Mv8Tsxn2qxk4r8gbvLhYpW
	 BKe3UFo5vdYHE7oEAXoCv9Ih9hselpxG+O2k7EW+VYtPhnvHg15KCFToQqag46uKtJ
	 az++Xml36zL3z6AkXX3jkHjXGN/mQL0kkf9fPJ4o=
Message-ID: <c502714b-7268-4a77-bda1-3f9540665950@arm.com>
Date: Fri, 27 Nov 2026 09:27:04 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/23] coresight: trbe: Treat access not allowed stops
 as fatal
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-14-3f57cf3199b1@arm.com>
 <e44a9c55-4fe5-438b-80b5-f2ebf09dc1d6@arm.com>
In-Reply-To: <e44a9c55-4fe5-438b-80b5-f2ebf09dc1d6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_012708_813725_F2A8CC1B 
X-CRM114-Status: GOOD (  19.48  )
X-Spam-Score: -4.4 (----)
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

On 26/11/2026 15:06, Suzuki K Poulose wrote:
> On 16/10/2026 17:55, Leo Yan wrote:
>> Arm ARM (ARM DDI 0487 M.b), the rule R_RRCNN in "D6.11 UNPREDICTABLE
>> behavior" permits a buffer management event when the effective SCR_EL3
>> security state does not match the owning Security state. This can stop
>> collection with IRQ=1, S=1, EC=0 and BSC=0 while leaving the other
>> status fields unchanged.
>>
>> With EA and WRAP clear, trbe_get_fault_act() currently returns SPURIOUS
>> for this status. The spurious handler re-enables TRBE without clearing
>> S, so collection can remain stopped. A retained WRAP indication can
>> instead cause the status to be treated as a normal buffer wrap.
>>
>> Recognize this architecturally permitted stopped status as an access
>> not allowed error and return FATAL so the fatal handling reports
>> truncated trace. Check the syndrome before WRAP and do not exclude
>> TRG, since both fields are left unchanged by this stop. Check the saved
>> IRQ bit to preserve updates without a pending interrupt.
>>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-trbe.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/ 
>> hwtracing/coresight/coresight-trbe.c
>> index 
>> 4aeed1a17c4bf1653fb41731ac15f31feec7ed2e..1c585b6123df2f20d08747678d836742ce9564cc 100644
>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>> @@ -708,6 +708,14 @@ static enum trbe_fault_action 
>> trbe_get_fault_act(struct perf_output_handle *hand
>>           goto out_fatal;
>>       }
>> +    /* An access not allowed stop can leave WRAP and TRG unchanged. */
>> +    if (is_trbe_irq(trbsr) && !is_trbe_running(trbsr) &&
>> +        ec == TRBSR_EL1_EC_OTHER &&
>> +        bsc == TRBSR_EL1_BSC_NOT_STOPPED) {
>> +        err_str = "Trace buffer access not allowed";
>> +        goto out_fatal;
>> +    }
> 
> It would be good to have the conditions in the commit description
> listed here for reference. Also additionally, I wouldn't mind adding
> a wrapper to cover this case or even adding an alias for
> 
> #define TRBSR_EL1_BSC_NOT_STOPPED TRBSR_EL1_BSC_NO_ACCESS

I see that Will has already merged the TRBSR_EL1_BSC_* definitions.
For now, we could leave it as they are, but add a comment as
indicated above

Suzuki


> 
> 
> Suzuki
> 
>> +
>>       if (is_trbe_wrap(trbsr))
>>           return TRBE_FAULT_ACT_WRAP;
>>
> 


