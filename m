Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F4B606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QNte72JE;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JmbIT0O7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1p0CvNQuHo4sEI48VqngId1iPLhnIEEPfqYvt5YlWC0=; b=QNte72JERGs+jLn5euHwcdrolL
	FJlfydg39ceXBTFvbJRD9i4J/pXgYuYIJt9jcFLcKvph/NNKrwhKGx3v9fILzjoh33pFEOAvr0JUD
	7Kafbg15MtLOnWlQXk/7k/7tXUV8n9NMrKRbyIqKG2B9S6/dCTyC+iPQFUm0Nis1+A6bC5iVzlXnw
	fHvDDdzwFeq7htNOrTXbKgb9V1UiEsRcS6360mxwD4TDyS4cYXgy28gWr5JkHbieH1ydpeT7/8am5
	iExqcBfpS42at/qi9NYrNw88POQmkazt1WqhT9teI6MJfKYAS6tnQCcUBkvggHTsu7El5/srrV39t
	2cSbtauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW308-00000008Fba-3FAm;
	Wed, 25 Nov 2026 02:44:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW303-00000008FaT-3ZHz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:44:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03849339;
	Tue, 24 Nov 2026 18:44:42 -0800 (PST)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 40E0A3F86C;
	Tue, 24 Nov 2026 18:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795574684; bh=NQwHqHHgW8dLEuc5KXKT12Xz9cR8nNjFga5yIVgajKg=;
	h=From:To:Cc:Subject:Date:From;
	b=JmbIT0O7HA8kMHuRLJUPexkU+r5Yi9R/kIwcU5r+fBLAvgC2Zl5PTPvnSCfntEhph
	 EdLEZSaGfx0MYkBpoOsWy/hnwrDdyKXmbRl5Z7vU1DVq6jkpX5JIwUdUQmbTTHAwnk
	 MVBbFZGScN1QPa2BGfXU7TmWZmMexvtQj6XebujI=
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
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jia He <justin.he@arm.com>
Subject: [PATCH v2 0/3] KVM: arm64: nv: VNCR page in read-only and cacheable PFNMAP memory
Date: Wed, 25 Nov 2026 02:44:23 +0000
Message-Id: <20261125024426.3464050-1-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_184448_010926_746C4E79 
X-CRM114-Status: GOOD (  13.03  )
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

On a VNCR abort, KVM walks the guest hypervisor's EL2 stage-1 tables
and maps the page that VNCR_EL2 points to. This series fixes two cases
where that fails.

Patch 1 fixes a bug that predates this series. If TCR_EL2.HA is set and
the descriptor that maps VNCR_EL2 is in a read-only memslot, KVM cannot
set the AF and the walk returns -EPERM. kvm_handle_vncr_abort() has no
case for -EPERM, so the vCPU takes the same abort forever. Patch 1
injects the SEA that the walk recorded.

Patch 2 adds a selftest for this case.

Patch 3 allows the VNCR page in a cacheable VM_PFNMAP or VM_MIXEDMAP
VMA. The stage-2 fault path already maps such memory as cacheable, but
kvm_translate_vncr() rejects it and injects an SEA.

Patch 1 can be applied on its own.

Based on v7.4-rc3.

Changes since v1:
- New patches 1 and 2, for the -EPERM issue found by Sashiko.
- Patch 3: get the HVA with gfn_to_hva_memslot_prot() so that a VNCR
  page in a read-only memslot is not rejected (Sashiko).
- Patch 3: limit the stage-2 comparison in the commit message to
  VM_PFNMAP and VM_MIXEDMAP VMAs.

v1: https://lore.kernel.org/r/20261124025336.4107575-1-justin.he@arm.com

Jia He (3):
  KVM: arm64: nv: Inject an SEA when the VNCR walk cannot set the AF
  KVM: arm64: selftests: Add a test for VNCR_EL2 translation faults
  KVM: arm64: nv: Allow the L1 VNCR page in cacheable PFNMAP memory

 arch/arm64/include/asm/kvm_mmu.h              |   2 +
 arch/arm64/kvm/mmu.c                          |   2 +-
 arch/arm64/kvm/nested.c                       |  39 +++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/nv_vncr_abort.c       | 211 ++++++++++++++++++
 5 files changed, 248 insertions(+), 7 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/nv_vncr_abort.c

-- 
2.34.1


