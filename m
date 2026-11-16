Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F053C606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wYveqwJO;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=J1ql3GHj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IlR5hn1DvVbekTSMBsoU1pIyzOICN77vYydqnIPvkWc=; b=wYveqwJOMqWLWp
	Z2n/N+0FNKLLzzF/+GPaEoxLDgZIqF/CfFOqMZupQ17l9ThSIWXlvudEuG7Un9c+OAwaylQYa/9NY
	4Og+DFJIazQ6qDgOEEFU6Q6jPHtjL5izTsMdpruvYLB9tsDlBu5OGDVJ4Nf1cwEDAYTt8zwPTziaK
	UxZSyV5U+BG+2bbGT+6+yffHtNKOBmp0Z8aFyKMVzrfAF7CBC7lZ3wC3j2s36w6kG+ePxI157VXaV
	b1W9evJfsfftNT7SwOHijrchX/zJugMwdiYFCcSQOIUGdciOrup8wQS5IMwwwZ8vxVHpQACSsGet0
	RQ1JAashn6B6+UCbpS7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzpm-00000003JBm-3Wx7;
	Mon, 16 Nov 2026 16:45:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzpQ-00000003IsN-1zqn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:45:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDCFC1A25;
	Mon, 16 Nov 2026 08:45:08 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.63.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 542D53F763;
	Mon, 16 Nov 2026 08:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794847511; bh=Ub0AUVWUvLzOwgM2l/CD4QdHvd5gHwZN7u9aO1oG8iQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J1ql3GHjjhtxyfRb+8WiCAWvWeWs4RAveW4uwYlAR46PAgIaA3jeoezXINFgLrplI
	 IPUxL3HwYap8zjWqO3OGxpAgTRXOnoJLPyDL6wVMMwpBQqQcnWev3Sg9jDYow7/+Rv
	 QChTwCUoQRTnPbecpbqg0IZctx3ripAOWoj3VXw4=
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
Subject: [PATCH v3 10/11] KVM: arm64: Dispatch stage-2 destruction by VM flavor
Date: Mon, 16 Nov 2026 16:43:56 +0000
Message-ID: <20261116164358.142785-11-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116164358.142785-1-steven.price@arm.com>
References: <20261116164358.142785-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_084512_655381_211A539D 
X-CRM114-Status: GOOD (  14.83  )
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

Select the stage-2 destruction functions through the VM's stage-2
operations. This keeps the native and pKVM paths explicit and lets a
Realm provide its own destruction callback when Realm stage-2
operations are registered.

The Realm callback will only free the root RTT pages, because RMI
teardown destroys the non-root RTTs separately.

Signed-off-by: Steven Price <steven.price@arm.com>

---
Changes since v2:
- New patch in v3; split stage-2 destruction dispatch out of the
  Realm stage-2 MMU operations patch.
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/kvm/mmu.c              | 37 ++++++++++++++++++-------------
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 2c8cd9a1dd52..52ccb8b4ccb2 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -242,6 +242,7 @@ struct kvm_vm_s2_ops {
 	int (*vm_flush_remote_tlbs)(struct kvm *kvm);
 	int (*vm_flush_remote_tlbs_range)(struct kvm *kvm, gfn_t gfn,
 					  u64 nr_pages);
+	void (*vm_stage2_destroy)(struct kvm_pgtable *pgt);
 	void (*vm_stage2_unmap_range)(struct kvm_s2_mmu *mmu,
 				      phys_addr_t start, u64 size,
 				      bool may_block,
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9b371159be92..46a83c58c12f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1026,35 +1026,39 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
  * cond_resched() periodically to prevent hogging the CPU for a long time
  * and schedule something else, if required.
  */
-static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
-				   phys_addr_t end)
+static void stage2_destroy_range(struct kvm_pgtable *pgt,
+				 void (*destroy_range)(struct kvm_pgtable *pgt,
+						       u64 addr, u64 size))
 {
+	u64 addr = 0;
+	u64 end = BIT(VTCR_EL2_IPA(pgt->mmu->vtcr));
 	u64 next;
 
 	do {
 		next = stage2_range_addr_end(addr, end);
-		KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
-							     next - addr);
+		destroy_range(pgt, addr, next - addr);
 		if (next != end)
 			cond_resched();
 	} while (addr = next, addr != end);
 }
 
+static void kvm_vm_stage2_destroy(struct kvm_pgtable *pgt)
+{
+	stage2_destroy_range(pgt, kvm_pgtable_stage2_destroy_range);
+	kvm_pgtable_stage2_destroy_pgd(pgt);
+}
+
+static void pkvm_stage2_destroy(struct kvm_pgtable *pgt)
+{
+	stage2_destroy_range(pgt, pkvm_pgtable_stage2_destroy_range);
+	pkvm_pgtable_stage2_destroy_pgd(pgt);
+}
+
 static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
-	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
-
-	/*
-	 * Realm RTTs are inaccessible to the host and may contain stale data
-	 * after the RMM has released them. The non-root RTTs are explicitly
-	 * destroyed through RMI before the RD is destroyed; only the root PGD
-	 * pages remain to be freed here.
-	 */
-	if (!kvm_vm_is_realm(kvm))
-		stage2_destroy_range(pgt, 0, BIT(ia_bits));
 
-	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
+	kvm->arch.vm_s2_ops->vm_stage2_destroy(pgt);
 }
 
 /**
@@ -3267,6 +3271,7 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 }
 
 static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
+	.vm_stage2_destroy		= pkvm_stage2_destroy,
 	.vm_flush_remote_tlbs		= pkvm_flush_remote_tlbs,
 	.vm_flush_remote_tlbs_range	= pkvm_flush_remote_tlbs_range,
 	.vm_age_gfn			= no_age_gfn,
@@ -3276,6 +3281,7 @@ static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
 };
 
 static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
+	.vm_stage2_destroy		= pkvm_stage2_destroy,
 	.vm_flush_remote_tlbs		= pkvm_flush_remote_tlbs,
 	.vm_flush_remote_tlbs_range	= pkvm_flush_remote_tlbs_range,
 	.vm_age_gfn			= pkvm_age_gfn,
@@ -3285,6 +3291,7 @@ static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
 };
 
 static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
+	.vm_stage2_destroy		= kvm_vm_stage2_destroy,
 	.vm_flush_remote_tlbs		= kvm_vm_flush_remote_tlbs,
 	.vm_flush_remote_tlbs_range	= kvm_vm_flush_remote_tlbs_range,
 	.vm_age_gfn			= kvm_vm_age_gfn,
-- 
2.43.0


