Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556EC606EEB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T6/+5YTD;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u/Fw5LRw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KXB74kWypKloRCmPJ/b9p8r0COb/RsH73q72omYlB+k=; b=T6/+5YTDtCCnZ8
	MKvtC5PLfmOPMrpPLjZNmw/pFZu+aJzw6UxtlaPzNZYsvdbGVNqmywoSNR4PAtoAdyNZ/nAsloDMB
	aBf7VX+0zKORJLxhmwcTN/vFjhsYrR5+1kL5PeGH0sos7rhJoNO/T9p1kGSLQ0O04iTRfdKkJC0B0
	pZhFWJ/75Cwg94WCKZzu4z5rlzUAwOT73Gs0r2kwo9xPiJzKSZn7+Dw7RBFoMaOe6cfkzkyABrsOA
	icBHkMwoCjZCwZoS4T+pcu6mvbm1L4RT4Ktdm/7j6FTzfYRPJIMCOWCM2cgA36T0UxnTlDt+o4ToB
	HcpyTC1xTRviDH4R5fyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKnn-000000004AR-0Vcx;
	Mon, 09 Nov 2026 08:32:31 +0000
Received: from out-14.mta0.migadu.com ([2001:41d0:1004:224b::e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKnk-0000000046V-2Edq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:32:29 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=S+ysH1BuivVAwHxEv/xXCvirxD/LdCy9y543PHafoYk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213146; v=1; x=1794817946;
 b=u/Fw5LRwcgD34YO7ZcAg1rHO7sakGirZL2RNGi3oP7cO3Rp3EDK+Yp4SjTKm7G7W82Rh/L0W
 4gD/KlW/uvKRoEQyKdGZS4uxK+gdrB49Wvn31+4dyOn4/vQRjdB4N2Z+foGyxlND0pubD8G0rbK
 etM6ADRJ5T09y/4DsHwEFDXM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4d70107428964b21;
	Mon, 09 Nov 2026 08:32:26 +0000
X-Mizu-Trace-ID: 4d70107428964b21
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/16] KVM: arm64: Move the VM's FGU initialisation into config.c
Date: Mon,  9 Nov 2026 08:31:55 +0000
Message-ID: <20261109083205.806619-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109083205.806619-1-fuad.tabba@linux.dev>
References: <20261109083205.806619-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_003228_713658_DAE08521 
X-CRM114-Status: GOOD (  11.24  )
X-Spam-Score: -2.1 (--)
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

The first time one of a VM's vCPUs runs, kvm_calculate_traps() computes
the VM's fine-grained UNDEF masks from its ID registers, one
compute_fgu() call per FGT group, and sets KVM_ARCH_FLAG_FGU_INITIALIZED
so that it computes them once. The next patch computes the same masks
for protected VMs at EL2.

Move the calls and the flag into kvm_init_fgu() in config.c, so that a
group added later is computed at EL2 too. compute_fgu() then has no
caller outside config.c, so make it static.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h |  2 +-
 arch/arm64/kvm/config.c           | 20 +++++++++++++++++++-
 arch/arm64/kvm/sys_regs.c         | 17 +----------------
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb1300..82ba4bb9573f1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1748,7 +1748,7 @@ static inline bool kvm_arch_has_irq_bypass(void)
 }
 
 void kvm_idregs_enforce_dependencies(struct kvm *kvm);
-void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt);
+void kvm_init_fgu(struct kvm *kvm);
 struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg);
 void check_feature_map(void);
 void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index adaf26ab93b85..c65cf1dd27330 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1586,7 +1586,7 @@ static u64 compute_fgu_bits(struct kvm *kvm, const struct reg_feat_map_desc *r)
 	return resx.res0 | resx.res1;
 }
 
-void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
+static void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
 {
 	u64 val = 0;
 
@@ -1630,6 +1630,24 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
 	kvm->arch.fgu[fgt] = val;
 }
 
+void kvm_init_fgu(struct kvm *kvm)
+{
+	if (test_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags))
+		return;
+
+	compute_fgu(kvm, HFGRTR_GROUP);
+	compute_fgu(kvm, HFGITR_GROUP);
+	compute_fgu(kvm, HDFGRTR_GROUP);
+	compute_fgu(kvm, HAFGRTR_GROUP);
+	compute_fgu(kvm, HFGRTR2_GROUP);
+	compute_fgu(kvm, HFGITR2_GROUP);
+	compute_fgu(kvm, HDFGRTR2_GROUP);
+	compute_fgu(kvm, ICH_HFGRTR_GROUP);
+	compute_fgu(kvm, ICH_HFGITR_GROUP);
+
+	set_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags);
+}
+
 struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
 {
 	struct resx resx;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 850eba167aad6..bcec0a7d2b2f5 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5841,22 +5841,7 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 	vcpu_set_hcr(vcpu);
 	vcpu_set_ich_hcr(vcpu);
 	vcpu_set_hcrx(vcpu);
-
-	if (test_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags))
-		goto out;
-
-	compute_fgu(kvm, HFGRTR_GROUP);
-	compute_fgu(kvm, HFGITR_GROUP);
-	compute_fgu(kvm, HDFGRTR_GROUP);
-	compute_fgu(kvm, HAFGRTR_GROUP);
-	compute_fgu(kvm, HFGRTR2_GROUP);
-	compute_fgu(kvm, HFGITR2_GROUP);
-	compute_fgu(kvm, HDFGRTR2_GROUP);
-	compute_fgu(kvm, ICH_HFGRTR_GROUP);
-	compute_fgu(kvm, ICH_HFGITR_GROUP);
-
-	set_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags);
-out:
+	kvm_init_fgu(kvm);
 	mutex_unlock(&kvm->arch.config_lock);
 }
 
-- 
2.47.3


