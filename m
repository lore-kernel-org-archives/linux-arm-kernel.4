Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC059606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kar/xAIX;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uZhWUJiW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3DGi56HMLNIFLBNyoeh83BW+Xx055MiTn+skwng0328=; b=Kar/xAIXDbiedp
	fNqK83ggmBXYphiRD9sjBEPNNw+XcEoNSKU5w3asQ6a0IUKvaJN3SaYy/fRbxyV5GjinIId4mTwPX
	hUhHhOLaPmK/xGswUzJVAHpIN3LFbU3dr985GhzK6lSS92u0cK/M6IXj+lGSyYoBwB0v6SbuLeadX
	ok0RZrcLDG2vaWayEscnom1Lcgrear0oLtSde9kw+6kdx499eajOof1G5ZewJ+CZPqC21dKk7G5Ww
	MDXOD9UPcwsK8qDMT6Ub8+ksVZNF95QnY3psUdwOiHC3By8FAmeDKPTo6x4R2qfqPuQaURT6Mv2hd
	rZI2+/yDVu0GUduQzkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVseW-00000006vSm-47vW;
	Tue, 24 Nov 2026 15:41:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVseP-00000006vRT-0okx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:41:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95EC5339;
	Tue, 24 Nov 2026 07:41:41 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 042FB3F763;
	Tue, 24 Nov 2026 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795534904; bh=MYQzCGwM/6VqgmM4kCbX5dX14lne+B+ab2AMSrnJXm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uZhWUJiW36cqsPqo5/a2BprZ3dtoaLvAULpErT+33bmXJ09qyDkEBCk0Cf3xwXt16
	 ZHZ8ioV/s1oB5cMfYqa5QpIxA2UMibImXNDGqEoPHB2r6tvQEd0Zog2HB3A9Y3CrT0
	 LJfaE01plWabPoyWobZcZWg9KdwN6a2TCM3TolzA=
Message-ID: <2aad1921-9227-437a-b298-798ec1841421@arm.com>
Date: Tue, 24 Nov 2026 15:41:41 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: perf: End AUX output when an event is
 throttled
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Vlad Poenaru <vlad.wing@gmail.com>, Amir Ayupov <aaupov@fb.com>,
 Suyash Mahar <smahar@meta.com>, Song Liu <song@kernel.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
 <09e172d0-3ef5-44ef-a966-7db3b8a4af9a@arm.com>
 <20261124153508.GA7209@e132581.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261124153508.GA7209@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_074145_959089_39E93BF7 
X-CRM114-Status: GOOD (  15.12  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 15:35, Leo Yan wrote:
> On Tue, Nov 24, 2026 at 01:06:04PM +0000, Suzuki K Poulose wrote:
> 
>>> Check AUX handle ownership before updating the buffer or ending AUX
>>> output. Drop the post-update check because the full stop runs with
>>> local IRQs disabled, which prevents the TRBE IRQ from closing the
>>> handle during the stop.
> 
> ...
> 
>>> +	if (mode & PERF_EF_UPDATE) {
>>>    		/* update trace information */
>>> -		if (!sink_ops(sink)->update_buffer)
>>> -			return;
>>> -
>>> -		size = sink_ops(sink)->update_buffer(sink, handle,
>>> -					      event_data->snk_config);
>>> -		/*
>>> -		 * Make sure the handle is still valid as the
>>> -		 * sink could have closed it from an IRQ.
>>> -		 * The sink driver must handle the race with
>>> -		 * update_buffer() and IRQ. Thus either we
>>> -		 * should get a valid handle and valid size
>>> -		 * (which may be 0).
>>> -		 *
>>> -		 * But we should never get a non-zero size with
>>> -		 * an invalid handle.
>>> -		 */
>>> -		if (READ_ONCE(handle->event))
>>> -			perf_aux_output_end(handle, size);
>>> -		else
>>> -			WARN_ON(size);
>>> +		if (sink_ops(sink)->update_buffer)
>>> +			size = sink_ops(sink)->update_buffer(sink, handle,
>>> +							     event_data->snk_config);
>>
>> Could we retain the READ_ONCE() check to handle the TRBE case here ? This
>> looks like introducing a regression. Something like :
>>
>> 		if (!READ_ONCE(handle->event)) {
>> 			WARN_ON(size);
>> 			goto out;
>> 		}
>>
>>
>>>    	}
>>
>>
>> Otherwise looks good to me
> 
> etm_event_stop() runs with local IRQ disabled, so the TRBE IRQ handler
> cannot close the AUX handle during the stop. If the handler closed it
> earlier, the ownership check before update_buffer() catches that case.
> 
> The second READ_ONCE(handle->event) check is redundant and is safe to
> be removed.

Of course, yes. agreed. Thanks for the clarification

Cheers
Suzuki

> 
> Thanks,
> Leo


