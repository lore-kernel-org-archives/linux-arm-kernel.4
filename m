Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACF4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DlWyrZ7o;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1Ck/HHD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WNzetZFExbVUnIn8RIkQ20Rzs3Hjz4CEnnAdhS2hOx4=; b=DlWyrZ7oBQ9Ogd0GhSgTuFF7AQ
	KJKcnO4fED8DoAeNrBHDLxmv7MOdcLv+GEzHAsgSWJ4qiPtEgTey4TeB2EYU/YyEUbBcS66ln1m70
	MLu691sDW15Z62BGHK0nDxLZdd+budqHeaB45NR6qwOmQs7Aic2Bo49btFfeEAZrkeE/WI9gdQDIl
	b77tse3Od0z/pfveoClcoBoczBpEUCwqTlTgFiDjMLv35+5B+rx30C31kPJCgvpJfMn6Dd+xFHZDO
	l8s6dWhreQjD+eXhhNmzPP7efEgiDyTFLg+tmDkhRdDg3uxfMvcaQhHvard6s1zzbq7XoWpDoYCcP
	BM/ssO6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1ge-0000000BwAc-0tCJ;
	Thu, 19 Nov 2026 12:56:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1gc-0000000BwAM-1x4M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:56:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C1C46185F;
	Thu, 19 Nov 2026 12:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F611F000C4;
	Thu, 19 Nov 2026 12:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795092981;
	bh=WNzetZFExbVUnIn8RIkQ20Rzs3Hjz4CEnnAdhS2hOx4=;
	h=From:To:Cc:Subject:Date;
	b=H1Ck/HHDHIDm49YTmHflRYG1906MK/bcWcVqx678JA6tbRjT/rMtgbt4vU+uUba/8
	 j/fYGJQNkgTA7WqJaxFGgpuLHCbyo72isTHLmClaiYbHfVRUAZhGEzeFJ91F2UTPw7
	 aNIwrL2pHP3LWsv3OqYKbmM/RxFX0c6vNeAdw4xLZBR8/CmyEmA2M3T6wnsMKxRmln
	 FA/I7lzfPN0rlA8lijj8UhC2Gbwpp+ilYE93zLm0y3gpMt+oM+Hlt/qyynG68O+x/D
	 +/Rpsm9I+IfZvgFiZZerxn+rSAj4Qw0+voDQRe/ZuDxcjlMYO+IkOLaURT+QZ7JPst
	 YH25iVN1WVe8A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xU1gY-00000000SEK-31q7;
	Thu, 19 Nov 2026 12:56:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Colton Lewis <coltonlewis@google.com>,
	Dan Carpenter <dan@pereq.eu>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Michael Reeves <michael.reeves077@gmail.com>,
	Mostafa Saleh <smostafa@google.com>,
	Myria Sarvay <myrialsarvay@gmail.com>,
	Oliver Upton <oupton@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Will Deacon <will@kernel.org>,
	Xuheng Li <xuheng@cs.columbia.edu>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.4, take #3
Date: Thu, 19 Nov 2026 12:56:08 +0000
Message-ID: <20261119125608.3939330-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, catalin.marinas@arm.com, coltonlewis@google.com, dan@pereq.eu, fuad.tabba@linux.dev, michael.reeves077@gmail.com, smostafa@google.com, myrialsarvay@gmail.com, oupton@kernel.org, vdonnefort@google.com, will@kernel.org, xuheng@cs.columbia.edu, yureka@cyberchaos.dev, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Paolo,

As promissed in my previous missive, I'm back with a few more
presents...

This round of fixes is mostly a Dan Carpenter special, as they seem to
have hit the jackpot with some new formal analysis tool, and found a
number of issues in NV. I am very surprised (/s).

The rest is a bunch of pKVM fixes and workarounds for ugly hardware.

I will be back next week same time for more of the same!

Please pull,

	M.

The following changes since commit 181a701fc14d3d468c603b5ecfb9f12115c5fb72:

  Merge branch kvm-arm64/misc-7.4-1 into kvmarm-master/fixes (2026-11-03 18:14:37 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.4-3

for you to fetch changes up to 3385a832525527801012f5993d1f6a7a3d23092c:

  Merge branch kvm-arm64/mmu-fixes-7.4-2 into kvmarm-master/fixes (2026-11-19 11:16:29 +0000)

----------------------------------------------------------------
KVM/arm64 fixes for 7.4, take #3

* MMU fixes:

  - Fix arbitrary truncation to 32bit when dealing with pool size

  - Correctly order page pin refconting

  - Prevent a HYP block mapping from being replaced with a table

  - Fix NV Range invalidation by extending the boundaries to the
    next block mapping

  - Make sure the correct hw_mmu gets picked on the first run,
    should userspace restore a nested context between init and
    the first vcpu_load().

  - Reject TLBI IPAS2E1 that fall outside of the S2 range

* System register fixes:

  - Correctly forward POE/PIE/TVAL EL2 register traps

  - Add a sanity check for missing trap forwarding

  - Correctly hide generic PAuth for pKVM protected guests when
    the feature PAuth has been exluced from the feature set

  - Make sure that HCR_EL2.NV1 is always RES0

* Misc fixes:

  - Flag Apple M3, M4 and M6 CPUs as having a broken vgic and
    a wonky PMUv3 emulation.

  - Correctly handle 64bit offsets into an MMIO region from
    userspace

  - Ensure that a vcpu is loaded when injecting an event

----------------------------------------------------------------
Colton Lewis (2):
      KVM: arm64: Force HCR_EL2.NV1 to RES0 unconditionally
      KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when E2H0 is NI_NV1

Dan Carpenter (9):
      KVM: arm64: nv: Invalidate whole L1 blocks on TLBI RIPAS2E1
      KVM: arm64: vgic: Don't truncate offsets in vgic_find_mmio_region()
      KVM: arm64: nv: Initialize hw_mmu to NULL for nested vCPUs
      KVM: arm64: nv: Forward PIR_EL2, PIRE0_EL2 and POR_EL2 traps
      KVM: arm64: nv: Forward CNTP_TVAL_EL02 and CNTV_TVAL_EL02 traps
      KVM: arm64: nv: Report EL2 registers with no trap forwarding
      KVM: arm64: Load the vcpu in KVM_SET_VCPU_EVENTS
      KVM: arm64: nv: Fix NULL dereference in kvm_pmu_nested_transition()
      KVM: arm64: nv: Ignore TLBI IPAS2E1 above the IPA limit

Fuad Tabba (1):
      KVM: arm64: Hide generic ptrauth from protected VMs without ptrauth

Marc Zyngier (3):
      Merge branch kvm-arm64/misc-7.4-2 into kvmarm-master/fixes
      Merge branch kvm-arm64/sysreg-fixes-7.4-2 into kvmarm-master/fixes
      Merge branch kvm-arm64/mmu-fixes-7.4-2 into kvmarm-master/fixes

Michael Reeves (1):
      arm64: Apply existing Apple Silicon CPU workarounds to newer CPUs

Mostafa Saleh (1):
      KVM: arm64: Use consistent type for pool size

Myria Sarvay (1):
      arm64: Add CPU part numbers for newer Apple Silicon CPUs

Xuheng Li (2):
      KVM: arm64: Don't replace a valid hyp block mapping with a table
      KVM: arm64: Order a later pinner's accesses after the hyp mapping

 arch/arm64/include/asm/cputype.h              | 28 +++++++++++++++++++
 arch/arm64/include/asm/kvm_host.h             |  2 +-
 arch/arm64/include/asm/kvm_pgtable.h          |  2 +-
 arch/arm64/kernel/cpu_errata.c                | 12 +++++++++
 arch/arm64/kernel/cpufeature.c                | 12 +++++++++
 arch/arm64/kvm/arm.c                          |  8 ++++--
 arch/arm64/kvm/config.c                       |  7 +----
 arch/arm64/kvm/emulate-nested.c               | 10 ++++++-
 arch/arm64/kvm/hyp/include/nvhe/early_alloc.h |  2 +-
 arch/arm64/kvm/hyp/include/nvhe/gfp.h         |  4 +--
 arch/arm64/kvm/hyp/nvhe/early_alloc.c         |  2 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  8 ++++++
 arch/arm64/kvm/hyp/nvhe/page_alloc.c          |  6 ++---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c            |  4 +--
 arch/arm64/kvm/hyp/pgtable.c                  | 10 ++++++-
 arch/arm64/kvm/nested.c                       |  8 ++++++
 arch/arm64/kvm/pmu-emul.c                     |  3 +++
 arch/arm64/kvm/sys_regs.c                     | 39 ++++++++++++++++++++++++---
 arch/arm64/kvm/vgic/vgic-mmio.c               |  4 +--
 arch/arm64/kvm/vgic/vgic-mmio.h               |  2 +-
 tools/testing/selftests/kvm/arm64/hello_el2.c | 15 +++++++++++
 21 files changed, 161 insertions(+), 27 deletions(-)

