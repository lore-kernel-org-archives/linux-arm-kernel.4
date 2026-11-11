Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562F2606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DRTzt3lN;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=p+rBH1Wp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4oexicqlKkgDocERMEx4v8VNyMOo/fmHzBt5H4YEt40=; b=DRTzt3lNH6QAGw72FdtIX18TYy
	77TJjg0EY6fzznHDmP2pAeE9FOda3BmkO/0+HAimNQGY19zrz74qCkDgxXwBGg/NErDLyTIQoiv6R
	PAm90TfPsocSEzwD9Gqqzr+YRwOVp3JrprWmORF88oETrP330ZB8gXi+056i+CyFrs8MhwRdxEbRS
	NkGjYmwk8ZKqPQnjTpB8vHphGS92xpFwfN0kWWQoC9KbjDUmyJKulG/ZFxLfk3EXa1WZSrUN0ElTn
	OBtMI7Fi4f7Nn1bfskhCas9FP68QJDtIAlxUsEcBwmNLZ+ky4ZvJ2JUqI4MUE5Fz0YIjv07HpkvmG
	/edfRjnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9mA-000000071E6-3r9y;
	Wed, 11 Nov 2026 14:58:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9m8-000000071Di-285W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:58:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 307691576;
	Wed, 11 Nov 2026 06:58:07 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.58.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7E773F632;
	Wed, 11 Nov 2026 06:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794409090; bh=T0N8qo5+1VMrs2ox5XW1dEpZFcq610OBfeD56CkYpKA=;
	h=From:To:Cc:Subject:Date:From;
	b=p+rBH1WpylC0VUzXRB1q0lrvXOFutUTQdZgZuphMmKau1O6BIyepVDzTSqJDP9dve
	 y6a0NoaxnVXtOq/Wyd4ray1op4b4Z+I5fhLVAhTndDu7/LLQD0yppjfXETP7NXRsqJ
	 OQb/um1WL7FGAp3VM0xtWq441gJg2hAZw4HH1STs=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Kohei Enju <enju.kohei@fujitsu.com>
Subject: [PATCH v2 00/12] KVM: arm64: CCA: Prepare Realm memory management
Date: Wed, 11 Nov 2026 14:57:44 +0000
Message-ID: <20261111145758.217946-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_065812_657569_7CA83A8A 
X-CRM114-Status: GOOD (  14.73  )
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

This series adds the memory management plumbing for CCA, building on the
basic RMM support [1]. Thank you to those who reviewed v1 - I'm
attempted to address all the comments.

The patches introduce internal Realm VM state and RMI feature checks,
prepare Realm stage-2 setup and teardown, and provide RTT mapping and
invalidation helpers. Realm memslots are restricted to the lower half
of the IPA space because the protected and shared halves alias each
other. The final patch connects the helpers to KVM's stage-2 MMU
operations.

This is the memory management portion of the larger Realm host series.
Realm descriptor creation, REC entry and exit, activation, and the new
uAPI follow in the integration stack. This series alone does not enable
Realm creation.

As before there's an integration branch[2] that includes the realm
creation, REC entry/exit etc building on top of this series. I've also
pushed a git branch[3] of just this series.

Changes since v1:
- Add a guest_memfd prerequisite patch that checks whether the backing
  file supports mmap when preparing an arm64 memslot.
- Combine the RMI availability and feature checks into one patch, and
  move Realm vCPU feature restrictions to the integration stack.
- Correct Realm IPA sizing and RTT teardown, including teardown before
  activation, RTT accounting, and handling of missing or folded RTTs.
- Rework RTT mapping to respect IPA and physical alignment, handle
  partial RMI progress, and retry interrupted operations.
- Preserve private mappings when a Realm guest_memfd memslot deletion is
  rejected, and tighten Realm fault handling and stage-2 destruction.

[1] https://lore.kernel.org/all/20261007073537.2454351-1-suzuki.poulose@arm.com/
[2] https://gitlab.arm.com/linux-arm/linux-cca
    branch: cca-host-mm/v2/integration
[3] https://gitlab.arm.com/linux-arm/linux-cca
    branch: cca-host-mm/v2/mm

Steven Price (7):
  KVM: arm64: CCA: Reserve the RMM mode
  KVM: arm64: guest_memfd: Check mmap support when preparing memslot
  KVM: arm64: CCA: Check RMI support and features at init
  KVM: arm64: CCA: Add basic infrastructure for creating a realm
  KVM: arm64: CCA: Tear down RTTs
  KVM: arm64: CCA: Add Realm RTT mapping and invalidation helpers
  KVM: arm64: CCA: Support runtime faulting of memory

Suzuki K Poulose (5):
  KVM: arm64: CCA: Introduce Realms
  KVM: arm64: Handle attributes in stage2_unmap_range
  KVM: Allow architectures to reject memslot changes before invalidation
  KVM: arm64: CCA: Prevent memslot modifications after Realm creation
  KVM: arm64: CCA: Add Realm stage-2 MMU operations

 arch/arm64/include/asm/kvm_emulate.h   |  29 +
 arch/arm64/include/asm/kvm_host.h      |  53 +-
 arch/arm64/include/asm/kvm_mmu.h       |   4 +-
 arch/arm64/include/asm/kvm_rmi.h       | 104 +++
 arch/arm64/include/asm/virt.h          |   1 +
 arch/arm64/kvm/Kconfig                 |   1 +
 arch/arm64/kvm/Makefile                |   2 +-
 arch/arm64/kvm/arm.c                   |  21 +-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |   2 +-
 arch/arm64/kvm/hyp/nvhe/switch.c       |   4 +-
 arch/arm64/kvm/hyp/nvhe/timer-sr.c     |   2 +-
 arch/arm64/kvm/mmu.c                   | 311 +++++++--
 arch/arm64/kvm/pkvm.c                  |   4 +-
 arch/arm64/kvm/psci.c                  |   2 +-
 arch/arm64/kvm/rmi.c                   | 883 +++++++++++++++++++++++++
 drivers/firmware/arm_rmm/rmi.c         |  10 -
 include/linux/arm-rmi-cmds.h           |  13 +
 include/linux/kvm_host.h               |   5 +
 virt/kvm/guest_memfd.c                 |   6 +
 virt/kvm/kvm_main.c                    |  33 +-
 20 files changed, 1391 insertions(+), 99 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_rmi.h
 create mode 100644 arch/arm64/kvm/rmi.c

-- 
2.43.0


