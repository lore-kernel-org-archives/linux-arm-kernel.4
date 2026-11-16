Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5F7606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DM8+HFzX;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=to6GusNw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FqB46Sygplls8fTrDb/2e/PGKgRwFdM3QthuwA9pmWk=; b=DM8+HFzXcgsz8+
	tTNDU26SU+0kDCTkwl71y73KYIfa7mg6SYsaR3ZLV/5ZR5UHkkVtj4iJI3zF0QYfq9BzhKcqhnihH
	FE4zo1whFO3QwY46CYuc/mJ8uR8ht8MmyR6HpIMAYGWOs2J/1agEeBeHeE1W22l3KTbci+SUQGIQH
	rfN1hgHfc/HuThfbsWXwckKP6vk1SAIdST/4TVT2YTwExFS3+9ONfE4NkY1QhB6uvrfcsh1qwuATk
	NiQPDCA6w8vfuqIZQzj1r/RemtTG0mlF38KaxS4AXC4SqsZxTS6tpRwvwlRLOU8NGUPFG9mV6c8Xf
	qHyfeTLJXbmJH7YBZNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuSr-000000023x1-3VyA;
	Mon, 16 Nov 2026 11:01:34 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuSm-000000023tO-0UuH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:01:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FqB46Sygplls8fTrDb/2e/PGKgRwFdM3QthuwA9pmWk=;
	b=to6GusNwYn6qEpRYJltBkYHYI5+GUOCu6ZRHhJ3KEBvb7mMbqOazUlTqbiwU9ftm2uVbn1JF2
	5cJUGDJomIqGmbefgEFBdpPGOLIGETEHP8RzIGSoN6qfYi7WhaHdq/pR/m13vC3+DUtpelwprZg
	RBjhE6s/g6q7MCjMQ8E0GmQ=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jSlKB72GLzLlTW;
	Mon, 16 Nov 2026 19:01:02 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 56D1140565;
	Mon, 16 Nov 2026 19:01:21 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 19:01:20 +0800
Message-ID: <53108dca-1d06-4820-8e7a-86dad2dab569@huawei.com>
Date: Mon, 16 Nov 2026 19:01:20 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/39] arm64: Add support for FEAT_NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<lpieralisi@kernel.org>, <liaochang1@huawei.com>,
	<ashok.raj@oss.qualcomm.com>, <maz@kernel.org>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <c5b915dd-8926-4c97-836c-2616bb314262@huawei.com>
 <1489791e-b205-44fb-ac77-f2525b20fafb@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <1489791e-b205-44fb-ac77-f2525b20fafb@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_030128_580668_15E7C910 
X-CRM114-Status: GOOD (  11.88  )
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



在 2026/11/16 18:02, Vladimir Murzin 写道:
> Hi Jinjie,
> 
> On 11/16/26 06:58, Jinjie Ruan wrote:
>> Hi, Vladimir,
>>
>> While testing this patch set, I discovered IPI as NMI now defaults to
>> using SDEI, and the FEAT_NMI cannot cover this path..
>>
> 
> Can you please expand on that? Sashiko has several comments related to
> interaction with SDEI which I'm planing to dig into. However, glancing

I mean the following code now prefer sdei nmi now, we can not use FEAT_NMI:

 954 void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int
exclude_cpu)
 955 {
 956         /*
 957          * Prefer the SDEI cross-CPU NMI provider when active: firmware
 958          * dispatches the event out of EL3 and reaches CPUs that have
 959          * interrupts locally masked, without the per-IRQ-mask cost
that
 960          * pseudo-NMI pays for the same reach. The plain IPI path below
 961          * can't reach such a CPU unless pseudo-NMI is enabled.
 962          */
 963         if (sdei_nmi_trigger_cpumask_backtrace(mask, exclude_cpu))
 964                 return;
 965
 966         /*
 967          * NOTE: though nmi_trigger_cpumask_backtrace() has "nmi_"
in the name,
 968          * nothing about it truly needs to be implemented using an
NMI, it's
 969          * just that it's _allowed_ to work with NMIs. If
ipi_should_be_nmi()
 970          * returned false our backtrace attempt will just use a
regular IPI.
 971          */
 972         nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
arm64_backtrace_ipi);
 973 }


> over smp_send_stop() IPI as NMI is kind of try and see approach:
> 
>   try normal IPI
>   if CPU is still online
>     try NMI IPI
>   if CPU is still online
>    try SDEI NMI
>   if CPU is still online
>    give up
> 
> So, if NMI IPI did not trigger in your test, I'm really keen on details.
> 
> Thanks
> Vladimir


