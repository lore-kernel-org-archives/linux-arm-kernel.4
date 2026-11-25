Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0667606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WJXIFtbd;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GB68hZxD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mzsSnVFmueVAmxucWap/1diLt/xkb4/Iudj0Azmpcto=; b=WJXIFtbde2nwPg
	1LwtW2/qbReyJE/fb/PbDabr/wBOiac4HmJ8K2N8CFBxZ2k/MqwNvnxDV71mMeWJCXlwHvdmLCt3o
	iSJF8MKPRB2LbBNvxI4MgTHsNXzvvWIaGw0ajKbVPz6MdZlFQhMKaaWkjCbPkMlsl1y0Hub7K6G7Y
	0SW03/ixS5gI6qqgxOGDGM4wQy5dy0349ZywWU9VuNeFaISK1jQCU4xjvFdm0EOsYp8b+wn6yXjbJ
	zam6wrwxNJw59RcUR2Iq4zUmS02MCzQMWValrINejqrmgiaQh26Is7qgw+8lIVA28jUgDSc36Lo4v
	cze3UpnlSnHb4ihBjvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF8H-0000000APrP-05Kf;
	Wed, 25 Nov 2026 15:42:05 +0000
Received: from out-226.mta1.migadu.com ([95.215.58.226] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF7E-0000000AOsz-2Eng
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:41:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=nUFxnpIOM1wpWH0/JGGRjQFQhyZ2Sfp/JeawXNUQhRc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621258; v=1; x=1796226058;
 b=GB68hZxDejEmlmEobgOXOcO/OanROYasrc6Y/sN82THyrmf2idGu3vxks4iI26bqOZ4msDFU
 ZQw4McuPQsHP/Kpo4VWHSeGT/d4D83f6umf90qnZONpgYzu0RLjIrHtSp0/zve5JPyqNCJdpgcz
 TM/Zra/HPk8TzpHHSYALCTTw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id aa3c62e7ebe12e60;
	Wed, 25 Nov 2026 15:40:58 +0000
X-Mizu-Trace-ID: aa3c62e7ebe12e60
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
Subject: [PATCH v2 19/20] KVM: arm64: Advertise FP8 and F16MM to protected VMs
Date: Wed, 25 Nov 2026 15:39:10 +0000
Message-ID: <20261125153911.106793-20-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_074103_511650_BE98B52F 
X-CRM114-Status: GOOD (  11.36  )
X-Spam-Score: -2.8 (--)
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
index e363e8b5958fb..5dbe66de4f05e 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2834,6 +2834,7 @@ static void kvm_hyp_init_symbols(void)
 	kvm_nvhe_sym(id_aa64pfr1_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1);
 	kvm_nvhe_sym(id_aa64pfr2_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64PFR2_EL1);
 	kvm_nvhe_sym(id_aa64zfr0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64ZFR0_EL1);
+	kvm_nvhe_sym(id_aa64fpfr0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64FPFR0_EL1);
 	kvm_nvhe_sym(id_aa64isar0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64ISAR0_EL1);
 	kvm_nvhe_sym(id_aa64isar1_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64ISAR1_EL1);
 	kvm_nvhe_sym(id_aa64isar2_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64ISAR2_EL1);
diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index dc7c70ac46f2a..4b95128663aa8 100644
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
@@ -148,6 +149,19 @@ static const struct pvm_ftr_bits pvmid_aa64zfr0[] = {
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
@@ -297,6 +311,8 @@ static u64 pvm_calc_id_reg(const struct kvm_vcpu *vcpu, u32 id)
 		return get_restricted_features(vcpu, id_aa64pfr2_el1_sys_val, pvmid_aa64pfr2);
 	case SYS_ID_AA64ZFR0_EL1:
 		return get_restricted_features(vcpu, id_aa64zfr0_el1_sys_val, pvmid_aa64zfr0);
+	case SYS_ID_AA64FPFR0_EL1:
+		return get_restricted_features(vcpu, id_aa64fpfr0_el1_sys_val, pvmid_aa64fpfr0);
 	case SYS_ID_AA64ISAR0_EL1:
 		return id_aa64isar0_el1_sys_val;
 	case SYS_ID_AA64ISAR1_EL1:
@@ -726,7 +742,7 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
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


