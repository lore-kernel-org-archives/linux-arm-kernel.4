Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1464606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zvcB46qY;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=X/X8D6o7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:From:To:
	Content-Type:Message-Id:Content-Transfer-Encoding:Mime-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8mTErck5JGupQOghrZ2jPp0xZxOQ50MpStd/zzuxbSw=; b=zvcB46qYqKXNC2CL8szuDm1zEE
	DPv3teRIzZUdkCp1DXLTcEPCRp7GHCn5+3b96uNAg4Eq6fpTCpVILAqd67cMFQmPW0qdnszA6D7qP
	+BE4ECfZEXB4RHpeAJphMGs0OX8Cs8LAOUeMryK1485IYYS0oIp8x3XfiF5xl2LMgXJTREqSllC5I
	selu81dOhhOiX2gG/P2NC9pWFlBu7VsY6uUuOY6SuKH+WMbZVZZdMXfFG6PIecRsufgAWMTldyg15
	xZfJGgPrc1kxkmky8p8SNo9v1HLerynqasSq70zcvBZTjTbwgdPYiYtqLB2j9k+Xr4o6s9KL3eL8J
	xqQgxQSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2zJ-00000005wO2-1fg5;
	Wed, 11 Nov 2026 07:43:21 +0000
Received: from va-1-111.ptr.blmpb.com ([209.127.230.111])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2zF-00000005wNE-1y5z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794382992; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=8mTErck5JGupQOghrZ2jPp0xZxOQ50MpStd/zzuxbSw=;
 b=X/X8D6o7YCJbnKtcRqHB1NgObIu9QCw3LHKyn9a35l2tvVFwgh0r8vjho9OZGl3u7eA3ja
 GdlqNEwBBCMhEHl4p9Z0Aqkt7EYjrDIDGP31ho4wLBReYhUubLuWP24VK6TIk9Hlony5Y3
 L0aSp8sdb1UqVxOKjnjjtUSFDI89Bfuc2GhzcYK1C01MgGn7iLUXaepKKLP0qWQuvfspvn
 cFZ2EVZvl00o+/kTs+wye+KLURAbQTd4/+prUcnWS214xIc909z3Vo86pxCRGP3zSH9uuG
 c1Vsr9Rhr/SRdcyx9hn9O5ogIkxybOSkr5x48E33wOLjOPpdHRvq8Opv3ty/qg==
X-Mailer: git-send-email 2.20.1
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261111073906.652400-1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26af41c8e+6d017a+lists.infradead.org+qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: "Catalin Marinas" <catalin.marinas@arm.com>, <will@kernel.org>
From: "Rui Qi" <qirui.001@bytedance.com>
Cc: <mark.rutland@arm.com>, <ardb@kernel.org>, <song@kernel.org>, 
	<dylanbhatch@google.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH v2] arm64: module: Use text-poke for late PLT/veneer emission
Date: Wed, 11 Nov 2026 15:39:06 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_234317_596304_9C34EDB2 
X-CRM114-Status: GOOD (  19.22  )
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

module_emit_plt_entry() and module_emit_veneer_for_adrp() write PLT
entries into the .plt section by direct assignment.  Once a module is
fully formed its .plt is read-only/executable, so a late (livepatch)
relocation that falls back to PLT emission -- an out-of-range
R_AARCH64_CALL26/JUMP26, or an ADRP under CONFIG_ARM64_ERRATUM_843419
-- triggers a synchronous Data Abort and panics.

This is the same ROX premise that commit 91b89a634487
("arm64/module: Use text-poke API for late relocations.") handled for
the relocation writes through WRITE_PLACE(); the PLT/veneer emitters
were left using direct assignment.

The late path is reachable without remapping:
klp_write_section_relocs() applies .klp.rela.* sections through
apply_relocate_add() with the patch module already MODULE_STATE_LIVE,
so .plt is ROX.

Route the emitters through the same text-poke write path the relocation
code already uses, rather than open-coding a parallel helper.

Fixes: 91b89a634487d5614e51ee773a889ed57f5551ca ("arm64/module: Use text-poke API for late relocations.")
Cc: stable@vger.kernel.org
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
Changes since v1 (formerly 3/3 of a 3-patch series, now standalone):

- Dropped the former 1/3 and 2/3 (big-endian byte-order fixups): arm64
  big-endian support is being removed in v7.4 (Catalin Marinas), so the
  BE-only paths are no longer reachable.

- Incorporated review (Catalin Marinas): unify the relocation write
  helper and the open-coded PLT/veneer write helper into a single
  module_write_place() macro in asm/module.h, used by module.c and
  module-plts.c; drop the redundant aarch64_insn_copy() NULL check
  (destination is always sufficiently aligned, __text_poke() !NULL).

 arch/arm64/include/asm/module.h | 16 ++++++++++++++++
 arch/arm64/kernel/module-plts.c | 10 +++++++---
 arch/arm64/kernel/module.c      | 22 ++++++----------------
 3 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/module.h
index fb9b88eebeb1..4a1a47f8ba1a 100644
--- a/arch/arm64/include/asm/module.h
+++ b/arch/arm64/include/asm/module.h
@@ -6,6 +6,7 @@
 #define __ASM_MODULE_H
 
 #include <asm-generic/module.h>
+#include <asm/text-patching.h>
 
 struct mod_plt_sec {
 	int			plt_shndx;
@@ -29,6 +30,21 @@ u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
 u64 module_emit_veneer_for_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 				void *loc, u64 val);
 
+/*
+ * Write a relocation value to @place within a module.  While the module
+ * is MODULE_STATE_UNFORMED the destination is writable and a direct store
+ * is used; once the module is fully formed the region is read-only and
+ * executable, so the write is routed through the text-poke API.
+ */
+#define module_write_place(place, val, mod) do {			\
+	__typeof__(*place) __val = (val);				\
+									\
+	if (mod->state == MODULE_STATE_UNFORMED)			\
+		*(place) = __val;					\
+	else								\
+		aarch64_insn_copy(place, &(__val), sizeof(*place));	\
+} while (0)
+
 struct plt_entry {
 	/*
 	 * A program that conforms to the AArch64 Procedure Call Standard
diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-plts.c
index 7afd370da9f4..87d623789265 100644
--- a/arch/arm64/kernel/module-plts.c
+++ b/arch/arm64/kernel/module-plts.c
@@ -76,11 +76,13 @@ u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
 	int i = pltsec->plt_num_entries;
 	int j = i - 1;
 	u64 val = sym->st_value + rela->r_addend;
+	struct plt_entry entry;
 
 	if (is_forbidden_offset_for_adrp(&plt[i].adrp))
 		i++;
 
-	plt[i] = get_plt_entry(val, &plt[i]);
+	entry = get_plt_entry(val, &plt[i]);
+	module_write_place(&plt[i], entry, mod);
 
 	/*
 	 * Check if the entry we just created is a duplicate. Given that the
@@ -107,6 +109,7 @@ u64 module_emit_veneer_for_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 	int i = pltsec->plt_num_entries++;
 	u32 br;
 	int rd;
+	struct plt_entry entry;
 
 	if (WARN_ON(pltsec->plt_num_entries > pltsec->plt_max_entries))
 		return 0;
@@ -121,8 +124,9 @@ u64 module_emit_veneer_for_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 	br = aarch64_insn_gen_branch_imm((u64)&plt[i].br, (u64)loc + 4,
 					 AARCH64_INSN_BRANCH_NOLINK);
 
-	plt[i] = __get_adrp_add_pair(val, (u64)&plt[i], rd);
-	plt[i].br = cpu_to_le32(br);
+	entry = __get_adrp_add_pair(val, (u64)&plt[i], rd);
+	entry.br = cpu_to_le32(br);
+	module_write_place(&plt[i], entry, mod);
 
 	return (u64)&plt[i];
 }
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 24adb581af0e..595c358b4f0e 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -23,7 +23,6 @@
 #include <asm/insn.h>
 #include <asm/scs.h>
 #include <asm/sections.h>
-#include <asm/text-patching.h>
 
 enum aarch64_reloc_op {
 	RELOC_OP_NONE,
@@ -49,15 +48,6 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __le32 *place, u64 val)
 	return 0;
 }
 
-#define WRITE_PLACE(place, val, mod) do {				\
-	__typeof__(val) __val = (val);					\
-									\
-	if (mod->state == MODULE_STATE_UNFORMED)			\
-		*(place) = __val;					\
-	else								\
-		aarch64_insn_copy(place, &(__val), sizeof(*place));	\
-} while (0)
-
 static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len,
 		      struct module *me)
 {
@@ -77,7 +67,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len,
 
 	switch (len) {
 	case 16:
-		WRITE_PLACE((s16 *)place, sval, me);
+		module_write_place((s16 *)place, sval, me);
 		switch (op) {
 		case RELOC_OP_ABS:
 			if (sval < 0 || sval > U16_MAX)
@@ -93,7 +83,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len,
 		}
 		break;
 	case 32:
-		WRITE_PLACE((s32 *)place, sval, me);
+		module_write_place((s32 *)place, sval, me);
 		switch (op) {
 		case RELOC_OP_ABS:
 			if (sval < 0 || sval > U32_MAX)
@@ -109,7 +99,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len,
 		}
 		break;
 	case 64:
-		WRITE_PLACE((s64 *)place, sval, me);
+		module_write_place((s64 *)place, sval, me);
 		break;
 	default:
 		pr_err("Invalid length (%d) for data relocation\n", len);
@@ -157,7 +147,7 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction with the new encoding. */
 	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn, imm);
-	WRITE_PLACE(place, cpu_to_le32(insn), me);
+	module_write_place(place, cpu_to_le32(insn), me);
 
 	if (imm > U16_MAX)
 		return -ERANGE;
@@ -183,7 +173,7 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction's immediate field. */
 	insn = aarch64_insn_encode_immediate(imm_type, insn, imm);
-	WRITE_PLACE(place, cpu_to_le32(insn), me);
+	module_write_place(place, cpu_to_le32(insn), me);
 
 	/*
 	 * Extract the upper value bits (including the sign bit) and
@@ -224,7 +214,7 @@ static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 						   AARCH64_INSN_BRANCH_NOLINK);
 	}
 
-	WRITE_PLACE(place, cpu_to_le32(insn), me);
+	module_write_place(place, cpu_to_le32(insn), me);
 	return 0;
 }
 
-- 
2.20.1

