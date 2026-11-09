Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94206082BC7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=osWIBfeB;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lU8HrHlO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dUshNCC1JpzRp/bHnMx4//j1DzIGCNgstnma7Jcay74=; b=osWIBfeBDmyyKS
	CLhfiKJwHuqdAUsr1cGqGr7RS/rovu8t9etFmhTpIM5w/PD84r+dhGupp/rsEri8LIoSxgE/zU7Fc
	ErRBQw9GaWKlKjUg7WipcPHdcyX3ksZIGFOaRP0sZOs9V8mYYs4S1CJtZ0s/kk6+pSNXxeZhE+KLj
	aUgKecsNLMLDGkuiKoAC2SeE8SuMe8hxPvrH0livuHtIRZwFegwXLFB2qzem3tpnbVLm1iqB81gvH
	UlF2BBMLRSe6gmD1WfagD9S8q/94qU5HGTfNWYnt4mnlwi2VpvnktMsd6FQAHCNoR61IJOPl+wdOJ
	QYnRi4KOuSjx+WgshIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKoU-000000004va-0tYg;
	Mon, 09 Nov 2026 08:33:14 +0000
Received: from out-19.mta1.migadu.com ([95.215.58.19] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKoL-000000004hp-0ubq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:33:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VfxGGfCvnSJWTEWHhVoSP0xCUW7jRYSfiBO+2ILhPRs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213183; v=1; x=1794817983;
 b=lU8HrHlOVzEs/aT3L0NjhZPC43vy51Peza1nXg3QeovsDXrYjYI55fztyfrgDlP18ukW7tno
 zCEbJrUD7DUq55RglriO7HrV6YehNxAkLtlpjz7p5let4yXcezXkodbQKreqrkuZUnNfOoaBd1x
 ZQyAas5f7NdUTExsG8RmAAX8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 27c8a42749aada3d;
	Mon, 09 Nov 2026 08:33:03 +0000
X-Mizu-Trace-ID: 27c8a42749aada3d
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
Subject: [PATCH 15/16] KVM: arm64: Advertise FP8 and F16MM to protected VMs
Date: Mon,  9 Nov 2026 08:32:04 +0000
Message-ID: <20261109083205.806619-16-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109083205.806619-1-fuad.tabba@linux.dev>
References: <20261109083205.806619-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_003305_430806_BB16D8B1 
X-CRM114-Status: GOOD (  11.23  )
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

Advertise the FP8 features and FEAT_F16MM to protected VMs, the
ID_AA64FPFR0_EL1 fields a non-protected VM sees. Their instructions
only use the SIMD&FP registers and FPMR, which EL2 already switches.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_hyp.h   |  1 +
 arch/arm64/kvm/arm.c               |  1 +
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 18 +++++++++++++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index fa9a99cae32a7..09b19f2c3c090 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -145,6 +145,7 @@ extern u64 kvm_nvhe_sym(id_aa64pfr0_el1_sys_val);
 extern u64 kvm_nvhe_sym(id_aa64pfr1_el1_sys_val);
 extern u64 kvm_nvhe_sym(id_aa64pfr2_el1_sys_val);
 extern u64 kvm_nvhe_sym(id_aa64zfr0_el1_sys_val);
+extern u64 kvm_nvhe_sym(id_aa64fpfr0_el1_sys_val);
 extern u64 kvm_nvhe_sym(id_aa64isar0_el1_sys_val);
 extern u64 kvm_nvhe_sym(id_aa64isar1_el1_sys_val);
 extern u64 kvm_nvhe_sym(id_aa64isar2_el1_sys_val);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 1981646df42ce..6cc65ee4c6f2a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2828,6 +2828,7 @@ static void kvm_hyp_init_symbols(void)
 	kvm_nvhe_sym(id_aa64pfr1_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
 	kvm_nvhe_sym(id_aa64pfr2_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64PFR2_EL1);
 	kvm_nvhe_sym(id_aa64zfr0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64ZFR0_EL1);
+	kvm_nvhe_sym(id_aa64fpfr0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64FPFR0_EL1);
 	kvm_nvhe_sym(id_aa64isar0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64ISAR0_EL1);
 	kvm_nvhe_sym(id_aa64isar1_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64ISAR1_EL1);
 	kvm_nvhe_sym(id_aa64isar2_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64ISAR2_EL1);
diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 8e9283dae3484..a0f6737ff8f16 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -24,6 +24,7 @@ u64 id_aa64pfr0_el1_sys_val;
 u64 id_aa64pfr1_el1_sys_val;
 u64 id_aa64pfr2_el1_sys_val;
 u64 id_aa64zfr0_el1_sys_val;
+u64 id_aa64fpfr0_el1_sys_val;
 u64 id_aa64isar0_el1_sys_val;
 u64 id_aa64isar1_el1_sys_val;
 u64 id_aa64isar2_el1_sys_val;
@@ -149,6 +150,19 @@ static const struct pvm_ftr_bits pvmid_aa64zfr0[] = {
 	FEAT_END
 };
 
+static const struct pvm_ftr_bits pvmid_aa64fpfr0[] = {
+	MAX_FEAT(ID_AA64FPFR0_EL1, F8E5M2, IMP),
+	MAX_FEAT(ID_AA64FPFR0_EL1, F8E4M3, IMP),
+	MAX_FEAT(ID_AA64FPFR0_EL1, F16MM2, IMP),
+	MAX_FEAT(ID_AA64FPFR0_EL1, F8MM4, IMP),
+	MAX_FEAT(ID_AA64FPFR0_EL1, F8MM8, IMP),
+	MAX_FEAT(ID_AA64FPFR0_EL1, F8DP2, IMP),
+	MAX_FEAT(ID_AA64FPFR0_EL1, F8DP4, IMP),
+	MAX_FEAT(ID_AA64FPFR0_EL1, F8FMA, IMP),
+	MAX_FEAT(ID_AA64FPFR0_EL1, F8CVT, IMP),
+	FEAT_END
+};
+
 static const struct pvm_ftr_bits pvmid_aa64mmfr0[] = {
 	MAX_FEAT_ENUM(ID_AA64MMFR0_EL1, PARANGE, 40),
 	MAX_FEAT_ENUM(ID_AA64MMFR0_EL1, ASIDBITS, 16),
@@ -298,6 +312,8 @@ static u64 pvm_calc_id_reg(const struct kvm_vcpu *vcpu, u32 id)
 		return get_restricted_features(vcpu, id_aa64pfr2_el1_sys_val, pvmid_aa64pfr2);
 	case SYS_ID_AA64ZFR0_EL1:
 		return get_restricted_features(vcpu, id_aa64zfr0_el1_sys_val, pvmid_aa64zfr0);
+	case SYS_ID_AA64FPFR0_EL1:
+		return get_restricted_features(vcpu, id_aa64fpfr0_el1_sys_val, pvmid_aa64fpfr0);
 	case SYS_ID_AA64ISAR0_EL1:
 		return id_aa64isar0_el1_sys_val;
 	case SYS_ID_AA64ISAR1_EL1:
@@ -727,7 +743,7 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	AARCH64(SYS_ID_AA64ZFR0_EL1),
 	ID_UNALLOCATED(4,5),
 	ID_UNALLOCATED(4,6),
-	ID_UNALLOCATED(4,7),
+	AARCH64(SYS_ID_AA64FPFR0_EL1),
 	AARCH64(SYS_ID_AA64DFR0_EL1),
 	AARCH64(SYS_ID_AA64DFR1_EL1),
 	ID_UNALLOCATED(5,2),
-- 
2.47.3


