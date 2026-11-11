Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1929D606B6B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GBFG/N6Z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cwZHoTlC;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pJ9h+EtN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+35/VIw120EtksuRZQNRBkWZeojJB0lJieLJNnkQ+Us=; b=GBFG/N6Z48Wu5h
	NGke/aJUtQfNz3mcy2z7z4ZA9g5i//dhAOcKGpNcGEXAQiSkpay6cnD2m6vaNmPDZGQ1W0Z9I5S3B
	6YKlJiD+BVLxYE5MmRs7Yp9buT8I/V+8VYY6wrd9ur67eR72l2ULc2iPikqwXOdysM50YZYJPcVjC
	nv/TTu/DHp5tB7l9ISts7jsp5IJXjiUT39zWdOrrK0vIjTI+LWm7j1QqtgWcj02oKTmB+FchVzk7C
	RAsAwJ+S/CzcMuZFEYrowv1FW+xy8Vrsgb1r6xJ/La6LYAJgUA8JxCdtE9IBworheomxTNQv2zgyI
	btNHopxxwfVmSdrw8hgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9n0-000000071jk-2cCe;
	Wed, 11 Nov 2026 14:59:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9mw-000000071fX-13cN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Nov 2026 14:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+35/VIw120EtksuRZQNRBkWZeojJB0lJieLJNnkQ+Us=; b=cwZHoTlCJOAA5kgnGu2lT9b2Bj
	hNrhjSrQMvZTqELB/Fyt7xWJ9Y0tubeNUY2NUxrzo0sv9MT0ne8gcyulHYBzI7inyZ8z8zko3P+HX
	PtA/4TILG2F3Zwuc/iQvYWyC2XQ2b0tQAlTpDpRrToNIXhAfqyGOlO6uG7hQXoga26rQZO0LU/2dW
	no7GIFtT6MX+A5LAsHjeoNWHRpECe6nGrLOd/bv33366mohpEGr/bgxtyAQ/gK6tu3lAdCpfxu1qr
	aXfAlMhm01g7wtFfEaEfZc8SSfW+1TGdMbtlG79LgeqZFR4kPQJzybKseQcc46fjVjfYwB65J3dCW
	3xU09hMQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9ms-00000009FiM-2DAu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:59:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B25E61576;
	Wed, 11 Nov 2026 06:58:52 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.58.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3BAE3F632;
	Wed, 11 Nov 2026 06:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794409135; bh=1kcGk24+Xt8qjyfRn+nXorHBSpYyZ4/LOOK+Vrf2f5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJ9h+EtNgSwt73XZXIW4T8xbfd9i7POtWO9YA5zerUqpc/o72kNGe2LirBroVvrUk
	 oFzmu7u+EvZflkIJjCfnR+dJLbwXKqtN4lE03JoW5P3T/A2vZZRVN14xdR0LxTzOoR
	 0UUYPJO70ObyLlDOCvCZiioFw53B+Eq6cenay5fA=
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
Subject: [PATCH v2 09/12] KVM: Allow architectures to reject memslot changes before invalidation
Date: Wed, 11 Nov 2026 14:57:53 +0000
Message-ID: <20261111145758.217946-10-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111145758.217946-1-steven.price@arm.com>
References: <20261111145758.217946-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_145858_829292_295A8D25 
X-CRM114-Status: GOOD (  19.06  )
X-Spam-Score: -2.5 (--)
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
index be014f6c00e7..8c29ed204d61 100644
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


