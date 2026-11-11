Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314B6606B6B9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B8Ff1P3K;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vb2JgBn/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rrNjKzhy2EVfF3Cyo1JsbQOpZSytrdClVTSrpPuu3y8=; b=B8Ff1P3KzSuDEG
	ay/LykG4TqxRZYK+EXqtpoDd7+3/lOLH68PnZhmYZA9mabSe4iroC103mgUXfHCcflAwvwEut29DB
	8K5AGuDE0SWtBLhHXxwohuhiQ6iOKXIc1qhYuhLFxYP1SMsjHVSWjG3ng+D/ye3sNniDVEXwzBgAN
	mS551R6UvAcVgXaL08ai5MaU9Uew9KQ1uLqOwKCq5IGeRppk/7cJsUxVqlxAAV2ao+lK66Zgl3X+f
	XeQMxjGD0lZls6Cfo9xzyHDG0v4EYZDitnOWRVmcPht7N2sHpr1KxgZBwOiB2MENQG11Wzg+S+YGo
	QBE240hg+fL0nNLX6xqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9n0-000000071jx-3Eie;
	Wed, 11 Nov 2026 14:59:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9mv-000000071fi-42nI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:59:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 212021682;
	Wed, 11 Nov 2026 06:58:58 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.58.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 267723F632;
	Wed, 11 Nov 2026 06:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794409141; bh=+gQy6nR+I6R0Q9XQy/yu3MadO/aVM6MhKdAGZ+AVYAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vb2JgBn/6do7KCYHs8KMSpJ/soKdgrIDe/5QfMOi5mU77Tk+KfFQ3vcoEC+B5RQNM
	 VGAO1XQazHOObCQ4ENZqvuKJ9ib3dw7V2PF7sMHYRWZ9FmdJF9rgo/fGYIK6wwHmXK
	 +iNPEP4Vlu8tF0YFqQ2HiN8zAfCtkSr6ChDMwwbo=
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
Subject: [PATCH v2 10/12] KVM: arm64: CCA: Prevent memslot modifications after Realm creation
Date: Wed, 11 Nov 2026 14:57:54 +0000
Message-ID: <20261111145758.217946-11-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111145758.217946-1-steven.price@arm.com>
References: <20261111145758.217946-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_065902_102436_1CB57FC0 
X-CRM114-Status: GOOD (  17.60  )
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

Once the Realm is created, prevent any changes to guest_memfd backed
memslots, as the private memory is provided by slots backed by gmem.
This will also be validated when we handle a fault for Realm Stage2 (in
a later commit).

Require Realm memslots to lie in the lower half of the IPA space, as the
upper, shared half aliases the lower, protected half.

A rejected deletion can already have invalidated the memslot before
the prepare hook rejects it. Keep private mappings intact in this
case.

Additionally, similar to pKVM, we do not support dirty logging or
read-only memslots.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>

---
Changes since v1:
- Preserve private mappings if KVM invalidates a Realm guest_memfd
  slot before the prepare hook rejects its deletion.
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/mmu.c              | 37 +++++++++++++++++++++++--------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index d672d87ffe62..a82b18a3e4e5 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1612,6 +1612,8 @@ struct kvm *kvm_arch_alloc_vm(void);
 
 #define kvm_vm_hyp_is_distrusting(kvm)	((kvm)->arch.vm_flavor >= __VM_DISTRUSTING_HYP)
 
+#define kvm_arch_has_private_mem(kvm) kvm_vm_is_realm(kvm)
+
 #define kvm_has_mte(kvm)					\
 	(system_supports_mte() &&				\
 	 test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &(kvm)->arch.flags))
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8c29ed204d61..e550360fc94d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2858,17 +2858,32 @@ int kvm_arch_validate_memory_region(struct kvm *kvm,
 {
 	lockdep_assert_held(&kvm->slots_lock);
 
-	if (kvm_vm_is_protected(kvm)) {
+	if (kvm_vm_is_protected(kvm) && new &&
+	    (new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)))
+		return -EPERM;
+
+	switch (kvm->arch.vm_flavor) {
+	case VM_PROTECTED_PKVM:
 		/* Cannot modify memslots once a pVM has run. */
 		if (pkvm_hyp_vm_is_created(kvm) &&
-		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
+		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE))
 			return -EPERM;
-		}
+		break;
+	case VM_REALM:
+		/*
+		 * Once the Realm is created, we cannot modify any slots that
+		 * could be providing private memory. i.e., guest_memfd backed
+		 * slots.
+		 * TODO: Handle trusted device private memory slots
+		 */
+		if (!kvm_realm_is_created(kvm))
+			break;
 
-		if (new &&
-		    new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)) {
+		if (kvm_slot_has_gmem(old) || kvm_slot_has_gmem(new))
 			return -EPERM;
-		}
+		break;
+	default:
+		break;
 	}
 
 	return 0;
@@ -2880,6 +2895,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				   enum kvm_mr_change change)
 {
 	hva_t hva, reg_end;
+	gfn_t ipa_limit;
 	int ret = 0;
 
 	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
@@ -2887,10 +2903,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		return 0;
 
 	/*
-	 * Prevent userspace from creating a memory region outside of the IPA
-	 * space addressable by the KVM guest IPA space.
+	 * Realm shared IPAs alias the corresponding private IPAs, so memslots
+	 * must reside entirely in the canonical lower half of the IPA space.
 	 */
-	if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
+	ipa_limit = kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT;
+	if (kvm_vm_is_realm(kvm))
+		ipa_limit >>= 1;
+	if (new->base_gfn + new->npages > ipa_limit)
 		return -EFAULT;
 
 	/*
-- 
2.43.0


