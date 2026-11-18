Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9B9606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4pRISPHu;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mDcMBZ6u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oBaZhfIZKNZSnkGezQQoQRmFPWDP0xuSJkratO6Q5Fc=; b=4pRISPHuSBH+E7
	7KIzjuuYR7STJImVqs+eDOvSONkKBN0a3pdckdoOtmCNWcDF9SZr9i/JLjYH/2LwXyDQjLqWfiLVR
	TtLuo6vW3SfbZPspaFs5Cfxne4PQ3xkrdjt1LarLuCAMrhvRId56xLUBO1TmxbF5/Rye/znnGk+MI
	Gs8ue6T8HxFrW9XO1xiEDMkpt7MwaXJhzYxgacbhrpX02yhAGQT/QF/YLU2WCHxzzy/Kpr21LR21l
	SXIJqa+GrH3uDY21MF+zEYHIaEJ2qwDwuZek1CJ6hJ/PZt5MOV8TCEIX/HuamFmNckn0D/5TJt96P
	yzk/Er+78lijz8x86mzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThds-00000009Jc6-0GTp;
	Wed, 18 Nov 2026 15:32:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThdp-00000009Jat-18wY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:32:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EE631477;
	Wed, 18 Nov 2026 07:32:05 -0800 (PST)
Received: from [10.0.136.98] (M0PRX50XMG.cambridge.arm.com [10.0.136.98])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D29803F632;
	Wed, 18 Nov 2026 07:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795015928; bh=qqsOJXhjc7KGseviJFfoBepAbNPKz5HEgBQK3Rxo5CI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mDcMBZ6uIzblwoex4pmjAZkPte64ymXkD/W8nELo8+8vdiyb5Afcpq9ipXs0zL6Sz
	 aWtPYmrYZAu23cuZjjfdDaEDkrUkYBBPmc2XPmNmu/Vl2fH/JOKTCs6DEc9CWBmgod
	 wOkgTE2G2wYt/nDpukuvtwK5jD8Z3Irp79BzIO8Q=
Message-ID: <5a92090f-cf42-4767-a089-29969aad0a13@arm.com>
Date: Wed, 18 Nov 2026 15:32:05 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] irqchip/gic-v5: Reject SPIs not backed by an IRS
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261104-host_gicv5_fixes-v2-1-e47ad20ea3c8@arm.com>
 <auwxtSfBOeKXC6w_@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <auwxtSfBOeKXC6w_@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_073209_365697_C204FF9D 
X-CRM114-Status: GOOD (  19.75  )
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

On 05/11/2026 07:35, Lorenzo Pieralisi wrote:
> On Wed, Nov 04, 2026 at 05:47:55PM +0000, Sascha Bischoff wrote:
>> It is possible to build a multi-IRS GICv5 system where there are gaps
>> in the global SPI range that are not backed by any IRS. In the current
>> incarnation, this results in dereferencing a null pointer.
>>
>> Reject cases where the firmware attempts to use those SPIs during IRQ
>> allocation by catching the case where there is no chip_data associated
>> with the irq (meaning that there is no IRS to back it). Spit out a
>> warning about broken firmware when this is encountered as it shouldn't
>> be using non-existent SPIs in the first place.
>>
>> Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
>> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> 
> https://docs.kernel.org/process/maintainer-tip.html
> 
> "Ordering of commit tags", if there is a v3.

Have fixed this. I hadn't caught the fact that b4 (re)ordered tags 
differently by default! Thanks for catching it.

> 
> Lorenzo

Thanks,
Sascha

> 
>> ---
>>   drivers/irqchip/irq-gic-v5.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
>> index 8c0303af71e7d..f3cce2bd28cc3 100644
>> --- a/drivers/irqchip/irq-gic-v5.c
>> +++ b/drivers/irqchip/irq-gic-v5.c
>> @@ -727,6 +727,15 @@ static int gicv5_irq_spi_domain_alloc(struct irq_domain *domain, unsigned int vi
>>   
>>   	irqd = irq_desc_get_irq_data(irq_to_desc(virq));
>>   	chip_data = gicv5_irs_lookup_by_spi_id(hwirq);
>> +	/*
>> +	 * The global SPI range may contain IDs not covered by any IRS, i.e., it
>> +	 * may have gaps, in which case there is no IRS to back the SPI. Catch
>> +	 * broken firmware trying to use any of those SPIs.
>> +	 */
>> +	if (!chip_data) {
>> +		pr_warn("Firmware bug! Unimplemented SPI (0x%lx)!\n", hwirq);
>> +		return -EINVAL;
>> +	}
>>   
>>   	irq_domain_set_info(domain, virq, hwirq, &gicv5_spi_irq_chip, chip_data,
>>   			    handle_fasteoi_irq, NULL, NULL);
>>
>> -- 
>> 2.34.1
>>


