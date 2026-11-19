Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F714606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jPdfEMhn;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RTJ0O5zM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=svCkTJmi67bGpyjTeVwrk/HAS7or2C69yn8wnZKfPBM=; b=jPdfEMhn9y+LKc
	IrzKgRFqqCs9AgvMhH7OhYcF92cCa3S1/5pjKsfQ9PUCfS1sEnjUXw8DEOdB+pArjhXtgLn5NK7Uv
	YPdaXWtwd09BpxFVAXfBTnHkBNapbn4hWgG62FH/n7skPzrzP3u8CiBoDcdnoAwqtjaMHN+r9aURB
	UtcniRKCPUmPBo5SAirJqwtK5j+XCAShbHtaE/jOBdVU3x11Pe1jCGnSJDZbhpdUxHMxQWUzsEBVV
	PGcCbMEj7VvaOOtOXWAoz1w9py+hnLJBQH2s06SZITOTqIoSnWWPR7g75sZqWR9noP5MZqRhxY5n6
	3QSVX1XUk1ZObaEL9+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwxh-0000000B6vo-2yKl;
	Thu, 19 Nov 2026 07:53:41 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwxf-0000000B6v3-2EAw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 07:53:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=svCkTJmi67bGpyjTeVwrk/HAS7or2C69yn8wnZKfPBM=;
	b=RTJ0O5zMW6HPvK1dS0HZx3L10zxY1HuHoVLQNdx14WC4rsgm6sifTS2wBV/sAD9VPWj5yPijX
	fEsUBBRADC3768jbOYi0SLo19doEpJjmfHpseZgYm7GOadm8SB32YPe4zYqfQpGle1QBJUycVQi
	KG5i8Mk2I21S77Zsb2IhKYw=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jVW145W43zLlX8;
	Thu, 19 Nov 2026 15:53:12 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E624840563;
	Thu, 19 Nov 2026 15:53:32 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 15:53:32 +0800
Message-ID: <2f42e904-c295-4243-a714-d0767477819b@huawei.com>
Date: Thu, 19 Nov 2026 15:53:31 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] irqchip/gic-v3-its: Size the collection table for all
 possible CPUs
To: Marc Zyngier <maz@kernel.org>, Zenghui Yu <zenghui.yu@linux.dev>
CC: <tglx@kernel.org>, <radu@rendec.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261118025106.623070-1-ruanjinjie@huawei.com>
 <9751bd2c-897c-433c-a4da-5ec420ced322@linux.dev>
 <861p8i12gr.wl-maz@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <861p8i12gr.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_235340_115205_771E6BAD 
X-CRM114-Status: GOOD (  14.43  )
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



在 2026/11/19 1:20, Marc Zyngier 写道:
> On Wed, 18 Nov 2026 16:44:11 +0000,
> Zenghui Yu <zenghui.yu@linux.dev> wrote:
>>
>> On 11/18/26 10:51 AM, Jinjie Ruan wrote:
>>> The collection table is currently sized at a single ITS page size,
>>> and the driver's allocation policy is to allocate a single collection
>>> per CPU. On systems with more CPUs that the ITS can fit in a single
>>> page, no LPI can be routed to the CPUs that don't have an allocated
>>> collection, and the system grinds to a halt.
>>
>> The issue on the reported hardware ("384-CPU HiSilicon HIP12 system", as
>> described in v1) is fixed by allocating 2 pages for the flat collection
>> table. That is fine.
>>
>>>
>>> Change the allocation policy to allow two-level tables, similarly to
>>> the other tables.
>>
>> But I'm afraid that the two-level CT is still not supported: nothing in the
>> driver allocates the level-2 CTs.
> 
> Hmmm. You're are absolutely right.
> 
> It should only be a matter of plugging its_alloc_table_entry() in
> its_alloc_collections() and getting the error handling right (which
> is, I reckon, the hardest part).
>

OK，I Will fix this issue and the AI review issue.

> Thanks,
> 
> 	M.
> 


