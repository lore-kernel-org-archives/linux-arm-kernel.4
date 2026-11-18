Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCB8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 01:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=izBsB3Ke;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=u/7ACChE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cQguqHcFqbJjXdDBuagz/NFuuGbr9y9vn96617/mc4g=; b=izBsB3KesSA8Dl
	VDj9hE3naH7Lm/WULGtwfbIqrKOjlt2zMQBqU+rvOGN2MMg4mMxW9ZQpwY6lVaQQLM69MjjWFgS8C
	Q9ScIEIw8Ate2rbUUqoOhTA2Mzz2Fj+IN1e7Yle30Y2aRkTMGE6V5na8hd2KJuVKsB5l63JtWz/JB
	vada/WBkFQRyND1OkJH/puS5L1QBlJ2xyKMTJkjNqfUtyHVSkROAG5uQEEDA2hLoa55rZOg0j6Z3N
	TGpZQR++yLPfsMm2OrAOD/YIIwG1Qlp7UQYrdeS/iAk8aJukpL5BBPX00nzRy7IQpDOTJlPQCbluO
	EsTkhFLjE/ENMT7Ahvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUob-00000007UBj-1yhz;
	Wed, 18 Nov 2026 01:50:25 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUoX-00000007UAs-1NfU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 01:50:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cQguqHcFqbJjXdDBuagz/NFuuGbr9y9vn96617/mc4g=;
	b=u/7ACChETRGwAhDf2FaS4Izh8qCH4Un+7b2fW9WWOAut94XYhiWrCqfi5cLPosztCmTRpU79w
	fyQKkTyaaBwZ4LzmK2koByCCdD23Jul/qkQKh55PQ5kgTjKCJH3IalRqZ8OiKkhT4Gv6n6aPf+d
	pKOTHebOJwPueXpErlbDZGY=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jTl0W0qSpz1K97r;
	Wed, 18 Nov 2026 09:50:03 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8EFB64055B;
	Wed, 18 Nov 2026 09:50:16 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 09:50:16 +0800
Message-ID: <f3ccfbc9-c84b-4eb0-b8d3-e281ebceafe9@huawei.com>
Date: Wed, 18 Nov 2026 09:50:15 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] irqchip/gic-v3-its: Size the collection table for all
 possible CPUs
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@kernel.org>, <radu@rendec.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261117123116.591621-1-ruanjinjie@huawei.com>
 <87fqwz8amh.wl-maz@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87fqwz8amh.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_175022_071553_BBE14DB4 
X-CRM114-Status: GOOD (  18.61  )
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

Hi Marc,

在 2026/11/18 4:29, Marc Zyngier 写道:
> On Tue, 17 Nov 2026 12:31:16 +0000,
> Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
>> The collection table is currently sized at a single ITS page size,
>> and the driver's allocation policy is to allocate a single collection
>> per CPU. On systems with more CPUs that the ITS can fit in a single
>> page, no LPI can be routed to the CPUs that don't have an allocated
>> collection, and the system grinds to a halt.
>>
>> Change the allocation policy to allow two-level tables, similarly to
>> the other tables.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v1 -> v2:
>> - Cleanup the similar calls of its_parse_indirect_baser() (Marc).
>> - Simplfy the commit message (Marc).
>> - Drop fix tag and comment (Marc).
>> - Give nr_ids a default for unrecognised BASER types.
> 
> At this stage, and given that this is my commit message and my code
> (plus an additional bug of your own doing), you may as well put:
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>

Very happy to do so.

> 
>> ---
>>  drivers/irqchip/irq-gic-v3-its.c | 17 ++++++++++++-----
>>  1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
>> index c952c069f937..41cd359e52a7 100644
>> --- a/drivers/irqchip/irq-gic-v3-its.c
>> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> @@ -2682,7 +2682,7 @@ static int its_alloc_tables(struct its_node *its)
>>  		u64 val = its_read_baser(its, baser);
>>  		u64 type = GITS_BASER_TYPE(val);
>>  		bool indirect = false;
>> -		u32 order;
>> +		u32 order, nr_ids;
>>  
>>  		if (type == GITS_BASER_TYPE_NONE)
>>  			continue;
>> @@ -2696,8 +2696,7 @@ static int its_alloc_tables(struct its_node *its)
>>  
>>  		switch (type) {
>>  		case GITS_BASER_TYPE_DEVICE:
>> -			indirect = its_parse_indirect_baser(its, baser, &order,
>> -							    device_ids(its));
>> +			nr_ids = device_ids(its);
>>  			break;
>>  
>>  		case GITS_BASER_TYPE_VCPU:
>> @@ -2713,11 +2712,19 @@ static int its_alloc_tables(struct its_node *its)
>>  				}
>>  			}
>>  
>> -			indirect = its_parse_indirect_baser(its, baser, &order,
>> -							    ITS_MAX_VPEID_BITS);
>> +			nr_ids = ITS_MAX_VPEID_BITS;
>> +			break;
>> +
>> +		case GITS_BASER_TYPE_COLLECTION:
>> +			nr_ids = order_base_2(num_possible_cpus());
>> +			break;
>> +
>> +		default:
>> +			nr_ids = 0;
> 
> Absolutely not. The above four BASER types are the only ones that are
> allowed by the architecture. Anything else is a HW bug. So no, we're

Yes, according to the GIC architecture specification, a value of 0
indicates Unimplemented, and other values are reserved.

> not silently accepting this. We scream and *abort*.

Thank you for the suggestion, will add an appropriate pr_err info and
then return the error directly.

Best regards,
Jinjie

> 
> 	M.
> 


