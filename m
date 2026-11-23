Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6224606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Aw5rTCG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gbPAFq96
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/ragaaKMlKwCffeuTGxlwHK3dNh4IOsJmPtxIjEmZmU=; b=3Aw5rTCGXEebt/
	2ge9WsYMFLrdsC7eeffxDKPvbtXOueaz2PVH33G5ZVX93xaPS+c3trSnSRKSUDeD9j1LvScyzxH6U
	hvGFmxk+e7COJFSCCJIkiDG/syiVeFAVzKxZov5LPH7kEiPxjb52TwxJkmFDqDAngUvJknvasnb8b
	HTOhHnM3I1pJ70aBCnpaZ/YdllRsn1hwEpfS5W0MiMsMFSiReshj73veAVebZguFKI5RDJyw7NU1z
	NR77vecgeUQsGCL5NOTnV0LwMFTreKtHkZ3MM1vTS5a8wGNtZAx32cckvP5mjDaLQGOWPe1jxRHLA
	bxKnKv68tkZWmbI/RUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZfY-00000004elY-3UGh;
	Mon, 23 Nov 2026 19:25:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZfI-00000004eg7-081w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:25:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3F1C40AAF;
	Mon, 23 Nov 2026 19:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBE11F000D8;
	Mon, 23 Nov 2026 19:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461923;
	bh=/ragaaKMlKwCffeuTGxlwHK3dNh4IOsJmPtxIjEmZmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gbPAFq96JH/QABr9L2sR0xpZiGIBgNZ9ZADAXjeCqF1ez34ShfAk7OQVMReca8fEY
	 iKLN43gjlMrcSEyQDxAerUNQp223TTqJ8B0D73whWivvGOqAATRKp4QVHahVflBvoY
	 VQvGXn9zurparhsG3scX4T0nt/9LPdplBZfIELwPrlAdOyh88v6PLCmnjByFH/e6Tu
	 dsteF8/+rkHBWca6ueSvJ2t2hAU2poKe3g8QA3K13fRQ3Sf/LbTYvytvT1D6jytyhQ
	 bq9ZVxT893y+5CuRZoXCN+npgrnIAUK3cNO+yXXL41CLBupv0yd7AGcNrfKCyTXnYS
	 LJGFTc2fuHebw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=localhost.localdomain)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xVZfF-00000002A6V-23e4;
	Mon, 23 Nov 2026 19:25:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH 2/3] KVM: arm64: Add GIC idregs sanitisation to common framework
Date: Mon, 23 Nov 2026 19:24:56 +0000
Message-ID: <20261123192457.8700-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123192457.8700-1-maz@kernel.org>
References: <20261123192457.8700-1-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

It takes no least than 3 ID registers to describe whether a GICv3 or
GICv5 is supported. Define the sanitisation tables for the relevant
fields and the set of relevant callbacks.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 56 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 40965513ebacf..7e702ce587a48 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -436,6 +436,23 @@ static bool feat_vmid16(struct kvm *kvm)
 	return kvm_has_feat_enum(kvm, ID_AA64MMFR1_EL1, VMIDBits, 16);
 }
 
+static bool feat_gicv3(struct kvm *kvm)
+{
+	return (irqchip_in_kernel(kvm) &&
+		kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3);
+}
+
+static bool feat_gicv3_aarch32(struct kvm *kvm)
+{
+	return (kvm_supports_32bit_el0() && feat_gicv3(kvm));
+}
+
+static bool feat_gcie(struct kvm *kvm)
+{
+	return (irqchip_in_kernel(kvm) &&
+		kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V5);
+}
+
 static const struct reg_bits_to_feat_map hfgrtr_feat_map[] = {
 	NEEDS_FEAT(HFGRTR_EL2_nAMAIR2_EL1	|
 		   HFGRTR_EL2_nMAIR2_EL1,
@@ -1357,6 +1374,42 @@ static const struct reg_bits_to_feat_map id_aa64mmfr3_el1_feat_map[] = {
 static const DECLARE_IDREG_FEAT_MAP(id_aa64mmfr3_el1_desc, ID_AA64MMFR3_EL1,
 				    id_aa64mmfr3_el1_feat_map, FEAT_AA64EL1);
 
+static const struct reg_bits_to_feat_map aa64pfr0_gicv3[] = {
+	ENUM_FEAT(ID_AA64PFR0_EL1_GIC_IMP, feat_gicv3 ),
+	ENUM_FEAT(ID_AA64PFR0_EL1_GIC_NI, NULL ),
+};
+
+static const struct reg_bits_to_feat_map id_aa64pfr0_el1_feat_map[] = {
+	NEEDS_FEAT_FIELD(ID_AA64PFR0_EL1_GIC, aa64pfr0_gicv3),
+};
+
+static const DECLARE_IDREG_FEAT_MAP(id_aa64pfr0_el1_desc, ID_AA64PFR0_EL1,
+				    id_aa64pfr0_el1_feat_map, FEAT_AA64EL1);
+
+static const struct reg_bits_to_feat_map pfr1_gicv3[] = {
+	ENUM_FEAT(ID_PFR1_EL1_GIC_GICv3, feat_gicv3_aarch32),
+	ENUM_FEAT(ID_PFR1_EL1_GIC_NI, NULL),
+};
+
+static const struct reg_bits_to_feat_map id_pfr1_el1_feat_map[] = {
+	NEEDS_FEAT_FIELD(ID_PFR1_EL1_GIC, pfr1_gicv3),
+};
+
+static const DECLARE_IDREG_FEAT_MAP(id_pfr1_el1_desc, ID_PFR1_EL1,
+				    id_pfr1_el1_feat_map, FEAT_AA64EL1);
+
+static const struct reg_bits_to_feat_map aa64pfr2_gcie[] = {
+	ENUM_FEAT(ID_AA64PFR2_EL1_GCIE_IMP, feat_gcie),
+	ENUM_FEAT(ID_AA64PFR2_EL1_GCIE_NI, NULL),
+};
+
+static const struct reg_bits_to_feat_map id_aa64pfr2_el1_feat_map[] = {
+	NEEDS_FEAT_FIELD(ID_AA64PFR2_EL1_GCIE, aa64pfr2_gcie),
+};
+
+static const DECLARE_IDREG_FEAT_MAP(id_aa64pfr2_el1_desc, ID_AA64PFR2_EL1,
+				    id_aa64pfr2_el1_feat_map, FEAT_AA64EL1);
+
 static const struct reg_bits_to_feat_map ich_hfgrtr_feat_map[] = {
 	NEEDS_FEAT(ICH_HFGRTR_EL2_ICC_APR_EL1 |
 		   ICH_HFGRTR_EL2_ICC_IDRn_EL1 |
@@ -1468,6 +1521,9 @@ void __init check_feature_map(void)
 
 static const struct reg_feat_map_desc *idreg_feat_maps[] = {
 	&id_aa64mmfr3_el1_desc,
+	&id_aa64pfr0_el1_desc,
+	&id_aa64pfr2_el1_desc,
+	&id_pfr1_el1_desc,
 };
 
 static struct resx compute_idreg_field_deps(struct kvm *kvm,
-- 
2.47.3


