Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760AA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M+HgFhox;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7XZKBhe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mb6zscB9xA65zKWgADOGhrqsQ/nGHmGTb9eOGjPV3Qo=; b=M+HgFhoxleU/6C
	+6nJRk3G6p1Y5ajNvWv17W+vpNyK4g+fAiDveXZDsfumA2wS6XTlHtlMBVvxcGUcSuwpl2uwosOhT
	/wf3TQYQ/4HAhUiuFZZ0UJIFqHSNSSYWSzHpvIolvbgcxDHvQlbda2Rc0GeNu6XZ7u4+y5F9t003N
	IuJmIvtwUgLtZz6/3a5OpSLQ1K1wQU6Dln2PjsnervowU9jkE1AHzomaoOQzL5F7mCTnRElaUgbw9
	bcwlZEn29247CP0ntv55EHGJIMZ3TiV89nFxTwZ6XqV2N/FnINA4lK25C0hOiD/cbbH6xNQPw6VpY
	0YTfkwmgilvkGdFWb1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPawG-0000000EKR3-0NhA;
	Sat, 07 Nov 2026 07:34:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPawC-0000000EKOo-3P11
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 07:34:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1742160F6B;
	Sat,  7 Nov 2026 07:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6821F0089F;
	Sat,  7 Nov 2026 07:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036847;
	bh=mb6zscB9xA65zKWgADOGhrqsQ/nGHmGTb9eOGjPV3Qo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e7XZKBheSrKbie5VnFexSeQbIOTBncXvr7lTKpAFdHOkLHTyzufBqIEvQc9/QUiZ8
	 bL0NQ6orZouqNfUCKfpZ93GbXCDENZP3lgZx7PEYSf5lLFHd5Bq9UYCUbBfFHXQg+x
	 OsAnvXdsQb7OPApbsT+etftmAEHezMs1DTCkZNlGpuF8bwSR7PFW/NFSpZ03yzXh6y
	 1KHmLi06/f4BWOxmc2z1ozGzpCSYF1c5a6f309R7NTf0wba/KhbLzfqP7cnjE828pi
	 RKrj7UhzORA2cvJwgMKPTkt0PKzzUB37T0ehen5rlXy5L2w/Gr8ikx2vFSsL8eQTMh
	 QyeG/kAuci3Ag==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH 4/4] arm64: alternatives: Make branch and ADRP offset helpers noinst
Date: Sat,  7 Nov 2026 15:13:39 +0800
Message-ID: <20261107071339.17467-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107071339.17467-1-jszhang@kernel.org>
References: <20261107071339.17467-1-jszhang@kernel.org>
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

patch_alternative() must avoid instrumented code while alternatives
are being modified, before cache maintenance completes. However, its
branch and ADRP offset helpers are instrumentable. A GCC build with
function tracing enabled emitted ftrace patchable entries for these
helpers.

Mark the four offset helpers noinstr. Introduce private
__always_inline immediate encoding and decoding implementations for
their use, and force inline the immediate mask helper.

The offset helpers pass constant encoding types, allowing the compiler
to eliminate invalid-type diagnostic paths. Keep the public immediate
helpers as wrappers to preserve diagnostics for other callers.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/arm64/lib/insn.c | 57 ++++++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index e70ac0238515..b98610fcab32 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -21,7 +21,7 @@
 #define AARCH64_INSN_N_BIT	BIT(22)
 #define AARCH64_INSN_LSL_12	BIT(22)
 
-static int __kprobes aarch64_get_imm_shift_mask(enum aarch64_insn_imm_type type,
+static __always_inline int aarch64_get_imm_shift_mask(enum aarch64_insn_imm_type type,
 						u32 *maskp, int *shiftp)
 {
 	u32 mask;
@@ -86,7 +86,12 @@ static int __kprobes aarch64_get_imm_shift_mask(enum aarch64_insn_imm_type type,
 #define ADR_IMM_LOSHIFT		29
 #define ADR_IMM_HISHIFT		5
 
-u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn)
+/*
+ * Keep the immediate helpers inline so noinstr callers using constant encoding
+ * types do not call instrumentable code, including the invalid-type diagnostics.
+ */
+static __always_inline u64
+__aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn)
 {
 	u32 immlo, immhi, mask;
 	int shift;
@@ -101,8 +106,8 @@ u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn)
 		break;
 	default:
 		if (aarch64_get_imm_shift_mask(type, &mask, &shift) < 0) {
-			pr_err("%s: unknown immediate encoding %d\n", __func__,
-			       type);
+			pr_err("%s: unknown immediate encoding %d\n",
+			       "aarch64_insn_decode_immediate", type);
 			return 0;
 		}
 	}
@@ -110,8 +115,14 @@ u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn)
 	return (insn >> shift) & mask;
 }
 
-u32 __kprobes aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
-				  u32 insn, u64 imm)
+u64 aarch64_insn_decode_immediate(enum aarch64_insn_imm_type type, u32 insn)
+{
+	return __aarch64_insn_decode_immediate(type, insn);
+}
+
+static __always_inline u32
+__aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
+			      u32 insn, u64 imm)
 {
 	u32 immlo, immhi, mask;
 	int shift;
@@ -131,8 +142,8 @@ u32 __kprobes aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
 		break;
 	default:
 		if (aarch64_get_imm_shift_mask(type, &mask, &shift) < 0) {
-			pr_err("%s: unknown immediate encoding %d\n", __func__,
-			       type);
+			pr_err("%s: unknown immediate encoding %d\n",
+			       "aarch64_insn_encode_immediate", type);
 			return AARCH64_BREAK_FAULT;
 		}
 	}
@@ -144,6 +155,12 @@ u32 __kprobes aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
 	return insn;
 }
 
+u32 __kprobes aarch64_insn_encode_immediate(enum aarch64_insn_imm_type type,
+					  u32 insn, u64 imm)
+{
+	return __aarch64_insn_encode_immediate(type, insn, imm);
+}
+
 u32 aarch64_insn_decode_register(enum aarch64_insn_register_type type,
 					u32 insn)
 {
@@ -1299,23 +1316,23 @@ u32 aarch64_insn_gen_adr(unsigned long pc, unsigned long addr,
  * signed value (so it can be used when computing a new branch
  * target).
  */
-s32 aarch64_get_branch_offset(u32 insn)
+s32 noinstr aarch64_get_branch_offset(u32 insn)
 {
 	s32 imm;
 
 	if (aarch64_insn_is_b(insn) || aarch64_insn_is_bl(insn)) {
-		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_26, insn);
+		imm = __aarch64_insn_decode_immediate(AARCH64_INSN_IMM_26, insn);
 		return (imm << 6) >> 4;
 	}
 
 	if (aarch64_insn_is_cbz(insn) || aarch64_insn_is_cbnz(insn) ||
 	    aarch64_insn_is_bcond(insn)) {
-		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_19, insn);
+		imm = __aarch64_insn_decode_immediate(AARCH64_INSN_IMM_19, insn);
 		return (imm << 13) >> 11;
 	}
 
 	if (aarch64_insn_is_tbz(insn) || aarch64_insn_is_tbnz(insn)) {
-		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_14, insn);
+		imm = __aarch64_insn_decode_immediate(AARCH64_INSN_IMM_14, insn);
 		return (imm << 18) >> 16;
 	}
 
@@ -1327,35 +1344,35 @@ s32 aarch64_get_branch_offset(u32 insn)
  * Encode the displacement of a branch in the imm field and return the
  * updated instruction.
  */
-u32 aarch64_set_branch_offset(u32 insn, s32 offset)
+u32 noinstr aarch64_set_branch_offset(u32 insn, s32 offset)
 {
 	if (aarch64_insn_is_b(insn) || aarch64_insn_is_bl(insn))
-		return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_26, insn,
+		return __aarch64_insn_encode_immediate(AARCH64_INSN_IMM_26, insn,
 						     offset >> 2);
 
 	if (aarch64_insn_is_cbz(insn) || aarch64_insn_is_cbnz(insn) ||
 	    aarch64_insn_is_bcond(insn))
-		return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_19, insn,
+		return __aarch64_insn_encode_immediate(AARCH64_INSN_IMM_19, insn,
 						     offset >> 2);
 
 	if (aarch64_insn_is_tbz(insn) || aarch64_insn_is_tbnz(insn))
-		return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_14, insn,
+		return __aarch64_insn_encode_immediate(AARCH64_INSN_IMM_14, insn,
 						     offset >> 2);
 
 	/* Unhandled instruction */
 	BUG();
 }
 
-s32 aarch64_insn_adrp_get_offset(u32 insn)
+s32 noinstr aarch64_insn_adrp_get_offset(u32 insn)
 {
 	BUG_ON(!aarch64_insn_is_adrp(insn));
-	return aarch64_insn_decode_immediate(AARCH64_INSN_IMM_ADR, insn) << 12;
+	return __aarch64_insn_decode_immediate(AARCH64_INSN_IMM_ADR, insn) << 12;
 }
 
-u32 aarch64_insn_adrp_set_offset(u32 insn, s32 offset)
+u32 noinstr aarch64_insn_adrp_set_offset(u32 insn, s32 offset)
 {
 	BUG_ON(!aarch64_insn_is_adrp(insn));
-	return aarch64_insn_encode_immediate(AARCH64_INSN_IMM_ADR, insn,
+	return __aarch64_insn_encode_immediate(AARCH64_INSN_IMM_ADR, insn,
 						offset >> 12);
 }
 
-- 
2.55.0


