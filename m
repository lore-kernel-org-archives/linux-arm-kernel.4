Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE87606EE9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LFbLQJhk;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AO9X86Hc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fBfm9dsEkwLJa3RQILFcp1NS9oIiSGmRdrDoGcyXcLU=; b=LFbLQJhkT/nKVSPxSivMPIfrg8
	rOpnDX29aEHvLlwr8BKKtmoSBIGMdbIJXNLUpCNeMlIDuya9tAkkGTvuPgaYwUspMrbUAMFery6hJ
	NtJh3rl0NmI3fYLaCbW0Xl9S/joINxumLlu8JB7nn19JLqcXfmPtE4qSyfrqzyCQG7MZgPPBu6Ghj
	SQS8Uv1pg83Gyt7hx6t3BuLLGrF3f9Dp9mZp6MEZYsJS9LTXtbEVzKDOWhqn/z4rIZ7HDnD7j3kSr
	M5n3iAASusTxwC9cC6WnUyqYunR8HpYwQlSt9VVGg/m1ueq6q8d4j1uyceHGGTIoRRrYyGGL9mRNB
	FaDnTReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL3j-0000000075p-3kDD;
	Mon, 09 Nov 2026 08:48:59 +0000
Received: from out-137.mta0.migadu.com ([2001:41d0:1004:224b::89] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL3h-0000000074b-0IVz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:48:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1sOzaznMmJOHy+e+QiztzCqMUj8wOs6qA6WdAtqbHAA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794214135; v=1; x=1794818935;
 b=AO9X86HcTL0K+CGNnuBPjfjNLE4+VlvxSRRM58BvIX2mWYXf3ukrfXySEoc8qb2e9zLW7Q1H
 Hf8qEdzgN+FpuZ885LhNtC0c4Rig/HvT/lepYeYotNoH4ESpR+UhO6ucuCjKlr3+/qGFUR9ehHf
 zopKudzN3+xXVCFXQDvgNAIU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6d1e8b5ddadfa23a;
	Mon, 09 Nov 2026 08:48:54 +0000
X-Mizu-Trace-ID: 6d1e8b5ddadfa23a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/19] KVM: arm64: selftests: Tests for protected VMs
Date: Mon,  9 Nov 2026 08:48:35 +0000
Message-ID: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_004857_253537_16989421 
X-CRM114-Status: GOOD (  16.00  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Changes since v1 [1]:
  - New patch 1, which hides generic PtrAuth from a protected VM
    without PtrAuth. The pkvm_id_regs test checks for it.
  - New pkvm_sve test, and MOPS, PIE, POE and FPMR checks in
    pkvm_id_regs.
  - Use the selftest syscall wrappers and vm_check_cap().
  - Marked pkvm_hvc() as called from the guest. (Joey)
  - Collected Reviewed-by from Joey on patches 3, 6 and 7. (thanks!)

This series adds selftests for protected VMs. A test skips on a host
without pKVM, and so does any case where the host doesn't have the
required feature, e.g., PtrAuth, SVE or hugetlb pages.

A couple of points:

- Patch 1 is a fix, included here so that pkvm_id_regs can check the
  correct behaviour. Without it, generic PtrAuth is advertised to a
  protected VM without PtrAuth.

- Each area gets its own test rather than cases folded into existing
  tests such as psci_test, hypercalls, set_id_regs, etc. A protected
  guest requires its own boot path, and has to share the ucall pool
  before its first ucall. On top of that, a protected guest gets the
  opposite result for many of those tests' checks.

- Cases for a feature a protected VM may not have follow what the VM
  is given, so they pass with or without the series that adds it [2],
  and run once it lands. The debug cases follow
  ID_AA64DFR0_EL1.DebugVer, the SVE cases KVM_CAP_ARM_SVE on a
  protected VM's fd, and the MOPS, PIE, POE and FPMR checks their ID
  register fields.

The series is structured as follows:

  01:     Hide generic PtrAuth from protected VMs without PtrAuth.
  02:     external_aborts: an abort injected before a vCPU's first run.
  03-05:  Generic selftest changes: creating a protected VM, the pKVM
          function IDs and the ucall pool's address.
  06-07:  Protected-VM library: boot trampoline and helpers.
  08-18:  The tests, one per area.
  19:     MOPS, PIE, POE and FPMR checks in pkvm_id_regs.

Based on Linux 7.4-rc1 (6628e7d4c6b25; also applies to 7.4-rc2 7475ea8b58616).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261104084842.132944-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20261109083205.806619-1-fuad.tabba@linux.dev/

Fuad Tabba (18):
  KVM: arm64: Hide generic ptrauth from protected VMs without ptrauth
  KVM: arm64: selftests: Inject an abort before a vCPU's first run
  KVM: selftests: Allow arm64 tests to create protected VMs
  tools: arm-smccc: Add the pKVM memory sharing function IDs
  KVM: selftests: Export the ucall pool's guest physical address
  KVM: arm64: selftests: Add protected-VM library helpers
  KVM: arm64: selftests: Add pkvm_host_abi host-interface test
  KVM: arm64: selftests: Add pkvm_psci multi-vCPU PSCI test
  KVM: arm64: selftests: Add pkvm_mem_share hypercall test
  KVM: arm64: selftests: Add pkvm_smccc hypercall test
  KVM: arm64: selftests: Add pkvm_id_regs register and trap test
  KVM: arm64: selftests: Add pkvm_vcpu_regs register-state test
  KVM: arm64: selftests: Add pkvm_irq interrupt test
  KVM: arm64: selftests: Add pkvm_isolation host-access test
  KVM: arm64: selftests: Add pkvm_lifecycle teardown test
  KVM: arm64: selftests: Add pkvm_exceptions debug and SError test
  KVM: arm64: selftests: Add pkvm_sve vector-length test
  KVM: arm64: selftests: Check MOPS, PIE, POE and FPMR in a protected VM

Will Deacon (1):
  KVM: arm64: selftests: Add protected-VM boot trampoline

 arch/arm64/kvm/hyp/nvhe/sys_regs.c            |   4 +-
 tools/include/linux/arm-smccc.h               |  22 +
 tools/testing/selftests/kvm/Makefile.kvm      |  13 +
 .../selftests/kvm/arm64/external_aborts.c     |  21 +
 .../selftests/kvm/arm64/pkvm_exceptions.c     | 261 ++++++++
 .../selftests/kvm/arm64/pkvm_host_abi.c       | 435 ++++++++++++
 .../selftests/kvm/arm64/pkvm_id_regs.c        | 394 +++++++++++
 tools/testing/selftests/kvm/arm64/pkvm_irq.c  | 268 ++++++++
 .../selftests/kvm/arm64/pkvm_isolation.c      | 225 +++++++
 .../selftests/kvm/arm64/pkvm_lifecycle.c      | 110 +++
 .../selftests/kvm/arm64/pkvm_mem_share.c      | 394 +++++++++++
 tools/testing/selftests/kvm/arm64/pkvm_psci.c | 632 ++++++++++++++++++
 .../testing/selftests/kvm/arm64/pkvm_smccc.c  | 117 ++++
 tools/testing/selftests/kvm/arm64/pkvm_sve.c  | 357 ++++++++++
 .../selftests/kvm/arm64/pkvm_vcpu_regs.c      | 218 ++++++
 .../selftests/kvm/include/arm64/pkvm.h        |  75 +++
 .../selftests/kvm/include/ucall_common.h      |   1 +
 tools/testing/selftests/kvm/lib/arm64/pkvm.c  | 255 +++++++
 .../selftests/kvm/lib/arm64/pvm-entry.S       |  57 ++
 tools/testing/selftests/kvm/lib/kvm_util.c    |   5 +-
 .../testing/selftests/kvm/lib/ucall_common.c  |   9 +-
 21 files changed, 3868 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_exceptions.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_host_abi.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_id_regs.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_irq.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_isolation.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_lifecycle.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_mem_share.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_psci.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_smccc.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_sve.c
 create mode 100644 tools/testing/selftests/kvm/arm64/pkvm_vcpu_regs.c
 create mode 100644 tools/testing/selftests/kvm/include/arm64/pkvm.h
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/pkvm.c
 create mode 100644 tools/testing/selftests/kvm/lib/arm64/pvm-entry.S

-- 
2.47.3


