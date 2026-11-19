Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F6D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ADi4OOcR;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DX9dsadD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EUVB3lvAAA+9cFv96d1naxWu3Fm3QF4X7A86Sm9t51E=; b=ADi4OOcRMr1yuhydz7+a5FIkCZ
	xASMmhLgrfqZIcozRt2zm3rjUtg8KrKbffXfcd3PN6BF6BE42IlcY9a7Z9lXbEVTZElesu0vT/toY
	rES8jjeS/efXJ1Ak2Ny/hdnTNQPvvjTSnP8Wp3F+4A26GmnK70MHeiiEKNY1s3ASjYi7YwzwjTcol
	q506nJ3mVy0mImAhLKfcS0o4kkUbfmkVRCAIk0rPrrwMf72lEJA0SuB74QKwVWPed5CKG6qeITFbr
	kKAtUjQKIAstrfADNs4H73VypgGT+PUAWqkf5kTAWSkcD6MbKlJZmuGQ/yErfoPsuK5OZLLCWKcEF
	1I02frwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Dz-0000000D3Y8-2IW1;
	Thu, 19 Nov 2026 18:51:11 +0000
Received: from mail-ot1-x347.google.com ([2607:f8b0:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Dw-0000000D3Wz-2FC0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:51:09 +0000
Received: by mail-ot1-x347.google.com with SMTP id 46e09a7af769-862bca06702so208916a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114267; x=1795719067; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EUVB3lvAAA+9cFv96d1naxWu3Fm3QF4X7A86Sm9t51E=;
        b=DX9dsadDoAtNzvt5M2CjG8GQkEf4TMqnnFzBwj7PsSlicEtjGQGyVI3a5aKtuI+KD3
         bcACpyid0JUQhsJ72K3JJQV595gPbexMN8W7ft5K+JiCS3hL8BGybeUTpjjqgWh/eNLl
         UPE5kictfnY8moHC6Ifulw/fmu9n0qq27AJ9KSkPzzJ2zNUYZqBxSnJ8K1T21S6VPlZB
         ij/pLKtSPFKKI/YJLQXC0dvAWqKoqd+4Jdv2N+CEfcZRb+1W8dZ7d7KSq6Quhen3frMW
         6YDprTJK2mMGUAmChUOgkimWaFoKltSUSNI5aNU+gTfEUKChT12HHorG+4neBv7Yvxk4
         +S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114267; x=1795719067;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUVB3lvAAA+9cFv96d1naxWu3Fm3QF4X7A86Sm9t51E=;
        b=ftZH3vSch5I21tLfct1VdrSyfKombuxAfzXlACCUSWI4U1dsJGwtxwPZXWcW10qN7M
         bb7qiSSE+aRegI2I8MeSg/fmGx7Co8cGg77oYeBK0QYZA/0KN+BqIBr60w9z2YdNaj3x
         iAxCgpTzYdKzT9psNEFTBa7EVPuK+vFMQOA9ehxe1TyBOYPUDQtCN8P2PQdMJgTE/qt2
         zQFn+08WORRDQLtsOOtmLe4FSBbdn7X9Xy6vJGOlcRvKyH3Uod34SQ/mEmL1IkaUTHTo
         OJcMkSmW6osfZxSXI0AXEmTLVUAwEFEemtemWP4GRMdIGnjEEFV+Uo91u0sXFzvVDOrW
         PNNg==
X-Forwarded-Encrypted: i=1; AL+hErESB5RGJIfhv7BBGkBDfkYpWXmu4mr0F3SVP/C5/pcNF2c/6FR1zbG2q1j08UoV+hIuQPI5yM9lh0qQ6q9EZgtq@lists.infradead.org
X-Gm-Message-State: APuU4Z+AyNSGMMOEO7AqWaPE4Bj70c8NtLC+ftV4H20BPWdo63JGF3f+
	nwQTft6bzKHsQ6mIrIhsLqwW/Tk+3QA8OshNNbMIHpR42KoE89MbaPX5XoOsPPvyI6CMwnh8Zvn
	hpSfy88VVGQlmR70bJSE6eUSzBQ==
X-Received: from jafr21-n2.prod.google.com ([2002:a05:6638:afd5:20b0:621:af13:c8e0])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1789:b0:572:48fd:bdb7 with SMTP id 5614622812f47-57a06b1d9a3mr1038736b6e.2.1795114266544;
 Thu, 19 Nov 2026 10:51:06 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:05 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185105.626343-1-coltonlewis@google.com>
Subject: [PATCH] KVM: arm64: nv: Fix guest stage-2 mapping leak on sub-block unmap
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Wei-Lin Chang <weilin.chang@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steffen Eiden <seiden@linux.ibm.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_105108_619283_9D51035B 
X-CRM114-Status: GOOD (  17.58  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a shadow stage-2 block mapping (for example, 2M at PMD level) is
partially invalidated by a smaller guest unmap such as a 4K TLBI
IPAS2E1IS, kvm_pgtable_stage2_unmap() shatters and clears the entire
block descriptor in mmu->pgt. However, kvm_remove_guest_s2_mappings()
only removes a struct kvm_guest_s2_mapping node when its entire
[nested_start, nested.last] span lies within the unmap range. As a
result, every sub-block invalidation followed by a re-fault leaks a
stale block-sized tracking node in mmu->guest_s2_mappings and
kvm->arch.mmu.guest_s2_mappings until the shadow MMU is destroyed,
allowing an L1 guest to grow host kernel memory and degrade subsequent
TLBI IPAS2E1IS walks to O(N) under write_lock(&kvm->mmu_lock).

Conversely, unconditionally removing any overlapping tracking node on a
sub-block unmap would be unsafe when a shadow block mapping has been
split into a child table (such as on a page-granule fault under dirty
logging or a racing shared walk returning -EAGAIN), because sibling
sub-page PTEs outside the unmapped range remain live in mmu->pgt and
still rely on the block-sized tracking node for host MMU notifier
unmaps.

Since stage2_unmap_walker() unlinks empty child page tables in
KVM_PGTABLE_WALK_TABLE_POST as soon as their last valid entry is
cleared, check mmu->pgt via kvm_pgtable_get_leaf() on partial-overlap
candidates: when no valid entry or split sub-table remains at or below
the recorded mapping granule (!kvm_pte_valid(pte) &&
kvm_granule_size(level) >= map_size), remove and free the tracking node;
otherwise retain it to cover surviving split sub-entries.

In addition, suppress exact-match duplicate insertions in
kvm_record_guest_s2_mapping() when concurrent faults or -EAGAIN retries
record an identical (nested, canonical) range on the same shadow MMU.

Fixes: 5491980c1a41 ("KVM: arm64: nv: Track guest stage-2 mapping removal")
Fixes: c2778d14cd2f ("KVM: arm64: nv: Track guest stage-2 mapping creation")
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/nested.c | 68 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28b..2b1c85de5b719 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -896,6 +896,30 @@ static unsigned long s2_mapping_to_nested_start(struct kvm_guest_s2_mapping *map
 	return mapping->nested.start & ~S2_MMU_IDX_MASK;
 }
 
+static bool guest_s2_mapping_exists(struct kvm_s2_mmu *mmu,
+				    struct kvm_guest_s2_mapping *mapping)
+{
+	struct interval_tree_node *node;
+
+	for (node = interval_tree_iter_first(&mmu->guest_s2_mappings,
+					     mapping->nested.start,
+					     mapping->nested.last);
+	     node;
+	     node = interval_tree_iter_next(node, mapping->nested.start,
+					    mapping->nested.last)) {
+		struct kvm_guest_s2_mapping *curr;
+
+		curr = container_of(node, struct kvm_guest_s2_mapping, nested);
+		if (curr->nested.start == mapping->nested.start &&
+		    curr->nested.last == mapping->nested.last &&
+		    curr->canonical.start == mapping->canonical.start &&
+		    curr->canonical.last == mapping->canonical.last)
+			return true;
+	}
+
+	return false;
+}
+
 void kvm_record_guest_s2_mapping(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
 				 gpa_t nested_ipa, size_t map_size,
 				 struct kvm_guest_s2_mapping *mapping)
@@ -915,9 +939,32 @@ void kvm_record_guest_s2_mapping(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
 
 	tag_s2_mapping_mmu(mapping, mmu);
 
-	guard(spinlock)(&kvm->arch.guest_s2_tracking_lock);
-	interval_tree_insert(&mapping->nested, &mmu->guest_s2_mappings);
-	interval_tree_insert(&mapping->canonical, &kvm->arch.mmu.guest_s2_mappings);
+	scoped_guard(spinlock, &kvm->arch.guest_s2_tracking_lock) {
+		if (!guest_s2_mapping_exists(mmu, mapping)) {
+			interval_tree_insert(&mapping->nested,
+					     &mmu->guest_s2_mappings);
+			interval_tree_insert(&mapping->canonical,
+					     &kvm->arch.mmu.guest_s2_mappings);
+			mapping = NULL;
+		}
+	}
+
+	kfree(mapping);
+}
+
+static bool guest_s2_mapping_unmapped(struct kvm_s2_mmu *mmu,
+				      gpa_t nested_start, size_t map_size)
+{
+	kvm_pte_t pte;
+	s8 level;
+
+	if (!mmu->pgt)
+		return true;
+
+	if (kvm_pgtable_get_leaf(mmu->pgt, nested_start, &pte, &level, 0))
+		return false;
+
+	return !kvm_pte_valid(pte) && kvm_granule_size(level) >= map_size;
 }
 
 void kvm_remove_guest_s2_mappings(struct kvm_s2_mmu *mmu, gpa_t nipa,
@@ -937,17 +984,24 @@ void kvm_remove_guest_s2_mappings(struct kvm_s2_mmu *mmu, gpa_t nipa,
 	node = interval_tree_iter_first(&mmu->guest_s2_mappings, nipa, nipa_end);
 	while (node) {
 		unsigned long nested_start;
+		size_t map_size;
 
 		next = interval_tree_iter_next(node, nipa, nipa_end);
 		mapping = container_of(node, struct kvm_guest_s2_mapping,
 				       nested);
 		/*
-		 * Tracking must be conservative on removal, only remove
-		 * mappings that are within the unmap range.
+		 * A sub-block unmap tears down an unsplit shadow block entry
+		 * in mmu->pgt, whereas a split block may still have valid
+		 * sub-page entries outside [nipa, nipa_end]. Remove the
+		 * tracking entry when it lies within the unmap range or no
+		 * mappings remain across its span in mmu->pgt.
 		 */
 		nested_start = s2_mapping_to_nested_start(mapping);
-		if (nipa <= nested_start && nipa_end >= mapping->nested.last) {
-			interval_tree_remove(&mapping->nested, &mmu->guest_s2_mappings);
+		map_size = mapping->nested.last - nested_start + 1;
+		if ((nipa <= nested_start && nipa_end >= mapping->nested.last) ||
+		    guest_s2_mapping_unmapped(mmu, nested_start, map_size)) {
+			interval_tree_remove(&mapping->nested,
+					     &mmu->guest_s2_mappings);
 			interval_tree_remove(&mapping->canonical,
 					     &kvm->arch.mmu.guest_s2_mappings);
 			kfree(mapping);

base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
-- 
2.56.1.809.ga0b61035b5-goog


