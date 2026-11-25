Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E886606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PbiRp9rT;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iBMfFiP0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Hdtm1Cjt8si2zXvxnXIwwBJ380UcY/zgg0civLIThwU=; b=PbiRp9rTYlV8Ki
	D263IU4PL2qLKHtakH2HPohxzyqkWzTU9emNk998yYZXK2u8idXCEPDOS0mImQSjBtDMEVCog9VTm
	AE7rmq75SG8H3+4HJf/zWINdtzidrJBq4EnPiGrkNwNrq/fGhY5qe3GTP4GM8vX4cj2roNeq9uuyL
	XBRNVhRfRNSHIhwTCCA/Sj7hH4Gc5rL44BNjfvSoLryeb3uP6KZD4naOpYHdOw3vHNbVTtY2CluvK
	YhQTdNHj4/3QYqwxleBJrqogrdDFhUJadLv/O6/Slg/vgGD6AWl9EAnX+0C8ZL8+3mcxnWwaWCBGU
	/twnRjaE6FDZ5OeIMZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFDY-0000000ARPW-0mL6;
	Wed, 25 Nov 2026 15:47:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFDV-0000000AROF-2D2z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:47:31 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so64082315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795621647; x=1796226447; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hdtm1Cjt8si2zXvxnXIwwBJ380UcY/zgg0civLIThwU=;
        b=iBMfFiP03OR9eCDSYT0unHppNacwPXYWwzMI85QNrAQb9eGZ9NoZ1jW5hIgTRZP48T
         uUx3v3yM+7yt4hLfak7gt7IQBuuuqC7jUFq4FxLo1vWCMK3cHyOJog7Y+CjfJwIbTrEi
         slVsv+VQgkNBGxEOGgc2QBR4qs7eL2N9LqRcE/PVXBFBxr8zP7QzdMVJavDdpglZrkhl
         6sh7cYvPTq47SvZrH5Bj0nQuNJEznE8nvaGDq+nY07qNODUcKBzQ9pUB2CIZCF8Lf/Za
         XJ6l3p/oOHCCSVlC7KFHDJrqxoVeo7soeUq6WT6hd8hEvrygWB6Ez//5N/PWZrTPz7qY
         P6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621647; x=1796226447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hdtm1Cjt8si2zXvxnXIwwBJ380UcY/zgg0civLIThwU=;
        b=N5EuzX3a24Fm6PpJ8B99nc/POgDg37w05caiWr9tSV1hYZ4DlD/KNIUgyikI/SwwJ5
         Vz+2VgVIOf9pOJQYJO6ELiwpbO/AN8476djNA45hjhAVzC+KJN2oxjuKKS2u9WX4XLqe
         vYkQtZ39fPrpnpy0SYGKfEk6xLqnT4s4KjwZPYiMW5mnYTdgSqvGsV99t1Xbh+jlZvCs
         VM8lgtg7Mzp2goz49djXCnxLmFgqpkpFjmb/bKwLz+VxS44+2Ua9IMSjdMc+78YfCSOP
         GQc9r23M4L1zlBAwu4tiMBfHv7hjLHK4nARv93YBFQrGa+Wbnttye9F9VlQM0Dl3ZY4W
         wmKw==
X-Forwarded-Encrypted: i=1; AL+hErHFaFjyskau7ZkHfiucUkGpQHLWTzHI8jvN/Z36PeE9QtZ8lYsNXk2/NQNNrSTClWN0c9eWrRVSNWRKPwfL7TKk@lists.infradead.org
X-Gm-Message-State: APuU4Z9/bUAKT7ZvDR+ZCsV94X2HvtaDQFBdmmlKC4KmQgry7wcv5GWx
	45D1avXKjW++pPhMP1X9HfImx7CwV3dkIwe2BkwhlCf/Zgx2LBPV+nva2irPiq/g9hQ=
X-Gm-Gg: AZFdTZdv21BSqx09tF26GsIsb4BW1r1K/gWTAgu93dUoFJiFxRYwR3wap+zERZp9xha
	Ubgh/gfLEFK8jW/nILqbbchETVGq2gbCiMLVrp6tOeLSqSW8GphmqPFZuaW3q2+2ApWkIwp2oci
	G5yOriH9b0tetITS8oOIx2kG3BrTMnQby31RIdCCgnxQdex8bZV6wcgAdMPX69UIPovMB1DP6jq
	VAXi1OCSjnXL/TQm0L7W4mg+VQbi2ZA175GXVg7/VcOfwNOkhO3Sy+Y103Mdv5+7itVcnGGqYBu
	vIqWHRxQRHQfLT1Ljj9VNBJ5haRdf4Zu3mq50mXYglT7KsVSX6Qd9O8jbJBt6IzkMe7YHM7H19h
	woJEH5gL+TVXpYkoK99NPKGJdbbej57YTZwj8aOf4Vity1gQ9aGua/WX/BwQi0oFM5Q3mqUktwb
	AZW3HVNaQ+7hUUOsQ+/jGxFtJ4aeF/kQbRyPqpBPrXB7zZ0nmIWFjgd5IUVSVdS2jxlHuqUPY09
	T+WHq1XA+Tj/iDPcr2AGjfdNUa88amr6LLERWEcnQFz3tmu5sOChw52gzVcbNcp4aJG26Y5M7Z+
	prs6Mmelselt3wQyOeXGKUBx+WU71TsBqw==
X-Received: by 2002:a05:600c:3b8a:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb8880f0e0mr374641285e9.5.1795621647405;
        Wed, 25 Nov 2026 07:47:27 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm485293665e9.12.2026.11.25.07.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:47:26 -0800 (PST)
Message-ID: <6a874faa-04d0-4c8f-aa23-2a80fa1fa379@linaro.org>
Date: Wed, 25 Nov 2026 15:47:25 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/33] ARM64 PMU Partitioning
To: Colton Lewis <coltonlewis@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>,
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Mingwei Zhang <mizhang@google.com>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
References: <20261119185215.632334-1-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_074729_638592_5D12CB30 
X-CRM114-Status: GOOD (  33.63  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 19/11/2026 18:51, Colton Lewis wrote:
> This series creates a new PMU scheme on ARM, a partitioned PMU that
> allows reserving a subset of counters for more direct guest access,
> significantly reducing overhead. More details, including performance
> benchmarks, can be read in the v1 cover letter linked below.
> 
> PMU partitioning is controlled via the KVM API using
> `KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION` and
> `KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS` vCPU device attributes. When
> partitioning is enabled for a VM, userspace must explicitly configure a
> guest event counter count strictly less than the maximum general-purpose
> counters implemented by the PMU (leaving at least one general-purpose
> counter for the host) prior to calling `KVM_ARM_VCPU_PMU_V3_INIT`. The
> number of general-purpose counters implemented by each host PMU is
> exposed in sysfs at
> `/sys/bus/event_source/devices/<pmu>/caps/num_counters`. A QEMU patch
> demonstrating how to use the uAPI is sent separately.
> 
> An overview of what this series accomplishes was presented at KVM
> Forum 2025. Slides [1] and video [2] are linked below.
> 
> v10:
> 
> * Rebase on top of v7.4-rc3.
> 
> * Add nested virtualization (`FEAT_NV` / `FEAT_NV2`) support covering
>    both an Emulated L2 PMU (`vHPMN == N_L1`, `TPM == 1`, where L1 keeps
>    all `N_L1` counters and emulates L2 via L1 `perf` events) and a
>    Sub-partitioned L2 PMU (`vHPMN < N_L1`, `TPM == 0`, creating a
>    three-way split across `0..vHPMN-1` for L2, `vHPMN..N_L1-1` for L1,
>    and `N_L1..N_phys-1` for L0) (Oliver Upton). Because ARM64 provides
>    only a single physical `MDCR_EL2.HPMN` field, hardware can split the
>    PMU into two counter ranges at a time rather than three. Key design
>    decisions and supporting changes:
> 
>    - Keep physical `MDCR_EL2.HPMN = N_L1` at all times (`vHPMN` boundary
>      and event filtering): Lowering physical `HPMN` to `vHPMN` while
>      running L2 was considered and rejected because it would move L1's
>      hypervisor counters (`vHPMN..N_L1-1`) into the same physical
>      `>= HPMN` range as L0's host counters (`N_L1..N_phys-1`), where a
>      single set of physical `MDCR_EL2.{HPME,HPMD,HLP}` bits governs both
>      and breaks host/guest isolation; it would also fail for
>      `vHPMN == 0` on hardware without `FEAT_HPMN0`. Instead, when
>      `vHPMN < N_L1`, L0 keeps physical `HPMN = N_L1` and sets
>      `MDCR_EL2.{TPM,TPMCR}` in L2, forwarding `vHPMN..N_L1-1` traps to
>      L1 and handling `0..vHPMN-1` plus `PMCCNTR_EL0` in L0 directly
>      against physical registers. This preserves L0 isolation and
>      supports `vHPMN == 0` on all hardware; L2 events still count
>      directly in hardware without L0 `perf_event` scheduling, at the
>      cost of trapping L2 PMU accesses to L0 and rewriting per-counter
>      filter registers on `L1 <-> L2` transitions. In L1
>      (`is_hyp_ctxt()`), L0 emulates `vHPMN`, `vMDCR_EL2.HPMD`, and
>      `vMDCR_EL2.HCCD` via `PMEVTYPER<n>_EL0` and `PMCCFILTR_EL0`.
> 
>    - Dynamically multiplex `vPMCR_EL0.E` and `vMDCR_EL2.HPME`: Because
>      both `0..vHPMN-1` and `vHPMN..N_L1-1` sit below physical
>      `HPMN = N_L1`, hardware gates both with physical `PMCR_EL0.E`.
>      Rather than unconditionally trapping `PMCR_EL0` and `PMCNTEN*` for
>      all `FEAT_NV` VMs (which would penalize Emulated L2 PMU where
>      `vHPMN == N_L1`), L0 dynamically enables `MDCR_EL2.TPMCR` and
>      `HDFG{R,W}TR_EL2.PMCNTEN` only when `vHPMN < N_L1`. L0 keeps
>      architectural `PMCR_EL0` and `PMCNTENSET_EL0` in memory, sets
>      physical `PMCR_EL0.E` to `vPMCR_EL0.E || vMDCR_EL2.HPME`, masks
>      disabled sub-ranges out of physical `PMCNTENSET_EL0`, and gates
>      overflow delivery per domain. Trapped `PMSWINC_EL0` writes (also
>      enabled via `HDFGWTR_EL2` when `vHPMN < N_L1`) flush live registers
>      and reuse `kvm_pmu_software_increment()` to prevent cross-partition
>      chaining.
> 
>    - Bias 32-bit counters on mismatched `vPMCR_EL0.LP != vMDCR_EL2.HLP`
>      (`FEAT_PMUv3p5`): When `LP == HLP`, physical `PMCR_EL0.LP` matches
>      both domains directly and `PMEVCNTR<n>_EL0` stays untrapped in L1.
>      When `vHPMN < N_L1` and `LP != HLP`, rather than ignoring the
>      mismatch (breaking 32-bit overflow interrupts) or falling back to
>      `perf_event` emulation mid-flight (requiring reservation teardown),
>      L0 forces physical `PMCR_EL0.LP = 1` (64-bit overflow), dynamically
>      traps `HDFG{R,W}TR_EL2.PMEVCNTRn_EL0`, and biases counters in the
>      32-bit sub-range `2^32` events below 64-bit overflow
>      (`0xffffffff00000000 | low32`) while tracking their upper-32-bit
>      offsets and re-biasing outside interrupt/NMI context. Because
>      `HDFG{R,W}TR_EL2.PMEVCNTRn_EL0` is a single trap bit covering all
>      event counters (`0..30`), L1 counter reads/writes trap across both
>      sub-ranges while `LP != HLP`, with zero overhead when `LP == HLP`.
> 
>    - Baseline nested support (both Emulated and Sub-partitioned L2):
>      separate implemented and accessible counter masks by using
>      `nr_pmu_counters` directly in `kvm_pmu_implemented_counter_mask()`,
>      masking trapped guest reads of `PMCNTEN*`, `PMINTEN*`, and `PMOVS*`
>      with `kvm_pmu_accessible_counter_mask()`, and ignoring
>      `MDCR_EL2.HPMN` in userspace `KVM_GET_ONE_REG` / `KVM_SET_ONE_REG`
>      (`set_pmreg()`, `get_pmreg()`, `get_pmcr()`) so saving/restoring a
>      nested vCPU paused below EL2 preserves all VM-implemented counters
>      and true `PMCR_EL0.N`; preserve host counter reservations across
>      `IN_NESTED_ERET` / `IN_NESTED_EXCEPTION` transitions to avoid host
>      `perf` reschedules on emulated L2 traps; read live hardware
>      `PMSELR_EL0` in `check_mdcr_hpmn()` when untrapped; and forward
>      fine-grained traps for selector-indexed `PMXEVTYPER_EL0` and
>      `PMXEVCNTR_EL0` to L1.
> 
> * Expose the number of general-purpose counters implemented by the PMU
>    in sysfs under `/sys/bus/event_source/devices/<pmu>/caps/num_counters`
>    so userspace VMMs can query host PMU counter capacity when configuring
>    a partitioned PMU (James Clark).
> 
> * Make `__vcpu_rmw_sys_reg()` atomic on the local CPU using
>    `try_cmpxchg_local()` to prevent read-modify-write races with GICv3
>    pseudo-NMI PMU interrupt handlers (`kvm_pmu_handle_guest_irq()`),
>    which are not masked by `local_irq_save()` (Sashiko AI Review).
> 
> * Construct `mdcr_el2` in a local variable before assigning
>    `vcpu->arch.mdcr_el2` once in `kvm_arm_setup_mdcr_el2()`, and mask
>    GICv3 pseudo-NMIs (`local_daif_save()`) across hardware PMU context
>    switches and `MDCR_EL2` updates (Sashiko AI Review).
> 
> * Prioritize kernel-owned pinned event groups (`is_kernel_event()`)
>    ahead of userspace pinned events in `perf_event_groups_cmp()` /
>    `perf_less_group_idx()` so kernel-owned per-CPU pinned events (such as
>    the hardlockup NMI watchdog if toggled at runtime) are scheduled before
>    userspace pinned events when `perf_pmu_resched_update()` reschedules
>    events out of guest-reserved counters (James Clark, Sashiko AI Review).
> 
> * Move `kvm_vcpu_reload_pmu()` from `arch/arm64/kvm/pmu-emul.c` to
>    `arch/arm64/kvm/pmu.c` in `KVM: arm64: Reorganize PMU functions`.
> 
> * Add `kvm_pmu_is_partitioned()`, `kvm_pmu_guest_counter_mask()`,
>    `kvm_pmu_handle_guest_irq()`, `kvm_pmu_host_start()`, and
>    `kvm_pmu_host_stop()` stubs to `arch/arm/include/asm/arm_pmuv3.h` to
>    fix 32-bit `ARCH=arm` builds (kernel test robot).
> 
> * Allow identical VM-wide PMU device attributes
>    (`KVM_ARM_VCPU_PMU_V3_SET_PMU`, `KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS`,
>    and `KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION`) to be applied across all
>    vCPUs when userspace initializes vCPUs sequentially (`CPU_FOREACH`),
>    validate `kvm_arm_pmu_part_hpmn(n) < max_counters` (requiring
>    `max_counters >= 2` for `n == 0` without `FEAT_HPMN0`), and restrict
>    `kvm->arch.supported_cpus` to `arm_pmu->supported_cpus` when
>    partitioning is enabled.
> 
> * Centralize partitioned PMU hardware register dispatch under
>    `kvm_pmu_direct_reg_read()` / `kvm_pmu_direct_reg_write()` with
>    preemption disabled (`kvm_pmu_part_on_cpu()`), guard lazy ownership
>    transitions in `kvm_pmu_part_overflow_status()` with
>    `scoped_guard(preempt)`, avoid matching `reset_unknown()` poison bits on
>    `PMCNTENSET_EL0` / `PMINTENSET_EL1` during `KVM_REQ_RELOAD_PMU`, and
>    schedule `KVM_REQ_RELOAD_PMU` on `KVM_SET_ONE_REG` writes so
>    `vcpu_put()` does not overwrite userspace register writes (Sashiko AI
>    Review).
> 
> * Support configuring 0 guest event counters (cycle counter only) on
>    Partitioned PMU hosts without `FEAT_HPMN0` whenever `max_counters >= 2`.
>    Writing `MDCR_EL2.HPMN = 0` without `FEAT_HPMN0` is architecturally
>    `CONSTRAINED UNPREDICTABLE`, which would otherwise prevent userspace
>    from creating a cycle-counter-only partitioned guest on CPUs lacking
>    `FEAT_HPMN0`. Instead, KVM programs physical `MDCR_EL2.HPMN = 1` via
>    `kvm_arm_pmu_part_hpmn()`, reserves and quiesces physical counter 0
>    alongside `PMCCNTR_EL0` so host perf continues using counters `1..N-1`,
>    keeps `MDCR_EL2.TPMCR = 1` so trapped `PMCR_EL0` reads report `N == 0`,
>    and enables fine-grained traps on `PMEVCNTRn_EL0`, `PMCNTEN`,
>    `PMINTEN`, and `PMSWINC_EL0` so counter 0 stays completely hidden
>    (`UNDEFINED` / RAZ / WI) while `PMCCNTR_EL0` remains untrapped on
>    `FEAT_FGT` hosts. Also clamp `MDCR_EL2.HPMN` against `nr_pmu_counters`
>    in `kvm_vcpu_read_pmcr()` and `kvm_pmu_direct_pmcr_read()`, and extend
>    `vpmu_counter_access` to verify `PMCCFILTR_EL0`, live `PMCCNTR_EL0`
>    counting, and trapped `UNDEFINED` / RAZ / WI behavior on counter 0 when
>    `n == 0`.
> 
> Tool-assisted development note (generated-content.rst):
> Several v10 additions (nested virtualization sub-partitioning,
> cycle-counter-only support without `FEAT_HPMN0`, the userspace `HPMN`
> masking fix, and cover letter text) were drafted and verified with AI
> coding assistance (Gemini) and pre-reviewed with Sashiko AI Review. All
> patches were reviewed, built (`arm64`, `CONFIG_ARM_PMU=n`, 32-bit `arm`),
> and tested on bare-metal Neoverse V2 and AmpereOne hosts (and under QEMU
> TCG for the userspace `HPMN` fix).
> 

Tested-by: James Clark <james.clark@linaro.org>

Re-tested some of the old bugs and ran the Perf tests on a partitioned 
guest on Orion O6 and N1SDP boards. Also tested some basic Perf commands 
in a nested guest using your QEMU patches on the FVP.

Had a quick scan through the patches and LGTM. I'm impressed you managed 
to get the sashiko comments down to just one for such a big patchset.


