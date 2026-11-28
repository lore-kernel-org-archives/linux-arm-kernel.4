Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D640F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 01:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cllWSEBh;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jSo9ZDls
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9854QH4TMdL6guUMAEcKJ+FttltmbvocYCBGe/+Uhqo=; b=cllWSEBhAuSLX0DhFKOdbM7/sk
	o7ZjvDwJ2u8prTE6LDZEYNq+DcCvAvXQaeBXPvkCJAA/y72h7oLiXCmjWUgygK2d0GYjEKz8nYwRM
	FQLxG/WqG+4f5VE6thd5ayF+Xn6v+3w2OaqsmwF5smIdEZTvrReN/07tAeskKc5lFzSl52wGQ+hnh
	uGiex+KX/8A344GPtAF4FL1aYvnuaQG2F8ocuiWpoQlfV5Zu05MDPDrAA3ZZOvdxrLk1sVFD7qjEh
	o6oe6zi0BkhB+1a/sDIvMJ5iTNa2Tr0gQvgs8S/fF6SdepbgVwZzPLzE033fbaLfX2rVS/V7ETvol
	vTTzqg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX72J-00000000FvT-1bLK;
	Sat, 28 Nov 2026 01:15:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX72B-00000000Fui-3e0y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 01:15:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A80C01575;
	Fri, 27 Nov 2026 17:15:17 -0800 (PST)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 33FFB3F632;
	Fri, 27 Nov 2026 17:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795828520; bh=XgGdTO+fLL8ATBkcKpsheH2Fam2xVx2g5zcyj4vdLus=;
	h=From:To:Cc:Subject:Date:From;
	b=jSo9ZDlsqBhaK4ZXAB1mgci1w3tc2p6rIkZPYzomz4otiDF3EpPzXSIPrFlg/XRZ/
	 9e7/oi308QYswege6FG7vs4CSCtWlSxB8m76DjXTXQRh+5hZtd6vLmtxHZF2CitfZp
	 cOlBrPqKWvSetCL9G6RHP751kgvIjx2K1s95584Y=
From: Jia He <justin.he@arm.com>
To: maz@kernel.org,
	oupton@kernel.org
Cc: fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia He <justin.he@arm.com>
Subject: [PATCH v3 0/4] KVM: arm64: nv: VNCR page mapping fixes
Date: Sat, 28 Nov 2026 01:14:43 +0000
Message-Id: <20261128011447.3588988-1-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_171524_193152_020222A3 
X-CRM114-Status: GOOD (  13.60  )
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

On a VNCR abort, KVM walks the guest hypervisor's EL2 stage-1 tables,
maps the page that VNCR_EL2 points to at a fixmap, and points the
hardware VNCR_EL2 at that fixmap. This series fixes three cases where
this goes wrong.

Patch 1 fixes the address that KVM programs into VNCR_EL2 on a host
with 16K or 64K pages. The fixmap maps the host page that contains the
VNCR page, and KVM takes the offset of the VNCR page in it from the VA.
If the guest hypervisor uses a smaller stage-1 granule, the VA and the
PA can have different offsets, and the nested context accesses another
page of the guest. Patch 1 takes the offset from the PA.

Patch 2 fixes a walk that cannot set the AF. If TCR_EL2.HA is set and
the descriptor that maps VNCR_EL2 is in a read-only memslot, the walk
returns -EPERM. kvm_handle_vncr_abort() has no case for -EPERM, so the
vCPU takes the same abort forever. Patch 2 injects the SEA that the
walk recorded.

Patch 3 adds a selftest for both. It maps the VNCR page at a VA whose
offset in a 16K or 64K page differs from that of its PA, and puts the
table that maps it in a read-only memslot.

Patch 4 allows the VNCR page in a cacheable VM_PFNMAP or VM_MIXEDMAP
VMA. The stage-2 fault path already maps such memory as cacheable, but
kvm_translate_vncr() rejects it and injects an SEA.

Patches 1 and 2 fix bugs that predate this series, and each can be
applied on its own.

Based on v7.4-rc3.

Patch numbers below are those of v3.

Changes since v2:
- New patch 1 (Sashiko).
- Patch 3: size the read-only memslot to whole host pages, and map the
  VNCR page at a VA whose bits [15:12] differ from those of its PA
  (Sashiko).

Changes since v1:
- New patches 2 and 3 (Sashiko).
- Patch 4: get the HVA with gfn_to_hva_memslot_prot() so that a VNCR
  page in a read-only memslot is not rejected (Sashiko).
- Patch 4: limit the stage-2 comparison in the commit message to
  VM_PFNMAP and VM_MIXEDMAP VMAs.

v2: https://lore.kernel.org/r/20261125024426.3464050-1-justin.he@arm.com
v1: https://lore.kernel.org/r/20261124025336.4107575-1-justin.he@arm.com

Jia He (4):
  KVM: arm64: nv: Locate the VNCR page in the host page from its PA
  KVM: arm64: nv: Inject an SEA when the VNCR walk cannot set the AF
  KVM: arm64: selftests: Add a test for VNCR_EL2 translation faults
  KVM: arm64: nv: Allow the L1 VNCR page in cacheable PFNMAP memory

 arch/arm64/include/asm/kvm_mmu.h              |   2 +
 arch/arm64/include/asm/kvm_nested.h           |   1 +
 arch/arm64/kvm/hyp/vhe/switch.c               |   9 +-
 arch/arm64/kvm/mmu.c                          |   2 +-
 arch/arm64/kvm/nested.c                       |  47 +++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/nv_vncr_abort.c       | 221 ++++++++++++++++++
 7 files changed, 273 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/nv_vncr_abort.c

-- 
2.34.1


