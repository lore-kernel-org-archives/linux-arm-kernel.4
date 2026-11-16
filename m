Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC20606A886
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wiSO16vr;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TZPu4u+C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VwpnpBhRmMSKI0pWKFQHlmZtYvCJoVMRGo596WiYEWo=; b=wiSO16vrHjVuni
	ojSa1/trQHL8RtNyr+qJpzXBJNQFc7s76jvTD6E7huxIRZDfIgBWFBGtL3hKsEWDZ5IpNT8/65ly6
	jtQhdV4ApyVG1ohQ4m5rdq6GvCjWJYs1qAby4QPrTNJzjSwP2GMtmMJs5SZUlFLNP4nLKskvr3vVu
	7Amuo5TmnRUKtt45yzA3/UYIhjyE1yMBL2NAZEmu1363YV/AobgYUPLdPaiotHGCmV8K5jUzf5MyB
	cUm68HhzsrS/LBqR6D7T2y3q6Q6LjIJDHNesNYl1k67O4paSH75KHk8+sKep92w6T6fhQ+0XJs2FY
	pueAPnXUA4o5Lp7TxZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwQz-00000002Xx3-2rxz;
	Mon, 16 Nov 2026 13:07:45 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwQw-00000002XwR-2jYD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:07:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VwpnpBhRmMSKI0pWKFQHlmZtYvCJoVMRGo596WiYEWo=;
	b=TZPu4u+CwrAI0oXfFwdHurND/Y2ch+i+krxiREwiYEY5j7QU4xyWu+R/XSumk+5Pc0BicULrI
	g3hAHhQwfsl3ltx7OMfJa3K6EhpFeHHngGjDN+z+dlWhXbSJfkARfFZopOsnyAzqltQAgqfTmqb
	wAkNn63zePTEVYEDIpoCiXY=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jSp6K6pwSzcbMl;
	Mon, 16 Nov 2026 21:06:49 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2303440579;
	Mon, 16 Nov 2026 21:07:39 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 21:07:38 +0800
Message-ID: <8c02e6f7-cc21-42d2-98e0-d5818d10c083@huawei.com>
Date: Mon, 16 Nov 2026 21:07:37 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/gic-v3-its: Size the collection table for all
 possible CPUs
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@kernel.org>, <radu@rendec.net>, <jason@lakedaemon.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261116022330.273840-1-ruanjinjie@huawei.com>
 <86jymd159v.wl-maz@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <86jymd159v.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_050743_289268_AF8FC9C1 
X-CRM114-Status: GOOD (  32.27  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/16 17:42, Marc Zyngier 写道:
> On Mon, 16 Nov 2026 02:23:30 +0000,
> Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
>> The ITS collection table is sized from the hardware default described by
>> GITS_BASER: a single ITS page holding entry-size objects.  With the usual
>> 16-byte collection entry and a 4K ITS page that is 256 collections.
>>
>> its_cpu_init_collections() installs one collection per CPU using MAPC with
>> the CPU number as the collection ID, so on a system with more than 256
>> possible CPUs the MAPC commands for the remaining CPUs fail with
>> E_ITS_MAPC_COLLECTION_OOR (0x010903) and their redistributors end up
>> without a valid collection.  LPIs targeted at those CPUs, which is where
>> managed MSI/MSI-X affinity places a large part of the device interrupts,
>> are then dropped by the hardware: the DMA completes but the completion
>> interrupt never arrives, so drivers fall back to polling and time out.
>>
>> On a 384-CPU HiSilicon HIP12 system running v7.4-rc2 every ITS reported
>>
>>   ITS@0x488000000: allocated 256 Interrupt Collections (flat, esz 16, psz 4K, shr 1)
>>
>> and all four NVMe controllers logged repeated
>>
>>   nvme nvme0: I/O tag 256 (1100) QID 182 timeout, completion polled
>>
>> while the hinic driver failed to probe with -EIO.  With the table sized
>> for num_possible_cpus() it holds 512 entries and both symptoms are gone.
> 
> Please drop all these examples, as they serve absolutely no purpose.
> Everybody understands that losing interrupts is deadly. The whole
> thing is also filled with implementation details that are not really
> relevant, and can be described in a more general way.
> 
>>
>> Handle GITS_BASER_TYPE_COLLECTION in its_alloc_tables() the same way as
>> the device and VCPU tables, requesting order_base_2(num_possible_cpus())
>> IDs.
> 
> Just say something like:
> 
> "The collection table is currently sized at a single ITS page size,
>  and the driver's allocation policy is to allocate a single collection
>  per CPU. On systems with more CPUs that the ITS can fit in a single
>  page, no LPI can be routed to the CPUs that don't have an allocated
>  collection, and the system grinds to a halt.
> 
>  Change the allocation policy to allow two-level tables, similarly to
>  the other tables."
> 
>>
>> Fixes: 1ac19ca6bf97 ("irqchip: GICv3: ITS: tables allocators")
>> Cc: stable@vger.kernel.org
> 
> This is not a fix. This is new feature support for implementation that
> are both very wide and have a stupidly small ITS page size. These

Hi Marc,

Thanks for the review. It is indeed the case.

> systems have *never* worked, and therefore there is nothing to fix.

Yes, this type machine has indeed not been run before, will remove the
fix tag.

> 
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index c952c069f937..319b6edefd37 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -2716,6 +2716,21 @@ static int its_alloc_tables(struct its_node *its)
>>  			indirect = its_parse_indirect_baser(its, baser, &order,
>>  							    ITS_MAX_VPEID_BITS);
>>  			break;
>> +
>> +		case GITS_BASER_TYPE_COLLECTION:
>> +			/*
>> +			 * Size the collection table for every possible CPU.
>> +			 * One collection per CPU is installed via MAPC with
>> +			 * col_id == cpu, so a table sized only for the
>> +			 * hardware default page (e.g. 256 entries with
>> +			 * esz 16 / psz 4K) is too small on systems with more
>> +			 * CPUs than that: MAPC for the remaining CPUs fails
>> +			 * with E_ITS_MAPC_COLLECTION_OOR and LPIs targeted at
>> +			 * those CPUs are never delivered.
>> +			 */
> 
> This comment serves no purpose, and the code says everything that
> needs to be known.

OK, will delete the comment.

> 
>> +			indirect = its_parse_indirect_baser(its, baser, &order,
>> +							    order_base_2(num_possible_cpus()));
>> +			break;
>>  		}
>>  
>>  		err = its_setup_baser(its, baser, cache, shr, order, indirect);
> 
> Finally, it really looks like we could do better, since *all* table
> types are now able to use two-level structures. I'd like to see
> something like the below (untested).

The cleanup looks fine to me, will update the code and retest it.

Thanks again!

Best regards,
Jinjie

> 
> 	M.
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 282e4bafb084f..a058cb8373ef1 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -2682,7 +2682,7 @@ static int its_alloc_tables(struct its_node *its)
>  		u64 val = its_read_baser(its, baser);
>  		u64 type = GITS_BASER_TYPE(val);
>  		bool indirect = false;
> -		u32 order;
> +		u32 order, nr_ids;
>  
>  		if (type == GITS_BASER_TYPE_NONE)
>  			continue;
> @@ -2696,8 +2696,11 @@ static int its_alloc_tables(struct its_node *its)
>  
>  		switch (type) {
>  		case GITS_BASER_TYPE_DEVICE:
> -			indirect = its_parse_indirect_baser(its, baser, &order,
> -							    device_ids(its));
> +			nr_ids = device_ids(its);
> +			break;
> +
> +		case GITS_BASER_TYPE_COLLECTION:
> +			nr_ids = order_base_2(num_possible_cpus());
>  			break;
>  
>  		case GITS_BASER_TYPE_VCPU:
> @@ -2713,11 +2716,11 @@ static int its_alloc_tables(struct its_node *its)
>  				}
>  			}
>  
> -			indirect = its_parse_indirect_baser(its, baser, &order,
> -							    ITS_MAX_VPEID_BITS);
> +			nr_ids = ITS_MAX_VPEID_BITS;
>  			break;
>  		}
>  
> +		indirect = its_parse_indirect_baser(its, baser, &order, nr_ids);
>  		err = its_setup_baser(its, baser, cache, shr, order, indirect);
>  		if (err < 0) {
>  			its_free_tables(its);
> 


