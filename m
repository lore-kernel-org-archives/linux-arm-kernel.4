Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F52D606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GTxvpoLR;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b37hvyzU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ELt76Jh4osqlEIvfPYHY6cp4R3eWepN8sZnF3ATJIMM=; b=GTxvpoLR0J38wasRHySaDlv4fW
	nrmUTd2L6/R4hB3MWQt0FuNXyiAgFZMNRlTrYs3uEKQX4/bIaYzYiiam8qorBRU7sI8T73Ifhc53U
	0Bb2yHGL2lslKhl/IzU1lA1bVPhanIL3UHGasnvgXsOy15+ImxEoq8RVAj6yBWEJuWVS0zjmfvSd1
	d3PgPA5pbcHBuAmMwNZUY/wtNngXLwzMzpyR5d6eq1bDj/9LWihs50/INsVL1I/yWYOlGOBB4ObGE
	tPNpg/A5N05RrJ9K6cVgGjf26hYclWLXsua1YgjdFSmFdEPSnxRlVUXGaIzPzvvmgaV5RoucfQ9My
	PUCg5ubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8bC-00000004MMH-03FK;
	Tue, 17 Nov 2026 02:07:06 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8b5-00000004MHI-3lVn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:07:01 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso3776791a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881218; x=1795486018; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELt76Jh4osqlEIvfPYHY6cp4R3eWepN8sZnF3ATJIMM=;
        b=b37hvyzUe4ywCBILu58r/TWgX1draeGbAm1VpQoBc3pIloFHNkcMNYKKjBWeH9IXDG
         KeQVBTTTMU4jyqTt/ZVhV6BDWmzLUGjSJcvS/VcXqbVSIbiSXCWCoqeShqcO70LLi/W7
         CLgVvqbT23GEed9ymboo8HVh2n/9kgHfqfVjSw8m4ztqLseMxvKVXcNRhe4Sp9O+OGaK
         eU21Ew9B/f0xtcFxMvh6TbVWoBCYASWGV61kSnG5HIzcesePOnaI9FfgtqRQSvFG0zVW
         tLgr3wdVKO9SviQv19tTzi+X1FTSH6/JX9ySzB8Su7s2PDTnthzHxazWtwKh233T4OaO
         OdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881218; x=1795486018;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELt76Jh4osqlEIvfPYHY6cp4R3eWepN8sZnF3ATJIMM=;
        b=rModrIyHz102KU/kQ0jEm2SMH+ufHsN8fmXp01QpuymQc7ki93+Pynm0tl3bPfNOM8
         nITwO5z+9KUk30tpII3VruqL/S5N16ZZoczsPtDWVXgZNYMIZZvvYDjNW4a8b7yxF9CP
         K877zt/Bum4Zy2yw1/TfdhbVe6n9M7pOmCkkotK8gnYO7/jT1/i7RMG5iwV2yf+uVxWZ
         AjMCbRA5igNF+17qceMXkxjcUr3ifl/0FKrdrqiGnhGVAdyqpvnEswZtJQ7/AsaUXAmZ
         bQxo0xXUeNjhfWPdB4yzsMfUrwi/baRoVnMd7uxheURuuNyyWth40uzZEv4T/38f2S/0
         p+HA==
X-Forwarded-Encrypted: i=1; AL+hErEMXB5zFt8EpxF2NfhGv1yLElf7Qh0396szhg7d4iqm1bmbQWESWfUQPnUpmE/6ZuOcwbgDxgZlBvqkHhcmVHwZ@lists.infradead.org
X-Gm-Message-State: APuU4Z9uDVFSGsgMFxe6DskYhCc6OOeoqvY45nQBADsxgeRA2DK7teNi
	kYhYJpPHMnzMs2U+36Kc28ni6gPeMWCGXT/pKSbKRsOqE8tpb1sXsErpYn9Km0xP+bMn0/jVoFU
	JQYzX1kmZyFNTd1DwECf/0PYddg==
X-Received: from pgij8.prod.google.com ([2002:a05:6a02:8408:b0:cd3:da0f:7741])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3b8c:b0:3ac:af8d:c839 with SMTP id 98e67ed59e1d1-3b1b0a48e43mr12659376a91.35.1794881217656;
 Mon, 16 Nov 2026 18:06:57 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:40 +0000
In-Reply-To: <20261117020648.323464-1-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117020648.323464-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117020648.323464-4-dylanbhatch@google.com>
Subject: [PATCH v9 03/11] sframe: Add support for reading vmlinux .sframe contents
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
X-CRM114-CacheID: sfid-20261116_180659_966666_A78A940E 
X-CRM114-Status: GOOD (  29.84  )
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

In preparation for using sframe to unwind kernel space stacks, add an
sframe_find() interface for finding the sframe information associated
with a given vmlinux text address.

Treat a RA offset from CFA of zero as indication that the RA is not
saved (on the stack).  For the topmost frame treat it as indication that
the RA is in the link/RA register, such as on arm64 and s390, and obtain
it from there.  For non-topmost frames treat it as error, as the RA must
be saved.

[ Jens Remus: Add initial support for SFrame V3 (limited to regular
FDEs).  Add support for PC-relative FDE function start offset.  Simplify
logic by using an internal FDE representation.  Rename struct sframe_fre
to sframe_fre_internal to align with struct sframe_fde_internal.
Cleanup includes.  Fix checkpatch errors "spaces required around that
':'". ]

[ Dylan Hatch: Adapt for in-kernel unwinding. Squash parts of patches by
Jens Remus <jremus@linux.ibm.com>:
 - "unwind_user: Enable archs that pass RA in a register"
 - "unwind_user: Flexible FP/RA recovery rules"
 - "unwind_user: Flexible CFA recovery rules"
 - "unwind_user/sframe: Add support for outermost frame indication" ]

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Co-developed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Indu Bhagat <ibhagatgnu@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Co-developed-by: Dylan Hatch <dylanbhatch@google.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v8:
 - (sashiko) Use overflow-safe arithmetic and bounds checks in
   __read_fde(), __find_fde(), and __read_fre().
---
 include/linux/sframe.h       |   4 +-
 include/linux/unwind_types.h |  34 ++++
 kernel/unwind/sframe.c       | 355 +++++++++++++++++++++++++++++++++++
 kernel/unwind/sframe.h       |   1 +
 4 files changed, 393 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/unwind_types.h

diff --git a/include/linux/sframe.h b/include/linux/sframe.h
index 54e5cb76cb92c..c1fe8ac7df7b3 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -3,6 +3,7 @@
 #define _LINUX_SFRAME_H
 
 #include <linux/init.h>
+#include <linux/unwind_types.h>
 
 #ifdef CONFIG_UNWIND_SFRAME_LOOKUP
 
@@ -22,11 +23,12 @@ struct sframe_section {
 extern struct sframe_section kernel_sfsec __ro_after_init;
 
 void __init init_sframe_table(void);
+extern int sframe_find(unsigned long ip, struct unwind_frame *frame);
 
 #else /* !CONFIG_UNWIND_SFRAME_LOOKUP */
 
 static inline void __init init_sframe_table(void) {}
-
+static inline int sframe_find(unsigned long ip, struct unwind_frame *frame) { return -EINVAL; }
 #endif /* CONFIG_UNWIND_SFRAME_LOOKUP */
 
 #endif /* _LINUX_SFRAME_H */
diff --git a/include/linux/unwind_types.h b/include/linux/unwind_types.h
new file mode 100644
index 0000000000000..d0e69189af2ab
--- /dev/null
+++ b/include/linux/unwind_types.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_UNWIND_TYPES_H
+#define _LINUX_UNWIND_TYPES_H
+
+enum unwind_cfa_rule {
+	UNWIND_CFA_RULE_SP_OFFSET,		/* CFA = SP + offset */
+	UNWIND_CFA_RULE_FP_OFFSET,		/* CFA = FP + offset */
+	/* REG and DEREF variants not implemented -- flex FDEs not supported. */
+};
+
+struct unwind_cfa_rule_data {
+	enum unwind_cfa_rule rule;
+	s32 offset;
+	unsigned int regnum;
+};
+
+enum unwind_rule {
+	UNWIND_RULE_RETAIN,		/* entity = entity */
+	UNWIND_RULE_CFA_OFFSET_DEREF,	/* entity = *(CFA + offset) */
+};
+
+struct unwind_rule_data {
+	enum unwind_rule rule;
+	s32 offset;
+};
+
+struct unwind_frame {
+	struct unwind_cfa_rule_data cfa;
+	struct unwind_rule_data ra;
+	struct unwind_rule_data fp;
+	bool outermost;
+};
+
+#endif /* _LINUX_UNWIND_TYPES_H */
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 10f979cd1af40..93dea710d3bfc 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -9,6 +9,10 @@
 #include <linux/overflow.h>
 #include <linux/string_helpers.h>
 #include <linux/sframe.h>
+#include <linux/unaligned.h>
+#include <linux/unwind_types.h>
+#include <linux/kallsyms.h>
+#include <asm/kprobes.h>
 #include <asm/sections.h>
 
 #include "sframe.h"
@@ -16,6 +20,357 @@
 static bool sframe_init __ro_after_init;
 struct sframe_section kernel_sfsec __ro_after_init;
 
+struct sframe_fde_internal {
+	unsigned long	func_addr;
+	u32		func_size;
+	u32		fda_off;
+	u32		fres_off;
+	u32		fres_num;
+	u8		info;
+	u8		info2;
+	u8		rep_size;
+};
+
+struct sframe_fre_internal {
+	unsigned int	size;
+	u32		ip_off;
+	s32		cfa_off;
+	s32		ra_off;
+	s32		fp_off;
+	u8		info;
+};
+
+static __always_inline unsigned char fre_type_to_size(unsigned char fre_type)
+{
+	if (fre_type > 2)
+		return 0;
+	return 1 << fre_type;
+}
+
+static __always_inline unsigned char dataword_size_enum_to_size(unsigned char dataword_size)
+{
+	if (dataword_size > 2)
+		return 0;
+	return 1 << dataword_size;
+}
+
+static __always_inline int __read_fde(struct sframe_section *sec,
+				      unsigned int fde_num,
+				      struct sframe_fde_internal *fde)
+{
+	unsigned long fde_addr, fda_addr, fres_addr, func_addr;
+	struct sframe_fde_v3 *_fde;
+	struct sframe_fda_v3 *_fda;
+	u32 fres_off;
+
+	fde_addr = sec->fdes_start + (fde_num * sizeof(struct sframe_fde_v3));
+	_fde = (struct sframe_fde_v3 *)fde_addr;
+
+	func_addr = fde_addr + _fde->func_start_off;
+
+	if (check_add_overflow(sec->fres_start, _fde->fres_off, &fda_addr) ||
+	    check_add_overflow(fda_addr, sizeof(struct sframe_fda_v3), &fres_addr) ||
+	    check_add_overflow(_fde->fres_off, (u32)sizeof(struct sframe_fda_v3), &fres_off) ||
+	    fres_addr > sec->fres_end)
+		return -EINVAL;
+	_fda = (struct sframe_fda_v3 *)fda_addr;
+
+	fde->func_addr	= func_addr;
+	fde->func_size	= _fde->func_size;
+	fde->fda_off	= _fde->fres_off;
+	fde->fres_off	= fres_off;
+	fde->fres_num	= _fda->fres_num;
+	fde->info	= _fda->info;
+	fde->info2	= _fda->info2;
+	fde->rep_size	= _fda->rep_size;
+
+	return 0;
+}
+
+static __always_inline int __find_fde(struct sframe_section *sec,
+				      unsigned long ip,
+				      struct sframe_fde_internal *fde)
+{
+	unsigned long func_addr_low = 0, func_addr_high = ULONG_MAX;
+	struct sframe_fde_v3 *first, *low, *high, *found = NULL;
+	int ret;
+
+	first = (void *)sec->fdes_start;
+	low = first;
+	high = first + sec->num_fdes - 1;
+
+	while (low <= high) {
+		struct sframe_fde_v3 *mid;
+		s64 func_off;
+		unsigned long func_addr;
+
+		mid = low + ((high - low) / 2);
+
+		func_off = get_unaligned((s64 *)mid);
+		func_addr = (unsigned long)mid + func_off;
+
+		if (ip >= func_addr) {
+			if (func_addr < func_addr_low)
+				return -EFAULT;
+
+			func_addr_low = func_addr;
+
+			found = mid;
+			low = mid + 1;
+		} else {
+			if (func_addr > func_addr_high)
+				return -EFAULT;
+
+			func_addr_high = func_addr;
+
+			high = mid - 1;
+		}
+	}
+
+	if (!found)
+		return -EINVAL;
+
+	ret = __read_fde(sec, found - first, fde);
+	if (ret)
+		return ret;
+
+	/* make sure it's not in a gap */
+	if (ip < fde->func_addr || ip - fde->func_addr >= fde->func_size)
+		return -EINVAL;
+
+	return 0;
+}
+
+#define ____GET_AND_INC(to, from, type)					\
+({									\
+	type __to;							\
+	(__to) = get_unaligned((type *)(from));				\
+	from += sizeof(__to);						\
+	to = __to;							\
+})
+
+#define __GET_AND_INC(to, from, size, u_or_s)			\
+({								\
+	switch (size) {						\
+	case 1:							\
+		____GET_AND_INC(to, from, u_or_s##8);		\
+		break;						\
+	case 2:							\
+		____GET_AND_INC(to, from, u_or_s##16);		\
+		break;						\
+	case 4:							\
+		____GET_AND_INC(to, from, u_or_s##32);		\
+		break;						\
+	default:						\
+		return -EFAULT;					\
+	}							\
+})
+
+#define GET_UNSIGNED_AND_INC(to, from, size)			\
+	__GET_AND_INC(to, from, size, u)
+
+#define GET_SIGNED_AND_INC(to, from, size)			\
+	__GET_AND_INC(to, from, size, s)
+
+#define GET_AND_INC(to, from, size)				\
+	_Generic(to,						\
+		 u8 :	GET_UNSIGNED_AND_INC(to, from, size),	\
+		 u16 :	GET_UNSIGNED_AND_INC(to, from, size),	\
+		 u32 :	GET_UNSIGNED_AND_INC(to, from, size),	\
+		 u64 :	GET_UNSIGNED_AND_INC(to, from, size),	\
+		 s8 :	GET_SIGNED_AND_INC(to, from, size),	\
+		 s16 :	GET_SIGNED_AND_INC(to, from, size),	\
+		 s32 :	GET_SIGNED_AND_INC(to, from, size),	\
+		 s64 :	GET_SIGNED_AND_INC(to, from, size))
+
+static __always_inline int __read_fre(struct sframe_section *sec,
+				      struct sframe_fde_internal *fde,
+				      unsigned long fre_addr,
+				      struct sframe_fre_internal *fre)
+{
+	unsigned char fde_type = SFRAME_V3_FDE_TYPE(fde->info2);
+	unsigned char fde_pctype = SFRAME_V3_FDE_PCTYPE(fde->info);
+	unsigned char fre_type = SFRAME_V3_FDE_FRE_TYPE(fde->info);
+	unsigned char dataword_count, dataword_size;
+	s32 cfa_off, ra_off, fp_off;
+	unsigned long cur = fre_addr;
+	unsigned char addr_size;
+	u32 ip_off;
+	u8 info;
+
+	addr_size = fre_type_to_size(fre_type);
+	if (!addr_size)
+		return -EFAULT;
+
+	if (fre_addr + addr_size + 1 > sec->fres_end ||
+	    fre_addr + addr_size + 1 < fre_addr)
+		return -EFAULT;
+
+	GET_AND_INC(ip_off, cur, addr_size);
+	if (fde_pctype == SFRAME_FDE_PCTYPE_INC && ip_off > fde->func_size)
+		return -EFAULT;
+
+	GET_AND_INC(info, cur, 1);
+	dataword_count = SFRAME_V3_FRE_DATAWORD_COUNT(info);
+	dataword_size  = dataword_size_enum_to_size(SFRAME_V3_FRE_DATAWORD_SIZE(info));
+	if (!dataword_size || !dataword_count)
+		return -EFAULT;
+
+	if (cur + (dataword_count * dataword_size) > sec->fres_end ||
+	    cur + (dataword_count * dataword_size) < cur)
+		return -EFAULT;
+
+	/* Flexible FDEs not supported */
+	if (fde_type != SFRAME_FDE_TYPE_DEFAULT)
+		return -EFAULT;
+
+	fre->size	= addr_size + 1 + (dataword_count * dataword_size);
+
+	GET_AND_INC(cfa_off, cur, dataword_size);
+	dataword_count--;
+
+	ra_off = sec->ra_off;
+	if (!ra_off && dataword_count) {
+		dataword_count--;
+		GET_AND_INC(ra_off, cur, dataword_size);
+	}
+
+	fp_off = sec->fp_off;
+	if (!fp_off && dataword_count) {
+		dataword_count--;
+		GET_AND_INC(fp_off, cur, dataword_size);
+	}
+
+	if (dataword_count)
+		return -EFAULT;
+
+	fre->ip_off	= ip_off;
+	fre->cfa_off	= cfa_off;
+	fre->ra_off	= ra_off;
+	fre->fp_off	= fp_off;
+	fre->info	= info;
+
+	return 0;
+}
+
+static __always_inline int
+sframe_init_cfa_rule_data(struct unwind_cfa_rule_data *cfa_rule_data,
+			  u8 info, s32 offset)
+{
+	switch (SFRAME_V3_FRE_CFA_BASE_REG_ID(info)) {
+	case SFRAME_BASE_REG_SP:
+		cfa_rule_data->rule = UNWIND_CFA_RULE_SP_OFFSET;
+		break;
+	case SFRAME_BASE_REG_FP:
+		cfa_rule_data->rule = UNWIND_CFA_RULE_FP_OFFSET;
+		break;
+	default:
+		/* Flex FDEs not supported; base can't be another register */
+		return -EINVAL;
+	}
+
+	cfa_rule_data->offset = offset;
+
+	return 0;
+}
+
+static __always_inline void
+sframe_init_rule_data(struct unwind_rule_data *rule_data, s32 offset)
+{
+	if (!offset) {
+		rule_data->rule = UNWIND_RULE_RETAIN;
+		return;
+	}
+	/* Flex FDEs not supported; always deref */
+	rule_data->rule = UNWIND_RULE_CFA_OFFSET_DEREF;
+	rule_data->offset = offset;
+}
+
+static __always_inline int __find_fre(struct sframe_section *sec,
+				      struct sframe_fde_internal *fde,
+				      unsigned long ip,
+				      struct unwind_frame *frame)
+{
+	unsigned char fde_pctype = SFRAME_V3_FDE_PCTYPE(fde->info);
+	struct sframe_fre_internal *fre, *prev_fre = NULL;
+	struct sframe_fre_internal fres[2];
+	unsigned long fre_addr;
+	bool which = false;
+	unsigned int i;
+	u32 ip_off;
+
+	ip_off = ip - fde->func_addr;
+
+	if (fde_pctype == SFRAME_FDE_PCTYPE_MASK) {
+		if (!fde->rep_size)
+			return -EFAULT;
+		ip_off %= fde->rep_size;
+	}
+
+	fre_addr = sec->fres_start + fde->fres_off;
+
+	for (i = 0; i < fde->fres_num; i++) {
+		int ret;
+
+		/*
+		 * Alternate between the two fre_addr[] entries for 'fre' and
+		 * 'prev_fre'.
+		 */
+		fre = which ? fres : fres + 1;
+		which = !which;
+
+		ret = __read_fre(sec, fde, fre_addr, fre);
+		if (ret)
+			return ret;
+
+		fre_addr += fre->size;
+
+		if (prev_fre && fre->ip_off <= prev_fre->ip_off)
+			return -EFAULT;
+
+		if (fre->ip_off > ip_off)
+			break;
+
+		prev_fre = fre;
+	}
+
+	if (!prev_fre)
+		return -EINVAL;
+	fre = prev_fre;
+
+	if (sframe_init_cfa_rule_data(&frame->cfa, fre->info, fre->cfa_off))
+		return -EINVAL;
+
+	sframe_init_rule_data(&frame->ra, fre->ra_off);
+	sframe_init_rule_data(&frame->fp, fre->fp_off);
+	frame->outermost = SFRAME_V3_FRE_RA_UNDEFINED_P(fre->info);
+
+	return 0;
+}
+
+static __always_inline int __sframe_find(struct sframe_section *sec,
+					 unsigned long ip,
+					 struct unwind_frame *frame)
+{
+	struct sframe_fde_internal fde;
+	int ret;
+
+	ret = __find_fde(sec, ip, &fde);
+	if (ret)
+		return ret;
+
+	return __find_fre(sec, &fde, ip, frame);
+}
+
+notrace int sframe_find(unsigned long ip, struct unwind_frame *frame)
+{
+	if (!frame || !sframe_init)
+		return -EINVAL;
+
+	return  __sframe_find(&kernel_sfsec, ip, frame);
+}
+NOKPROBE_SYMBOL(sframe_find);
+
 static int sframe_read_header(struct sframe_section *sec)
 {
 	unsigned long header_end, fdes_start, fdes_end, fdes_size, fres_start, fres_end;
diff --git a/kernel/unwind/sframe.h b/kernel/unwind/sframe.h
index bf895107c2070..17daf68309e61 100644
--- a/kernel/unwind/sframe.h
+++ b/kernel/unwind/sframe.h
@@ -74,5 +74,6 @@ struct sframe_fda_v3 {
 #define SFRAME_V3_FRE_DATAWORD_COUNT(info)		(((info) >> 1) & 0xf)
 #define SFRAME_V3_FRE_DATAWORD_SIZE(info)		(((info) >> 5) & 0x3)
 #define SFRAME_V3_AARCH64_FRE_MANGLED_RA_P(info)	(((info) >> 7) & 0x1)
+#define SFRAME_V3_FRE_RA_UNDEFINED_P(info)		(SFRAME_V3_FRE_DATAWORD_COUNT(info) == 0)
 
 #endif /* _SFRAME_H */
-- 
2.56.0.679.gc527c65306-goog


