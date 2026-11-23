Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842AD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 02:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vrHU85J/;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=kkv2MAOD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1txEh5zIn3cGEU0vmX3LsnFAQZUnjKgdkp9G4QiIWBE=; b=vrHU85J/BUTwVTzoTQehcDJihr
	Whd/uxwPdcgV0Z6IpYu66/Zq4lLy13bUG5qwR03LxsMLTdyXZup5ZSY7JvNCVExQ4CgBj4jOgydzi
	Y6rE5Nfw6pbw2jr2NLf/LqrmOG1cpL8IUs3Kker/3/bG1T5MrGwtCOjDi8N0sF4gMHBlV06FmYHi3
	TRxMEW55oECAZCbY/Q3ka+fAYEm0PpxMQXRG3o374WCNhONSrvWfXrluXc5YUIf2rtUowP2FvJ5kU
	CiYS1Qc/+LTcPJrzKnvPmE90rtKjGmwdPZhqWM5sxR0mgi9TFwjRxYeUStppApjw59g4h8T42GLyf
	PCreYW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJu1-000000028jU-3pvG;
	Mon, 23 Nov 2026 02:35:33 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJtx-000000028iw-3EqM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 02:35:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1txEh5zIn3cGEU0vmX3LsnFAQZUnjKgdkp9G4QiIWBE=;
	b=kkv2MAODJ8mUo8tyPVvQ/8mcxQhPT1DrU8IyReuTWTcs+SUmzA60/A0pUDEU78HaDV7nI8EcA
	rq3z4tghVkszk6iFjGUDHye9ooyhkmaJAdeytwzCpiXi6fDORLL1+uG/E1VoC+MBvtd77y6iF1u
	YZs5DVXay0qW4E7sV8wzAe4=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jXqm80CXRz1K9df;
	Mon, 23 Nov 2026 10:35:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 93D7140563;
	Mon, 23 Nov 2026 10:35:20 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 23 Nov
 2026 10:35:19 +0800
Message-ID: <fa5c46cc-0f35-4043-9be8-af1102319fb1@huawei.com>
Date: Mon, 23 Nov 2026 10:35:17 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/39] arm64: Add support for FEAT_NMI
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <58a4c350-539d-49ca-826f-d19563895a29@huawei.com>
 <17149b32-6b9c-4364-b664-5789f0633e9d@huawei.com>
 <57757469-2545-4fc6-a7be-ccc133555052@arm.com>
 <38d04e8b-2f31-4616-8a8e-2747c7ce114d@huawei.com>
 <d4bb2979-4bc2-436c-8f4a-c9a5decea900@arm.com>
 <av8bByU93_nCbPqE@shutemov.name>
 <3ca9a2a6-88f1-43c5-af5a-2773aa70b444@huawei.com>
 <awBeQIq4WvfIIiqA@shutemov.name>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <awBeQIq4WvfIIiqA@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_183530_506073_7E267C94 
X-CRM114-Status: GOOD (  42.58  )
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
Cc: mark.rutland@arm.com, Vladimir Murzin <vladimir.murzin@arm.com>, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, maz@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/20 23:07, Kiryl Shutsemau (Meta) 写道:
> On Fri, Nov 20, 2026 at 10:11:33AM +0800, Jinjie Ruan wrote:
>> Sorry, I seem unable to open this link.
> 
> It is Cong Wang's "fix(sdei): keep event 0 pending while the PE is
> masked", not reviewed yet. I attached it, in case your firmware is
> based on TF-A.
> 
>> Zero. two logs are 0 (rc3 + rc2). The firmware returns success for all
>> targets, including the masked CPU.
> 
> Thanks. So on your firmware it is not a race: every CPU that is in the
> power-down state when the broadcast goes out gets wedged.
> 
>> This method might require a per-CPU mask. If the mask is already set, it
>> will not send an SDEI but instead use a regular IPI instead. However,
>> the code modification appears to be relatively complex.
> 
> I sent a sketch of it in a follow-up to Vladimir. It has two holes,
> fixed in the version below.
> 
> With one flag per CPU, a sender that backs off clears the flag while an
> earlier signal is still on its way, and the event 0 handler can clear
> the flag of a later sender that has passed its check but not yet made
> the SMC. Either way the PE masks with an SGI on its way. Counting the
> signals instead closes it.
> 
> The notifier also has to leave alone a PE that is already masked, as
> one is between sdei_cpuhp_down() and CPU_OFF, where cpuidle still runs.
> A veto there marks it unmasked. Without a veto, CPU_PM_EXIT unmasks it,
> and the flag is still set when the PE comes back masked from CPU_OFF.
> Either way the next signal goes to a masked PE.
> 
> Could you try it on HIP12 with the power-down state enabled? It applies
> to v7.4-rc3.

Hi, Kiryl,

Tested your sdei fix patch on HIP12 against v7.4-rc3 with the power-down
state enabled.  I

sysrq-l has 384/384 answering every time with no timeouts, no
SDEI_EVENT_SIGNAL failures and no lockups.

So in my tests, the fix was effective.

> 
>> Shall I send a patch for the switch?
> 
> Yes, please.

I will add your suggested-by and cc you.

Thanks,
Jinjie

> 
> diff --git a/arch/arm64/include/asm/nmi.h b/arch/arm64/include/asm/nmi.h
> index 2e8974ff8d63..561d062921e4 100644
> --- a/arch/arm64/include/asm/nmi.h
> +++ b/arch/arm64/include/asm/nmi.h
> @@ -44,5 +44,6 @@ static inline void sdei_nmi_stop_cpus(const cpumask_t *mask) { }
>   * Defined in arch/arm64/kernel/smp.c.
>   */
>  void __noreturn arm64_nmi_cpu_stop(struct pt_regs *regs, bool die_on_crash);
> +void arm64_backtrace_ipi(cpumask_t *mask);
>  
>  #endif /* __ASM_NMI_H */
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 014b163ce658..8369a4cd3e32 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -946,7 +946,7 @@ static void arm64_send_ipi(const cpumask_t *mask, unsigned int nr)
>  			__ipi_send_single(get_ipi_desc(cpu, nr), cpu);
>  }
>  
> -static void arm64_backtrace_ipi(cpumask_t *mask)
> +void arm64_backtrace_ipi(cpumask_t *mask)
>  {
>  	arm64_send_ipi(mask, IPI_CPU_BACKTRACE);
>  }
> diff --git a/drivers/firmware/arm_sdei.c b/drivers/firmware/arm_sdei.c
> index e8dd2f0f3919..b9972f01e55d 100644
> --- a/drivers/firmware/arm_sdei.c
> +++ b/drivers/firmware/arm_sdei.c
> @@ -12,6 +12,7 @@
>  #include <linux/cpuhotplug.h>
>  #include <linux/cpu.h>
>  #include <linux/cpu_pm.h>
> +#include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <linux/hardirq.h>
>  #include <linux/kernel.h>
> @@ -32,6 +33,8 @@
>  #include <linux/smp.h>
>  #include <linux/spinlock.h>
>  
> +#include <asm/smp_plat.h>
> +
>  /*
>   * The call to use to reach the firmware.
>   */
> @@ -299,10 +302,51 @@ static int sdei_api_get_version(u64 *version)
>  	return invoke_sdei_fn(SDEI_1_0_FN_SDEI_VERSION, 0, 0, 0, 0, 0, version);
>  }
>  
> +/*
> + * Event 0 must not land on a masked PE. A signal is in flight from the
> + * sender's check until the target takes it.
> + */
> +static DEFINE_PER_CPU(bool, sdei_pe_unmasked);
> +static DEFINE_PER_CPU(atomic_t, sdei_signalling);
> +static DEFINE_PER_CPU(atomic_t, sdei_signals_sent);
> +static DEFINE_PER_CPU(unsigned int, sdei_signals_taken);
> +static DEFINE_PER_CPU(bool, sdei_pm_masked);
> +
> +static bool sdei_signal_in_flight(void)
> +{
> +	unsigned int sent;
> +
> +	if (atomic_read_acquire(this_cpu_ptr(&sdei_signalling)))
> +		return true;
> +
> +	sent = atomic_read(this_cpu_ptr(&sdei_signals_sent));
> +	return sent != this_cpu_read(sdei_signals_taken);
> +}
> +
> +static bool sdei_mark_masked(void)
> +{
> +	this_cpu_write(sdei_pe_unmasked, false);
> +	smp_mb();
> +	return sdei_signal_in_flight();
> +}
> +
> +static void sdei_block_signal(void)
> +{
> +	int i;
> +
> +	if (!sdei_mark_masked())
> +		return;
> +
> +	for (i = 0; i < USEC_PER_MSEC && sdei_signal_in_flight(); i++)
> +		udelay(1);
> +}
> +
>  int sdei_mask_local_cpu(void)
>  {
>  	int err;
>  
> +	sdei_block_signal();
> +
>  	err = invoke_sdei_fn(SDEI_1_0_FN_SDEI_PE_MASK, 0, 0, 0, 0, 0, NULL);
>  	if (err && err != -EIO) {
>  		pr_warn_once("failed to mask CPU[%u]: %d\n",
> @@ -330,6 +374,7 @@ int sdei_unmask_local_cpu(void)
>  		return err;
>  	}
>  
> +	this_cpu_write(sdei_pe_unmasked, true);
>  	return 0;
>  }
>  
> @@ -344,10 +389,27 @@ static void _ipi_unmask_cpu(void *ignored)
>   * but the SMC -- no locks, no event lookup -- so it is safe from NMI /
>   * crash context (e.g. the cross-CPU NMI service).
>   */
> -int sdei_event_signal(u32 event_num, u64 mpidr)
> +int sdei_event_signal(u32 event_num, unsigned int cpu)
>  {
> -	return invoke_sdei_fn(SDEI_1_0_FN_SDEI_EVENT_SIGNAL, event_num,
> -			      mpidr, 0, 0, 0, NULL);
> +	atomic_t *signalling = per_cpu_ptr(&sdei_signalling, cpu);
> +	u64 mpidr = cpu_logical_map(cpu);
> +	int err;
> +
> +	atomic_inc(signalling);
> +	smp_mb__after_atomic();
> +	if (!READ_ONCE(per_cpu(sdei_pe_unmasked, cpu))) {
> +		atomic_dec(signalling);
> +		return -EAGAIN;
> +	}
> +
> +	err = invoke_sdei_fn(SDEI_1_0_FN_SDEI_EVENT_SIGNAL, event_num,
> +			     mpidr, 0, 0, 0, NULL);
> +	if (!err)
> +		atomic_inc(per_cpu_ptr(&sdei_signals_sent, cpu));
> +
> +	atomic_dec_return_release(signalling);
> +
> +	return err;
>  }
>  NOKPROBE_SYMBOL(sdei_event_signal);
>  
> @@ -680,6 +742,8 @@ static int sdei_cpuhp_down(unsigned int cpu)
>  	struct sdei_event *event;
>  	int err;
>  
> +	sdei_block_signal();
> +
>  	/* un-register private events */
>  	spin_lock(&sdei_list_lock);
>  	list_for_each_entry(event, &sdei_list, list) {
> @@ -700,8 +764,12 @@ static int sdei_cpuhp_down(unsigned int cpu)
>  static int sdei_cpuhp_up(unsigned int cpu)
>  {
>  	struct sdei_event *event;
> +	unsigned int sent;
>  	int err;
>  
> +	sent = atomic_read(this_cpu_ptr(&sdei_signals_sent));
> +	this_cpu_write(sdei_signals_taken, sent);
> +
>  	/* re-register/enable private events */
>  	spin_lock(&sdei_list_lock);
>  	list_for_each_entry(event, &sdei_list, list) {
> @@ -739,10 +807,21 @@ static int sdei_pm_notifier(struct notifier_block *nb, unsigned long action,
>  
>  	switch (action) {
>  	case CPU_PM_ENTER:
> +		if (!this_cpu_read(sdei_pe_unmasked))
> +			return NOTIFY_DONE;
> +		if (sdei_mark_masked()) {
> +			this_cpu_write(sdei_pe_unmasked, true);
> +			return notifier_from_errno(-EBUSY);
> +		}
>  		rv = sdei_mask_local_cpu();
> +		if (!rv)
> +			this_cpu_write(sdei_pm_masked, true);
>  		break;
>  	case CPU_PM_EXIT:
>  	case CPU_PM_ENTER_FAILED:
> +		if (!this_cpu_read(sdei_pm_masked))
> +			return NOTIFY_DONE;
> +		this_cpu_write(sdei_pm_masked, false);
>  		rv = sdei_unmask_local_cpu();
>  		break;
>  	default:
> @@ -1113,6 +1192,12 @@ int sdei_event_handler(struct pt_regs *regs,
>  {
>  	int err;
>  	u32 event_num = arg->event_num;
> +	unsigned int sent;
> +
> +	if (!event_num) {
> +		sent = atomic_read(this_cpu_ptr(&sdei_signals_sent));
> +		__this_cpu_write(sdei_signals_taken, sent);
> +	}
>  
>  	err = arg->callback(event_num, regs, arg->callback_arg);
>  	if (err)
> diff --git a/drivers/firmware/arm_sdei_nmi.c b/drivers/firmware/arm_sdei_nmi.c
> index 038eb79e28ac..9e2ea532888a 100644
> --- a/drivers/firmware/arm_sdei_nmi.c
> +++ b/drivers/firmware/arm_sdei_nmi.c
> @@ -125,15 +125,19 @@ static int sdei_nmi_handler(u32 event, struct pt_regs *regs, void *arg)
>  }
>  NOKPROBE_SYMBOL(sdei_nmi_handler);
>  
> -static void sdei_nmi_fire(unsigned int target_cpu)
> +static int sdei_nmi_fire(unsigned int target_cpu)
>  {
> -	int err = sdei_event_signal(SDEI_NMI_EVENT, cpu_logical_map(target_cpu));
> +	int err = sdei_event_signal(SDEI_NMI_EVENT, target_cpu);
>  
> -	if (err)
> +	if (err && err != -EAGAIN)
>  		pr_warn("SDEI_EVENT_SIGNAL to CPU %u failed: %d\n",
>  			target_cpu, err);
> +
> +	return err;
>  }
>  
> +static cpumask_t sdei_nmi_ipi_mask;
> +
>  /*
>   * Raise callback for nmi_trigger_cpumask_backtrace(): signal event 0
>   * at every CPU still pending in @mask. The framework excludes the local
> @@ -150,8 +154,14 @@ static void sdei_nmi_raise_backtrace(cpumask_t *mask)
>  	 */
>  	dsb(ishst);
>  
> -	for_each_cpu(cpu, mask)
> -		sdei_nmi_fire(cpu);
> +	cpumask_clear(&sdei_nmi_ipi_mask);
> +	for_each_cpu(cpu, mask) {
> +		if (sdei_nmi_fire(cpu) == -EAGAIN)
> +			cpumask_set_cpu(cpu, &sdei_nmi_ipi_mask);
> +	}
> +
> +	if (!cpumask_empty(&sdei_nmi_ipi_mask))
> +		arm64_backtrace_ipi(&sdei_nmi_ipi_mask);
>  }
>  
>  /*
> diff --git a/include/linux/arm_sdei.h b/include/linux/arm_sdei.h
> index b9dc21c241be..3f565a0f4a17 100644
> --- a/include/linux/arm_sdei.h
> +++ b/include/linux/arm_sdei.h
> @@ -41,7 +41,7 @@ int sdei_event_disable(u32 event_num);
>   * Signal the software-signalled event (event 0) to another PE, NMI-like.
>   * @mpidr is the target's MPIDR affinity.
>   */
> -int sdei_event_signal(u32 event_num, u64 mpidr);
> +int sdei_event_signal(u32 event_num, unsigned int cpu);
>  
>  /* Was SDEI firmware probed and usable? */
>  bool sdei_is_present(void);


