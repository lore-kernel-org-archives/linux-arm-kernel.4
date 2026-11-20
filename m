Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE1F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 02:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y8q+PO1X;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=HJkI5xYd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iXvbhvf/jLHIJp2L2WsNxKPuNBLVG+ifORVIg/6c1wg=; b=y8q+PO1X845XyRXFWc4R5iWUze
	IkeBAJPTG8THjftH0Vk75nkZI+m4RconSjNUA/s+ILthXQl+N0HnGvFO+8DCP2O3yyNKUBlk7jUrN
	UwVAqFijpQmrBE1pHSY9zd2IZ640JoYjd0P/IKi5wJfUD1fWgoVW8fEEGypbn05M4pzKT7rGQCnY3
	Br9wjMQk+qzaRL3vJKxVXbfYTdwfbIHiApQRXZcDmxBgk8t0QFFezlmw28D9RcBcZgdF8zucVDyKf
	P1kuxIl+ITQllbyGQahJsheJYz+89SarPffEluR3sXBK3o+YyzFCOj67HWGx+6423uFldV7+o2OFF
	XYrQlcRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUE6b-0000000Drzj-2G4J;
	Fri, 20 Nov 2026 02:12:01 +0000
Received: from [113.46.200.226] (helo=canpmsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUE6X-0000000DrzG-1aMR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 02:12:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iXvbhvf/jLHIJp2L2WsNxKPuNBLVG+ifORVIg/6c1wg=;
	b=HJkI5xYdkUb2gkxU3CTXgyJm92f0Ef1lCf7kAcgXA9toFzFotG/PamzZDJyDg6A6ajsOPN9kD
	ombmclXhe1Etfg6L39ernge7mQqeMabxTbPJeWdtVUH4D6x1AXrBdQc3qFMRshTSQ3P245MboB+
	xv+GWuBUqoJoCBFOGpyRXPw=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jVzN76grzzKm50;
	Fri, 20 Nov 2026 10:11:19 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5CDD04057A;
	Fri, 20 Nov 2026 10:11:35 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 10:11:34 +0800
Message-ID: <3ca9a2a6-88f1-43c5-af5a-2773aa70b444@huawei.com>
Date: Fri, 20 Nov 2026 10:11:33 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/39] arm64: Add support for FEAT_NMI
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Vladimir Murzin
	<vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <58a4c350-539d-49ca-826f-d19563895a29@huawei.com>
 <17149b32-6b9c-4364-b664-5789f0633e9d@huawei.com>
 <57757469-2545-4fc6-a7be-ccc133555052@arm.com>
 <38d04e8b-2f31-4616-8a8e-2747c7ce114d@huawei.com>
 <d4bb2979-4bc2-436c-8f4a-c9a5decea900@arm.com>
 <av8bByU93_nCbPqE@shutemov.name>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <av8bByU93_nCbPqE@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_181158_086227_0C69C743 
X-CRM114-Status: GOOD (  33.29  )
X-Spam-Score: -1.3 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, maz@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kiryl,

在 2026/11/20 0:07, Kiryl Shutsemau (Meta) 写道:
> On Thu, Nov 19, 2026 at 02:50:50PM +0000, Vladimir Murzin wrote:
>> Any chance you can attach debugger or collect traces so we know what those
>> CPUs are doing?
> 
> I think they are idle with SDEI masked when the broadcast lands, and
> the firmware leaves them unable to take interrupts.

You are completely right, I verified that it was true.

> 
> A CPU entering a power-down idle state masks SDEI from the cpu_pm
> notifier. If event 0 lands on it while it is masked, TF-A's
> handle_masked_trigger() returns for event 0 without EOI:
> 
>     CPU A                           CPU B (power-down idle)
>                                     cpu_pm_enter()
>                                       sdei_mask_local_cpu()
>     sdei_nmi_raise_backtrace()
>       SDEI_EVENT_SIGNAL(0, CPU B)
>                                     EL3: sdei_intr_handler()
>                                       acknowledge the SGI
>                                       handle_masked_trigger()
>                                         // event 0: return, no EOI
>                                     cpu_pm_exit()
>                                       sdei_unmask_local_cpu()
> 
> The SGI stays active, so CPU B runs at the SDEI priority from then on:
> no Non-secure interrupts and no more event 0. Other CPUs then hang in
> csd_lock_wait() on their next synchronous cross-call to it.
> 
> I reproduced it on QEMU with TF-A v2.15 minus the check described below.
> 
> After event 0 lands on a masked CPU, ICC_RPR_EL1 there reads 0 and stays
> 0 after SDEI_PE_UNMASK, and RCU reports "1-...!: ... idle=c078/0/0x0 ...
> (false positive?)" as in Jinjie's rc3 log. With an EOI added on that
> path, the same test passes.
> 
> That path has been in TF-A since the SDEI dispatcher was added and is
> still in master. TF-A v2.13 made SDEI_EVENT_SIGNAL refuse a masked
> target, which leaves only a race with a target that masks after the
> check.
> 
> A fix is under review:
> 
>   https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55414
> 

Sorry, I seem unable to open this link.

> Jinjie, what is your firmware based on?

Sorry, unable to provide the TF-A version — this machine reports its own
HiSilicon firmware.

> 
> Two checks would confirm it:
> 
>   - does dmesg show "SDEI_EVENT_SIGNAL to CPU N failed" after the
>     sysrq-l? None means the firmware accepted the signals to masked
>     CPUs;

Zero. two logs are 0 (rc3 + rc2). The firmware returns success for all
targets, including the masked CPU.

> 
>   - does the broadcast work with cpuidle.off=1? Without power-down idle
>     nothing masks SDEI, so all CPUs should answer.

Yes. Instead of restarting and modifying the cmdline, I turned off
state1 for all 384 CPUs during runtime (leaving only WFI). The same echo
  sysrq-l command:

   answered=384 timeout=0 sdei_fail=0 lockup=0 load=0.39 The machine is
fully functional.


> 
> Ways out I see:
> 
>   - Firmware: end the interrupt on that path, or keep event 0 pending
>     until unmask as 55414 does. That is the real fix, but deployed
>     firmware will not have it for a while.

This method is too dependent on the firmware version.

> 
>   - Kernel: never signal a CPU that has SDEI masked. The signalling CPU
>     and the cpu_pm notifier can handshake: the sender marks the target
>     and IPIs it instead if it is already masked, and the notifier
>     refuses the power-down state while a signal is in flight. SDEI keeps
>     serving every running CPU, and the race goes away whatever the
>     firmware does. It needs a hook in arm_sdei.c.

This method might require a per-CPU mask. If the mask is already set, it
will not send an SDEI but instead use a regular IPI instead. However,
the code modification appears to be relatively complex.

> 
>   - Kernel: send the IPI first and SDEI only to the CPUs that do not
>     answer, as smp_send_stop() does. Simple, but then SDEI runs only
>     when a CPU is really stuck, and a problem like this one stays hidden
>     until the day it is needed.
> 

This will make it more difficult for SDEI issues to arise and be
promptly resolved.

>   - Kernel: use the NMI IPI when there is one, as you suggested. That
>     takes SDEI out of the picture where FEAT_NMI or pseudo-NMI is in use,
>     but not on machines without them, which are the ones SDEI is for.

I fully agree with this priority.

> 
>   - A switch to turn SDEI NMI off, like Jinjie's patch, as an escape
>     hatch whichever way this goes.

Shall I send a patch for the switch?


Best regards,
Jinjie

> 
> Any comments?
> 


