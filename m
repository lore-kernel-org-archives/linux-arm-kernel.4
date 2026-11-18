Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488F8606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wdQBQmjJ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UsL5AlUb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=b/gQvZdYuSoNjfsyaYYmldiSRT42v5KIS64hwTIF/F4=; b=wdQBQmjJN54kZQQ0BUjG9sULik
	Hh+GO3cT4m3h+LwBcOIn8rbnuNLpqxaJvgmM9Xp21N4Q3SF22gEWjmeLrivW1FnjnHAjmnRiGh5/h
	YRx315s3hRL9Zi6aPjyGldxRNhrySYSecory32eIEWu2BuWErN+jVErPw6EYfoRt7ptmyrAy0XVw8
	nZulac67fNl5Vr1/orRZ0cFSPqUzbksZqIuavE2CfiTEdN9SDa2kQa3QgXho35PWnZIBKjW5/j8yR
	eirk0xve9o07xXM6GJTma++G0jSgzAWpy/s6gK5l7cJ5JUfsZQ9KMK815vHuk0cmotsUs/NuHm2lb
	U1x7qVFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThRd-00000009EWP-1blj;
	Wed, 18 Nov 2026 15:19:33 +0000
Received: from out-153.mta1.migadu.com ([95.215.58.153] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThRH-00000009EHk-1EXB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:19:14 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=F6dPWpezD5NGe7tsKY5+ATADI9q8qmfifryfnNwOJDg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795015149; v=1; x=1795619949;
 b=UsL5AlUbDWh/19p50gzzwLphRnCXfGIgAskWlrfYE/PSZWxCUhQCZttGoQORTH59g8tuRyCo
 LkNMO7ED3p28DAGdsdrl+UrWSXjPxjxGcFBe5IDwbtjnZ7pQyNO6dth5P+BAgWFYbeUAsyjKqhr
 4Md6J/rEPVUWIhc+X17kIwwQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 57c5a3e7a529813e;
	Wed, 18 Nov 2026 15:19:09 +0000
X-Mizu-Trace-ID: 57c5a3e7a529813e
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/13] KVM: ITS hardening for pKVM
Date: Wed, 18 Nov 2026 15:18:51 +0000
Message-ID: <20261118151904.4099560-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_071911_512809_7FDDF51E 
X-CRM114-Status: GOOD (  14.61  )
X-Spam-Score: -2.8 (--)
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

Changes since v3 [1]:
  - The hypervisor never gives an ITT back to the host (patch 11).
  - The limit on devices per ITS now counts every DeviceID mapped since
    boot (patch 11).
  - A host read of an ITS register now aborts, unless the driver reads
    that register (patch 9).
  - Rebased on 7.4-rc3.
  - Various cleanups and wording fixes.

The ITS writes to the memory that its command queue and tables point
to, and the host programs both, so a host that controls the ITS can
write to hypervisor and protected-VM memory. With this series the
hypervisor owns the command queue, the tables and the ITTs, traps every
host access to the ITS control frame, and checks each command before
forwarding it to the ITS. The cover letter for v3 [1] describes the
design in more detail.

This series covers the ITS. The redistributors will follow in a series
of their own.

Jinjie's series [2] lets the collection table have two levels, which
this series doesn't handle. Once it's merged, I'll send patches that
make the hypervisor handle that table the way it handles the device
table.

Tested on QEMU with a program that writes forged commands, table
entries and register values to the ITS through /dev/mem from the host's
userspace. Also tested on FVP, where the ITS uses physical redistributor
addresses (GITS_TYPER.PTA). There, every secondary CPU was hotplugged
after the takeover, so that the driver maps each returning CPU's
collection through the hypervisor with a MAPC that carries a physical
address.

The series is structured as follows:

  01:     MMIO donation.
  02:     Taking host-registered MMIO regions at finalisation.
  03-06:  Driver preparation: GICv4 off, page-aligned ITTs, computing
          the wait target under the ITS lock, the shared command
          accessors.
  07:     Deprivileging the host under stop_machine().
  08-09:  The takeover: the driver's entry points, then the hypervisor
          trapping the control frame, taking the command queue and
          emulating GITS_CTLR and GITS_CBASER.
  10-11:  The tables and GITS_BASER<n>, then the ITTs.
  12:     Rejecting commands whose IDs are out of range.
  13:     Documentation.

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261102130133.3684226-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20261117123116.591621-1-ruanjinjie@huawei.com/

Bartłomiej Grzesik (2):
  irqchip/gic-v3: Disable GICv4 features in pKVM
  irqchip/gic-v3-its: Page-align ITT allocations in pKVM

Fuad Tabba (7):
  irqchip/gic-v3-its: Compute the wait target under the ITS lock
  KVM: arm64: Share the ITS command field accessors with the hypervisor
  KVM: arm64: Deprivilege the host under stop_machine()
  KVM: arm64: Take the ITS tables and restrict GITS_BASER<n>
  KVM: arm64: Take the ITT of every device the host maps
  KVM: arm64: Reject ITS commands whose IDs are out of range
  Documentation: KVM: arm64: Describe the ITS hardening

Mostafa Saleh (1):
  KVM: arm64: Donate MMIO to the hypervisor

Sebastian Ene (3):
  KVM: arm64: Take host-registered MMIO regions at pKVM finalisation
  irqchip/gic-v3-its: Add the pKVM takeover entry points
  KVM: arm64: Emulate the ITS command queue

 .../admin-guide/kernel-parameters.txt         |   8 +-
 Documentation/virt/kvm/arm/pkvm.rst           |  34 +
 arch/arm64/include/asm/kvm_asm.h              |   2 +
 arch/arm64/include/asm/kvm_hcall.h            |   2 +
 arch/arm64/include/asm/kvm_pgtable.h          |   2 +
 arch/arm64/include/asm/kvm_pkvm.h             |  16 +
 arch/arm64/kvm/arm.c                          |   4 +
 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h |  16 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   5 +
 arch/arm64/kvm/hyp/nvhe/Makefile              |   3 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   8 +
 arch/arm64/kvm/hyp/nvhe/its_emulate.c         | 765 ++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 130 ++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |  22 +
 arch/arm64/kvm/hyp/pgtable.c                  |   8 +-
 arch/arm64/kvm/pkvm.c                         | 105 ++-
 arch/arm64/kvm/vgic/vgic-its.c                |  15 -
 drivers/irqchip/irq-gic-common.h              |  13 +
 drivers/irqchip/irq-gic-v3-its.c              | 301 ++++++-
 drivers/irqchip/irq-gic-v3.c                  |   8 +
 include/linux/irqchip/arm-gic-v3.h            |  65 ++
 21 files changed, 1475 insertions(+), 57 deletions(-)
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/its_emulate.c


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3


