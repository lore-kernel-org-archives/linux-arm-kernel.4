Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3761606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kzbaYmxk;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hnqNEugK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2wsQrrlhB0v7sTQLhfx5fhENxJu9/JJiYMMkbrhfnx8=; b=kzbaYmxkh62tIFOqpnkFhxjsjX
	mNklkSFurPOmvex2AZkTxWs9Jsuw78Q4uc3eBepes2ND5yAZa/bNrLBKTeDHBMHG9ByKTgygPy1VV
	xuS61sbmZB32ArRPTi2x4F3eZsVBeZh3bmpyS7wBFOTqBvo/S+GA/biO5xi+ssFQOUpE5Y6IT1Uc0
	+7XZgc4hpySslxtbgesnd1ut94kKGN0WCTZTWtDqY8YHdEjZlQCnxKyRhUTefTMgE/5UsZ6Y9zgVu
	3gQ49DS5sf+mXFweBjupUm//wgEq1DKILoAoJFNRCE30/kJq85vlXZo++7yPcI+Er3mgP5+2ngem/
	wwCAp/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bB-00000004MM4-3hYr;
	Tue, 17 Nov 2026 02:07:05 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8b3-00000004MGH-1zuj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:06:58 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so2475825a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881216; x=1795486016; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wsQrrlhB0v7sTQLhfx5fhENxJu9/JJiYMMkbrhfnx8=;
        b=hnqNEugKy9NlM1XznU1eMbyu9lSvcEKXoBAum0LZbT24/ZKL+9yoJsPgKPX45fUvwO
         5FZlqW0Fowdilcu53mWyyhVQ3Pjp/LlRK2MsVKPHdeKRlD7kYNJ2YYDoz2g0WSldjuMn
         Nsw/dQuavUF09WqrPIfH6lgLtpC5d+CMdLvOZYULTnxWGLQbWQ/fgez8KIr0vChhvIf5
         AswppnFMLcocgnwJFnMgriAo/hkWn7rQHIB9oivz9FfmImkL6ePDZ4WrjFRBSOH2aGUM
         D3KZ0D4bgL6Kd1HaudnbkFXU+4x5i3F8fhbAadBzFsFHQx8oJuE1dFWh3KZR8uSg1SiV
         jA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881216; x=1795486016;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wsQrrlhB0v7sTQLhfx5fhENxJu9/JJiYMMkbrhfnx8=;
        b=1yEKA2GixB0N6S7wPWghSaTvRE18qAh/H/WQtb/1UnX0xYnONg/8kO1EGGPgXYAcjM
         5K2IMhhHQ1jIy5gOiDEV7luWulsS/Hw7dc+4KMps5n81rQKb1z7/qX2Paw3aLne1Wx6r
         wkHXSgpjSTQfvfShTk+SVBIzReDPML23uqUcd2f3+2xK1SEWogdmmLrpPsjXpL4S6dNO
         y/cnFHyf+6dnN6cvGO0PqH2AXAQSpptNTpVOhWYAPeZHMyCwW7oT4bFPn5M1jjE0H+Bo
         LmJE0nxOq2NE+JZsyMsHbW2e8FBxc0D4cBMxjTfdoFkDZcC3cU4eSIh3uxROkGOS9gUi
         OrAQ==
X-Forwarded-Encrypted: i=1; AL+hErFDFQ4dIoEgoSUstsiXgTfERjRdQzXBnnCAzV/Xod99hx34OJDKE4U/Be6E6YmT2pNhuS2Sln+ZNHqi79vSfYcg@lists.infradead.org
X-Gm-Message-State: APuU4Z83jI3D3wGXjFLNExEY2xWfMqhvhYO91CZNYPLIzJxVmi4Lo+nN
	TBPuhIchdmGX4dMInXWvPAX9X9nW/mjtmyJcIHPVCH03aLJiy7r6jXr5NDA/g0i78a7mhAaCQCz
	9I1EcMDXswKOQc4HZL9c1JzNmaw==
X-Received: from pjor10.prod.google.com ([2002:a17:90a:940a:b0:3b0:944b:61fe])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1c07:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3b1b0dd0b7emr11996032a91.67.1794881215620;
 Mon, 16 Nov 2026 18:06:55 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:39 +0000
In-Reply-To: <20261117020648.323464-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117020648.323464-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117020648.323464-3-dylanbhatch@google.com>
Subject: [PATCH v9 02/11] arm64/sframe: Read vmlinux .sframe header
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
X-CRM114-CacheID: sfid-20261116_180657_528556_8A2A6B90 
X-CRM114-Status: GOOD (  23.61  )
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

From: Josh Poimboeuf <jpoimboe@kernel.org>

In preparation for unwinding kernel space stacks with sframe, add basic
sframe compile infrastructure and support for reading the .sframe
section header. Add init_sframe_table() to read the vmlinux .sframe
header at boot.

[ Jens Remus: Add support for SFrame V3.  Add support for PC-relative
FDE function start offset.  Cleanup includes and indentation. ]

[ Dylan Hatch: Repurpose patch for arm64 vmlinux. ]

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Reviewed-by: Indu Bhagat <ibhagatgnu@gmail.com>
Co-developed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Jens Remus <jremus@linux.ibm.com>
Co-developed-by: Dylan Hatch <dylanbhatch@google.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v8:
 - (sashiko) Use check_add_overflow() and check_mul_overflow() in
   sframe_read_header() to prevent integer overflow on section bounds.
---
 MAINTAINERS               |  1 +
 arch/arm64/kernel/setup.c |  2 +
 include/linux/sframe.h    | 32 ++++++++++++++++
 kernel/unwind/Makefile    |  9 ++++-
 kernel/unwind/sframe.c    | 80 +++++++++++++++++++++++++++++++++++++++
 kernel/unwind/sframe.h    | 78 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 201 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/sframe.h
 create mode 100644 kernel/unwind/sframe.c
 create mode 100644 kernel/unwind/sframe.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 92e13caa85d07..16e7ab1aea164 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26643,6 +26643,7 @@ STACK UNWINDING
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
 M:	Steven Rostedt <rostedt@goodmis.org>
 S:	Maintained
+F:	include/linux/sframe.h
 F:	include/linux/unwind*.h
 F:	kernel/unwind/
 
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index a707deba6ae70..0e460c020e361 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -33,6 +33,7 @@
 #include <linux/sched/task.h>
 #include <linux/scs.h>
 #include <linux/mm.h>
+#include <linux/sframe.h>
 
 #include <asm/acpi.h>
 #include <asm/fixmap.h>
@@ -373,6 +374,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 			"This indicates a broken bootloader or old kernel\n",
 			boot_args[1], boot_args[2], boot_args[3]);
 	}
+	init_sframe_table();
 }
 
 static inline bool cpu_can_disable(unsigned int cpu)
diff --git a/include/linux/sframe.h b/include/linux/sframe.h
new file mode 100644
index 0000000000000..54e5cb76cb92c
--- /dev/null
+++ b/include/linux/sframe.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_SFRAME_H
+#define _LINUX_SFRAME_H
+
+#include <linux/init.h>
+
+#ifdef CONFIG_UNWIND_SFRAME_LOOKUP
+
+struct sframe_section {
+	unsigned long	sframe_start;
+	unsigned long	sframe_end;
+
+	unsigned long	fdes_start;
+	unsigned long	fres_start;
+	unsigned long	fres_end;
+	unsigned int	num_fdes;
+
+	signed char	ra_off;
+	signed char	fp_off;
+};
+
+extern struct sframe_section kernel_sfsec __ro_after_init;
+
+void __init init_sframe_table(void);
+
+#else /* !CONFIG_UNWIND_SFRAME_LOOKUP */
+
+static inline void __init init_sframe_table(void) {}
+
+#endif /* CONFIG_UNWIND_SFRAME_LOOKUP */
+
+#endif /* _LINUX_SFRAME_H */
diff --git a/kernel/unwind/Makefile b/kernel/unwind/Makefile
index eae37bea54fdb..c5d953e48fe82 100644
--- a/kernel/unwind/Makefile
+++ b/kernel/unwind/Makefile
@@ -1 +1,8 @@
- obj-$(CONFIG_UNWIND_USER)	+= user.o deferred.o
+ obj-$(CONFIG_UNWIND_USER)		+= user.o deferred.o
+
+ KCOV_INSTRUMENT_sframe.o	:= n
+ KASAN_SANITIZE_sframe.o	:= n
+ KCSAN_SANITIZE_sframe.o	:= n
+
+ CFLAGS_REMOVE_sframe.o = $(CC_FLAGS_FTRACE)
+ obj-$(CONFIG_UNWIND_SFRAME_LOOKUP)	+= sframe.o
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
new file mode 100644
index 0000000000000..10f979cd1af40
--- /dev/null
+++ b/kernel/unwind/sframe.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kernel sframe access functions
+ */
+
+#define pr_fmt(fmt)	"sframe: " fmt
+
+#include <linux/mm.h>
+#include <linux/overflow.h>
+#include <linux/string_helpers.h>
+#include <linux/sframe.h>
+#include <asm/sections.h>
+
+#include "sframe.h"
+
+static bool sframe_init __ro_after_init;
+struct sframe_section kernel_sfsec __ro_after_init;
+
+static int sframe_read_header(struct sframe_section *sec)
+{
+	unsigned long header_end, fdes_start, fdes_end, fdes_size, fres_start, fres_end;
+	struct sframe_header *shdr;
+	unsigned int num_fdes;
+
+	if (check_add_overflow(sec->sframe_start, sizeof(struct sframe_header), &header_end) ||
+	    header_end >= sec->sframe_end) {
+		pr_debug("header struct doesn't fit in section\n");
+		return -EINVAL;
+	}
+
+	shdr = (struct sframe_header *)sec->sframe_start;
+
+	if (shdr->preamble.magic != SFRAME_MAGIC ||
+	    shdr->preamble.version != SFRAME_VERSION_3 ||
+	    !(shdr->preamble.flags & SFRAME_F_FDE_SORTED) ||
+	    !(shdr->preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
+	    shdr->auxhdr_len) {
+		pr_debug("bad/unsupported sframe header\n");
+		return -EINVAL;
+	}
+
+	if (!shdr->num_fdes || !shdr->num_fres) {
+		pr_debug("no fde/fre entries\n");
+		return -EINVAL;
+	}
+
+	num_fdes = shdr->num_fdes;
+	if (check_mul_overflow(num_fdes, sizeof(struct sframe_fde_v3), &fdes_size) ||
+	    check_add_overflow(header_end, shdr->fdes_off, &fdes_start) ||
+	    check_add_overflow(fdes_start, fdes_size, &fdes_end) ||
+	    check_add_overflow(header_end, shdr->fres_off, &fres_start) ||
+	    check_add_overflow(fres_start, shdr->fre_len, &fres_end) ||
+	    fres_start < fdes_end || fres_end > sec->sframe_end) {
+		pr_debug("inconsistent fde/fre offsets\n");
+		return -EINVAL;
+	}
+
+	sec->num_fdes		= num_fdes;
+	sec->fdes_start		= fdes_start;
+	sec->fres_start		= fres_start;
+	sec->fres_end		= fres_end;
+
+	sec->ra_off		= shdr->cfa_fixed_ra_offset;
+	sec->fp_off		= shdr->cfa_fixed_fp_offset;
+
+	return 0;
+}
+
+void __init init_sframe_table(void)
+{
+	kernel_sfsec.sframe_start	= (unsigned long)__start_sframe;
+	kernel_sfsec.sframe_end		= (unsigned long)__end_sframe;
+
+	if (sframe_read_header(&kernel_sfsec)) {
+		pr_warn("invalid vmlinux SFrame header\n");
+		return;
+	}
+
+	sframe_init = true;
+}
diff --git a/kernel/unwind/sframe.h b/kernel/unwind/sframe.h
new file mode 100644
index 0000000000000..bf895107c2070
--- /dev/null
+++ b/kernel/unwind/sframe.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * From https://www.sourceware.org/binutils/docs/sframe-spec.html
+ */
+#ifndef _SFRAME_H
+#define _SFRAME_H
+
+#include <linux/types.h>
+
+#define SFRAME_VERSION_1			1
+#define SFRAME_VERSION_2			2
+#define SFRAME_VERSION_3			3
+#define SFRAME_MAGIC				0xdee2
+
+#define SFRAME_F_FDE_SORTED			0x1
+#define SFRAME_F_FRAME_POINTER			0x2
+#define SFRAME_F_FDE_FUNC_START_PCREL		0x4
+
+#define SFRAME_ABI_AARCH64_ENDIAN_BIG		1
+#define SFRAME_ABI_AARCH64_ENDIAN_LITTLE	2
+#define SFRAME_ABI_AMD64_ENDIAN_LITTLE		3
+
+struct sframe_preamble {
+	u16	magic;
+	u8	version;
+	u8	flags;
+} __packed;
+
+struct sframe_header {
+	struct sframe_preamble preamble;
+	u8	abi_arch;
+	s8	cfa_fixed_fp_offset;
+	s8	cfa_fixed_ra_offset;
+	u8	auxhdr_len;
+	u32	num_fdes;
+	u32	num_fres;
+	u32	fre_len;
+	u32	fdes_off;
+	u32	fres_off;
+} __packed;
+
+struct sframe_fde_v3 {
+	s64	func_start_off;
+	u32	func_size;
+	u32	fres_off;
+} __packed;
+
+struct sframe_fda_v3 {
+	u16	fres_num;
+	u8	info;
+	u8	info2;
+	u8	rep_size;
+} __packed;
+
+#define SFRAME_FDE_PCTYPE_INC			0
+#define SFRAME_FDE_PCTYPE_MASK			1
+
+#define SFRAME_AARCH64_PAUTH_KEY_A		0
+#define SFRAME_AARCH64_PAUTH_KEY_B		1
+
+#define SFRAME_V3_FDE_FRE_TYPE(info)		((info) & 0xf)
+#define SFRAME_V3_FDE_PCTYPE(info)		(((info) >> 4) & 0x1)
+#define SFRAME_V3_AARCH64_FDE_PAUTH_KEY(info)	(((info) >> 5) & 0x1)
+
+#define SFRAME_FDE_TYPE_DEFAULT			0
+
+#define SFRAME_V3_FDE_TYPE_MASK			0x1f
+#define SFRAME_V3_FDE_TYPE(info2)		((info2) & SFRAME_V3_FDE_TYPE_MASK)
+
+#define SFRAME_BASE_REG_FP			0
+#define SFRAME_BASE_REG_SP			1
+
+#define SFRAME_V3_FRE_CFA_BASE_REG_ID(info)		((info) & 0x1)
+#define SFRAME_V3_FRE_DATAWORD_COUNT(info)		(((info) >> 1) & 0xf)
+#define SFRAME_V3_FRE_DATAWORD_SIZE(info)		(((info) >> 5) & 0x3)
+#define SFRAME_V3_AARCH64_FRE_MANGLED_RA_P(info)	(((info) >> 7) & 0x1)
+
+#endif /* _SFRAME_H */
-- 
2.56.0.679.gc527c65306-goog


