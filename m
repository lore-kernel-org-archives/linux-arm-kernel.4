Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90232606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vRgYshoy;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UAmNmUqH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DjXxkJO09Tc2aC2/WFAZoPPM/xCjKbBvMJqJr4rhthQ=; b=vRgYshoyny+8dxaqXCMvR+76N4
	Dtx/jZ5ymH7uqCv4v9gviIBK7lpL/nHbaeY5Z4/BXUY4Gh+W9I64UgHKVXQIUeNQEmv/80xZ3CabO
	nCQ2OJK93u/NXHVFcDgvVmswH5xMloh8UPrmQ9vM9kJ8QYCb93KDrro0mSy0JEvaGVMEZ3BVFacaF
	XgVWSDdSc/InBoebpg5xzyCVmazQjNn607Z+a3QhRkaKHsU/HCTFRezqKlO3b1Y1rmXPvxBkbdksn
	awMnVVrEhChpCJyLKEQwUGbUF+EaxBN9/Lh977hceSOhEFhxiuxqYtR0Ur7UnB56tds/QDAiJfzkV
	H+ha44sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVgJ-00000003ugG-2Ryf;
	Mon, 23 Nov 2026 15:10:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVgG-00000003ufc-3ruu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:10:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69FCC143D;
	Mon, 23 Nov 2026 07:10:02 -0800 (PST)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 203273F632;
	Mon, 23 Nov 2026 07:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795446605; bh=CoKGKHf3X6ePMybvJ0+rBCrZ9GSS1W96TB5Eff/LIWs=;
	h=From:To:Cc:Subject:Date:From;
	b=UAmNmUqHY/Vl2F24ON3PyeqyELFzQxo9KglHjT7r0aOexNfnPrReUWA2lq2aORq+g
	 IwAjGM1CL3qCrV3R5kaMhzRauDjZqgWx8vIzXJgRqyIgaM/8FJLKo/Shiymg53Qnln
	 J0lwHZDL78emthTkO6XsSH6TFciD8PvGcxwXexgQ=
From: Jia He <justin.he@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jia He <justin.he@arm.com>
Subject: [PATCH 0/3] KVM: arm64: Fix pre-first-run KVM_PRE_FAULT_MEMORY vcpu_load() issues
Date: Mon, 23 Nov 2026 15:09:14 +0000
Message-Id: <20261123150917.2679600-1-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_071009_002389_D498F3CB 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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

KVM_PRE_FAULT_MEMORY calls vcpu_load() as soon as KVM_ARM_VCPU_INIT has
completed. On arm64, VM and vCPU state such as kvm->arch.sysreg_masks,
trap controls, vncr_tlb and nested vGIC setup is only initialised on the
first KVM_RUN in kvm_arch_vcpu_run_pid_change().

Running the full arch vcpu_load() path before then reads unsanitised
guest sysregs and touches uninitialised nested state. In particular, if
a VMM creates an EL2 vCPU with ID_AA64MMFR4_EL1.NV_frac cleared to 0,
sets HCR_EL2.NV=1 and an EL1 PSTATE, and calls KVM_PRE_FAULT_MEMORY,
kvm_vcpu_load_hw_mmu() queues KVM_REQ_MAP_L1_VNCR_EL2 without a
vncr_tlb. The next KVM_RUN then dereferences NULL in kvm_map_l1_vncr()
with preemption disabled and kvm->mmu_lock held for read.

Patch 1 skips the arch vcpu_load()/vcpu_put() callbacks until
vcpu_has_run_once() is true, and adjusts VHE enter_vmid_context() and
vgic_maintenance_handler() accordingly. Generic vcpu_load() still sets
kvm_running_vcpu for dirty-ring tracking, and pre-faulting only populates
&kvm->arch.mmu.

Patch 2 checks that vncr_tlb is allocated before setting
KVM_REQ_MAP_L1_VNCR_EL2 and adds a WARN_ON_ONCE(!vt) check in
kvm_map_l1_vncr().

Patch 3 extends nv_pre_fault_memory_test to cover pre-first-run
pre-faulting. The cases that do not need EL2 run on all hosts. On an
unfixed kernel, the staged nested context case triggers the "Separate
virtual IRQ/FIQ settings not supported" WARN while the test still
passes, so the kernel log must be checked as well.

Jia He (3):
  KVM: arm64: Don't load hardware vCPU state before first run
  KVM: arm64: nv: Don't request or attempt L1 VNCR mapping without
    vncr_tlb
  KVM: selftests: arm64: Test KVM_PRE_FAULT_MEMORY before first KVM_RUN

 arch/arm64/kvm/arm.c                          |  17 +-
 arch/arm64/kvm/hyp/vhe/tlb.c                  |   3 +-
 arch/arm64/kvm/nested.c                       |   6 +-
 arch/arm64/kvm/vgic/vgic-init.c               |   2 +-
 .../kvm/arm64/nv_pre_fault_memory_test.c      | 335 ++++++++++++++++--
 5 files changed, 321 insertions(+), 42 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1


