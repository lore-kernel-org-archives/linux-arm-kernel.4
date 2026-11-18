Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EB0606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EFASILNf;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nbue+L6Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7IppRNZQZPKE5JOmbNPM4dvk9GR0u/NOcKD5OeGwzn0=; b=EFASILNfZysV93
	b+hglYbJjWt8cJRXTcqpPzyAy/eKO3npmUuDGhVUhu1hT/BkSgNg3SYkWZzw/+LCX/ZSCpNRw0z3Q
	0b1AtJ8lAVxkT1pJsJCOOMXCCZqvDKaPCMYKjWLj6Hr9M5w//gGithUZ2ze5R8jGDtWe28Wh7kHPn
	RMklABPYWm3Z4crSlxztnoTEQlBHis4b+f1Avfmt/Diuxjhl8OPLvWnh4oTrRXYfjy42vg2wF1NjA
	KNmCI54OVVkV++w1Gkmg12VOTI8SAtP+FSfEbLwZBPbLptwMdf5aRGBVlQ5wdvW8u61HlfdH3KgOk
	Uwm/v2508y+WtcZB6YuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfcS-00000008w2V-0mHY;
	Wed, 18 Nov 2026 13:22:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfcP-00000008w1p-2S1m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:22:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EF60339;
	Wed, 18 Nov 2026 05:22:29 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A6103F673;
	Wed, 18 Nov 2026 05:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795008152; bh=AdYZP7nh8H8nJc09gzekRloQEZNhRw7gpLUzt4VzRsA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nbue+L6QhWvEaaysvYRXcfiBAP2L+5L5/UT373kovb2ONBljqVFviKnuGiEI/P/fP
	 i46VaP2Wb9K4pROG2Nva2Jl4vrIeqLGpFFa6Aj/BQXRI0XRYr22oKGoERzcRAXyR8w
	 2nayrJDAHpubyvGLLCfOObl0zE5WXp3RjXBSb2+g=
Message-ID: <986b9a9c-078e-4cf1-b809-b606e2892b25@arm.com>
Date: Wed, 18 Nov 2026 13:22:28 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/39] arm64: Add support for FEAT_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com,
 maz@kernel.org
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <c5b915dd-8926-4c97-836c-2616bb314262@huawei.com>
 <1489791e-b205-44fb-ac77-f2525b20fafb@arm.com>
 <53108dca-1d06-4820-8e7a-86dad2dab569@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <53108dca-1d06-4820-8e7a-86dad2dab569@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_052233_735497_27E0CBD2 
X-CRM114-Status: GOOD (  20.93  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinjie,

On 11/16/26 11:01, Jinjie Ruan wrote:
> 
> 在 2026/11/16 18:02, Vladimir Murzin 写道:
>> Hi Jinjie,
>>
>> On 11/16/26 06:58, Jinjie Ruan wrote:
>>> Hi, Vladimir,
>>>
>>> While testing this patch set, I discovered IPI as NMI now defaults to
>>> using SDEI, and the FEAT_NMI cannot cover this path..
>>>
>> Can you please expand on that? Sashiko has several comments related to
>> interaction with SDEI which I'm planing to dig into. However, glancing
> I mean the following code now prefer sdei nmi now, we can not use FEAT_NMI:
> 
>  954 void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int
> exclude_cpu)
>  955 {
>  956         /*
>  957          * Prefer the SDEI cross-CPU NMI provider when active: firmware
>  958          * dispatches the event out of EL3 and reaches CPUs that have
>  959          * interrupts locally masked, without the per-IRQ-mask cost
> that
>  960          * pseudo-NMI pays for the same reach. The plain IPI path below
>  961          * can't reach such a CPU unless pseudo-NMI is enabled.
>  962          */
>  963         if (sdei_nmi_trigger_cpumask_backtrace(mask, exclude_cpu))
>  964                 return;
>  965
>  966         /*
>  967          * NOTE: though nmi_trigger_cpumask_backtrace() has "nmi_"
> in the name,
>  968          * nothing about it truly needs to be implemented using an
> NMI, it's
>  969          * just that it's _allowed_ to work with NMIs. If
> ipi_should_be_nmi()
>  970          * returned false our backtrace attempt will just use a
> regular IPI.
>  971          */
>  972         nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
> arm64_backtrace_ipi);
>  973 }
> 
> 

Ahh, I did not notice that. Perhaps we can do something like bellow

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index c4d1aff31258..17da29f4a7ec 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -955,8 +955,24 @@ static void arm64_backtrace_ipi(cpumask_t *mask)
        arm64_send_ipi(mask, IPI_CPU_BACKTRACE);
 }
 
+static bool arm64_nmi_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
+{
+       if (!ipi_is_nmi(smp_processor_id(), IPI_CPU_BACKTRACE))
+               return false;
+
+       nmi_trigger_cpumask_backtrace(mask, exclude_cpu, arm64_backtrace_ipi);
+
+       return true;
+}
+
 void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
 {
+       /*
+        * Backtrace IPI is NMI, use that.
+        */
+       if (arm64_nmi_trigger_cpumask_backtrace(mask, exclude_cpu))
+               return;
+
        /*
         * Prefer the SDEI cross-CPU NMI provider when active: firmware
         * dispatches the event out of EL3 and reaches CPUs that have


So, preference order would be NMI -> SDEI NMI -> IRQ. My understanding that
users of SDEI NMI do not opt-in for pseudo-NMI so they get what they want, and
if they do not want FEAT_NMI they can opt-out via id_aa64pfr1.nmi=0.

If it makes sense to you I'll include it in the series as separate patch.

Cheers
Vladimir

>> over smp_send_stop() IPI as NMI is kind of try and see approach:
>>
>>   try normal IPI
>>   if CPU is still online
>>     try NMI IPI
>>   if CPU is still online
>>    try SDEI NMI
>>   if CPU is still online
>>    give up
>>
>> So, if NMI IPI did not trigger in your test, I'm really keen on details.
>>
>> Thanks
>> Vladimir
> 


