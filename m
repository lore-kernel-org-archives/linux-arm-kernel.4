Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAD060A5BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WPAPHZNE;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=X3e0Wc1/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0Ka4B54p4sbNSrKWCL5vmxStgm56wKqIdQXQP7NpVRo=; b=WPAPHZNERRCj9n
	nPhZkyFeOyzoaKg48evSE6oWr1nzrwLMwBiHx7C1/uTak71U1v5mw8tHBHCJEzC2Jpx0P7z1NsoL9
	InU1Sg9tUYJNWbrwUWM6a4tiDzkMWliMaY/oofQK+qeyLL+p3wAath+ERTlbHvNlCBYa66j+sBNbP
	K6fMsZVnrmg3qcEkqEyO1xMvdoqbO5A75ADqsLWX8CvGrBRSN4Mg70Dyz/jmmktR/Nmm/jsefE5o0
	RhvoDX8R9Drou+TVMecfY8EJuAFv1sZ+d91UHoDDbOw3s7ps56i3nyBDQ5K+ZwG+JS8YnQQwLunZe
	G7mlD4Gddia7sAytCUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9mK-000000071GG-0Pcg;
	Wed, 11 Nov 2026 14:58:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9mH-000000071Ff-3oNb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:58:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D4451576;
	Wed, 11 Nov 2026 06:58:18 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.58.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15E543F632;
	Wed, 11 Nov 2026 06:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794409101; bh=NjxaS8I7MBNoFlMkwcao+kYJE29WlG8theUiJeEC/vw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X3e0Wc1/bN5bK9Ydsdu6zV09TsnIebWg/y9m0yQFn3yRev5oCDqWrAmOpJ6HKTQSC
	 k8rj8D0X02zItqh4PirYbFj9NweU0t+5nvq2tL2tUMQbEWfnaNHvzLfNu+rm6XtPfc
	 cGk64C6WI0FBVFg4aJuvdty3QPE5KKaTdwThiEJg=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
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
	Kohei Enju <enju.kohei@fujitsu.com>
Subject: [PATCH v2 02/12] KVM: arm64: guest_memfd: Check mmap support when preparing memslot
Date: Wed, 11 Nov 2026 14:57:46 +0000
Message-ID: <20261111145758.217946-3-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111145758.217946-1-steven.price@arm.com>
References: <20261111145758.217946-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_065822_040332_4EC6CC96 
X-CRM114-Status: GOOD (  13.53  )
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

Check the guest_memfd backing file when deciding whether an arm64
memslot has mappable memory rather than checking whether the slot is
gmem only. A public helper function is added to be able to reuse the
static kvm_gmem_supports_mmap() function.

Signed-off-by: Steven Price <steven.price@arm.com>

---
Changes since v1:
- New patch in v2. Check the guest_memfd backing file rather than the
  memslot flag when deciding whether arm64 can map the backing memory.
---
 arch/arm64/kvm/mmu.c     | 7 ++++---
 include/linux/kvm_host.h | 1 +
 virt/kvm/guest_memfd.c   | 6 ++++++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db7..a146f6cde3d0 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2839,10 +2839,11 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		return -EFAULT;
 
 	/*
-	 * Only support guest_memfd backed memslots with mappable memory, since
-	 * there aren't any CoCo VMs that support only private memory on arm64.
+	 * Protected VMs currently require guest_memfd backed memslots with
+	 * mappable memory to support shared mappings.
 	 */
-	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
+	if (kvm_arch_has_private_mem(kvm) && kvm_slot_has_gmem(new) &&
+	    !kvm_gmem_slot_supports_mmap(new))
 		return -EINVAL;
 
 	/* guest_memfd is incompatible with MTE. */
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e7fc94e2910a..f65728a713ec 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2614,6 +2614,7 @@ static inline bool kvm_is_private_gfn(struct kvm *kvm, gfn_t gfn)
 
 #ifdef CONFIG_KVM_GUEST_MEMFD
 bool kvm_gmem_is_private_gfn(struct kvm *kvm, gfn_t gfn);
+bool kvm_gmem_slot_supports_mmap(const struct kvm_memory_slot *slot);
 bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm);
 
 static inline u64 kvm_gmem_get_supported_flags(struct kvm *kvm)
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 8c97a69b16dc..3dd8d227bebb 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -442,6 +442,12 @@ static bool kvm_gmem_supports_mmap(struct inode *inode)
 	return GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_MMAP;
 }
 
+bool kvm_gmem_slot_supports_mmap(const struct kvm_memory_slot *slot)
+{
+	/* The guest_memfd file is pinned while preparing a new memslot. */
+	return kvm_gmem_supports_mmap(file_inode(slot->gmem.file));
+}
+
 static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
 {
 	struct inode *inode = file_inode(vmf->vma->vm_file);
-- 
2.43.0


