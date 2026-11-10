Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2C6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gHdYxxqO;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NBgLUCYw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZxHsaK8/Nc8cB5gd1xWnchJme5sokD+PiLu0QduYwF0=; b=gHdYxxqOaEI/3p
	fUABl/lq7vJ5OJCQnUk+tYIFU5cj0Ow7tKlU7IRk2ncIPtHmPslQyuA7jm1wST9uJBpsY+kpNlAWS
	VWRHtfegT3WXTgvhPQN3Bq54BIB3f1oQfIlZNuSJLEebVyZ25+Z351Nj8dDsetpRnSW/2n05aQPkq
	I3p4/gzX51QUmRohaJB+1irxx0IvrWpm7LQ5uLRCpQfTS9raVHxRj94VENj+4dUOfl3buhLe+BlLq
	mjwf1HWdib+ZmLgTQj5ya8SanU63wTPf1ZQrRgh9VpjGG2bVNK5zsBxmmtDNTwp/e4k0tYGqvZ1T7
	7ExsnxDUTKLCcttHbgbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnij-00000004MI2-0CZG;
	Tue, 10 Nov 2026 15:25:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnif-00000004MGy-2PcQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:25:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 514F01477;
	Tue, 10 Nov 2026 07:25:05 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EB393F85F;
	Tue, 10 Nov 2026 07:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794324308; bh=KyJGfKTqMKWcdpGq28AE4r7i+T5cmpj/njBVE62d1bE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NBgLUCYwVxUQk7+f5b/WN0ZoVuVFBcBpq3nkb/N8ILa0LarygzCPSmM+SmsZ+QfLY
	 P9ODmXUjwKufv2M6yQernOgA9xob4TypGD4z0do69DKUlNNZCfmA1lLDP8htII36Ba
	 MyO7xPuLNSymRfurSDCJhAFBi3R/JT2U0iGe7rZc=
Message-ID: <83fe9c8a-c2d1-4859-b17c-9c350609d1ec@arm.com>
Date: Tue, 10 Nov 2026 15:25:04 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop
 sites
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
 <a79a52db-2361-4303-9d43-87837f349f48@arm.com>
 <20261110084804.GZ9176@e132581.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261110084804.GZ9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_072509_705636_1A04E402 
X-CRM114-Status: GOOD (  15.00  )
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

On 10/11/2026 08:48, Leo Yan wrote:
> On Mon, Nov 09, 2026 at 10:51:30PM +0000, Suzuki K Poulose wrote:
>> On 16/10/2026 17:55, Leo Yan wrote:
>>> TRBSR_EL1 records the status of the buffer that just stopped. Clearing
>>> it in trbe_enable_hw() postpones cleanup until another run starts. If
>>> AUX output cannot restart, for example when AUX space is exhausted,
>>> that clear never executes. Clear the status in arm_trbe_disable()
>>> after disabling TRBE instead.
>>>
>>> trbe_handle_overflow() can start the next run without calling
>>> arm_trbe_disable(). Clear the stopped buffer's syndrome and status bits
>>> while TRBE is disabled, before attempting the AUX restart. This also
>>> leaves the status clean when the restart fails.
>>>
>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>> ---
>>>    drivers/hwtracing/coresight/coresight-trbe.c | 10 +++++++++-
>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
>>> index 26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b..dd9c9330bb0c739795f300dafc6ce34e72fbf280 100644
>>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>>> @@ -655,7 +655,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>>>    	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
>>>    	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
>>>    	WARN_ON(buf->trbe_write >= buf->trbe_limit);
>>> -	clr_trbe_status();
>>
>> TRBSR_ELx is UNKNOWN at reset and if we don't clear it at probe time, we
>> endup running the first session with unknown values. It is safer to
>> clear this at enable_hw.
> 
> This is incorrect. trbe_reset_local() is called locally on each CPU to
> clear TRBSR_ELx, it has been guaranteed when the first session starts.
> 

Ah, you're right. Ignore the noise

Cheers
Suzuki

> Thanks,
> Leo


