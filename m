Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88C606A896
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 03:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xh+9JIhb;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=e5QY8jqN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7sClOyXc5DYkp7gT7ltCBjv+6uzNG2TAXlQo0+7BqYo=; b=Xh+9JIhbve2Yoo6li54hKoz5Fp
	zTtlETOrpWeqGw0kxNSXn4qgO/Rex3F4coDCG9PtuHQCutuZDgaZrzYsFKTxCurmJc1zWJ/brFJrv
	Fc0Hj+IfDbNrfSpGn58iKzyznmKh8IT+QDh5n39sAe4oePiRQleqpzyrGaHPou8V93JFsWbUbRGL3
	paQdI3hdbStBkXWMTw6cLXlZ/S5D57eIOXEGfrwAIrbdEsaRoR1Ghd+IPFYsuCXa4GQCEvlDKjEMm
	/RkOvWEMjxOhdHjphp5syWVTrEWMkKR1LDOSrzlwj9dJm4uD2Edh9rrXDXb9nd+tdR7Hgp8slkKIZ
	dOj5Mutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLcj-00000008dTF-31Tr;
	Thu, 12 Nov 2026 03:37:17 +0000
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLcg-00000008dSB-0H7r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 03:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1794454634; x=1825990634;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=03RedrnDsUkMfaAlXP5THfn6nEFN+a+p8i1kpiQJYtU=;
  b=e5QY8jqN/vZ2IROolsaYQG6GP3yrXOMwGlxMao2VAWjPG70xCzwyO4AY
   6A4oNob3cUclB2ZPXGYxPRBsgV3AZyH9qmJjXK3/LPGHfxB7hv8Av0OJe
   GpIEONQuERqdGHi+NrZxfkxQ415FVxXG96OV1KxNm+SkJAi1ED3bFxDit
   U9f5htQleWiDQBXUUc+X6aNPJ+5eio9d7wE4o7s6GqCAfVRdW85SF6RYY
   Guoe9jm9fVr3YmlgAj86DWUQT01FC/LFY9gpQ/D5Ibfh7eLSnlaQD0mN2
   KMv9drEIwtGlhKShAFMiNxgZ4esJ3B5aIp53rUfegGcdlijtRQJTAg5xn
   Q==;
X-CSE-ConnectionGUID: m6luQsOoTTWsdb90rrbuYQ==
X-CSE-MsgGUID: T5AiICPGSqiN7e46kL9ZXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="249047038"
X-IronPort-AV: E=Sophos;i="6.27,208,1786978800"; 
   d="scan'208";a="249047038"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:37:10 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id AAA0E8214D6
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 03:37:10 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 54F368D6D96
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 03:37:10 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2D4CF1801928;
	Thu, 12 Nov 2026 03:37:03 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
Subject: [PATCH RFC v2 0/2] KVM: arm64: CCA: Add MEC policy support for CCA
 Realms
Date: Thu, 12 Nov 2026 12:36:20 +0900
Message-Id: <20261112-mm-v1-mec-v2-0-0d1dd260a588@fujitsu.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADU09WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3dxc3TJD3dzUZF2LZFMDc6MUs2RjY0MloPqCotS0zAqwWdFKQW7
 OSrEQweLSpKzU5BKQKUq1tQDZmoSfcgAAAA==
X-Change-ID: 20261112-mm-v1-mec-8c5072d6c331
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 cgroups@vger.kernel.org, Kohei Enju <enju.kohei@fujitsu.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_193714_512765_3C53FC18 
X-CRM114-Status: GOOD (  14.94  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds basic support for configuring the Memory Encryption
Context (MEC) policy for Arm CCA Realms.

Patch 1 introduces the KVM_ARM_VM_RMI_CTRL device attribute group to
allow userspace to configure Realm VM parameters before the Realm is
created using KVM_SET_DEVICE_ATTR, and uses it to let userspace select
the MEC policy before the Realm is created.

Patch 2 adds a misc cgroup resource for CCA MECIDs and charges one unit
for each Realm using the private MEC policy.

Feedback on the proposed KVM ABI and on using misc cgroup for MECID
accounting would be appreciated.

This series is based on Steven and Suzuki's CCA host series [1]. I am
sending it as an RFC while the CCA host series is not yet upstreamed,
and plan to update it as needed to track future revisions of the host
series. Once the host series is merged, I plan to post a non-RFC
version.

Since the base series is not yet upstream, some CI systems may not be
able to test this series successfully. This is expected for this RFC.

Changes
- RFC v2:
  - Use kvm_device_attr instead of a dedicated ioctl.
  - Rebase onto the CCA host series branch listed in [1].
- RFC v1: https://lore.kernel.org/all/20260724094120.166536-1-enju.kohei@fujitsu.com/

[1]
 https://gitlab.arm.com/linux-arm/linux-cca
 branch: cca-host-mm/v1/integration

Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
Kohei Enju (2):
      KVM: arm64: CCA: Add support for configuring the Realm MEC policy
      cgroup/misc: Add support for Arm CCA MECIDs

 Documentation/virt/kvm/devices/vm.rst   |  25 ++++++++
 arch/arm64/include/asm/kvm_rmi.h        |   7 +++
 arch/arm64/include/uapi/asm/kvm.h       |   4 ++
 arch/arm64/kvm/arm.c                    |   4 ++
 arch/arm64/kvm/rmi.c                    | 101 +++++++++++++++++++++++++++++++-
 drivers/firmware/arm_rmm/rmi.c          |  10 ++++
 include/linux/arm-rmi-cmds.h            |   1 +
 include/linux/misc_cgroup.h             |   4 ++
 kernel/cgroup/misc.c                    |   4 ++
 tools/arch/arm64/include/uapi/asm/kvm.h |   4 ++
 10 files changed, 163 insertions(+), 1 deletion(-)
---
base-commit: a7644e0425de41ed0338cb73eebe5d14baf6be95
change-id: 20261112-mm-v1-mec-8c5072d6c331

Best regards,
--  
Kohei Enju <enju.kohei@fujitsu.com>


