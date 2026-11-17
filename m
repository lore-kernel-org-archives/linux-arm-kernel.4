Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51F5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 04:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mAd1sezh;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HhTpG5/n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kFs/80gYHwfom96zMVyrkYRJPtYHxvqGrj500n9K69I=; b=mAd1sezhwYOFUFq6tniMfX+9RO
	4hAIj0Hjcm6v34YY7n5SnIAzC+geFXRvLnrPXC3AlGjFK5vmCpmfA57MzgARnwrQjGJOxz7fkwlDy
	BL3D1CUIVeUZoBWEVMzKbhDqh2A8kvOczGnWNKQgXRvbkKSSrDMhOVQ2WoZeFr49aqRtslBlFVn4F
	GR0OYp8LP/0t1QcOG3kqlhsUqwTlV0oNRPlr7AW8EMvVAGus6kdiVSkxUjq6EoqaQ7cVQvEIXs9Na
	JHuZq8aqw8aPL8sWQ/kqhyvRm7xT+HXYB2tY7D4toqxMN1w4m1xbzGf9gWkegIzwGZXahieYztLWZ
	vZIMMEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAvA-00000004YGS-4Aos;
	Tue, 17 Nov 2026 04:35:53 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAue-00000004Xsk-1uck
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 04:35:21 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2ed8aca9775so5834945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 20:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890119; x=1795494919; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFs/80gYHwfom96zMVyrkYRJPtYHxvqGrj500n9K69I=;
        b=HhTpG5/n4w7DVw+XRhb1hbRSZzRcEoadz+L9yq9aT8Uinfid/xVkV8m31xg8izCuHz
         D/O2wALiLYNBVevxykCP+j7ph/lyo19LIAHOV6oays5uNqFDH/6Gd9MyDZIlCHpDUnRe
         b3jP9VSyEBGExYBe0hYJuJ8vKYQn3h3dAq35T/0mOZb6b7o9C8cnFPU/UypnAS2ZQOF4
         /bSugIDPu98FwYwmEslKF6mfj3LjFHtm/Mhkk/US/uuWH86qXB3QIZ51KNSkByTj+0Yb
         YpoYcNVOKoUbxmvBCKh/LGX5oW5BYVP83I4yBRHa3VVeBp1ygVHxY3KQCy3iaHLyRn5T
         TVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890119; x=1795494919;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFs/80gYHwfom96zMVyrkYRJPtYHxvqGrj500n9K69I=;
        b=QD2Sqk1o1POWYi9uFrTQjps2Axn30xIdgw5Dan8bh0dSe4EsGUJwnHYqNeoZxM14H2
         b1G5fXbSmvBjGK8atUa6uFxvUN5dacE/r9TfaioY9WUtptI1A4AwWZ92zHNwitB+KJ7I
         vUWwMIowvOdfgLMvzUunpa5j9+QF+DyHhAXWB+EzvFDMV/99xgPwoyJ498bkmunD3lGq
         IRTd1slS2XPg2+smWvPyUixGTiFqf6+WmUf9nKtTO7tWMhFgM4sGe1+KcGXJpjOMmM8a
         xfuArtFJ39XUa3YpLa92T3ZRllLYqZdKupIo/wp4kxQJjh3rT42VBL9EFNPtNTmObQEk
         qSug==
X-Forwarded-Encrypted: i=1; AL+hErF8l3nbCSUzfzNPiQO/BVcxSv694t7DBzQlATU6SUy/snW62H8KO91MAfLP0thGgnk7jSMyBrTqUgs7+/dYlw2x@lists.infradead.org
X-Gm-Message-State: APuU4Z+jCEmtgip1F+UIbqHI4/QEddV/Q7rNCOolv9iWXYPQnRNcz+aX
	Rclsqb4AdXu6WF+heGhyZ+IFpGLOSe4IkZgALn0T0UcQDTnaHrvDNS9AODj2Vi38BwrCsIif5rc
	6mf93V3FQqY6euxU8b8Jy2TkZSA==
X-Received: from plpm2.prod.google.com ([2002:a17:903:3de2:b0:2e9:5b68:4b7d])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:dad2:b0:2ed:520:2641 with SMTP id d9443c01a7336-2efd9bcde77mr10423225ad.31.1794890118854;
 Mon, 16 Nov 2026 20:35:18 -0800 (PST)
Date: Tue, 17 Nov 2026 04:35:00 +0000
In-Reply-To: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117043504.1021063-9-dylanbhatch@google.com>
Subject: [RFC PATCH 08/12] arm64, unwind: add in-kernel .lr_unwind lookup and validation
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Weinan Liu <wnliu@google.com>, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Indu Bhagat <ibhagatgnu@gmail.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, live-patching@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_203520_530449_2D11157D 
X-CRM114-Status: GOOD (  26.71  )
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

Add runtime lookup and optional boot-time validation for the vmlinux
.lr_unwind_fde and .lr_unwind_ranges tables.

lr_unwind_find() binary searches the sorted .lr_unwind_fde table with
monotonic bounds checking, validates start IPs against arm64 kernel text
sections (.text, .init.text, .exit.text, and .rodata.text), and scans
the inline or out-of-line instruction ranges to determine the exception
boundary unwind mode (LR_UNWIND_LIVE, LR_UNWIND_FP, or LR_UNWIND_SP) and
any SP-relative frame-record offset.

Suggested-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/Kconfig                 |   9 +
 arch/arm64/include/asm/lr_unwind.h |  31 ++++
 arch/arm64/include/asm/sections.h  |   3 +
 arch/arm64/kernel/Makefile         |   5 +
 arch/arm64/kernel/lr_unwind.c      | 274 +++++++++++++++++++++++++++++
 arch/arm64/kernel/setup.c          |   3 +
 arch/arm64/kernel/vmlinux.lds.S    |   2 +
 7 files changed, 327 insertions(+)
 create mode 100644 arch/arm64/kernel/lr_unwind.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index aa09c7ea61be3..1503b8a0b7021 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2517,6 +2517,15 @@ config ARM64_LR_UNWIND
 	  live in x30, saved in the frame record at [x29], or saved in the
 	  frame record at an SP-relative offset).
 
+config ARM64_LR_UNWIND_VALIDATION
+	bool "Validate .lr_unwind sections at boot and module load"
+	depends on ARM64_LR_UNWIND
+	help
+	  Validate every FDE and range entry in .lr_unwind_fde and
+	  .lr_unwind_ranges when initializing vmlinux and module unwind
+	  tables. This is a debugging option that adds boot and module load
+	  overhead and should normally be disabled in production.
+
 config ARM64_CONTPTE
 	bool "Contiguous PTE mappings for user memory" if EXPERT
 	depends on TRANSPARENT_HUGEPAGE
diff --git a/arch/arm64/include/asm/lr_unwind.h b/arch/arm64/include/asm/lr_unwind.h
index 81c743994c4d5..bfb6abed05f76 100644
--- a/arch/arm64/include/asm/lr_unwind.h
+++ b/arch/arm64/include/asm/lr_unwind.h
@@ -108,4 +108,35 @@ static __always_inline void lr_fde_unpack_inline(u32 desc, lr_range_t ranges[4])
 #define LR_OOL_IDX(d)		(((d) >> 6) & LR_OOL_IDX_MAX)
 #define LR_OOL_COUNT(d)		((d) & LR_OOL_COUNT_MAX)
 
+#ifdef __KERNEL__
+
+#include <linux/errno.h>
+#include <linux/init.h>
+
+struct lr_unwind_section {
+	const struct lr_fde	*fdes;
+	unsigned int		num_fdes;
+	const lr_range_t	*ranges;
+	unsigned int		num_ranges;
+};
+
+#ifdef CONFIG_ARM64_LR_UNWIND
+
+void __init init_lr_unwind_table(void);
+int lr_unwind_find(unsigned long ip, enum lr_unwind_mode *mode,
+		   unsigned int *sp_off);
+
+#else /* !CONFIG_ARM64_LR_UNWIND */
+
+static inline void __init init_lr_unwind_table(void) {}
+static inline int lr_unwind_find(unsigned long ip, enum lr_unwind_mode *mode,
+				 unsigned int *sp_off)
+{
+	return -EINVAL;
+}
+
+#endif /* CONFIG_ARM64_LR_UNWIND */
+
+#endif /* __KERNEL__ */
+
 #endif /* __ASM_LR_UNWIND_H */
diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
index 51b0d594239eb..2f950aa28225f 100644
--- a/arch/arm64/include/asm/sections.h
+++ b/arch/arm64/include/asm/sections.h
@@ -23,6 +23,9 @@ extern char __irqentry_text_start[], __irqentry_text_end[];
 extern char __mmuoff_data_start[], __mmuoff_data_end[];
 extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
 extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
+extern char _srodatatext[], _erodatatext[];
+extern char __start_lr_unwind_fde[], __stop_lr_unwind_fde[];
+extern char __start_lr_unwind_ranges[], __stop_lr_unwind_ranges[];
 
 static inline size_t entry_tramp_text_size(void)
 {
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index fc5d1a0c38b3c..f07a0cead3ee3 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -18,12 +18,16 @@ CFLAGS_syscall.o	+= -fno-stack-protector
 # can significantly impact performance. Avoid instrumenting the stack trace
 # collection code to minimize this impact.
 KASAN_SANITIZE_stacktrace.o := n
+KASAN_SANITIZE_lr_unwind.o := n
+KCSAN_SANITIZE_lr_unwind.o := n
+UBSAN_SANITIZE_lr_unwind.o := n
 
 # It's not safe to invoke KCOV when portions of the kernel environment aren't
 # available or are out-of-sync with HW state. Since `noinstr` doesn't always
 # inhibit KCOV instrumentation, disable it for the entire compilation unit.
 KCOV_INSTRUMENT_entry-common.o := n
 KCOV_INSTRUMENT_idle.o := n
+KCOV_INSTRUMENT_lr_unwind.o := n
 
 # Softirq stack switching can run outside interrupt context.
 KCOV_INSTRUMENT_irq.o := n
@@ -71,6 +75,7 @@ obj-$(CONFIG_CRASH_DUMP)		+= crash_dump.o
 obj-$(CONFIG_VMCORE_INFO)		+= vmcore_info.o
 obj-$(CONFIG_ARM_SDE_INTERFACE)		+= sdei.o
 obj-$(CONFIG_ARM64_PTR_AUTH)		+= pointer_auth.o
+obj-$(CONFIG_ARM64_LR_UNWIND)		+= lr_unwind.o
 obj-$(CONFIG_ARM64_MPAM)		+= mpam.o
 obj-$(CONFIG_ARM64_MTE)			+= mte.o
 obj-y					+= vdso-wrap.o
diff --git a/arch/arm64/kernel/lr_unwind.c b/arch/arm64/kernel/lr_unwind.c
new file mode 100644
index 0000000000000..53e2c78a8bdaf
--- /dev/null
+++ b/arch/arm64/kernel/lr_unwind.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Kernel .lr_unwind lookup and validation
+ */
+
+#define pr_fmt(fmt)	"lr_unwind: " fmt
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/kprobes.h>
+#include <linux/limits.h>
+#include <linux/printk.h>
+
+#include <asm/lr_unwind.h>
+#include <asm/sections.h>
+
+static bool lr_unwind_init __ro_after_init;
+static struct lr_unwind_section kernel_lr_sec __ro_after_init;
+
+static const char *objname(const struct lr_unwind_section *sec)
+{
+	return "vmlinux";
+}
+
+#define dbg_sec(sec, fmt, ...) \
+	pr_debug("(%s): " fmt, objname(sec), ##__VA_ARGS__)
+
+static __always_inline unsigned long lr_fde_start_addr(const struct lr_fde *fde)
+{
+	return (unsigned long)&fde->start_offset + fde->start_offset;
+}
+
+static __always_inline bool is_kernel_ip_valid(unsigned long ip)
+{
+	if (ip >= (unsigned long)_stext && ip < (unsigned long)_etext)
+		return true;
+
+	if (system_state < SYSTEM_FREEING_INITMEM &&
+	    ip >= (unsigned long)_sinittext && ip < (unsigned long)_einittext)
+		return true;
+
+	/* .exit.text is retained in vmlinux on arm64. */
+	if (ip >= (unsigned long)__exittext_begin &&
+	    ip < (unsigned long)__exittext_end)
+		return true;
+
+	/*
+	 * .rodata.text is never executed from the kernel mapping, but it still
+	 * has unwind data.
+	 */
+	if (ip >= (unsigned long)_srodatatext &&
+	    ip < (unsigned long)_erodatatext)
+		return true;
+
+	return false;
+}
+
+static __always_inline bool is_sec_ip_valid(const struct lr_unwind_section *sec,
+					    unsigned long ip)
+{
+	return is_kernel_ip_valid(ip);
+}
+
+static __always_inline int __find_fde(const struct lr_unwind_section *sec,
+				      unsigned long ip,
+				      const struct lr_fde **fde_out)
+{
+	unsigned long func_addr_low = 0, func_addr_high = ULONG_MAX;
+	unsigned int low = 0, high = sec->num_fdes;
+	const struct lr_fde *found = NULL;
+
+	while (low < high) {
+		unsigned int mid = low + ((high - low) / 2);
+		const struct lr_fde *fde = &sec->fdes[mid];
+		unsigned long func_addr = lr_fde_start_addr(fde);
+
+		if (ip >= func_addr) {
+			if (func_addr < func_addr_low)
+				return -EFAULT;
+
+			func_addr_low = func_addr;
+			found = fde;
+			low = mid + 1;
+		} else {
+			if (func_addr > func_addr_high)
+				return -EFAULT;
+
+			func_addr_high = func_addr;
+			high = mid;
+		}
+	}
+
+	if (!found || !is_sec_ip_valid(sec, lr_fde_start_addr(found)))
+		return -EINVAL;
+
+	*fde_out = found;
+	return 0;
+}
+
+static __always_inline int __lr_unwind_find(const struct lr_unwind_section *sec,
+					    unsigned long ip,
+					    enum lr_unwind_mode *mode,
+					    unsigned int *sp_off)
+{
+	lr_range_t inline_ranges[4];
+	const lr_range_t *ranges;
+	const struct lr_fde *fde;
+	unsigned long insn_off;
+	u32 desc, cnt;
+	int ret;
+
+	if (ip & 0x3)
+		return -EINVAL;
+
+	ret = __find_fde(sec, ip, &fde);
+	if (ret)
+		return ret;
+
+	insn_off = (ip - lr_fde_start_addr(fde)) >> 2;
+	desc = fde->range_desc;
+
+	if (likely(desc & LR_FDE_INLINE)) {
+		lr_fde_unpack_inline(desc, inline_ranges);
+		ranges = inline_ranges;
+		cnt = 4;
+	} else {
+		u32 idx = LR_OOL_IDX(desc);
+
+		cnt = LR_OOL_COUNT(desc);
+		if (!cnt || idx + cnt > sec->num_ranges)
+			return -EFAULT;
+		ranges = &sec->ranges[idx];
+	}
+
+	for (u32 i = 0; i < cnt; i++) {
+		u32 len = LR_RANGE_LEN(ranges[i]);
+
+		if (insn_off < len) {
+			enum lr_unwind_mode m = LR_RANGE_MODE(ranges[i]);
+
+			if (unlikely(m > LR_UNWIND_SP))
+				return -EFAULT;
+			*mode = m;
+			*sp_off = LR_FDE_SP_OFF_BYTES(desc);
+			return 0;
+		}
+		insn_off -= len;
+	}
+
+	/* Make sure IP is not in an unannotated gap past this FDE */
+	return -EINVAL;
+}
+
+noinstr int lr_unwind_find(unsigned long ip, enum lr_unwind_mode *mode,
+			   unsigned int *sp_off)
+{
+	if (!mode || !sp_off)
+		return -EINVAL;
+
+	if (is_kernel_ip_valid(ip)) {
+		if (!lr_unwind_init)
+			return -EINVAL;
+
+		return __lr_unwind_find(&kernel_lr_sec, ip, mode, sp_off);
+	}
+
+	return -EINVAL;
+}
+NOKPROBE_SYMBOL(lr_unwind_find);
+
+#ifdef CONFIG_ARM64_LR_UNWIND_VALIDATION
+
+static int lr_unwind_validate_section(const struct lr_unwind_section *sec)
+{
+	unsigned long prev_end = 0;
+
+	for (unsigned int i = 0; i < sec->num_fdes; i++) {
+		const struct lr_fde *fde = &sec->fdes[i];
+		unsigned long ip = lr_fde_start_addr(fde);
+		u32 desc = fde->range_desc;
+		u32 total_insns = 0;
+
+		if ((ip & 0x3) || !is_sec_ip_valid(sec, ip)) {
+			dbg_sec(sec, "FDE %u invalid start IP 0x%lx\n", i, ip);
+			return -EINVAL;
+		}
+
+		if (ip < prev_end) {
+			dbg_sec(sec, "FDE %u unsorted or overlapping\n", i);
+			return -EFAULT;
+		}
+
+		if (desc & LR_FDE_INLINE) {
+			total_insns = LR_INLINE_R0(desc) +
+				      LR_INLINE_R1(desc) +
+				      LR_INLINE_R2(desc) +
+				      LR_INLINE_R3(desc);
+		} else {
+			u32 idx = LR_OOL_IDX(desc);
+			u32 cnt = LR_OOL_COUNT(desc);
+
+			if (!cnt || idx + cnt > sec->num_ranges) {
+				dbg_sec(sec, "FDE %u OOL range out of bounds\n", i);
+				return -EFAULT;
+			}
+			for (u32 j = 0; j < cnt; j++) {
+				lr_range_t r = sec->ranges[idx + j];
+				u32 len = LR_RANGE_LEN(r);
+
+				if (!len || LR_RANGE_MODE(r) > LR_UNWIND_SP) {
+					dbg_sec(sec, "FDE %u invalid OOL entry\n", i);
+					return -EINVAL;
+				}
+				total_insns += len;
+			}
+		}
+
+		if (!total_insns) {
+			dbg_sec(sec, "FDE %u has empty range\n", i);
+			return -EINVAL;
+		}
+
+		prev_end = ip + ((unsigned long)total_insns << 2);
+		if (!is_sec_ip_valid(sec, prev_end - 4)) {
+			dbg_sec(sec, "FDE %u end IP out of bounds\n", i);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+#else /* !CONFIG_ARM64_LR_UNWIND_VALIDATION */
+
+static int lr_unwind_validate_section(const struct lr_unwind_section *sec)
+{
+	return 0;
+}
+
+#endif /* CONFIG_ARM64_LR_UNWIND_VALIDATION */
+
+static void dbg_print_section(const struct lr_unwind_section *sec)
+{
+	dbg_sec(sec, "fdes:0x%lx (%u) ranges:0x%lx (%u)\n",
+		(unsigned long)sec->fdes, sec->num_fdes,
+		(unsigned long)sec->ranges, sec->num_ranges);
+}
+
+void __init init_lr_unwind_table(void)
+{
+	size_t fde_bytes = (unsigned long)__stop_lr_unwind_fde -
+			   (unsigned long)__start_lr_unwind_fde;
+	size_t range_bytes = (unsigned long)__stop_lr_unwind_ranges -
+			     (unsigned long)__start_lr_unwind_ranges;
+
+	if (!fde_bytes || (fde_bytes % sizeof(struct lr_fde)) ||
+	    (range_bytes % sizeof(lr_range_t))) {
+		pr_warn("invalid vmlinux .lr_unwind section sizes\n");
+		return;
+	}
+
+	kernel_lr_sec.fdes = (const struct lr_fde *)__start_lr_unwind_fde;
+	kernel_lr_sec.num_fdes = fde_bytes / sizeof(struct lr_fde);
+	kernel_lr_sec.ranges = (const lr_range_t *)__start_lr_unwind_ranges;
+	kernel_lr_sec.num_ranges = range_bytes / sizeof(lr_range_t);
+
+	if (lr_unwind_validate_section(&kernel_lr_sec)) {
+		pr_warn("invalid vmlinux .lr_unwind section\n");
+		return;
+	}
+
+	lr_unwind_init = true;
+	dbg_print_section(&kernel_lr_sec);
+}
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index a707deba6ae70..a19563e382ebd 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -43,6 +43,7 @@
 #include <asm/cpufeature.h>
 #include <asm/cpu_ops.h>
 #include <asm/kasan.h>
+#include <asm/lr_unwind.h>
 #include <asm/numa.h>
 #include <asm/scs.h>
 #include <asm/sections.h>
@@ -373,6 +374,8 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 			"This indicates a broken bootloader or old kernel\n",
 			boot_args[1], boot_args[2], boot_args[3]);
 	}
+
+	init_lr_unwind_table();
 }
 
 static inline bool cpu_can_disable(unsigned int cpu)
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index b8f2963d10030..dc6c4a041f691 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -256,12 +256,14 @@ SECTIONS
 
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
-- 
2.56.0.679.gc527c65306-goog


