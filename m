Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EB8606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pBRNvX9T;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WtMPcweJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F8qHgosTivfubEojhD9h/g4AbrUIaCm94vrYMofZ18Q=; b=pBRNvX9TqvCOan
	H5FxWF7nOouTHfmBwPTmXvyt8u7dSfdRtW5e4P2NkR1oqCXYBe0lKqg9lQiEIAHAZuVbQBx9PY2A+
	Qwvw8MniQX1BwA71KqpkMstWLiG06u7PsqMZ4UYo7Xh7iNnLQn2VdltnBE1jq6Z3vKupmKskNVMBU
	clib2q3UQ0SV516w+LqtlHYenWdrb0XP+0mGBaMJgd1pCSrvg8SvN40sMdWlI5kf/DHialDejP5An
	iQ7An/Go9tz7YNEvx8yDB8LCeZPqkKUpOhMfwonRe0PD3FN7+Rghd5qjHG6mJTrhd0my9E71OQrhT
	wMScSrO0WuV/pOdiMvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRWP-000000030nL-0BeU;
	Mon, 23 Nov 2026 10:43:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRWE-000000030h9-199D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:43:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D44D719F6;
	Mon, 23 Nov 2026 02:43:26 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.63.212])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE50C3F9AB;
	Mon, 23 Nov 2026 02:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795430609; bh=GpnTkMmsNJrsBbQSV3YzUlyu+crXLKIz/ySS7mBnD+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WtMPcweJKiumfvm11ci2Pif5apy4/M+un7rFjM4tdSighLl1mM+siXPnz+UpNSH0j
	 7cUmfuBWsTjpfoILV2zA8uz2BI9fGqIjBO2of0XKlEkeP3b92Mj4Phspor14tDYg8p
	 0w+JRxyVK4FvYxXps+WJPHlENuraEqCYtoGFK6dU=
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
Subject: [PATCH v4 09/11] KVM: arm64: CCA: Prevent memslot modifications after Realm creation
Date: Mon, 23 Nov 2026 10:42:29 +0000
Message-ID: <20261123104233.95710-10-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123104233.95710-1-steven.price@arm.com>
References: <20261123104233.95710-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_024330_514825_5A16BA7F 
X-CRM114-Status: GOOD (  17.41  )
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

Once the Realm is created, prevent changes to guest_memfd backed
memslots, which can provide private memory. Validate these changes
before KVM invalidates the old memslot, so a rejected deletion leaves
its stage-2 mappings intact. Realm stage-2 faults will also validate
the private memory backing in a later commit.

Require Realm memslots to lie in the lower half of the IPA space, as the
upper, shared half aliases the lower, protected half.

Define kvm_arch_has_private_mem() so generic KVM recognizes Realm VMs
as supporting private memory. Defining the macro also makes
gmem_in_place_conversion true for every arm64 VM, so guest_memfd
memslots are marked gmem-only even for non-Realm VMs. A well-formed
KVM_SET_MEMORY_ATTRIBUTES2 request on a non-Realm guest_memfd now
reaches the VM check and returns -EINVAL instead of -ENOTTY.

Additionally, similar to pKVM, do not support dirty logging or
read-only memslots.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>

---
Changes since v3:
- Explain the arm64-wide in-place conversion effect and keep the
  general IPA limit comment.

Changes since v1:
- Preserve private mappings if KVM invalidates a Realm guest_memfd
  slot before the prepare hook rejects its deletion.
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/mmu.c              | 37 ++++++++++++++++++++++++-------
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3ddeddfacd06..55673d08e3eb 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1607,6 +1607,8 @@ struct kvm *kvm_arch_alloc_vm(void);
 
 #define kvm_vm_is_realm(kvm)		((kvm)->arch.vm_flavor == VM_REALM)
 
+#define kvm_arch_has_private_mem(kvm) kvm_vm_is_realm(kvm)
+
 #define kvm_has_mte(kvm)					\
 	(system_supports_mte() &&				\
 	 test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &(kvm)->arch.flags))
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 800333a345cd..9af5fe6d87f0 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2861,17 +2861,32 @@ int kvm_arch_validate_memory_region(struct kvm *kvm,
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
@@ -2883,6 +2898,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				   enum kvm_mr_change change)
 {
 	hva_t hva, reg_end;
+	gfn_t ipa_limit;
 	int ret = 0;
 
 	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
@@ -2891,9 +2907,14 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 
 	/*
 	 * Prevent userspace from creating a memory region outside of the IPA
-	 * space addressable by the KVM guest IPA space.
+	 * space addressable by the KVM guest IPA space. Realm shared IPAs alias
+	 * the corresponding private IPAs, so Realm memslots must reside entirely
+	 * in the lower half of that space.
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


