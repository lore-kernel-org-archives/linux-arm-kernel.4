Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B06E606A68E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OF8yx3yG;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tz78h8J1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FCt8v5AUxEJfZRcXCfZ7fMW0n1IyPXSrxCtardRFWtQ=; b=OF8yx3yGTTkLMs
	Mmw/0ih8TrxPMx119dGRZTCOAN5Vvq2eV99ZYgOILoeyxy8xFTaYScQmRNM2MBwLpOI/L2GvL7OSA
	XL7aTyJdJyBLtKmO0u4GzkDXTpkr4tirY4V2EBaPQ3/sfeqvJslK6GrLPUfa43pmIOc3qwu8IBS5t
	bpLyIVkxUbErwVSdXN0y2x/InpONSC0JmG2JpFqbEqupABodTILt6AZnSzkkObAlbeCIMpE+Sy8St
	xuurxtj/YDQU7LDTSWhaiSAYAaMkuJf/AzRmv3/ezSLNKHKH66yedVds8uOrelvNJXN9bFKZjYznE
	Bbg4JQKzj4+G9pRIIMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRW0-000000030Wq-3stB;
	Mon, 23 Nov 2026 10:43:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRVm-000000030QE-3hGY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:43:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 726CC175D;
	Mon, 23 Nov 2026 02:42:59 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.63.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBF523F632;
	Mon, 23 Nov 2026 02:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795430582; bh=PWXQD/tP+7ur3ZyactEtuv2uXbf3M98TwHQAtyBCB4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tz78h8J130KfjJA6BFLz3pak3Kmy7z03HS/69zLFRPgrxLuatWitBXjEniBryyjTM
	 pPq6pmQzG0y2MjhxA3esC56F+bzmlVJrSgQt6wDzUoDu5N0D/5lMjup+MR1kZp3j7A
	 Ttgq7EEFsTTvPyTT/wvNf+vLHakD2aWiv70tVmuU=
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
	Steven Price <steven.price@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH v4 03/11] KVM: arm64: Pass range filter to stage2_unmap_range
Date: Mon, 23 Nov 2026 10:42:23 +0000
Message-ID: <20261123104233.95710-4-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123104233.95710-1-steven.price@arm.com>
References: <20261123104233.95710-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_024303_034951_79015EA4 
X-CRM114-Status: GOOD (  13.36  )
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

With the introduction of private memory support, we need to
handle invalidation requests with filters for a given type.
Pass the range filter down to the stage-2 unmap operation.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h |  4 +++-
 arch/arm64/kvm/mmu.c              | 31 +++++++++++++++++++++++--------
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 8438251e1d1b..9d6258b213d1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -233,6 +233,7 @@ struct kvm_vcpu_ops {
 };
 
 struct kvm_gfn_range;
+enum kvm_gfn_range_filter;
 struct kvm_s2_fault_desc;
 
 struct kvm_vm_s2_ops {
@@ -243,7 +244,8 @@ struct kvm_vm_s2_ops {
 					  u64 nr_pages);
 	void (*vm_stage2_unmap_range)(struct kvm_s2_mmu *mmu,
 				      phys_addr_t start, u64 size,
-				      bool may_block);
+				      bool may_block,
+				      enum kvm_gfn_range_filter filter);
 	int (*vm_mem_abort)(const struct kvm_s2_fault_desc *s2fd);
 };
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 09c831a49ed3..8a9a80c7cfab 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -324,7 +324,8 @@ static int kvm_pgtable_stage2_unmap_tracked(struct kvm_pgtable *pgt,
 
 static void kvm_vm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
 				      phys_addr_t start,
-				      u64 size, bool may_block)
+				      u64 size, bool may_block,
+				      enum kvm_gfn_range_filter filter)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 	int (*fn)(struct kvm_pgtable *, u64, u64);
@@ -339,14 +340,16 @@ static void kvm_vm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
 
 static void pkvm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
 				    phys_addr_t start,
-				    u64 size, bool may_block)
+				    u64 size, bool may_block,
+				    enum kvm_gfn_range_filter filter)
 {
 	WARN_ON(stage2_apply_range(mmu, start, start + size,
 				   pkvm_pgtable_stage2_unmap, may_block));
 }
 
 static void no_stage2_unmap_range(struct kvm_s2_mmu *mmu,
-				  phys_addr_t start, u64 size, bool may_block)
+				  phys_addr_t start, u64 size, bool may_block,
+				  enum kvm_gfn_range_filter filter)
 {
 }
 
@@ -388,25 +391,36 @@ static int kvm_pgtable_stage2_unmap_tracked(struct kvm_pgtable *pgt, u64 addr, u
 }
 
 /**
- * kvm_stage2_unmap_range -- Clear stage2 page table entries to unmap a range
+ * kvm_stage2_unmap_range_filter -- Clear stage2 page table entries to unmap a
+ * range
  * @mmu:   The KVM stage-2 MMU pointer
  * @start: The intermediate physical base address of the range to unmap
  * @size:  The size of the area to unmap
  * @may_block: Whether or not we are permitted to block
+ * @filter: Filter for the ipa range (private and/or shared)
  *
  * Clear a range of stage-2 mappings, lowering the various ref-counts.  Must
  * be called while holding mmu_lock otherwise another faulting VCPU may
  * come in and mess with things behind our backs.
  */
-void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
-			    u64 size, bool may_block)
+static void kvm_stage2_unmap_range_filter(struct kvm_s2_mmu *mmu, phys_addr_t start,
+					  u64 size, bool may_block,
+					  enum kvm_gfn_range_filter filter)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	WARN_ON(size & ~PAGE_MASK);
 
-	kvm->arch.vm_s2_ops->vm_stage2_unmap_range(mmu, start, size, may_block);
+	kvm->arch.vm_s2_ops->vm_stage2_unmap_range(mmu, start, size,
+						   may_block, filter);
+}
+
+void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
+			    u64 size, bool may_block)
+{
+	kvm_stage2_unmap_range_filter(mmu, start, size, may_block,
+				      KVM_FILTER_PRIVATE | KVM_FILTER_SHARED);
 }
 
 void kvm_stage2_flush_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end)
@@ -2597,7 +2611,8 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 	if (!kvm->arch.mmu.pgt)
 		return false;
 
-	kvm_stage2_unmap_range(&kvm->arch.mmu, gpa, size, may_block);
+	kvm_stage2_unmap_range_filter(&kvm->arch.mmu, gpa, size, may_block,
+				      range->attr_filter);
 	kvm_nested_unmap_cipa_range(kvm, gpa, size, may_block);
 
 	return false;
-- 
2.43.0


