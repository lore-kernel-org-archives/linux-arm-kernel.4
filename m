Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB5E606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nRStrXBG;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hSU9vXMZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TTOWgexBBg/MVW0b5stJBvTCU1KsO22oMvb+9fg5rIs=; b=nRStrXBGZJ/gTf
	ONvK4NDpEXArQCGgecTIuyIZkLREeSLHyBIXmTIhBNDEWex5nQEgi6lYGGyHKJNPeMJ7UMKyD+RUu
	u/4eRPIEcnbj3JyWR/dj01VomyOacg7SOwBGbW/xA+aRqomj4PdFHgK7DAVlBq4y2sYR40DYkjkYa
	+l9FRFyxa28346ZM3/COKgReaQ3/qsqDxR4xnPo08V3xVjFLnrtUPzrEvMNq1Bpj3TFulzZlnYi8o
	RDqms5z6AdPw/EsWPXA16hJpaYMTXxq+HCT84Acxt8rY2TeVrIy5row/kdH7xyYRD1JXMJlp4/DvH
	jh7OJ+l/ypLVdnWearpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThgX-00000009K4Q-2JfK;
	Wed, 18 Nov 2026 15:34:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThgU-00000009K3y-0dpB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:34:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 413EB1477;
	Wed, 18 Nov 2026 07:34:49 -0800 (PST)
Received: from [10.0.136.98] (M0PRX50XMG.cambridge.arm.com [10.0.136.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CB6A3F632;
	Wed, 18 Nov 2026 07:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795016092; bh=2BBJ1suAnTPS6/YPDbka46qhf9/+FM2sALeGOYTfwRA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hSU9vXMZlJnCa4XqPjRCwtNV6uXMCZHpWp9OKCcFMpV7fWDhrfoyYtFhu1M6433SY
	 G7gYi9FjVVcyW1m9pIV+m0RUlTPgepTX56bUP9dqB7zppCyHf8RXxFFtu12K0w3XSk
	 xk9aMeyZ0i6KN2KAzzRfQ3jIwicqPxkatRa3vP94=
Message-ID: <71b9323b-902f-4bf9-9cbf-6d0d90ee7ca0@arm.com>
Date: Wed, 18 Nov 2026 15:34:48 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] irqchip/gic-v5: Serialise IRS synchronisation
 requests
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <Timothy.Hayes@arm.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261104-host_gicv5_fixes-v2-3-e47ad20ea3c8@arm.com>
 <auw0ulR3wrsKVcYe@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <auw0ulR3wrsKVcYe@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_073454_277686_11483425 
X-CRM114-Status: GOOD (  20.50  )
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

On 05/11/2026 07:48, Lorenzo Pieralisi wrote:
> [Remove stable from the CC email recipient list, leave it only in the log]

Noted, and thanks. Hadn't caught that had been added in from CC. Will 
omit henceforth!

> 
> On Wed, Nov 04, 2026 at 05:47:57PM +0000, Sascha Bischoff wrote:
>> IRS_SYNCR writes are ignored while IRS_SYNC_STATUSR.IDLE is clear.
>> Calls to gicv5_irs_syncr() for different IRQs can overlap, allowing
> 
> Nit: gicv5_irs_syncr() has no notion of specific IRQs, this is
> misleading.
> 
>> the second request to be dropped. Its caller can then observe the
>> first request completing and assume that its own events have been
>> processed.
>>
>> With GICv5 ITS KVM support, gicv5_irs_syncr() is also called while
>> restoring the host ITTE in gicv5_its_set_vcpu_affinity(). The callback
>> runs under the IRQ descriptor lock via irq_set_vcpu_affinity(), so it
>> cannot sleep.
> 
> Technically we are talking about a use case that does not exist yet.
> 
> I understand it is churn to fix it first and change it again later,
> I would just say that gicv5_irs_syncr() might need to be called in atomic
> context.

I've reworked this commit message to make it clearer.

Thanks,
Sascha

> 
>> Serialise the request and completion poll with a raw spinlock, and use
>> atomic polling because the synchronisation runs while holding the IRQ
>> descriptor lock.
>>
>> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> ---
>>   drivers/irqchip/irq-gic-v5-irs.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
>> index 4edf787f3f97f..ead76560ea08f 100644
>> --- a/drivers/irqchip/irq-gic-v5-irs.c
>> +++ b/drivers/irqchip/irq-gic-v5-irs.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/log2.h>
>>   #include <linux/of.h>
>>   #include <linux/of_address.h>
>> +#include <linux/spinlock.h>
>>   
>>   #include <linux/irqchip.h>
>>   #include <linux/irqchip/arm-gic-v5.h>
>> @@ -22,6 +23,8 @@
>>   #define LPI_ID_BITS_LINEAR		12
>>   
>>   static DEFINE_PER_CPU_READ_MOSTLY(struct gicv5_irs_chip_data *, per_cpu_irs_data);
>> +/* Synchronization requests must not overlap in an IRS Domain. */
>> +static DEFINE_RAW_SPINLOCK(irs_sync_lock);
>>   static LIST_HEAD(irs_nodes);
>>   
>>   static u32 irs_readl_relaxed(struct gicv5_irs_chip_data *irs_data,
>> @@ -507,10 +510,11 @@ void gicv5_irs_syncr(void)
>>   		return;
>>   
>>   	syncr = FIELD_PREP(GICV5_IRS_SYNCR_SYNC, 1);
>> +	guard(raw_spinlock_irqsave)(&irs_sync_lock);
>>   	irs_writel_relaxed(irs_data, syncr, GICV5_IRS_SYNCR);
>>   
>> -	gicv5_wait_for_op(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
>> -			  GICV5_IRS_SYNC_STATUSR_IDLE);
>> +	gicv5_wait_for_op_atomic(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
>> +				 GICV5_IRS_SYNC_STATUSR_IDLE, NULL);
>>   }
> 
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 
>>   
>>   int gicv5_irs_register_cpu(int cpuid)
>>
>> -- 
>> 2.34.1
>>


