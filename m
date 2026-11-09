Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D198606EEBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=miMBN6On;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HD1555m1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k8Xd/+fGnS2qXx5edt8NtESRbuDHSi6WwC92d90oCr8=; b=miMBN6OnWWUCWv
	ZJYBhVOSphuidDbc6LUJ3B/IjICdXH1A1w8JUfP13h3K7Tk0bsxEBGHJRZ8A5id79fqmTHzHeC7L7
	csTeaIBeuFDpsljmISoMT6jaKSaDyjR0hySzEJcoPHJvuPycNfJXJGJ1WsSFAe8GkCffI6zS0/a92
	2c9nW7IsywmqcAlkeLQH/jxC06TYqPeTwwovKx0dXSGaeMZzSVBJ8GEl57Oaw0KPZQmKrR6rzosH3
	NeTyncEMVMQGcJ03i3JOKjrgfYtBK67YP1Ow86TFWhLeGrdHVazc8E6L8+6IO/YiF5iCT7gyo/xVA
	+T+ntqGrNrNhsou7FcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKnv-000000004Hp-1jq1;
	Mon, 09 Nov 2026 08:32:39 +0000
Received: from out-26.mta0.migadu.com ([2001:41d0:1004:224b::1a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKnl-0000000047J-3dRs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:32:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=M0DDDg353f4NM3Zyj4GK6LS1/VFcjYOv36EOnoDnTww=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213147; v=1; x=1794817947;
 b=HD1555m1zc10kTvWfGj0UgiKmz/6/o/n6GON1oX9mlk0kZc0MU5jLyiQsuOTnKyeP9jWQaXX
 WeBpcfVr7UyQ8Y1mlLqe/0x25DkzNHU1VpCZvUOWy6npUoAILe5PWQXcXq0vbhL2LPbSUu+DmYF
 3ek/istkwh1M15GMITDc2mw8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b501e4074c3b4662;
	Mon, 09 Nov 2026 08:32:27 +0000
X-Mizu-Trace-ID: b501e4074c3b4662
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
Subject: [PATCH 08/16] KVM: arm64: Advertise TCR2, SCTLR2, S1PIE and S1POE to protected VMs
Date: Mon,  9 Nov 2026 08:31:57 +0000
Message-ID: <20261109083205.806619-9-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109083205.806619-1-fuad.tabba@linux.dev>
References: <20261109083205.806619-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_003230_053764_9570DB12 
X-CRM114-Status: GOOD (  13.45  )
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

Advertise FEAT_TCR2, FEAT_SCTLR2, FEAT_S1PIE and FEAT_S1POE to
protected VMs, with S1POE only when the kernel supports POE, as EL2
doesn't switch the POE registers otherwise. With the fields set,
vcpu_set_hcrx() sets HCRX_EL2.{TCR2En,SCTLR2En} for them, and since
the previous patch their PIE and POE registers don't trap.

Reset the new registers as KVM does for a non-protected vCPU.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_hyp.h   |  1 +
 arch/arm64/kvm/arm.c               |  1 +
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 24 +++++++++++++++++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 920c1d8d45b1a..ab22b395d0908 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -151,6 +151,7 @@ extern u64 kvm_nvhe_sym(id_aa64isar2_el1_sys_val);
 extern u64 kvm_nvhe_sym(id_aa64mmfr0_el1_sys_val);
 extern u64 kvm_nvhe_sym(id_aa64mmfr1_el1_sys_val);
 extern u64 kvm_nvhe_sym(id_aa64mmfr2_el1_sys_val);
+extern u64 kvm_nvhe_sym(id_aa64mmfr3_el1_sys_val);
 extern u64 kvm_nvhe_sym(id_aa64smfr0_el1_sys_val);
 extern u64 kvm_nvhe_sym(id_aa64dfr0_el1_sys_val);
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 2753686982f0b..fe60535e4f358 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2834,6 +2834,7 @@ static void kvm_hyp_init_symbols(void)
 	kvm_nvhe_sym(id_aa64mmfr0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
 	kvm_nvhe_sym(id_aa64mmfr1_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64MMFR1_EL1);
 	kvm_nvhe_sym(id_aa64mmfr2_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64MMFR2_EL1);
+	kvm_nvhe_sym(id_aa64mmfr3_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64MMFR3_EL1);
 	kvm_nvhe_sym(id_aa64smfr0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64SMFR0_EL1);
 	kvm_nvhe_sym(id_aa64dfr0_el1_sys_val) = read_sanitised_ftr_reg(SYS_ID_AA64DFR0_EL1);
 	kvm_nvhe_sym(__icache_flags) = __icache_flags;
diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 78c25da737591..d186aba6aa09c 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -30,6 +30,7 @@ u64 id_aa64isar2_el1_sys_val;
 u64 id_aa64mmfr0_el1_sys_val;
 u64 id_aa64mmfr1_el1_sys_val;
 u64 id_aa64mmfr2_el1_sys_val;
+u64 id_aa64mmfr3_el1_sys_val;
 u64 id_aa64smfr0_el1_sys_val;
 u64 id_aa64dfr0_el1_sys_val;
 
@@ -83,6 +84,11 @@ static bool vm_has_sve(const struct kvm *kvm)
 	return system_supports_sve() && kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_SVE);
 }
 
+static bool vm_has_s1poe(const struct kvm *kvm)
+{
+	return system_supports_poe();
+}
+
 /*
  * Definitions for features to be allowed or restricted for protected guests.
  *
@@ -177,6 +183,14 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr2[] = {
 	FEAT_END
 };
 
+static const struct pvm_ftr_bits pvmid_aa64mmfr3[] = {
+	MAX_FEAT(ID_AA64MMFR3_EL1, TCRX, IMP),
+	MAX_FEAT(ID_AA64MMFR3_EL1, SCTLRX, IMP),
+	MAX_FEAT(ID_AA64MMFR3_EL1, S1PIE, IMP),
+	MAX_FEAT_FUNC(ID_AA64MMFR3_EL1, S1POE, IMP, vm_has_s1poe),
+	FEAT_END
+};
+
 static const struct pvm_ftr_bits pvmid_aa64isar1[] = {
 	MAX_FEAT(ID_AA64ISAR1_EL1, DPB, DPB2),
 	MAX_FEAT_FUNC(ID_AA64ISAR1_EL1, APA, PAuth, vm_has_ptrauth),
@@ -274,6 +288,8 @@ static u64 pvm_calc_id_reg(const struct kvm_vcpu *vcpu, u32 id)
 		return get_restricted_features(vcpu, id_aa64mmfr1_el1_sys_val, pvmid_aa64mmfr1);
 	case SYS_ID_AA64MMFR2_EL1:
 		return get_restricted_features(vcpu, id_aa64mmfr2_el1_sys_val, pvmid_aa64mmfr2);
+	case SYS_ID_AA64MMFR3_EL1:
+		return get_restricted_features(vcpu, id_aa64mmfr3_el1_sys_val, pvmid_aa64mmfr3);
 	case SYS_ID_AA64DFR0_EL1:
 		return get_restricted_features(vcpu, id_aa64dfr0_el1_sys_val, pvmid_aa64dfr0);
 	case SYS_ID_AA64MMFR4_EL1:
@@ -707,7 +723,7 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	AARCH64(SYS_ID_AA64MMFR0_EL1),
 	AARCH64(SYS_ID_AA64MMFR1_EL1),
 	AARCH64(SYS_ID_AA64MMFR2_EL1),
-	ID_UNALLOCATED(7,3),
+	AARCH64(SYS_ID_AA64MMFR3_EL1),
 	ID_UNALLOCATED(7,4),
 	ID_UNALLOCATED(7,5),
 	ID_UNALLOCATED(7,6),
@@ -793,7 +809,13 @@ static const struct sys_reg_desc_reset pvm_sys_reg_reset_vals[] = {
 	RESET_ZERO(CPACR_EL1),
 	RESET_VAL(CONTEXTIDR_EL1, 0x00000000dbadc0deULL),
 	RESET_VAL(SCTLR_EL1, 0x00C50078ULL),
+	RESET_ZERO(SCTLR2_EL1),
 	RESET_ZERO(TCR_EL1),
+	RESET_ZERO(TCR2_EL1),
+	RESET_UNKNOWN(PIR_EL1),
+	RESET_UNKNOWN(PIRE0_EL1),
+	RESET_UNKNOWN(POR_EL1),
+	RESET_UNKNOWN(POR_EL0),
 	RESET_UNKNOWN(AFSR0_EL1),
 	RESET_UNKNOWN(AFSR1_EL1),
 	RESET_UNKNOWN(ESR_EL1),
-- 
2.47.3


