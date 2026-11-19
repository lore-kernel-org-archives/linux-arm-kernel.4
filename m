Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C14606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K1zsUX8B;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W3dL3G5G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4IqXSj3dm2+s5MVjtBuWKHIfsSaEZGxTxCweaADY90I=; b=K1zsUX8BvZ/KoM
	4izqLtNLfgujf1S+SHeuM4jSPLAZmWR85ihtsS7T0+Rip7kYlamnT1fzkUqHAvToTYV2tKd3ZjzkD
	nQKwmlqnCzq8WeZfH+poM7dSxK9B9zxQH83A5YrDzefICfbV3sVVrfJ7S4S2nUUThv7XlzsGqPUs1
	b+Pt8Zb36h+pSbJrufzdPAngWQuMDsV83E3c6ItLdmeoCvICQElf7VimsUuy0J0ziXZwbFER0fMC7
	wrlSyxD8vAduux9FgvUdvyqML2k7Tbr9sfKosT6jJU0GSAkWzp1jv8qgDEPD14GAAmsf6p5ORDZiQ
	fnpbTFNO3joQDgsB9EKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU075-0000000Bg3g-2Tju;
	Thu, 19 Nov 2026 11:15:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU073-0000000Bg3K-1v9I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:15:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F2971575;
	Thu, 19 Nov 2026 03:15:29 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8419A3F882;
	Thu, 19 Nov 2026 03:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795086932; bh=FR0/LBnwgDdwhY5rJMJ64mJ7LYoAPI3kvn2qQAB7XBQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W3dL3G5GXhwSGHwELmFZNyBJvD/nh8CqUvTKs4WIeFLtj6a1HN41h//5oUXiwkt7j
	 RRrxC/UvewQVmzTa2YZ8BVkoKPJjCb/Emgoiii9viRiLXXOdhkEs92Q8/eA11BqzeX
	 g2/MX+/bg6DFMFqz/LekYfWGNMOjDbxI3HQ14Au8=
Message-ID: <df0647cd-c874-4fc7-b167-af65edcedd19@arm.com>
Date: Thu, 19 Nov 2026 11:15:28 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and
 show NMI counts
To: Ashok Raj <ashok.raj@oss.qualcomm.com>
Cc: Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Liaochang <liaochang1@huawei.com>,
 Marc Zyngier <maz@kernel.org>, Radu Rendec <radu@rendec.net>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
 <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
 <av0EE35H57DWF1E2@hu-ashoraj-lv.qualcomm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <av0EE35H57DWF1E2@hu-ashoraj-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_031533_599287_F391682A 
X-CRM114-Status: GOOD (  26.34  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ashok,

Sorry for delaying reply... got caught by sorting out Sashiko comments on
FEAT_NMI :) 

On 11/18/26 01:49, Ashok Raj wrote:
> Hi Vladimir
> 
> On Mon, Nov 16, 2026 at 10:38:00AM +0000, Vladimir Murzin wrote:
>> Hi Ashok,
>>
>> On 11/14/26 23:49, Ashok Raj wrote:
>>> request_nmi() currently models NMIs as per-CPU sources. This does not
>>> represent a globally routed NMI source with an affinity-capable irqchip,
>>> which needs to be rerouted when its target CPU is offlined.
>>>
>>> This RFC adds IRQF_NMI_MIGRATABLE as a request_nmi() registration mode
>>> for such a source. It remains excluded from normal IRQ balancing, but the
>>> generic startup and CPU-hotplug paths may select an online target. The
>>> second patch fixes the related /proc/interrupts display: NMI-safe flow
>>> handling updates the per-CPU counters rather than irq_desc::tot_count.
>>>
>>> Patch 1: Add the migratable-NMI registration mode, validate that it is
>>> used only through request_nmi() with an affinity-capable non-per-CPU
>>> irqchip, and add IRQ KUnit coverage for registration and CPU-offline
>>> migration.
>>>
>>> Patch 2: Emit the per-CPU counters for all NMI descriptors, matching
>>> kstat_irqs_desc().
>>>
>>> Testing:
>>>   - ARM64 changed-object builds with WERROR=1
>>>   - ARM64 !SMP changed-object build
>>>   - ARM64 IRQ KUnit run under QEMU with two CPUs, including registration
>>>     validation and CPU-offline migration
>>>   - local downstream GHES delivery and migration validation for the intended
>>>     consumer topology (not part of this series)
>>>
>>> Base and dependencies:
>>>
>>> This RFC was developed and tested on v7.4-rc2 plus the FEAT_NMI v2 series
>>> [1]. It depends on that series' GIC NMI support and is therefore not directly
>>> applicable to mainline or linux-next as posted. This RFC is for design
>>> feedback; it will need rebasing onto the upstream form of those prerequisites
>>> before submission.
>>>
>>> [1] https://lore.kernel.org/linux-arm-kernel/20261112132042.129062-1-vladimir.murzin@arm.com/
>>>
>> I'm not an expert in this area, but based on what I've learned so far,
>> NMI being per-CPU like makes life much easier ;)
>>
>> IIUC, one of the main problems with a shared NMI (as opposed to a
>> per-CPU) is handling shared state. Consider:
>>
>> CPU0                       CPU1                       CPU2
>>
>> ---------------------------------------------------------------------------
>>
>> <NMI>
>> handling started
>>                            set NMI affinity to CPU2
>>                                                       <NMI>
>>                                                       handling started
>> mutate shared state
>>                                                       mutate shared state
>> handling finished
>>                                                       handling finished
>>
>> IOW, the same NMI handler could execute concurrently on two CPUs,
>> potentially corrupting shared state. Once again more than happy to
>> be corrected if I missed something :)
>>
> Thanks, you're right, and I got it wrong in my earlier reply. genirq
> doesn't serialize NMI handlers: handle_fasteoi_nmi() takes no desc->lock
> and sets no IRQD_IRQ_INPROGRESS.
> 

Matches my observation.

> These interrupts are external interrupts in the platform, not Per CPU
> interrupts like the perf kinds. 
> 

Correct, that why I call them per-CPU like :)

> I'm new to the GIC, so I'd like to check an assumption. On GICv3, an
> active SPI isn't signalled again until it is deactivated.
> handle_fasteoi_nmi() calls chip->irq_eoi() only after the handler
> returns. 
> 

Yes.

> So I'm assuming a second CPU can't be sent the same SPI while
> the first CPU is still in the handler.
> 
> Is that a reasonable assumption? 

Perhaps. I'm still trying to understand where is border between what
we can assume and what we must guaranty, especially when it comes to
generic implementation. 

> 
> I didn't quite follow the mutate shared state comment. 
> 

That's generic statement since NMI flow doesn't take locks. I still
need to understand what and why IRQ flow protects with locks and how
it relates to NMI flow... Sorry for making such vague statements!

Ideally, for generic support for global NMIs (opposite to per-CPU,
I do not use term "shared" since it confuses people with IRQ_SHARED
which is not in scope here!) we want requestor just omit IRQF_PERCPU
and the generic flow do the right thing automatically. That requires
enumerating corer cases due to NMI is not per-CPU anymore and providing
measures to either avoid those cases or handle them or likely balance
between both. I'm spending some spare cycles on that, but things go
slowly...

Cheers
Vladimir

> I just interpreted thast as "handler is now called in another CPU" 
> type assumption.
> 
> Cheers,
> Ashok
> 


