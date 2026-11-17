Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C41606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MZP0WSHf;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V6dIxl9g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F/Wol9k3USBeEqH+PNSDq/iNuPWkX6BY1YLwxrQ5T8w=; b=MZP0WSHfJg/01DeLqei6UqwnJ3
	rhPa9V6DzxS/6Z7hTBp3DxRCH2ebKyLOZIuQeQomiuCj17VLhvZWuSfFiemcJ28SEx6NLSPb7TXBU
	dEq5c6CBubA0BVTq0PeI8s7kJrkDYYTLD6SFuA9qnkpEjEHsWoqM7kESddTW8XRbG22Gi5/azIwdZ
	jz3h+F2EdZkts03Ebyb9RmY/UBWRAh2cL69/l1AOBERdBrPswZRUyL30T0D8MT/+wl/9yKVJgxFBe
	PqEl45o79+p4dOi2kLNqmj5KHfotcH4W9yPOz/kixTI+4UpPzuseaMhX+s1GibIqmJyM/yf845ZWK
	11f4Eu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bC-00000004MNv-3GC3;
	Tue, 17 Nov 2026 02:07:06 +0000
Received: from mail-pj1-x1045.google.com ([2607:f8b0:4864:20::1045])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8b8-00000004MKA-40hp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:07:04 +0000
Received: by mail-pj1-x1045.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so3083322a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881222; x=1795486022; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/Wol9k3USBeEqH+PNSDq/iNuPWkX6BY1YLwxrQ5T8w=;
        b=V6dIxl9gcNkXpPwZRCROtJ4IBFkUllxWbF+tI5222PzqGLBwMVXkiSu3TUOJBTBCnX
         PazLLSBwr9wkYy482wutQOhCiS6xd/IT1yOfnX9yzB84YQt6voWHIPOJrKf67wTIRGVS
         +GOulMEMj+1qGZfcfSZ+mrROmxnH7ISDYQ6+qc/UHgZAsxCBPu1pruy1zpug+XyVutuZ
         9ZIrMeXE9+79+SWuTrAyveWkbg/kD5vHz5nTDK/gYs9RzuhQpiAjKNxw/W+ub3FKEefk
         lwhcMcLNPEgEbL3m9ej7bDowH0xrTIuzCGCf7z6AcQT4fmzkY0AmkpS2Q/hAiW/o/4UU
         8HkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881222; x=1795486022;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/Wol9k3USBeEqH+PNSDq/iNuPWkX6BY1YLwxrQ5T8w=;
        b=E7fzT7L7wD9BkNCznMgoFkXZIdXYyqb9H3XT+bDetisHBg0xci4upslnYDwB43ACR/
         DeI3Esc/R/f9ds4Hb89QJ5L6WBQo1A5DEQ01JhtP0+9k4qI8WKKaJjANIhwSsZew7u+V
         JPPK2Z5uRkjdM3+4dbDM6PWY+sBMJqRaqfLH956YBjFLGqPgqMS7WFz85JnTRkW/RQ9G
         7tVZoZouiZGlYd0ts/kWZmaINOYddfb0Jgq8P8x09mD1D2evXKELIleD1aecMLWyWPOx
         bgnE5d64mjQ/F0Zechuy6NORCaLtqyMyNbhPY/1XL35g/cs/Eoxydh4xagIbv6TBSkrp
         QMUQ==
X-Forwarded-Encrypted: i=1; AL+hErFopLfxVNWrg36CrJVjKzNqK/rGg/tZfCpWquycVFoFgGeIFKJxE+iuo83sk0W7ndBJwHCQhDUEk+NxmDlOw/r2@lists.infradead.org
X-Gm-Message-State: APuU4Z82gG8XFZaS5VhbNo/3XQyCoVCbppsKmJfVmp7ZLjhQUdeui5Jn
	UxXcKJVGSrL9ystVFKSuepwWizXCE1vJtyf0P1sbngclEhIcwjA13kelZGDY8NINwaAElcCnyEu
	pH5MtZ4cu4bECT7v6hZ1JLSj9Ag==
X-Received: from pjbee16.prod.google.com ([2002:a17:90a:fc50:b0:3b3:863e:dcce])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b88:b0:3ac:80de:44e8 with SMTP id 98e67ed59e1d1-3b1b0ccc955mr13158300a91.43.1794881221661;
 Mon, 16 Nov 2026 18:07:01 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:43 +0000
In-Reply-To: <20261117020648.323464-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117020648.323464-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117020648.323464-7-dylanbhatch@google.com>
Subject: [PATCH v9 06/11] arm64/sframe: Validate IP addresses
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_180703_008093_7305EAC9 
X-CRM114-Status: GOOD (  27.60  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Validate the given IP and computed function start address against the
known vmlinux and module text address ranges.

This requires arch-specific validation for vmlinux. This is because
arm64 keeps .exit.text (normally discarded) and .rodata.text, both of
both of which lie outside the bounds of .text and .init.text. Note that
.rodata.text contains code that is never executed by the kernel mapping,
but for which the toolchain nonetheless generates sframe data, and needs
to be considered valid at lookup time.

Suggested-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v8:
 - (sashiko) Mark is_kernel_inittext(), __is_kernel_text(), and
   within_module_mem_type() as __always_inline for noinstr sframe_find().
 - (sashiko) Move <asm/unwind_sframe.h> include in sframe.c to this
   patch, add generic include/asm-generic/unwind_sframe.h fallback, and
   add unwind_sframe.h file patterns to MAINTAINERS.
---
 MAINTAINERS                            |  2 ++
 arch/arm64/include/asm/sections.h      |  1 +
 arch/arm64/include/asm/unwind_sframe.h | 32 +++++++++++++++++++
 arch/arm64/kernel/vmlinux.lds.S        |  2 ++
 include/asm-generic/Kbuild             |  1 +
 include/asm-generic/sections.h         |  4 +--
 include/asm-generic/unwind_sframe.h    |  5 +++
 include/linux/module.h                 |  6 ++--
 kernel/unwind/sframe.c                 | 44 +++++++++++++++++++++++++-
 9 files changed, 91 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h
 create mode 100644 include/asm-generic/unwind_sframe.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 16e7ab1aea164..dd73e45218531 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26643,6 +26643,8 @@ STACK UNWINDING
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
 M:	Steven Rostedt <rostedt@goodmis.org>
 S:	Maintained
+F:	arch/*/include/asm/unwind_sframe.h
+F:	include/asm-generic/unwind_sframe.h
 F:	include/linux/sframe.h
 F:	include/linux/unwind*.h
 F:	kernel/unwind/
diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
index 51b0d594239eb..5edb4304f661e 100644
--- a/arch/arm64/include/asm/sections.h
+++ b/arch/arm64/include/asm/sections.h
@@ -23,6 +23,7 @@ extern char __irqentry_text_start[], __irqentry_text_end[];
 extern char __mmuoff_data_start[], __mmuoff_data_end[];
 extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
 extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
+extern char _srodatatext[], _erodatatext[];
 
 static inline size_t entry_tramp_text_size(void)
 {
diff --git a/arch/arm64/include/asm/unwind_sframe.h b/arch/arm64/include/asm/unwind_sframe.h
new file mode 100644
index 0000000000000..1b45d328c746f
--- /dev/null
+++ b/arch/arm64/include/asm/unwind_sframe.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_UNWIND_SFRAME_H
+#define _ASM_ARM64_UNWIND_SFRAME_H
+
+#include <linux/module.h>
+#include <linux/sframe.h>
+#include <asm/sections.h>
+
+static __always_inline bool sframe_is_kernel_ip_valid(unsigned long ip)
+{
+	if (__is_kernel_text(ip) || is_kernel_inittext(ip))
+		return true;
+
+	/* .exit.text is retained in vmlinux on arm64. */
+	if (ip >= (unsigned long)__exittext_begin &&
+	    ip < (unsigned long)__exittext_end)
+		return true;
+
+	/*
+	 * .rodata.text is never executed from the kernel mapping, but it still
+	 * has sframe data.
+	 */
+	if (ip >= (unsigned long)_srodatatext &&
+	    ip < (unsigned long)_erodatatext)
+		return true;
+
+	return false;
+}
+
+#define sframe_is_kernel_ip_valid sframe_is_kernel_ip_valid
+
+#endif /* _ASM_ARM64_UNWIND_SFRAME_H */
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 3cfa62249d0b4..62534cc9771a0 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -245,12 +245,14 @@ SECTIONS
 
 	/* code sections that are never executed via the kernel mapping */
 	.rodata.text : {
+		_srodatatext = .;
 		TRAMP_TEXT
 		HIBERNATE_TEXT
 		KEXEC_TEXT
 		IDMAP_TEXT
 		. = ALIGN(PAGE_SIZE);
 	}
+	_erodatatext = .;
 
 	idmap_pg_dir = .;
 	. += PAGE_SIZE;
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index b7a388bef6ea0..9230bd7878ef8 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -61,6 +61,7 @@ mandatory-y += tlbflush.h
 mandatory-y += topology.h
 mandatory-y += trace_clock.h
 mandatory-y += uaccess.h
+mandatory-y += unwind_sframe.h
 mandatory-y += unwind_user.h
 mandatory-y += vdso/clocksource.h
 mandatory-y += vdso/vsyscall.h
diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index 336d27011a580..c9b0cec9990c1 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -197,7 +197,7 @@ static inline bool is_kernel_ro_after_init(unsigned long addr)
  *
  * Returns: true if the address is located in .init.text, false otherwise.
  */
-static inline bool is_kernel_inittext(unsigned long addr)
+static __always_inline bool is_kernel_inittext(unsigned long addr)
 {
 	return addr >= (unsigned long)_sinittext &&
 	       addr < (unsigned long)_einittext;
@@ -212,7 +212,7 @@ static inline bool is_kernel_inittext(unsigned long addr)
  * Returns: true if the address is located in .text, false otherwise.
  * Note: an internal helper, only check the range of _stext to _etext.
  */
-static inline bool __is_kernel_text(unsigned long addr)
+static __always_inline bool __is_kernel_text(unsigned long addr)
 {
 	return addr >= (unsigned long)_stext &&
 	       addr < (unsigned long)_etext;
diff --git a/include/asm-generic/unwind_sframe.h b/include/asm-generic/unwind_sframe.h
new file mode 100644
index 0000000000000..f71b3b0f53db9
--- /dev/null
+++ b/include/asm-generic/unwind_sframe.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_UNWIND_SFRAME_H
+#define _ASM_GENERIC_UNWIND_SFRAME_H
+
+#endif /* _ASM_GENERIC_UNWIND_SFRAME_H */
diff --git a/include/linux/module.h b/include/linux/module.h
index 6793e9feb20a5..964f727a65ff3 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -628,9 +628,9 @@ bool __is_module_percpu_address(unsigned long addr, unsigned long *can_addr);
 bool is_module_percpu_address(unsigned long addr);
 bool is_module_text_address(unsigned long addr);
 
-static inline bool within_module_mem_type(unsigned long addr,
-					  const struct module *mod,
-					  enum mod_mem_type type)
+static __always_inline bool within_module_mem_type(unsigned long addr,
+						   const struct module *mod,
+						   enum mod_mem_type type)
 {
 	unsigned long base, size;
 
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 55b7838bdd485..d5c1c8148dadd 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -16,6 +16,7 @@
 #include <linux/kallsyms.h>
 #include <asm/kprobes.h>
 #include <asm/sections.h>
+#include <asm/unwind_sframe.h>
 
 #include "sframe.h"
 
@@ -45,6 +46,45 @@ struct sframe_fre_internal {
 	unsigned char	dw_size;
 };
 
+#ifndef sframe_is_kernel_ip_valid
+
+static __always_inline bool sframe_is_kernel_ip_valid(unsigned long ip)
+{
+	return __is_kernel_text(ip) || is_kernel_inittext(ip);
+}
+
+#endif
+
+#ifdef CONFIG_MODULES
+
+static __always_inline bool sframe_is_sec_module_ip_valid(struct sframe_section *sec,
+							  unsigned long ip)
+{
+	struct module *mod = container_of(sec, struct module, sframe_sec);
+
+	return within_module_mem_type(ip, mod, MOD_TEXT) ||
+		within_module_mem_type(ip, mod, MOD_INIT_TEXT);
+}
+
+#else
+
+static __always_inline bool sframe_is_sec_module_ip_valid(struct sframe_section *sec,
+							  unsigned long ip)
+{
+	return false;
+}
+
+#endif
+
+static __always_inline bool is_sec_ip_valid(struct sframe_section *sec,
+					    unsigned long ip)
+{
+	if (sec == &kernel_sfsec)
+		return sframe_is_kernel_ip_valid(ip);
+
+	return sframe_is_sec_module_ip_valid(sec, ip);
+}
+
 static __always_inline unsigned char fre_type_to_size(unsigned char fre_type)
 {
 	if (fre_type > 2)
@@ -72,6 +112,8 @@ static __always_inline int __read_fde(struct sframe_section *sec,
 	_fde = (struct sframe_fde_v3 *)fde_addr;
 
 	func_addr = fde_addr + _fde->func_start_off;
+	if (!is_sec_ip_valid(sec, func_addr))
+		return -EINVAL;
 
 	if (check_add_overflow(sec->fres_start, _fde->fres_off, &fda_addr) ||
 	    check_add_overflow(fda_addr, sizeof(struct sframe_fda_v3), &fres_addr) ||
@@ -455,7 +497,7 @@ noinstr int sframe_find(unsigned long ip, struct unwind_frame *frame)
 	if (!frame)
 		return -EINVAL;
 
-	if (__is_kernel_text(ip) || is_kernel_inittext(ip)) {
+	if (sframe_is_kernel_ip_valid(ip)) {
 		if (!sframe_init)
 			return -EINVAL;
 
-- 
2.56.0.679.gc527c65306-goog


