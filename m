Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFA1606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4/X53CiA;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tPCR5WM9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6GJSudJpvwFc8XOPxiV+2MBqyFI7A/YUwmDwBb/gHEE=; b=4/X53CiAksCcVlocEvnu6sIQh3
	bUmEg/QNzlBMOBYr6ZApIvf3W512kcY6TVZjwR9S4Z4R5eF/3rv98FcNiVqA2Q5wF/ecuNLvSxGT+
	hgLzkDWAlpFNFoNxySUEothVREd9BDUst9630qoQyxBKJH4W/ljPonc1fHIs0YxDZtEPdRdrt+f+Y
	KBoevuwXo28dgP9cdSfdE6h8cbiM8VpWq6E4D6sclKMJtmXE8YzyBKbNa6yGSVHBFCsAksnLxGtxi
	0AER+Giz1myQL79xDvUCKTD6pH/0sG9xo5ingogRgciSC/frfYW0+zWk1vphy59ZCM4b9mCSx1L1E
	EFoJLakw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkJ-0000000A0Sg-0Won;
	Thu, 12 Nov 2026 13:21:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkG-0000000A0Rk-1LfB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:21:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47B8E1477;
	Thu, 12 Nov 2026 05:21:36 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D3DB83F632;
	Thu, 12 Nov 2026 05:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489699; bh=3ohek2Kd2aDE5AaqGrXT5gOBxoMrBHazWev3Yo/G+jk=;
	h=From:To:Cc:Subject:Date:From;
	b=tPCR5WM9csOeRHba3npS3yo9RwICQbZ1KOr1XiKDiRZOd4Wx/HTfimdn/iqI3rGuJ
	 qY++GaGGQUskaPOjZbdjMSGdSAnCdZFMDl8d/ZC2KP4OJLty+nMnyan70DkK3us8Bj
	 PGnEEbhHaB+Tx9asviR/7TmRx04ulWsWjPsMCE80=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com,
	ashok.raj@oss.qualcomm.com,
	maz@kernel.org
Subject: [PATCH v2 00/39] arm64: Add support for FEAT_NMI
Date: Thu, 12 Nov 2026 13:20:03 +0000
Message-Id: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052140_480263_EA9578C6 
X-CRM114-Status: GOOD (  22.18  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

FEAT_NMI provides an architected mechanism for supporting non-maskable
interrupts (NMIs) and less-masked interrupts (LMIs).

Since we already support pseudo-NMIs via priority masking, introducing
another flavour of NMI on top of the existing infrastructure could
easily become messy, making the code harder to follow and reason
about.

To avoid that, this series first makes room for the new NMI "tenant"
by restructuring the existing exception masking logic.

The main idea is to separate the logical view of exception state from
its hardware representation. To achieve this, we introduce logical
exception contexts that can be mapped onto the corresponding hardware
state. This naturally consolidates the hardware-specific handling into
a small number of places, while allowing the rest of the code to
operate purely in terms of logical exception contexts.

Since this restructuring is non-trivial and carries a risk of subtle
behavioural changes, the series adds extensive debug checks to verify
that the hardware state always matches the expected logical state.

With this restructuring in place, wiring FEAT_NMI into the new
framework becomes much more manageable. GIC support for NMI is build
on top.

This work would not have been possible without the contributions of
Ada Couprie Diaz, Mark Brown, and Lorenzo Pieralisi - please credit
them for everything that works well. Any remaining bugs or issues are
entirely my own.

Most of the testing has been done on QEMU, Fast Model and pre-silicon
environment, so the series definitely benefit from extensive testing
on real hardware (without NMI, with pseudo-NMI, and with FEAT_NMI).

Patches are organized as follow

1 - 15
  Rework of existing pseudo-NMI logic to make room for FEAT_NMI

16 - 33
  FEAT_NMI support including some preparation patches which have
  no dependencies:
    - efi/runtime-wrappers: Permit architectures to override IRQ flags checks
    - arm64: smp: Abstract SGI and LPI operations

34 - 35
  GICv3 support for NMI

36 - 39
  GICv5 support for NMI (including some preparation patches)

Changelog

  v1 -> v2

    - Rebased on v7.4-rc2
    - Select HAVE_PERF_EVENTS_NMI when FEAT_NMI is enabled
    - Reworked APEI SEA handling to mask exceptions sequentially   
    - Updated GICv3 initialization to clear NMI configuration
    - Added Tested-by and Reviewed-by tags where approriate
    - Droped tags due to meaningful changes for:
      + "arm64: replace local_daif helpers"
      + "irqchip/gic-v3: Implement FEAT_GICv3_NMI support"

  RFC v2 -> v1

    - Rebased on v7.3-rc3.
    - Dropped RFC tag, have not received objections, at the same time
      got support from Jinjie
    - Dropped prerequisite patches already present in the newer base
    - Added logic to reject probing/stepping over ALLINT
    - Moved addition of arm64_debug_exc_context() in separate patch
    - Reworked debug logic for validating direction of exception
      transition
    - Split support for NMI in GICv5 in 3 separate patches
    - Added review tags

  RFC v1 -> RFC v2

    - Rebased on v7.2-rc5.
    - Improved commit descriptions.
    - Split some patches into smaller ones.
    - Added a graceful fallback for IPI requests when FEAT_NMI is
      supported by the CPU but unsupported by the interrupt
      controller.
    - Split the GICv3 preparation from the FEAT_GICv3_NMI
      implementation.
    - Added NMI support to GICv5, primarily as an illustration of the
      implementation, although it also happens to work on Fast Model.
    - Added review tags only to unchanged patches. Review tags were
      intentionally dropped from modified patches to reflect those
      changes and encourage re-review.

RFC v1:
  https://lore.kernel.org/linux-arm-kernel/20260709121333.23507-1-vladimir.murzin@arm.com/

RFC v2:
  https://lore.kernel.org/linux-arm-kernel/20260727163453.7969-1-vladimir.murzin@arm.com/

v1:
  https://lore.kernel.org/linux-arm-kernel/20260914102102.68597-1-vladimir.murzin@arm.com/

Thanks!
Vladimir

Ada Couprie Diaz (15):
  arm64: irqflags: Introduce arm64-specific irqflags type
  arm64: irqflags: save and use both DAIF and PMR
  arm64: interrupts: Add common exception state helpers
  arm64: entry: Introduce entry specific exception masking helpers
  arm64: entry: replace DAIF helpers with entry helpers
  arm64: interrupts: Introduce exception masking save/restore helpers
  arm64: interrupts: introduce a helper for GIC priority initialization
  arm64: replace local_daif helpers
  arm64: cpuidle: use new helpers to bypass interrupt priority masking
  arm64: remove daifflags.h
  arm64: gicv3: remove GIC_PRIO_PSR_I_SET
  arm64: ptrace: Add PSR_ALLINT_BIT
  arm64: cpufeature: Detect PE support for FEAT_NMI
  arm64: nmi: Manage masking for superpriority interrupts
  arm64: irq: Report FEAT_NMI masking local IRQs

Lorenzo Pieralisi (2):
  irqchip/gic-v3: Rename nmi to pseudo_nmi
  irqchip/gic-v3: Implement FEAT_GICv3_NMI support

Mark Brown (5):
  arm64: booting: Document boot requirements for FEAT_NMI
  arm64: sysreg: Add definitions for immediate versions of MSR ALLINT
  arm64: idreg: Add an override for FEAT_NMI
  arm64: nmi: Add handling of superpriority interrupts as NMIs
  arm64: nmi: Add Kconfig for NMI

Vladimir Murzin (17):
  arm64: process: Lift check for exception state to generic
    infrastructure
  arm64: cpufeature: Remove system_has_prio_mask_debugging()
  arm64: irqflags: Switch to CONFIG_DEBUG_IRQFLAGS
  arm64: Kconfig: Remove CONFIG_ARM64_DEBUG_PRIORITY_MASKING
  efi/runtime-wrappers: Permit architectures to override IRQ flags
    checks
  arm64/efi: Implement override for IRQ flags checks
  arm64: probes: Reject stepping over ALLINT
  arm64: suspend: Always initialise PSTATE.ALLINT
  arm64/efi: Add ALLINT to IRQ flags checks
  arm64: kprobes: Disable NMIs
  arm64: smp: Abstract SGI and LPI operations
  arm64: smp: Fall back to IRQ when IPI NMI request fails
  arm64: nmi: Select HAVE_PERF_EVENTS_NMI for FEAT_NMI
  arm64: smp: Add NMI support for LPI-backed IPIs
  genirq: Trust local irqchip when considering IRQ for NMI
  genirq: Do not call add_interrupt_randomness() in NMI context
  irqchip/gic-v5: Add NMI support

 Documentation/arch/arm64/booting.rst          |   6 +
 arch/arm64/Kconfig                            |  31 +-
 arch/arm64/include/asm/assembler.h            |  20 +-
 arch/arm64/include/asm/cpucaps.h              |   2 +
 arch/arm64/include/asm/cpufeature.h           |  14 +-
 arch/arm64/include/asm/cpuidle.h              |  18 +-
 arch/arm64/include/asm/daifflags.h            | 144 --------
 arch/arm64/include/asm/efi.h                  |  42 ++-
 arch/arm64/include/asm/entry-common.h         |   8 +-
 arch/arm64/include/asm/insn.h                 |   1 +
 .../include/asm/interrupts/common_flags.h     | 255 +++++++++++++
 arch/arm64/include/asm/interrupts/entry.h     | 102 ++++++
 arch/arm64/include/asm/interrupts/masking.h   | 166 +++++++++
 arch/arm64/include/asm/irqflags.h             | 150 ++++----
 arch/arm64/include/asm/kvm_host.h             |   1 -
 arch/arm64/include/asm/mmu_context.h          |   1 -
 arch/arm64/include/asm/ptrace.h               |  25 +-
 arch/arm64/include/asm/sysreg.h               |   2 +
 arch/arm64/include/uapi/asm/ptrace.h          |   1 +
 arch/arm64/kernel/acpi.c                      |  43 +--
 arch/arm64/kernel/cpufeature.c                |  68 +++-
 arch/arm64/kernel/debug-monitors.c            |   1 -
 arch/arm64/kernel/entry-common.c              | 335 +++++++++++++-----
 arch/arm64/kernel/entry.S                     |  14 +-
 arch/arm64/kernel/hibernate.c                 |  14 +-
 arch/arm64/kernel/hw_breakpoint.c             |  16 +-
 arch/arm64/kernel/irq.c                       |  45 ++-
 arch/arm64/kernel/machine_kexec.c             |   4 +-
 arch/arm64/kernel/pi/idreg-override.c         |   1 +
 arch/arm64/kernel/probes/decode-insn.c        |  11 +-
 arch/arm64/kernel/probes/kprobes.c            |  24 +-
 arch/arm64/kernel/process.c                   |  24 +-
 arch/arm64/kernel/setup.c                     |   4 +-
 arch/arm64/kernel/signal.c                    |   1 -
 arch/arm64/kernel/smp.c                       | 217 ++++++++----
 arch/arm64/kernel/suspend.c                   |  14 +-
 arch/arm64/kernel/traps.c                     |   1 -
 arch/arm64/kvm/hyp/nvhe/switch.c              |   2 +-
 arch/arm64/kvm/hyp/vgic-v3-sr.c               |   7 +-
 arch/arm64/kvm/hyp/vhe/switch.c               |  14 +-
 arch/arm64/mm/fault.c                         |   1 -
 arch/arm64/mm/mmu.c                           |   7 +-
 arch/arm64/tools/cpucaps                      |   2 +
 drivers/firmware/efi/runtime-wrappers.c       |  32 +-
 drivers/irqchip/irq-gic-v3.c                  | 145 +++++++-
 drivers/irqchip/irq-gic-v5.c                  | 244 ++++++++++++-
 include/linux/irq.h                           |   2 +-
 include/linux/irqchip/arm-gic-v3-prio.h       |   8 -
 include/linux/irqchip/arm-gic-v3.h            |   4 +
 kernel/irq/handle.c                           |   3 +-
 kernel/irq/manage.c                           |   5 -
 51 files changed, 1696 insertions(+), 606 deletions(-)
 delete mode 100644 arch/arm64/include/asm/daifflags.h
 create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h
 create mode 100644 arch/arm64/include/asm/interrupts/entry.h
 create mode 100644 arch/arm64/include/asm/interrupts/masking.h

-- 
2.34.1


