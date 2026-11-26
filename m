Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDA3606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RCbRsYKv;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hetP50fs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J8WNoKEc0VuFKBNFw4+mR3YcdoFeytD04JpUsxYo3ks=; b=RCbRsYKvpIEqP9
	Zcsyx18+winSQNfCd3KFvniErIs1kxNC7EWLCWXlkgrD40jFZcH9+okAY3BYF5bgr5L6yi86PBJWH
	D1PfVJVh9Sd2dfTQ4Bj/ypm6BZtOapRY5eJ5nd682z2PtBYSvaySddV6/EsEnXs3RE2CLyL0qqt88
	Xyky3NTu2Ko6mW8UHmHSIFLq6S/nVRtxJAId/b6Wn/shFP6smfisDVmG2m8SAxRUOwhJh/OxvIZoK
	NMKApzuA1egNRY9oKIIY6MozUK0FzY3EmeYZiEN62Chbhv/y0ErOrRYrd3+ts+lQ2ciwpSisJVSiE
	nQ8xLJBPORdCI55L8rTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzz-0000000D459-1WHx;
	Thu, 26 Nov 2026 11:50:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzb-0000000D3wC-0il5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:50:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EE161CE2;
	Thu, 26 Nov 2026 03:50:19 -0800 (PST)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA6D73F632;
	Thu, 26 Nov 2026 03:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795693822; bh=yFkYatB5WJrK/LmKtOX2lr33tMmU0w63R59hWonTW+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hetP50fsgqAmjdFPviqlduTjbgI+oEwKjOUz/S7jEV+l3va+oYYue9zXTrBRzs0Ng
	 QUJ9QQz++TwVxZXyYShIAy2/H0HmPCvlmOn6CFhpf//np6XG9u+KIBs8VzEwOhID9Z
	 wtAYetpQL3sSbZR/jKEEphDwfPmULweuBig3E9Mk=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [RFC v2 04/13] KVM: arm64: Hide TLBID from guest sysregs
Date: Thu, 26 Nov 2026 11:49:27 +0000
Message-ID: <20261126114936.864256-5-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126114936.864256-1-kristina.martsenko@arm.com>
References: <20261126114936.864256-1-kristina.martsenko@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_035025_163764_14B835A0 
X-CRM114-Status: GOOD (  12.32  )
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

Don't expose FEAT_TLBID to guests. It wouldn't be useful in the general
case since a guest doesn't know which domains exist and its vCPUs can be
moved between any physical CPUs.

Hide TLBID sysregs and sysreg fields from the guest:

  * Report the feature as not supported in the ID register
    ID_AA64MMFR4_EL1.TLBID.

  * Configure the TLBIDIDR_EL1 sysreg to UNDEF via the FGU mechanism.
    Sanitize a nested hypervisor's HFGRTR2.nTLBIDIDR.

  * Sanitize a nested hypervisor's HCRX.{VTLBIDEn,VTLBIDOSEn,FNB}.

  * VTLBID{OS}<n>_EL2 registers are VNCR-backed and not exposed to
    guests (apart from being able to read/write into the VNCR page) so
    no need to handle them in sys_reg_descs or elsewhere.

  * The guest is free to set SCTLR2_EL{1,2}.TLBOSNIS, which shouldn't
    matter to KVM.

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/kvm/config.c         | 6 ++++++
 arch/arm64/kvm/emulate-nested.c | 1 +
 arch/arm64/kvm/sys_regs.c       | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index adaf26ab93b8..d93bc0715494 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -243,6 +243,7 @@ struct reg_feat_map_desc {
 #define FEAT_S2PIE		ID_AA64MMFR3_EL1, S2PIE, IMP
 #define FEAT_GCIE		ID_AA64PFR2_EL1, GCIE, IMP
 #define FEAT_NV3		ID_AA64MMFR4_EL1, NV_frac, NV3
+#define FEAT_TLBID		ID_AA64MMFR4_EL1, TLBID, IMP
 
 static bool not_feat_aa64el3(struct kvm *kvm)
 {
@@ -849,6 +850,7 @@ static const struct reg_bits_to_feat_map hfgrtr2_feat_map[] = {
 		   HFGRTR2_EL2_nTCRMASK_EL1,
 		   FEAT_SRMASK),
 	NEEDS_FEAT(HFGRTR2_EL2_nRCWSMASK_EL1, FEAT_THE),
+	NEEDS_FEAT(HFGRTR2_EL2_nTLBIDIDR_EL1, FEAT_TLBID),
 };
 
 static const DECLARE_FEAT_MAP_FGT(hfgrtr2_desc, hfgrtr2_masks,
@@ -947,6 +949,10 @@ static const struct reg_bits_to_feat_map hcrx_feat_map[] = {
 		   HCRX_EL2_NVnTTLBOS,
 		   FEAT_NV3),
 	NEEDS_FEAT(HCRX_EL2_SRMASKEn, FEAT_SRMASK),
+	NEEDS_FEAT(HCRX_EL2_FNB			|
+		   HCRX_EL2_VTLBIDOSEn		|
+		   HCRX_EL2_VTLBIDEn,
+		   FEAT_TLBID),
 	NEEDS_FEAT(HCRX_EL2_PACMEn, feat_pauth_lr),
 	NEEDS_FEAT(HCRX_EL2_EnFPM, FEAT_FPMR),
 	NEEDS_FEAT(HCRX_EL2_GCSEn, FEAT_GCS),
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 2bec81668361..171c0c2b6bf2 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1440,6 +1440,7 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(SYS_TCRALIAS_EL1,	HFGRTR2, nTCRALIAS_EL1, 0),
 	SR_FGT(SYS_TCRMASK_EL1,		HFGRTR2, nTCRMASK_EL1, 0),
 	SR_FGT(SYS_ERXGSR_EL1,		HFGRTR2, nERXGSR_EL1, 0),
+	SR_FGT(SYS_TLBIDIDR_EL1,	HFGRTR2, nTLBIDIDR_EL1, 0),
 
 	/* HFGITR_EL2 */
 	SR_FGT(OP_AT_S1E1A, 		HFGITR, ATS1E1A, 1),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c7d91138a6d4..54461a3da117 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1981,6 +1981,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		if (!system_supports_poe())
 			val &= ~ID_AA64MMFR3_EL1_S1POE;
 		break;
+	case SYS_ID_AA64MMFR4_EL1:
+		val &= ~ID_AA64MMFR4_EL1_TLBID;
+		break;
 	case SYS_ID_MMFR4_EL1:
 		val &= ~ID_MMFR4_EL1_CCIDX;
 		break;
-- 
2.43.0


