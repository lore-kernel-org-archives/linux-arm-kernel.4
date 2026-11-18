Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oG9MbD5M;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mY74Bsms
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dvQKDptWWm8R0eb9TuCYWY1w87VP0C5dY/jzQ1Uh4ks=; b=oG9MbD5MIiyJ3Q
	OmJU2kZ5+Bb+GEjf0SvJ6a/AMyiZAmFHo+AWvnWcrNvcplm0e3OCQedMC9hdSEmde/eELjXVcAV0p
	cy6R83jCYw1d/7DXOlA2ENkpqSCm/PTDnYMvy5p7peybdfO1Zkm1tcKaK+BuVWWSnNE91XIsdhUe4
	jbhvVmKIX1myFBy0Ka2GKpBGrKB6YP67u/X9mA9irXc3ud7zytl2RgwUm9HznRu7i7og7PQHu0RoF
	UC5GzyPsfUGGmRo3BvxSo+pwtCL+Fe4NnWIwzFwcbsEGaGCw+WccVplfi5vzGTL/MAoWr4GQY/A5U
	5rtnRSxXs9ZbYQnHBJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTilk-00000009YsV-0o7l;
	Wed, 18 Nov 2026 16:44:24 +0000
Received: from out-225.mta1.migadu.com ([95.215.58.225] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTilh-00000009Yra-0haX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:44:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4mYkAbmJ50bqRecl7WhLUagLCIRRi22IPvNzPbrs644=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795020257; v=1; x=1795625057;
 b=mY74BsmsBP1fmTeK9MELFapEviFdKYTZXA8wUSH0YFl5T0h1M3jgCvb3bV0r6vgjKEfp6QqP
 6Y5RhFfBnTSks18AA58/5alb0Ly68NeZEXq3msPagi/zaQ/ZXSZOQF4hsDBAKT2IOjS5oYUydaw
 vbZ17hjw8EybVBxq6WPe6zJo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5f1217d9bb73e6af;
	Wed, 18 Nov 2026 16:44:17 +0000
X-Mizu-Trace-ID: 5f1217d9bb73e6af
X-Migadu-Flow: FLOW_OUT
Message-ID: <9751bd2c-897c-433c-a4da-5ec420ced322@linux.dev>
Date: Thu, 19 Nov 2026 00:44:11 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] irqchip/gic-v3-its: Size the collection table for all
 possible CPUs
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20261118025106.623070-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
Cc: maz@kernel.org, tglx@kernel.org, radu@rendec.net,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118025106.623070-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_084421_351936_5DEC9A87 
X-CRM114-Status: GOOD (  10.67  )
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

On 11/18/26 10:51 AM, Jinjie Ruan wrote:
> The collection table is currently sized at a single ITS page size,
> and the driver's allocation policy is to allocate a single collection
> per CPU. On systems with more CPUs that the ITS can fit in a single
> page, no LPI can be routed to the CPUs that don't have an allocated
> collection, and the system grinds to a halt.

The issue on the reported hardware ("384-CPU HiSilicon HIP12 system", as
described in v1) is fixed by allocating 2 pages for the flat collection
table. That is fine.

> 
> Change the allocation policy to allow two-level tables, similarly to
> the other tables.

But I'm afraid that the two-level CT is still not supported: nothing in the
driver allocates the level-2 CTs.

Thanks,
Zenghui

