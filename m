Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDCE606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HXhJtqw6;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c01EQmhd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cIh+Iax7BM1D9H5+u/MnfHAua0Cwb6nfRtbILLfMpJ4=; b=HXhJtqw60ArgAV
	2/R1acBMRUQSfXOi37rTNz/+q9r4vOTqLpgB5QLhAiK3bAxzO4tb6TSCYRwBDjt7lmhzl2/clWQYL
	L7aQs8c82m6fvf3lGrMG0u4a2FS1Fv0cByspSs/E78JTwKcIAip+jtc2c8f+xhVYHR7SuYqhB35bY
	78GgTre+P5rlTdQWbD6K2Ym/3Wj6vPXDYxNwBXCWVl+SsDGK0IgtH99EwhyjfUuqX5nh8aKBhB1Qs
	S94+70N+uDyfA4Tq0g7vpXf1HscO9yBODekVkTxSkBZHC1rQ7Wc6o5vQfwi+N224dVwNbSJe75yKA
	XWLrv2HZfBpUDQh27L2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVROq-00000002yNh-34YG;
	Mon, 23 Nov 2026 10:35:52 +0000
Received: from out-4.mta1.migadu.com ([2001:41d0:203:375::4] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVROD-00000002yEE-2f8u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:35:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=80DSeNgLr4gsI8o+Z1IuJ6m5ooSb7Rnaj6ZFYHuYkyA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795430111; v=1; x=1796034911;
 b=c01EQmhdTHA+S5ab/iIjx/l5zrKkIZ/89qGA7rGekwzmdXiYbKsmAtMVrXX53JX8kntBW5Dg
 uPyQk1WHrKsSBcKkwNP9f00k5AAKmH5V2WvHKVvISERSZMPdzL6VXOk7P70KhR+3ZZATNnLRCmD
 8stffA8jb3a4pM0jfItt+sbY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f6937f6a9f32d691;
	Mon, 23 Nov 2026 10:35:08 +0000
X-Mizu-Trace-ID: f6937f6a9f32d691
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: Fix THP block mapping when the PMD level is folded
Date: Mon, 23 Nov 2026 10:35:04 +0000
Message-ID: <20261123103505.1006067-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123103505.1006067-1-fuad.tabba@linux.dev>
References: <20261123103505.1006067-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_023513_819031_9168E85A 
X-CRM114-Status: GOOD (  12.32  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a THP backs guest memory, transparent_hugepage_adjust() rounds the
faulting gfn and pfn down to the THP's first page, and KVM maps the
whole THP with a PMD_SIZE block. However, the rounding uses a mask of
PTRS_PER_PMD - 1, and PTRS_PER_PMD is 1 when the PMD level is folded
(64K pages with a 42-bit VA, or 16K pages with a 36-bit VA). KVM then
maps PMD_SIZE worth of pages starting at the faulting page, and the
guest gets the host memory that follows the THP. With pKVM, the
hypervisor rejects the unaligned block, so the guest doesn't get that
memory.

Before the conversion to the generic page-table API, the unrounded pfn
went into a block descriptor, where the address bits below the block
size aren't part of the output address, so only the THP was mapped.

Round to PMD_SIZE >> PAGE_SHIFT pages instead.

Fixes: 6f745f1bb5bf2 ("KVM: arm64: Convert user_mem_abort() to generic page-table API")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db73..bab44021654a0 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1573,9 +1573,9 @@ transparent_hugepage_adjust(const struct kvm_s2_fault_desc *s2fd, kvm_pfn_t *pfn
 		if (sz < PMD_SIZE)
 			return PAGE_SIZE;
 
-		gfn &= ~(PTRS_PER_PMD - 1);
+		gfn = ALIGN_DOWN(gfn, PMD_SIZE >> PAGE_SHIFT);
 		*gfnp = gfn;
-		pfn &= ~(PTRS_PER_PMD - 1);
+		pfn = ALIGN_DOWN(pfn, PMD_SIZE >> PAGE_SHIFT);
 		*pfnp = pfn;
 
 		return PMD_SIZE;
-- 
2.47.3


