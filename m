Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93F2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F7Bn61fx;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mmw3a4X8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fJM+8VYiKunDlqrEgZNiUmhDi25LVlsUi9ngP7vcUpE=; b=F7Bn61fxDmL2j+
	zbuKxrHladLXdu3hNhVzyosCV8PkwKVAQRAJd+fEmBm8l3IZ9gtWsHtoNfnlIDs3Rl47kumLzB9Eh
	t4FVZ+DwtLGqwwt4vWXQBrzd/k74WrjQL70RG2zmsD+o7RLn8bHYlwXQRUJRyMbwd1Y4xHYKkVs8e
	LKBZ2MiCjX/pYmIHbachyS2z56sx8MjuggbvBhEy1BMWHcHhiDEindQBgW3KVdrVxGn7m/sFatywO
	Lli/ClrVZ9Aoccw0WL+GtwwDTyv/W9gKJWEQtv7c6kAlNbMVu5lOmVpRPJjEtB1nG1zGhECcHw9Zl
	Igq55NWAjhXa+cWEb5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDZR-0000000A5Uq-2IVh;
	Wed, 25 Nov 2026 14:02:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDZP-0000000A5UM-2aUd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:02:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17B431762;
	Wed, 25 Nov 2026 06:01:55 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AC373F86F;
	Wed, 25 Nov 2026 06:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795615317; bh=QXNjIvjxmoOqxBNbeshCfrCK90NGNd17TBaU3oKqyns=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mmw3a4X8n1OOB+tRfnOGaB0Pg8jLA6Gk5cgrgdSuF+upYhLmf8HbTTBkC1HK5WrnO
	 0ve8KylB00bgcXt0fIjpUjrdRbVPVP3F22AZzFfO73g2FPIc6BKTmMUAKXV7bnmfWy
	 Bu45MO8uOOdPoSRBFZJkdULlazwbMclnBIeYoiz4=
Message-ID: <aa7d7e97-c0b1-42d4-b885-694195edf46e@arm.com>
Date: Wed, 25 Nov 2026 14:01:55 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] irqchip/gic-v5: Retain the ITT when device
 invalidation times out
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-12-13c1859e8aa3@arm.com>
 <av7PQ4iniwWC9goF@red-moon>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <av7PQ4iniwWC9goF@red-moon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_060159_776264_C0BA073E 
X-CRM114-Status: GOOD (  17.90  )
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

On 19/11/2026 10:28, Lorenzo Pieralisi wrote:
> On Wed, Nov 18, 2026 at 05:35:41PM +0000, Sascha Bischoff wrote:
>> Device registration publishes a DTE pointing to the new ITT before
>> invalidating the ITS device cache. If invalidation times out, clearing
>> the DTE in memory does not guarantee that the ITS has discarded a
>> cached reference to the ITT, and hence the hardware could still try
>> and access the memory. Freeing the ITT on that path can therefore
>> leave the ITS accessing memory that has been reallocated.
>>
>> Device teardown has the same problem: it frees the ITT even when the
>> invalidation issued after clearing the DTE fails to complete in the
>> specified timeout.
>>
>> Retain the ITT on either failure path. Continue returning the
>> invalidation error, and free the ITT during teardown only after
>> successful completion. This deliberately retains memory on hardware
>> failure because a timeout does not cancel the operation or establish
>> that cached references are gone.
>>
>> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
>> Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
>> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
>> Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
>> ---
>>   drivers/irqchip/irq-gic-v5-its.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
>> index db13011ef6d93..cfa86aa68bf3c 100644
>> --- a/drivers/irqchip/irq-gic-v5-its.c
>> +++ b/drivers/irqchip/irq-gic-v5-its.c
>> @@ -540,8 +540,8 @@ static int gicv5_its_device_register(struct gicv5_its_chip_data *its,
>>   
>>   	ret = gicv5_its_device_cache_inv(its, its_dev);
>>   	if (ret) {
>> +		/* The ITS may still have a cached reference to the ITT. */
>>   		its_write_table_entry(its, dte, 0);
>> -		gicv5_its_free_itt(its_dev);
>>   		return ret;
>>   	}
>>   
>> @@ -570,7 +570,9 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
>>   	its_write_table_entry(its, dte, 0);
>>   
>>   	ret = gicv5_its_device_cache_inv(its, its_dev);
>> -	gicv5_its_free_itt(its_dev);
>> +	/* Only release the ITT once the ITS has discarded its references. */
>> +	if (!ret)
>> +		gicv5_its_free_itt(its_dev);
> 
> 	if (ret)
> 		return ret;
> 	
> 	gicv5_its_free_itt(its_dev);
> 
> 	return 0;

Done, thanks! Definitely neater.

> 
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 
>>   
>>   	return ret;
>>   }
>>
>> -- 
>> 2.34.1
>>


