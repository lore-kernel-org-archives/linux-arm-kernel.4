Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8985E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q7qkQvsJ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fky3xG22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nVCD3WqvgCoqhKy/l3yuhy8HMKgb8NDwxlYf03aauoU=; b=q7qkQvsJJETJAaqu+2fBHJxOlm
	e5B8SobCkAxrCeYkr1uXuBHBKcUeEZulyVSemrb4ajV3VozR/WP1w4mfBVCbnjKSmDx4s71Y2fNN4
	bq40Jxyu9nkKBMdsgYCiDoTOfNxcIxrJ/pjkht2Js61f4Ql/u956V6B6FqBvPpLe5I87/bcjTJ7Ta
	Xc+6kQHdy1JVMcd+wrdmU7BUrtK1Y/DpvPvSWKgcTwxFtNB5ovjDyR6wT1Q7XLrw9W0QprYh7uGV7
	z4fvT0akx1dNb3O1jzU+2QlYOh/7GN8BeX2mWu0AWSnowDn+3Rmg3x7kdf6N1mxyoao/b2n8QQNoH
	S6wWysbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzO-0000000D3qo-1XNa;
	Thu, 26 Nov 2026 11:50:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzL-0000000D3pX-1bo9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:50:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D3CA1C2B;
	Thu, 26 Nov 2026 03:50:01 -0800 (PST)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D3AD3F632;
	Thu, 26 Nov 2026 03:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795693803; bh=8yLuitpP6g12fQ0y1lDT3Vae2vvpE/cs2esk4Vshcdc=;
	h=From:To:Cc:Subject:Date:From;
	b=fky3xG22aklLR/T8p1iKGBqJmbO08vZSmDznbP72j7LKp3kpGCOylRpc68JsNkmPX
	 j5KE7hddFz474U50G9BOo7j870/4lAyURjD1G3tr80qU1kS1PvDRK+SmE5vwl/YeRG
	 3cHHsUDx5RzHHyGo5a66SzN1G2H8JAaxvWftJS44=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [RFC v2 00/13] arm64: Add support for TLBI domains
Date: Thu, 26 Nov 2026 11:49:23 +0000
Message-ID: <20261126114936.864256-1-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_035007_499796_040668B0 
X-CRM114-Status: GOOD (  16.64  )
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

Hi,

This is a follow-up to the initial TLBI domain RFC:
  https://lore.kernel.org/all/20261001110655.461473-1-kristina.martsenko@arm.com/

The goal of the series is to improve performance by using TLBI domains
(FEAT_TLBID) to send TLB invalidations only to the CPUs where a process has
run. (Specifically, TLBI commands are sent to a fixed “domain”, which may be
wider than the set of target CPUs.)

This RFC v2 addresses review feedback from the previous RFC v1. It is still an
RFC because the ACPI table specification is still not public, so this series
can't be merged yet.

The series does not include KVM support, it only disables domains for guests.
KVM support has been posted by Jinqian [1].

Thanks,
Kristina

[1] https://lore.kernel.org/all/20261030065617.4090073-1-yangjinqian1@huawei.com/


Changes in RFC v2:
  - Made context-switch only update domains if they would change (and updated
    the barrier) [Zi]
  - Explained in commit message why mm_cpumask is not used [Zi]
  - Added WARN_ON to EFI init [Ard]
  - Split EL2 setup into a separate patch [Linu]
  - Fixed ipas2e1is() to use __tlbip() [Jinqian, sashiko]
  - Fixed memory leaks in error paths [Jinqian, sashiko]
  - Made ACPI table sanity checks more robust [sashiko]
  - Fixed 'tlbi' variable to be static [sashiko]
  - Fixed __tlbip() macro argument expansion [sashiko]
  - Link to RFC v1: https://lore.kernel.org/all/20261001110655.461473-1-kristina.martsenko@arm.com/


Kristina Martšenko (13):
  arm64: sysreg: Add definitions for TLBID
  arm64: boot: Handle TLBID boot requirements
  arm64: Detect TLBID
  KVM: arm64: Hide TLBID from guest sysregs
  KVM: arm64: Hide TLBID from guest instructions
  ACPICA: Add TLBI table definition
  ACPI: TLBI: Parse domains from table
  arm64: tlbid: Set up CPU domain bitmaps
  efi/arm: Check return value of init_new_context()
  arm64: tlbid: Track the TLBI domain of a task
  arm64: Support TLBIP instructions
  arm64: tlbid: Pass domain to TLBI instructions
  arm64: tlbid: Add documentation

 Documentation/arch/arm64/booting.rst    |  10 ++
 arch/arm64/Kconfig                      |  12 ++
 arch/arm64/include/asm/acpi.h           |  10 ++
 arch/arm64/include/asm/cpu.h            |   1 +
 arch/arm64/include/asm/cpufeature.h     |  15 ++
 arch/arm64/include/asm/el2_setup.h      |  77 +++++++-
 arch/arm64/include/asm/kvm_emulate.h    |   5 +
 arch/arm64/include/asm/mmu.h            |  13 ++
 arch/arm64/include/asm/mmu_context.h    |   9 +-
 arch/arm64/include/asm/tlbflush.h       | 218 +++++++++++++++++------
 arch/arm64/kernel/cpufeature.c          |  25 +++
 arch/arm64/kernel/cpuinfo.c             |   3 +
 arch/arm64/kvm/config.c                 |   6 +
 arch/arm64/kvm/emulate-nested.c         |   1 +
 arch/arm64/kvm/hyp/include/hyp/switch.h |   7 +-
 arch/arm64/kvm/hyp/nvhe/tlb.c           |   2 +-
 arch/arm64/kvm/hyp/vhe/tlb.c            |   4 +-
 arch/arm64/kvm/sys_regs.c               |   3 +
 arch/arm64/mm/Makefile                  |   1 +
 arch/arm64/mm/context.c                 |   6 +-
 arch/arm64/mm/tlbid.c                   | 227 ++++++++++++++++++++++++
 arch/arm64/tools/cpucaps                |   1 +
 arch/arm64/tools/sysreg                 |  53 +++++-
 drivers/acpi/arm64/Kconfig              |   3 +
 drivers/acpi/arm64/Makefile             |   1 +
 drivers/acpi/arm64/init.c               |   2 +
 drivers/acpi/arm64/init.h               |   1 +
 drivers/acpi/arm64/tlbi.c               | 217 ++++++++++++++++++++++
 drivers/firmware/efi/arm-runtime.c      |   3 +-
 include/acpi/actbl2.h                   |  32 ++++
 30 files changed, 897 insertions(+), 71 deletions(-)
 create mode 100644 arch/arm64/mm/tlbid.c
 create mode 100644 drivers/acpi/arm64/tlbi.c


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0


