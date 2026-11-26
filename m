Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBEF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=40NqhGno;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fsW2ofqE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IqOkoUGZgs1ZSY7BxI+ueUrm+jrJWpslzsFpDAohyjw=; b=40NqhGnoUeLi9G
	g4XDz1s7BRe6ou9XwEAU4AX+oNcJmzoFZY6IN477yd4B8Bwil7uZ+g0lvh5TihALXJNPVi0RPGu46
	h7HMoUtQVw8I6G2Ue9e7T12APSlaJyHDBp6BsDJC5iwuOES5FlEpOO2sozUqSwdyqJOborxzsEd5g
	uIwMojNruAJ9cRez/5c0c/SpAUhA3cTWUIkFF1yIrVy+R5ID6fYWEP1SxfsZy2VSAn3DTzqcp1gfn
	Xmbq7z0JOyf1s7ItgxZB4ozfvOfgucOtdNI4aN8egP7+HGq93WSmXlZfUEQwCpvQpmE/dGT7TIkqj
	PKOw68fr2Y6H+MDsp6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzz-0000000D45X-4BTG;
	Thu, 26 Nov 2026 11:50:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXze-0000000D3xC-26E1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:50:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E89A71D14;
	Thu, 26 Nov 2026 03:50:22 -0800 (PST)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 831FB3F632;
	Thu, 26 Nov 2026 03:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795693825; bh=Rmb994cmdGLgndDqtNhWhnEDy905UlxaiI3SXTURFHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fsW2ofqEQzIK2nTtqKlUSeTyJqGjj7g94IQQlc2ISd/krEzgpw7bsONDUA/J5uWvl
	 w4Uxn27X3U7Omb8oZAt+RKfmXDLN4EhhRZ6SqoqC8V2up3Srp/hRErl5KgVZfCdoMV
	 Z/wRRmWXG/vTJWbRVu0Dv0SmbJdQU+UhW8j8fIQo=
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
Subject: [RFC v2 05/13] KVM: arm64: Hide TLBID from guest instructions
Date: Thu, 26 Nov 2026 11:49:28 +0000
Message-ID: <20261126114936.864256-6-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126114936.864256-1-kristina.martsenko@arm.com>
References: <20261126114936.864256-1-kristina.martsenko@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_035026_625049_01CF76BF 
X-CRM114-Status: GOOD (  15.24  )
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

Since we don't expose TLBID to guests, hide TLBI domains from guest
TLBI{P} instructions:

  * Map all guest virtual domains to the broadcast domain 0 in
    VTLBID{OS}<n>_EL2. Enable the mapping with HCRX_EL2.VTLBID{OS}En.
    If the guest issues a TLBI to a TLBI domain, it will instead go to
    all agents in the Inner or Outer Shareable domain (as it does today).

  * TLBID introduces some TLBIP instructions. A guest can execute TLBIP
    instructions unless KVM or a nested hypervisor configures TLBI
    instructions to trap. If trapped, then a TLBIP will trap with EC
    0x14. In this case KVM currently injects an UNDEF (and prints an
    error). This patch doesn't change that, as we don't support TLBIP
    instructions in guests.

  * KVM emulates some guest TLBI instructions. Ignore the TLBI domain in
    ASID* TLBI instructions. In other types of TLBIs the domain is
    implicitly ignored. (*ALL* instructions have the domain in an
    optional register argument, which KVM does not pass. *VA*/*IPA*
    instructions don't have a domain, only their TLBIP variants do.)

Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/include/asm/el2_setup.h      | 67 +++++++++++++++++++++++++
 arch/arm64/include/asm/kvm_emulate.h    |  5 ++
 arch/arm64/include/asm/tlbflush.h       |  2 +
 arch/arm64/kvm/hyp/include/hyp/switch.h |  7 ++-
 arch/arm64/kvm/hyp/vhe/tlb.c            |  2 +
 5 files changed, 81 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 1521c9965ae3..c8a6a2f942e0 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -189,6 +189,72 @@
 	msr	vttbr_el2, xzr
 .endm
 
+#define VTLBID_ISH	0
+#define VTLBID_OSH	1
+
+.macro __init_vtlbid_regs sh
+	mrs_s	x0, SYS_TLBIDIDR_EL1
+
+	.if \sh == VTLBID_ISH
+	ubfx	x1, x0, #TLBIDIDR_EL1_NIS_SHIFT, #TLBIDIDR_EL1_NIS_WIDTH
+	ubfx	x2, x0, #TLBIDIDR_EL1_NVIS_SHIFT, #TLBIDIDR_EL1_NVIS_WIDTH
+	.else
+	ubfx	x1, x0, #TLBIDIDR_EL1_NOS_SHIFT, #TLBIDIDR_EL1_NOS_WIDTH
+	ubfx	x2, x0, #TLBIDIDR_EL1_NVOS_SHIFT, #TLBIDIDR_EL1_NVOS_WIDTH
+	.endif
+	cbz	x1, .Lskip_vtlbid_regs_\@
+
+	/* Map all virtual domains to the broadcast-all domain */
+	.if \sh == VTLBID_ISH
+	msr_s	SYS_VTLBID0_EL2, xzr
+	.else
+	msr_s	SYS_VTLBIDOS0_EL2, xzr
+	.endif
+
+	/*
+	 * VTLBID1_EL2 is implemented if either NIS <= 8 && NVIS >= 4,
+	 * or NIS > 8 && NVIS >= 3. Similarly for VTLBIDOS1_EL2.
+	 */
+	cmp	x1, #8
+	cset	x0, ls
+	add	x0, x0, #3
+	cmp	x2, x0
+	b.lo	.Lskip_vtlbid_regs_\@
+	.if \sh == VTLBID_ISH
+	msr_s	SYS_VTLBID1_EL2, xzr
+	.else
+	msr_s	SYS_VTLBIDOS1_EL2, xzr
+	.endif
+
+	/*
+	 * VTLBID{2,3}_EL2 are implemented if either NIS <= 8 && NVIS >= 5,
+	 * or NIS > 8 && NVIS >= 4. Similarly for VTLBIDOS{2,3}_EL2.
+	 */
+	add	x0, x0, #1
+	cmp	x2, x0
+	b.lo	.Lskip_vtlbid_regs_\@
+	.if \sh == VTLBID_ISH
+	msr_s	SYS_VTLBID2_EL2, xzr
+	msr_s	SYS_VTLBID3_EL2, xzr
+	.else
+	msr_s	SYS_VTLBIDOS2_EL2, xzr
+	msr_s	SYS_VTLBIDOS3_EL2, xzr
+	.endif
+.Lskip_vtlbid_regs_\@:
+.endm
+
+/* TLBID domain mapping */
+.macro __init_el2_vtlbid
+	mrs_s	x0, SYS_ID_AA64MMFR4_EL1
+	ubfx	x0, x0, #ID_AA64MMFR4_EL1_TLBID_SHIFT, #ID_AA64MMFR4_EL1_TLBID_WIDTH
+	cbz	x0, .Lskip_vtlbid_\@
+
+	__init_vtlbid_regs VTLBID_ISH
+	__init_vtlbid_regs VTLBID_OSH
+
+.Lskip_vtlbid_\@:
+.endm
+
 /* GICv3 system register access */
 .macro __init_el2_gicv3
 	mrs	x0, id_aa64pfr0_el1
@@ -478,6 +544,7 @@
 	__init_el2_brbe
 	__init_el2_lor
 	__init_el2_stage2
+	__init_el2_vtlbid
 	__init_el2_gicv3
 	__init_el2_gicv5
 	__init_el2_hstr
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 334211b8b2ee..fa6f389e99e6 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -762,6 +762,11 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 					vcpu->arch.hcrx_el2 |= HCRX_EL2_NVnTTLBOS;
 			}
 		}
+
+		if (cpus_have_final_cap(ARM64_HAS_TLBID))
+			vcpu->arch.hcrx_el2 |= (HCRX_EL2_VTLBIDEn |
+						HCRX_EL2_VTLBIDOSEn);
+
 	}
 }
 
diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index a05520d3a013..8338d780ca59 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -46,6 +46,8 @@
 		__tlbi(op, (arg) | USER_ASID_FLAG);				\
 } while (0)
 
+#define TLBI_TLBID_MASK		GENMASK_ULL(15, 0)
+
 /* This macro creates a properly formatted VA operand for the TLBI */
 #define __TLBI_VADDR(addr, asid)				\
 	({							\
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index e0c55644224c..53e9455953cb 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -340,9 +340,12 @@ static inline void __deactivate_traps_mpam(void)
  *   the PTW is a thing. It really isn't.
  *
  * - EnIDCP128: We don't allow IMPDEF sysregs -- full stop.
+ *
+ * - VTLBID{OS}En: We decide which domain the guest's TLBIs are broadcast to.
  */
-#define NV_HCRX_GUEST_EXCLUDE	(HCRX_EL2_TMEA	    | HCRX_EL2_PTTWI | \
-				 HCRX_EL2_EnIDCP128)
+#define NV_HCRX_GUEST_EXCLUDE	(HCRX_EL2_TMEA	    | HCRX_EL2_PTTWI	| \
+				 HCRX_EL2_EnIDCP128 | HCRX_EL2_VTLBIDEn	| \
+				 HCRX_EL2_VTLBIDOSEn)
 
 static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/arm64/kvm/hyp/vhe/tlb.c b/arch/arm64/kvm/hyp/vhe/tlb.c
index 33ac9a8c954e..e848ba880694 100644
--- a/arch/arm64/kvm/hyp/vhe/tlb.c
+++ b/arch/arm64/kvm/hyp/vhe/tlb.c
@@ -226,6 +226,7 @@ void __kvm_flush_vm_context(void)
  * - a non-shareable TLBI is upgraded to being inner-shareable
  * - an outer-shareable TLBI is also mapped to inner-shareable
  * - an nXS TLBI is upgraded to XS
+ * - any TLBID domain is upgraded to broadcast-all
  */
 int __kvm_tlbi_s1e2(struct kvm_s2_mmu *mmu, u64 va, u64 sys_encoding)
 {
@@ -291,6 +292,7 @@ int __kvm_tlbi_s1e2(struct kvm_s2_mmu *mmu, u64 va, u64 sys_encoding)
 	case OP_TLBI_ASIDE1NXS:
 	case OP_TLBI_ASIDE1ISNXS:
 	case OP_TLBI_ASIDE1OSNXS:
+		va &= ~TLBI_TLBID_MASK;
 		__tlbi(aside1is, va);
 		break;
 	case OP_TLBI_VAAE1:
-- 
2.43.0


