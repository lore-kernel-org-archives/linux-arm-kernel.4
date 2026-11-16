Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ABD606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pnZGCKo8;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hOkcz00+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yF/V4RQcsz22ZXchQTYFWKlhLRQ49e9sOfQfIXFrF5U=; b=pnZGCKo8cexk7w
	45hP3/2HyZhGTmMP4yStr9pAMga2z1jAouzteHvXKO6qPNQ1fUOj7uxHqf6l1qRyYIOckUC6wSqHZ
	dBgJdo0QviA0yPsirvgJiCg6oa+T9626PetWRS9vHr70LbMV81bGkz5j04tbCtL1Ue97ODPoAJjwv
	5ngtD9gBt0NfoK9962g6Pr0nc/vJca0vJ0PD5rOfBIMMuszkvfks/7Ik8a2hfRlWXY9vEzZbBU4Bh
	APLKSIgNOFs7cSYH6jHpqPu8ajunQwtm+yHpz1IPmyE8M2/03zUu6E3Ol9Wq/HYO5VoS4E/r7GWWw
	usBIrwWlE8wwRwNAWo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzpN-00000003IoT-1Rky;
	Mon, 16 Nov 2026 16:45:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzp9-00000003IcL-3ImW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:44:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 223C3143D;
	Mon, 16 Nov 2026 08:44:52 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.63.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73A843F882;
	Mon, 16 Nov 2026 08:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794847495; bh=kYb0vllDY8D8xPF23SOdLAaWWaEXo/vzCyoXKEd1aPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hOkcz00+JN4EvThhf6fcUB8LbE7ZNwy5bt+qTX/khfTPiAprz3gG0okZ1zCL5M6iM
	 iGXOkmSwj7SbyOJt1H3EGOF70QF8pv+fMz11QFYWus+if4V2ITQz+E8xS8OfBeDxsX
	 BWkCn+IUgEe3C9WcVFaVTwqmtGhFKZsvIrlSOfgw=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
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
	Kohei Enju <enju.kohei@fujitsu.com>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v3 07/11] KVM: Allow architectures to reject memslot changes before invalidation
Date: Mon, 16 Nov 2026 16:43:53 +0000
Message-ID: <20261116164358.142785-8-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116164358.142785-1-steven.price@arm.com>
References: <20261116164358.142785-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_084455_923525_8556E7D3 
X-CRM114-Status: GOOD (  18.11  )
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

From: Suzuki K Poulose <suzuki.poulose@arm.com>

Architectures may need to reject deletion of a memory slot without
changing the guest's memory mappings. Currently, KVM invalidates the slot
and calls kvm_arch_flush_shadow_memslot() before
kvm_arch_prepare_memory_region() can reject the request. On arm64, this
unmaps the slot from stage-2. Restoring the old memslot on failure does not
restore those mappings, so even a rejected deletion has side effects.

Add kvm_arch_validate_memory_region() and invoke it before invalidating
the slot, with slots_lock and slots_arch_lock held. The hook performs
validation only, allowing architectures to reject a request without
changing the memslot or its mappings. Provide a weak no-op implementation
for architectures that do not need early validation.

Move arm64's protected VM checks into the new hook so that unsupported
deletions and moves are rejected before stage-2 unmapping. Keep resource
preparation after invalidation, since invalidation drops slots_arch_lock
and allows concurrent updates to architecture-specific memslot metadata.

Assisted-by: LLM
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/kvm/mmu.c     | 22 ++++++++++++++++------
 arch/arm64/kvm/pkvm.c    |  2 +-
 include/linux/kvm_host.h |  4 ++++
 virt/kvm/kvm_main.c      | 33 ++++++++++++++++++++++++++-------
 4 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9baf2352d2a8..759ac0453828 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2851,13 +2851,12 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 	}
 }
 
-int kvm_arch_prepare_memory_region(struct kvm *kvm,
-				   const struct kvm_memory_slot *old,
-				   struct kvm_memory_slot *new,
-				   enum kvm_mr_change change)
+int kvm_arch_validate_memory_region(struct kvm *kvm,
+				    const struct kvm_memory_slot *old,
+				    const struct kvm_memory_slot *new,
+				    enum kvm_mr_change change)
 {
-	hva_t hva, reg_end;
-	int ret = 0;
+	lockdep_assert_held(&kvm->slots_lock);
 
 	if (kvm_vm_is_protected(kvm)) {
 		/* Cannot modify memslots once a pVM has run. */
@@ -2872,6 +2871,17 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		}
 	}
 
+	return 0;
+}
+
+int kvm_arch_prepare_memory_region(struct kvm *kvm,
+				   const struct kvm_memory_slot *old,
+				   struct kvm_memory_slot *new,
+				   enum kvm_mr_change change)
+{
+	hva_t hva, reg_end;
+	int ret = 0;
+
 	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
 			change != KVM_MR_FLAGS_ONLY)
 		return 0;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index a5145bd75d0c..f4db0e051d6a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -262,7 +262,7 @@ int pkvm_create_hyp_vm(struct kvm *kvm)
 	int ret = 0;
 
 	/*
-	 * Synchronise with kvm_arch_prepare_memory_region(), as we
+	 * Synchronise with kvm_arch_validate_memory_region(), as we
 	 * prevent memslot modifications on a pVM that has been run.
 	 */
 	mutex_lock(&kvm->slots_lock);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f65728a713ec..15848221860f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1255,6 +1255,10 @@ int kvm_set_internal_memslot(struct kvm *kvm,
 			     const struct kvm_userspace_memory_region2 *mem);
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
 void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
+int kvm_arch_validate_memory_region(struct kvm *kvm,
+				    const struct kvm_memory_slot *old,
+				    const struct kvm_memory_slot *new,
+				    enum kvm_mr_change change);
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				const struct kvm_memory_slot *old,
 				struct kvm_memory_slot *new,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cf4cb586f140..3ef370d71818 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1682,6 +1682,20 @@ static void kvm_swap_active_memslots(struct kvm *kvm, int as_id)
 	slots->generation = gen;
 }
 
+/*
+ * Validate a memslot change before invalidation, which may irreversibly reclaim
+ * private guest memory. Called with slots_lock and slots_arch_lock held.
+ * Implementations must not modify memslot state or allocate resources; leave
+ * those operations to kvm_arch_prepare_memory_region().
+ */
+__weak int kvm_arch_validate_memory_region(struct kvm *kvm,
+					   const struct kvm_memory_slot *old,
+					   const struct kvm_memory_slot *new,
+					   enum kvm_mr_change change)
+{
+	return 0;
+}
+
 static int kvm_prepare_memory_region(struct kvm *kvm,
 				     const struct kvm_memory_slot *old,
 				     struct kvm_memory_slot *new,
@@ -1934,6 +1948,10 @@ static int kvm_set_memslot(struct kvm *kvm,
 	 */
 	mutex_lock(&kvm->slots_arch_lock);
 
+	r = kvm_arch_validate_memory_region(kvm, old, new, change);
+	if (r)
+		goto unlock_err;
+
 	/*
 	 * Invalidate the old slot if it's being deleted or moved.  This is
 	 * done prior to actually deleting/moving the memslot to allow vCPUs to
@@ -1950,22 +1968,22 @@ static int kvm_set_memslot(struct kvm *kvm,
 	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
 		invalid_slot = kzalloc_obj(*invalid_slot, GFP_KERNEL_ACCOUNT);
 		if (!invalid_slot) {
-			mutex_unlock(&kvm->slots_arch_lock);
-			return -ENOMEM;
+			r = -ENOMEM;
+			goto unlock_err;
 		}
 		kvm_invalidate_memslot(kvm, old, invalid_slot);
 	}
 
 	r = kvm_prepare_memory_region(kvm, old, new, change);
 	if (r)
-		goto err;
+		goto revert_slot;
 
 	if (change == KVM_MR_CREATE && (new->flags & KVM_MEM_GUEST_MEMFD)) {
 		r = kvm_gmem_commit_memory_region(kvm, new);
 		if (r) {
 			kvm_arch_free_memslot(kvm, new);
 			kvm_destroy_dirty_bitmap(new);
-			goto err;
+			goto unlock_err;
 		}
 	}
 
@@ -2000,7 +2018,7 @@ static int kvm_set_memslot(struct kvm *kvm,
 
 	return 0;
 
-err:
+revert_slot:
 	/*
 	 * For DELETE/MOVE, revert the above INVALID change.  No modifications
 	 * required since the original slot was preserved in the inactive slots.
@@ -2009,9 +2027,10 @@ static int kvm_set_memslot(struct kvm *kvm,
 	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
 		kvm_activate_memslot(kvm, invalid_slot, old);
 		kfree(invalid_slot);
-	} else {
-		mutex_unlock(&kvm->slots_arch_lock);
+		return r;
 	}
+unlock_err:
+	mutex_unlock(&kvm->slots_arch_lock);
 	return r;
 }
 
-- 
2.43.0


