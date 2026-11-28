Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933CD606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 01:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pxyj10lC;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=k2M4PesN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QpckFqMkRFSZ4FA0EQPPlblmNixRZLOna6QhU0iEGtw=; b=Pxyj10lCUZpMBS
	fp8ORpawOW0klMFRT1HLX/2cIcsPkLla7VXGCsY8T3IkZTfgGNrouxDiKs2+qsxp0sHEVYp1sDKRQ
	QhUAMFby2tIeP2nU6YJjnPiBXjNdTLPRfYbC6zN0gOhSpFDoV78NMG2Lafk1cgZErJEyhVWcSnoRd
	j6heAOSjbKpN3uHuaQKJE7ukKuzBKMppIxjSWJJe5lC0tkNLdCPcozf3u3VTtOcF7AH/reUmr+Ays
	C31EiarHu4IjC2FHVZycHNnsywH9ASw7CIYD2cy+67/h6iG/vpBGuPCHfZ8plfBlAPx5pRksRflS9
	X1n+FZz7xSsaqPgY5lvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX72S-00000000Fx7-2fZP;
	Sat, 28 Nov 2026 01:15:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX72G-00000000Fv2-2W2x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 01:15:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E90CE169E;
	Fri, 27 Nov 2026 17:15:24 -0800 (PST)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 301DA3F632;
	Fri, 27 Nov 2026 17:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795828527; bh=G9WkR2YnyZNppiCZFAcWm+Tv7qha2bxaFXORsoSTkkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k2M4PesNhhu8SO9eD/UsWjDUhFC6w8zJn2wCWZYHLuMh7iABb/2BBThhMZ7IltyJ8
	 Pe33j1yngon+7hHiHCHN5UY05Q4HYUgIZ3ZozJmTb2YODJB97HNuiC6cDqYe7qQHoh
	 boF/QRsBo5C+gPI3WjTz63DVrNMVy2pEsxKCckys=
From: Jia He <justin.he@arm.com>
To: maz@kernel.org,
	oupton@kernel.org
Cc: fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia He <justin.he@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 1/4] KVM: arm64: nv: Locate the VNCR page in the host page from its PA
Date: Sat, 28 Nov 2026 01:14:44 +0000
Message-Id: <20261128011447.3588988-2-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261128011447.3588988-1-justin.he@arm.com>
References: <20261128011447.3588988-1-justin.he@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_171529_230954_725BBC62 
X-CRM114-Status: GOOD (  17.51  )
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

VNCR_EL2 only needs to be 4K aligned. On a host with 16K or 64K pages,
kvm_translate_vncr() records the host page that contains the guest
hypervisor's VNCR page, and that host page is mapped at the VNCR fixmap.
__compute_hcr() then takes the offset of the VNCR page in the host page
from bits [PAGE_SHIFT-1:12] of the guest's VNCR_EL2, which is a VA.

If the guest hypervisor uses a stage-1 granule smaller than the host
page, these bits of the VA and of the PA can differ. The nested context
then accesses another 4K page of the guest instead of the VNCR page.

Take the offset from the PA that the walk returns, and keep it in
vt->hpa. Use it only while the VNCR page is mapped. Otherwise the
fixmap is clear, the access faults and KVM translates VNCR_EL2 again,
so the offset does not matter.

Tested on a Neoverse-N2 host running 16K and 64K page kernels, with the
selftest added later in this series. The test maps the VNCR page at a VA
whose bits [15:12] differ from those of its PA. With the offset taken
from the VA, the nested context reads 0 instead of the value in the VNCR
page. With this patch, it reads the expected value.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-232440@kernel.org/
Fixes: 73e1b621b25d ("KVM: arm64: nv: Program host's VNCR_EL2 to the fixmap address")
Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/include/asm/kvm_nested.h | 1 +
 arch/arm64/kvm/hyp/vhe/switch.c     | 9 +++++++--
 arch/arm64/kvm/nested.c             | 8 +++++++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 0f899addafa8..bc54a4b2e863 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -432,6 +432,7 @@ int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa,
 /* VNCR management */
 int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu);
 int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu);
+unsigned long kvm_vncr_page_offset(struct kvm_vcpu *vcpu);
 void kvm_handle_s1e2_tlbi(struct kvm_vcpu *vcpu, u32 inst, u64 val);
 
 u16 get_asid_by_regime(struct kvm_vcpu *vcpu, enum trans_regime regime);
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 3f2390a13173..0d15beea418c 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -94,8 +94,13 @@ static u64 __compute_hcr(struct kvm_vcpu *vcpu)
 		if (guest_hcr & HCR_EL2_NV) {
 			u64 va = __fix_to_virt(vncr_fixmap(smp_processor_id()));
 
-			/* Inherit the low bits from the actual register */
-			va |= __vcpu_sys_reg(vcpu, VNCR_EL2) & GENMASK(PAGE_SHIFT - 1, 0);
+			/*
+			 * The fixmap maps the host page that contains the VNCR
+			 * page. Locate the VNCR page in it from its PA: with a
+			 * smaller guest granule, the VA may have another offset.
+			 */
+			if (host_data_test_flag(L1_VNCR_MAPPED))
+				va |= kvm_vncr_page_offset(vcpu);
 			write_sysreg_s(va, SYS_VNCR_EL2);
 
 			/* Force NV2 in case the guest is forgetful... */
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28..08582fbc09d5 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1643,7 +1643,7 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 		}
 
 		vt->gva = va;
-		vt->hpa = pfn << PAGE_SHIFT;
+		vt->hpa = (pfn << PAGE_SHIFT) | offset_in_page(vt->wr.pa);
 		vt->hpa_writable = writable;
 		vt->valid = true;
 		atomic_set(&vt->cpu, -1);
@@ -1683,6 +1683,12 @@ static void handle_vncr_perm(struct kvm_vcpu *vcpu)
 	kvm_inject_nested_sync(vcpu, esr);
 }
 
+/* Offset of the VNCR page in the host page mapped at the VNCR fixmap */
+unsigned long kvm_vncr_page_offset(struct kvm_vcpu *vcpu)
+{
+	return offset_in_page(vcpu->arch.vncr_tlb->hpa);
+}
+
 int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
 {
 	struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
-- 
2.34.1


