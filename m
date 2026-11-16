Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ABB606A891
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uMscVFod;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=e61tIZOM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pCsucusy5Q8jpwQ3lEi+hBjDs122mEucCSPBC/CnbEo=; b=uMscVFodZwsgRk
	2n/zDyHNdkyMb526efdkqHKOLP51zB5QWIbGRghSgB7WKCRpn1tjrrl75rj5A961FQV7I8+zd5aw6
	8/fwywG9Y8UPwQoVNlIfTf2QUR7gamR+NtGDji/7E8v9yqoiwZMUv75a0BTPIFo+ODq6NCoDvZQsg
	6rm+hlU+k20IyzrThy3a/9TZ23gh+fxEVryZCD6RkJ+EB2iZrCZ9bGpAn3VySWv72KTefLmOUxEiI
	oeVjjvxuhN2fUlzitMe9hE3oV+f0kni+Ny8VMPB6/mn9jha6JJ6CG4TThbk0z50GZed/qDBsihNQ1
	6qiI+2HcBYi9JB8dXAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrBu-00000001PaK-1hlO;
	Mon, 16 Nov 2026 07:31:50 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrBn-00000001PX3-1R0i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pC
	sucusy5Q8jpwQ3lEi+hBjDs122mEucCSPBC/CnbEo=; b=e61tIZOMm+t0xhQop3
	ZKE8TRUbyQ69bXovJ6XuRJz/MTRBWVE59I0A21MqsLnqoFpkx6REGPDEzufFveWa
	c/K3jQQA8L57hFHe1YE1hX/kv9JWDKvhKwR4Ux3XMWNVMWqbqCFso6QMF8+w73nQ
	7yxKyW9wVLrcZ39F6FIX37zl0=
Received: from mm (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDnB4dFsfpqIKNJFg--.7882S4;
	Mon, 16 Nov 2026 15:31:22 +0800 (CST)
From: Qi Xi <xiqi5703@163.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Niu <benniu@meta.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	wangkefeng.wang@huawei.com,
	sunnanyong@huawei.com,
	xiqi2@huawei.com
Subject: [PATCH v4 2/2] arm64: copy_from_user: use privileged LDP/STP for large copies
Date: Mon, 16 Nov 2026 15:25:12 +0800
Message-ID: <20261116072512.1323883-3-xiqi5703@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116072512.1323883-1-xiqi5703@163.com>
References: <20261116072512.1323883-1-xiqi5703@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgDnB4dFsfpqIKNJFg--.7882S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFW5tr47JFyfJrWxZFyxKrg_yoW7XF45pw
	4rCwsxKrsrWF18C3sxX3W7XrZYya1fWF15uFn7Wr4Y9ry2gryUKF1fG39I9rZ7GF42gw4f
	ua1FgFy5XFn0q3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jVGQhUUUUU=
X-CM-SenderInfo: 50ltxkqxqtqiywtou0bp/xtbC7grXDmr6sUq+dwAA3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_233143_828663_5080D1B8 
X-CRM114-Status: GOOD (  16.32  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Qi Xi <xiqi2@huawei.com>

For copies of 4096 bytes or more, __arch_copy_from_user_opt() toggles
PSTATE.PAN, allowing it to use privileged LDP instead of LDTR,
together with the offset-addressed loop from copy_template.S.  Smaller
copies keep using the original code.

copy_to_user is left unchanged.  Using privileged stores there would
need the same PAN toggle, but a PAN update in the middle of the
user-side store stream breaks hardware write streaming, which costs
more than the paired stores save.

Signed-off-by: Qi Xi <xiqi2@huawei.com>
---
 arch/arm64/lib/Makefile             |   2 +-
 arch/arm64/lib/copy_from_user.S     |   8 ++
 arch/arm64/lib/copy_from_user_opt.S | 114 ++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/lib/copy_from_user_opt.S

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 38ffd359123c..b7c1c579aec0 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -4,7 +4,7 @@
 KCSAN_SANITIZE_delay.o := n
 
 lib-y		:= clear_user.o delay.o copy_from_user.o		\
-		   copy_to_user.o copy_page.o				\
+		   copy_from_user_opt.o copy_to_user.o copy_page.o	\
 		   csum.o insn.o memchr.o memcpy.o			\
 		   memset.o memcmp.o strcmp.o strncmp.o strlen.o	\
 		   strnlen.o strchr.o strrchr.o tishift.o
diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
index 400057d607ec..ec23066c2a37 100644
--- a/arch/arm64/lib/copy_from_user.S
+++ b/arch/arm64/lib/copy_from_user.S
@@ -64,6 +64,12 @@ srcin	.req	x15
 SYM_FUNC_START(__arch_copy_from_user)
 	add	end, x0, x2
 	mov	srcin, x1
+	/*
+	 * Use the privileged LDP/STP path for large copies.  Below 4096
+	 * bytes the PAN toggle costs more than it saves.
+	 */
+	cmp	x2, #4096
+	b.hs	9002f
 #include "copy_template.S"
 	mov	x0, #0				// Nothing to copy
 	ret
@@ -79,5 +85,7 @@ USER(9998f, ldtrb tmp1w, [srcin])
 	strb	tmp1w, [dst], #1
 9998:	sub	x0, end, dst			// bytes not copied
 	ret
+
+9002:	b	__arch_copy_from_user_opt
 SYM_FUNC_END(__arch_copy_from_user)
 EXPORT_SYMBOL(__arch_copy_from_user)
diff --git a/arch/arm64/lib/copy_from_user_opt.S b/arch/arm64/lib/copy_from_user_opt.S
new file mode 100644
index 000000000000..2c0e3cb4798a
--- /dev/null
+++ b/arch/arm64/lib/copy_from_user_opt.S
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Huawei Ltd.
+ */
+
+#include <linux/linkage.h>
+
+#include <asm/asm-uaccess.h>
+#include <asm/assembler.h>
+#include <asm/cache.h>
+
+#define COPY_TEMPLATE_PAIRS
+
+	.macro ldrb1 reg, ptr, val
+	user_ldst 9998f, ldtrb, \reg, \ptr, \val
+	.endm
+
+	.macro strb1 reg, ptr, val
+	strb \reg, [\ptr], \val
+	.endm
+
+	.macro ldrh1 reg, ptr, val
+	user_ldst 9997f, ldtrh, \reg, \ptr, \val
+	.endm
+
+	.macro strh1 reg, ptr, val
+	strh \reg, [\ptr], \val
+	.endm
+
+	.macro ldr1 reg, ptr, val
+	user_ldst 9997f, ldtr, \reg, \ptr, \val
+	.endm
+
+	.macro str1 reg, ptr, val
+	str \reg, [\ptr], \val
+	.endm
+
+	.macro ldp1 reg1, reg2, ptr, val
+	user_ldp 9997f, \reg1, \reg2, \ptr, \val
+	.endm
+
+	.macro stp1 reg1, reg2, ptr, val
+	stp \reg1, \reg2, [\ptr], \val
+	.endm
+
+	.macro ldp2 reg1, reg2, ptr, val, fixup
+8888:	ldp \reg1, \reg2, [\ptr, \val]
+	_asm_extable_uaccess 8888b, \fixup
+	.endm
+
+	.macro stp2 reg1, reg2, ptr, val
+	stp \reg1, \reg2, [\ptr, \val]
+	.endm
+
+	.macro cpy1 dst, src, count
+	.arch_extension mops
+	USER_CPY(9997f, 0, cpyfprt [\dst]!, [\src]!, \count!)
+	USER_CPY(9996f, 0, cpyfmrt [\dst]!, [\src]!, \count!)
+	USER_CPY(9996f, 0, cpyfert [\dst]!, [\src]!, \count!)
+	.endm
+
+end	.req	x5
+srcin	.req	x15
+SYM_FUNC_START(__arch_copy_from_user_opt)
+	add	end, x0, x2
+	mov	srcin, x1
+
+#ifdef CONFIG_KASAN_HW_TAGS
+	/*
+	 * KASAN enables tag checking for EL1 accesses (SCTLR_EL1.TCF)
+	 * while the user's TCF0 mode may have checking disabled.
+	 * Suppress it for the copy, as uaccess_enable_privileged() does.
+	 */
+	ALTERNATIVE("nop", __stringify(SET_PSTATE_TCO(1)), ARM64_MTE)
+#endif
+	/*
+	 * PSTATE.PAN blocks EL1 access to user memory, so clear it for
+	 * the privileged LDP/STP below and restore it on exit.
+	 */
+	ALTERNATIVE("nop", __stringify(SET_PSTATE_PAN(0)), ARM64_HAS_PAN)
+
+#include "copy_template.S"
+
+	mov	x0, #0				// Nothing to copy
+
+.L__arch_copy_from_user_opt_exit:
+#ifdef CONFIG_KASAN_HW_TAGS
+	ALTERNATIVE("nop", __stringify(SET_PSTATE_TCO(0)), ARM64_MTE)
+#endif
+	ALTERNATIVE("nop", __stringify(SET_PSTATE_PAN(1)), ARM64_HAS_PAN)
+	ret
+
+	// Exception fixups
+.Lcopy_opt_fixup64:
+	add	dst, dst, #16
+.Lcopy_opt_fixup48:
+	add	dst, dst, #16
+.Lcopy_opt_fixup32:
+	add	dst, dst, #16
+.Lcopy_opt_fixup16:
+	add	dst, dst, #16
+	b	9998f
+
+9996:	b.cs	9997f
+	// Registers are in Option A format
+	add	dst, dst, count
+9997:	cmp	dst, dstin
+	b.ne	9998f
+	// Before being absolutely sure we couldn't copy anything, try harder
+USER(9998f, ldtrb tmp1w, [srcin])
+	strb	tmp1w, [dst], #1
+9998:	sub	x0, end, dst			// bytes not copied
+	b	.L__arch_copy_from_user_opt_exit
+SYM_FUNC_END(__arch_copy_from_user_opt)
-- 
2.53.0


