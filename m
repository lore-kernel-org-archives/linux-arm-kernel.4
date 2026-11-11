Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B361760A262B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TI0wCyyf;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QzSDcvVv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HPiljfwsTD1PrsP177vCRLVEUO4wjKT285B1PDvphvg=; b=TI0wCyyfmdZE0b
	16cLnwi8OIz762ftIfJ3z0K27Zs4LGbeN1OsJG8QHKUBVerzygeMdwURAem/Fkkeg8N/lHlvjvmA0
	OsIbaNwnkLkim2LHqt8nVXYPRqSsiEseqDeHw8LdW1vxx789WJL9wRuhNI12iIq0rtlVTWwo2POQS
	iFC8LNEWjpEQfFn5MXEpyH287E6OJz45of1tF0sFAsZB0EoMPAYMOoQa/CcvzYbDfwusXe5FFTcsV
	7/NWgquiMXiDUqzNTcpUDPz2j2mGmwT66G15M0SPBQXDkFcgdge3EYMK8kfA8Ie6YLn3qCBu5JY+f
	vItdKnZqPVAS7XdeNvRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9mk-000000071YX-0NlS;
	Wed, 11 Nov 2026 14:58:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9mg-000000071V5-1H7u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:58:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 672121576;
	Wed, 11 Nov 2026 06:58:42 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.58.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 323883F632;
	Wed, 11 Nov 2026 06:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794409125; bh=ErPi6XIo8XyKadHKd+zXDFmP2ydVWiFIfNARduMoSPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QzSDcvVvihRDSlpzxqMaBOMwi0jUqfHgHvGCnMnFvmy/XKz+JR5MkjPgjcznYbJFM
	 N58eNwsyTP7GGJpWbzfLPjkW05/+YqIoml/uW/O1+FZWdwyBBrlI5VVMvYE8CdWrVQ
	 978JJIq1oAzm82KkBUK6mesijVfKlq9TBQuP1yzY=
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
Subject: [PATCH v2 07/12] KVM: arm64: CCA: Tear down RTTs
Date: Wed, 11 Nov 2026 14:57:51 +0000
Message-ID: <20261111145758.217946-8-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111145758.217946-1-steven.price@arm.com>
References: <20261111145758.217946-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_065846_438043_73170BF8 
X-CRM114-Status: GOOD (  24.56  )
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

The RMM owns the stage 2 page tables for a realm, and KVM must request
that the RMM creates/destroys entries as necessary. The physical pages
to store the page tables are delegated to the realm as required, and can
be undelegated when no longer used.

Creating new RTTs is the easy part, tearing down is a little more
tricky. The result of realm_rtt_destroy() can be used to effectively
walk the tree and destroy the entries (undelegating pages that were
given to the realm).

Tear down a created Realm whether it is still new or has been activated.
Unmap the Realm IPA space once during stage-2 teardown. Defer
destruction of non-root RTTs until final Realm destruction, after
REALM_TERMINATE and before destroying the RD; root RTTs remain until the
RD has gone away.

Signed-off-by: Steven Price <steven.price@arm.com>

---
Changes since v1:
- Tear down created Realms in both NEW and ACTIVE states. Fix the
  RTT start level, page accounting on failed undelegation, and
  handling of RTT granules returned by RMI.
---
 arch/arm64/include/asm/kvm_rmi.h |   9 ++
 arch/arm64/kvm/mmu.c             |  18 ++-
 arch/arm64/kvm/rmi.c             | 189 +++++++++++++++++++++++++++++++
 3 files changed, 215 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index f1a1ed6b91f5..58d825e40bdf 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -57,6 +57,7 @@ enum realm_state {
  * @sro: Preallocated SRO state context for Realm MMU operations
  * @state: The lifetime state machine for the realm
  * @ia_bits: Number of valid Input Address bits in the IPA
+ * @stage2_unmapped: The Realm stage-2 mappings have been removed
  */
 struct realm {
 	void *rd;
@@ -70,6 +71,7 @@ struct realm {
 	struct rmi_sro_state *sro;
 	enum realm_state state;
 	unsigned int ia_bits;
+	bool stage2_unmapped;
 };
 
 void kvm_init_rmi(void);
@@ -77,5 +79,12 @@ u32 kvm_rmm_ipa_limit(void);
 
 int kvm_init_realm(struct kvm *kvm);
 void kvm_destroy_realm(struct kvm *kvm);
+int kvm_realm_teardown_stage2(struct kvm *kvm);
+
+static inline bool kvm_realm_is_private_address(struct realm *realm,
+						unsigned long addr)
+{
+	return !(addr & BIT(realm->ia_bits - 1));
+}
 
 #endif /* __ASM_KVM_RMI_H */
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9df3f8d5b4ef..be014f6c00e7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1145,9 +1145,25 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	return err;
 }
 
+static void kvm_realm_uninit_stage2(struct kvm_s2_mmu *mmu)
+{
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+
+	mutex_lock(&kvm->arch.config_lock);
+	if (kvm_realm_state(kvm) == REALM_STATE_NEW ||
+	    kvm_realm_state(kvm) == REALM_STATE_ACTIVE) {
+		kvm_set_realm_state(kvm, REALM_STATE_DYING);
+		WARN_ON(kvm_realm_teardown_stage2(kvm));
+	}
+	mutex_unlock(&kvm->arch.config_lock);
+}
+
 void kvm_uninit_stage2_mmu(struct kvm *kvm)
 {
-	kvm_free_stage2_pgd(&kvm->arch.mmu);
+	if (kvm_realm_is_created(kvm))
+		kvm_realm_uninit_stage2(&kvm->arch.mmu);
+	else
+		kvm_free_stage2_pgd(&kvm->arch.mmu);
 	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
 }
 
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 69c628cfb6c7..b904e6541fb0 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -11,16 +11,193 @@
 #include <asm/kvm_pgtable.h>
 #include <asm/virt.h>
 
+static inline unsigned long rmi_rtt_level_mapsize(int level)
+{
+	if (WARN_ON(level > KVM_PGTABLE_LAST_LEVEL))
+		return PAGE_SIZE;
+
+	return (1UL << ARM64_HW_PGTABLE_LEVEL_SHIFT(level));
+}
+
 u32 kvm_rmm_ipa_limit(void)
 {
 	return u64_get_bits(rmi_feat_reg(0), RMI_FEATURE_REGISTER_0_S2SZ);
 }
 
+static int get_start_level(struct realm *realm)
+{
+	return 4 - max(2, stage2_pgtable_levels(realm->ia_bits));
+}
+
+static void free_rtt(phys_addr_t phys)
+{
+	kvm_account_pgtable_pages(phys_to_virt(phys), -1);
+	if (rmi_free_delegated_page(phys))
+		kvm_account_pgtable_pages(phys_to_virt(phys), 1);
+}
+
+/*
+ * realm_rtt_destroy - Destroy an RTT at @level for @addr.
+ *
+ * Returns - Result of the RMI_RTT_DESTROY call, and:
+ * @rtt_granule:	RTT granule, if the RTT was destroyed.
+ * @next_addr:		IPA corresponding to the next possible valid entry we
+ *			can target
+ */
+static long realm_rtt_destroy(struct realm *realm, unsigned long addr,
+			      int level, phys_addr_t *rtt_granule,
+			      unsigned long *next_addr)
+{
+	unsigned long out_rtt;
+	long ret;
+
+	ret = rmi_rtt_destroy(virt_to_phys(realm->rd), addr, level,
+			      &out_rtt, next_addr);
+
+	if (ret == RMI_SUCCESS)
+		*rtt_granule = out_rtt;
+
+	return ret;
+}
+
+static int realm_tear_down_rtt_level(struct realm *realm, int level,
+				     unsigned long start, unsigned long end)
+{
+	ssize_t map_size;
+	unsigned long addr, next_addr;
+
+	if (WARN_ON(level > KVM_PGTABLE_LAST_LEVEL))
+		return -EINVAL;
+
+	map_size = rmi_rtt_level_mapsize(level - 1);
+
+	for (addr = start; addr < end; addr = next_addr) {
+		phys_addr_t rtt_granule;
+		long ret;
+		unsigned long align_addr = ALIGN(addr, map_size);
+
+		next_addr = ALIGN(addr + 1, map_size);
+
+		if (next_addr > end || align_addr != addr) {
+			/*
+			 * The target range is smaller than what this level
+			 * covers, recurse deeper.
+			 */
+			ret = realm_tear_down_rtt_level(realm,
+							level + 1,
+							addr,
+							min(next_addr, end));
+			if (ret)
+				return ret;
+			continue;
+		}
+
+		ret = realm_rtt_destroy(realm, addr, level,
+					&rtt_granule, &next_addr);
+		if (ret < 0)
+			return ret;
+
+		switch (RMI_RESULT_STATUS(ret)) {
+		case RMI_SUCCESS:
+			free_rtt(rtt_granule);
+			break;
+		case RMI_ERROR_RTT:
+			if (next_addr > addr) {
+				/* Missing RTT, skip */
+				break;
+			}
+			/*
+			 * We tear down the RTT range for the full IPA
+			 * space, after everything is unmapped. Also we
+			 * descend down only if we cannot tear down a
+			 * top level RTT. Thus RMM must be able to walk
+			 * to the requested level. e.g., a block mapping
+			 * exists at L1 or L2.
+			 */
+			if (WARN_ON(RMI_RESULT_DATA_LEVEL(ret) != level))
+				return -EBUSY;
+			if (WARN_ON(level == KVM_PGTABLE_LAST_LEVEL))
+				return -EBUSY;
+
+			/*
+			 * The table has active entries in it, recurse deeper
+			 * and tear down the RTTs.
+			 */
+			next_addr = ALIGN(addr + 1, map_size);
+			ret = realm_tear_down_rtt_level(realm,
+							level + 1,
+							addr,
+							next_addr);
+			if (ret)
+				return ret;
+			/*
+			 * Now that the child RTTs are destroyed,
+			 * retry at this level.
+			 */
+			next_addr = addr;
+			break;
+		default:
+			WARN_ON(1);
+			return -ENXIO;
+		}
+	}
+
+	return 0;
+}
+
+static int realm_tear_down_rtt_range(struct realm *realm,
+				     unsigned long start, unsigned long end)
+{
+	/*
+	 * Root level RTTs can only be destroyed after the RD is destroyed. So
+	 * tear down everything below the root level
+	 */
+	return realm_tear_down_rtt_level(realm, get_start_level(realm) + 1,
+					 start, end);
+}
+
+static int realm_destroy_rtts(struct kvm *kvm)
+{
+	struct realm *realm = &kvm->arch.realm;
+	unsigned int ia_bits = realm->ia_bits;
+
+	lockdep_assert_held(&kvm->arch.config_lock);
+
+	return realm_tear_down_rtt_range(realm, 0, (1UL << ia_bits));
+}
+
+static void realm_unmap_stage2(struct kvm *kvm)
+{
+	struct realm *realm = &kvm->arch.realm;
+
+	lockdep_assert_held(&kvm->arch.config_lock);
+
+	if (realm->stage2_unmapped)
+		return;
+
+	write_lock(&kvm->mmu_lock);
+	kvm_stage2_unmap_range(&kvm->arch.mmu, 0,
+			       BIT(realm->ia_bits - 1), true);
+	write_unlock(&kvm->mmu_lock);
+
+	realm->stage2_unmapped = true;
+}
+
+int kvm_realm_teardown_stage2(struct kvm *kvm)
+{
+	lockdep_assert_held(&kvm->arch.config_lock);
+
+	realm_unmap_stage2(kvm);
+	return 0;
+}
+
 void kvm_destroy_realm(struct kvm *kvm)
 {
 	struct realm *realm = &kvm->arch.realm;
 	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
 
+	guard(mutex)(&kvm->arch.config_lock);
+
 	if (!kvm_realm_is_created(kvm)) {
 		kfree(realm->sro);
 		realm->sro = NULL;
@@ -29,12 +206,24 @@ void kvm_destroy_realm(struct kvm *kvm)
 
 	kvm_set_realm_state(kvm, REALM_STATE_DYING);
 
+	/*
+	 * REALM_DESTROY requires the realm to be non-live: all RECs must have
+	 * been destroyed and the root RTTs must be empty. Unmap the IPA space
+	 * and destroy any non-root RTTs before tearing down the RD. The root
+	 * RTT pages are still owned by the RMM at this point, so keep the KVM
+	 * pgtable alive until after REALM_DESTROY and undelegation.
+	 */
+	realm_unmap_stage2(kvm);
+
 	if (realm->rd) {
 		phys_addr_t rd_phys = virt_to_phys(realm->rd);
 
 		if (WARN_ON(rmi_realm_terminate(rd_phys, realm->sro)))
 			return;
 
+		if (WARN_ON(realm_destroy_rtts(kvm)))
+			return;
+
 		if (WARN_ON(rmi_realm_destroy(rd_phys, realm->sro)))
 			return;
 		rmi_free_delegated_page(rd_phys);
-- 
2.43.0


