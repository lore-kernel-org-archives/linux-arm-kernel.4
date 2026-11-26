Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17405606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g/UOYjSc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lDcAMGVG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fdkB4rzNXfQPShYzGv/vZWC7WnouCQ45EJygCmcy/DE=; b=g/UOYjScWm+OBf
	r9vbXNo0/U9f23TnZYdhpNbNTXPN5P2hTCk2TerqrS/Omf/LH6QPYsbt7LxLbN4gXhL0cWicJ3bnx
	g90vzvNHFUc61ATzNhns/P7TuWNiheEDQqN/xL+KqYa73otnBownpInRxrkDuZOau6WaFAyAeAUG2
	wtffRr+K1LcWX34t4d20EbR8+irCIafkEpi26sw4ctW3FmNAya0Vh+M3wgo2dilxgTsUIa6gTPWMm
	6yJiQYSGgcG2TaUSxqD6/0GWHpQ8/Qf2y6z9bhGKtgvP71lek+AtoX3kemCG0ELzZs1i0Oymn1hYI
	08slMZL4RNT7RROYP4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbnM-0000000Do1K-1Ofi;
	Thu, 26 Nov 2026 15:54:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbnE-0000000Dnyp-0Hmu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:53:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C77F14076D;
	Thu, 26 Nov 2026 15:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BB41F000C0;
	Thu, 26 Nov 2026 15:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795708431;
	bh=fdkB4rzNXfQPShYzGv/vZWC7WnouCQ45EJygCmcy/DE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lDcAMGVGLCEZw4OldI29d7StJfHdRox26ep7vsWOHdlrmGQiPhQhaKZbcpMe+gY5E
	 UNq61HQKXNSDd14bNsVnmqEzZCMFvwkGdaGOnPJC82/Pj6+AtZvBHgGGAR2lhI5Gxv
	 yEZT8z9MwcrsUCBSbLR0d+dCdYDztT4vKIuykWIWjtU3CJQ0Muf7WlRu1b0oqLbxRR
	 fiYuRlODqdPq6uBSDql+xGVQVrhIuYXYhbHESsKV488uTNZ2hw/FSdlw7mwNoup4lb
	 18NGtSICN3f/1n9I9oUTW59s52kO5aqKVG9rpiWIjGLXE3sDF919M3VQCE2QRLSZV4
	 gRDtn4A1VCBWg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 2/3] arm64: add HWCAP3_LS64_ACCDATA
Date: Thu, 26 Nov 2026 16:53:38 +0100
Message-ID: <20261126155339.1349218-3-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126155339.1349218-1-arnd@kernel.org>
References: <20261126155339.1349218-1-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

LS64_ACCDATA extends the LS64 feature with the user-space st64bv0 instruction
and the EL1 ACCDATA register. Like LS64, it was added with Armv8.7, and it
roughly corresponds to the 'enqcmd' feature for shared hardware workqueues
on x86 CPUs as described in the kernel's SVA documentation. [1]

Userspace can check availability of HWCAP3_LS64_ACCDATA to see if the shared
hardware workqueue feature is possible on a given driver.

Link: https://www.kernel.org/doc/html/v7.3/arch/x86/sva.html#enqcmd [1]
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/arch/arm64/elf_hwcaps.rst | 7 +++++++
 arch/arm64/include/uapi/asm/hwcap.h     | 1 +
 arch/arm64/kernel/cpufeature.c          | 1 +
 arch/arm64/kernel/cpuinfo.c             | 1 +
 4 files changed, 10 insertions(+)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index f60ca5612daa..f63035696654 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -478,6 +478,13 @@ HWCAP3_SVE_LUT6
     Functionality implied by ID_AA64PFR0_EL1.SVE == 0b0001 and
     ID_AA64ISAR2_EL1.LUT == 0b0010.
 
+HWCAP3_LS64_ACCDATA
+    Functionality implied by ID_AA64ISAR1_EL1.LS64 >= 0b0011. Note that
+    the function of instruction st64bv0 requires support by CPU, system
+    and target (device) memory location and HWCAP3_LS64_ACCDATA implies
+    the support of CPU. User should only use st64bv0 on supported target
+    (device) memory location, otherwise fallback to the non-atomic
+    alternatives.
 
 4. Unused AT_HWCAP bits
 -----------------------
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 10272ddb4d6f..c85c445275f6 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -155,5 +155,6 @@
 #define HWCAP3_F16F32DOT	(1UL << 9)
 #define HWCAP3_F16F32MM		(1UL << 10)
 #define HWCAP3_SVE_LUT6		(1UL << 11)
+#define HWCAP3_LS64_ACCDATA	(1UL << 12)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c88ea4b93138..dcbe024284e0 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3223,6 +3223,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR1_EL1, DGH, IMP, CAP_HWCAP, KERNEL_HWCAP_DGH),
 	HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
 	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64, CAP_HWCAP, KERNEL_HWCAP_LS64),
+	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA, CAP_HWCAP, KERNEL_HWCAP_LS64_ACCDATA),
 	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, FAMINMAX, IMP, CAP_HWCAP, KERNEL_HWCAP_FAMINMAX),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, LSFE, IMP, CAP_HWCAP, KERNEL_HWCAP_LSFE),
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 94e6cd211d70..beea36b282f1 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -158,6 +158,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_F16F32DOT]	= "f16f32dot",
 	[KERNEL_HWCAP_F16F32MM]		= "f16f32mm",
 	[KERNEL_HWCAP_SVE_LUT6]		= "svelut6",
+	[KERNEL_HWCAP_LS64_ACCDATA]	= "ls64accdata",
 };
 
 #ifdef CONFIG_COMPAT
-- 
2.53.0


