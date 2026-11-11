Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BE860A6F64
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1M1NHWVV;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=dsOd07YQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SBdCP2zh3j6XNaACsfkbxQz/faSfXwTx9v0E3FO6ugE=; b=1M1NHWVVEB92B4SyK5SzMFM3n8
	XsERew8qQHAxMMKW5oVj1341RjYnBjF15es6od+TiNDFLJIh824i64HKsLxlLnmbPBGTWJ7XHnoGX
	t8UV05zgaEZoysgq5jr/kSdW5IxP3uO1jro8KU51YEOr7GrDwiejHJ8/xeQVi4/ewN7Zwz3Nu4FnK
	+LgSR59C8bV5sIo5rfNfe+4fWBYAtTKgOwhs7Y5OovO1MRgMzgoldhfjU+swbXzVvdXKtZ9qzeO6w
	949OTFoUfthk+MjM1NaTd8uTTOJUzrKrcvl+vn61np3GL+JpXjqN4GNOYskUlsMHMQnk3DqzOVDTg
	EDvZxlKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jF-00000006VYf-3Ov3;
	Wed, 11 Nov 2026 11:43:01 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6jB-00000006VW7-1k5Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:43:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SBdCP2zh3j6XNaACsfkbxQz/faSfXwTx9v0E3FO6ugE=;
	b=dsOd07YQ4Zru2PYL049qw9HGl2nb2FSL/ZCRQh9YXmQfLnYI1CcHGi6h78KU2Z4VyMIvA/aP0
	zY5KyaQ7BwwY4B06IObCKWSfjcrO2p1rbMrPbdIiTOLlo67OJfoHdWDvE3xDVPYgrzPe93SBbjG
	2FnFP3n0sd9RUc/hUE6KfC0=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jPhTS0G34zLlVY;
	Wed, 11 Nov 2026 19:42:36 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4A6574057C;
	Wed, 11 Nov 2026 19:42:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<anshuman.khandual@arm.com>, <thuth@redhat.com>, <james.morse@arm.com>,
	<yeoreum.yun@arm.com>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<mathieu.desnoyers@efficios.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v21 00/15] arm64: entry: Convert to Generic Entry
Date: Wed, 11 Nov 2026 19:42:10 +0800
Message-ID: <20261111114225.3977243-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_034258_146986_1F3C615C 
X-CRM114-Status: GOOD (  21.03  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series converts arm64 to the generic entry infrastructure.

Currently, architectures such as x86, RISC-V, LoongArch, PowerPC and
S390 use generic entry, which significantly reduces maintenance burden
and improves code elegance.  arm64 already adopted generic IRQ entry
in commit b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"),
making it the right time to complete the conversion.

This work brings arm64 in line with other major architectures,
reducing duplicated code and enabling future improvements like
Syscall User Dispatch and rseq time slice extension optimizations.

What this series does
=====================

Patch  1-2: Fix two issues related to rseq and pseudo single-step.
Patch 3-12: Do some minor refactoring to gradually align the generic
            entry code, without functional changes intended.
Patch   13: Officially switch ARM64 to the generic entry, used the
            functions provided by the framework, and deleted the
            duplicate code corresponding to ARM64.
Patch   14: Inline el0_svc_common() function to prevent performance
            regression.
Patch   15: Add related ptrace test cases and rseq test cases for two
            bug fixes.

Testing
========

Observable (non-ABI) changes worth calling out:

- The traceable functions on the syscall path change: syscall_trace_enter,
  syscall_trace_exit and el0_svc_common.constprop.0 are replaced by
  trace_syscall_enter, trace_syscall_exit and syscall_enter_audit, the
  same names x86, RISC-V, LoongArch already expose.

- CONFIG_DEBUG_RSEQ becomes unselectable on arm64 once GENERIC_ENTRY is
  set (rseq_syscall() becomes a no-op stub).  The equivalent check is
  done by __rseq_debug_syscall_return(), enabled with the "rseq_debug="
  boot option.

The new added selftests pass, and the rseq test also passes with
"rseq_debug=1" after the conversion.

On a KVM VM (2 vCPU pinned, LOCKDEP off), with the same config, the
syscall hot path shows no measurable regression. Each row below is
the mean of 10 runs:

    | Benchmark                         | baseline | generic entry |
    | --------------------------------- | -------- | ------------- |
    | UnixBench System Call Overhead    | 879982   | 877908        |
    | perf bench syscall basic 1M (ns)  | 197.29   | 197.37        |

Both differences are within the noise, so there is no measurable impact
on syscall overhead.

Stress-ng (syscall and cpu) and the kselftests (breakpoints, arm64/abi,
arm64/fp, vDSO) were also run and all pass.

The hackbench, ptrace stress, Pseudo-NMI and rr test suite [1] reported
for v20 were not repeated as the code unchanged apart from the rebase.

On gVisor with systrap mode, the Syscall User Dispatch (SUD) feature
yields a slightly lower performance gain on arm64 (3% ~ 5%), similar to
that on x86 [2].

Result: the average over 1M getpid calls, ns/op

    | KVM VM Configuration | SUD    | no-SUD | Savings % |
    | -------------------  | -----  | -------| --------- |
    | 2 vCPU, pinned       | 4269.8 | 4509.5 | 5.3%      |
    | 4 vCPU, pinned       | 4175.4 | 4369.1 | 4.4%      |
    | 8 vCPU, pinned       | 4352.6 | 4485.4 | 3.0%      |

Note that this series does not yet enable SUD or the rseq time slice
extension on arm64: SUD additionally needs
ARCH_SUPPORTS_SYSCALL_USER_DISPATCH [3] and the rseq slice extension
needs HAVE_GENERIC_TIF_BITS [4], neither of which arm64 selects today.
The numbers above are the motivation for enabling them in a follow-up.

The new selftests and tests are helped by an agent.

Testing follow-up that still requires real hardware:

- MTE: run the MTE selftests on real hardware; part of them do not run
  under QEMU.

[1]: https://github.com/rr-debugger/rr/wiki/Building-And-Installing#tests
[2]: https://github.com/google/gvisor/commit/a45d6227b521012109cde9a942d644d778eb773b
[3]: https://lore.kernel.org/all/20260721081858.1169276-16-ruanjinjie@huawei.com/
[4]: https://lore.kernel.org/all/20260320104222.1381274-1-ruanjinjie@huawei.com/

The series is rebased on v7.4-rc1 and also available at:
        https://github.com/ruanjinjie-eng/linux/commits/arm64_generic_entry_v21

Changes in v21:
- Rebased on v7.4-rc1.
- Pseudo-single-step patch rewritten as a bugfix.
- Rseq patch rewritten as a bugfix and moved to the front.
- Retitle and update the commit message.
- Selftests: replace the 2 SYSEMU tests with 5 tests that reproduce
  the problems fixed by the commit ac2081cdc4d99 ("arm64: ptrace:
  Consistently use pseudo-singlestep exceptions") series and the rseq
  issue.
- Solve the sashiko commit message issue.
- Link to v20: https://lore.kernel.org/all/20260930101805.1770358-1-ruanjinjie@huawei.com/

Changes in v20:
- Add a kselftest covering the syscall-exit pseudo-step
  and single-step behaviour.
- Reword the first patch: it skips the pseudo-step for the emulated
  syscall rather than "fixing a redundant exit stop", and drop the
  Fixes: tag and Reviewed-by.
- Add Tested-by.
- Cover letter: document the observable changes and the testing
  follow-ups.
- Link to v19: https://lore.kernel.org/all/20260922035510.1090299-1-ruanjinjie@huawei.com/

Changes in v19:
- Rebased on v7.3-rc4.
- Fix build problem as Karl pointed out.
- Remove has_syscall_work() later to make it more clear.
- Add gvisor test data.
- Link to v18: https://lore.kernel.org/all/20260902095537.602517-2-ruanjinjie@huawei.com/

For changes in v7 to v17, please refer to the individual patch threads:
- v17: https://lore.kernel.org/all/20260721081858.1169276-1-ruanjinjie@huawei.com/
- v16: https://lore.kernel.org/all/20260629130616.642022-1-ruanjinjie@huawei.com/
- v15: https://lore.kernel.org/all/20260511092103.1974980-1-ruanjinjie@huawei.com/
- v14: https://lore.kernel.org/all/20260320102620.1336796-1-ruanjinjie@huawei.com/
- v13: https://lore.kernel.org/all/20260317082020.737779-1-ruanjinjie@huawei.com/
- v12: https://lore.kernel.org/all/20260203133728.848283-1-ruanjinjie@huawei.com/
- v11: https://lore.kernel.org/all/20260128031934.3906955-1-ruanjinjie@huawei.com/
- v10: https://lore.kernel.org/all/20251222114737.1334364-1-ruanjinjie@huawei.com/
- v9: https://lore.kernel.org/all/20251204082123.2792067-1-ruanjinjie@huawei.com/
- v8: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/
- v7: https://lore.kernel.org/all/20251117133048.53182-1-ruanjinjie@huawei.com/

Jinjie Ruan (15):
  arm64: ptrace: Fix spurious pseudo-single-step for
    PTRACE_SYSEMU_SINGLESTEP
  arm64: ptrace: Check rseq critical section before reporting syscall
    exit
  arm64: ptrace: Add syscall_enter_audit() helper
  arm64: ptrace: Open-code seccomp check in syscall_trace_enter()
  arm64: ptrace: Rename and clean up syscall_trace_enter()
  arm64: syscall: Invert the exit-path flags check in el0_svc_common()
  arm64: ptrace: Pass thread flags to trace enter/exit
  arm64: ptrace: Extract arm64_syscall_exit_to_user_mode_work() helper
  arm64: ptrace: Only run syscall exit work when exit work flags are set
  arm64: syscall: Use exit-specific flags check in el0_svc_common()
  arm64: syscall: Simplify el0_svc_common() syscall exit path
  arm64: ptrace: Return bool from arm64_syscall_trace_enter()
  arm64: entry: Convert to generic entry
  arm64: Inline el0_svc_common()
  selftests/arm64: Add ptrace single-step and rseq syscall-exit tests

 arch/arm64/Kconfig                            |   2 +-
 arch/arm64/include/asm/entry-common.h         |  77 ++++++++
 arch/arm64/include/asm/syscall.h              |   5 +-
 arch/arm64/include/asm/thread_info.h          |  16 +-
 arch/arm64/kernel/debug-monitors.c            |   8 +
 arch/arm64/kernel/entry-common.c              |   2 +-
 arch/arm64/kernel/ptrace.c                    | 115 ------------
 arch/arm64/kernel/signal.c                    |   2 +-
 arch/arm64/kernel/syscall.c                   |  34 ++--
 tools/testing/selftests/arm64/Makefile        |   2 +-
 tools/testing/selftests/arm64/ptrace/Makefile |  12 ++
 .../selftests/arm64/ptrace/ptrace_common.h    | 101 ++++++++++
 .../selftests/arm64/ptrace/rseq_syscall_pc.c  | 130 +++++++++++++
 .../selftests/arm64/ptrace/rseq_syscall_pc.h  |  22 +++
 .../arm64/ptrace/rseq_syscall_pc_asm.S        |  45 +++++
 .../arm64/ptrace/single_step_signal_handler.c | 121 ++++++++++++
 .../arm64/ptrace/single_step_spsr_ss.c        |  79 ++++++++
 .../arm64/ptrace/single_step_syscall_stop.c   | 138 ++++++++++++++
 .../arm64/ptrace/sysemu_singlestep.c          | 172 ++++++++++++++++++
 19 files changed, 923 insertions(+), 160 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/ptrace/Makefile
 create mode 100644 tools/testing/selftests/arm64/ptrace/ptrace_common.h
 create mode 100644 tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/rseq_syscall_pc.h
 create mode 100644 tools/testing/selftests/arm64/ptrace/rseq_syscall_pc_asm.S
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_signal_handler.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_spsr_ss.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/single_step_syscall_stop.c
 create mode 100644 tools/testing/selftests/arm64/ptrace/sysemu_singlestep.c

-- 
2.34.1


