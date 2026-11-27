Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DEB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=egJhBiqQ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mXdrElBP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FAZ1Ie2a5PV9PZg9qSZ/uFMXiu3UXlY8gqilin0ejXQ=; b=egJhBiqQ7WHfAJQ0a0prt7NDCg
	rro4Ud6FmDEZ+NvNMSUjNfW1EL/2WRgl6eMnGCVdBBShlTpQlo5q16NMFhFXYTM61voG8PBqZ2Cm8
	M85MRew2Z5f+TXjlHM5JrPIkZifBdiPwbweeUg8fNJBIJeM4HpJkJsblbei16Iw9IazsTy8P45u4d
	GbfxsIFyTOaEuc4NVfv15O+h1ncDc3yYODucT7mu+OgJYoB6wW6Ml/NYKLunlYeFKaZQPyiX2usRU
	cD1VVlOgcFJtfnjdTDBuMZxmSUDaMv8COxy8NnGKZSk9Icjd6JT4tWVlJ+2pQwdI2rY9gJABE0XRp
	Mo2dQOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrW3-0000000FHec-14y0;
	Fri, 27 Nov 2026 08:41:11 +0000
Received: from out-244.mta0.migadu.com ([2001:41d0:1004:224b::f4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrVy-0000000FHeB-45KR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:41:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8nByk3lQkziV+ndmJCL42CLKc9ffPkb9kguxLpVEBMs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795768865; v=1; x=1796373665;
 b=mXdrElBP/pXgCaDw4GN5gO13UfMuk+7GBuvMNmF0y46Ar4BA8s63rWGib5C/pEgH/UBsk8ps
 KG6fMWyigm3Xpzor00o1hIju4/7Mc4+gItrJXIVEs+73i4DC4bf6IgWOsA4sksXFFGtLPSvx4II
 pkMiNfJtLnndZhSVxwk6UX/4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b3551a7f456a19a0;
	Fri, 27 Nov 2026 08:41:04 +0000
X-Mizu-Trace-ID: b3551a7f456a19a0
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	anshuman.khandual@arm.com,
	tabba@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: Use symbolic constants for the ccmp NZCV immediates
Date: Fri, 27 Nov 2026 08:41:01 +0000
Message-ID: <20261127084101.295792-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_004107_217090_11449063 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

The ccmp instructions in the EL2 setup code, reset_pmuserenr_el0 and
the hyp vectors give the flags to set when their condition fails as a
raw NZCV immediate, #4 or #8. Which condition that leaves true for the
branch that follows has to be worked out from the pseudocode each time.

Define CCMP_NZCV_EQ and CCMP_NZCV_LT from the PSR bits, named for the
condition each leaves true, and pass those instead.

No functional change intended.

Suggested-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/all/asIQ1ZwUjkmNJbRP@willie-the-truck/
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes in v2:
    - Moved the CCMP_NZCV_* definitions out of the ARM64_S390_COMMON block
      (Catalin).
    - Rebased onto v7.4-rc3.
    - Collected Reviewed-by tags from Anshuman and Catalin.
    
    v1: https://lore.kernel.org/all/20261009072147.474952-1-fuad.tabba@linux.dev/
    
    Based on v7.4-rc3.

 arch/arm64/include/asm/assembler.h | 2 +-
 arch/arm64/include/asm/el2_setup.h | 4 ++--
 arch/arm64/include/asm/ptrace.h    | 4 ++++
 arch/arm64/kvm/hyp/hyp-entry.S     | 2 +-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 020670814bda6..64a54f27c1b06 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -474,7 +474,7 @@ alternative_else_nop_endif
 	mrs	\tmpreg, id_aa64dfr0_el1
 	ubfx	\tmpreg, \tmpreg, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
 	cmp	\tmpreg, #ID_AA64DFR0_EL1_PMUVer_NI
-	ccmp	\tmpreg, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #4, ne
+	ccmp	\tmpreg, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #CCMP_NZCV_EQ, ne
 	b.eq	9000f				// Skip if no PMU present or IMP_DEF
 	msr	pmuserenr_el0, xzr		// Disable PMU access from EL0
 9000:
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 12a5001812911..7a23189cf437c 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -137,7 +137,7 @@
 	mrs	x1, id_aa64dfr0_el1
 	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
 	cmp	x0, #ID_AA64DFR0_EL1_PMUVer_NI
-	ccmp	x0, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #4, ne
+	ccmp	x0, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF, #CCMP_NZCV_EQ, ne
 	b.eq	.Lskip_pmu_\@			// Skip if no PMU present or IMP_DEF
 	mrs	x0, pmcr_el0			// Disable debug access traps
 	ubfx	x0, x0, #11, #5			// to EL2 and allow access to
@@ -422,7 +422,7 @@
 	mrs	x1, id_aa64dfr0_el1
 	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
 	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
-	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #8, ne
+	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #CCMP_NZCV_LT, ne
 	b.lt	.Lskip_pmuv3p9_\@		// Skip if < PMUv3p9 or IMP_DEF
 
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index ad0ad30b36cda..346ad105d34c2 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -26,6 +26,10 @@
 
 #define GIC_PRIO_PSR_I_SET	GICV3_PRIO_PSR_I_SET
 
+/* CCMP NZCV immediates that make the named condition hold */
+#define CCMP_NZCV_EQ		(PSR_Z_BIT >> 28)
+#define CCMP_NZCV_LT		(PSR_N_BIT >> 28)
+
 #if ARM64_S390_COMMON == 1
 
 /* Additional SPSR bits not exposed in the UABI */
diff --git a/arch/arm64/kvm/hyp/hyp-entry.S b/arch/arm64/kvm/hyp/hyp-entry.S
index 03f97d71984c4..8621eacd13738 100644
--- a/arch/arm64/kvm/hyp/hyp-entry.S
+++ b/arch/arm64/kvm/hyp/hyp-entry.S
@@ -46,7 +46,7 @@ el1_sync:				// Guest trapped into EL2
 	mrs	x0, esr_el2
 	ubfx	x0, x0, #ESR_ELx_EC_SHIFT, #ESR_ELx_EC_WIDTH
 	cmp	x0, #ESR_ELx_EC_HVC64
-	ccmp	x0, #ESR_ELx_EC_HVC32, #4, ne
+	ccmp	x0, #ESR_ELx_EC_HVC32, #CCMP_NZCV_EQ, ne
 	b.ne	el1_trap
 
 	/*

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3


