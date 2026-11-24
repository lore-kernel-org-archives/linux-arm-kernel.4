Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF71F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AmV/pwXh;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mHAjw4tY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KAvHK6j0hREgOFUkVu/pGTkn7fy5PDfJjXV7BZ0L4ak=; b=AmV/pwXhS9j5WCfwsteteAi1Rx
	dNgEq6gE38knJYa8RB3v1sGZ9Jg9BdR+opE+E5Hm/IgF2VDmE1hU9tlynabPx3M6KoBITUYw9tZTe
	3OG8oRy0C587OlumcVFMWP767Lmbo8+qtzBAAXL2g4QFoFn2ikRe04e3BNGIrIM2tripnb/bPx05k
	6a8qpJIehO+y4yImJeYP2qWsGzTZKnOa+5L1SPXfU/HW2Vy2dkhAfWzW1t7iCkl+gnMFVU5B0KxXg
	6++XLhYpFYamRA7fXkdM2Uyqdr+NSktwV/GpUVrSmntb8FbQ42KfTSBucJ08al/wCUXrX9X93n2ts
	tyOySBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoI3-00000006HgA-3Nsv;
	Tue, 24 Nov 2026 11:02:26 +0000
Received: from out-24.mta0.migadu.com ([2001:41d0:1004:224b::18] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoI1-00000006Hfc-0sYH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:02:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YQOhx28BDze68y36zy90w+D/2RW09RYxRy95T7kvqVE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795518138; v=1; x=1796122938;
 b=mHAjw4tYzSAbLJMfkcEYcq0YIf63aj6uOu6qCOkBwPC9lFDTox4JZQHX+hqk/29Qy48Ta4AE
 0zsD0hoswVQYR/4upBbAsovAW+PpPOlVCjGJs5pNJR8Mh18Y0wTATB4fnlphyx7P24tdcpzC7BG
 8UvW+9cJhuO/KG1gieRzi5LY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e2ce8471a6143467;
	Tue, 24 Nov 2026 11:02:18 +0000
X-Mizu-Trace-ID: e2ce8471a6143467
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Price <steven.price@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	Cornelia Huck <cohuck@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: Set PG_mte_tagged before copying MTE tags from userspace
Date: Tue, 24 Nov 2026 11:02:13 +0000
Message-ID: <20261124110213.587871-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_030221_423337_6534F8A6 
X-CRM114-Status: GOOD (  19.86  )
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

KVM_ARM_MTE_COPY_TAGS takes PG_mte_lock on a page's first tagging, and
sets PG_mte_tagged only after copying the tags in from userspace.
However, that copy faults on the same page if the VMM passes a PROT_MTE
mapping of the page as the tags buffer. The fault then spins forever in
mte_sync_tags(), waiting for PG_mte_tagged to be set.

Call sanitise_mte_tags() before the copy, so that PG_mte_tagged is
already set if the copy faults. The ioctl calls it holding a reference
on the page rather than kvm->mmu_lock, and either keeps the page from
being freed. A racing vCPU fault or __set_ptes() then finds the page
tagged and doesn't touch its tags. The guest and the VMM can read
cleared tags from the page until the copy finishes.

Fixes: d77e59a8fccde ("arm64: mte: Lock a page for MTE tag initialisation")
Reported-by: Catalin Marinas <catalin.marinas@arm.com>
Closes: https://lore.kernel.org/all/auPCV6VdMEz4uZkK@arm.com/
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Based on kvmarm/fixes (012e4bc01e339), which has the MTE fixes this
    patch depends on.
    
    I didn't go with Catalin's suggestion of a copy_from_user() into a
    local buffer, since there's no helper that writes tags held in the
    ioctl's one-tag-per-byte format from a kernel buffer to a page.

 arch/arm64/include/asm/kvm_mmu.h |  1 +
 arch/arm64/kvm/guest.c           | 18 ++++--------------
 arch/arm64/kvm/mmu.c             |  7 +++----
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 32392abf2e21c..d0f66426f139f 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -196,6 +196,7 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 
 int kvm_handle_guest_sea(struct kvm_vcpu *vcpu);
 int kvm_handle_guest_abort(struct kvm_vcpu *vcpu);
+void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn, unsigned long size);
 
 phys_addr_t kvm_mmu_get_httbr(void);
 phys_addr_t kvm_get_idmap_vector(void);
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index b7d36c2abfdf9..82911d1287611 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -24,6 +24,7 @@
 #include <asm/fpsimd.h>
 #include <asm/kvm.h>
 #include <asm/kvm_emulate.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_nested.h>
 #include <asm/sigcontext.h>
 
@@ -1057,27 +1058,16 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 			kvm_release_page_clean(page);
 		} else {
 			/*
-			 * Only locking to serialise with a concurrent
-			 * __set_ptes() in the VMM but still overriding the
-			 * tags. A hugetlb folio is marked tagged as a whole,
-			 * so its first tagging clears every page.
+			 * The user copy can fault on this page, and that fault
+			 * spins until PG_mte_tagged is set, so set it first.
 			 */
-			if (folio_test_hugetlb(folio)) {
-				if (folio_try_hugetlb_mte_tagging(folio))
-					mte_clear_folio_tags(folio);
-			} else {
-				try_page_mte_tagging(page);
-			}
+			sanitise_mte_tags(kvm, page_to_pfn(page), PAGE_SIZE);
 			num_tags = mte_copy_tags_from_user(maddr, tags,
 							MTE_GRANULES_PER_PAGE);
 
 			/* uaccess failed, don't leave stale tags */
 			if (num_tags != MTE_GRANULES_PER_PAGE)
 				mte_clear_page_tags(maddr);
-			if (folio_test_hugetlb(folio))
-				folio_set_hugetlb_mte_tagged(folio);
-			else
-				set_page_mte_tagged(page);
 
 			kvm_release_page_dirty(page);
 		}
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a0d4981ebb998..9365d83a646d7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1598,11 +1598,10 @@ static int get_vma_page_shift(struct vm_area_struct *vma)
  * able to see the page's tags and therefore they must be initialised first. If
  * PG_mte_tagged is set, tags have already been initialised.
  *
- * Must be called with kvm->mmu_lock held to ensure the memory remains mapped
- * while the tags are zeroed.
+ * The caller must hold kvm->mmu_lock or a reference on the page, so that the
+ * page isn't freed while the tags are zeroed.
  */
-static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
-			      unsigned long size)
+void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn, unsigned long size)
 {
 	unsigned long i, nr_pages = size >> PAGE_SHIFT;
 	struct page *page = pfn_to_page(pfn);

base-commit: 012e4bc01e339a65dc7c59181b5efb33b171d12c
-- 
2.47.3


