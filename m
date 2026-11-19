Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0300D606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z3pVQNXf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pwQJBRag
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EMQCAP6Fv3zWB8hCEduv56oOu7xGNtPbuGqOxE+PCLY=; b=z3pVQNXfJywhV6vs/FuyMzlP+I
	uIqyabPg4eJIfyEmRAC38INw9g4g/aMzyPTdQE9rlrpziFVx+ql1WM2G9X69q6heDr3ovqm7XinGr
	UstLl5l7KQ0VkNHh5vWDLFHKdIsyynoAjoARl1riYrTu+b+VKyl3iNDi49dyaaF1Ng8pw3HH/XQcn
	qKQZ16AsVimhwNXgayJ4v/BLtJKq1d/lCnCDJUopeu5iDEON0PQ62XpL7FL396c+yzMUTMqwIkaHA
	Gc6XgiF9x8gdfn7iWxYTwjvxsDUG+l3FVeHidSBQGN7PuNvNuu7jPSURSpxU0FlnwFpNWl82cBqkQ
	X1DHMCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzAe-0000000BW9k-3SLZ;
	Thu, 19 Nov 2026 10:15:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzAM-0000000BVxL-3KUl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:15:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5664C1575;
	Thu, 19 Nov 2026 02:14:48 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B19543F632;
	Thu, 19 Nov 2026 02:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795083291; bh=XRnlNKBGq8wkMrskwp6djG3J+uXK0RNg3V4WMqw7v/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pwQJBRag6AbmuRy0Y5V/35K68XV60QiraZN7P/wUdhfh6GHB+8pLNDgN2cHMcXY/S
	 URzQkV5xiDhUqfHWQsWqvInnwnOFt68eb1HsUKbzZIkeLbMT2gTEAXkcIAUHBJuVyl
	 NUsxTRk2YIdDG9nLZgpkkt1hI3iYfOobM3IlXzow=
Message-ID: <57757469-2545-4fc6-a7be-ccc133555052@arm.com>
Date: Thu, 19 Nov 2026 10:14:46 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/39] arm64: Add support for FEAT_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org, kirill@shutemov.name
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <58a4c350-539d-49ca-826f-d19563895a29@huawei.com>
 <17149b32-6b9c-4364-b664-5789f0633e9d@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <17149b32-6b9c-4364-b664-5789f0633e9d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_021454_939767_06420A19 
X-CRM114-Status: GOOD (  39.82  )
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, maz@kernel.org, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinjie,

On 11/19/26 01:54, Jinjie Ruan wrote:
> 
> 在 2026/11/18 20:17, Jinjie Ruan 写道:
>> Hi Vladimir,
>>
>> I gave the series a test on a Kunpeng HIP12 machine with 384 CPUs,
>> GICv4.2, firmware with SDEI event 0. The PE implements FEAT_NMI and the
>> GIC implements FEAT_GICv3_NMI.
>>
>> Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>
>> Rather than a single boot, I varied the four dimensions that select a
>> different masking path:
>>
>>   - PE FEAT_NMI       : present / masked with id_aa64pfr1.nmi=0
>>   - GIC superpriority : present / disabled
>>   - Pseudo-NMI        : irqchip.gicv3_pseudo_nmi=0/1
>>   - SDEI cross-CPU    : firmware event 0 active / disabled
> Hi Vladimir,
> 
> It appears that SDEI cross-CPU has more issues. On our 384-CPU HIP12
> with SDEI event 0 active, a single
> 
>       echo l > /proc/sysrq-trigger
> 
> stuck the machine. Concretely, we see:
> 
> - only 8-23 of the 384 CPUs answer the broadcast, the rest never do;
> 
> - the framework's 10-second wait then expires for them:
> 
>   After 10 seconds, these CPUS still haven't responded to the NMI:
>   3-9,11-45,47-261,263-339,341-351,353-383
> 
> - the hardlockup detector fires on the stuck CPUs one watchdog
>   period later, and with hardlockup_panic=1 the box panics:
> 
>   watchdog: CPU9: Watchdog detected hard LOCKUP on cpu 9
>   Kernel panic - not syncing: Hard LOCKUP
> 
> - the stop escalation cannot rescue it either:
> 
>    SMP: retry stop with SDEI NMI for CPUs 194
>    SMP: failed to stop secondary CPUs 194
> 
>   so kdump reports "Some CPUs may be stale, kdump will be unreliable".
> 
> The same kernel booted with sdei_nmi.disabled=1 answers 384/384 in 47-60
> ms with no warnings at all, and a single-target SDEI backtrace is fine
> at ~14 ms -- so what breaks is the broadcast form specifically, not SDEI
> delivery as such.
> 

Thanks for testing!

Just checking, do you run with irqchip.gicv3_pseudo_nmi=1? Ada has posted
fixes around SDEI few days ago [1].

Also are you able to reproduce issue on mainline v7.4-rc3 (it should contain
recent fixes for SDEI [2] IIUC) to rule out interaction with patch series?

Thanks
Vladimir

[1] https://lore.kernel.org/linux-arm-kernel/20261117174814.95936-1-ada.coupriediaz@arm.com/
[2] https://lore.kernel.org/all/20261105120835.3321912-1-kirill@shutemov.name/

> Best regards,
> Jinjie
> 
>> The last one needs a patch to switch attached at the end.
>>
>> # The Results are as below:
>>
>>   Grp  PE GIC pse SDEI | supports active pseudo IRQS_NMI fast  result
>>   ------------------------------------------------------------------
>>   A    y  y   n   y    |   1       1      0        4      y     PASS
>>   A2   y  y   n   n    |   1       1      0        4      y     PASS
>>   A3   y  y   y   n    |   1       0      1        4      y     PASS
>>   B    y  y   y   y    |   1       0      1        4      y     PASS
>>   C    n  y   n   y    |   0       0      0        4      y     PASS
>>   D    n  y   y   y    |   0       0      1        4      y     PASS
>>   E    y  y   n   y    |   0       0      0        0      y *   PASS
>>   F    y  n   n   y    |   1       1      0        0      n     PASS
>>   G    y  n   n   n    |   0       0      0        0      n     PASS
>>   H    y  n   y   n    |   0       0      1        4      y     PASS
>>
>>   supports     system_supports_nmi()
>>   active       system_uses_nmi()
>>   pseudo       system_uses_irq_prio_masking()
>>   IRQS_NMI     IRQ descriptors with IRQS_NMI set (IPIs + arm-pmu)
>>   fast         cpumask_backtrace() at a CPU spinning with local IRQs
>>                disabled returns in ms (NMI delivered) rather than
>>                ~1.5 s (plain IPI)
>>
>> ## IRQS_NMI is 4 means 4 types of NMI Interrupt Tests:
>>
>>      IRQ  hwirq      purpose
>>     ---------------------------------------------------------------
>>       4   0x3  SGI   IPI_CPU_STOP_NMI - stop a CPU on panic
>>       7   0x6  SGI   IPI_KGDB_ROUNDUP - kgdb roundup
>>       8   0x7  SGI   IPI_CPU_BACKTRACE - hardlockup all-CPU backtrace
>>      42   0x17 PPI   arm-pmu (PMUv3) - perf sampling
>>
>>
>>   * E is CONFIG_ARM64_NMI=n plus SDEI. "fast" there comes from SDEI,
>>     not from the architected path; IRQS_NMI=0 says so.
>>
>> # Checks that run on every boot and pass in all applicable groups:
>>
>>   irqflags / exception state
>>       save, restore and nesting round trip for DAIF, PMR and ALLINT;
>>       arch_irqs_disabled_flags() takes ALLINT into account;
>>       local_irq_disable() leaves ALLINT clear, and an NMI is still
>>       delivered inside that window.
>>
>>   exception contexts
>>       arm64_exc_hwstate_of_context() for PROCESS / NOIRQ / NONMI /
>>       ERROR / CRITICAL, including that CRITICAL sets ALLINT and NOIRQ
>>       does not; local_exceptions_save_mask()/restore() for NOIRQ and
>>       CRITICAL; local_exceptions_force_daif_save()/restore() on the
>>       idle/WFI path (pseudo-NMI only).
>>
>>   pstate
>>       regs_irqs_disabled() honours PSR_ALLINT_BIT; the bit survives the
>>       ptrace path.
>>
>>   kprobes
>>       registering a probe does not disturb ALLINT, including when it is
>>       set (so an NMI cannot become deliverable inside a probe); a probe
>>       on the real "msr allint" / "mrs xN, allint" instruction is
>>       rejected with -EINVAL.
>>
>>   adjacent subsystems
>>       an EFI runtime call does not clobber ALLINT; perf events keep
>>       counting across an ALLINT toggle.
>>
>>   genirq
>>       add_interrupt_randomness() is never called in NMI context.
>>
>>   CPU stop
>>       spin one CPU with IRQs disabled, then panic: the stop escalation
>>       reaches the NMI rung, "SMP: retry stop with NMI for CPUs 0".
>>
>> # The problem
>>
>> SDEI wins over the architected IPI path, unconditionally
>>
>> arch_trigger_cpumask_backtrace() returns as soon as
>> sdei_nmi_trigger_cpumask_backtrace() succeeds, so on a platform where
>> firmware offers SDEI event 0 the irqchip NMI path is never reached.
>>
>> More importantly PSTATE.ALLINT has no effect on the backtrace:
>>
>>     SDEI active   : cpumask_backtrace() returns in ~14 ms with ALLINT set
>>     SDEI disabled : the same call takes ~1.5 s   with ALLINT set
>>
>> That is, the NMI delivered by SDEI bypasses the PSTATE.ALLINT masking
>> (the interruption is cleared within 14 ms). The NMI that goes through
>> the GIC superpriority is restricted by ALLINT (the masking is cleared
>> after 1.5s).
>>
>> And there is no equivalent of "irqchip.gicv3_pseudo_nmi=" for SDEI NMI.
>>
>> The patch used for the SDEI switch is as below.
>>
>> Best regards,
>> Jinjie
>>
>> diff --git a/drivers/firmware/arm_sdei_nmi.c
>> b/drivers/firmware/arm_sdei_nmi.c
>> index 038eb79e28ac..22e8c3e7aa75 100644
>> --- a/drivers/firmware/arm_sdei_nmi.c
>> +++ b/drivers/firmware/arm_sdei_nmi.c
>> @@ -62,6 +62,24 @@
>>
>>  static bool sdei_nmi_available;
>>
>> +static bool sdei_nmi_disabled __ro_after_init;
>> +
>> +static int __init sdei_nmi_disable_setup(char *str)
>> +{
>> +       return kstrtobool(str, &sdei_nmi_disabled);
>> +}
>> +early_param("sdei_nmi.disabled", sdei_nmi_disable_setup);
>> +
>>  #define SDEI_NMI_EVENT                 0
>>
>>  /*
>> @@ -168,7 +186,7 @@ static void sdei_nmi_raise_backtrace(cpumask_t *mask)
>>   */
>>  bool sdei_nmi_trigger_cpumask_backtrace(const cpumask_t *mask, int
>> exclude_cpu)
>>  {
>> -       if (!sdei_nmi_available)
>> +       if (!sdei_nmi_available || sdei_nmi_disabled)
>>                 return false;
>>
>>         nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
>> @@ -194,6 +212,9 @@ void sdei_nmi_stop_cpus(const cpumask_t *mask)
>>  {
>>         unsigned int cpu;
>>
>> +       if (sdei_nmi_disabled)
>> +               return;
>> +
>>         WRITE_ONCE(sdei_nmi_stopping, true);
>>
>>         /*
>> @@ -238,6 +259,10 @@ static int __init sdei_nmi_init(void)
>>         }
>>
>>         sdei_nmi_available = true;
>> +       if (sdei_nmi_disabled) {
>> +               pr_info("Sdei nmi disabled by sdei_nmi.disabled\n");
>> +               return 0;
>> +       }
>>         pr_info("using SDEI cross-CPU NMI (SDEI_EVENT_SIGNAL, event %u)\n",
>>                 SDEI_NMI_EVENT);
>>
>> 在 2026/11/12 21:20, Vladimir Murzin 写道:
>>> FEAT_NMI provides an architected mechanism for supporting non-maskable
>>> interrupts (NMIs) and less-masked interrupts (LMIs).
>>>
>>> Since we already support pseudo-NMIs via priority masking, introducing
>>> another flavour of NMI on top of the existing infrastructure could
>>> easily become messy, making the code harder to follow and reason
>>> about.
>>>
>>> To avoid that, this series first makes room for the new NMI "tenant"
>>> by restructuring the existing exception masking logic.
>>>
>>> The main idea is to separate the logical view of exception state from
>>> its hardware representation. To achieve this, we introduce logical
>>> exception contexts that can be mapped onto the corresponding hardware
>>> state. This naturally consolidates the hardware-specific handling into
>>> a small number of places, while allowing the rest of the code to
>>> operate purely in terms of logical exception contexts.
>>>
>>> Since this restructuring is non-trivial and carries a risk of subtle
>>> behavioural changes, the series adds extensive debug checks to verify
>>> that the hardware state always matches the expected logical state.
>>>
>>> With this restructuring in place, wiring FEAT_NMI into the new
>>> framework becomes much more manageable. GIC support for NMI is build
>>> on top.
>>>
>>> This work would not have been possible without the contributions of
>>> Ada Couprie Diaz, Mark Brown, and Lorenzo Pieralisi - please credit
>>> them for everything that works well. Any remaining bugs or issues are
>>> entirely my own.
>>>
>>> Most of the testing has been done on QEMU, Fast Model and pre-silicon
>>> environment, so the series definitely benefit from extensive testing
>>> on real hardware (without NMI, with pseudo-NMI, and with FEAT_NMI).
>>>
>>> Patches are organized as follow
>>>
>>> 1 - 15
>>>   Rework of existing pseudo-NMI logic to make room for FEAT_NMI
>>>
>>> 16 - 33
>>>   FEAT_NMI support including some preparation patches which have
>>>   no dependencies:
>>>     - efi/runtime-wrappers: Permit architectures to override IRQ flags checks
>>>     - arm64: smp: Abstract SGI and LPI operations
>>>
>>> 34 - 35
>>>   GICv3 support for NMI
>>>
>>> 36 - 39
>>>   GICv5 support for NMI (including some preparation patches)
>>>
>>> Changelog
>>>
>>>   v1 -> v2
>>>
>>>     - Rebased on v7.4-rc2
>>>     - Select HAVE_PERF_EVENTS_NMI when FEAT_NMI is enabled
>>>     - Reworked APEI SEA handling to mask exceptions sequentially   
>>>     - Updated GICv3 initialization to clear NMI configuration
>>>     - Added Tested-by and Reviewed-by tags where approriate
>>>     - Droped tags due to meaningful changes for:
>>>       + "arm64: replace local_daif helpers"
>>>       + "irqchip/gic-v3: Implement FEAT_GICv3_NMI support"
>>>
>>>   RFC v2 -> v1
>>>
>>>     - Rebased on v7.3-rc3.
>>>     - Dropped RFC tag, have not received objections, at the same time
>>>       got support from Jinjie
>>>     - Dropped prerequisite patches already present in the newer base
>>>     - Added logic to reject probing/stepping over ALLINT
>>>     - Moved addition of arm64_debug_exc_context() in separate patch
>>>     - Reworked debug logic for validating direction of exception
>>>       transition
>>>     - Split support for NMI in GICv5 in 3 separate patches
>>>     - Added review tags
>>>
>>>   RFC v1 -> RFC v2
>>>
>>>     - Rebased on v7.2-rc5.
>>>     - Improved commit descriptions.
>>>     - Split some patches into smaller ones.
>>>     - Added a graceful fallback for IPI requests when FEAT_NMI is
>>>       supported by the CPU but unsupported by the interrupt
>>>       controller.
>>>     - Split the GICv3 preparation from the FEAT_GICv3_NMI
>>>       implementation.
>>>     - Added NMI support to GICv5, primarily as an illustration of the
>>>       implementation, although it also happens to work on Fast Model.
>>>     - Added review tags only to unchanged patches. Review tags were
>>>       intentionally dropped from modified patches to reflect those
>>>       changes and encourage re-review.
>>>
>>> RFC v1:
>>>   https://lore.kernel.org/linux-arm-kernel/20260709121333.23507-1-vladimir.murzin@arm.com/
>>>
>>> RFC v2:
>>>   https://lore.kernel.org/linux-arm-kernel/20260727163453.7969-1-vladimir.murzin@arm.com/
>>>
>>> v1:
>>>   https://lore.kernel.org/linux-arm-kernel/20260914102102.68597-1-vladimir.murzin@arm.com/
>>>
>>> Thanks!
>>> Vladimir
>>>
>>> Ada Couprie Diaz (15):
>>>   arm64: irqflags: Introduce arm64-specific irqflags type
>>>   arm64: irqflags: save and use both DAIF and PMR
>>>   arm64: interrupts: Add common exception state helpers
>>>   arm64: entry: Introduce entry specific exception masking helpers
>>>   arm64: entry: replace DAIF helpers with entry helpers
>>>   arm64: interrupts: Introduce exception masking save/restore helpers
>>>   arm64: interrupts: introduce a helper for GIC priority initialization
>>>   arm64: replace local_daif helpers
>>>   arm64: cpuidle: use new helpers to bypass interrupt priority masking
>>>   arm64: remove daifflags.h
>>>   arm64: gicv3: remove GIC_PRIO_PSR_I_SET
>>>   arm64: ptrace: Add PSR_ALLINT_BIT
>>>   arm64: cpufeature: Detect PE support for FEAT_NMI
>>>   arm64: nmi: Manage masking for superpriority interrupts
>>>   arm64: irq: Report FEAT_NMI masking local IRQs
>>>
>>> Lorenzo Pieralisi (2):
>>>   irqchip/gic-v3: Rename nmi to pseudo_nmi
>>>   irqchip/gic-v3: Implement FEAT_GICv3_NMI support
>>>
>>> Mark Brown (5):
>>>   arm64: booting: Document boot requirements for FEAT_NMI
>>>   arm64: sysreg: Add definitions for immediate versions of MSR ALLINT
>>>   arm64: idreg: Add an override for FEAT_NMI
>>>   arm64: nmi: Add handling of superpriority interrupts as NMIs
>>>   arm64: nmi: Add Kconfig for NMI
>>>
>>> Vladimir Murzin (17):
>>>   arm64: process: Lift check for exception state to generic
>>>     infrastructure
>>>   arm64: cpufeature: Remove system_has_prio_mask_debugging()
>>>   arm64: irqflags: Switch to CONFIG_DEBUG_IRQFLAGS
>>>   arm64: Kconfig: Remove CONFIG_ARM64_DEBUG_PRIORITY_MASKING
>>>   efi/runtime-wrappers: Permit architectures to override IRQ flags
>>>     checks
>>>   arm64/efi: Implement override for IRQ flags checks
>>>   arm64: probes: Reject stepping over ALLINT
>>>   arm64: suspend: Always initialise PSTATE.ALLINT
>>>   arm64/efi: Add ALLINT to IRQ flags checks
>>>   arm64: kprobes: Disable NMIs
>>>   arm64: smp: Abstract SGI and LPI operations
>>>   arm64: smp: Fall back to IRQ when IPI NMI request fails
>>>   arm64: nmi: Select HAVE_PERF_EVENTS_NMI for FEAT_NMI
>>>   arm64: smp: Add NMI support for LPI-backed IPIs
>>>   genirq: Trust local irqchip when considering IRQ for NMI
>>>   genirq: Do not call add_interrupt_randomness() in NMI context
>>>   irqchip/gic-v5: Add NMI support
>>>
>>>  Documentation/arch/arm64/booting.rst          |   6 +
>>>  arch/arm64/Kconfig                            |  31 +-
>>>  arch/arm64/include/asm/assembler.h            |  20 +-
>>>  arch/arm64/include/asm/cpucaps.h              |   2 +
>>>  arch/arm64/include/asm/cpufeature.h           |  14 +-
>>>  arch/arm64/include/asm/cpuidle.h              |  18 +-
>>>  arch/arm64/include/asm/daifflags.h            | 144 --------
>>>  arch/arm64/include/asm/efi.h                  |  42 ++-
>>>  arch/arm64/include/asm/entry-common.h         |   8 +-
>>>  arch/arm64/include/asm/insn.h                 |   1 +
>>>  .../include/asm/interrupts/common_flags.h     | 255 +++++++++++++
>>>  arch/arm64/include/asm/interrupts/entry.h     | 102 ++++++
>>>  arch/arm64/include/asm/interrupts/masking.h   | 166 +++++++++
>>>  arch/arm64/include/asm/irqflags.h             | 150 ++++----
>>>  arch/arm64/include/asm/kvm_host.h             |   1 -
>>>  arch/arm64/include/asm/mmu_context.h          |   1 -
>>>  arch/arm64/include/asm/ptrace.h               |  25 +-
>>>  arch/arm64/include/asm/sysreg.h               |   2 +
>>>  arch/arm64/include/uapi/asm/ptrace.h          |   1 +
>>>  arch/arm64/kernel/acpi.c                      |  43 +--
>>>  arch/arm64/kernel/cpufeature.c                |  68 +++-
>>>  arch/arm64/kernel/debug-monitors.c            |   1 -
>>>  arch/arm64/kernel/entry-common.c              | 335 +++++++++++++-----
>>>  arch/arm64/kernel/entry.S                     |  14 +-
>>>  arch/arm64/kernel/hibernate.c                 |  14 +-
>>>  arch/arm64/kernel/hw_breakpoint.c             |  16 +-
>>>  arch/arm64/kernel/irq.c                       |  45 ++-
>>>  arch/arm64/kernel/machine_kexec.c             |   4 +-
>>>  arch/arm64/kernel/pi/idreg-override.c         |   1 +
>>>  arch/arm64/kernel/probes/decode-insn.c        |  11 +-
>>>  arch/arm64/kernel/probes/kprobes.c            |  24 +-
>>>  arch/arm64/kernel/process.c                   |  24 +-
>>>  arch/arm64/kernel/setup.c                     |   4 +-
>>>  arch/arm64/kernel/signal.c                    |   1 -
>>>  arch/arm64/kernel/smp.c                       | 217 ++++++++----
>>>  arch/arm64/kernel/suspend.c                   |  14 +-
>>>  arch/arm64/kernel/traps.c                     |   1 -
>>>  arch/arm64/kvm/hyp/nvhe/switch.c              |   2 +-
>>>  arch/arm64/kvm/hyp/vgic-v3-sr.c               |   7 +-
>>>  arch/arm64/kvm/hyp/vhe/switch.c               |  14 +-
>>>  arch/arm64/mm/fault.c                         |   1 -
>>>  arch/arm64/mm/mmu.c                           |   7 +-
>>>  arch/arm64/tools/cpucaps                      |   2 +
>>>  drivers/firmware/efi/runtime-wrappers.c       |  32 +-
>>>  drivers/irqchip/irq-gic-v3.c                  | 145 +++++++-
>>>  drivers/irqchip/irq-gic-v5.c                  | 244 ++++++++++++-
>>>  include/linux/irq.h                           |   2 +-
>>>  include/linux/irqchip/arm-gic-v3-prio.h       |   8 -
>>>  include/linux/irqchip/arm-gic-v3.h            |   4 +
>>>  kernel/irq/handle.c                           |   3 +-
>>>  kernel/irq/manage.c                           |   5 -
>>>  51 files changed, 1696 insertions(+), 606 deletions(-)
>>>  delete mode 100644 arch/arm64/include/asm/daifflags.h
>>>  create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h
>>>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
>>>  create mode 100644 arch/arm64/include/asm/interrupts/masking.h
>>>


