Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB76606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 02:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UrRKuupD;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Hprh4K7C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WnAkQMgOpnpU3HVi0E0zTEbsfdf0cauQI/1/AlMlfzw=; b=UrRKuupDmaeA+O
	Yusajy4oJCHj6KjiszxjWOf/CfqSDEPIq99iBlEQ1exbwHdZ7uMdvBOXaUGilIPge/MrvSqS8Xm+q
	pSRNS5E0TnIdMk/D6WyGMZTrbQn9kJPwjVAmfUfaHcwikOsf7CJIX0ZQoWIe7Q/qaZJXKGYjv9Ou8
	HSzQwyUoIqA2RIAcrtZSS+BG8S73qpFSqmWIj28Ewe9BkkbaEGIn4r4PAtTEAVCkobE75INYvch1r
	GuHBVdR3lWWD/ANEs42rIXN9cNr4JoDUJr/1A2O1calEL5Hg14CtgIA+QVidQpu5a7JzWojCFWqYT
	C5AWQcPackok50N5Z+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVK3w-0000000297B-3ndF;
	Mon, 23 Nov 2026 02:45:48 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVK3s-0000000296l-45e2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 02:45:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=WnAkQMgOpnpU3HVi0E0zTEbsfdf0cauQI/1/AlMlfzw=;
	b=Hprh4K7Ce+or4pKtVFK/9cHe3JJDa7rFs0vlsgMSwQhLDcXXbf8R31TS7Y6m8LfyZgzVPZGt7
	mkJ5pX6fF/s6qEK6hCAmg224hZLAOBhjYc+eTBZhoaD4QUuTl5to0XpSSxKjRRESU9cr07qYe1M
	XDpgXrU5L/dG5nojbXYib5o=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jXqzN6x02z12Ldk;
	Mon, 23 Nov 2026 10:44:48 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 73E2B4057B;
	Mon, 23 Nov 2026 10:45:38 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 23 Nov
 2026 10:45:37 +0800
Message-ID: <69c6bbf9-760d-44d3-a474-501579a748e7@huawei.com>
Date: Mon, 23 Nov 2026 10:45:37 +0800
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
 <58a4c350-539d-49ca-826f-d19563895a29@huawei.com>
 <85958791-2e85-46f3-bc53-6e2ea64e44cb@huawei.com>
 <6cbb0f09-fb34-47d7-9c61-a99d97e0805b@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <6cbb0f09-fb34-47d7-9c61-a99d97e0805b@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_184545_799714_00D79B44 
X-CRM114-Status: GOOD (  30.76  )
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



在 2026/11/19 22:46, Vladimir Murzin 写道:
> Hi Jinjie,

Hi Vladimir,

> 
> On 11/19/26 11:41, Jinjie Ruan wrote:
>>
>> 在 2026/11/18 20:17, Jinjie Ruan 写道:
>>> Hi Vladimir,
>>>
>>> I gave the series a test on a Kunpeng HIP12 machine with 384 CPUs,
>>> GICv4.2, firmware with SDEI event 0. The PE implements FEAT_NMI and the
>>> GIC implements FEAT_GICv3_NMI.
>>>
>>> Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>
>>> Rather than a single boot, I varied the four dimensions that select a
>>> different masking path:
>>>
>>>   - PE FEAT_NMI       : present / masked with id_aa64pfr1.nmi=0
>>>   - GIC superpriority : present / disabled
>>>   - Pseudo-NMI        : irqchip.gicv3_pseudo_nmi=0/1
>>>   - SDEI cross-CPU    : firmware event 0 active / disabled
>>>
>>> The last one needs a patch to switch attached at the end.
>>>
>>> # The Results are as below:
>>>
>>>   Grp  PE GIC pse SDEI | supports active pseudo IRQS_NMI fast  result
>>>   ------------------------------------------------------------------
>>>   A    y  y   n   y    |   1       1      0        4      y     PASS
>>>   A2   y  y   n   n    |   1       1      0        4      y     PASS
>>>   A3   y  y   y   n    |   1       0      1        4      y     PASS
>>>   B    y  y   y   y    |   1       0      1        4      y     PASS
>>>   C    n  y   n   y    |   0       0      0        4      y     PASS
>>>   D    n  y   y   y    |   0       0      1        4      y     PASS
>>>   E    y  y   n   y    |   0       0      0        0      y *   PASS
>>>   F    y  n   n   y    |   1       1      0        0      n     PASS
>>>   G    y  n   n   n    |   0       0      0        0      n     PASS
>>>   H    y  n   y   n    |   0       0      1        4      y     PASS
>>>
>>>   supports     system_supports_nmi()
>>>   active       system_uses_nmi()
>>>   pseudo       system_uses_irq_prio_masking()
>>>   IRQS_NMI     IRQ descriptors with IRQS_NMI set (IPIs + arm-pmu)
>>>   fast         cpumask_backtrace() at a CPU spinning with local IRQs
>>>                disabled returns in ms (NMI delivered) rather than
>>>                ~1.5 s (plain IPI)
>>>
>>> ## IRQS_NMI is 4 means 4 types of NMI Interrupt Tests:
>>>
>>>      IRQ  hwirq      purpose
>>>     ---------------------------------------------------------------
>>>       4   0x3  SGI   IPI_CPU_STOP_NMI - stop a CPU on panic
>>>       7   0x6  SGI   IPI_KGDB_ROUNDUP - kgdb roundup
>>>       8   0x7  SGI   IPI_CPU_BACKTRACE - hardlockup all-CPU backtrace
>>>      42   0x17 PPI   arm-pmu (PMUv3) - perf sampling
>>>
>>>
>>>   * E is CONFIG_ARM64_NMI=n plus SDEI. "fast" there comes from SDEI,
>>>     not from the architected path; IRQS_NMI=0 says so.
>>>
>>> # Checks that run on every boot and pass in all applicable groups:
>>>
>>>   irqflags / exception state
>>>       save, restore and nesting round trip for DAIF, PMR and ALLINT;
>>>       arch_irqs_disabled_flags() takes ALLINT into account;
>>>       local_irq_disable() leaves ALLINT clear, and an NMI is still
>>>       delivered inside that window.
>>>
>>>   exception contexts
>>>       arm64_exc_hwstate_of_context() for PROCESS / NOIRQ / NONMI /
>>>       ERROR / CRITICAL, including that CRITICAL sets ALLINT and NOIRQ
>>>       does not; local_exceptions_save_mask()/restore() for NOIRQ and
>>>       CRITICAL; local_exceptions_force_daif_save()/restore() on the
>>>       idle/WFI path (pseudo-NMI only).
>>>
>>>   pstate
>>>       regs_irqs_disabled() honours PSR_ALLINT_BIT; the bit survives the
>>>       ptrace path.
>>>
>>>   kprobes
>>>       registering a probe does not disturb ALLINT, including when it is
>>>       set (so an NMI cannot become deliverable inside a probe); a probe
>>>       on the real "msr allint" / "mrs xN, allint" instruction is
>>>       rejected with -EINVAL.
>>>
>>>   adjacent subsystems
>>>       an EFI runtime call does not clobber ALLINT; perf events keep
>>>       counting across an ALLINT toggle.
>>>
>>>   genirq
>>>       add_interrupt_randomness() is never called in NMI context.
>>>
>>>   CPU stop
>>>       spin one CPU with IRQs disabled, then panic: the stop escalation
>>>       reaches the NMI rung, "SMP: retry stop with NMI for CPUs 0".
>>>
>>> # The problem
>>>
>>> SDEI wins over the architected IPI path, unconditionally
>>>
>>> arch_trigger_cpumask_backtrace() returns as soon as
>>> sdei_nmi_trigger_cpumask_backtrace() succeeds, so on a platform where
>>> firmware offers SDEI event 0 the irqchip NMI path is never reached.
>>>
>>> More importantly PSTATE.ALLINT has no effect on the backtrace:
>>>
>>>     SDEI active   : cpumask_backtrace() returns in ~14 ms with ALLINT set
>>>     SDEI disabled : the same call takes ~1.5 s   with ALLINT set
>>>
>>> That is, the NMI delivered by SDEI bypasses the PSTATE.ALLINT masking
>>> (the interruption is cleared within 14 ms). The NMI that goes through
>>> the GIC superpriority is restricted by ALLINT (the masking is cleared
>>> after 1.5s).
>> Hi Vladimir,
>>
>> Is this expected? Can FEAT_NMI and SDEI cross CPU coexist?
>>
> 
> IIUC, this is the nature of SDEI, so it could bypass DAIF in
> the case of pseudo-NMI (I'm not sure whether this scenario is
> covered by your testing)

It can also bypass ALLINT, which sounds incredible.

> 
> This makes me wonder whether SDEI, pseudo-NMI, and FEAT_NMI
> should be mutually exclusive... meanwhile, let's try to make

Currently, pseudo-NMI and FEAT_NMI are mutually exclusive by design,
while the relationship between SDEI and pseudo-NMI, as well as the
relationship between SDEI and FEAT_NMI, still appear to be coupled.

Mutual exclusion can more easily prevent the introduction of unnecessary
issues.

> progress with what we already have and figure this out in
> parallel.


Looking forward to your work.

Best regards,
Jinjie

> 
> Cheers
> Vladimir
> 
>>> And there is no equivalent of "irqchip.gicv3_pseudo_nmi=" for SDEI NMI.
>>>
>>> The patch used for the SDEI switch is as below.
>>>
>>> Best regards,
>>> Jinjie
>>>
>>> diff --git a/drivers/firmware/arm_sdei_nmi.c
>>> b/drivers/firmware/arm_sdei_nmi.c
>>> index 038eb79e28ac..22e8c3e7aa75 100644
>>> --- a/drivers/firmware/arm_sdei_nmi.c
>>> +++ b/drivers/firmware/arm_sdei_nmi.c
>>> @@ -62,6 +62,24 @@
>>>
>>>  static bool sdei_nmi_available;
>>>
>>> +static bool sdei_nmi_disabled __ro_after_init;
>>> +
>>> +static int __init sdei_nmi_disable_setup(char *str)
>>> +{
>>> +       return kstrtobool(str, &sdei_nmi_disabled);
>>> +}
>>> +early_param("sdei_nmi.disabled", sdei_nmi_disable_setup);
>>> +
>>>  #define SDEI_NMI_EVENT                 0
>>>
>>>  /*
>>> @@ -168,7 +186,7 @@ static void sdei_nmi_raise_backtrace(cpumask_t *mask)
>>>   */
>>>  bool sdei_nmi_trigger_cpumask_backtrace(const cpumask_t *mask, int
>>> exclude_cpu)
>>>  {
>>> -       if (!sdei_nmi_available)
>>> +       if (!sdei_nmi_available || sdei_nmi_disabled)
>>>                 return false;
>>>
>>>         nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
>>> @@ -194,6 +212,9 @@ void sdei_nmi_stop_cpus(const cpumask_t *mask)
>>>  {
>>>         unsigned int cpu;
>>>
>>> +       if (sdei_nmi_disabled)
>>> +               return;
>>> +
>>>         WRITE_ONCE(sdei_nmi_stopping, true);
>>>
>>>         /*
>>> @@ -238,6 +259,10 @@ static int __init sdei_nmi_init(void)
>>>         }
>>>
>>>         sdei_nmi_available = true;
>>> +       if (sdei_nmi_disabled) {
>>> +               pr_info("Sdei nmi disabled by sdei_nmi.disabled\n");
>>> +               return 0;
>>> +       }
>>>         pr_info("using SDEI cross-CPU NMI (SDEI_EVENT_SIGNAL, event %u)\n",
>>>                 SDEI_NMI_EVENT);
>>>
>>> 在 2026/11/12 21:20, Vladimir Murzin 写道:
>>>> FEAT_NMI provides an architected mechanism for supporting non-maskable
>>>> interrupts (NMIs) and less-masked interrupts (LMIs).
>>>>
>>>> Since we already support pseudo-NMIs via priority masking, introducing
>>>> another flavour of NMI on top of the existing infrastructure could
>>>> easily become messy, making the code harder to follow and reason
>>>> about.
>>>>
>>>> To avoid that, this series first makes room for the new NMI "tenant"
>>>> by restructuring the existing exception masking logic.
>>>>
>>>> The main idea is to separate the logical view of exception state from
>>>> its hardware representation. To achieve this, we introduce logical
>>>> exception contexts that can be mapped onto the corresponding hardware
>>>> state. This naturally consolidates the hardware-specific handling into
>>>> a small number of places, while allowing the rest of the code to
>>>> operate purely in terms of logical exception contexts.
>>>>
>>>> Since this restructuring is non-trivial and carries a risk of subtle
>>>> behavioural changes, the series adds extensive debug checks to verify
>>>> that the hardware state always matches the expected logical state.
>>>>
>>>> With this restructuring in place, wiring FEAT_NMI into the new
>>>> framework becomes much more manageable. GIC support for NMI is build
>>>> on top.
>>>>
>>>> This work would not have been possible without the contributions of
>>>> Ada Couprie Diaz, Mark Brown, and Lorenzo Pieralisi - please credit
>>>> them for everything that works well. Any remaining bugs or issues are
>>>> entirely my own.
>>>>
>>>> Most of the testing has been done on QEMU, Fast Model and pre-silicon
>>>> environment, so the series definitely benefit from extensive testing
>>>> on real hardware (without NMI, with pseudo-NMI, and with FEAT_NMI).
>>>>
>>>> Patches are organized as follow
>>>>
>>>> 1 - 15
>>>>   Rework of existing pseudo-NMI logic to make room for FEAT_NMI
>>>>
>>>> 16 - 33
>>>>   FEAT_NMI support including some preparation patches which have
>>>>   no dependencies:
>>>>     - efi/runtime-wrappers: Permit architectures to override IRQ flags checks
>>>>     - arm64: smp: Abstract SGI and LPI operations
>>>>
>>>> 34 - 35
>>>>   GICv3 support for NMI
>>>>
>>>> 36 - 39
>>>>   GICv5 support for NMI (including some preparation patches)
>>>>
>>>> Changelog
>>>>
>>>>   v1 -> v2
>>>>
>>>>     - Rebased on v7.4-rc2
>>>>     - Select HAVE_PERF_EVENTS_NMI when FEAT_NMI is enabled
>>>>     - Reworked APEI SEA handling to mask exceptions sequentially   
>>>>     - Updated GICv3 initialization to clear NMI configuration
>>>>     - Added Tested-by and Reviewed-by tags where approriate
>>>>     - Droped tags due to meaningful changes for:
>>>>       + "arm64: replace local_daif helpers"
>>>>       + "irqchip/gic-v3: Implement FEAT_GICv3_NMI support"
>>>>
>>>>   RFC v2 -> v1
>>>>
>>>>     - Rebased on v7.3-rc3.
>>>>     - Dropped RFC tag, have not received objections, at the same time
>>>>       got support from Jinjie
>>>>     - Dropped prerequisite patches already present in the newer base
>>>>     - Added logic to reject probing/stepping over ALLINT
>>>>     - Moved addition of arm64_debug_exc_context() in separate patch
>>>>     - Reworked debug logic for validating direction of exception
>>>>       transition
>>>>     - Split support for NMI in GICv5 in 3 separate patches
>>>>     - Added review tags
>>>>
>>>>   RFC v1 -> RFC v2
>>>>
>>>>     - Rebased on v7.2-rc5.
>>>>     - Improved commit descriptions.
>>>>     - Split some patches into smaller ones.
>>>>     - Added a graceful fallback for IPI requests when FEAT_NMI is
>>>>       supported by the CPU but unsupported by the interrupt
>>>>       controller.
>>>>     - Split the GICv3 preparation from the FEAT_GICv3_NMI
>>>>       implementation.
>>>>     - Added NMI support to GICv5, primarily as an illustration of the
>>>>       implementation, although it also happens to work on Fast Model.
>>>>     - Added review tags only to unchanged patches. Review tags were
>>>>       intentionally dropped from modified patches to reflect those
>>>>       changes and encourage re-review.
>>>>
>>>> RFC v1:
>>>>   https://lore.kernel.org/linux-arm-kernel/20260709121333.23507-1-vladimir.murzin@arm.com/
>>>>
>>>> RFC v2:
>>>>   https://lore.kernel.org/linux-arm-kernel/20260727163453.7969-1-vladimir.murzin@arm.com/
>>>>
>>>> v1:
>>>>   https://lore.kernel.org/linux-arm-kernel/20260914102102.68597-1-vladimir.murzin@arm.com/
>>>>
>>>> Thanks!
>>>> Vladimir
>>>>
>>>> Ada Couprie Diaz (15):
>>>>   arm64: irqflags: Introduce arm64-specific irqflags type
>>>>   arm64: irqflags: save and use both DAIF and PMR
>>>>   arm64: interrupts: Add common exception state helpers
>>>>   arm64: entry: Introduce entry specific exception masking helpers
>>>>   arm64: entry: replace DAIF helpers with entry helpers
>>>>   arm64: interrupts: Introduce exception masking save/restore helpers
>>>>   arm64: interrupts: introduce a helper for GIC priority initialization
>>>>   arm64: replace local_daif helpers
>>>>   arm64: cpuidle: use new helpers to bypass interrupt priority masking
>>>>   arm64: remove daifflags.h
>>>>   arm64: gicv3: remove GIC_PRIO_PSR_I_SET
>>>>   arm64: ptrace: Add PSR_ALLINT_BIT
>>>>   arm64: cpufeature: Detect PE support for FEAT_NMI
>>>>   arm64: nmi: Manage masking for superpriority interrupts
>>>>   arm64: irq: Report FEAT_NMI masking local IRQs
>>>>
>>>> Lorenzo Pieralisi (2):
>>>>   irqchip/gic-v3: Rename nmi to pseudo_nmi
>>>>   irqchip/gic-v3: Implement FEAT_GICv3_NMI support
>>>>
>>>> Mark Brown (5):
>>>>   arm64: booting: Document boot requirements for FEAT_NMI
>>>>   arm64: sysreg: Add definitions for immediate versions of MSR ALLINT
>>>>   arm64: idreg: Add an override for FEAT_NMI
>>>>   arm64: nmi: Add handling of superpriority interrupts as NMIs
>>>>   arm64: nmi: Add Kconfig for NMI
>>>>
>>>> Vladimir Murzin (17):
>>>>   arm64: process: Lift check for exception state to generic
>>>>     infrastructure
>>>>   arm64: cpufeature: Remove system_has_prio_mask_debugging()
>>>>   arm64: irqflags: Switch to CONFIG_DEBUG_IRQFLAGS
>>>>   arm64: Kconfig: Remove CONFIG_ARM64_DEBUG_PRIORITY_MASKING
>>>>   efi/runtime-wrappers: Permit architectures to override IRQ flags
>>>>     checks
>>>>   arm64/efi: Implement override for IRQ flags checks
>>>>   arm64: probes: Reject stepping over ALLINT
>>>>   arm64: suspend: Always initialise PSTATE.ALLINT
>>>>   arm64/efi: Add ALLINT to IRQ flags checks
>>>>   arm64: kprobes: Disable NMIs
>>>>   arm64: smp: Abstract SGI and LPI operations
>>>>   arm64: smp: Fall back to IRQ when IPI NMI request fails
>>>>   arm64: nmi: Select HAVE_PERF_EVENTS_NMI for FEAT_NMI
>>>>   arm64: smp: Add NMI support for LPI-backed IPIs
>>>>   genirq: Trust local irqchip when considering IRQ for NMI
>>>>   genirq: Do not call add_interrupt_randomness() in NMI context
>>>>   irqchip/gic-v5: Add NMI support
>>>>
>>>>  Documentation/arch/arm64/booting.rst          |   6 +
>>>>  arch/arm64/Kconfig                            |  31 +-
>>>>  arch/arm64/include/asm/assembler.h            |  20 +-
>>>>  arch/arm64/include/asm/cpucaps.h              |   2 +
>>>>  arch/arm64/include/asm/cpufeature.h           |  14 +-
>>>>  arch/arm64/include/asm/cpuidle.h              |  18 +-
>>>>  arch/arm64/include/asm/daifflags.h            | 144 --------
>>>>  arch/arm64/include/asm/efi.h                  |  42 ++-
>>>>  arch/arm64/include/asm/entry-common.h         |   8 +-
>>>>  arch/arm64/include/asm/insn.h                 |   1 +
>>>>  .../include/asm/interrupts/common_flags.h     | 255 +++++++++++++
>>>>  arch/arm64/include/asm/interrupts/entry.h     | 102 ++++++
>>>>  arch/arm64/include/asm/interrupts/masking.h   | 166 +++++++++
>>>>  arch/arm64/include/asm/irqflags.h             | 150 ++++----
>>>>  arch/arm64/include/asm/kvm_host.h             |   1 -
>>>>  arch/arm64/include/asm/mmu_context.h          |   1 -
>>>>  arch/arm64/include/asm/ptrace.h               |  25 +-
>>>>  arch/arm64/include/asm/sysreg.h               |   2 +
>>>>  arch/arm64/include/uapi/asm/ptrace.h          |   1 +
>>>>  arch/arm64/kernel/acpi.c                      |  43 +--
>>>>  arch/arm64/kernel/cpufeature.c                |  68 +++-
>>>>  arch/arm64/kernel/debug-monitors.c            |   1 -
>>>>  arch/arm64/kernel/entry-common.c              | 335 +++++++++++++-----
>>>>  arch/arm64/kernel/entry.S                     |  14 +-
>>>>  arch/arm64/kernel/hibernate.c                 |  14 +-
>>>>  arch/arm64/kernel/hw_breakpoint.c             |  16 +-
>>>>  arch/arm64/kernel/irq.c                       |  45 ++-
>>>>  arch/arm64/kernel/machine_kexec.c             |   4 +-
>>>>  arch/arm64/kernel/pi/idreg-override.c         |   1 +
>>>>  arch/arm64/kernel/probes/decode-insn.c        |  11 +-
>>>>  arch/arm64/kernel/probes/kprobes.c            |  24 +-
>>>>  arch/arm64/kernel/process.c                   |  24 +-
>>>>  arch/arm64/kernel/setup.c                     |   4 +-
>>>>  arch/arm64/kernel/signal.c                    |   1 -
>>>>  arch/arm64/kernel/smp.c                       | 217 ++++++++----
>>>>  arch/arm64/kernel/suspend.c                   |  14 +-
>>>>  arch/arm64/kernel/traps.c                     |   1 -
>>>>  arch/arm64/kvm/hyp/nvhe/switch.c              |   2 +-
>>>>  arch/arm64/kvm/hyp/vgic-v3-sr.c               |   7 +-
>>>>  arch/arm64/kvm/hyp/vhe/switch.c               |  14 +-
>>>>  arch/arm64/mm/fault.c                         |   1 -
>>>>  arch/arm64/mm/mmu.c                           |   7 +-
>>>>  arch/arm64/tools/cpucaps                      |   2 +
>>>>  drivers/firmware/efi/runtime-wrappers.c       |  32 +-
>>>>  drivers/irqchip/irq-gic-v3.c                  | 145 +++++++-
>>>>  drivers/irqchip/irq-gic-v5.c                  | 244 ++++++++++++-
>>>>  include/linux/irq.h                           |   2 +-
>>>>  include/linux/irqchip/arm-gic-v3-prio.h       |   8 -
>>>>  include/linux/irqchip/arm-gic-v3.h            |   4 +
>>>>  kernel/irq/handle.c                           |   3 +-
>>>>  kernel/irq/manage.c                           |   5 -
>>>>  51 files changed, 1696 insertions(+), 606 deletions(-)
>>>>  delete mode 100644 arch/arm64/include/asm/daifflags.h
>>>>  create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h
>>>>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
>>>>  create mode 100644 arch/arm64/include/asm/interrupts/masking.h
>>>>
> 


