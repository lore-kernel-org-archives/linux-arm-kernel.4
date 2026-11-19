Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E858A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 02:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z0vSm5HF;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=XbYInrJ5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MMJaVDLsoSFXWNNXzXeAMhS2vXazG8KBeJxMyu9o2nA=; b=Z0vSm5HFyCGUmE
	vEUwbeiRecT3zDFeo7ZeLzQ6DKDjEq+r45YzlpBIRC7k3cMFl4c6Ma4HRNQXrMnAeYV39Z68hO+/4
	o4Xy9Q6znT9QJd8EAq3JczRaY50gbmejKjt+BWHEb84fft62vHIsseN6oSu5Oh8P8HtkIy4GD3GoR
	nzTmAsC/MkXT8R4zA3qRxSw03Cbe7V1VBA48u7c+Ek427/ug/opxWagpuu93k47hEfz+bBQtvbA14
	8iqrg4712U9qXaxMRZRixhw1GOgqeZAT9wwj36nFPZqnDDJfS8qd2i0bCbRKD/ypubKw44m3wnYtl
	j9BN3ntGTw4pqEK9JuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrxr-0000000Ah6a-2t1P;
	Thu, 19 Nov 2026 02:33:31 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrxn-0000000Ah5Q-1JoP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 02:33:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MMJaVDLsoSFXWNNXzXeAMhS2vXazG8KBeJxMyu9o2nA=;
	b=XbYInrJ58I24nd32iarfHnzum383SKXfhPcXgINj4BkP5ZbJOiKJm4esgw8mwkV2NY2xHEIoh
	pjcCUl39M448cEdRllXwxX7lDXVeebb586ZZw1z+cvgzzdBirvZIsh4WtECGc5+uCcFx1hN3+Td
	WZYsqQTMViwqdkm9mMWagL0=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jVMvf5b3kzmV6t;
	Thu, 19 Nov 2026 10:33:02 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id AA2DB40572;
	Thu, 19 Nov 2026 10:33:22 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 10:33:22 +0800
Message-ID: <ba8c4dc9-de83-42bd-99b9-e97517df2ce8@huawei.com>
Date: Thu, 19 Nov 2026 10:33:21 +0800
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
 <53108dca-1d06-4820-8e7a-86dad2dab569@huawei.com>
 <986b9a9c-078e-4cf1-b809-b606e2892b25@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <986b9a9c-078e-4cf1-b809-b606e2892b25@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_183328_020019_7C2C7CB3 
X-CRM114-Status: GOOD (  28.09  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/18 21:22, Vladimir Murzin 写道:
> Hi Jinjie,

Hi Vladimir,

> 
> On 11/16/26 11:01, Jinjie Ruan wrote:
>>
>> 在 2026/11/16 18:02, Vladimir Murzin 写道:
>>> Hi Jinjie,
>>>
>>> On 11/16/26 06:58, Jinjie Ruan wrote:
>>>> Hi, Vladimir,
>>>>
>>>> While testing this patch set, I discovered IPI as NMI now defaults to
>>>> using SDEI, and the FEAT_NMI cannot cover this path..
>>>>
>>> Can you please expand on that? Sashiko has several comments related to
>>> interaction with SDEI which I'm planing to dig into. However, glancing
>> I mean the following code now prefer sdei nmi now, we can not use FEAT_NMI:
>>
>>  954 void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int
>> exclude_cpu)
>>  955 {
>>  956         /*
>>  957          * Prefer the SDEI cross-CPU NMI provider when active: firmware
>>  958          * dispatches the event out of EL3 and reaches CPUs that have
>>  959          * interrupts locally masked, without the per-IRQ-mask cost
>> that
>>  960          * pseudo-NMI pays for the same reach. The plain IPI path below
>>  961          * can't reach such a CPU unless pseudo-NMI is enabled.
>>  962          */
>>  963         if (sdei_nmi_trigger_cpumask_backtrace(mask, exclude_cpu))
>>  964                 return;
>>  965
>>  966         /*
>>  967          * NOTE: though nmi_trigger_cpumask_backtrace() has "nmi_"
>> in the name,
>>  968          * nothing about it truly needs to be implemented using an
>> NMI, it's
>>  969          * just that it's _allowed_ to work with NMIs. If
>> ipi_should_be_nmi()
>>  970          * returned false our backtrace attempt will just use a
>> regular IPI.
>>  971          */
>>  972         nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
>> arm64_backtrace_ipi);
>>  973 }
>>
>>
> 
> Ahh, I did not notice that. Perhaps we can do something like bellow
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index c4d1aff31258..17da29f4a7ec 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -955,8 +955,24 @@ static void arm64_backtrace_ipi(cpumask_t *mask)
>         arm64_send_ipi(mask, IPI_CPU_BACKTRACE);
>  }
>  
> +static bool arm64_nmi_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
> +{
> +       if (!ipi_is_nmi(smp_processor_id(), IPI_CPU_BACKTRACE))
> +               return false;

This false case should be Pseudo-NMI and IRQ.

> +
> +       nmi_trigger_cpumask_backtrace(mask, exclude_cpu, arm64_backtrace_ipi);
> +
> +       return true;

This is FEAT_NMI

> +}
> +
>  void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
>  {
> +       /*
> +        * Backtrace IPI is NMI, use that.
> +        */
> +       if (arm64_nmi_trigger_cpumask_backtrace(mask, exclude_cpu))
> +               return;
> +
>         /*
>          * Prefer the SDEI cross-CPU NMI provider when active: firmware
>          * dispatches the event out of EL3 and reaches CPUs that have
> 
> 
> So, preference order would be NMI -> SDEI NMI -> IRQ. My understanding that

Based on the motivation of the cross CPU SDEI patch, I guess the order
should be as follows:

FEAT_NMI > SDEI NMI > Pseudo-NMI > IRQ

> users of SDEI NMI do not opt-in for pseudo-NMI so they get what they want, and

My understanding is the same.

> if they do not want FEAT_NMI they can opt-out via id_aa64pfr1.nmi=0.

I believe this situation is relatively rare and does not seem to align
with the original intent of SDEI NMI. In its cover letter, there is the
following statement, and I understand that if hardware supports FEAT_NMI
should be used as the default first priority.

"FEAT_NMI (Armv8.8) -- the architectural fix, but absent from deployed
    silicon and from most of the fleet for years to come."

Link: https://lore.kernel.org/all/cover.1782744912.git.kas@kernel.org/

> 
> If it makes sense to you I'll include it in the series as separate patch.
> 
> Cheers
> Vladimir
> 
>>> over smp_send_stop() IPI as NMI is kind of try and see approach:
>>>
>>>   try normal IPI
>>>   if CPU is still online
>>>     try NMI IPI
>>>   if CPU is still online
>>>    try SDEI NMI
>>>   if CPU is still online
>>>    give up
>>>
>>> So, if NMI IPI did not trigger in your test, I'm really keen on details.
>>>
>>> Thanks
>>> Vladimir
>>
> 


