Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B10606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E3sla41a;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GMFzn4c6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u75N2UHCo0Q1IQlaoRk+wtzVKvHVQ52rjy0wDjruBvY=; b=E3sla41adbHmAB
	vqMTvXMmiWC9QspanCvlbJdYASzi/WgXbcDMELGp97Or3b3q68PMe+Qyoh7/vVNI1Uspso96YOz6/
	Iy8krifXu5vH41RKniRXMlBv2woVenuUF3TROpEgxKPdLuP/U43FAeGayE3PCA0zYDWOrnV46n6mu
	23NefsnO9FZiNBjwQ7aLOxfgVAWL9RK2ECaeqbo58m8SdpWK6H9zPYip7Xb7J+8nWj9CsmgNyW3SR
	wsQhssUVfOXDOJ7DKHwmSRwfXDbTIkDTarrjOb5JuBG6YKaWNfg4JUW592i+mfPreifRLVRVAjM9s
	MD1qsP1t1QtDEf/Ra3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRX0-000000031GX-2puH;
	Mon, 23 Nov 2026 10:44:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRWO-000000030m0-2Wtq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:43:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AF711476;
	Mon, 23 Nov 2026 02:43:36 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.63.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBC023F632;
	Mon, 23 Nov 2026 02:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795430619; bh=XPK8ICnszazWaOOfoo2WmCdjdXKFyVejf/EIua6bpzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GMFzn4c6f/tEnXI1562O6v0JYndteS9LFOgaoMftuMVWOj6JNgVH3OPtiNvEwHJ34
	 iQ6rrjFbYCPDhl/2rSmibPVl+pIoEf684sZIxj80ChFR3ul7nWFZ7ZgVsdT9sr5zgR
	 OUsd/lukwjTYuppHOw5URnMz9O4SQjsV7+cX9v4U=
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
Subject: [PATCH v4 11/11] KVM: arm64: CCA: Add Realm stage-2 MMU operations
Date: Mon, 23 Nov 2026 10:42:31 +0000
Message-ID: <20261123104233.95710-12-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123104233.95710-1-steven.price@arm.com>
References: <20261123104233.95710-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_024340_792161_DCCC99A2 
X-CRM114-Status: GOOD (  14.79  )
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

Register the Realm stage-2 MMU operations now that the RMM mapping
and unmapping helpers are available. Route unmapping through the
RMM, and use the Realm-specific fault handler for Realm memory faults.

The RMM handles TLB invalidation when stage-2 mappings change, so
the host has no separate TLB flush to perform. Realm stage-2 does
not support access flags, including for shared IPAs.

Realm teardown destroys non-root RTTs through RMI, so the Realm
stage-2 destruction callback frees only the root RTT pages.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>

---
Changes since v3:
- Register realm_mem_abort() as the Realm stage-2 fault handler.

Changes since v2:
- Move common stage-2 destruction dispatch to a separate patch;
  retain the Realm-specific destruction callback here.
---
 arch/arm64/kvm/mmu.c | 47 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 870dc7e2699b..274dfe8ea364 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -191,6 +191,12 @@ static int kvm_vm_flush_remote_tlbs(struct kvm *kvm)
 	return 0;
 }
 
+static int realm_flush_remote_tlbs(struct kvm *kvm)
+{
+	/* Nothing to do here, RMM does the job */
+	return 0;
+}
+
 /**
  * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
  * @kvm:	pointer to kvm structure.
@@ -218,6 +224,13 @@ static int kvm_vm_flush_remote_tlbs_range(struct kvm *kvm,
 	return 0;
 }
 
+static int realm_flush_remote_tlbs_range(struct kvm *kvm,
+					 gfn_t gfn, u64 nr_pages)
+{
+	/* Nothing to do here, RMM does the job */
+	return 0;
+}
+
 int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
 				     gfn_t gfn, u64 nr_pages)
 {
@@ -353,6 +366,15 @@ static void no_stage2_unmap_range(struct kvm_s2_mmu *mmu,
 {
 }
 
+static void realm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
+				     phys_addr_t start, u64 size, bool may_block,
+				     enum kvm_gfn_range_filter filter)
+{
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+
+	kvm_realm_unmap_range_filter(kvm, start, size, may_block, filter);
+}
+
 /*
  * Unmapping vs dcache management:
  *
@@ -1054,6 +1076,17 @@ static void pkvm_stage2_destroy(struct kvm_pgtable *pgt)
 	pkvm_pgtable_stage2_destroy_pgd(pgt);
 }
 
+static void realm_stage2_destroy(struct kvm_pgtable *pgt)
+{
+	/*
+	 * Realm RTTs are inaccessible to the host and may contain stale data
+	 * after the RMM has released them. The non-root RTTs are explicitly
+	 * destroyed through RMI before the RD is destroyed; only the root PGD
+	 * pages remain to be freed here.
+	 */
+	kvm_pgtable_stage2_destroy_pgd(pgt);
+}
+
 static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
@@ -2486,7 +2519,7 @@ static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		return user_mem_abort(s2fd, NULL, kvm_s2_fault_map, false);
 }
 
-static int __maybe_unused realm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+static int realm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	struct kvm *kvm = s2fd->vcpu->kvm;
 
@@ -3389,6 +3422,16 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
 	.vm_mem_abort			= kvm_vm_mem_abort,
 };
 
+static const struct kvm_vm_s2_ops realm_vm_s2_ops = {
+	.vm_stage2_destroy		= realm_stage2_destroy,
+	.vm_flush_remote_tlbs		= realm_flush_remote_tlbs,
+	.vm_flush_remote_tlbs_range	= realm_flush_remote_tlbs_range,
+	.vm_age_gfn			= no_age_gfn,
+	.vm_test_age_gfn		= no_age_gfn,
+	.vm_stage2_unmap_range		= realm_stage2_unmap_range,
+	.vm_mem_abort			= realm_mem_abort,
+};
+
 #define KVM_VM_S2_OPS(flavor, ops)		\
 		[(flavor)] = &(ops)
 
@@ -3397,7 +3440,7 @@ static const struct kvm_vm_s2_ops *arm64_vm_s2_ops[] = {
 	KVM_VM_S2_OPS(VM_NVHE, kvm_default_vm_s2_ops),
 	KVM_VM_S2_OPS(VM_PKVM, pkvm_vm_s2_ops),
 	KVM_VM_S2_OPS(VM_PROTECTED_PKVM, protected_pkvm_vm_s2_ops),
-	[VM_REALM] = NULL,
+	KVM_VM_S2_OPS(VM_REALM, realm_vm_s2_ops),
 };
 
 static int kvm_vm_init_vm_s2_ops(struct kvm *kvm)
-- 
2.43.0


