Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867FE606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YWAsk26G;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ehIwP+JJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ASDf1J7RYZd7g9hJRy/O98JcZzUemVt8EFMNXdnVhMI=; b=YWAsk26GfN3U4OQQ87CfLC1Uhs
	JbJRsu9CUqUMq1rzwsmVWbi6wURf6v6TVskSZDZ6nf06658r7Z/u+EKHHYIrqWGwWdR/uJKOQZE9n
	EWOz+S0PWUI7OKkPaJe2IQLHsFLGIgFPJKifAysh3XD1+OSF1ZI/JDIoUllzBQasM/csIuTef+LSA
	obX0U5iOyEIF6yeDZ/0Qn6QlYkHGql3eBMt2bRahbpFruz2cqZiN/OEn/1u87ne2stiPhpEjqjvXz
	wVDWR3+eZRlZcoVCODqWeWLHx3qq0U3chRpZJJncGa4Zoi/jsmPnM/rhtqytrhMe93YnawGpinz6x
	CTHmCy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF5q-0000000AOEZ-33bR;
	Wed, 25 Nov 2026 15:39:34 +0000
Received: from out-26.mta0.migadu.com ([2001:41d0:1004:224b::1a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF5Y-0000000AOAL-0jOT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:39:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GsIUcTgG0fusfC+sbkYRATmQcjkhxzCYvdARKzPZoIs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621153; v=1; x=1796225953;
 b=ehIwP+JJOsCyEKZjpEyKVfA4w7o0B5Lu5ND7tTroCYw66i4tgrkHGYJbCWTzxF33G7jFIELi
 zbgAwds3iV4CfT88xffhhxNGWtLiMS9F/ZdhHg/cx36/rGfB0j9b+c13mh+xbqTUWyzkhWijOm5
 03fixlon4buawCSifRxBa3vk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 47b5237eae5c5d30;
	Wed, 25 Nov 2026 15:39:13 +0000
X-Mizu-Trace-ID: 47b5237eae5c5d30
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/20] KVM: arm64: Support debug, SVE, MOPS, PIE/POE, FPMR and more in protected VMs
Date: Wed, 25 Nov 2026 15:38:51 +0000
Message-ID: <20261125153911.106793-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_073919_255805_84CCF2F7 
X-CRM114-Status: GOOD (  12.30  )
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
  - Replaced the #ifdef around the feature map check with a WARN_ON().
    (Oliver)
  - Added two fixes, for ptrauth and MTE_frac.
  - Added a patch advertising GICv3 to protected VMs on GICv5 hosts with
    legacy support.
  - Small fixes and tidying up.
  - Rebased on 7.4-rc3.

With most of the groundwork merged, it's time to bring protected VMs up
to the features we support for them in Android.

  01-02:  Fixes for ptrauth and MTE_frac.
  03:     Self-hosted debug.
  04-07:  SVE, with EL2 owning a protected vCPU's SVE state.
  08-11:  Compute a protected vCPU's fine-grained traps at EL2.
  12-20:  Advertise TCR2, SCTLR2, S1PIE, S1POE, MOPS, FPMR and the
          features EL2 already handles for non-protected guests.

Tested on QEMU, in hVHE and nVHE, and on FVP for S1POE, GICv5 in legacy
mode and the fields QEMU doesn't model (CLRBHB, RPRFM, ECBHB, LSFE,
LSUI, HAFT, ETS3 and F16MM). v2 of the pKVM selftests series [2] covers
debug, SVE, MOPS, PIE, POE and FPMR.

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261109083205.806619-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20261109084854.840576-1-fuad.tabba@linux.dev/

Fuad Tabba (20):
  KVM: arm64: Only allow ptrauth for a pVM on a system with full ptrauth
  KVM: arm64: Don't advertise the host's MTE_frac to protected VMs
  KVM: arm64: Add support for self-hosted debug in protected guests
  KVM: arm64: Remove redundant kern_hyp_va() calls from the pKVM FP sync
  KVM: arm64: Allocate a protected vCPU's SVE state at EL2
  KVM: arm64: Advertise ID_AA64ZFR0_EL1 to protected VMs
  KVM: arm64: Allow protected VMs to use SVE
  KVM: arm64: Move the VM's FGU initialisation into config.c
  KVM: arm64: Report an incomplete feature map with WARN_ON()
  KVM: arm64: Advertise the GICv3 CPU interface to protected VMs on
    GICv5
  KVM: arm64: Compute a protected vCPU's fine-grained traps at EL2
  KVM: arm64: Advertise TCR2, SCTLR2, S1PIE and S1POE to protected VMs
  KVM: arm64: Advertise MOPS to protected VMs
  KVM: arm64: Advertise FPMR to protected VMs
  KVM: arm64: Advertise HBC, CLRBHB, RPRFM, CSSC and LUT to protected
    VMs
  KVM: arm64: Advertise FAMINMAX, LSFE, LSUI and FPRCVT to protected VMs
  KVM: arm64: Advertise AFP and RPRES to protected VMs
  KVM: arm64: Advertise ECBHB, TIDCP1, TTST and LVA to protected VMs
  KVM: arm64: Advertise FP8 and F16MM to protected VMs
  KVM: arm64: Advertise ECV, HAFT and ETS3 to protected VMs

 Documentation/virt/kvm/arm/pkvm.rst     |  13 +-
 arch/arm64/include/asm/kvm_host.h       |   2 +-
 arch/arm64/include/asm/kvm_hyp.h        |   6 +
 arch/arm64/include/asm/kvm_pkvm.h       |  12 +-
 arch/arm64/kvm/arm.c                    |  11 +
 arch/arm64/kvm/config.c                 |  24 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h |   2 +-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h  |   1 +
 arch/arm64/kvm/hyp/nvhe/Makefile        |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |   6 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c          |  51 ++--
 arch/arm64/kvm/hyp/nvhe/switch.c        |   1 +
 arch/arm64/kvm/hyp/nvhe/sys_regs.c      | 350 ++++++++++++++++++++++--
 arch/arm64/kvm/reset.c                  |   2 +
 arch/arm64/kvm/sys_regs.c               |  17 +-
 15 files changed, 423 insertions(+), 79 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3


